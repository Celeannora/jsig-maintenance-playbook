#!/usr/bin/env python3
"""
Parses the JSIG Appendix C (SAP Security Control Baselines) table out of the
layout-mode full text into a real markdown table.

Why a dedicated, data-driven parser: pdftotext's default (reading-order) mode
scrambles this table into unusable column-major garbage, so `-layout` mode is used
instead. However, the header row's "L M H L M H L M H" letters are NOT reliably
character-aligned with where the actual X/S/+ marks land in the data rows on the same
page (the header text and data values are separate PDF text runs that pdftotext
positions independently). Deriving column x-positions from header text is therefore
unreliable; this parser derives real column positions DIRECTLY from the data instead.

Per page (each page repeats the table header, giving a natural page boundary):
  1. Collect every isolated 'X'/'S'/'+' character position across all data rows on
     that page (isolated = flanked by non-alphanumeric, so letters embedded in title
     words like the 'S' in "SYSTEM" are correctly excluded).
  2. Cluster nearby positions into distinct columns (real intra-row spacing was
     measured at exactly 4 characters with zero jitter across rows, so a gap
     threshold of 3 safely separates adjacent columns without merging them).
  3. Estimate the column "pitch" from the smallest common gap between the first
     several clusters (usually 4, occasionally 5 depending on the page's font
     re-justification).
  4. Assign each cluster to a column by dividing its offset from the first cluster
     position by the pitch and rounding to the nearest integer slot (0-8 -> the 9
     baseline mark columns C-L..A-H in fixed order). This correctly handles pages
     where a particular sub-column has zero marks anywhere on that page (an entirely
     legitimate gap in the source, not a parsing error) without shifting later
     columns.
  5. Any cluster beyond slot 8 is classified by its distance from the (possibly
     interpolated) A-H position: ~4-12 chars further = Classified Overlay; ~15-30
     chars further = Potentially Common/Inheritable. This distance-based check (not
     simple left-to-right order) is required because many pages have marks in only
     one of these two trailing columns, and naive order-based assignment would
     mislabel the single present column.

Each data row spans 1-3 physical lines (ID line, optional pure-marks line, optional
Title-continuation line); all physical lines belonging to a row are OR'd together when
checking each column for a mark character.

Verbatim policy: mark characters are copied exactly as printed; no values are
inferred, and "Withdrawn" rows are preserved with a note instead of baseline marks,
matching the source. Footnote lines (e.g. "* SI-7(14) - ...") are preserved verbatim
after the table. verify_samples() spot-checks known rows against manually-verified
raw-text readings before the output file is trusted/written.
"""
import re
from collections import Counter
from pathlib import Path

RAW_DIR = Path(__file__).parent
OUT_DIR = RAW_DIR.parent
LAYOUT_TXT = RAW_DIR / "JSIG_2016April11_Final_53Rev4_layout.txt"

WAYBACK_URL = "http://web.archive.org/web/20260405054539/https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf"
DCSA_URL = "https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf"

APPENDIX_C_START = 17713  # 1-indexed, "APPENDIX C:" body line in layout text
APPENDIX_C_END = 19812    # 1-indexed, exclusive (line where "APPENDIX D:" starts)

ID_RE = re.compile(r"^([A-Z]{2}-\d+(?:\([0-9A-Za-z]+\))?)\s*(.*)$")
LMH_HEADER_RE = re.compile(r"L\s+M\s+H\s+L\s+M\s+H\s+L\s+M\s+H")
# A mark character only counts if it's an isolated token (flanked by non-alnum),
# NOT a letter embedded inside a title word (e.g. the 'S' in "SYSTEM").
ISOLATED_MARK_RE = re.compile(r"(?<![A-Za-z0-9])[XS+](?![A-Za-z0-9])")

COLS = ["C-L", "C-M", "C-H", "I-L", "I-M", "I-H", "A-L", "A-M", "A-H",
        "Classified Overlay", "Potentially Common/Inheritable"]


def load_block():
    lines = LAYOUT_TXT.read_text(encoding="utf-8", errors="replace").split("\n")
    block = lines[APPENDIX_C_START - 1:APPENDIX_C_END - 1]
    return [l.replace("\x0c", "") for l in block]


def find_page_boundaries(lines):
    pages = []
    for i, l in enumerate(lines):
        if LMH_HEADER_RE.search(l) and "Inheritable" in l:
            pages.append(i)
    return pages


def cluster_positions(positions, gap=3):
    if not positions:
        return []
    positions = sorted(set(positions))
    clusters = [[positions[0]]]
    for p in positions[1:]:
        if p - clusters[-1][-1] <= gap:
            clusters[-1].append(p)
        else:
            clusters.append([p])
    return [sorted(c)[len(c) // 2] for c in clusters]


def split_into_records(lines, start, end):
    records = []
    current_id, current_lines = None, []
    for i in range(start, end):
        raw = lines[i]
        s = raw.strip()
        if s == "" or s.startswith("Appendix-C") or s.startswith("PAGE") or s.startswith("*"):
            continue
        m = ID_RE.match(raw)
        if m:
            if current_id:
                records.append((current_id, current_lines))
            current_id, current_lines = m.group(1), [raw]
        elif current_id:
            current_lines.append(raw)
    if current_id:
        records.append((current_id, current_lines))
    return records


def collect_footnotes(lines, start, end):
    return [lines[i].strip() for i in range(start, end) if lines[i].strip().startswith("*")]


def estimate_pitch(clusters):
    diffs = [b - a for a, b in zip(clusters, clusters[1:]) if b - a <= 6]
    if not diffs:
        return 4
    return Counter(diffs).most_common(1)[0][0]


def assign_columns(clusters):
    """Map cluster x-positions to column names using pitch-based slot rounding for
    the 9 CIA mark columns, then distance-from-A-H for the two trailing columns."""
    if not clusters:
        return {}
    clusters = sorted(clusters)
    pitch = estimate_pitch(clusters)
    first = clusters[0]

    col_positions = {}
    leftover = []
    for p in clusters:
        offset = p - first
        slot = round(offset / pitch)
        if 0 <= slot <= 8 and COLS[slot] not in col_positions:
            col_positions[COLS[slot]] = p
        else:
            leftover.append(p)

    # theoretical A-H position even if that exact column had zero marks on this page
    a_h_theoretical = col_positions.get("A-H", first + 8 * pitch)

    for p in leftover:
        dist = p - a_h_theoretical
        if 3 <= dist <= 13:
            col_positions.setdefault("Classified Overlay", p)
        elif 14 <= dist <= 32:
            col_positions.setdefault("Potentially Common/Inheritable", p)
    return col_positions


def parse_page(lines, header_end, data_end, pending_prefix=None):
    data_start = header_end + 1
    records = split_into_records(lines, data_start, data_end)

    all_positions = []
    for _, phys in records:
        for line in phys:
            all_positions.extend(m.start() for m in ISOLATED_MARK_RE.finditer(line))
    clusters = cluster_positions(all_positions, gap=3)
    col_positions = assign_columns(clusters)

    first_mark_pos = col_positions.get("C-L", min(clusters) if clusters else 9999)

    parsed = []
    for cid, phys in records:
        marks = {}
        for col in COLS:
            pos = col_positions.get(col)
            val = ""
            if pos is not None:
                for line in phys:
                    hit = next(
                        (m.group() for m in ISOLATED_MARK_RE.finditer(line)
                         if abs(m.start() - pos) <= 2), None)
                    if hit:
                        val = hit
                        break
            marks[col] = val

        withdrawn = any("WITHDRAWN" in line.upper() for line in phys)

        # NOTE: an earlier version of this parser tried to detect cases where a
        # wrapped title continuation line actually belongs to the FOLLOWING row's
        # ID (observed in a handful of all-blank Privacy-chapter rows, e.g. real
        # source text has AR-2's second physical line reading as the correct
        # opening words of AR-3's title). That heuristic was reverted: it broke
        # the far more common default pattern where an all-blank row's own
        # continuation line is genuinely its own title (e.g. AC-2(6) "DYNAMIC
        # PRIVILEGE" + "MANAGEMENT" = "DYNAMIC PRIVILEGE MANAGEMENT", its own
        # correct title) -- there is no reliable position-based signal to tell
        # the two cases apart, so simple self-attachment (below) is used
        # universally. This means a small number of all-blank Privacy-chapter
        # rows (AP/AR/DI/DM/IP/SE/TR/UL families) may show a title fragment
        # misattached to the adjacent row; see EXTRACTION-LOG.md. No baseline
        # mark data is affected since these rows carry no marks at all.
        title_parts = []
        if not withdrawn:
            m0 = ID_RE.match(phys[0])
            id_len = len(m0.group(1))
            zone0 = phys[0][id_len:first_mark_pos].strip()
            if zone0:
                title_parts.append(zone0)
            for line in phys[1:]:
                zone = line[:first_mark_pos].strip()
                if zone:
                    title_parts.append(zone)
        title = " ".join(title_parts).strip()
        parsed.append((cid, title, withdrawn, marks))
    return parsed, col_positions, pending_prefix


def build_table():
    lines = load_block()
    header_ends = find_page_boundaries(lines)
    print(f"Found {len(header_ends)} table page-header blocks.")
    all_rows = []
    all_footnotes = []
    pending_prefix = None
    for p_idx, header_end in enumerate(header_ends):
        data_end = (header_ends[p_idx + 1] - 4) if p_idx + 1 < len(header_ends) else len(lines)
        rows, col_positions, pending_prefix = parse_page(lines, header_end, data_end, pending_prefix)
        all_rows.extend(rows)
        all_footnotes.extend(collect_footnotes(lines, header_end + 1, data_end))
        if len(col_positions) < 9 and len(rows) > 0:
            print(f"NOTE: page {p_idx} ({len(rows)} rows) found only {len(col_positions)} "
                  f"mark columns with any data -- remaining columns are legitimately all-blank "
                  f"on this page: {sorted(col_positions.keys())}")
    print(f"Parsed {len(all_rows)} control rows total.")
    return all_rows, all_footnotes


def verify_samples(rows):
    by_id = {cid: (title, withdrawn, marks) for cid, title, withdrawn, marks in rows}
    checks = {
        "AC-1": {"C-L": "X", "C-M": "X", "C-H": "X", "I-L": "X", "I-M": "X", "I-H": "X",
                 "A-L": "X", "A-M": "X", "A-H": "X",
                 "Classified Overlay": "", "Potentially Common/Inheritable": "X"},
        "AC-3(2)": {"Classified Overlay": "+"},
        "AC-2(1)": {"C-L": "", "C-M": "X", "C-H": "X", "I-L": "", "I-M": "X", "I-H": "X",
                    "A-L": "", "Potentially Common/Inheritable": "X"},
        "SI-7(14)": {"C-L": "", "I-L": "X", "I-M": "X", "I-H": "X", "A-L": ""},
    }
    ok = True
    for cid, expected in checks.items():
        if cid not in by_id:
            print(f"VERIFY FAIL: {cid} not found in parsed rows")
            ok = False
            continue
        _, _, marks = by_id[cid]
        for col, exp_val in expected.items():
            got = marks.get(col, "")
            if got != exp_val:
                print(f"VERIFY FAIL: {cid} column '{col}' expected {exp_val!r} got {got!r}")
                ok = False
    if ok:
        print(f"Spot-check verification PASSED for {list(checks.keys())}.")
    return ok


def write_output(rows, footnotes):
    header = (
        "# JSIG Appendix C - SAP Security Control Baselines\n\n"
        f"Source URL: {DCSA_URL}\n\n"
        f"Archived source (used for extraction, direct URL returns HTTP 403): {WAYBACK_URL}\n\n"
        "Extraction note: Parsed from `pdftotext -layout` output of the complete "
        "378-page JSIG PDF (retrieved 2026-07-17 via the Wayback Machine snapshot "
        "above) using a dedicated column-position parser (`parse_appendix_c.py`, in "
        "this directory) that derives real mark-column positions per page directly "
        "from the data rows (header-row text was found to be positioned inconsistently "
        "relative to data marks, so header text is not used for column alignment; see "
        "the script's docstring for the full method and its spot-check verification). "
        "`X` = control selected for that baseline; `S` = applies specifically to SAP "
        "systems; `+` = Classified Overlay / Potentially Common-Inheritable flag; "
        "blank = not selected/not applicable; *Withdrawn* = control withdrawn from the "
        "catalog (per source). This supersedes the prior partial extraction of this "
        "appendix. Known limitation: in a small number of all-blank-marks rows within "
        "the Privacy sub-families (AP/AR/DI/DM/IP/SE/TR/UL), a wrapped title "
        "continuation line in the source may print attached to the adjacent row "
        "instead of its own row (e.g. DI-2's title shows a duplicated \"Data "
        "Integrity\" fragment); no baseline mark data is affected, since these rows "
        "carry no marks at all. See EXTRACTION-LOG.md for detail.\n\n---\n\n"
        "The table below lists, for every JSIG security control and control "
        "enhancement, whether it is selected for the Confidentiality-Low/Moderate/High, "
        "Integrity-Low/Moderate/High, and Availability-Low/Moderate/High baselines, plus "
        "whether it carries the Classified Overlay flag or the Potentially "
        "Common/Inheritable flag.\n\n"
    )
    cols = ["ID", "Title"] + COLS
    lines_out = [header, "| " + " | ".join(cols) + " |",
                 "|" + "|".join(["---"] * len(cols)) + "|"]
    for cid, title, withdrawn, marks in rows:
        title_cell = "*Withdrawn*" if withdrawn else title
        row_cells = [cid, title_cell] + [marks.get(c, "") for c in COLS]
        lines_out.append("| " + " | ".join(c if c else "" for c in row_cells) + " |")

    if footnotes:
        lines_out.append("\n## Footnotes (verbatim from source)\n")
        for f in footnotes:
            lines_out.append(f"- {f}")

    out_path = OUT_DIR / "appendix-c-sap-security-control-baselines.md"
    out_path.write_text("\n".join(lines_out) + "\n", encoding="utf-8")
    print(f"wrote {out_path.name} ({len(rows)} rows, {len(footnotes)} footnotes)")


if __name__ == "__main__":
    rows, footnotes = build_table()
    passed = verify_samples(rows)
    if not passed:
        print("ABORTING write: verification failed, review parser before trusting output.")
    else:
        write_output(rows, footnotes)
