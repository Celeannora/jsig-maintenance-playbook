# Information System Security Engineer (ISSE) — Actionable Task Runbook

The ISSE is the security-engineering role defined in [JSIG §1.5.13](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md), sitting alongside the ISO's development team and coordinating with the SCA at design-review milestones, per [playbooks/roles/ISSE.md](../../playbooks/roles/ISSE.md). Executes 0 Master Calendar tasks directly, is Accountable for 0, Consulted on 0, Informed on 0 — see [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md) Part B for the full rollup.

## 1. Role Overview

The ISSE conducts information system security engineering: capturing and refining security requirements and ensuring they are effectively integrated into information systems through security architecting, design, development, and configuration. The ISSE is an integral member of the development team designing or upgrading a system, applying secure-design, secure-architecture, and secure-coding best practices rather than performing calendar-cadence compliance monitoring. See [playbooks/roles/ISSE.md](../../playbooks/roles/ISSE.md) for the full role narrative, JSIG-cited duties, and key artifacts owned.

## 2. Task Index

This role has **0 executing** and **0 accountable** Master Calendar tasks per [role_task_index.json](../tools/data/role_task_index.json) — it does not appear as Responsible, Accountable, Consulted, or Informed on any of the 110 Master Calendar tasks. This is consistent with its nature: the ISSE's work is tied to development milestones and system-modification events, not a recurring operational calendar. Its recurring-adjacent duties (security architecture currency, risk-assessment support) are executed and tracked by the ISSM/SCA per [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md), with the ISSE's own contribution occurring upstream, at design and development time, rather than on the calendar itself. The following table lists its JSIG-cited event-driven governance/design-consult actions, drawn from [playbooks/roles/ISSE.md](../../playbooks/roles/ISSE.md) and [JSIG §1.5.13](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md), each using Pattern H (Governance/Authorization Decision):

| # | Governance/Design-Consult Action | JSIG Citation | Trigger | Pattern |
|---|---|---|---|---|
| 1 | Ensure the information system is designed, developed, and implemented with required security features and safeguards | [JSIG §1.5.13](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) | New system development or major upgrade effort begins | H |
| 2 | Verify enhancements to existing/legacy systems provide equal or improved security features and safeguards | [JSIG §1.5.13](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) | A proposed enhancement or legacy-system upgrade is submitted | H |
| 3 | Participate in security control assessment coordination with the SCA, most importantly at Preliminary Design Review (PDR) and Critical Design Review (CDR) | [JSIG §1.5.12(f)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) (ISO/SCA coordination point the ISSE supports) | System reaches PDR or CDR milestone | H |
| 4 | Maintain a written ISSE appointment letter (including combined ISSM/ISSO+ISSE scope, if applicable) | [JSIG §1.5.13](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) | Initial appointment, or a role/scope change | H |

## 3. Preconditions

| Category | Requirement |
|---|---|
| Required Access | Access to system design/development artifacts (architecture documentation, secure-coding review records); visibility into the development team's milestone schedule (PDR/CDR) |
| Required Tools | Local ticketing/GRC system (for logging design-review and appointment records); no technical scanning or monitoring tools required for this role directly |
| Roles/Permissions Needed | Written appointment as ISSE (or combined ISSM/ISSO+ISSE appointment); standing coordination access with the ISO's development team and the SCA |

## 4. RACI Position Summary

The ISSE does not appear as Responsible, Accountable, Consulted, or Informed on any of the 110 Master Calendar tasks ([execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md) Part B) — its contribution is structurally upstream of the calendar, embedded in development milestones rather than recurring operational checks. Per [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md), no operational title is absorbed into this role and it receives no delegated calendar tasks; where the ISSM or ISSO is also appointed as the ISSE, that individual performs the ISSE actions above in addition to, not instead of, their ISSM/ISSO task set.

## 5. Execution Procedures

### Governance/Design-Consult Action #1: Ensure required security features/safeguards are designed and implemented
- Pattern H (per [_EXECUTION-PATTERNS.md](_EXECUTION-PATTERNS.md)) — decision package is the system's design/architecture documentation against its security requirements; ISSE's decision is a documented sufficiency determination before development proceeds.

### Governance/Design-Consult Action #2: Verify enhancements provide equal or improved safeguards
- Pattern H — decision package is the proposed enhancement's design change and its security-impact comparison against the current baseline; ISSE consults the ISSM/ISSO for operational-security continuity per Pattern H step 3 before finalizing.

### Governance/Design-Consult Action #3: Participate in SCA coordination at PDR/CDR
- Pattern H — decision package is the design-review artifact set presented at PDR/CDR; ISSE's input feeds the SCA's assessment rather than rendering an independent authorization decision.

### Governance/Design-Consult Action #4: Maintain written ISSE appointment
- Pattern H — decision package is the current appointment letter and any role/scope change; output is a renewed or corrected appointment record, filed with the ISO.

## 6. Standard Validation, Evidence, Findings, Escalation, and Closure

This role follows the Standard Sections 6–10 (Validation, Evidence Package, Findings and Exceptions, Remediation and Escalation, Closure) defined in [_EXECUTION-PATTERNS.md](_EXECUTION-PATTERNS.md) for every action above. No role-specific delta applies — the ISSE is not a terminal Approver for any technical finding and holds no CAT-level sign-off authority under [ESCALATION-MATRIX.md](../templates/ESCALATION-MATRIX.md) or [VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md](../templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md) §4; its design-sufficiency determinations feed the ISO/SCA/ISSM chain rather than closing a finding directly.

## Sources

- [playbooks/roles/ISSE.md](../../playbooks/roles/ISSE.md)
- [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md)
- [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md)
- [references/JSIG-source/section-1.5-roles-and-responsibilities.md § 1.5.13](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)
- [MAINTENANCE-PLAN.md §4](../../MAINTENANCE-PLAN.md)
