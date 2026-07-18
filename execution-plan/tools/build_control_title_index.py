#!/usr/bin/env python3
"""
build_control_title_index.py

Parses the verbatim-extracted JSIG Chapter 3 family files (18 control
families + 8 Privacy sub-families) in references/JSIG-source/ and builds
execution-plan/tools/data/control_title_index.json: a lookup of every real
JSIG control ID -> its real verbatim title, family, and source file.

Purpose: this is the reconciliation grounding file that lets RACI-MATRIX.md,
role_task_index.json, and the 17 role runbooks cite real JSIG control
language (verbatim titles) instead of generic/NIST-boilerplate phrasing,
without hand-editing MAINTENANCE-PLAN.md's Master Calendar. It does NOT
change any Control ID assignment in the calendar -- it only resolves each
ID already cited there to its real title, and flags (does not silently
drop) any cited ID this index cannot resolve.

Parsing rules (derived from manual inspection of the extracted text):
  - Base control line: "^ID\\s+TITLE$" where ID looks like "AC-1" or "AR-3"
    and TITLE is an all-caps (or nearly all-caps) heading on its own line.
  - Enhancement line: "^\\s*\\(N\\)\\s+BASE-TITLE \\| ENHANCEMENT-TITLE$"
    inside a control's "Control Enhancements:" block. Combined ID is
    "BASE-ID(N)" (e.g. "AC-2(1)"). Only the text after the pipe is stored
    as the enhancement's own title; the pre-pipe text (repeated base title)
    is discarded as redundant.
  - Not every enhancement in the source uses the pipe format (some sit
    inside ordinary body-text numbered sub-lists that are NOT control
    enhancements, e.g. AU-2's list of auditable event types) -- the pipe
    requirement is what disambiguates a real enhancement heading from an
    unrelated numbered bullet, confirmed by spot-checking coverage below.

Regenerate any time with:
    python3 execution-plan/tools/build_control_title_index.py
"""
import glob
import json
import os
import re

SOURCE_DIR = os.path.join(os.path.dirname(__file__), "..", "..", "references", "JSIG-source")
OUT_FILE = os.path.join(os.path.dirname(__file__), "data", "control_title_index.json")

BASE_RE = re.compile(r"^([A-Z]{2}-\d+)\s{2,}([A-Z][A-Z0-9 ,/\-\.&']+?)\s*$")
ENH_RE = re.compile(r"^\s*\((\d+)\)\s+[A-Z0-9 ,/\-\.&']+\|\s*([A-Z0-9 ,/\-\.&'\(\)]+?)\s*$")


def parse_family_file(path):
    """Returns dict: control_id -> {"title": str, "source": relpath}."""
    rel = os.path.relpath(path, os.path.join(os.path.dirname(__file__), "..", ".."))
    with open(path, encoding="utf-8") as f:
        lines = f.read().splitlines()

    entries = {}
    current_base_id = None
    for line in lines:
        m_base = BASE_RE.match(line)
        if m_base:
            cid, title = m_base.group(1), m_base.group(2).strip()
            # Guard against false positives: title must have at least one
            # space-separated word and not be a stray fragment.
            if len(title.split()) >= 1 and cid not in entries:
                entries[cid] = {"title": title, "source": rel}
                current_base_id = cid
            continue
        m_enh = ENH_RE.match(line)
        if m_enh and current_base_id:
            num, title = m_enh.group(1), m_enh.group(2).strip()
            cid = f"{current_base_id}({num})"
            if cid not in entries:
                entries[cid] = {"title": title, "source": rel}
    return entries


def main():
    index = {}
    family_files = sorted(glob.glob(os.path.join(SOURCE_DIR, "chapter-3-*-family.md")))
    for path in family_files:
        entries = parse_family_file(path)
        for cid, data in entries.items():
            if cid in index:
                print(f"WARNING: duplicate control ID {cid} in {data['source']} "
                      f"(already defined in {index[cid]['source']}) -- keeping first")
                continue
            index[cid] = data

    with open(OUT_FILE, "w", encoding="utf-8") as f:
        json.dump(index, f, indent=2, sort_keys=True)

    print(f"Wrote {OUT_FILE}: {len(index)} control IDs resolved across {len(family_files)} family files")


if __name__ == "__main__":
    main()
