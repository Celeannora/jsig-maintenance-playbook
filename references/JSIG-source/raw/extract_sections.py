#!/usr/bin/env python3
"""
JSIG full-text extraction script (layout-mode source).

Source of truth: the complete 378-page JSIG PDF (JSIG_2016April11_Final_53Rev4.pdf),
retrieved via Wayback Machine snapshot of the DCSA-hosted original (direct DCSA URL
returns HTTP 403). Converted to text with `pdftotext -layout`, saved as
JSIG_2016April11_Final_53Rev4_layout.txt.

Layout mode is used for ALL sections (not just Appendix C's table): default
(non-layout) pdftotext mode was found to reorder hanging-indent list markers (e.g.
"a." / "b." labels get hoisted above their paragraph content instead of staying
attached to it) whenever the source PDF uses indented lettered/numbered sub-items --
which is pervasive throughout Chapter 3. Layout mode preserves the PDF's actual column
positions and keeps every marker correctly attached to its content, and is also the
only mode that renders the Appendix C baseline table as real aligned columns.

This script slices each family/appendix body out of the layout text using verified
line boundaries (found via `grep -n "FAMILY:"` / `grep -n "APPENDIX"` against real body
occurrences, not the Table of Contents), strips repeated running headers/footers that
pdftotext leaves behind at every page break, and writes one clean verbatim .md file per
family/appendix into references/JSIG-source/, following the existing file-header
convention. No content is inferred, summarized, or altered beyond structural cleanup
(dedup of running headers/footers, collapsing excess blank lines, trimming trailing
whitespace introduced by column padding).

Appendix C (SAP Security Control Baselines) is additionally post-processed into a real
markdown table by parse_appendix_c.py (separate script, run after this one).

Run from anywhere; paths are resolved relative to this file's location.
"""
import re
from pathlib import Path

RAW_DIR = Path(__file__).parent
OUT_DIR = RAW_DIR.parent  # references/JSIG-source/
LAYOUT_TXT = RAW_DIR / "JSIG_2016April11_Final_53Rev4_layout.txt"

WAYBACK_URL = "http://web.archive.org/web/20260405054539/https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf"
DCSA_URL = "https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf"

EXTRACTION_NOTE = (
    "Verbatim extraction via `pdftotext -layout` against the complete 378-page JSIG PDF "
    "(retrieved 2026-07-17 from the Wayback Machine snapshot below, since the direct "
    "DCSA URL returns HTTP 403). This supersedes any prior lower-fidelity extraction of "
    "this section. Running page headers/footers inserted by the PDF layout have been "
    "stripped; no wording has been added, summarized, or altered."
)

# Running-header/footer line: "Chapter 3-XX ... PAGE 3-NN" or "Appendix-X ... PAGE Y-NN"
# with arbitrary internal padding, or either half alone.
HEADER_FOOTER_RE = re.compile(
    r"^\s*(Chapter 3-[A-Za-z]+|Appendix-[A-E][^0-9]*)?\s*(PAGE\s+[3A-E]-\d+)?\s*$",
    re.IGNORECASE,
)


def is_header_footer(line):
    s = line.strip()
    if s == "":
        return False  # blank lines handled separately
    if re.match(r"^Chapter 3-[A-Za-z]+\s+PAGE\s+3-\d+$", s):
        return True
    if re.match(r"^Appendix-[A-E][A-Za-z ,/-]*\s+PAGE\s+[3A-E]-\d+$", s):
        return True
    if re.match(r"^Chapter 3-[A-Za-z]+$", s):
        return True
    if re.match(r"^Appendix-[A-E][A-Za-z ,/-]*$", s):
        return True
    if re.match(r"^PAGE\s+[3A-E]-\d+$", s):
        return True
    return False


def clean_block(lines):
    cleaned = []
    for line in lines:
        s = line.replace("\x0c", "").rstrip()  # strip pdftotext form-feed page markers
        if is_header_footer(s):
            continue
        cleaned.append(s)
    out = []
    blank_run = 0
    for line in cleaned:
        if line.strip() == "":
            blank_run += 1
            if blank_run <= 1:
                out.append("")
        else:
            blank_run = 0
            out.append(line)
    while out and out[0].strip() == "":
        out.pop(0)
    while out and out[-1].strip() == "":
        out.pop()
    return out


def write_md(filename, title, body_lines, extra_note=None):
    note = EXTRACTION_NOTE if extra_note is None else extra_note
    header = (
        f"# {title}\n\n"
        f"Source URL: {DCSA_URL}\n\n"
        f"Archived source (used for extraction, direct URL returns HTTP 403): {WAYBACK_URL}\n\n"
        f"Extraction note: {note}\n\n---\n\n"
    )
    (OUT_DIR / filename).write_text(header + "\n".join(body_lines) + "\n", encoding="utf-8")
    print(f"wrote {filename}  ({len(body_lines)} lines)")


def load(path):
    return path.read_text(encoding="utf-8", errors="replace").split("\n")


def main():
    lines = load(LAYOUT_TXT)

    # 1-indexed body-start line numbers verified via grep against LAYOUT_TXT.
    chapter3 = [
        ("chapter-3-AC-family.md", "JSIG Chapter 3 Access Control (AC) Family", 1999),
        ("chapter-3-AT-family.md", "JSIG Chapter 3 Awareness and Training (AT) Family", 3953),
        ("chapter-3-AU-family.md", "JSIG Chapter 3 Audit and Accountability (AU) Family", 4214),
        ("chapter-3-CA-family.md", "JSIG Chapter 3 Security Assessment and Authorization (CA) Family", 5072),
        ("chapter-3-CM-family.md", "JSIG Chapter 3 Configuration Management (CM) Family", 5719),
        ("chapter-3-CP-family.md", "JSIG Chapter 3 Contingency Planning (CP) Family", 6654),
        ("chapter-3-IA-family.md", "JSIG Chapter 3 Identification and Authentication (IA) Family", 7395),
        ("chapter-3-IR-family.md", "JSIG Chapter 3 Incident Response (IR) Family", 8155),
        ("chapter-3-MA-family.md", "JSIG Chapter 3 Maintenance (MA) Family", 8782),
        ("chapter-3-MP-family.md", "JSIG Chapter 3 Media Protection (MP) Family", 9175),
        ("chapter-3-PE-family.md", "JSIG Chapter 3 Physical and Environmental Protection (PE) Family", 9897),
        ("chapter-3-PL-family.md", "JSIG Chapter 3 Planning (PL) Family", 10632),
        ("chapter-3-PS-family.md", "JSIG Chapter 3 Personnel Security (PS) Family", 11030),
        ("chapter-3-RA-family.md", "JSIG Chapter 3 Risk Assessment (RA) Family", 11354),
        ("chapter-3-SA-family.md", "JSIG Chapter 3 System and Services Acquisition (SA) Family", 11645),
        ("chapter-3-SC-family.md", "JSIG Chapter 3 System and Communications Protection (SC) Family", 13093),
        ("chapter-3-SI-family.md", "JSIG Chapter 3 System and Information Integrity (SI) Family", 14817),
        ("chapter-3-PM-family.md", "JSIG Chapter 3 Program Management (PM) Family", 15862),
    ]
    privacy = [
        ("chapter-3-privacy-AP-family.md", "JSIG Chapter 3 Privacy - Authority and Purpose (AP) Family", 16326),
        ("chapter-3-privacy-AR-family.md", "JSIG Chapter 3 Privacy - Accountability, Audit and Risk Management (AR) Family", 16370),
        ("chapter-3-privacy-DI-family.md", "JSIG Chapter 3 Privacy - Data Quality and Integrity (DI) Family", 16624),
        ("chapter-3-privacy-DM-family.md", "JSIG Chapter 3 Privacy - Data Minimization and Retention (DM) Family", 16715),
        ("chapter-3-privacy-IP-family.md", "JSIG Chapter 3 Privacy - Individual Participation and Redress (IP) Family", 16843),
        ("chapter-3-privacy-SE-family.md", "JSIG Chapter 3 Privacy - Security (SE) Family", 16985),
        ("chapter-3-privacy-TR-family.md", "JSIG Chapter 3 Privacy - Transparency (TR) Family", 17058),
        ("chapter-3-privacy-UL-family.md", "JSIG Chapter 3 Privacy - Use Limitation (UL) Family", 17167),
    ]
    appendices = [
        ("appendix-a-references.md", "JSIG Appendix A - References", 17226),
        ("appendix-b-acronyms.md", "JSIG Appendix B - Acronyms", 17383),
        # Appendix C is a boundary-only marker here; parse_appendix_c.py writes its file.
        (None, None, 17713),
        ("appendix-d-confidentiality-impact-level-flowchart.md",
         "JSIG Appendix D - Confidentiality Impact Level Flowchart", 19812),
        ("appendix-e-definitions.md", "JSIG Appendix E - Definitions", 19818),
    ]

    all_sections = chapter3 + privacy + appendices
    all_sections_sorted = sorted(all_sections, key=lambda x: x[2])
    starts = [s[2] for s in all_sections_sorted]

    for i, (fname, title, start) in enumerate(all_sections_sorted):
        if fname is None:
            continue
        end = starts[i + 1] - 1 if i + 1 < len(starts) else len(lines)
        raw_block = lines[start - 1:end - 1]
        cleaned = clean_block(raw_block)
        note = None
        if fname == "appendix-d-confidentiality-impact-level-flowchart.md":
            note = (
                EXTRACTION_NOTE + " This appendix in the source PDF is a graphical "
                "flowchart/diagram (not a text block); `pdftotext` cannot recover text "
                "from vector/image diagrams, so no further body text exists to extract "
                "beyond the title. This is a genuine content limitation of the source "
                "file (not an extraction gap): the flowchart is on PDF page 375; consult "
                "the source PDF directly for the visual diagram."
            )
        write_md(fname, title, cleaned, extra_note=note)

    print(f"\nExtracted {sum(1 for f, _, _ in all_sections_sorted if f)} chapter-3 family / privacy / appendix files from layout-mode source.")


if __name__ == "__main__":
    main()
