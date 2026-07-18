# Risk Executive Function — Actionable Task Runbook

The Risk Executive (Function) (REF) is the organization-wide risk-visibility role defined in [JSIG §1.5.2](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md), serving as an adjunct advisor to the AO/DAO with no authorization authority of its own, per [playbooks/roles/Risk-Executive-Function.md](../../playbooks/roles/Risk-Executive-Function.md). Executes 0 Master Calendar tasks directly, is Accountable for 0, Consulted on 0, Informed on 3 — see [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md) Part B for the full rollup.

## 1. Role Overview

The REF ensures information-system risk — including authorization decisions — is viewed from an organization-wide perspective consistent with strategic goals, and that risk management is handled consistently across the organization alongside other risk types. It must be comprised of U.S. citizens who are government employees. See [playbooks/roles/Risk-Executive-Function.md](../../playbooks/roles/Risk-Executive-Function.md) for the full role narrative, JSIG-cited duties, and key artifacts owned.

## 2. Task Index

This role has **0 executing** and **0 accountable** Master Calendar tasks per [role_task_index.json](../tools/data/role_task_index.json) — it is Informed on 3 tasks (POA&M rollup, system inventory, and performance-measure reporting, all ISSM-executed/accountable) but performs no hands-on execution or sign-off itself. Its function is event-driven organization-wide governance rather than calendar-cadence operational work. The following table lists its JSIG-cited event-driven governance actions, drawn from [playbooks/roles/Risk-Executive-Function.md](../../playbooks/roles/Risk-Executive-Function.md) and [JSIG §1.5.2](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md), each using Pattern H (Governance/Authorization Decision):

| # | Governance Action | JSIG Citation | Trigger | Pattern |
|---|---|---|---|---|
| 1 | Develop/refresh the organization-wide risk management strategy | [JSIG §1.5.2](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)(b) | Annual strategy review, or a significant organizational/mission change | H |
| 2 | Provide oversight input into security categorization decisions to ensure consistent, effective risk-acceptance decisions | [JSIG §1.5.2](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)(d) | A system undergoes initial or revised security categorization | H |
| 3 | Facilitate sharing of risk-related information among AOs and senior leaders, including for reciprocity/shared-responsibility actions | [JSIG §1.5.2](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)(c), (g) | A reciprocity request or shared-responsibility authorization action arises between AOs | H |
| 4 | Advise the AO/DAO on an individual authorization decision, ensuring all mission/business factors are considered | [JSIG §1.5.2](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)(e) | An AO/DAO authorization package is submitted for decision | H |
| 5 | Elevate external/third-party service-provider risk to appropriate decision-making authorities | [JSIG §1.5.2](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)(h) | A new or changed external information/service provider relationship is identified | H |
| 6 | Identify the organizational risk posture based on aggregated risk across all systems the organization is responsible for | [JSIG §1.5.2](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)(i) | Periodic risk posture briefing to the Agency/Component Head, or a material change in aggregated risk | H |

## 3. Preconditions

| Category | Requirement |
|---|---|
| Required Access | Read access to organization-wide risk assessments, POA&M rollups, and system inventory outputs used as REF advisory inputs |
| Required Tools | Local ticketing/GRC system (for reviewing aggregated POA&M/inventory records); no technical scanning tools required for this role |
| Roles/Permissions Needed | Advisory standing with the AO/DAO; U.S. citizen, government-employee status per JSIG membership requirement — no authorization or system-account access needed |

## 4. RACI Position Summary

The REF is Informed (not Responsible or Accountable) on 3 Master Calendar tasks — the ISSM-executed, ISSM-accountable PM-4 POA&M rollup, PM-5 system inventory, and PM-6 performance-measure reporting cycles ([execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md) Part B) — meaning it receives these outputs as advisory inputs but takes no action on the calendar itself. Per [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md), no operational title is absorbed into this role; it advises the AO/DAO directly and, per [playbooks/roles/Risk-Executive-Function.md](../../playbooks/roles/Risk-Executive-Function.md), the ISSM may sit on or route through the Risk Executive Board where the REF convenes one.

## 5. Execution Procedures

### Governance Action #1: Develop/refresh the organization-wide risk management strategy
- Pattern H (per [_EXECUTION-PATTERNS.md](_EXECUTION-PATTERNS.md)) — decision package is the prior strategy plus current organizational risk assessment; REF renders and documents the updated strategy as its "decision," distributed to the Agency/Component Head, AO/DAO, and CIO as Informed parties.

### Governance Action #2: Provide oversight input into security categorization decisions
- Pattern H — decision package is the system's proposed categorization; REF's role is advisory input into the categorizing official's decision rather than the final decision itself, consulting the AO/DAO per its RACI position before the categorization is finalized.

### Governance Action #3: Facilitate risk-information sharing among AOs (reciprocity/shared responsibility)
- Pattern H — decision package is the reciprocity or shared-responsibility request from the requesting AO; REF's "decision" is the facilitation outcome (information shared, consensus reached) rather than an authorization itself.

### Governance Action #4: Advise the AO/DAO on an individual authorization decision
- Pattern H — decision package is the AO/DAO's authorization package; REF reviews and provides documented risk-context input but the AO/DAO — not the REF — renders the actual authorization decision, consistent with REF having no authorization authority of its own.

### Governance Action #5: Elevate external/third-party service-provider risk
- Pattern H — decision package is the identified external-provider risk; REF's decision is whether/how to elevate it to the appropriate decision-making authority, not to resolve the risk itself.

### Governance Action #6: Identify aggregated organizational risk posture
- Pattern H — decision package is the aggregated risk data across all systems (informed in part by the PM-4/PM-5/PM-6 outputs it receives); output is a documented risk-posture statement distributed to the Agency/Component Head.

## 6. Standard Validation, Evidence, Findings, Escalation, and Closure

This role follows the Standard Sections 6–10 (Validation, Evidence Package, Findings and Exceptions, Remediation and Escalation, Closure) defined in [_EXECUTION-PATTERNS.md](_EXECUTION-PATTERNS.md) for every action above. Role-specific delta: because the REF has no authorization authority, it is never the final Approver for any governance action above (unlike the Agency/Component Head or AO/DAO in their own runbooks) — its Section 6 "Reviewed By" is always itself as advisor, and its Section 9 "Approver" is always the AO/DAO or Agency/Component Head it advises.

## Sources

- [playbooks/roles/Risk-Executive-Function.md](../../playbooks/roles/Risk-Executive-Function.md)
- [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md)
- [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md)
- [references/JSIG-source/section-1.5-roles-and-responsibilities.md § 1.5.2](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)
- [MAINTENANCE-PLAN.md §4](../../MAINTENANCE-PLAN.md)
