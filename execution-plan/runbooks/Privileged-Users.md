# Privileged Users — Actionable Task Runbook

Privileged Users are defined in [JSIG §1.5.16](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md) by reference only — to Account Management [AC-2], Separation of Duties [AC-5], and Rules of Behavior [PL-4] — rather than by an enumerated duty list; per [playbooks/roles/Privileged-Users.md](../../playbooks/roles/Privileged-Users.md), day-to-day technical responsibilities are synthesized from those controls plus the System Administrator monitoring duties JSIG assigns under the ISSM. Executes 49 Master Calendar tasks directly (deduplicated), is Accountable for 0, Consulted on 0, Informed on 0 — see [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md) Part B for the full rollup.

For the real verbatim JSIG title behind any Control ID cited in this runbook, see [CONTROL-LANGUAGE-CROSSWALK.md](../CONTROL-LANGUAGE-CROSSWALK.md), which reconciles every Control ID in the Master Calendar against the full verbatim JSIG family extractions.

## 1. Role Overview

Privileged Users hold elevated access (system, network, security, or database administration) beyond general users, operate under least-privilege and separation-of-duties constraints, and perform the hands-on technical work behind most continuous, daily, weekly, and monthly control-enforcement tasks in the Master Calendar. Per [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md), this runbook is where the "System Administrator" and "Network Administrator" operational titles used throughout [MAINTENANCE-PLAN.md §4](../../MAINTENANCE-PLAN.md) actually execute — the ISSM holds ultimate accountability for that work, with the ISSO providing direct technical oversight. See [playbooks/roles/Privileged-Users.md](../../playbooks/roles/Privileged-Users.md) for the full role narrative, JSIG-cited duties, and key artifacts owned.

## 2. Task Index

Per [role_task_index.json](../tools/data/role_task_index.json), all 49 tasks below are executed by this role; none are Accountable-only (Privileged Users hold zero Accountable tasks — see Section 4).

| # | Task | Family | Frequency | Control ID(s) | Pattern |
|---|---|---|---|---|---|
| 1 | Maintain asset/software inventory (automated) | CM | Continuous | CM-8, CM-11 | A |
| 3 | Real-time malware scanning of externally sourced files | SI | Continuous | SI-3 | A |
| 4 | Maintain IAVM directive compliance | SI | Continuous | SI-2, RA-5, CA-5 | C |
| 5 | Enforce access control/session/least-privilege mechanisms | AC | Continuous | AC-3, AC-6, AC-11, AC-12 | A |
| 6 | Monitor audit storage capacity and processing-failure alerts | AU | Continuous | AU-4, AU-5 | A |
| 7 | Enforce boundary protection (firewalls/guards) | SC | Continuous | SC-7 | A |
| 8 | Enforce encryption at rest (non-tailorable) | SC | Continuous | SC-28 | A |
| 9 | Enforce transmission confidentiality/integrity | SC | Continuous | SC-8 | A |
| 10 | Enforce reauthentication/session timeout | IA | Continuous | IA-11 | A |
| 11 | Monitor denial-of-service protections/session authenticity | SC | Continuous | SC-5, SC-23 | A |
| 16 | Check/update malware-tool signatures | SI | Daily | SI-3 | C |
| 18 | Notify account manager on termination/transfer/need-to-know change (8–24 hr window) | AC | Daily (per-event) | AC-2 | Custom |
| 21 | Verify system clock/time-stamp synchronization | AU | Daily (automated check) | AU-8 | A |
| 23 | Run periodic malicious-code (antivirus) scans | SI | Weekly | SI-3 | A |
| 24 | Perform incremental backups (daily-incremental/weekly-full pattern) | CP | Weekly | CP-9 | A |
| 27 | Perform vulnerability scanning | RA | Monthly | RA-5 | A |
| 28 | Update scanner vulnerability signatures | RA | Monthly | RA-5(2) | C |
| 29 | Check/report flaw-remediation (patch) status | SI | Monthly | SI-2(2) | C |
| 30 | Test backup integrity/restoration | CP | Monthly | CP-9(1) | D |
| 35 | Update system component inventory (manual/verification pass) | CM | Monthly | CM-8 | B |
| 38 | Monitor nonlocal maintenance session records | MA | Monthly | MA-4, CA-7 | B |
| 41 | Update PII/system-holdings inventory | SE | Monthly | SE-1 | B |
| 42 | Verify security function operation (self-tests) | SI | Monthly | SI-6 | A |
| 43 | Verify software/firmware/information integrity | SI | Monthly | SI-7 | A |
| 44 | Install security-relevant software/firmware updates | SI | Monthly/30 days | SI-2 | C |
| 48 | Review authorized software list | CM | Quarterly | CM-7(5) | B |
| 50 | Review unsupported system components (EOL/EOS) | SA | Quarterly | SA-22 (non-tailorable) | B |
| 51 | Verify encryption-at-rest compliance | SC | Quarterly | SC-28 (non-tailorable) | B |
| 52 | Verify transmission encryption compliance | SC | Quarterly | SC-8 | B |
| 54 | Review remote access and wireless access authorization lists | AC | Quarterly | AC-17, AC-18 | B |
| 56 | Review access-enforcement/flow-enforcement rule sets | AC | Quarterly | AC-3, AC-4 | B |
| 57 | Verify device identification/authentication configuration | IA | Quarterly | IA-3 | B |
| 58 | Verify configuration settings against baseline/STIG | CM | Quarterly | CM-6 | B |
| 61 | Verify media marking compliance | MP | Quarterly | MP-3 | B |
| 62 | Review transmission medium/output device access controls | PE | Quarterly | PE-4, PE-5 | B |
| 65 | Review boundary-protection rule set | SC | Quarterly | SC-7 | B |
| 66 | Review spam protection mechanism effectiveness | SI | Quarterly | SI-8 | B |
| 69 | Review inventory records for computers/removable media (IRS-analog practice) | CM | Semi-annual | CM-8 (supplemental) | B |
| 70 | Review/update baseline configuration | CM | Annual | CM-2 | E |
| 73 | Test/exercise contingency plan | CP | Annual | CP-4 | D |
| 76 | Review approved maintenance tools | MA | Annual | MA-3 | B |
| 85 | Review unnecessary functions/ports/protocols/services | CM | Annual | CM-7(1) | B |
| 90 | Rotate/manage cryptographic keys | SC | Annual | SC-12, SC-13 | C |
| 98 | Test information system recovery/reconstitution procedures | CP | Annual | CP-10 | D |
| 99 | Verify alternate storage/processing site and telecom readiness | CP | Annual | CP-6, CP-7, CP-8 | A |
| 103 | Retain audit records offline per NARA schedule or 6–7 years (IRS analog) | AU | Multi-year / retention | AU-11 | G |
| 104 | Prevent identifier reuse for ≥2 years | IA | Multi-year / retention | IA-4 | G |
| 106 | Retain incident records 3 years after follow-up actions complete | IR | Multi-year / retention | IR/AU retention | G |
| 108 | Execute PII retention/disposal per records schedule | DM | Multi-year / retention | DM-2 | G |

**Accountable-only tasks: none.** Privileged Users hold zero Accountable-list entries per [role_task_index.json](../tools/data/role_task_index.json).

## 3. Preconditions

| Category | Requirement |
|---|---|
| Required Access | Administrative/root-equivalent access to the systems, network devices, and security tools in scope; read/write access to the local configuration-management, backup, and inventory systems; read access to the local vulnerability scanner and malware-scanning console |
| Required Tools | Local malware-scanning engine and management console; local vulnerability scanner; local backup/restoration tooling; local configuration-baseline/STIG compliance-checking tool; local ticketing/GRC system for cycle logging and POA&M entries |
| Roles/Permissions Needed | Written appointment as a Privileged User (System Administrator, Network Administrator, or equivalent operational title per [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md)); account provisioned under least-privilege/separation-of-duties constraints per AC-5/AC-6; current Rules of Behavior acknowledgment on file per PL-4 |

## 4. RACI Position Summary

Privileged Users execute more Master Calendar tasks directly than any other role in this scaffold (49) but are the Accountable party on none of them — every executing task above routes to another role for sign-off. Per [role_task_index.json](../tools/data/role_task_index.json), 47 of the 49 tasks name the **ISSM** as Accountable, consistent with [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md)'s mapping of the System Administrator/Network Administrator operational titles to ISSM accountability with ISSO technical oversight; the remaining 2 tasks (#41, #108 — the PII/system-holdings inventory and PII retention/disposal) name the **Information Owner/Steward** as Accountable instead, since those tasks fall under data-lifecycle policy rather than technical control enforcement. Privileged Users are Consulted on 0 and Informed on 0 tasks they do not execute. Per [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md) Part B, no other role's Accountable count is satisfied by Privileged Users' work without a separate sign-off step — this role never closes its own task; see Section 6 for the routing pattern that applies uniformly across the table above.

## 5. Execution Procedures

Each subsection names its Pattern and only the task-specific delta per [_EXECUTION-PATTERNS.md](_EXECUTION-PATTERNS.md); ordered by task number.

### Task #1: Maintain asset/software inventory (automated)
- Pattern A — confirm the automated inventory tool ran on schedule and reconcile any exceptions before the monthly manual pass (Task #35).

### Task #3: Real-time malware scanning of externally sourced files
- Pattern A — the automated tool is the malware-scanning engine's real-time file-intake filter; review its quarantine/alert queue for externally sourced files specifically.

### Task #4: Maintain IAVM directive compliance
- Pattern C — the authoritative source is the current IAVM directive/advisory feed; compare directive-required actions against deployed state and apply through change control.

### Task #5: Enforce access control/session/least-privilege mechanisms
- Pattern A — the automated mechanism is the access-control/session-management enforcement layer; review enforcement logs for exceptions each cycle.

### Task #6: Monitor audit storage capacity and processing-failure alerts
- Pattern A — the automated sensor is the audit-storage-capacity and processing-failure alerting mechanism; confirm no unresolved gap in the alert queue.

### Task #7: Enforce boundary protection (firewalls/guards)
- Pattern A — the automated tool is the boundary-protection device (firewall/guard); review its exception-request and block/allow log for the cycle.

### Task #8: Enforce encryption at rest (non-tailorable)
- Pattern A — confirm the non-tailorable encryption-at-rest control has no open exceptions; this control cannot be waived, only remediated.

### Task #9: Enforce transmission confidentiality/integrity
- Pattern A — confirm no open transmission-protection exceptions on the in-scope communication paths.

### Task #10: Enforce reauthentication/session timeout
- Pattern A — confirm the reauthentication/session-timeout configuration remains within the approved policy value.

### Task #11: Monitor denial-of-service protections/session authenticity
- Pattern A — the automated sensor is the DoS-protection and session-authenticity mechanism; review its alert disposition for the cycle.

### Task #16: Check/update malware-tool signatures
- Pattern C — authoritative source is the malware-tool vendor's signature feed mirrored locally; daily cadence.

### Task #18: Notify account manager on termination/transfer/need-to-know change
- Pattern Custom (tight-SLA event-driven personnel notification, per-event within 8–24 hours):
  1. Step — Receive termination/transfer/need-to-know-change notice from Personnel Security. Expected result: notice logged with receipt timestamp. Capture: the notice and receipt time. Stop/continue: if the notice is incomplete (no effective date/scope), stop and request clarification before the clock expires.
  2. Step — Notify the account manager function within the 8–24 hr window. Expected result: notification sent and acknowledged inside the window. Capture: notification timestamp and acknowledgment. Stop/continue: if the window is at risk of lapsing, escalate immediately per Section 6 rather than waiting.
  3. Step — Confirm the account manager took the corresponding account action (disable/modify). Expected result: confirmed action with timestamp. Capture: confirmation record. Stop/continue: continue.
  4. Step — Log cycle completion in the repository location specified in the Task Index. Expected result: event record filed. Capture: the log entry. Stop/continue: event complete.

### Task #21: Verify system clock/time-stamp synchronization
- Pattern A — automated daily check; review sync-failure exceptions.

### Task #23: Run periodic malicious-code (antivirus) scans
- Pattern A — review the weekly antivirus scan summary and alert queue.

### Task #24: Perform incremental backups
- Pattern A — confirm the daily-incremental/weekly-full backup job completed successfully for the cycle.

### Task #27: Perform vulnerability scanning
- Pattern A — review the vulnerability scanner's monthly run and finding queue; CAT and file per finding.

### Task #28: Update scanner vulnerability signatures
- Pattern C — authoritative source is the scanner vendor's signature feed; monthly cadence, ahead of Task #27's scan.

### Task #29: Check/report flaw-remediation (patch) status
- Pattern C — authoritative source is the patch-management feed; this task reports gap status rather than necessarily closing it (closure is Task #44).

### Task #30: Test backup integrity/restoration
- Pattern D — test plan is the approved backup-restoration procedure; monthly cadence, distinct from Task #24's routine backup execution.

### Task #35: Update system component inventory (manual/verification pass)
- Pattern B — reconcile the manual inventory pass against the automated Task #1 baseline; flag any discrepancy.

### Task #38: Monitor nonlocal maintenance session records
- Pattern B — baseline is the approved maintenance schedule; review nonlocal session records for unauthorized or unscheduled sessions.

### Task #41: Update PII/system-holdings inventory
- Pattern B — baseline is the Information Owner/Steward's current data map; this task's Accountable party is Information Owner/Steward, not ISSM (see Section 4).

### Task #42: Verify security function operation (self-tests)
- Pattern A — review the security-function self-test failure log for the cycle.

### Task #43: Verify software/firmware/information integrity
- Pattern A — review software/firmware/information integrity-check exceptions for the cycle.

### Task #44: Install security-relevant software/firmware updates
- Pattern C — authoritative source is the vendor/advisory patch feed; apply through change control within the 30-day window.

### Task #48: Review authorized software list
- Pattern B — baseline is the prior-cycle approved software list; flag any unauthorized addition.

### Task #50: Review unsupported system components (EOL/EOS)
- Pattern B — baseline is the vendor-published end-of-life/end-of-support schedule for in-scope components.

### Task #51: Verify encryption-at-rest compliance
- Pattern B — baseline is the non-tailorable SC-28 encryption-at-rest configuration standard.

### Task #52: Verify transmission encryption compliance
- Pattern B — baseline is the SC-8 transmission-encryption configuration standard.

### Task #54: Review remote access and wireless access authorization lists
- Pattern B — baseline is the prior-cycle approved remote-access/wireless authorization list.

### Task #56: Review access-enforcement/flow-enforcement rule sets
- Pattern B — baseline is the prior-cycle approved rule set; flag any undocumented rule change.

### Task #57: Verify device identification/authentication configuration
- Pattern B — baseline is the approved device-authentication configuration standard.

### Task #58: Verify configuration settings against baseline/STIG
- Pattern B — baseline is the current approved STIG/configuration baseline; this is the quarterly compliance-verification pass distinct from Task #70's annual baseline revision.

### Task #61: Verify media marking compliance
- Pattern B — baseline is the media-marking policy; sample in-scope media for the cycle.

### Task #62: Review transmission medium/output device access controls
- Pattern B — baseline is the approved access-control list for transmission media/output devices; note this task's Informed party is PSO, not AO/DAO.

### Task #65: Review boundary-protection rule set
- Pattern B — baseline is the prior-cycle approved boundary-protection (firewall/guard) rule set; complements Task #7's continuous log review.

### Task #66: Review spam protection mechanism effectiveness
- Pattern B — baseline is the spam-protection mechanism's expected detection rate; review the quarter's false-negative/false-positive trend.

### Task #69: Review inventory records for computers/removable media
- Pattern B — semi-annual; baseline is the prior-cycle approved inventory record.

### Task #70: Review/update baseline configuration
- Pattern E — annual documentation cycle; route through CCB per [ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md)'s configuration-change routing.

### Task #73: Test/exercise contingency plan
- Pattern D — test plan is the current approved contingency plan.

### Task #76: Review approved maintenance tools
- Pattern B — annual; baseline is the prior-cycle approved maintenance-tool list.

### Task #85: Review unnecessary functions/ports/protocols/services
- Pattern B — annual; baseline is the approved services/ports baseline from Task #70.

### Task #90: Rotate/manage cryptographic keys
- Pattern C — authoritative source is the organization's key-management policy/schedule; annual cadence.

### Task #98: Test information system recovery/reconstitution procedures
- Pattern D — test plan is the current approved recovery/reconstitution procedure, distinct from Task #73's broader contingency exercise.

### Task #99: Verify alternate storage/processing site and telecom readiness
- Pattern A — annual confirmation that the alternate site and telecom failover remain in a ready state.

### Task #103: Retain audit records offline
- Pattern G — retention window is the NARA schedule or 6–7 years (IRS analog), whichever governs; disposal candidates are audit records past that window.

### Task #104: Prevent identifier reuse for ≥2 years
- Pattern G — retention/non-reuse window is 2 years; "disposal candidate" here means an identifier eligible to be released back into the assignment pool, not a record for destruction.

### Task #106: Retain incident records
- Pattern G — retention window is 3 years after follow-up actions on the incident are complete, not 3 years from the incident date itself.

### Task #108: Execute PII retention/disposal per records schedule
- Pattern G — retention window is the organization's records schedule; this task's Accountable party is Information Owner/Steward, not ISSM (see Section 4).

## 6. Standard Validation, Evidence, Findings, Escalation, and Closure

This role follows the Standard Sections 6–10 (Validation, Evidence Package, Findings and Exceptions, Remediation and Escalation, Closure) defined in [_EXECUTION-PATTERNS.md](_EXECUTION-PATTERNS.md) for every task above. Role-specific delta: Privileged Users are never the Reviewed By/Approver party (Section 6/9 fields) for their own work — 47 of 49 tasks route to the ISSM and 2 (#41, #108) route to the Information Owner/Steward, per Section 4 above; a Privileged User closing out their own executing task without that sign-off has not completed the cycle.

## Sources

- [playbooks/roles/Privileged-Users.md](../../playbooks/roles/Privileged-Users.md)
- [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md)
- [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md)
- [reference/JSIG-source/section-1.5-roles-and-responsibilities.md § 1.5.16](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)
- [execution-plan/templates/ESCALATION-MATRIX.md](../templates/ESCALATION-MATRIX.md)
- [execution-plan/templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md](../templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md)
- [MAINTENANCE-PLAN.md §4](../../MAINTENANCE-PLAN.md)
