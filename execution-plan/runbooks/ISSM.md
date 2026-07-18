# Information System Security Manager (ISSM) — Actionable Task Runbook

The ISSM is the principal advisor on all matters, technical and otherwise, involving the security of information systems under their purview, per [JSIG §1.5.14](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md), sitting between the AO/DAO governance tier and the ISSO's day-to-day execution tier per [playbooks/roles/ISSM.md](../../playbooks/roles/ISSM.md). Executes 30 Master Calendar tasks directly, is Accountable for 77, Consulted on 39, Informed on 20 — see [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md) Part B for the full rollup. This is the heaviest role in the Master Calendar by combined executing + accountable volume.

## 1. Role Overview

The ISSM is appointed in writing by the respective chain of command and must retain a copy of that appointment letter; ISSM duties are never a collateral assignment. The role develops and maintains the formal IS security program and policies, oversees the ISSOs under its purview (appointing them in writing, ensuring their training, and assuming their duties in their absence), manages the continuous monitoring plan, maintains the organization's cybersecurity documentation repository, and ensures serious or unresolved vulnerabilities and violations are escalated to the AO/DAO. See [playbooks/roles/ISSM.md](../../playbooks/roles/ISSM.md) for the full role narrative, JSIG-cited duties, and key artifacts owned.

## 2. Task Index

Per [role_task_index.json](../tools/data/role_task_index.json), the ISSM executes 30 Master Calendar tasks directly and is Accountable-only (reviews/signs off without performing hands-on) on a further 47 — all 30 executing tasks are also tasks the ISSM is Accountable for, so the two tables below are non-overlapping (30 + 47 = 77 total Accountable tasks).

### 2.1 Executing tasks (30)

| # | Task | Family | Frequency | Control ID(s) | Pattern |
|---|---|---|---|---|---|
| 34 | Convene Configuration Control Board (when changes proposed) | CM | Monthly | CM-3 | H |
| 36 | Maintain organization-level POA&M rollup | PM | Monthly | PM-4 | B |
| 37 | Maintain organization-wide information system inventory | PM | Monthly | PM-5 | B |
| 45 | Report information security performance measures | PM | Monthly/quarterly | PM-6 | B |
| 47 | Reassess least-privilege/privileged-function assignments | AC | Quarterly | AC-6, AC-6(1) | B |
| 48 | Review authorized software list | CM | Quarterly | CM-7(5) | B |
| 49 | Reassess/reevaluate privileged access tied to change | CM | Quarterly | CM-5(5) | B |
| 53 | Distribute quarterly security/privacy awareness reminders | AT | Quarterly | AT-2 (supplemental) | Custom |
| 71 | Review/update all family policies and procedures (-1 controls) | All 26 | Annual | AC-1, AT-1, AU-1, CA-1, CM-1, CP-1, IA-1, IR-1, MA-1, MP-1, PE-1, PL-1, PS-1, RA-1, SA-1, SC-1, SI-1 | E |
| 72 | Review/update contingency plan | CP | Annual | CP-2 | E |
| 73 | Test/exercise contingency plan | CP | Annual | CP-4 | D |
| 75 | Perform penetration testing | CA | Annual | CA-8 | D |
| 76 | Review approved maintenance tools | MA | Annual | MA-3 | B |
| 77 | Update/reassess organizational risk assessment | RA | Annual | RA-3 | E |
| 79 | Deliver annual security awareness refresher training | AT | Annual | AT-2 | F |
| 80 | Deliver role-based training refresher | AT | Annual | AT-3 | F |
| 81 | Deliver incident response training refresher | IR | Annual | IR-2 | F |
| 82 | Deliver contingency training refresher | CP | Annual | CP-3 | F |
| 83 | Review/update incident response plan | IR | Annual | IR-8 | E |
| 84 | Review/update auditable events list | AU | Annual | AU-2 | E |
| 87 | Review/update System Security Plan (SSP) | PL | Annual | PL-2 | E |
| 88 | Review Rules of Behavior acknowledgment | PL | Annual | PL-4 | B |
| 89 | Review external system service provider compliance | SA | Annual | SA-9 | B |
| 91 | Review security categorization | RA | Annual | RA-2 | E |
| 97 | Review Configuration Management Plan | CM | Annual | CM-9 | E |
| 99 | Verify alternate storage/processing site and telecom readiness | CP | Annual | CP-6, CP-7, CP-8 | A |
| 100 | Verify TEMPEST/information-leakage countermeasures (SAP-specific) | PE | Annual | PE-19 | B |
| 103 | Retain audit records offline per NARA schedule or 6–7 years (IRS analog) | AU | Multi-year / retention | AU-11 | G |
| 106 | Retain incident records 3 years after follow-up actions complete | IR | Multi-year / retention | IR/AU retention | G |
| 110 | Conduct Technical Surveillance Countermeasures Survey | RA | Periodic (facility policy) | RA-6 | A |

### 2.2 Accountable-only tasks (47) — ISSM reviews/signs off; another role executes

| # | Task | Family | Frequency | Control ID(s) | Pattern | Oversight Action |
|---|---|---|---|---|---|---|
| 1 | Maintain asset/software inventory (automated) | CM | Continuous | CM-8, CM-11 | A | Confirm inventory tool ran and reconcile exceptions monthly |
| 3 | Real-time malware scanning of externally sourced files | SI | Continuous | SI-3 | A | Spot-check scan-engine coverage and quarantine queue |
| 4 | Maintain IAVM directive compliance | SI | Continuous | SI-2, RA-5, CA-5 | C | Sign off on IAVM compliance status each cycle |
| 5 | Enforce access control/session/least-privilege mechanisms | AC | Continuous | AC-3, AC-6, AC-11, AC-12 | A | Review enforcement exceptions and approve deviations |
| 6 | Monitor audit storage capacity and processing-failure alerts | AU | Continuous | AU-4, AU-5 | A | Review capacity-alert log and confirm no unresolved gaps |
| 7 | Enforce boundary protection (firewalls/guards) | SC | Continuous | SC-7 | A | Review boundary-protection exception requests |
| 8 | Enforce encryption at rest (non-tailorable) | SC | Continuous | SC-28 | A | Confirm non-tailorable control has no open exceptions |
| 9 | Enforce transmission confidentiality/integrity | SC | Continuous | SC-8 | A | Confirm no open transmission-protection exceptions |
| 10 | Enforce reauthentication/session timeout | IA | Continuous | IA-11 | A | Confirm timeout configuration remains within policy |
| 11 | Monitor denial-of-service protections/session authenticity | SC | Continuous | SC-5, SC-23 | A | Review DoS/session-authenticity alert disposition |
| 13 | Operate privacy incident response capability | SE | Continuous | SE-2 | A | Confirm privacy IR capability stays staffed and current |
| 14 | Handle and monitor for security incidents (24/7) | IR | Continuous | IR-4, IR-5 | A | Serve as escalation point for CAT-rated incidents |
| 16 | Check/update malware-tool signatures | SI | Daily | SI-3 | C | Spot-check signature currency during cycle reviews |
| 17 | Provide incident status updates during active incident | IR | Daily (per-event) | IR-6 | Custom | Receive and relay status updates to AO/DAO as needed |
| 18 | Notify account manager on termination/transfer/need-to-know change (8–24 hr window) | AC | Daily (per-event) | AC-2 | Custom | Confirm notification SLA is met; escalate misses |
| 21 | Verify system clock/time-stamp synchronization | AU | Daily (automated check) | AU-8 | A | Review sync-failure exceptions during audit review |
| 23 | Run periodic malicious-code (antivirus) scans | SI | Weekly | SI-3 | A | Review weekly scan summary for unresolved alerts |
| 24 | Perform incremental backups (daily-incremental/weekly-full pattern) | CP | Weekly | CP-9 | A | Confirm backup job completion status weekly |
| 27 | Perform vulnerability scanning | RA | Monthly | RA-5 | A | Review scan results and approve finding dispositions |
| 28 | Update scanner vulnerability signatures | RA | Monthly | RA-5(2) | C | Confirm signature currency prior to monthly scan |
| 29 | Check/report flaw-remediation (patch) status | SI | Monthly | SI-2(2) | C | Approve monthly patch-status report before filing |
| 30 | Test backup integrity/restoration | CP | Monthly | CP-9(1) | D | Review restoration test results and sign off |
| 35 | Update system component inventory (manual/verification pass) | CM | Monthly | CM-8 | B | Approve reconciled inventory before filing |
| 38 | Monitor nonlocal maintenance session records | MA | Monthly | MA-4, CA-7 | B | Review session-record exceptions monthly |
| 41 | Update PII/system-holdings inventory | SE | Monthly | SE-1 | B | Approve updated PII/holdings inventory |
| 42 | Verify security function operation (self-tests) | SI | Monthly | SI-6 | A | Review self-test failure log and approve disposition |
| 43 | Verify software/firmware/information integrity | SI | Monthly | SI-7 | A | Review integrity-check exceptions monthly |
| 44 | Install security-relevant software/firmware updates | SI | Monthly/30 days | SI-2 | C | Approve update cycle completion within SLA |
| 50 | Review unsupported system components (EOL/EOS) | SA | Quarterly | SA-22 (non-tailorable) | B | Approve EOL/EOS remediation or risk-acceptance plan |
| 51 | Verify encryption-at-rest compliance | SC | Quarterly | SC-28 (non-tailorable) | B | Sign off on quarterly compliance verification |
| 52 | Verify transmission encryption compliance | SC | Quarterly | SC-8 | B | Sign off on quarterly compliance verification |
| 54 | Review remote access and wireless access authorization lists | AC | Quarterly | AC-17, AC-18 | B | Approve reviewed authorization list |
| 56 | Review access-enforcement/flow-enforcement rule sets | AC | Quarterly | AC-3, AC-4 | B | Approve rule-set review and any changes |
| 57 | Verify device identification/authentication configuration | IA | Quarterly | IA-3 | B | Sign off on quarterly verification |
| 58 | Verify configuration settings against baseline/STIG | CM | Quarterly | CM-6 | B | Approve baseline/STIG deviation dispositions |
| 61 | Verify media marking compliance | MP | Quarterly | MP-3 | B | Sign off on quarterly compliance verification |
| 62 | Review transmission medium/output device access controls | PE | Quarterly | PE-4, PE-5 | B | Approve reviewed access-control list |
| 65 | Review boundary-protection rule set | SC | Quarterly | SC-7 | B | Approve rule-set review and any changes |
| 66 | Review spam protection mechanism effectiveness | SI | Quarterly | SI-8 | B | Sign off on effectiveness review |
| 68 | Test/exercise incident response capability (SAP default) | IR | Semi-annual | IR-3 | D | Review AAR and approve any POA&M entries |
| 69 | Review inventory records for computers/removable media (IRS-analog practice) | CM | Semi-annual | CM-8 (supplemental) | B | Approve reviewed inventory records |
| 70 | Review/update baseline configuration | CM | Annual | CM-2 | E | Approve baseline revision or no-change re-approval |
| 85 | Review unnecessary functions/ports/protocols/services | CM | Annual | CM-7(1) | B | Approve reviewed disable/remove disposition list |
| 90 | Rotate/manage cryptographic keys | SC | Annual | SC-12, SC-13 | C | Approve key-rotation cycle completion |
| 98 | Test information system recovery/reconstitution procedures | CP | Annual | CP-10 | D | Review AAR and approve any POA&M entries |
| 104 | Prevent identifier reuse for ≥2 years | IA | Multi-year / retention | IA-4 | G | Confirm identifier-reuse control is enforced |
| 108 | Execute PII retention/disposal per records schedule | DM | Multi-year / retention | DM-2 | G | Approve disposal candidate list before execution |

## 3. Preconditions

| Category | Requirement |
|---|---|
| Required Access | Read/write access to the organization's SSP, POA&M, risk assessment, contingency/incident-response plans, and all family "-1" policy documents; read access to the local vulnerability scanner, log-management system, and backup/recovery-test results across every IS under purview |
| Required Tools | Local ticketing/GRC system (POA&M rollup, CCB records, ConMon package filing); local vulnerability scanner and log/audit-review tool (oversight review, not hands-on operation, for most continuous/daily/weekly tasks in Section 2.2); local training-records system |
| Roles/Permissions Needed | Written ISSM appointment letter retained on file; CCB/Risk Executive Board voting membership with veto authority; authority to sign SSP, Contingency Plan, Incident Response Plan, and Configuration Management Plan revisions; authority as Accountable/Approver for CAT II findings under the Escalation Matrix |

## 4. RACI Position Summary

The ISSM's RACI footprint — 30 executing, 77 accountable, 39 consulted, 20 informed — is the largest of any role in the Master Calendar, reflecting the JSIG-defined position as principal security advisor across every control family rather than a single technical or physical domain. Every one of the 30 executing tasks is also one of the 77 tasks the ISSM is Accountable for (self-executed-and-signed); the remaining 47 Accountable-only tasks are hands-on work performed by System/Network Administrators, ISSOs, or other operational titles that the ISSM reviews and signs off on rather than performs personally, per [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md) (which routes System Administrator and Network Administrator output to ISSM accountability, and CCB-chair, Training Manager, and IR-escalation-authority operational titles into the ISSM role directly). Per the [ESCALATION-MATRIX.md](../templates/ESCALATION-MATRIX.md), the ISSM is the **standing consulted/reviewing party at every CAT tier (I, II, and III)**, and is additionally the named **Accountable (final accept/reject) authority specifically for CAT II findings**, with a 90-day SLA, per [VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md §4](../templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md) — CAT I Accountable authority sits with the AO/DAO and CAT III with the ISSO, with the ISSM consulted (not Accountable) on both of those tiers. The ISSM is also the default Escalation Owner across all tiers per [ESCALATION-MATRIX.md §4](../templates/ESCALATION-MATRIX.md), meaning a missed SLA on any tier's finding routes through the ISSM even when the ISSM is not that tier's final signer.

## 5. Execution Procedures

### Task #34: Convene Configuration Control Board
- Pattern H — decision package is the proposed change request; ISSM chairs/votes with veto authority over security-detrimental changes, appeals routing to the AO.

### Tasks #36, #37, #45: Organization-level POA&M rollup, IS inventory, and performance-measure reporting
- Pattern B — the "list" reviewed is the aggregated organization-wide POA&M, system inventory, or performance-measure data set; baseline is the prior month's rollup, and the AO is consulted per Pattern H's consultation step before the rollup is finalized.

### Tasks #47, #49: Reassess least-privilege/privileged-function assignments; reassess privileged access tied to change
- Pattern B — the list reviewed is the current privileged-account/privileged-function assignment set, compared against the least-privilege baseline and any change-driven access modifications since the last cycle.

### Task #48: Review authorized software list
- Pattern B — the list is the current authorized-software baseline; flag any unauthorized additions found during the quarterly comparison.

### Task #53: Distribute quarterly security/privacy awareness reminders
- Custom (does not fit A–H — a short push-notification/reminder task, not a monitored control or full training delivery): 1) Confirm the current reminder content is up to date. 2) Distribute to the full user population via the standard internal communication channel. 3) Log distribution date and population count in the repository location specified in the Task Index. Stop/continue: no escalation gate — this is a low-risk administrative task.

### Task #71: Review/update all family policies and procedures (-1 controls)
- Pattern E — the document set is all 17 family "-1" policies; route each through its governing approval chain before publishing.

### Task #72: Review/update contingency plan
- Pattern E — the document is the Contingency Plan; route to the AO for sign-off per its own approval requirement.

### Task #73: Test/exercise contingency plan
- Pattern D — the plan under test is the current approved Contingency Plan; coordinate timing with Task #72's annual review cycle.

### Task #75: Perform penetration testing
- Pattern D — the "test plan" is the annual penetration-test scope and rules of engagement; file results alongside the SCA's independent assessment record.

### Task #76: Review approved maintenance tools
- Pattern B — the list is the approved maintenance-tool and maintenance-personnel authorization list, compared against current tool inventory.

### Task #77: Update/reassess organizational risk assessment
- Pattern E — the document is the organizational risk assessment; route the update to support the AO's continuous-ATO risk posture briefing.

### Tasks #79, #80, #81, #82: Deliver annual security-awareness, role-based, incident-response, and contingency training refreshers
- Pattern F — four distinct populations/content sets (general users, role-based/technical staff, incident-response team, contingency-plan personnel); each cycle tracks its own roster and completion log independently.

### Task #83: Review/update incident response plan
- Pattern E — the document is the Incident Response Plan; route to the AO where the update materially changes escalation authority.

### Task #84: Review/update auditable events list
- Pattern E — the document is the organization's auditable-events list; review against current threat/regulatory changes since the last cycle.

### Task #87: Review/update System Security Plan (SSP)
- Pattern E — the document is the SSP; route to the AO for approval per its own sign-off requirement, consistent with [JSIG §1.5.14(k)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)'s documentation-repository duty.

### Task #88: Review Rules of Behavior acknowledgment
- Pattern B — the list is the current signed Rules of Behavior acknowledgment roster, compared against the active-user population.

### Task #89: Review external system service provider compliance
- Pattern B — the list is the set of external/interconnected system agreements; coordinate with the PSO per [JSIG §1.5.14(c)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) on any new or lapsed agreement found.

### Task #91: Review security categorization
- Pattern E — the document is the system's security categorization determination; reassess against current mission/data-sensitivity changes.

### Task #97: Review Configuration Management Plan
- Pattern E — the document is the Configuration Management Plan; route through the CCB for any procedural change.

### Task #99: Verify alternate storage/processing site and telecom readiness
- Pattern A — the "monitor" is the alternate site's own readiness-check mechanism; review its last-verified status and telecom failover confirmation for the cycle.

### Task #100: Verify TEMPEST/information-leakage countermeasures (SAP-specific)
- Pattern B — the baseline is the facility's approved TEMPEST countermeasures plan; compare current physical/technical state against it.

### Tasks #103, #106: Retain audit records / incident records
- Pattern G — two separate retention schedules (audit records: NARA schedule or 6–7 years; incident records: 3 years after follow-up actions complete); run each disposal-candidate check independently against its own window.

### Task #110: Conduct Technical Surveillance Countermeasures Survey
- Pattern A — the "sensor" is the TSCM survey itself, run on facility-policy cadence rather than a fixed calendar date; review findings against the prior survey's baseline.

## 6. Standard Validation, Evidence, Findings, Escalation, and Closure

This role follows the Standard Sections 6–10 (Validation, Evidence Package, Findings and Exceptions, Remediation and Escalation, Closure) defined in [_EXECUTION-PATTERNS.md](_EXECUTION-PATTERNS.md) for every task above. Role-specific deltas: (1) the ISSM is the named **Accountable/Approver for CAT II findings specifically** (90-day SLA) per [VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md §4](../templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md), while remaining a standing Consulted reviewer — not the final signer — on CAT I (AO/DAO-owned, 30-day SLA) and CAT III (ISSO-owned, 180-day SLA) records; (2) the ISSM is the default Escalation Owner across all three tiers per [ESCALATION-MATRIX.md §4](../templates/ESCALATION-MATRIX.md), so a missed SLA anywhere in the chain routes through the ISSM even on tiers where it is not the final Approver; (3) retention windows for Tasks #103 and #106 are longer than the standard default and are set by their own Control ID citations (NARA schedule/6–7 years; 3 years post-follow-up) rather than the generic organizational records schedule.

## Sources

- [playbooks/roles/ISSM.md](../../playbooks/roles/ISSM.md)
- [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md)
- [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md)
- [references/JSIG-source/section-1.5-roles-and-responsibilities.md § 1.5.14](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)
- [execution-plan/templates/ESCALATION-MATRIX.md](../templates/ESCALATION-MATRIX.md)
- [execution-plan/templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md](../templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md)
- [MAINTENANCE-PLAN.md §4](../../MAINTENANCE-PLAN.md)
