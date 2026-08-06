#!/usr/bin/env python3
"""
build_mrc_cards.py

Generates one Maintenance Requirement Card (MRC) -- a self-contained,
Navy-PMS-style actionable task card -- per Master Calendar task (110 total)
in execution-plan/mrc-cards/master/MRC-<###>.md, plus an INDEX.md. That
INDEX.md also cross-links the mrc-cards/ops/ (34 cards, from
build_operational_tasking.py) and mrc-cards/network-infra/ (16 cards, from
build_network_infra_tasking.py) tables below its own 110-row table, so it
serves as a single combined 160-card index across all three families --
each family still keeps its own authoritative INDEX.md as well.

Each card is GENERATED, not hand-authored, from the same sources of truth
as everything else in execution-plan/:
  - MAINTENANCE-PLAN.md Sec 4 (task, family, frequency, Control ID(s), RACI)
    via build_raci_matrix.py's parse_calendar()/map_row()
  - data/control_title_index.json (real verbatim JSIG control titles)
  - runbooks/_EXECUTION-PATTERNS.md (the 8 generic execution patterns A-H
    plus the shared Sections 6-10: Validation, Evidence Package, Findings
    and Exceptions, Remediation and Escalation, Closure)
  - execution-plan/runbooks/<Role>.md's own "## 5. Execution Procedures"
    sections, where a task already has an authored Pattern-ID assignment
    (preferred -- reviewed/authored data) or a Custom procedure. Tasks not
    covered by any runbook fall back to a keyword heuristic
    (documented in PATTERN_KEYWORD_RULES below), the same way
    FAMILY_RACI_DEFAULTS in build_raci_matrix.py documents its own
    judgment calls.

ENVIRONMENT-SPECIFIC TOOL NAMES: unlike the rest of execution-plan/ (which
is deliberately vendor-agnostic per its Design Principles), these MRC cards
name real tools per user instruction, for one specific environment:
Windows Server/Active Directory domain, Trellix/McAfee HBSS-style
endpoint suite, Splunk, and Nessus. See TOOL_KEYWORD_RULES /
FAMILY_TOOL_DEFAULTS below. If your organization runs different tools,
edit those two structures and regenerate -- do not hand-edit the cards.

Regenerate any time with:
    python3 execution-plan/tools/build_mrc_cards.py
(Run this AFTER build_raci_matrix.py / build_control_title_index.py if
you've edited the calendar, crosswalk, or a family extraction file.)
"""
import json
import os
import re
import sys

sys.path.insert(0, os.path.dirname(__file__))
from build_raci_matrix import map_row, parse_calendar  # noqa: E402

TOOLS_DIR = os.path.dirname(__file__)
EXEC_PLAN_DIR = os.path.dirname(TOOLS_DIR)
REPO_ROOT = os.path.dirname(EXEC_PLAN_DIR)

TITLE_INDEX_FILE = os.path.join(TOOLS_DIR, "data", "control_title_index.json")
PATTERNS_FILE = os.path.join(EXEC_PLAN_DIR, "runbooks", "_EXECUTION-PATTERNS.md")
RUNBOOKS_DIR = os.path.join(EXEC_PLAN_DIR, "runbooks")
OUT_DIR = os.path.join(EXEC_PLAN_DIR, "mrc-cards", "master")

ID_TOKEN_RE = re.compile(r"[A-Z]{2}-\d+(?:\(\d+\))?")

# ---------------------------------------------------------------------------
# Tool-stack mapping (organization-specific; see module docstring)
# ---------------------------------------------------------------------------
# Checked in order against the lowercased task text; first match wins.
TOOL_KEYWORD_RULES = [
    (r"convene|board|ccb|change control", "Local GRC/ticketing/documentation repository (meeting minutes / decision record)"),
    (r"malware|virus", "Trellix/McAfee Endpoint Security (HBSS) + ePO console"),
    (r"iavm|vulnerabilit|flaw remediation|patch|signature", "Nessus (vulnerability scanning); WSUS (Windows patch deployment)"),
    (r"audit record|audit log|auditable event", "Splunk (SIEM / audit log aggregation); Windows Event Log (source)"),
    (r"dashboard|monitor", "Splunk (security dashboards / SIEM)"),
    (r"account|access|privileged|password|logon", "Active Directory / Windows Server (account & access management)"),
    (r"backup|contingency|recovery|reconstitution", "Enterprise backup solution (e.g. Veritas NetBackup or Veeam Backup & Replication -- organization-specific, see AGENTS.md rule 8)"),
    (r"training|awareness", "Organization LMS / training-tracking system (organization-specific; no dedicated tool identified)"),
    (r"network|boundary|firewall|communication", "Windows Server network configuration; Trellix/McAfee network security modules (if deployed)"),
    (r"media|removable|sanitiz", "Windows Server / BitLocker (media protection controls)"),
    (r"physical|visitor|badge|tempest", "Physical security system (non-IT; organization-specific)"),
    (r"software list|asset inventory|configuration item|baseline", "Trellix/McAfee ePO (software/asset inventory); Active Directory Group Policy (baseline config)"),
]
# Family-level fallback when no keyword rule matches.
FAMILY_TOOL_DEFAULTS = {
    "AC": "Active Directory / Windows Server (account & access management)",
    "IA": "Active Directory / Windows Server (identity & authentication)",
    "AU": "Splunk (SIEM / log aggregation); Windows Event Log (source)",
    "CM": "Active Directory Group Policy (baseline config); Trellix/McAfee ePO (software inventory)",
    "SI": "Trellix/McAfee Endpoint Security (HBSS) + ePO console; Nessus (vulnerability scanning); Splunk (monitoring)",
    "RA": "Nessus (vulnerability/risk scanning)",
    "CA": "Nessus (technical assessment); Splunk (continuous monitoring dashboards)",
    "IR": "Splunk (incident detection / SIEM)",
}
DEFAULT_TOOL = "Local GRC/ticketing/documentation repository (organization-specific; no dedicated technical tool identified for this task)"


def primary_tools(task_text, family):
    lowered = task_text.lower()
    for pattern, tool in TOOL_KEYWORD_RULES:
        if re.search(pattern, lowered):
            return tool
    return FAMILY_TOOL_DEFAULTS.get(family, DEFAULT_TOOL)


# ---------------------------------------------------------------------------
# Pattern keyword fallback (for the rare task not covered by any runbook's
# "## 5. Execution Procedures" section)
# ---------------------------------------------------------------------------
PATTERN_KEYWORD_RULES = [
    (r"scan|monitor|dashboard|malware", "A"),
    (r"review|reassess|verify.*list|compliance", "B"),
    (r"update|patch|signature|rotat", "C"),
    (r"test|exercise|drill", "D"),
    (r"review/update|revise|policy|plan\b", "E"),
    (r"training|awareness", "F"),
    (r"retention|dispos|purge|destroy", "G"),
    (r"authoriz|decision|board|approve", "H"),
]


def pattern_keyword_fallback(task_text):
    lowered = task_text.lower()
    for pattern, letter in PATTERN_KEYWORD_RULES:
        if re.search(pattern, lowered):
            return letter
    return "B"  # safest generic default: manual review


# ---------------------------------------------------------------------------
# Load supporting data
# ---------------------------------------------------------------------------
def load_title_index():
    with open(TITLE_INDEX_FILE, encoding="utf-8") as f:
        return json.load(f)


def resolve_titles(controls_str, title_index):
    out = []
    for tok in ID_TOKEN_RE.findall(controls_str or ""):
        entry = title_index.get(tok)
        if entry:
            out.append({"id": tok, "title": entry["title"], "source": entry["source"]})
        else:
            out.append({"id": tok, "title": None, "source": None})
    return out


def load_patterns():
    """Parse _EXECUTION-PATTERNS.md into {letter: (name, intro, [steps])}."""
    with open(PATTERNS_FILE, encoding="utf-8") as f:
        text = f.read()
    patterns = {}
    pattern_re = re.compile(
        r"^## Pattern ([A-H]) — (.+?)\n\n(.+?)\n\n((?:\d+\..+\n?)+)",
        re.MULTILINE,
    )
    for m in pattern_re.finditer(text):
        letter, name, intro, steps_block = m.groups()
        steps = [s.strip() for s in steps_block.strip().split("\n") if s.strip()]
        patterns[letter] = {"name": name.strip(), "intro": intro.strip(), "steps": steps}
    return patterns


def extract_pattern_assignments():
    """
    Scan every runbooks/<Role>.md (skip files starting with '_') for
    '### Task(s) #N[, #M...]: Title' headers followed by a '- Pattern X ...'
    or '- Custom ...' line inside '## 5. Execution Procedures'. Returns
    {task_num_str: {"pattern": letter_or_None, "note": full_bullet_text,
                     "custom": bool, "source": role_filename}}.
    """
    assigned = {}
    header_re = re.compile(r"^### Tasks?\s+((?:#\d+(?:,\s*)?)+):.*$")
    for fname in sorted(os.listdir(RUNBOOKS_DIR)):
        if not fname.endswith(".md") or fname.startswith("_"):
            continue
        path = os.path.join(RUNBOOKS_DIR, fname)
        with open(path, encoding="utf-8") as f:
            lines = f.read().splitlines()
        i = 0
        while i < len(lines):
            m = header_re.match(lines[i])
            if m:
                nums = re.findall(r"#(\d+)", m.group(1))
                # find the next non-blank line as the pattern/custom note
                j = i + 1
                while j < len(lines) and not lines[j].strip():
                    j += 1
                note = lines[j].strip() if j < len(lines) else ""
                pm = re.search(r"Pattern ([A-H])", note)
                is_custom = note.lower().startswith("- custom")
                for n in nums:
                    if n not in assigned:
                        assigned[n] = {
                            "pattern": pm.group(1) if pm else None,
                            "note": note.lstrip("- ").strip(),
                            "custom": is_custom,
                            "source": fname,
                        }
            i += 1
    return assigned


# ---------------------------------------------------------------------------
# Card rendering
# ---------------------------------------------------------------------------
def render_card(row, mapped, pattern_letter, pattern_note, is_custom, pattern_source,
                 title_index, patterns, num_int):
    num = row["num"]
    task = row["task"]
    family = row["family"]
    freq = row["freq"]
    controls_raw = row["controls"]
    titles = resolve_titles(controls_raw, title_index)

    control_lines = []
    for c in titles:
        if c["title"]:
            control_lines.append(f"- **{c['id']}** — {c['title']} ([source]({os.path.relpath(os.path.join(REPO_ROOT, c['source']), OUT_DIR)}))")
        else:
            control_lines.append(f"- **{c['id']}** — title not resolved (see [CONTROL-LANGUAGE-CROSSWALK.md](../../CONTROL-LANGUAGE-CROSSWALK.md))")
    if not control_lines:
        control_lines = [f"- Raw calendar citation: {controls_raw or '(none)'}"]

    tools = primary_tools(task, family)

    lines = []
    lines.append(f"# MRC-{num_int:03d} — {task}")
    lines.append("")
    lines.append("> Generated by `execution-plan/tools/build_mrc_cards.py` from `MAINTENANCE-PLAN.md` Sec 4, "
                 "`data/control_title_index.json`, and `runbooks/_EXECUTION-PATTERNS.md`. Do not hand-edit -- "
                 "regenerate after editing a source file. This card names specific tools "
                 "(Windows Server/AD, Trellix/McAfee HBSS, Splunk, Nessus) per your environment; "
                 "the rest of `execution-plan/` remains vendor-agnostic by design.")
    lines.append("")
    lines.append("## 1. Identification")
    lines.append("")
    lines.append("| Field | Value |")
    lines.append("|---|---|")
    lines.append(f"| MRC Number | MRC-{num_int:03d} |")
    lines.append(f"| Master Calendar Task # | [{num}](../../RACI-MATRIX.md#part-a--task-level-raci-all-110-master-calendar-tasks) |")
    lines.append(f"| Family | {family} |")
    lines.append(f"| Periodicity / Frequency | **{freq}** |")
    lines.append(f"| Primary Tool(s) | {tools} |")
    lines.append("")
    lines.append("## 2. References")
    lines.append("")
    lines.append("**Control ID(s) and real verbatim JSIG title(s):**")
    lines.append("")
    lines.extend(control_lines)
    lines.append("")
    lines.append("**Other references:** [MAINTENANCE-PLAN.md Sec 4](../../../MAINTENANCE-PLAN.md#4-master-consolidated-calendar) "
                 "(source row) · [RACI-MATRIX.md](../../RACI-MATRIX.md) (full RACI) · "
                 "[ESCALATION-MATRIX.md](../../templates/ESCALATION-MATRIX.md) (CAT-tier SLA/routing)")
    lines.append("")
    lines.append("## 3. Personnel / RACI")
    lines.append("")
    lines.append("| Responsible (executes) | Accountable | Consulted | Informed |")
    lines.append("|---|---|---|---|")
    lines.append(f"| {mapped['responsible']} | **{mapped['accountable']}** | {mapped['consulted']} | {mapped['informed']} |")
    lines.append("")
    lines.append("## 4. Safety / Handling Precautions")
    lines.append("")
    lines.append("No physical hazard is inherent to this task. Standard information-handling precautions apply: "
                 "treat all captured evidence per the system's classification/handling requirement; do not export "
                 "artifacts to unauthorized media or systems; if this task's execution requires touching a "
                 "production system, follow the organization's standard change-control/maintenance-window process.")
    lines.append("")
    lines.append("## 5. Procedure")
    lines.append("")
    if is_custom:
        lines.append(f"*Authored procedure (from `runbooks/{pattern_source}`, not a generic pattern):*")
        lines.append("")
        lines.append(pattern_note)
    elif pattern_letter and pattern_letter in patterns:
        p = patterns[pattern_letter]
        source_note = f" (assignment from `runbooks/{pattern_source}`)" if pattern_source else " (keyword-heuristic default assignment -- verify before relying on this for an untested task)"
        lines.append(f"**Pattern {pattern_letter} — {p['name']}**{source_note}")
        lines.append("")
        lines.append(p["intro"])
        lines.append("")
        for step in p["steps"]:
            lines.append(step)
    else:
        lines.append("*No pattern resolved -- treat as Pattern B (Manual Review) pending authoring.*")
    lines.append("")
    lines.append("## 6. Validation, Evidence, Findings, Escalation, Closure")
    lines.append("")
    lines.append("Full canonical language for these five sections is defined once in "
                 "[`runbooks/_EXECUTION-PATTERNS.md`](../../runbooks/_EXECUTION-PATTERNS.md#standard-sections-610-shared-across-every-task-in-every-role-runbook-unless-a-task-explicitly-overrides-one) "
                 "and applies to every card. Task-specific values for this card:")
    lines.append("")
    lines.append("| Field | Value |")
    lines.append("|---|---|")
    lines.append(f"| Reviewed By (Validation) | {mapped['accountable']} |")
    lines.append("| Repository Path (Evidence Package) | _fill in: local ticketing/GRC or file-share path used for this cycle_ |")
    lines.append("| Escalation Routing | CAT I → AO/DAO · CAT II → ISSM · CAT III → ISSO (ISSM consulted at every tier) |")
    lines.append(f"| Next Due Date (Closure) | This task's frequency (**{freq}**) advanced one cycle from the Actual Completion Date below |")
    lines.append("")
    lines.append("## 7. Sign-Off")
    lines.append("")
    lines.append("| Role | Name | Signature | Date |")
    lines.append("|---|---|---|---|")
    lines.append(f"| Preparer ({mapped['responsible']}) | | | |")
    lines.append(f"| Reviewer/Approver ({mapped['accountable']}) | | | |")
    lines.append("")
    lines.append("| Cycle Metadata | Value |")
    lines.append("|---|---|")
    lines.append("| Actual Completion Date | |")
    lines.append("| Findings This Cycle (Y/N, count) | |")
    lines.append("| Tracking/POA&M ID(s), if any | |")
    lines.append("")
    return "\n".join(lines)


def _other_family_task_lists():
    """
    Lazily import OPS_TASKS/NET_TASKS (+ their output dirs) from the other two
    builder scripts, so the master INDEX.md can list all 160 cards across all
    three families in one place. Must be a *function-local* import (not a
    module-level one) -- both build_operational_tasking.py and
    build_network_infra_tasking.py import `load_patterns` back from this
    module, so a top-level import here would be circular. By the time main()
    calls this, this module is already fully loaded, so the round-trip import
    resolves cleanly.
    """
    from build_operational_tasking import OPS_TASKS, CARDS_OUT_DIR as OPS_DIR
    from build_network_infra_tasking import NET_TASKS, CARDS_OUT_DIR as NET_DIR
    return OPS_TASKS, OPS_DIR, NET_TASKS, NET_DIR


def _family_index_section(title, calendar_name, tasks, prefix, family_dir, generator_note):
    """Render one '## <Family> Tasking Cards' section for the combined index."""
    rel_dir = os.path.relpath(family_dir, OUT_DIR).replace(os.sep, "/")
    lines = [
        f"## {title}",
        "",
        f"One actionable card per {calendar_name} Calendar task "
        f"(all {len(tasks)}). {generator_note} Do not hand-edit individual cards -- edit the "
        f"task list in that script and regenerate. Family-native index: "
        f"[{rel_dir}/INDEX.md]({rel_dir}/INDEX.md).",
        "",
        "| MRC | Task | System | Frequency | Pattern |",
        "|---|---|---|---|---|",
    ]
    for num, freq, task, system, role, pattern, tool in tasks:
        lines.append(f"| [{prefix}-{num:03d}]({rel_dir}/{prefix}-{num:03d}.md) | {task} | {system} | {freq} | Pattern {pattern} |")
    lines.append("")
    return lines


# Cards hand-authored to a first-pass, sourced Draft level (see AGENTS.md
# rule 8 and mrc-cards/README.md's status matrix). Populated incrementally
# as the rough-draft authoring pass proceeds; skipped by the generator so
# regeneration never clobbers hand-authored Section 5 content. Keep in sync
# with DRAFT_STATUS_OVERRIDES / GUIDE_STATUS_OVERRIDES in
# /home/user/workspace/build_mrc_status_readme.py.
DRAFT_CARDS = {
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
    11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
    21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
    31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
    41, 42, 43, 44, 45, 46, 47, 48, 49, 50,
    51, 52, 53, 54, 55, 56, 57, 58, 59, 60,
    61, 62, 63, 64, 65, 66, 67, 68, 69, 70,
}


def main():
    rows = parse_calendar()
    title_index = load_title_index()
    patterns = load_patterns()
    assigned = extract_pattern_assignments()
    ops_tasks, ops_dir, net_tasks, net_dir = _other_family_task_lists()
    combined_total = len(rows) + len(ops_tasks) + len(net_tasks)

    os.makedirs(OUT_DIR, exist_ok=True)
    draft_filenames = {f"MRC-{n:03d}.md" for n in DRAFT_CARDS}
    for old in os.listdir(OUT_DIR):
        if old.startswith("MRC-") and old.endswith(".md") and old not in draft_filenames:
            os.remove(os.path.join(OUT_DIR, old))

    from_runbook = 0
    heuristic = 0
    index_rows = []

    for row in rows:
        num = row["num"]
        num_int = int(num)
        mapped = map_row(row)
        info = assigned.get(num)
        if info:
            pattern_letter = info["pattern"]
            pattern_note = info["note"]
            is_custom = info["custom"]
            pattern_source = info["source"]
            from_runbook += 1
        else:
            pattern_letter = pattern_keyword_fallback(row["task"])
            pattern_note = None
            is_custom = False
            pattern_source = None
            heuristic += 1

        fname = f"MRC-{num_int:03d}.md"
        if num_int in DRAFT_CARDS:
            # Hand-authored Draft content -- do not touch the file, just index it.
            pattern_display = "Draft (hand-authored)"
        else:
            card_text = render_card(
                row, mapped, pattern_letter, pattern_note, is_custom, pattern_source,
                title_index, patterns, num_int,
            )
            with open(os.path.join(OUT_DIR, fname), "w", encoding="utf-8") as f:
                f.write(card_text)
            pattern_display = "Custom" if is_custom else (f"Pattern {pattern_letter}" if pattern_letter else "unresolved")

        index_rows.append((num_int, row["task"], row["family"], row["freq"], pattern_display,
                            "runbook" if pattern_source or info else "heuristic", fname))

    index_rows.sort(key=lambda r: r[0])
    idx_lines = [
        "# Maintenance Requirement Cards (MRC) — Master Index",
        "",
        f"One actionable MRC-style card per Master Calendar task (all 110). Generated by "
        f"`python3 execution-plan/tools/build_mrc_cards.py` from `MAINTENANCE-PLAN.md` Sec 4, "
        f"`data/control_title_index.json`, and `runbooks/_EXECUTION-PATTERNS.md`. "
        f"Do not hand-edit individual cards, EXCEPT cards listed in `DRAFT_CARDS` in that "
        f"script, which have been hand-upgraded to Draft status per "
        f"[AGENTS.md](../../AGENTS.md) rule 8 and are intentionally skipped by the generator "
        f"-- see [`mrc-cards/README.md`](../README.md) for the Stub/Draft/Guide tracking matrix.",
        "",
        f"Pattern assignment source: **{from_runbook}** tasks resolved from an existing runbook's authored "
        f"Execution Procedures section; **{heuristic}** tasks had no runbook entry and fall back to a keyword "
        f"heuristic (`PATTERN_KEYWORD_RULES` in the script) -- review those before relying on them operationally.",
        "",
        f"This file also indexes the Operational Tasking ({len(ops_tasks)} cards) and Network Infrastructure "
        f"Tasking ({len(net_tasks)} cards) families below, for a combined **{combined_total}**-card index across "
        f"all three families in this repository.",
        "",
        "| MRC | Task | Family | Frequency | Pattern | Assignment Source |",
        "|---|---|---|---|---|---|",
    ]
    for num_int, task, family, freq, pattern_display, src, fname in index_rows:
        idx_lines.append(f"| [MRC-{num_int:03d}]({fname}) | {task} | {family} | {freq} | {pattern_display} | {src} |")
    idx_lines.append("")

    idx_lines.extend(_family_index_section(
        "Operational Tasking Cards (Active Directory / Exchange / Windows Server stack)",
        "Operational Tasking", ops_tasks, "MRC-OPS", ops_dir,
        "Generated by `python3 execution-plan/tools/build_operational_tasking.py` from "
        "`OPERATIONAL-TASKING.md` + `runbooks/_EXECUTION-PATTERNS.md`.",
    ))
    idx_lines.extend(_family_index_section(
        "Network Infrastructure Tasking Cards",
        "Network Infrastructure Tasking", net_tasks, "MRC-NET", net_dir,
        "Generated by `python3 execution-plan/tools/build_network_infra_tasking.py` from "
        "`NETWORK-INFRASTRUCTURE-TASKING.md` + `runbooks/_EXECUTION-PATTERNS.md`.",
    ))

    with open(os.path.join(OUT_DIR, "INDEX.md"), "w", encoding="utf-8") as f:
        f.write("\n".join(idx_lines))

    print(f"Wrote {len(rows)} MRC cards to {OUT_DIR}")
    print(f"  from runbook-authored assignment: {from_runbook}")
    print(f"  from keyword heuristic fallback:  {heuristic}")
    print(f"  INDEX.md also links {len(ops_tasks)} ops + {len(net_tasks)} network-infra cards "
          f"({combined_total} total)")


if __name__ == "__main__":
    main()
