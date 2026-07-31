# Authoring Brief: Role Runbook Generation

> Working notes for producing `execution-plan/runbooks/<Role>.md` files. Not itself a runbook — delete or ignore for end-user onboarding; kept here only as the build record for how these files were produced, consistent with this repo's practice of documenting its own generation process (see `execution-plan/tools/build_raci_matrix.py`'s and `reference/research/_research_scripts/build_sources_ledger.py`'s header comments).

## Required inputs (read all of these before writing any role's file)

1. `execution-plan/tools/data/role_task_index.json` — your role's exact task lists (`executing`, `accountable`, `consulted`, `informed`), each task with `num`, `task`, `family`, `frequency`, `controls`, `responsible_raw`, `accountable`, `consulted`, `informed`. **This is the only source of truth for which Master Calendar tasks belong to a role — never invent a task or a control ID that isn't in this file.**
2. `execution-plan/runbooks/_EXECUTION-PATTERNS.md` — the 8 shared execution patterns (A–H) and the standardized Sections 6–10. Read in full.
3. `playbooks/roles/<Role-filename>.md` — existing narrative role playbook (mission, JSIG-cited duties, coordination interfaces, key artifacts owned). Source for the Role Overview section and for governance-only roles' event-driven actions.
4. `execution-plan/ROLE-CROSSWALK.md` and `execution-plan/RACI-MATRIX.md` — cross-reference for RACI framing language.
5. `reference/JSIG-source/section-1.5-roles-and-responsibilities.md` — verbatim JSIG role definitions, for citing the role's formal JSIG basis.
6. `execution-plan/templates/ESCALATION-MATRIX.md` and `execution-plan/templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md` — referenced, not repeated, in every runbook's escalation section.

## Required output structure for every `execution-plan/runbooks/<Role>.md`

```markdown
# <Role Full Name> — Actionable Task Runbook

One-paragraph intro: this role's JSIG position (cite reference/JSIG-source/section-1.5-roles-and-responsibilities.md),
its position in the org hierarchy per playbooks/roles/<file>.md, and a one-line count summary
("Executes N Master Calendar tasks directly, is Accountable for N, Consulted on N, Informed on N —
see execution-plan/RACI-MATRIX.md Part B for the full rollup.").

## 1. Role Overview
2-4 sentences from playbooks/roles/<file>.md: mission and key coordination interfaces. Link to the full playbook
for depth rather than re-deriving it: "See [playbooks/roles/<file>.md](../../playbooks/roles/<file>.md) for the
full role narrative, JSIG-cited duties, and key artifacts owned."

## 2. Task Index
One table, ALL tasks from role_task_index.json's `executing` list (if any), sorted by task # ascending:
| # | Task | Family | Frequency | Control ID(s) | Pattern |
Then a second, shorter table for `accountable`-only tasks (tasks in `accountable` but NOT in `executing` --
i.e. this role reviews/signs off but does not perform hands-on) with the same columns plus an "Oversight action"
column (one phrase: e.g. "Review evidence package and sign Validation within SLA").
If a role has ZERO executing and ZERO accountable tasks (true for several governance-tier roles), state this
explicitly and instead build a short table of that role's JSIG-cited event-driven governance actions pulled from
its playbook (2-6 rows), using Pattern H (Governance/Authorization Decision) as their execution pattern.

Pattern column: pick the single best-fit Pattern ID (A-H) from _EXECUTION-PATTERNS.md's "Applies to" descriptions
for each task. If a task genuinely does not fit any pattern (rare — mainly tight-SLA event-driven personnel/incident
notification tasks), write "Custom" and give it its own short 3-4 step procedure in Section 5 instead of forcing
a pattern fit. Do not force-fit a pattern that doesn't match; "Custom" is an accepted, correct answer for a
minority of tasks.

## 3. Preconditions (role-level, not per-task)
Short table: Required Access / Required Tools (generic, no vendor names) / Roles-Permissions Needed for this role
to perform ITS tasks generally. Pull from the nature of the tasks in the Task Index (e.g. an ISSO's tasks mostly
need log/audit-tool read access and STIG/scan-result review access).

## 4. RACI Position Summary
2-3 sentences: where this role sits overall (e.g. "As Accountable party on N tasks the ISSM does not execute
personally, review evidence and sign off within the SLA in ESCALATION-MATRIX.md rather than performing the task").
Cross-reference execution-plan/ROLE-CROSSWALK.md for how any operational-title delegation works for this role.

## 5. Execution Procedures
For each task in the Task Index's `executing` table: a small subsection per DISTINCT task —
### Task #<N>: <Task title>
- Pattern <ID> (per _EXECUTION-PATTERNS.md) — [one-line delta: what specifically is checked/reviewed for THIS
  task, e.g. "Applies Pattern A: the automated tool is the local malware-scanning engine; review its
  quarantine/alert queue for the cycle."]
- If Pattern = Custom: write the 3-4 step procedure directly here in the same numbered
  Step — Expected result — Capture — Stop/continue format as _EXECUTION-PATTERNS.md.
Do NOT re-write out the full generic Pattern steps for every task — one line naming the Pattern and the
task-specific delta is correct and sufficient; the reader follows the cited Pattern's numbered steps in
_EXECUTION-PATTERNS.md with this delta substituted in.

For each task in the Task Index's `accountable`-only table, no subsection needed — the Oversight Action
column in the table itself is sufficient (do not create a full subsection for review-only tasks).

## 6. Standard Validation, Evidence, Findings, Escalation, and Closure
One short paragraph: "This role follows the Standard Sections 6–10 (Validation, Evidence Package, Findings and
Exceptions, Remediation and Escalation, Closure) defined in [_EXECUTION-PATTERNS.md](_EXECUTION-PATTERNS.md) for
every task above." (Link to the file only — do not rely on a heading anchor fragment, since en-dash slugification
is inconsistent across renderers.) Then list ONLY any role-specific deltas that genuinely differ from the standard (e.g. a
role that is itself the final Approver rather than routing to someone else, or a role with a shorter/longer
retention requirement than the default) — most roles will have zero or one delta here. Do not repeat the
standard sections' content.

## Sources
Bullet list with markdown links: playbooks/roles/<file>.md, RACI-MATRIX.md, ROLE-CROSSWALK.md, the specific
JSIG section-1.5 citation, MAINTENANCE-PLAN.md §4.
```

## Hard rules

- **Never fabricate a task, control ID, or frequency that isn't in `role_task_index.json`.** If the JSON says a role has 0 executing tasks, the runbook says 0 executing tasks — do not invent Master Calendar line items to fill space.
- **Never reference a cloud or SaaS product by name.** Generic terms only ("local ticketing/GRC system," "local vulnerability scanner"), per the template's vendor-agnostic rule.
- **Verify every internal markdown link resolves** (relative paths from `execution-plan/runbooks/<file>.md`: `../` reaches `execution-plan/`, `../../` reaches the repo root) before finishing.
- **Keep the file readable, not maximal.** The point of the Pattern Library is to keep these runbooks short and genuinely usable — a role with 30 executing tasks should produce a file with ~30 short one-line-delta subsections, not 30 fully-spelled-out 6-step procedures.
- Output filenames match the existing `playbooks/roles/` slug exactly (e.g. `Information-Owner-Steward.md`, `Agency-Component-Head.md`, `Risk-Executive-Function.md`, plain `AO.md`/`DAO.md`/`CIO.md`/`CISO.md`/`CCP.md`/`ISO.md`/`ISSM.md`/`ISSO.md`/`ISSE.md`/`SCA.md`/`PSO.md`/`MBO.md`/`Privileged-Users.md`/`General-Users.md`).
