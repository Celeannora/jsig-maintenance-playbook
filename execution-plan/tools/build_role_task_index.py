#!/usr/bin/env python3
"""
build_role_task_index.py

Generates execution-plan/tools/data/role_task_index.json: for each of the 17
JSIG Sec 1.5 formal roles, the full list of Master Calendar tasks (from
MAINTENANCE-PLAN.md Sec 4) where that role is the true hands-on Executor,
the Accountable party, Consulted, or Informed -- reusing the exact same
parsing and role-mapping logic as build_raci_matrix.py so this index can
never drift from RACI-MATRIX.md.

Purpose: this is the grounding data file for execution-plan/runbooks/<Role>.md
generation. Runbook authors (human or subagent) should read this JSON --
not re-derive RACI logic by hand -- to get an exact, source-of-truth list of
which Master Calendar tasks belong in a given role's runbook, with full
task metadata (family, control IDs, frequency, RACI positions) attached.

Regenerate any time with:
    python3 execution-plan/tools/build_role_task_index.py
(Run this AFTER build_raci_matrix.py if you've edited the calendar or
crosswalk, so both stay in sync.)
"""
import json
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))
from build_raci_matrix import (  # noqa: E402
    ALL_17_ROLES,
    EXECUTING_LABEL_TO_ROLE,
    ROLE_MAP,
    map_row,
    parse_calendar,
)

OUT_FILE = os.path.join(os.path.dirname(__file__), "data", "role_task_index.json")


def task_summary(row, mapped):
    return {
        "num": row["num"],
        "task": row["task"],
        "family": row["family"],
        "frequency": row["freq"],
        "controls": row["controls"],
        "responsible_raw": row["responsible_raw"],
        "accountable": mapped["accountable"],
        "consulted": mapped["consulted"],
        "informed": mapped["informed"],
    }


def main():
    rows = parse_calendar()
    rows_mapped = [(row, map_row(row)) for row in rows]

    index = {role: {"executing": [], "accountable": [], "consulted": [], "informed": []} for role in ALL_17_ROLES}

    for row, mapped in rows_mapped:
        summary = task_summary(row, mapped)

        for acc in mapped["accountable_all"]:
            if acc in index:
                index[acc]["accountable"].append(summary)

        for label in row["responsible_raw"].split(","):
            label = label.strip()
            _, exe_label = ROLE_MAP.get(label, (None, None))
            exe_role = EXECUTING_LABEL_TO_ROLE.get(exe_label, exe_label)
            if exe_role in index and not any(t["num"] == summary["num"] for t in index[exe_role]["executing"]):
                index[exe_role]["executing"].append(summary)

        for tok in mapped["consulted"].replace("/", ",").split(","):
            tok = tok.strip()
            if tok in index:
                index[tok]["consulted"].append(summary)

        for tok in mapped["informed"].replace("/", ",").split(","):
            tok = tok.strip()
            if tok in index:
                index[tok]["informed"].append(summary)

    with open(OUT_FILE, "w", encoding="utf-8") as f:
        json.dump(index, f, indent=2)

    print(f"Wrote {OUT_FILE}")
    for role in ALL_17_ROLES:
        r = index[role]
        print(
            f"  {role}: executing={len(r['executing'])} accountable={len(r['accountable'])} "
            f"consulted={len(r['consulted'])} informed={len(r['informed'])}"
        )


if __name__ == "__main__":
    main()
