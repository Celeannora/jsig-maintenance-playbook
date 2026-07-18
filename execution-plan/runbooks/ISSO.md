# Information System Security Officer (ISSO) — Actionable Task Runbook

The ISSO is the operational-security-posture role defined in [JSIG §1.5.15](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md), sitting under the ISSM in day-to-day standing but assuming ISSM duties in the ISSM's absence, per [playbooks/roles/ISSO.md](../../playbooks/roles/ISSO.md). Executes 21 Master Calendar tasks directly, is Accountable for 17, Consulted on 53, Informed on 3 — see [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md) Part B for the full rollup.

## 1. Role Overview

The ISSO holds day-to-day, hands-on responsibility for an information system's operational security posture, including physical/environmental protection, personnel security, incident handling, and security training/awareness, working in close collaboration with the ISSM and ISO. The ISSO actively monitors the system and its environment — including SSP updates, change coordination, and audit-record review — and is appointed in writing by the responsible site authority. See [playbooks/roles/ISSO.md](../../playbooks/roles/ISSO.md) for the full role narrative, JSIG-cited duties, and key artifacts owned.

## 2. Task Index

Per [role_task_index.json](../tools/data/role_task_index.json), the ISSO is the **second-heaviest executing role** in the matrix after the ISSM. All 21 executing tasks below.

| # | Task | Family | Frequency | Control ID(s) | Pattern |
|---|---|---|---|---|---|
| 2 | Monitor system communications/security dashboards | SI | Continuous | SI-4 | A |
| 4 | Maintain IAVM directive compliance | SI | Continuous | SI-2, RA-5, CA-5 | C |
| 13 | Operate privacy incident response capability | SE | Continuous | SE-2 | Custom |
| 14 | Handle and monitor for security incidents (24/7) | IR | Continuous | IR-4, IR-5 | Custom |
| 17 | Provide incident status updates during active incident | IR | Daily (per-event) | IR-6 | Custom |
| 22 | Review and analyze system audit records | AU | Weekly | AU-6 | B |
| 25 | Update Plan of Action and Milestones (POA&M) | CA | Monthly | CA-5 | B |
| 26 | Assemble ConMon deliverable package | CA | Monthly | CA-7, CA-5, CM-8, RA-5 | B |
| 27 | Perform vulnerability scanning | RA | Monthly | RA-5 | A |
| 40 | Monitor/audit privacy control compliance | AR | Monthly | AR-4 | B |
| 46 | Review privileged account list and entitlements | AC | Quarterly | AC-2 | B |
| 47 | Reassess least-privilege/privileged-function assignments | AC | Quarterly | AC-6, AC-6(1) | B |
| 49 | Reassess/reevaluate privileged access tied to change | CM | Quarterly | CM-5(5) | B |
| 55 | Review publicly accessible content | AC | Quarterly | AC-22 | B |
| 56 | Review access-enforcement/flow-enforcement rule sets | AC | Quarterly | AC-3, AC-4 | B |
| 59 | Review protection of audit tools/information | AU | Quarterly | AU-9 | B |
| 60 | Review media access authorization list | MP | Quarterly | MP-2 | B |
| 67 | Review non-privileged/user account list | AC | Semi-annual | AC-2 | B |
| 68 | Test/exercise incident response capability (SAP default) | IR | Semi-annual | IR-3 | D |
| 84 | Review/update auditable events list | AU | Annual | AU-2 | B |
| 88 | Review Rules of Behavior acknowledgment | PL | Annual | PL-4 | B |

**Accountable-only tasks: none.** Cross-checking the 17 Accountable task numbers (2, 4\*, 22, 25, 26, 27\*, 40, 46, 47, 49\*, 55, 56\*, 59, 60, 67, 84\*, 88 — \*marks the 4 tasks where the ISSO executes but the ISSM instead holds Accountable) against the 21 executing tasks above shows every task where the ISSO is Accountable is also a task it executes. The brief's second table (Accountable-not-executing) therefore has zero rows for this role — a full re-check confirms all 17 Accountable-role tasks are already covered in the table above, and 4 executing tasks (13, 14, 17, 68) are executed by the ISSO but Accountable to the ISSM instead.

## 3. Preconditions

| Category | Requirement |
|---|---|
| Required Access | Read access to the local audit/log management system, the local vulnerability scanner's results, privileged/non-privileged account lists, physical/media access logs, and the local ticketing/GRC system's POA&M and ConMon tracking records |
| Required Tools | Local log management/SIEM-equivalent tool; local vulnerability scanner; local ticketing/GRC system; local IAVM/advisory-tracking tool; incident-tracking system |
| Roles/Permissions Needed | Account authority to review (not necessarily administer) privileged and non-privileged account lists; incident-handling authority; standing CCB seat when designated by the ISSM |

## 4. RACI Position Summary

As the role that both executes and is Accountable for 17 of its 21 executing tasks, the ISSO carries the second-largest hands-on operational load in the matrix (after the ISSM) and is its own sign-off authority for most of that work rather than routing to a separate Accountable party. On the remaining 4 executing tasks (13, 14, 17, 68 — privacy/security incident handling and IR exercises), the ISSM holds Accountable while the ISSO performs the hands-on work, reflecting the ISSM's overall incident-program ownership; the ISSO still reports these per [JSIG §1.5.15(f)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) but the ISSM signs off. The ISSO is also Consulted on 53 tasks — the largest Consulted footprint of any role — spanning nearly every control family, since most ISSM-executed and Privileged-User-executed tasks route through the ISSO for security-operations input before closure; this reflects the ISSO's deep day-to-day technical visibility into the system even where it is not the named Accountable party. Being Informed on only 3 tasks (all AT-family training-delivery tasks owned by the Training Manager/ISSM) is intentionally narrow — the ISSO is rarely a passive recipient in this matrix; it is either doing the work, signing off on it, or being asked for input before it closes. Per [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md), the "ISSO / SOC analyst" and "IR Team Lead (day-to-day execution)" operational titles both absorb into this role for task-runbook purposes; the ISSM retains "IR Team Lead (escalation and reporting authority)" and CCB-chair default, which is why several IR/CM tasks above show the ISSM as Accountable despite the ISSO doing the work.

## 5. Execution Procedures

### Task #2: Monitor system communications/security dashboards
- Pattern A (per [_EXECUTION-PATTERNS.md](_EXECUTION-PATTERNS.md)) — the automated tool is the local security dashboard/monitoring console; confirm continuous coverage and triage indicator-of-compromise alerts each cycle.

### Task #4: Maintain IAVM directive compliance
- Pattern C — authoritative source is the mirrored IAVM/advisory feed; compare deployed patch/mitigation state against each open directive and route gaps through change control.

### Task #13: Operate privacy incident response capability
- Custom (no Pattern fits an always-on operational capability rather than a periodic check): (1) Confirm the privacy incident-response capability (intake channel, on-call coverage) is staffed and reachable — Expected result: capability confirmed live; Capture: on-call roster/coverage confirmation; Stop/continue: if uncovered, escalate the gap to the ISSM immediately. (2) Receive and log any privacy incident report as it arrives — Expected result: every report logged with timestamp; Capture: incident log entry; Stop/continue: continue to Task #14/#17 handling if the report also constitutes a security incident. (3) Coordinate initial triage with the Information Owner/Steward (Accountable party) — Expected result: triage disposition recorded; Capture: triage notes; Stop/continue: continue. (4) File the cycle's coverage/incident log in the local ticketing/GRC system — Expected result: record filed; Capture: filed log; Stop/continue: cycle complete.

### Task #14: Handle and monitor for security incidents (24/7)
- Custom: (1) Maintain continuous incident-monitoring coverage — Expected result: monitoring confirmed active at all times; Capture: coverage/shift log; Stop/continue: if a coverage gap occurs, escalate to the ISSM immediately. (2) Upon detection, open an incident record and begin handling per the Incident Response Plan — Expected result: incident record opened with detection timestamp; Capture: incident record ID; Stop/continue: continue to Task #17 for status updates. (3) Report the incident to the ISSM per [JSIG §1.5.15(f)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) — Expected result: ISSM notified; Capture: notification timestamp; Stop/continue: continue. (4) Close out and log the incident record once resolved — Expected result: closure recorded; Capture: closed record; Stop/continue: cycle complete.

### Task #17: Provide incident status updates during active incident
- Custom: (1) Identify the active incident's designated Incident Commander and reporting cadence per [ESCALATION-MATRIX.md](../templates/ESCALATION-MATRIX.md) §5 — Expected result: cadence confirmed; Capture: cadence record; Stop/continue: continue. (2) Deliver a status update at each required interval covering current state, actions taken, and next steps — Expected result: update delivered on schedule; Capture: update log entry; Stop/continue: if an update is missed, escalate immediately rather than skipping to the next cycle. (3) Distribute the update to the Consulted/Informed parties named in the incident record — Expected result: distribution confirmed; Capture: distribution log; Stop/continue: continue until incident closure.

### Task #22: Review and analyze system audit records
- Pattern B — list under review is the weekly audit-record export; baseline is the prior cycle's reviewed-and-approved audit disposition.

### Task #25: Update Plan of Action and Milestones (POA&M)
- Pattern B — list under review is the current POA&M entries; baseline is the prior month's approved POA&M; every open finding gets a current status and suspense date.

### Task #26: Assemble ConMon deliverable package
- Pattern B — the "list" is the set of ConMon inputs (scan results, POA&M status, inventory) assembled against the ConMon plan's required-content baseline; disposition step becomes completeness verification rather than discrepancy triage.

### Task #27: Perform vulnerability scanning
- Pattern A — the automated tool is the local vulnerability scanner; triage each new finding to a CAT per [ESCALATION-MATRIX.md](../templates/ESCALATION-MATRIX.md) §1a.

### Task #40: Monitor/audit privacy control compliance
- Pattern B — list under review is the current privacy-control compliance state against the SSP's privacy-control baseline; coordinate disposition with the Information Owner/Steward (Accountable party).

### Task #46: Review privileged account list and entitlements
- Pattern B — list under review is the current privileged-account roster; baseline is the prior-quarter approved list plus current personnel/role status.

### Task #47: Reassess least-privilege/privileged-function assignments
- Pattern B — list under review is current privileged-function assignments; baseline is documented mission need for each assignment.

### Task #49: Reassess/reevaluate privileged access tied to change
- Pattern B — list under review is privileged access tied to a specific approved change; baseline is the CCB-approved change record; coordinated with the CCB.

### Task #55: Review publicly accessible content
- Pattern B — list under review is current publicly accessible content; baseline is the approved-for-release content policy.

### Task #56: Review access-enforcement/flow-enforcement rule sets
- Pattern B — list under review is the current access/flow-enforcement rule set; baseline is the approved rule-set configuration.

### Task #59: Review protection of audit tools/information
- Pattern B — list under review is audit-tool access permissions and integrity state; baseline is the approved audit-tool protection configuration.

### Task #60: Review media access authorization list
- Pattern B — list under review is the current media-access authorization roster; baseline is the prior-quarter approved list.

### Task #67: Review non-privileged/user account list
- Pattern B — list under review is the full non-privileged account roster; baseline is the prior semi-annual approved list plus current personnel status.

### Task #68: Test/exercise incident response capability (SAP default)
- Pattern D — test plan is the current approved Incident Response Plan exercise procedure; produces an after-action report and any resulting POA&M entries.

### Task #84: Review/update auditable events list
- Pattern B — list under review is the current auditable-events configuration; baseline is control requirements (AU-2) and any system changes since the last review.

### Task #88: Review Rules of Behavior acknowledgment
- Pattern B — list under review is the current signed Rules of Behavior acknowledgment roster; baseline is the full user population requiring acknowledgment.

## 6. Standard Validation, Evidence, Findings, Escalation, and Closure

This role follows the Standard Sections 6–10 (Validation, Evidence Package, Findings and Exceptions, Remediation and Escalation, Closure) defined in [_EXECUTION-PATTERNS.md](_EXECUTION-PATTERNS.md) for every task above. Role-specific delta: per [ESCALATION-MATRIX.md](../templates/ESCALATION-MATRIX.md) §4 and [VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md](../templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md) §4, the **ISSO is the named Accountable (final accept/reject) authority for every CAT III finding**, with a **180-day SLA** — the only role besides the ISSM and AO/DAO to hold terminal sign-off authority at any severity tier. For CAT I and CAT II findings surfaced during the tasks above, the ISSO remains the Responsible preparer/identifier but routes the decision to AO/DAO (CAT I) or ISSM (CAT II) rather than signing itself.

## Sources

- [playbooks/roles/ISSO.md](../../playbooks/roles/ISSO.md)
- [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md)
- [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md)
- [references/JSIG-source/section-1.5-roles-and-responsibilities.md § 1.5.15](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)
- [execution-plan/templates/ESCALATION-MATRIX.md](../templates/ESCALATION-MATRIX.md)
- [execution-plan/templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md](../templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md)
- [MAINTENANCE-PLAN.md §4](../../MAINTENANCE-PLAN.md)
