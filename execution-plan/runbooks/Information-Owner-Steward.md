# Information Owner/Steward — Actionable Task Runbook

The Information Owner/Steward is the organizational official with statutory, management, or operational authority over specific information, defined in [JSIG §1.5.10](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md), and is distinct from (though may coincide with) the Information System Owner per [playbooks/roles/Information-Owner-Steward.md](../../playbooks/roles/Information-Owner-Steward.md). Executes 11 Master Calendar tasks directly, is Accountable for 11, Consulted on 0, Informed on 0 — an identical 11-task set for both columns, confirmed against [role_task_index.json](../tools/data/role_task_index.json) and [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md) Part B, which agree after a rollup double-counting bug (two Master Calendar rows name both "Data Owner" and "Privacy Officer" as joint executors, both of which normalize to this same role, inflating the prior rollup by 2) was fixed in `execution-plan/tools/build_raci_matrix.py`.

For the real verbatim JSIG title behind any Control ID cited in this runbook, see [CONTROL-LANGUAGE-CROSSWALK.md](../CONTROL-LANGUAGE-CROSSWALK.md), which reconciles every Control ID in the Master Calendar against the full verbatim JSIG family extractions.

## 1. Role Overview

The Information Owner/Steward establishes policy governing the generation, collection, processing, dissemination, and disposal of the information under its authority, and retains that responsibility even when the information is shared with other organizations. Per [ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md), this role absorbs the "Data Owner" and (absent a dedicated privacy office) "Privacy Officer" operational titles, which is why every one of its Master Calendar tasks is privacy-control-family work (AR, SE, DI, IP, DM, TR, UL). See [playbooks/roles/Information-Owner-Steward.md](../../playbooks/roles/Information-Owner-Steward.md) for the full role narrative, JSIG-cited duties, and key artifacts owned.

## 2. Task Index

All 11 tasks below are both executed by and Accountable to this role per [role_task_index.json](../tools/data/role_task_index.json) — the executing and accountable task sets are the identical 11 tasks (task numbers 13, 15, 40, 41, 63, 64, 93, 94, 95, 96, 108), not merely equal in count. This role is its own execution-and-sign-off authority for privacy-control work, similar in shape to the SCA and PSO runbooks.

| # | Task | Family | Frequency | Control ID(s) | Pattern |
|---|---|---|---|---|---|
| 13 | Operate privacy incident response capability | SE | Continuous | SE-2 | Custom |
| 15 | Maintain accounting-of-disclosures log | AR | Continuous | AR-8 | B |
| 40 | Monitor/audit privacy control compliance | AR | Monthly | AR-4 | A |
| 41 | Update PII/system-holdings inventory | SE | Monthly | SE-1 | B |
| 63 | Review data quality of PII holdings | DI | Quarterly | DI-1 | B |
| 64 | Track and report privacy complaint trends | IP | Quarterly | IP-4 | B |
| 93 | Update Privacy Impact Assessment | AR | Annual | AR-2 | E |
| 94 | Review PII minimization opportunities in holdings | DM | Annual | DM-1 | B |
| 95 | Review/update privacy notices, SORNs, and Privacy Act statements | TR | Annual | TR-1, TR-2 | E |
| 96 | Review internal-use and third-party info-sharing compliance | UL | Annual | UL-1, UL-2 | B |
| 108 | Execute PII retention/disposal per records schedule | DM | Multi-year / retention | DM-2 | G |

**Accountable-only tasks: none.** All 11 tasks in the Accountable list are identical to the executing list above — there is no separate review-only task for this role in the Master Calendar.

## 3. Preconditions

| Category | Requirement |
|---|---|
| Required Access | Read/write access to the PII/system-holdings inventory, accounting-of-disclosures log, and privacy complaint tracking records; read access to the current Privacy Impact Assessment, privacy notices/SORNs, and the organization's records-retention schedule |
| Required Tools | Local ticketing/GRC system for disclosure-log and complaint-trend tracking; no technical scanning tools required for this role |
| Roles/Permissions Needed | Designation as Information Owner/Steward (or delegated Privacy Officer/Data Owner acting under this role per [ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md)) for the specific information holdings in scope; authority to approve privacy-notice and retention/disposal actions without further routing |

## 4. RACI Position Summary

The Information Owner/Steward both executes and is Accountable for all 11 of its Master Calendar tasks, meaning it signs off on its own privacy-control work rather than routing to a separate approver — the same self-executed-and-signed shape as the SCA and PSO runbooks, though the underlying task set (privacy/PII lifecycle rather than independent assessment or physical security) is entirely different. ISSM is Consulted and Informed on every one of these 11 tasks per [role_task_index.json](../tools/data/role_task_index.json), reflecting the coordination duty in [JSIG §1.5.10](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md) to relay unique audit/incident-response requirements to the ISSM/ISSO. Per [ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md), where an organization staffs a dedicated Privacy Officer or Data Owner billet, that individual performs this hands-on work, but the Information Owner/Steward remains the accountable default and the JSIG-named role of record.

## 5. Execution Procedures

### Task #13: Operate privacy incident response capability
- Custom (does not fit Patterns A–H cleanly — this is a standing incident-response capability, not a scheduled scan, list review, update, test, document revision, training delivery, disposal, or discrete governance decision):
  1. Confirm the privacy incident response procedure is current and the intake channel (report line, ticketing queue) is staffed and reachable. — Expected result: procedure current, intake channel live. — Capture: procedure version/date, intake-channel status check.
  2. On any reported or detected privacy incident, triage scope (data type, number of individuals, disclosure risk) and open a tracking record. — Expected result: every incident has a tracking ID within one business day of report. — Capture: tracking record.
  3. Coordinate response actions with the ISSM/IR Team Lead per [JSIG §1.5.10](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)'s unique-incident-response-requirements duty; close out with a documented resolution. — Expected result: resolution recorded, affected individuals/oversight notified per policy if required. — Capture: resolution record, notification log if applicable.
  4. Stop/continue: if the incident involves suspected unauthorized disclosure of PII outside the organization, stop routine handling and escalate immediately per the Escalation block below.

### Task #15: Maintain accounting-of-disclosures log
- Pattern B — the "list" under review is the accounting-of-disclosures log itself; the baseline is the prior reporting period's log plus the actual disclosure authorizations issued, and every new disclosure is compared against its authorizing basis before being logged as expected.

### Task #40: Monitor/audit privacy control compliance
- Pattern A — the "automated tool" step is the privacy-control compliance monitoring mechanism the Privacy Officer/ISSO run monthly; this role reviews the resulting compliance findings queue and dispositions each item.

### Task #41: Update PII/system-holdings inventory
- Pattern B — the list under review is the PII/system-holdings inventory; baseline is the prior month's inventory, compared line by line against actual current holdings reported by system administrators.

### Task #63: Review data quality of PII holdings
- Pattern B — the list under review is the PII holdings set; baseline is the data-quality standard (accuracy, relevance, timeliness, completeness) rather than a prior access list, with discrepancies flagged as data-quality findings rather than access anomalies.

### Task #64: Track and report privacy complaint trends
- Pattern B — the list under review is the quarter's privacy complaint log; baseline is the prior quarter's trend, with the comparison output being a trend report rather than a discrepancy list.

### Task #93: Update Privacy Impact Assessment
- Pattern E — the governing document is the Privacy Impact Assessment itself; review against current holdings, uses, and sharing arrangements since the last PIA cycle, routing any substantive revision for the organization's required PIA approval.

### Task #94: Review PII minimization opportunities in holdings
- Pattern B — the list under review is the PII holdings inventory; baseline is the minimization principle (collect/retain only what is necessary), with each holding not meeting that standard flagged for reduction.

### Task #95: Review/update privacy notices, SORNs, and Privacy Act statements
- Pattern E — the governing documents are the privacy notices, System of Records Notices, and Privacy Act statements; annual review confirms they still match actual collection/use/sharing practice before re-publication.

### Task #96: Review internal-use and third-party info-sharing compliance
- Pattern B — the list under review is the set of internal-use and third-party information-sharing arrangements; baseline is each arrangement's authorizing agreement, with unauthorized or expired sharing flagged as a finding.

### Task #108: Execute PII retention/disposal per records schedule
- Pattern G — retention window is per the applicable records schedule cited in this task's Control ID (DM-2); disposal candidates are PII holdings past their retention window, cleared of legal hold/open incident reference before disposal.

## 6. Standard Validation, Evidence, Findings, Escalation, and Closure

This role follows the Standard Sections 6–10 (Validation, Evidence Package, Findings and Exceptions, Remediation and Escalation, Closure) defined in [_EXECUTION-PATTERNS.md](_EXECUTION-PATTERNS.md) for every task above. Role-specific delta: because the Information Owner/Steward is both Responsible and Accountable on every one of its 11 tasks, it is its own Reviewer/Approver in Section 6's Validation step and its own Approver in Section 9 — findings still CAT-rate and route through [ESCALATION-MATRIX.md](../templates/ESCALATION-MATRIX.md) and [VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md](../templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md) to the AO/DAO (CAT I) or ISSM (CAT II) as final accept/reject authority for privacy findings tied to a STIG/CVE record, but for the non-technical privacy-lifecycle findings native to this role's own tasks (e.g., a data-quality or minimization gap with no CAT/CVE mapping), this role documents and closes the exception itself per Standard Section 8, with the ISSM as standing consulted reviewer.

## Sources

- [playbooks/roles/Information-Owner-Steward.md](../../playbooks/roles/Information-Owner-Steward.md)
- [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md)
- [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md)
- [reference/JSIG-source/section-1.5-roles-and-responsibilities.md § 1.5.10](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)
- [execution-plan/templates/ESCALATION-MATRIX.md](../templates/ESCALATION-MATRIX.md)
- [execution-plan/templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md](../templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md)
- [MAINTENANCE-PLAN.md §4](../../MAINTENANCE-PLAN.md)
