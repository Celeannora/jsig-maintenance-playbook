#!/usr/bin/env python3
"""
build_network_infra_tasking.py

Generates a THIRD, separate maintenance calendar -- NETWORK-INFRASTRUCTURE-
TASKING.md -- closing the #1 gap identified in GAP-ANALYSIS.md: neither
MAINTENANCE-PLAN.md (JSIG-driven) nor OPERATIONAL-TASKING.md (AD/Exchange/
tool-stack/general Windows Server) has any tasking for the network device
layer itself (switches, routers, firewalls) -- config backup, firmware
currency, and HA/failover state. This script closes that specific gap only;
it does not touch MAINTENANCE-PLAN.md or OPERATIONAL-TASKING.md.

Also generates one MRC-NET-<###>.md card per task (same Navy-PMS-style shape
as mrc-cards/ and mrc-cards-ops/) in mrc-cards-netinfra/, plus INDEX.md,
reusing the Pattern A-H library from build_mrc_cards.py -- same execution-
pattern vocabulary as everywhere else in this repo, no new pattern
invented.

NET_TASKS below is the single source of truth for both outputs. Frequencies,
Pattern assignments, and tool names are this script author's direct
judgment call -- same transparency standard as OPS_TASKS in
build_operational_tasking.py -- edit NET_TASKS and regenerate rather than
hand-editing NETWORK-INFRASTRUCTURE-TASKING.md or an individual
MRC-NET-*.md file.

Tool naming: unlike mrc-cards/ and mrc-cards-ops/, no specific network
device vendor has been established anywhere in this repository, so tool
names here stay generic/vendor-agnostic ("network device CLI", "firewall
management console") per this repo's default design principle, rather
than inventing a vendor.

RACI note: every task uses Responsible = Network Administrator,
Accountable = ISSM, Consulted = ISSO, Informed = AO/DAO -- the same
ROLE-CROSSWALK.md mapping reused for every operational-tasking role rather
than invented fresh.

JSIG relationship note: no row below cites a JSIG Control ID as its driver.
A few tasks operationally support (without being required by) a nearby
control family (config backup -> CP-9; firmware currency -> SI-2/RA-5;
AAA/SSH key currency -> IA-5/SC-12; HA/failover checks -> CP-9/CP-10);
that relationship is called out in prose only, in this file's intro,
never as a per-row citation.

Regenerate with:
    python3 execution-plan/tools/build_network_infra_tasking.py
"""
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))
from build_mrc_cards import load_patterns  # noqa: E402

TOOLS_DIR = os.path.dirname(__file__)
EXEC_PLAN_DIR = os.path.dirname(TOOLS_DIR)

CALENDAR_OUT = os.path.join(EXEC_PLAN_DIR, "NETWORK-INFRASTRUCTURE-TASKING.md")
CARDS_OUT_DIR = os.path.join(EXEC_PLAN_DIR, "mrc-cards-netinfra")

# (num, freq, task, system, role, pattern, tool)
NET_TASKS = [
    (1, "Daily", "Core switch/router interface error-rate and utilization review", "Network Infrastructure (Switches/Routers)", "Network Administrator", "A", "Network monitoring/SNMP platform (interface counters)"),
    (2, "Weekly", "Switch configuration backup verification", "Network Infrastructure (Switches/Routers)", "Network Administrator", "B", "Network device CLI / configuration management tool"),
    (3, "Weekly", "Router configuration backup verification", "Network Infrastructure (Switches/Routers)", "Network Administrator", "B", "Network device CLI / configuration management tool"),
    (4, "Weekly", "Firewall configuration and rule-set backup verification", "Network Infrastructure (Firewalls)", "Network Administrator", "B", "Firewall management console / configuration management tool"),
    (5, "Monthly", "Switch firmware/OS version currency review", "Network Infrastructure (Switches/Routers)", "Network Administrator", "B", "Network device CLI (firmware/version inventory)"),
    (6, "Monthly", "Router firmware/OS version currency review", "Network Infrastructure (Switches/Routers)", "Network Administrator", "B", "Network device CLI (firmware/version inventory)"),
    (7, "Monthly", "Firewall firmware/OS version currency review", "Network Infrastructure (Firewalls)", "Network Administrator", "B", "Firewall management console (firmware/version inventory)"),
    (8, "Monthly", "Core switch/router redundant pair (HA) failover readiness check", "Network Infrastructure (Switches/Routers)", "Network Administrator", "D", "Network device CLI (HA/failover test procedure)"),
    (9, "Monthly", "Firewall HA pair/cluster failover readiness check", "Network Infrastructure (Firewalls)", "Network Administrator", "D", "Firewall management console (HA/cluster failover test)"),
    (10, "Daily", "Network device out-of-band (OOB) management access health check", "Network Infrastructure (General)", "Network Administrator", "A", "Out-of-band management appliance / console server"),
    (11, "Monthly", "Network device AAA (TACACS+/RADIUS) authentication health check", "Network Infrastructure (General)", "Network Administrator", "A", "TACACS+/RADIUS AAA server"),
    (12, "Weekly", "Network device SNMP/syslog health check", "Network Infrastructure (General)", "Network Administrator", "A", "Network monitoring/SNMP platform, syslog server"),
    (13, "Monthly", "Spanning-tree/loop-prevention health review", "Network Infrastructure (Switches/Routers)", "Network Administrator", "B", "Network device CLI (spanning-tree diagnostics)"),
    (14, "Quarterly", "Network device SSH host-key and management-certificate currency check", "Network Infrastructure (General)", "Network Administrator", "B", "Network device CLI (SSH host key / certificate management)"),
    (15, "Weekly", "Core network hardware health check (fans, power supplies, temperature)", "Network Infrastructure (General)", "Network Administrator", "A", "Network device CLI / hardware management console (environmental sensors)"),
    (16, "Quarterly", "VLAN/trunk configuration consistency audit", "Network Infrastructure (Switches/Routers)", "Network Administrator", "B", "Network device CLI (VLAN/trunk configuration review)"),
]

RACI = {"accountable": "ISSM", "consulted": "ISSO", "informed": "AO/DAO"}


def render_calendar():
    lines = [
        "# Network Infrastructure Tasking Calendar — Switch/Router/Firewall Health",
        "",
        "> Generated by `execution-plan/tools/build_network_infra_tasking.py`. Do not hand-edit — edit `NET_TASKS` "
        "in that script and regenerate.",
        "",
        "## Purpose and scope",
        "",
        "[`GAP-ANALYSIS.md`](GAP-ANALYSIS.md) identified network infrastructure as the #1 uncovered area: neither "
        "[`MAINTENANCE-PLAN.md`](../MAINTENANCE-PLAN.md) (JSIG-driven) nor [`OPERATIONAL-TASKING.md`](OPERATIONAL-TASKING.md) "
        "(AD/Exchange/tool-stack/general Windows Server) has any tasking for the network device layer itself — "
        "switch, router, and firewall configuration backup, firmware currency, or HA/failover state. This is a "
        "third, additive calendar closing that specific gap only. It does not touch `MAINTENANCE-PLAN.md` or "
        "`OPERATIONAL-TASKING.md`.",
        "",
        "**No row below cites a JSIG Control ID as its driver** — none of these 16 tasks are formally required by a "
        "specific JSIG ODP. A handful operationally *support* the intent of a nearby control family without being "
        "required by it: configuration-backup tasks (#2–4) support CP-9's intent; firmware-currency review (#5–7) "
        "supports SI-2/RA-5's intent; AAA and SSH-key/certificate currency checks (#11, #14) support IA-5/SC-12's "
        "intent; HA/failover readiness checks (#8–9) support CP-9/CP-10's intent. Those are informational context, "
        "not formal citations, and are not repeated per-row in the table.",
        "",
        "**Tool naming:** no specific network device vendor has been established anywhere in this repository, so "
        "tool names below stay generic/vendor-agnostic (\"network device CLI\", \"firewall management console\") "
        "rather than inventing a vendor — unlike [`mrc-cards/`](mrc-cards/) and [`mrc-cards-ops/`](mrc-cards-ops/), "
        "which name real tools per an explicit documented exception for that specific tool stack.",
        "",
        "**RACI:** every task below uses Responsible = Network Administrator, Accountable = ISSM, Consulted = ISSO, "
        "Informed = AO/DAO — the same [`ROLE-CROSSWALK.md`](ROLE-CROSSWALK.md) mapping reused for every "
        "operational-tasking role rather than invented fresh.",
        "",
        "## Calendar",
        "",
        "| # | Frequency | Task | System | Responsible Role | Accountable | Consulted | Informed |",
        "|---|---|---|---|---|---|---|---|",
    ]
    for num, freq, task, system, role, pattern, tool in NET_TASKS:
        lines.append(f"| {num} | {freq} | {task} | {system} | {role} | {RACI['accountable']} | {RACI['consulted']} | {RACI['informed']} |")
    lines.append("")
    lines.append(f"Total tasks: **{len(NET_TASKS)}**. Actionable per-task cards: [`mrc-cards-netinfra/INDEX.md`](mrc-cards-netinfra/INDEX.md).")
    lines.append("")
    return "\n".join(lines)


def render_card(num, freq, task, system, role, pattern, tool, patterns):
    p = patterns[pattern]
    lines = []
    lines.append(f"# MRC-NET-{num:03d} — {task}")
    lines.append("")
    lines.append("> Generated by `execution-plan/tools/build_network_infra_tasking.py` from "
                 "`NETWORK-INFRASTRUCTURE-TASKING.md`. Do not hand-edit — regenerate after editing `NET_TASKS` "
                 "in the script.")
    lines.append("")
    lines.append("## 1. Identification")
    lines.append("")
    lines.append("| Field | Value |")
    lines.append("|---|---|")
    lines.append(f"| MRC Number | MRC-NET-{num:03d} |")
    lines.append(f"| Network Infrastructure Calendar Task # | [{num}](../NETWORK-INFRASTRUCTURE-TASKING.md#calendar) |")
    lines.append(f"| System | {system} |")
    lines.append(f"| Periodicity / Frequency | **{freq}** |")
    lines.append(f"| Primary Tool(s) | {tool} |")
    lines.append("")
    lines.append("## 2. References")
    lines.append("")
    lines.append("**JSIG relationship:** none — this is a pure network-infrastructure operational/functional-"
                 "health task, not a JSIG control requirement. See "
                 "[`NETWORK-INFRASTRUCTURE-TASKING.md`](../NETWORK-INFRASTRUCTURE-TASKING.md#purpose-and-scope) "
                 "for which tasks operationally support (without being required by) a nearby control family.")
    lines.append("")
    lines.append("**Other references:** [NETWORK-INFRASTRUCTURE-TASKING.md](../NETWORK-INFRASTRUCTURE-TASKING.md#calendar) (source row) · "
                 "[ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md) (Responsible/Accountable mapping) · "
                 "[ESCALATION-MATRIX.md](../templates/ESCALATION-MATRIX.md) (CAT-tier SLA/routing, if a finding "
                 "results in a security-relevant exception) · [GAP-ANALYSIS.md](../GAP-ANALYSIS.md) (why this "
                 "calendar exists)")
    lines.append("")
    lines.append("## 3. Personnel / RACI")
    lines.append("")
    lines.append("| Responsible (executes) | Accountable | Consulted | Informed |")
    lines.append("|---|---|---|---|")
    lines.append(f"| {role} | **{RACI['accountable']}** | {RACI['consulted']} | {RACI['informed']} |")
    lines.append("")
    lines.append("## 4. Safety / Handling Precautions")
    lines.append("")
    lines.append("No physical hazard is inherent to this task. Changes to production switch, router, or firewall "
                 "configuration (including failover/HA tests that may trigger an actual cutover) must follow the "
                 "organization's standard change-control/maintenance-window process. Do not export device "
                 "configuration, credentials, or diagnostic output to unauthorized media or systems.")
    lines.append("")
    lines.append("## 5. Procedure")
    lines.append("")
    lines.append(f"**Pattern {pattern} — {p['name']}** (assigned directly for this network-infrastructure task; no "
                 "prior runbook precedent exists since this task is new to the repository)")
    lines.append("")
    lines.append(p["intro"])
    lines.append("")
    for step in p["steps"]:
        lines.append(step)
    lines.append("")
    lines.append("## 6. Validation, Evidence, Findings, Escalation, Closure")
    lines.append("")
    lines.append("Full canonical language for these five sections is defined once in "
                 "[`runbooks/_EXECUTION-PATTERNS.md`](../runbooks/_EXECUTION-PATTERNS.md#standard-sections-610-shared-across-every-task-in-every-role-runbook-unless-a-task-explicitly-overrides-one) "
                 "and applies here too. Task-specific values for this card:")
    lines.append("")
    lines.append("| Field | Value |")
    lines.append("|---|---|")
    lines.append(f"| Reviewed By (Validation) | {RACI['accountable']} |")
    lines.append("| Repository Path (Evidence Package) | _fill in: local ticketing/GRC or file-share path used for this cycle_ |")
    lines.append("| Escalation Routing | If a check surfaces a security-relevant finding (not just an operational "
                 "outage), route it through [`ESCALATION-MATRIX.md`](../templates/ESCALATION-MATRIX.md)'s CAT tiers; "
                 "a purely operational/availability issue (e.g., a failed HA failover test, a full config-backup "
                 "job) follows the organization's standard IT incident process instead |")
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
    for old in os.listdir(CARDS_OUT_DIR):
        if old.startswith("MRC-NET-") and old.endswith(".md"):
            os.remove(os.path.join(CARDS_OUT_DIR, old))

    idx_lines = [
        "# Maintenance Requirement Cards (Network Infrastructure) — Master Index",
        "",
        "One actionable card per Network Infrastructure Tasking Calendar task (all "
        f"{len(NET_TASKS)}). Generated by `python3 execution-plan/tools/build_network_infra_tasking.py` from "
        "`NETWORK-INFRASTRUCTURE-TASKING.md` + `runbooks/_EXECUTION-PATTERNS.md`. Do not hand-edit individual cards.",
        "",
        "| MRC | Task | System | Frequency | Pattern |",
        "|---|---|---|---|---|",
    ]
    for num, freq, task, system, role, pattern, tool in NET_TASKS:
        fname = f"MRC-NET-{num:03d}.md"
        with open(os.path.join(CARDS_OUT_DIR, fname), "w", encoding="utf-8") as f:
            f.write(render_card(num, freq, task, system, role, pattern, tool, patterns))
        idx_lines.append(f"| [MRC-NET-{num:03d}]({fname}) | {task} | {system} | {freq} | Pattern {pattern} |")
    idx_lines.append("")

    with open(os.path.join(CARDS_OUT_DIR, "INDEX.md"), "w", encoding="utf-8") as f:
        f.write("\n".join(idx_lines))

    print(f"Wrote NETWORK-INFRASTRUCTURE-TASKING.md ({len(NET_TASKS)} tasks) and {len(NET_TASKS)} MRC-NET cards to {CARDS_OUT_DIR}")


if __name__ == "__main__":
    main()
