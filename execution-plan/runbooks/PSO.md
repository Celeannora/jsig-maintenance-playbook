# Program Security Officer (PSO) — Actionable Task Runbook

The PSO is defined in [JSIG §1.5.9](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) by reference only — to DoDM 5205.07, SAP Security Manual, all volumes — with the substantive PSO duty list established outside JSIG's own text; per [playbooks/roles/PSO.md](../../playbooks/roles/PSO.md), the PSO is the program-security authority the AO coordinates all assessments with, and the facility/personnel-security counterpart to the ISSM/ISSO's technical-security chain. Executes 17 Master Calendar tasks directly, is Accountable for 17, Consulted on 0, Informed on 1 — see [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md) Part B for the full rollup.

For the real verbatim JSIG title behind any Control ID cited in this runbook, see [CONTROL-LANGUAGE-CROSSWALK.md](../CONTROL-LANGUAGE-CROSSWALK.md), which reconciles every Control ID in the Master Calendar against the full verbatim JSIG family extractions.

## 1. Role Overview

The PSO owns program-level physical security, facility security (SAPF access, environmental controls, TEMPEST/TSCM), and personnel security (clearance actions, access agreements, position risk designations) — the functions [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md) maps from the "Facility Security Officer" and "Personnel Security Officer" operational titles. The PSO coordinates with the AO on assessment scheduling, advises the SCA/ISO on impact-level determinations, and coordinates with the ISSM on external/interconnected-system approvals. See [playbooks/roles/PSO.md](../../playbooks/roles/PSO.md) for the full role narrative, JSIG-cited duties, and key artifacts owned.

## 2. Task Index

Per [role_task_index.json](../tools/data/role_task_index.json), the PSO's executing-task set and Accountable-task set are identical (17 tasks each) — the PSO both performs and signs off on all 17 of its own tasks, with one exception noted below.

| # | Task | Family | Frequency | Control ID(s) | Pattern |
|---|---|---|---|---|---|
| 12 | Monitor temperature/humidity environmental controls | PE | Continuous | PE-14 | A |
| 18 | Notify account manager on termination/transfer/need-to-know change (8–24 hr window) | AC | Daily (per-event) | AC-2 | Custom |
| 19 | Process termination access-revocation actions (≤24 hr) | PS | Daily (per-event) | PS-4 | Custom |
| 20 | Process transfer access-reassessment actions (≤24 hr) | PS | Daily (per-event) | PS-5 | Custom |
| 31 | Review physical access logs | PE | Monthly | PE-6 | B |
| 32 | Review visitor access records | PE | Monthly | PE-8 | B |
| 33 | Review Authorized Access List for restricted/SAPF areas | PE | Monthly | PE-2, PE-3 | B |
| 39 | Verify media storage physical/environmental controls | MP | Monthly | MP-4 | A |
| 78 | Review/re-sign personnel access agreements | PS | Annual | PS-6 | B |
| 86 | Inventory physical access devices; change combinations/keys | PE | Annual | PE-3 | C |
| 92 | Review position risk designations | PS | Annual | PS-2 | B |
| 100 | Verify TEMPEST/information-leakage countermeasures (SAP-specific) | PE | Annual | PE-19 | A |
| 101 | Test fire detection/suppression and inspect water-damage risk | PE | Annual | PE-13, PE-15 | D |
| 102 | Review third-party/contractor personnel security compliance | PS | Annual | PS-7 | B |
| 107 | Retain visitor access records (1–5 years per source) | PE | Multi-year / retention | PE-8 | G |
| 109 | Track and initiate personnel reinvestigations | PS | Periodic (DoD/IC cycle) | PS-3 | B |
| 110 | Conduct Technical Surveillance Countermeasures Survey | RA | Periodic (facility policy) | RA-6 | D |

**Accountable-only tasks: none in the strict sense** — the Accountable list contains the same 17 task numbers as the Executing list above. **Important exception:** Task #18's `accountable` field in [role_task_index.json](../tools/data/role_task_index.json) is **ISSM**, not PSO, even though PSO appears in both of Task #18's list memberships (its `responsible_raw` names "System Administrator, Personnel Security," which is why it surfaces under this role). Do not treat Task #18 as PSO self-sign-off — see Section 4.

## 3. Preconditions

| Category | Requirement |
|---|---|
| Required Access | Physical access to the facility/SAPF areas under PSO purview; read access to physical access-control logs, visitor logs, and the Authorized Access List; read access to personnel security records (clearance status, access agreements, position risk designations) |
| Required Tools | Local physical access-control system logs/reports; local visitor-management log; local personnel security tracking system for reinvestigation due dates and access-agreement renewals; local ticketing/GRC system for cycle logging |
| Roles/Permissions Needed | Written appointment as PSO (or as Facility Security Officer / Personnel Security Officer absorbed into this role per [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md)); authority under DoDM 5205.07 to approve facility/personnel security actions and sign the resulting records |

## 4. RACI Position Summary

The PSO both executes and is Accountable for 16 of its 17 Master Calendar tasks, meaning it is its own sign-off authority on nearly all of its work rather than routing to a separate approver — a pattern comparable to the SCA's self-executed-and-signed independent-assessment tasks (see [SCA.md](SCA.md) Section 4). The one exception is **Task #18** (notify account manager on termination/transfer/need-to-know change), where the JSON's `accountable` field names **ISSM**, not PSO, even though the task surfaces in PSO's executing list because its `responsible_raw` field jointly names "System Administrator, Personnel Security" — PSO executes the personnel-security half of this notification but does not hold final sign-off on it. On all 17 tasks, **ISSM is Consulted** and **AO/DAO is Informed**, per [role_task_index.json](../tools/data/role_task_index.json), reflecting the PSO's coordination duties with the ISSM on facility/personnel security matters cited in [JSIG §1.5.14(c)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md). The PSO is also the sole Informed party on **Task #62** (review of transmission medium/output device access controls), a Privileged-Users-executed, ISSM-accountable task — PSO is kept aware of that control's status without holding any decision role in it. Per [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md), where an organization has no dedicated Facility Security Officer or Personnel Security Officer billet, the ISSM inherits the PE-family duties above by default; this runbook assumes the standard dedicated-PSO staffing model.

## 5. Execution Procedures

### Task #12: Monitor temperature/humidity environmental controls
- Pattern A — the automated sensor is the facility's environmental-monitoring system; review its alert queue continuously.

### Task #18: Notify account manager on termination/transfer/need-to-know change
- Pattern Custom (tight-SLA event-driven personnel notification, per-event within 8–24 hours):
  1. Step — Receive the termination/transfer/need-to-know-change trigger from within personnel security processing. Expected result: trigger logged with timestamp. Capture: the trigger record. Stop/continue: if scope/effective date is unclear, stop and confirm before the clock expires.
  2. Step — Notify the account manager function within the 8–24 hr window. Expected result: notification sent and acknowledged inside the window. Capture: notification timestamp and acknowledgment. Stop/continue: if the window is at risk of lapsing, escalate immediately per Section 6.
  3. Step — Confirm receipt by the account manager. Expected result: confirmed receipt with timestamp. Capture: confirmation record. Stop/continue: continue.
  4. Step — Log completion in the repository location specified in the Task Index. Expected result: event record filed. Capture: the log entry. Stop/continue: event complete; note per Section 4 that ISSM, not PSO, holds final Accountable sign-off on this task.

### Task #19: Process termination access-revocation actions
- Pattern Custom (tight-SLA event-driven personnel action, ≤24 hours):
  1. Step — Receive the termination notice. Expected result: notice logged with timestamp. Capture: the notice. Stop/continue: if the effective date is unclear, confirm with the reporting supervisor before the clock starts.
  2. Step — Initiate the access-revocation action (physical and coordinate with account management for logical access) within 24 hours. Expected result: revocation action confirmed complete inside the window. Capture: revocation confirmation and timestamp. Stop/continue: if the window is at risk of lapsing, escalate immediately per Section 6.
  3. Step — Verify no residual access remains (badge, SAPF access list, keys). Expected result: zero residual access confirmed. Capture: verification record. Stop/continue: continue.
  4. Step — Log completion in the repository location specified in the Task Index. Expected result: event record filed. Capture: the log entry. Stop/continue: event complete.

### Task #20: Process transfer access-reassessment actions
- Pattern Custom (tight-SLA event-driven personnel action, ≤24 hours):
  1. Step — Receive the transfer notice, including the new position/need-to-know scope. Expected result: notice logged with timestamp and new-scope detail. Capture: the notice. Stop/continue: if the new scope is undefined, confirm with the receiving supervisor before the clock starts.
  2. Step — Reassess access to the new need-to-know/position scope (add/remove entitlements as needed) within 24 hours. Expected result: reassessment confirmed complete inside the window. Capture: reassessment confirmation and timestamp. Stop/continue: if the window is at risk of lapsing, escalate immediately per Section 6.
  3. Step — Verify no access beyond the new scope remains. Expected result: access matches new scope exactly. Capture: verification record. Stop/continue: continue.
  4. Step — Log completion in the repository location specified in the Task Index. Expected result: event record filed. Capture: the log entry. Stop/continue: event complete.

### Task #31: Review physical access logs
- Pattern B — baseline is the Authorized Access List (Task #33); flag any log entry without a matching authorization.

### Task #32: Review visitor access records
- Pattern B — baseline is the visitor-sponsorship/escort policy; flag any unescorted or unsponsored entry.

### Task #33: Review Authorized Access List for restricted/SAPF areas
- Pattern B — baseline is the prior-cycle approved list plus current personnel security clearance/need-to-know status; this list is itself the baseline Tasks #31 and #39 review against.

### Task #39: Verify media storage physical/environmental controls
- Pattern A — confirm the media storage area's physical/environmental control mechanisms (access control, temperature/humidity per Task #12) remain within specification.

### Task #78: Review/re-sign personnel access agreements
- Pattern B — baseline is the current personnel roster with access-agreement expiration dates; annual cadence.

### Task #86: Inventory physical access devices; change combinations/keys
- Pattern C — the "authoritative source" is the facility's physical-security policy requiring periodic combination/key rotation; treat the annual rotation as a credential refresh rather than a list review.

### Task #92: Review position risk designations
- Pattern B — baseline is the position risk-designation policy; reconcile current position assignments against it.

### Task #100: Verify TEMPEST/information-leakage countermeasures
- Pattern A — confirm the facility's TEMPEST/information-leakage countermeasures remain in their certified/approved configuration; annual, SAP-specific.

### Task #101: Test fire detection/suppression and inspect water-damage risk
- Pattern D — test plan is the facility's approved fire detection/suppression test procedure; the water-damage inspection is a companion checklist item within the same annual cycle.

### Task #102: Review third-party/contractor personnel security compliance
- Pattern B — baseline is the contract's personnel security requirements; reconcile the contractor roster's clearance/access-agreement status against it.

### Task #107: Retain visitor access records
- Pattern G — retention window is 1–5 years depending on the governing source; disposal candidates are visitor records past that window.

### Task #109: Track and initiate personnel reinvestigations
- Pattern B — baseline is the DoD/IC-cycle reinvestigation due-date schedule; this task tracks and initiates rather than completes the reinvestigation itself.

### Task #110: Conduct Technical Surveillance Countermeasures Survey
- Pattern D — test plan is the facility's approved TSCM survey procedure; periodic per facility policy, with the SCA Consulted on results.

## 6. Standard Validation, Evidence, Findings, Escalation, and Closure

This role follows the Standard Sections 6–10 (Validation, Evidence Package, Findings and Exceptions, Remediation and Escalation, Closure) defined in [_EXECUTION-PATTERNS.md](_EXECUTION-PATTERNS.md) for every task above. Role-specific delta: on 16 of its 17 tasks the PSO is its own Reviewed By/Approver (Section 6/9 fields) rather than routing to a separate role, consistent with Section 4 above; the sole exception is Task #18, where ISSM holds final Accountable sign-off despite PSO's execution role, so that task's Section 9 Approver is ISSM, not PSO.

## Sources

- [playbooks/roles/PSO.md](../../playbooks/roles/PSO.md)
- [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md)
- [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md)
- [references/JSIG-source/section-1.5-roles-and-responsibilities.md § 1.5.9](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)
- [execution-plan/templates/ESCALATION-MATRIX.md](../templates/ESCALATION-MATRIX.md)
- [execution-plan/templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md](../templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md)
- [MAINTENANCE-PLAN.md §4](../../MAINTENANCE-PLAN.md)
