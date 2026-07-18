# Project Status

> Living status doc — **update this file at the end of every session** (unlike `TURNOVER.md`, which was a one-time, point-in-time handoff written 2026-07-17 and is now historical). This file supersedes `TURNOVER.md` as the "resume work here" entry point. `TURNOVER.md` is kept for historical record only.

## Quick orientation (read in this order)

1. `AGENTS.md` — repo conventions/instructions for any agent session.
2. `execution-plan/README.md` — the living onboarding guide: folder map, quick-start workflows, design principles.
3. This file (`STATUS.md`) — current state, in-flight work, next task.
4. `execution-plan/GAP-ANALYSIS.md` — canonical backlog of uncovered areas, in priority order.

## Where the project stands

Two generated, sign-off-ready maintenance calendars exist, each with matching Maintenance Requirement Cards (MRC):

- **`MAINTENANCE-PLAN.md`** — 110 tasks, every row traces to a real JSIG Control ID. **Do not edit directly** — standing constraint, repeated user instruction across multiple sessions.
- **`execution-plan/OPERATIONAL-TASKING.md`** — 34 tasks, non-JSIG IT-ops/functional-health tasking (AD/DC, Exchange, security-tool operational health, general Windows Server).
- Supporting generated artifacts: `execution-plan/RACI-MATRIX.md`, `execution-plan/CONTROL-LANGUAGE-CROSSWALK.md`, `execution-plan/tools/data/role_task_index.json`, `execution-plan/tools/data/control_title_index.json` (949 entries), `execution-plan/mrc-cards/` (110 cards), `execution-plan/mrc-cards-ops/` (34 cards), all 17 JSIG §1.5 role runbooks (`execution-plan/runbooks/`).
- `execution-plan/GAP-ANALYSIS.md` — hand-authored critique identifying structural weaknesses and 11 genuinely uncovered task categories (network infra, virtualization hosts, database layer, physical security equipment, power/environmental, personnel continuity, documentation currency, cross-domain solutions, patch-staging tier, wireless/RF, hardware support contracts).

All generated files follow a strict **generate-don't-hand-author** pattern: a Python script with a hardcoded task list + RACI/pattern assignment logic produces the calendar markdown + matching MRC cards + an `INDEX.md`. Never hand-edit a generated file — edit its source script and re-run.

Commit history (most recent work, newest first):
```
035971c Add GAP-ANALYSIS.md: coverage critique for JSIG + Operational calendars
6e3280f Add Operational Tasking calendar + MRC-OPS cards: non-JSIG sysadmin functional-health tasking
86b996d Add Maintenance Requirement Cards (MRC): one actionable card per Master Calendar task
```

## Standing constraints (must not violate)

- **`MAINTENANCE-PLAN.md`'s 110-task calendar must NOT be edited** (task list, frequencies, Control ID assignments).
- **Generate, don't hand-edit** any of: `RACI-MATRIX.md`, `CONTROL-LANGUAGE-CROSSWALK.md`, `role_task_index.json`, `mrc-cards/`, `mrc-cards-ops/`, `OPERATIONAL-TASKING.md`. Each has a header noting which script produces it.
- **Offline-only, vendor-agnostic**, except `mrc-cards/`, `mrc-cards-ops/`, and `OPERATIONAL-TASKING.md`, which name real tools (Windows Server/AD, Trellix/McAfee, Splunk, Nessus) as a documented, deliberate exception.
- **Run the repo-wide link audit before every commit** that adds/edits markdown links (snippet below). Expected result: exactly 1 pre-existing hit (`execution-plan/runbooks/_AUTHORING-BRIEF.md`'s template placeholder). Anything beyond that is a real regression.
- One commit per discrete deliverable; `git push origin main` immediately after each commit — do not batch pushes.

```python
import re, os
link_re = re.compile(r'\[[^\]]*\]\((\.{0,2}/?[^):\s]+\.md(?:#[^)]*)?)\)')
broken = []
for root, dirs, files in os.walk('.'):
    if '.git' in root: continue
    for fn in files:
        if not fn.endswith('.md'): continue
        path = os.path.join(root, fn)
        text = open(path, encoding='utf-8').read()
        for m in link_re.finditer(text):
            link = m.group(1).split('#')[0]
            if not link: continue
            resolved = os.path.normpath(os.path.join(root, link))
            if not os.path.isfile(resolved):
                broken.append((path, link, resolved))
print('Broken links found:', len(broken))
```

## Reusable code map

| Script | Key functions | Produces |
|---|---|---|
| `execution-plan/tools/build_raci_matrix.py` | `parse_calendar()`, `map_row(row)` | `RACI-MATRIX.md` |
| `execution-plan/tools/build_mrc_cards.py` | `load_patterns()`, `extract_pattern_assignments()`, `primary_tools(task_text, family)` | `mrc-cards/` |
| `execution-plan/tools/build_operational_tasking.py` | `OPS_TASKS` (hardcoded 34-task list), `render_calendar()`, `render_card()` — reuses `load_patterns()` | `OPERATIONAL-TASKING.md`, `mrc-cards-ops/` |
| `execution-plan/tools/build_control_title_index.py` | — | `data/control_title_index.json` (949 entries) |
| `execution-plan/tools/generate_variance.py` | auto-detects STIG (`V-\d+`) vs. CVE (`CVE-\d{4}-\d{4,}`) ID, routes to matching reference DB | `variance-records/*.md` |
| `execution-plan/tools/stig_reference_builder.py` | recursive zip extraction (`MAX_ZIP_DEPTH = 6`) | `data/stig_reference.json` |
| `execution-plan/tools/cve_reference_builder.py` | `fetch` / `fetch-list` / `mirror` / `mirror-update` | `data/cve_reference.json`, `data/cve_mirror.json` (gitignored) |

`ROLE-CROSSWALK.md` documents System/Network Administrator → Accountable=ISSM, Executing=Privileged User under ISSO supervision — reuse this model for any new calendar's RACI rather than inventing a new one.

## Implementation plan — next work (from `GAP-ANALYSIS.md` priority order)

Each item below follows the same generate-don't-hand-author shape as `build_operational_tasking.py`: a standalone script with a hardcoded task list + `render_calendar()`/`render_card()`, reusing `load_patterns()` and the RACI model from `ROLE-CROSSWALK.md`. Suggested build order:

1. **Network infrastructure health/config-backup tasking** (switches/routers/firewalls — zero coverage today; JSIG boundary-protection tasks #7/#56/#65 audit rule sets/logs, not the device layer).
   - New script: `execution-plan/tools/build_network_tasking.py` → `execution-plan/NETWORK-TASKING.md` + `execution-plan/mrc-cards-net/`.
   - Task seeds: config backup/versioning, firmware currency, HA/failover-state verification, ACL/rule-set drift check.
2. **Virtualization-host health tasking** (Hyper-V/VMware — host layer invisible if any DC/Exchange server is virtualized).
   - New script: `build_virtualization_tasking.py` → `VIRTUALIZATION-TASKING.md` + `mrc-cards-virt/`.
   - Task seeds: host resource utilization, datastore capacity, cluster failover test, snapshot-sprawl audit.
3. **Physical-security-equipment operational health** (parallel structure to Ops #22–24's tool-health checks, but for badge readers/cameras/IDS sensors rather than cyber tools).
   - Extend `build_operational_tasking.py`'s `OPS_TASKS` list (same file/calendar, new category) rather than a new file, since it's structurally identical to the existing tool-health pattern.
4. **Remaining gap-table items**, roughly in the order listed in `GAP-ANALYSIS.md`: database layer beyond Exchange, power/environmental infra (UPS/generator load-bank testing), personnel continuity/on-call tracking, documentation-currency as a recurring task, cross-domain-solution/guard-specific tasking, patch-staging-tier health, wireless/RF rogue-AP scanning, hardware support-contract expiration tracking.
5. **Structural weaknesses** (not new tasks, fixes to existing ones) — lower priority than new coverage, tackle after the above:
   - Validate calendar frequencies against real incident history/maintenance-window constraints instead of general-practice judgment calls.
   - Add a lightweight cross-task dependency model (e.g. a failed DCDIAG should flag/gate the GPO-replication check).
   - Deepen the three tool-health tasks (Ops #22–24) from "agent is alive" to "agent is *effective*" (DAT currency fleet-wide, correlation searches firing, credentialed scans actually succeeding).

### Suggested first action for whoever picks this up next

Start with item 1 (network infrastructure tasking) — it is the single largest, clearest-cut gap, and the pattern is now proven twice (`mrc-cards/`, `mrc-cards-ops/`), so a third pass should be fast. Copy `build_operational_tasking.py`'s structure rather than starting from scratch.

## Session budget / delegation note

Prefer direct `bash`/Python/`git` operations over spawning subagents (matches how this entire project has been built) unless a task is clearly large enough to warrant delegation. Stay budget-conscious; commit after each discrete step rather than batching.
