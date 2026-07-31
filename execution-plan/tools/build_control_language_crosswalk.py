#!/usr/bin/env python3
"""
build_control_language_crosswalk.py

Generates execution-plan/CONTROL-LANGUAGE-CROSSWALK.md: for every distinct
Control ID cited anywhere in MAINTENANCE-PLAN.md's 110-task Master Calendar,
resolves the real verbatim JSIG control title from
execution-plan/tools/data/control_title_index.json (built by
build_control_title_index.py from the full verbatim family extractions) and
flags any cited ID that does NOT resolve.

This is a read-only reconciliation report. It does not modify
MAINTENANCE-PLAN.md, the Master Calendar's task list, frequencies, or
Control ID assignments -- it only audits and documents whether each already-
cited Control ID matches a real, verbatim-confirmed JSIG control, now that
the full JSIG text is available (previously the calendar's Control ID column
was populated against NIST 800-53 boilerplate proxy text, before the JSIG
PDF was fully extracted).

Regenerate any time with:
    python3 execution-plan/tools/build_control_language_crosswalk.py
(Run after build_control_title_index.py if family files were re-extracted.)
"""
import json
import os
import re
import sys

sys.path.insert(0, os.path.dirname(__file__))
from build_raci_matrix import parse_calendar  # noqa: E402

TITLE_INDEX_FILE = os.path.join(os.path.dirname(__file__), "data", "control_title_index.json")
OUT_FILE = os.path.join(os.path.dirname(__file__), "..", "CONTROL-LANGUAGE-CROSSWALK.md")

# Splits a "Control ID(s)" cell like "AC-6, AC-6(1)" or "CP-6, CP-7, CP-8" or
# "IR/AU retention" or "AT-2 (supplemental)" into individual candidate IDs.
ID_TOKEN_RE = re.compile(r"[A-Z]{2}-\d+(?:\(\d+\))?")


def load_title_index():
    with open(TITLE_INDEX_FILE, encoding="utf-8") as f:
        return json.load(f)


def extract_ids(cell):
    return ID_TOKEN_RE.findall(cell)


def main():
    title_index = load_title_index()
    rows = parse_calendar()

    # task_num -> list of (id, resolved_or_None)
    resolved_rows = []
    all_ids_seen = {}  # id -> set of task nums citing it
    unresolved_ids = {}  # id -> set of task nums citing it

    for row in rows:
        ids = extract_ids(row["controls"])
        row_resolved = []
        for cid in ids:
            all_ids_seen.setdefault(cid, set()).add(row["num"])
            hit = title_index.get(cid)
            row_resolved.append((cid, hit))
            if hit is None:
                unresolved_ids.setdefault(cid, set()).add(row["num"])
        resolved_rows.append((row, row_resolved))

    lines = []
    lines.append("# Control Language Crosswalk")
    lines.append("")
    lines.append(
        "Auto-generated reconciliation report: resolves every Control ID cited in "
        "[MAINTENANCE-PLAN.md Section 4](../MAINTENANCE-PLAN.md#4-master-consolidated-calendar) "
        "(the 110-task Master Calendar) against the real verbatim JSIG control titles now "
        "available in `reference/JSIG-source/chapter-3-*-family.md` "
        "(see [EXTRACTION-LOG.md](../reference/JSIG-source/EXTRACTION-LOG.md)). "
        "**This report does not modify the Master Calendar, RACI-MATRIX.md, or "
        "role_task_index.json** -- it is a read-only audit so a human can decide whether any "
        "unresolved ID below needs a follow-up correction to the calendar itself. "
        "Regenerate with:"
    )
    lines.append("")
    lines.append("```")
    lines.append("python3 execution-plan/tools/build_control_language_crosswalk.py")
    lines.append("```")
    lines.append("")
    lines.append("---")
    lines.append("")
    lines.append(f"## Summary: {len(all_ids_seen)} distinct Control ID(s) cited across {len(rows)} Master Calendar tasks")
    lines.append("")
    lines.append(f"- **Resolved to a real verbatim JSIG control title:** {len(all_ids_seen) - len(unresolved_ids)}")
    lines.append(f"- **Unresolved (no exact match in the verbatim extraction):** {len(unresolved_ids)}")
    lines.append("")

    if unresolved_ids:
        lines.append("## Unresolved Control IDs (need human review)")
        lines.append("")
        lines.append(
            "Each of these appears in the Master Calendar's Control ID(s) column but has no "
            "exact match in `control_title_index.json`. This can mean: (a) the ID is a "
            "shorthand/typo for a real control (e.g. a missing enhancement number), (b) the "
            "citation intentionally refers to a related-but-different family (see the task's "
            "own wording), or (c) the extraction parser missed a genuinely present control "
            "(rare -- cross-check the family file directly before assuming (a) or (b))."
        )
        lines.append("")
        lines.append("| Control ID | Cited in Task(s) # |")
        lines.append("|---|---|")
        for cid in sorted(unresolved_ids):
            nums = ", ".join(sorted(unresolved_ids[cid], key=lambda x: int(x)))
            lines.append(f"| {cid} | {nums} |")
        lines.append("")
    else:
        lines.append("## Unresolved Control IDs (need human review)")
        lines.append("")
        lines.append("None -- every Control ID cited in the Master Calendar resolved to a real verbatim JSIG control title.")
        lines.append("")

    lines.append("---")
    lines.append("")
    lines.append("## Full Task-to-Control-Language Table")
    lines.append("")
    lines.append("| # | Task | Family | Control ID(s) (as cited in Master Calendar) | Real JSIG Title(s) | Source |")
    lines.append("|---|---|---|---|---|---|")
    for row, row_resolved in resolved_rows:
        if row_resolved:
            id_cells, title_cells, source_cells = [], [], set()
            for cid, hit in row_resolved:
                id_cells.append(cid)
                if hit:
                    title_cells.append(f"{cid}: {hit['title']}")
                    source_cells.add(hit["source"])
                else:
                    title_cells.append(f"{cid}: **UNRESOLVED**")
            ids_str = ", ".join(id_cells)
            titles_str = "; ".join(title_cells)
            src_links = "; ".join(sorted(f"[{os.path.basename(s)}](../{s})" for s in source_cells)) or "—"
        else:
            ids_str = row["controls"]
            titles_str = "(no parseable Control ID token in cell)"
            src_links = "—"
        task_escaped = row["task"].replace("|", "\\|")
        lines.append(f"| {row['num']} | {task_escaped} | {row['family']} | {ids_str} | {titles_str} | {src_links} |")
    lines.append("")

    with open(OUT_FILE, "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")

    print(f"Wrote {OUT_FILE}")
    print(f"  {len(all_ids_seen)} distinct IDs cited, {len(unresolved_ids)} unresolved")


if __name__ == "__main__":
    main()
