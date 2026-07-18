# Information System Owner (ISO) — Actionable Task Runbook

The ISO is the system-lifecycle-owning official defined in [JSIG §1.5.12](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md), coordinating with the AO, SCA, Information Owner/Steward, and ISSM/ISSO per [playbooks/roles/ISO.md](../../playbooks/roles/ISO.md). Executes 0 Master Calendar tasks directly, is Accountable for 0, Consulted on 0, Informed on 0 — see [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md) Part B for the full rollup.

For the real verbatim JSIG title behind any Control ID cited in this runbook, see [CONTROL-LANGUAGE-CROSSWALK.md](../CONTROL-LANGUAGE-CROSSWALK.md), which reconciles every Control ID in the Master Calendar against the full verbatim JSIG family extractions.

## 1. Role Overview

The ISO is an organizational official (government PM, or contractor PM for contractor-owned systems) responsible for the procurement, development, integration, modification, operation, maintenance, and disposal of an information system, addressing the operational interests of the user community and ensuring compliance with information security requirements throughout the system's lifecycle. See [playbooks/roles/ISO.md](../../playbooks/roles/ISO.md) for the full role narrative, JSIG-cited duties, and key artifacts owned.

## 2. Task Index

This role has **0 executing** and **0 accountable** Master Calendar tasks per [role_task_index.json](../tools/data/role_task_index.json) — it does not appear as Responsible, Accountable, Consulted, or Informed on any of the 110 Master Calendar tasks. Its function is entirely lifecycle/acquisition governance rather than calendar-cadence operational work; the recurring compliance-monitoring tasks it depends on (SSP maintenance, POA&M updates, risk assessment currency) are executed and tracked by the ISSM/SCA per [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md) rather than by the ISO directly on the calendar. The following table lists its JSIG-cited event-driven governance actions, drawn from [playbooks/roles/ISO.md](../../playbooks/roles/ISO.md) and [JSIG §1.5.12](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md), each using Pattern H (Governance/Authorization Decision):

| # | Governance Action | JSIG Citation | Trigger | Pattern |
|---|---|---|---|---|
| 1 | Produce/develop security documentation (SSP, POA&M, Security Assessment Plan) and submit the authorization package to the AO via the SCA | [JSIG §1.5.12(l)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) | Initial authorization, reauthorization, or significant system change | H |
| 2 | Determine, with the Information Owner/Steward, individuals eligible for access and required privilege/access-rights types | [JSIG §1.5.12(d)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) | New user population identified, or a role/mission change alters access needs | H |
| 3 | Resource and appoint an ISSE in writing when required by DoDI 5000.02/CA SAPCO direction | [JSIG §1.5.12(e)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) | System development effort meets the DoDI 5000.02 ISSE-appointment threshold | H |
| 4 | Coordinate with the AO to identify the appropriate SCA (or AO designee), particularly at Preliminary/Critical Design Review | [JSIG §1.5.12(f)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) | System enters design phase (PDR/CDR), or an assessment cycle begins | H |
| 5 | Advise the AO/DAO of Configuration Management decisions during system development or delivery | [JSIG §1.5.12(g)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) | A CM decision is made on a system under development or delivery | H |
| 6 | Determine whether a significant change to the system or its environment requires reauthorization | [JSIG §1.5.12(c)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md), [(n)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) | A proposed or completed change to the system or its environment of operation | H |

## 3. Preconditions

| Category | Requirement |
|---|---|
| Required Access | Read/write access to the system's authorization-package documents (SSP, SAR, POA&M); visibility into acquisition/development-lifecycle milestones and CM decisions |
| Required Tools | Local ticketing/GRC system (for POA&M and authorization-package tracking); no technical scanning tools required for this role directly |
| Roles/Permissions Needed | Program-management authority over the system's procurement/development/operation/disposal lifecycle; authority to appoint an ISSE in writing when required |

## 4. RACI Position Summary

The ISO does not appear as Responsible, Accountable, Consulted, or Informed on any of the 110 Master Calendar tasks ([execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md) Part B) — the recurring compliance-monitoring work that feeds the ISO's authorization package (SSP currency, POA&M updates, risk-assessment refresh) is executed and tracked by the ISSM and SCA on the calendar, with the ISO consuming their output as lifecycle/acquisition governance input rather than performing or being scored against a calendar task itself. Per [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md), no operational title is absorbed into this role; its governance actions map directly to the JSIG-named role with no delegation ambiguity.

## 5. Execution Procedures

### Governance Action #1: Produce security documentation and submit the authorization package via the SCA
- Pattern H (per [_EXECUTION-PATTERNS.md](_EXECUTION-PATTERNS.md)) — decision package is the assembled SSP/POA&M/Security Assessment Plan; ISO's decision is package completeness and readiness before submission to the SCA for onward routing to the AO.

### Governance Action #2: Determine access eligibility and privilege types with the Information Owner/Steward
- Pattern H — decision package is the proposed user population and access-rights request; ISO and Information Owner/Steward jointly render the eligibility/privilege decision before provisioning begins.

### Governance Action #3: Resource and appoint an ISSE in writing
- Pattern H — decision package is the development effort's DoDI 5000.02 applicability and candidate ISSE qualifications; output is a written appointment or a documented determination that no appointment is required.

### Governance Action #4: Coordinate with the AO to identify the appropriate SCA
- Pattern H — decision package is the system's design-review schedule and assessment scope; ISO's decision is timing SCA involvement no later than PDR/CDR.

### Governance Action #5: Advise the AO/DAO of Configuration Management decisions
- Pattern H — decision package is the CM decision record from the development-phase CCB or equivalent; ISO's action is a notification/advisory decision to the AO/DAO rather than a technical approval.

### Governance Action #6: Determine whether a change requires reauthorization
- Pattern H — decision package is the change description and its security-impact analysis; ISO renders a documented reauthorization-required / not-required determination, escalating to the AO where the determination is not clear-cut.

## 6. Standard Validation, Evidence, Findings, Escalation, and Closure

This role follows the Standard Sections 6–10 (Validation, Evidence Package, Findings and Exceptions, Remediation and Escalation, Closure) defined in [_EXECUTION-PATTERNS.md](_EXECUTION-PATTERNS.md) for every action above. No role-specific delta applies — the ISO routes findings and reauthorization determinations to the AO/SCA per the standard chain rather than serving as a terminal Approver for any technical finding.

## Sources

- [playbooks/roles/ISO.md](../../playbooks/roles/ISO.md)
- [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md)
- [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md)
- [references/JSIG-source/section-1.5-roles-and-responsibilities.md § 1.5.12](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)
- [MAINTENANCE-PLAN.md §4](../../MAINTENANCE-PLAN.md)
