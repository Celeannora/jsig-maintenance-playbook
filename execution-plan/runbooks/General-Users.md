# General Users — Actionable Task Runbook

General Users are individuals granted standard (non-privileged) access to an information system to perform mission, business, or operational tasks, per [JSIG §1.5.17](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md), which defines this role entirely by reference to Account Management [AC-2] and Rules of Behavior [PL-4] rather than an enumerated duty list, per [playbooks/roles/General-Users.md](../../playbooks/roles/General-Users.md). Executes 0 Master Calendar tasks directly, is Accountable for 0, Consulted on 0, Informed on 0 — see [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md) Part B for the full rollup.

## 1. Role Overview

General Users are the subjects of, not the operators of, the recurring control tasks in this plan: they acknowledge rules of behavior, complete required training, and report incidents they encounter, but the ISSO/ISSM/Information Owner/Steward own the actual account-management, training-delivery, and rules-of-behavior control tasks that govern them. See [playbooks/roles/General-Users.md](../../playbooks/roles/General-Users.md) for the full role narrative, JSIG-cited duties, and key artifacts owned.

## 2. Task Index

This role has **0 executing** and **0 accountable** Master Calendar tasks per [role_task_index.json](../tools/data/role_task_index.json) — it does not appear as Responsible, Accountable, Consulted, or Informed on any of the 110 Master Calendar tasks. Its function is entirely individual compliance/duty actions rather than calendar-cadence control operation. The following table lists its JSIG-cited event-driven duty actions, drawn from [playbooks/roles/General-Users.md](../../playbooks/roles/General-Users.md) and [JSIG §1.5.17](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) (by reference to AC-2 and PL-4), each using Pattern H (Governance/Authorization Decision) at the individual-compliance scale:

| # | Duty Action | JSIG Citation | Trigger | Pattern |
|---|---|---|---|---|
| 1 | Acknowledge Rules of Behavior before and during system access | [JSIG §1.5.17](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) (PL-4) | Account creation; annual re-acknowledgment thereafter | H |
| 2 | Complete initial and annual security awareness training | [JSIG §1.5.17](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) (by reference; delivered under AT-2) | Onboarding; annual refresher cycle | H |
| 3 | Report change in need-to-know or employment status promptly | [JSIG §1.5.17](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) (AC-2) | Any change affecting account eligibility (role change, transfer, separation) | H |
| 4 | Report suspected security incidents encountered during normal use | [JSIG §1.5.15(e)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) (ISSO intake duty this role's reports feed) | Any suspected incident observed | H |
| 5 | Rotate/refresh personal authenticators as required | [JSIG §1.5.17](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) (by reference; IA-5) | Per organization-defined credential-refresh cadence | H |

## 3. Preconditions

| Category | Requirement |
|---|---|
| Required Access | Standard (non-privileged) account on the information system(s) the individual is authorized to use; no administrative or audit-tool access |
| Required Tools | Local ticketing/GRC system (for submitting incident reports and account-change notifications); no scanning, monitoring, or administrative tools required for this role |
| Roles/Permissions Needed | Verified clearance, authorization, and need-to-know per ISSO intake before account issuance; no elevated permissions of any kind |

## 4. RACI Position Summary

General Users do not appear as Responsible, Accountable, Consulted, or Informed on any of the 110 Master Calendar tasks ([execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md) Part B) — the ISSO verifies eligibility and confirms security-responsibility awareness before granting access ([JSIG §1.5.15(e)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)), and the ISSM/Training Manager and Information Owner/Steward own the corresponding calendar-driven training-delivery and rules-of-behavior tasks that General Users are merely the subject of. Per [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md), no operational title is absorbed into this role and none of its individual-compliance actions are delegated elsewhere.

## 5. Execution Procedures

### Duty Action #1: Acknowledge Rules of Behavior
- Pattern H (per [_EXECUTION-PATTERNS.md](_EXECUTION-PATTERNS.md)) — the "decision package" here is the current Rules of Behavior document; the individual's acknowledgment is itself the recorded decision, filed by the ISSO/account-management function rather than a separate approver.

### Duty Action #2: Complete security awareness training
- Pattern H — decision package is the training completion requirement for the current cycle; the individual's completion record is the output, tracked by the Training Manager function per [MAINTENANCE-PLAN §2](../../MAINTENANCE-PLAN.md#2-roles--responsibilities) rather than by the General User.

### Duty Action #3: Report need-to-know/status change
- Pattern H — decision package is the individual's changed circumstances; output is a notification to Personnel Security/the ISSO within the applicable window so the account can be updated or disabled.

### Duty Action #4: Report suspected security incidents
- Pattern H — decision package is the observed anomaly; output is an incident report submitted to the ISSO, which triggers the ISSO's own incident-handling Master Calendar task rather than any calendar task of this role's own.

### Duty Action #5: Rotate personal authenticators
- Pattern H — decision package is the credential-refresh requirement for the current cycle; output is the individual's authenticator change, enforced/verified by the system's account-management control rather than self-tracked.

## 6. Standard Validation, Evidence, Findings, Escalation, and Closure

This role follows the Standard Sections 6–10 (Validation, Evidence Package, Findings and Exceptions, Remediation and Escalation, Closure) defined in [_EXECUTION-PATTERNS.md](_EXECUTION-PATTERNS.md) for every action above. No role-specific delta applies — General Users are never a terminal Approver or Escalation Owner for any finding; a non-completion or unacknowledged item escalates to the individual's supervisor or the Personnel Security function per the role's playbook rather than being resolved by the General User.

## Sources

- [playbooks/roles/General-Users.md](../../playbooks/roles/General-Users.md)
- [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md)
- [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md)
- [references/JSIG-source/section-1.5-roles-and-responsibilities.md § 1.5.17](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)
- [MAINTENANCE-PLAN.md §4](../../MAINTENANCE-PLAN.md)
