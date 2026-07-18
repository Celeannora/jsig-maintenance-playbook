#!/usr/bin/env python3
"""
build_raci_matrix.py

Generates execution-plan/RACI-MATRIX.md by parsing the Master Consolidated
Calendar (MAINTENANCE-PLAN.md Section 4, 110 recurring tasks) and mapping
each task's operational-title "Responsible Role" to its JSIG-formal
Accountable/Responsible roles via execution-plan/ROLE-CROSSWALK.md, then
assigning Consulted/Informed roles from a per-control-family default table.

Design note (read before editing the defaults below): the Master Calendar
states WHO EXECUTES each task (an operational title) but not who is
formally ACCOUNTABLE, CONSULTED, or INFORMED under JSIG Sec 1.5 -- that
mapping is this project's own analytical judgment, cross-referenced to
ROLE-CROSSWALK.md for the Accountable/Responsible half. The Consulted/
Informed defaults are assigned per NIST SP 800-53 control family (the
"Family" column) rather than per individual task, since JSIG does not
specify a family-level RACI either -- this keeps 110 rows internally
consistent instead of 110 independent judgment calls. If your
organization's actual SAP program staffs these differently, edit
FAMILY_RACI_DEFAULTS and/or ROLE_MAP below and re-run; do not hand-edit
the generated RACI-MATRIX.md, or the file will silently drift from this
script's logic.

Regenerate any time with:
    python3 execution-plan/tools/build_raci_matrix.py
"""
import os
import re

REPO_ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
CALENDAR_FILE = os.path.join(REPO_ROOT, "MAINTENANCE-PLAN.md")
OUT_FILE = os.path.join(REPO_ROOT, "execution-plan", "RACI-MATRIX.md")

# Maps every operational-title token that appears in the Master Calendar's
# "Responsible Role" column to (accountable_jsig_role, executing_label).
# Sourced from execution-plan/ROLE-CROSSWALK.md for the 11 titles that
# differ from a direct JSIG role name; JSIG-formal names map to themselves.
ROLE_MAP = {
    "System Administrator": ("ISSM", "Privileged User (as SA, under ISSO supervision)"),
    "Network Administrator": ("ISSM", "Privileged User (as NA, under ISSO supervision)"),
    "ISSO": ("ISSO", "ISSO"),
    "ISSO / SOC analyst": ("ISSO", "ISSO / SOC analyst"),
    "ISSM": ("ISSM", "ISSM"),
    "Facility Security Officer": ("PSO", "PSO (or ISSM if no dedicated FSO/PSO billet)"),
    "Personnel Security Officer": ("PSO", "PSO"),
    "Personnel Security": ("PSO", "PSO"),
    "Privacy Officer": ("Information Owner/Steward", "Information Owner/Steward (or dedicated privacy office)"),
    "Data Owner": ("Information Owner/Steward", "Information Owner/Steward"),
    "Training Manager": ("ISSM", "ISSM (or delegated training-office function)"),
    "CCB Chair": ("ISSM", "ISSM or ISO (organization-dependent)"),
    "CCB": ("ISSM", "Configuration Control Board (ISSM has veto authority)"),
    "IR Team Lead": ("ISSM", "ISSO (day-to-day execution)"),
    "IR Team Lead / CND Team": ("ISSM", "ISSO / CND Team (day-to-day execution)"),
    "SCA/SCAR": ("SCA", "SCA / SCAR"),
}

# Consulted/Informed defaults by NIST SP 800-53 control family, applied to
# every task in that family unless the role would duplicate that row's
# Accountable role (in which case the alternate in parens is used instead).
FAMILY_RACI_DEFAULTS = {
    "AC": ("ISSO", "ISSM"),
    "AT": ("ISSM", "ISSO"),
    "AU": ("ISSO", "ISSM"),
    "CA": ("ISSM", "AO/DAO"),
    "CM": ("CCB", "ISSM"),
    "CP": ("ISSM", "AO/DAO"),
    "IA": ("ISSO", "ISSM"),
    "IR": ("ISSM", "AO/DAO, CISO"),
    "MA": ("ISSO", "ISSM"),
    "MP": ("ISSO", "ISSM"),
    "PE": ("ISSM", "PSO"),
    "PL": ("ISSO", "AO/DAO"),
    "PS": ("ISSM", "PSO"),
    "RA": ("SCA", "AO/DAO"),
    "SA": ("ISSM", "AO/DAO"),
    "SC": ("ISSO", "ISSM"),
    "SI": ("ISSO", "ISSM"),
    "PM": ("AO/DAO", "Risk Executive Function"),
    "AP": ("Information Owner/Steward", "ISSM"),
    "AR": ("Information Owner/Steward", "ISSM"),
    "DI": ("Information Owner/Steward", "ISSM"),
    "DM": ("Information Owner/Steward", "ISSM"),
    "IP": ("Information Owner/Steward", "ISSM"),
    "SE": ("Information Owner/Steward", "ISSM"),
    "TR": ("Information Owner/Steward", "ISSM"),
    "UL": ("Information Owner/Steward", "ISSM"),
    "All 26": ("ISSO", "AO/DAO"),
}

def _resolve_alt(default_role, accountable_role, preferred_alt, secondary_alt):
    """Return default_role unless it duplicates accountable_role, in which
    case fall back to preferred_alt -- and if THAT also duplicates
    accountable_role, fall back to secondary_alt. Prevents the Consulted or
    Informed column from silently repeating the Accountable role."""
    if default_role != accountable_role:
        return default_role
    return preferred_alt if preferred_alt != accountable_role else secondary_alt

ALL_17_ROLES = [
    "Agency/Component Head", "Risk Executive Function", "CIO", "CISO", "AO", "DAO",
    "PSO", "CCP", "ISO", "ISSM", "ISSO", "ISSE", "SCA", "Information Owner/Steward",
    "Privileged Users", "General Users", "MBO",
]

# Normalizes a ROLE_MAP executing-label (free text, e.g. "Privileged User (as SA, under
# ISSO supervision)") down to the canonical JSIG-formal role name it denotes, so the
# rollup in build_role_rollup() can actually match it against ALL_17_ROLES. Without this,
# descriptive executing labels never match a canonical role name and get silently dropped.
EXECUTING_LABEL_TO_ROLE = {
    "Privileged User (as SA, under ISSO supervision)": "Privileged Users",
    "Privileged User (as NA, under ISSO supervision)": "Privileged Users",
    "ISSO": "ISSO",
    "ISSO / SOC analyst": "ISSO",
    "ISSM": "ISSM",
    "PSO (or ISSM if no dedicated FSO/PSO billet)": "PSO",
    "PSO": "PSO",
    "Information Owner/Steward (or dedicated privacy office)": "Information Owner/Steward",
    "Information Owner/Steward": "Information Owner/Steward",
    "ISSM (or delegated training-office function)": "ISSM",
    "ISSM or ISO (organization-dependent)": "ISSM",  # primary; ISO is the org-dependent alternate
    "Configuration Control Board (ISSM has veto authority)": "ISSM",  # board chaired/vetoed by ISSM
    "ISSO (day-to-day execution)": "ISSO",
    "ISSO / CND Team (day-to-day execution)": "ISSO",
    "SCA / SCAR": "SCA",
}


def parse_calendar():
    lines = open(CALENDAR_FILE, encoding="utf-8").read().splitlines()
    in_table = False
    rows = []
    for line in lines:
        if line.startswith("| # | Frequency Tier"):
            in_table = True
            continue
        if in_table:
            if not line.startswith("|"):
                break
            if line.startswith("|---"):
                continue
            cols = [c.strip() for c in line.strip("|").split("|")]
            if len(cols) < 6:
                continue
            rows.append({
                "num": cols[0], "freq": cols[1], "task": cols[2],
                "family": cols[3], "controls": cols[4], "responsible_raw": cols[5],
            })
    return rows


def map_row(row):
    tokens = [t.strip() for t in row["responsible_raw"].split(",")]
    accountable_roles, executing_labels = [], []
    for t in tokens:
        acc, exe = ROLE_MAP.get(t, ("ISSM", t))  # fail-soft: unmapped tokens default to ISSM-accountable
        if acc not in accountable_roles:
            accountable_roles.append(acc)
        if exe not in executing_labels:
            executing_labels.append(exe)
    accountable = accountable_roles[0]

    family_key = row["family"] if row["family"] in FAMILY_RACI_DEFAULTS else None
    consulted_default, informed_default = FAMILY_RACI_DEFAULTS.get(family_key, ("ISSM", "AO/DAO"))
    consulted = _resolve_alt(consulted_default, accountable, "ISSM", "ISSO")
    informed = _resolve_alt(informed_default, accountable, "AO/DAO", "ISSM")

    return {
        "responsible": row["responsible_raw"],
        "accountable": accountable,
        "accountable_all": accountable_roles,
        "consulted": consulted,
        "informed": informed,
    }


def build_role_rollup(rows_mapped):
    rollup = {r: {"accountable": 0, "responsible": 0, "consulted": 0, "informed": 0} for r in ALL_17_ROLES}

    def bump(role, field):
        if role in rollup:
            rollup[role][field] += 1

    for row, mapped in rows_mapped:
        for acc in mapped["accountable_all"]:
            bump(acc, "accountable")
        # Match each raw Responsible-column token's EXECUTING half (ROLE_MAP[...][1]),
        # normalized to a canonical role name, for the true hands-on-executor rollup --
        # NOT the accountable half, which would just double-count the Accountable column.
        for label in row["responsible_raw"].split(","):
            label = label.strip()
            _, exe_label = ROLE_MAP.get(label, (None, None))
            exe_role = EXECUTING_LABEL_TO_ROLE.get(exe_label, exe_label)
            if exe_role:
                bump(exe_role, "responsible")
        for tok in re.split(r"[,/]", mapped["consulted"]):
            bump(tok.strip(), "consulted")
        for tok in re.split(r"[,/]", mapped["informed"]):
            bump(tok.strip(), "informed")
    return rollup


def main():
    rows = parse_calendar()
    rows_mapped = [(row, map_row(row)) for row in rows]

    lines = []
    lines.append("# Master RACI Matrix\n")
    lines.append(
        "Auto-generated from [MAINTENANCE-PLAN.md Section 4](../MAINTENANCE-PLAN.md#4-master-consolidated-calendar) "
        "(the 110-task Master Consolidated Calendar) and [ROLE-CROSSWALK.md](ROLE-CROSSWALK.md) "
        "(operational title -> JSIG-formal role mapping). Regenerate any time with:\n"
    )
    lines.append("```\npython3 execution-plan/tools/build_raci_matrix.py\n```\n")
    lines.append(
        "**Do not hand-edit the tables below.** The Master Calendar states who *executes* each task "
        "(Responsible); this script derives Accountable from ROLE-CROSSWALK.md and assigns Consulted/Informed "
        "from a per-control-family default (documented in the script's `FAMILY_RACI_DEFAULTS`) since JSIG does "
        "not itself specify family-level RACI. Treat Consulted/Informed as this project's judgment call, not a "
        "verbatim JSIG requirement -- update the script's defaults, not this file, if your organization staffs "
        "differently.\n"
    )
    lines.append("---\n")
    lines.append("## Part A \u2014 Task-Level RACI (all 110 Master Calendar tasks)\n")
    lines.append("| # | Task | Family | Responsible (executes) | Accountable | Consulted | Informed |")
    lines.append("|---|---|---|---|---|---|---|")
    for row, mapped in rows_mapped:
        lines.append(
            f"| {row['num']} | {row['task']} | {row['family']} | {mapped['responsible']} | "
            f"**{mapped['accountable']}** | {mapped['consulted']} | {mapped['informed']} |"
        )

    lines.append("\n---\n")
    lines.append("## Part B \u2014 Role Rollup (task counts per JSIG \u00a71.5 role)\n")
    lines.append(
        "Reverse index of Part A: for each of the 17 JSIG-formal roles, how many of the 110 Master Calendar "
        "tasks name that role as Accountable, Responsible/Executing, Consulted, or Informed. Roles with all "
        "zeros are not tied to a specific recurring operational task in the Master Calendar but still hold "
        "their JSIG \u00a71.5 duties (governance, oversight, authorization) described in "
        "[references/JSIG-source/section-1.5-roles-and-responsibilities.md](../references/JSIG-source/section-1.5-roles-and-responsibilities.md) "
        "and their role playbook.\n"
    )
    lines.append("| JSIG \u00a71.5 Role | Accountable (# tasks) | Responsible/Executing (# tasks) | Consulted (# tasks) | Informed (# tasks) |")
    lines.append("|---|---|---|---|---|")
    rollup = build_role_rollup(rows_mapped)
    for role in ALL_17_ROLES:
        r = rollup[role]
        lines.append(f"| {role} | {r['accountable']} | {r['responsible']} | {r['consulted']} | {r['informed']} |")

    lines.append("\n---\n")
    lines.append(
        f"*Generated by `execution-plan/tools/build_raci_matrix.py` from {len(rows)} Master Calendar rows "
        "and the ROLE-CROSSWALK.md mapping. See also the finding-level (not task-level) severity-tiered RACI "
        "in [ESCALATION-MATRIX.md](templates/ESCALATION-MATRIX.md) and "
        "[VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md](templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md), which govern "
        "individual STIG/CVE findings rather than recurring operational tasks.*\n"
    )

    with open(OUT_FILE, "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")

    print(f"Parsed {len(rows)} calendar rows.")
    print(f"Wrote {OUT_FILE}")


if __name__ == "__main__":
    main()
