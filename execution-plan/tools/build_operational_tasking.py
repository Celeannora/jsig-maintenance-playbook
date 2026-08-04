#!/usr/bin/env python3
"""
build_operational_tasking.py

Generates a SECOND, separate maintenance calendar -- OPERATIONAL-TASKING.md
-- for pure IT-operations / functional-health sysadmin tasking (Active
Directory domain controllers, Exchange, the security-tool stack's own
operational health, and general Windows Server care-and-feeding) that JSIG
does not drive. The existing MAINTENANCE-PLAN.md Master Calendar (110 tasks)
is 100% derived from real JSIG control text and is NOT touched by this
script or the workflow it belongs to -- this is an additive, clearly
separate layer for "is the domain/mail system actually running," not
"is it compliant."

Also generates one MRC-OPS-<###>.md card per task (Navy-PMS-style, same
shape as the JSIG mrc-cards/master/ but simpler RACI) in mrc-cards/ops/, plus
INDEX.md, reusing the Pattern A-H library and rendering conventions from
build_mrc_cards.py so there is exactly one execution-pattern vocabulary
in this repo.

OPS_TASKS below is the single source of truth for both outputs -- this is
new authored data (there is no pre-existing runbook to scrape a pattern
assignment from, since these tasks never existed anywhere else in the
repo before this script). Pattern assignments and tool names are this
script author's direct judgment call, same transparency standard as
FAMILY_RACI_DEFAULTS in build_raci_matrix.py and TOOL_KEYWORD_RULES in
build_mrc_cards.py -- edit OPS_TASKS and regenerate rather than hand-
editing OPERATIONAL-TASKING.md or an individual MRC-OPS-*.md file.

RACI note: every task uses Responsible = the task's own role (System
Administrator or Network Administrator), Accountable = ISSM, Consulted =
ISSO, Informed = AO/DAO -- this is the exact mapping ROLE-CROSSWALK.md
already documents for both operational titles (ISSM accountable, Privileged
User executing under ISSO technical supervision), reused here rather than
invented fresh.

JSIG relationship note: no row below cites a JSIG Control ID as its driver
-- these tasks are not required by any specific JSIG ODP. A few tasks
operationally support a nearby control family without being formally
required by it (e.g., backup-verification tasks support CP-9's intent);
that relationship is called out in prose in OPERATIONAL-TASKING.md's
intro, never as a per-row citation, so it is never mistaken for a real
extracted control requirement the way MAINTENANCE-PLAN.md's Control ID
column is.

Regenerate with:
    python3 execution-plan/tools/build_operational_tasking.py
"""
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))
from build_mrc_cards import load_patterns  # noqa: E402

TOOLS_DIR = os.path.dirname(__file__)
EXEC_PLAN_DIR = os.path.dirname(TOOLS_DIR)

CALENDAR_OUT = os.path.join(EXEC_PLAN_DIR, "OPERATIONAL-TASKING.md")
CARDS_OUT_DIR = os.path.join(EXEC_PLAN_DIR, "mrc-cards", "ops")

# (num, freq, task, system, role, pattern, tool)
OPS_TASKS = [
    (1, "Daily", "AD replication health check (repadmin /replsummary, /showrepl)", "Active Directory / Domain Controllers", "System Administrator", "A", "Active Directory / Windows Server (repadmin.exe)"),
    (2, "Weekly", "DCDIAG full domain controller health check", "Active Directory / Domain Controllers", "System Administrator", "B", "Active Directory / Windows Server (dcdiag.exe)"),
    (3, "Weekly", "DNS zone health and scavenging review", "Active Directory / Domain Controllers", "System Administrator", "B", "Windows Server DNS Server role"),
    (4, "Weekly", "SYSVOL/DFSR replication health check", "Active Directory / Domain Controllers", "System Administrator", "A", "Active Directory / Windows Server (dfsrdiag.exe)"),
    (5, "Monthly", "FSMO role holder verification", "Active Directory / Domain Controllers", "System Administrator", "B", "Active Directory / Windows Server"),
    (6, "Monthly", "Domain/forest trust health check", "Active Directory / Domain Controllers", "System Administrator", "B", "Active Directory / Windows Server (nltest.exe)"),
    (7, "Weekly", "Domain controller System State backup verification", "Active Directory / Domain Controllers", "System Administrator", "A", "Windows Server Backup, Active Directory"),
    (8, "Monthly", "Stale computer/user Active Directory object cleanup", "Active Directory / Domain Controllers", "System Administrator", "G", "Active Directory / Windows Server"),
    (9, "Daily", "Domain controller disk space and event log health check", "Active Directory / Domain Controllers", "System Administrator", "A", "Windows Server (Event Viewer, Performance Monitor)"),
    (10, "Daily", "Netlogon/KDC/DNS Server service health check", "Active Directory / Domain Controllers", "System Administrator", "A", "Active Directory / Windows Server (Services console)"),
    (11, "Monthly", "Group Policy Object replication and health check", "Active Directory / Domain Controllers", "System Administrator", "B", "Active Directory / Windows Server (GPMC, gpupdate)"),
    (12, "Quarterly", "Active Directory database (ntds.dit) size/health review", "Active Directory / Domain Controllers", "System Administrator", "B", "Active Directory / Windows Server (ntdsutil.exe)"),

    (13, "Weekly", "Mailbox database health and whitespace review", "Exchange Messaging", "System Administrator", "B", "Exchange Server (Get-MailboxDatabaseCopyStatus)"),
    (14, "Daily", "Database Availability Group (DAG) health and failover readiness check", "Exchange Messaging", "System Administrator", "A", "Exchange Server DAG"),
    (15, "Daily", "Mail queue / transport health check (stuck-queue check)", "Exchange Messaging", "System Administrator", "A", "Exchange Server (Get-Queue, Transport service)"),
    (16, "Monthly", "Exchange/OWA/SMTP certificate expiration monitoring", "Exchange Messaging", "System Administrator", "B", "Exchange Server (Get-ExchangeCertificate)"),
    (17, "Daily", "Exchange transaction log truncation and disk space check", "Exchange Messaging", "System Administrator", "A", "Exchange Server (database/log volumes)"),
    (18, "Daily", "Client access (OWA/ActiveSync) availability check", "Exchange Messaging", "System Administrator", "A", "Exchange Server Client Access services"),
    (19, "Monthly", "Exchange connector and transport rule health review", "Exchange Messaging", "System Administrator", "B", "Exchange Server (Exchange Admin Center)"),
    (20, "Weekly", "Message tracking log review (mail-flow troubleshooting)", "Exchange Messaging", "System Administrator", "B", "Exchange Server (Get-MessageTrackingLog)"),
    (21, "Weekly", "Exchange application-aware backup verification", "Exchange Messaging", "System Administrator", "A", "Exchange Server + Windows Server Backup (VSS writer)"),

    (22, "Weekly", "Trellix/McAfee ePO agent heartbeat and endpoint coverage check", "Security Tooling (Operational Health)", "System Administrator", "A", "Trellix/McAfee ePO console"),
    (23, "Weekly", "Splunk forwarder health, index health, and license usage check", "Security Tooling (Operational Health)", "System Administrator", "A", "Splunk"),
    (24, "Weekly", "Nessus scanner engine and plugin feed health check", "Security Tooling (Operational Health)", "System Administrator", "C", "Nessus"),

    (25, "Monthly", "AD CS Certificate Authority health and enterprise certificate-expiration monitoring", "Windows Server (General)", "System Administrator", "B", "Active Directory Certificate Services"),
    (26, "Weekly", "Scheduled task/job success monitoring", "Windows Server (General)", "System Administrator", "B", "Windows Task Scheduler"),
    (27, "Monthly", "Service account password expiration tracking", "Windows Server (General)", "System Administrator", "B", "Active Directory / Windows Server"),
    (28, "Weekly", "Hardware/RAID/disk health and out-of-band management check", "Windows Server (General)", "System Administrator", "A", "Server hardware mgmt console (iDRAC/iLO), RAID controller utility"),
    (29, "Monthly", "Functional patching beyond security patches (feature/driver updates)", "Windows Server (General)", "System Administrator", "C", "WSUS (Windows Server Update Services)"),
    (30, "Quarterly", "Windows Server / Exchange licensing and CAL compliance review", "Windows Server (General)", "System Administrator", "B", "Active Directory / Windows Server, Exchange Server"),
    (31, "Weekly", "File/print server share health and disk capacity check", "Windows Server (General)", "System Administrator", "A", "Windows Server (File and Storage Services)"),
    (32, "Weekly", "DHCP scope utilization and lease health check", "Windows Server (General)", "Network Administrator", "B", "Windows Server DHCP Server role"),
    (33, "Weekly", "Server uptime and patch-reboot compliance tracking", "Windows Server (General)", "System Administrator", "A", "WSUS (Windows Server Update Services)"),
    (34, "Daily", "Core Windows service health check across servers", "Windows Server (General)", "System Administrator", "A", "Windows Server (Services console)"),
]

RACI = {"accountable": "ISSM", "consulted": "ISSO", "informed": "AO/DAO"}

# MRC-OPS task numbers that have been hand-upgraded from generic Stub to a
# tool-specific Guide (per AGENTS.md rule 8) and therefore must NOT be
# overwritten by this generator. The generator skips rewriting these files
# entirely -- their content lives only in the hand-authored .md file itself
# -- and marks them "Guide (hand-authored)" in OPERATIONAL-TASKING.md and
# mrc-cards/ops/INDEX.md instead of a Pattern letter. Keep this set in sync
# with execution-plan/mrc-cards/README.md's Status column (source of truth
# for the combined 160-card matrix is build_mrc_status_readme.py's
# GUIDE_STATUS_OVERRIDES in /home/user/workspace, not this set -- update
# both when a card is upgraded).
GUIDE_CARDS = {
    1,  # MRC-OPS-001 -- AD replication health check (repadmin /replsummary, /showrepl)
    2,  # MRC-OPS-002 -- DCDIAG full domain controller health check
    3,  # MRC-OPS-003 -- DNS zone health and scavenging review
    4,  # MRC-OPS-004 -- SYSVOL/DFSR replication health check
    5,  # MRC-OPS-005 -- FSMO role holder verification
    6,  # MRC-OPS-006 -- Domain/forest trust health check
    7,  # MRC-OPS-007 -- Domain controller System State backup verification
    8,  # MRC-OPS-008 -- Stale computer/user Active Directory object cleanup
    9,  # MRC-OPS-009 -- Domain controller disk space and event log health check
    10,  # MRC-OPS-010 -- Netlogon/KDC/DNS Server service health check
    11,  # MRC-OPS-011 -- Group Policy Object replication and health check
    12,  # MRC-OPS-012 -- Active Directory database (ntds.dit) size/health review
    13,  # MRC-OPS-013 -- Mailbox database health and whitespace review
    14,  # MRC-OPS-014 -- Database Availability Group (DAG) health and failover readiness check
    15,  # MRC-OPS-015 -- Mail queue / transport health check (stuck-queue check)
    16,  # MRC-OPS-016 -- Exchange/OWA/SMTP certificate expiration monitoring
    17,  # MRC-OPS-017 -- Exchange transaction log truncation and disk space check
    18,  # MRC-OPS-018 -- Client access (OWA/ActiveSync) availability check
    19,  # MRC-OPS-019 -- Exchange connector and transport rule health review
    20,  # MRC-OPS-020 -- Message tracking log review (mail-flow troubleshooting)
    21,  # MRC-OPS-021 -- Exchange application-aware backup verification
    22,  # MRC-OPS-022 -- Trellix/McAfee ePO agent heartbeat and endpoint coverage check (Guide, no script -- GUI/console-only task)
    23,  # MRC-OPS-023 -- Splunk forwarder health, index health, and license usage check
    24,  # MRC-OPS-024 -- Nessus scanner engine and plugin feed health check
    25,  # MRC-OPS-025 -- AD CS Certificate Authority health and enterprise certificate-expiration monitoring
    26,  # MRC-OPS-026 -- Scheduled task/job success monitoring
    27,  # MRC-OPS-027 -- Service account password expiration tracking
    28,  # MRC-OPS-028 -- Hardware/RAID/disk health and out-of-band management check (Guide, no script -- vendor-specific GUI/console-only task)
    29,  # MRC-OPS-029 -- Functional patching beyond security patches (feature/driver updates)
    30,  # MRC-OPS-030 -- Windows Server / Exchange licensing and CAL compliance review (Guide, no script -- compliance/administrative review, not a technical health check)
    31,  # MRC-OPS-031 -- File/print server share health and disk capacity check
    32,  # MRC-OPS-032 -- DHCP scope utilization and lease health check
    33,  # MRC-OPS-033 -- Server uptime and patch-reboot compliance tracking
    34,  # MRC-OPS-034 -- Core Windows service health check across servers
}


def render_calendar():
    lines = [
        "# Operational Tasking Calendar — Non-JSIG Functional/Health Maintenance",
        "",
        "> Generated by `execution-plan/tools/build_operational_tasking.py`. Do not hand-edit — edit `OPS_TASKS` "
        "in that script and regenerate.",
        "",
        "## Purpose and scope",
        "",
        "[`MAINTENANCE-PLAN.md`](../MAINTENANCE-PLAN.md) §4's 110-task Master Calendar is entirely JSIG-control-driven "
        "— every row exists because a specific Control ID/ODP requires it, and that file is not touched by this "
        "document or its generator. JSIG governs security **posture**; it says nothing about whether the domain, "
        "mail system, or the security tool stack itself is actually running. This is a second, additive calendar for "
        "that gap: pure IT-operations/functional-health sysadmin tasking for a Windows Server Active Directory "
        "domain, Exchange, and the same tool stack named in `mrc-cards/master/` (Trellix/McAfee HBSS, Splunk, Nessus).",
        "",
        "**No row below cites a JSIG Control ID as its driver** — none of these 34 tasks are formally required by a "
        "specific JSIG ODP the way every Master Calendar row is. A handful operationally *support* the intent of a "
        "nearby control family without being required by it: backup-verification tasks (#7, #21) support CP-9's "
        "intent; AD object cleanup (#8) supports AC-2's intent; tool-health checks (#22–24) support SI-3/AU-6/RA-5's "
        "intent; service-account password tracking (#27) supports IA-5's intent. Those are informational context, "
        "not formal citations, and are not repeated per-row in the table to avoid being mistaken for an extracted "
        "control requirement.",
        "",
        "**RACI:** every task below uses Responsible = the task's own role (System Administrator or Network "
        "Administrator), Accountable = ISSM, Consulted = ISSO, Informed = AO/DAO — the exact mapping "
        "[`ROLE-CROSSWALK.md`](ROLE-CROSSWALK.md) already documents for both operational titles (ISSM accountable, "
        "Privileged User executing under ISSO technical supervision), reused here rather than invented fresh.",
        "",
        "## Calendar",
        "",
        "| # | Frequency | Task | System | Responsible Role | Accountable | Consulted | Informed |",
        "|---|---|---|---|---|---|---|---|",
    ]
    for num, freq, task, system, role, pattern, tool in OPS_TASKS:
        marker = " \u2020" if num in GUIDE_CARDS else ""
        lines.append(f"| {num} | {freq} | {task}{marker} | {system} | {role} | {RACI['accountable']} | {RACI['consulted']} | {RACI['informed']} |")
    lines.append("")
    if GUIDE_CARDS:
        lines.append("\u2020 Upgraded to Guide status (exact, tool-specific steps) per "
                     "[`AGENTS.md`](../AGENTS.md) rule 8 -- see [`mrc-cards/README.md`](mrc-cards/README.md) for the "
                     "full Stub/Guide tracking matrix.")
        lines.append("")
    lines.append(f"Total tasks: **{len(OPS_TASKS)}**. Actionable per-task cards: [`mrc-cards/ops/INDEX.md`](mrc-cards/ops/INDEX.md).")
    lines.append("")
    return "\n".join(lines)


def render_card(num, freq, task, system, role, pattern, tool, patterns):
    p = patterns[pattern]
    lines = []
    lines.append(f"# MRC-OPS-{num:03d} — {task}")
    lines.append("")
    lines.append("> Generated by `execution-plan/tools/build_operational_tasking.py` from `OPERATIONAL-TASKING.md`. "
                 "Do not hand-edit — regenerate after editing `OPS_TASKS` in the script.")
    lines.append("")
    lines.append("## 1. Identification")
    lines.append("")
    lines.append("| Field | Value |")
    lines.append("|---|---|")
    lines.append(f"| MRC Number | MRC-OPS-{num:03d} |")
    lines.append(f"| Operational Calendar Task # | [{num}](../../OPERATIONAL-TASKING.md#calendar) |")
    lines.append(f"| System | {system} |")
    lines.append(f"| Periodicity / Frequency | **{freq}** |")
    lines.append(f"| Primary Tool(s) | {tool} |")
    lines.append("")
    lines.append("## 2. References")
    lines.append("")
    lines.append("**JSIG relationship:** none — this is a pure operational/functional-health task, not a JSIG "
                 "control requirement. See [`OPERATIONAL-TASKING.md`](../../OPERATIONAL-TASKING.md#purpose-and-scope) "
                 "for which tasks operationally support (without being required by) a nearby control family.")
    lines.append("")
    lines.append("**Other references:** [OPERATIONAL-TASKING.md](../../OPERATIONAL-TASKING.md#calendar) (source row) · "
                 "[ROLE-CROSSWALK.md](../../ROLE-CROSSWALK.md) (Responsible/Accountable mapping) · "
                 "[ESCALATION-MATRIX.md](../../templates/ESCALATION-MATRIX.md) (CAT-tier SLA/routing, if a finding "
                 "results in a security-relevant exception)")
    lines.append("")
    lines.append("## 3. Personnel / RACI")
    lines.append("")
    lines.append("| Responsible (executes) | Accountable | Consulted | Informed |")
    lines.append("|---|---|---|---|")
    lines.append(f"| {role} | **{RACI['accountable']}** | {RACI['consulted']} | {RACI['informed']} |")
    lines.append("")
    lines.append("## 4. Safety / Handling Precautions")
    lines.append("")
    lines.append("No physical hazard is inherent to this task. If executing this check requires touching a "
                 "production domain controller, Exchange server, or other production system, follow the "
                 "organization's standard change-control/maintenance-window process. Do not export diagnostic "
                 "output to unauthorized media or systems.")
    lines.append("")
    lines.append("## 5. Procedure")
    lines.append("")
    lines.append(f"**Pattern {pattern} — {p['name']}** (assigned directly for this operational task; no prior "
                 "runbook precedent exists since this task is new to the repository)")
    lines.append("")
    lines.append(p["intro"])
    lines.append("")
    for step in p["steps"]:
        lines.append(step)
    lines.append("")
    lines.append("## 6. Validation, Evidence, Findings, Escalation, Closure")
    lines.append("")
    lines.append("Full canonical language for these five sections is defined once in "
                 "[`runbooks/_EXECUTION-PATTERNS.md`](../../runbooks/_EXECUTION-PATTERNS.md#standard-sections-610-shared-across-every-task-in-every-role-runbook-unless-a-task-explicitly-overrides-one) "
                 "and applies here too. Task-specific values for this card:")
    lines.append("")
    lines.append("| Field | Value |")
    lines.append("|---|---|")
    lines.append(f"| Reviewed By (Validation) | {RACI['accountable']} |")
    lines.append("| Repository Path (Evidence Package) | _fill in: local ticketing/GRC or file-share path used for this cycle_ |")
    lines.append("| Escalation Routing | If a check surfaces a security-relevant finding (not just an operational "
                 "outage), route it through [`ESCALATION-MATRIX.md`](../../templates/ESCALATION-MATRIX.md)'s CAT tiers; "
                 "a purely operational/availability issue (e.g., a full disk, a stuck mail queue) follows the "
                 "organization's standard IT incident process instead |")
    lines.append(f"| Next Due Date (Closure) | This task's frequency (**{freq}**) advanced one cycle from the Actual Completion Date below |")
    lines.append("")
    lines.append("## 7. Sign-Off")
    lines.append("")
    lines.append("| Role | Name | Signature | Date |")
    lines.append("|---|---|---|---|")
    lines.append(f"| Preparer ({role}) | | | |")
    lines.append(f"| Reviewer/Approver ({RACI['accountable']}) | | | |")
    lines.append("")
    lines.append("| Cycle Metadata | Value |")
    lines.append("|---|---|")
    lines.append("| Actual Completion Date | |")
    lines.append("| Findings This Cycle (Y/N, count) | |")
    lines.append("| Tracking/Ticket ID(s), if any | |")
    lines.append("")
    return "\n".join(lines)


def main():
    patterns = load_patterns()

    with open(CALENDAR_OUT, "w", encoding="utf-8") as f:
        f.write(render_calendar())

    os.makedirs(CARDS_OUT_DIR, exist_ok=True)
    guide_filenames = {f"MRC-OPS-{n:03d}.md" for n in GUIDE_CARDS}
    for old in os.listdir(CARDS_OUT_DIR):
        if old.startswith("MRC-OPS-") and old.endswith(".md") and old not in guide_filenames:
            os.remove(os.path.join(CARDS_OUT_DIR, old))

    idx_lines = [
        "# Maintenance Requirement Cards (Operational) — Master Index",
        "",
        "One actionable card per Operational Tasking Calendar task (all "
        f"{len(OPS_TASKS)}). Generated by `python3 execution-plan/tools/build_operational_tasking.py` from "
        "`OPERATIONAL-TASKING.md` + `runbooks/_EXECUTION-PATTERNS.md`. Do not hand-edit individual cards, EXCEPT "
        "cards listed in `GUIDE_CARDS` in that script, which have been hand-upgraded to Guide status per "
        "[AGENTS.md](../../AGENTS.md) rule 8 and are intentionally skipped by the generator.",
        "",
        "| MRC | Task | System | Frequency | Pattern |",
        "|---|---|---|---|---|",
    ]
    for num, freq, task, system, role, pattern, tool in OPS_TASKS:
        fname = f"MRC-OPS-{num:03d}.md"
        if num in GUIDE_CARDS:
            # Hand-authored Guide content -- do not touch the file, just index it.
            idx_lines.append(f"| [MRC-OPS-{num:03d}]({fname}) | {task} | {system} | {freq} | Guide (hand-authored) |")
            continue
        with open(os.path.join(CARDS_OUT_DIR, fname), "w", encoding="utf-8") as f:
            f.write(render_card(num, freq, task, system, role, pattern, tool, patterns))
        idx_lines.append(f"| [MRC-OPS-{num:03d}]({fname}) | {task} | {system} | {freq} | Pattern {pattern} |")
    idx_lines.append("")

    with open(os.path.join(CARDS_OUT_DIR, "INDEX.md"), "w", encoding="utf-8") as f:
        f.write("\n".join(idx_lines))

    print(f"Wrote OPERATIONAL-TASKING.md ({len(OPS_TASKS)} tasks) and {len(OPS_TASKS)} MRC-OPS cards to {CARDS_OUT_DIR}")


if __name__ == "__main__":
    main()
