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

Each task's "control_titles" field additionally resolves each cited Control
ID to its real verbatim JSIG title (via control_title_index.json, built by
build_control_title_index.py from the full family extractions) -- "title":
null means that ID did not resolve (see CONTROL-LANGUAGE-CROSSWALK.md for
the full reconciliation report). This never changes which Control ID(s) a
task cites; it only adds the real title alongside the ID already in
MAINTENANCE-PLAN.md's calendar.

Regenerate any time with:
    python3 execution-plan/tools/build_role_task_index.py
(Run this AFTER build_raci_matrix.py if you've edited the calendar or
crosswalk, so both stay in sync.)
"""
import json
import os
import re
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
TITLE_INDEX_FILE = os.path.join(os.path.dirname(__file__), "data", "control_title_index.json")
ID_TOKEN_RE = re.compile(r"[A-Z]{2}-\d+(?:\(\d+\))?")


def load_title_index():
    """Real verbatim JSIG control titles, from build_control_title_index.py.
    Used only to enrich this file with 'control_titles' -- never to change
    which Control ID(s) a task cites (that stays sourced from the calendar).
    """
    if not os.path.exists(TITLE_INDEX_FILE):
        return {}
    with open(TITLE_INDEX_FILE, encoding="utf-8") as f:
        return json.load(f)


def resolve_control_titles(controls_cell, title_index):
    resolved = []
    for cid in ID_TOKEN_RE.findall(controls_cell):
        hit = title_index.get(cid)
        resolved.append({"id": cid, "title": hit["title"] if hit else None, "source": hit["source"] if hit else None})
    return resolved


def task_summary(row, mapped, title_index):
    return {
        "num": row["num"],
        "task": row["task"],
        "family": row["family"],
        "frequency": row["freq"],
        "controls": row["controls"],
        "control_titles": resolve_control_titles(row["controls"], title_index),
        "responsible_raw": row["responsible_raw"],
        "accountable": mapped["accountable"],
        "consulted": mapped["consulted"],
        "informed": mapped["informed"],
    }


def main():
    rows = parse_calendar()
    rows_mapped = [(row, map_row(row)) for row in rows]
    title_index = load_title_index()

    index = {role: {"executing": [], "accountable": [], "consulted": [], "informed": []} for role in ALL_17_ROLES}

    for row, mapped in rows_mapped:
        summary = task_summary(row, mapped, title_index)

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
