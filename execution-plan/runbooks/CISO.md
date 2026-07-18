# Chief Information Security Officer (CISO) — Actionable Task Runbook

The CISO carries out the CIO's FISMA security responsibilities per [JSIG §1.5.4](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md), serving as the primary liaison between the CIO and the organization's AOs, ISOs, CCPs, and ISSM/ISSOs, per [playbooks/roles/CISO.md](../../playbooks/roles/CISO.md). Executes 0 Master Calendar tasks directly, is Accountable for 0, Consulted on 0, Informed on 6 — see [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md) Part B for the full rollup.

## 1. Role Overview

The CISO, also known as a Senior Information Security Officer, must possess professional qualifications for the role, maintain information security as a primary (not collateral) duty, and head an office resourced to help the organization achieve more secure information and systems, reporting FISMA activity within channels to the cognizant authority's SAPCO. It may also be appointed to coordinate, develop, implement, and maintain the organization-wide information security program. See [playbooks/roles/CISO.md](../../playbooks/roles/CISO.md) for the full role narrative, JSIG-cited duties, and key artifacts owned.

## 2. Task Index

This role has **0 executing** and **0 accountable** Master Calendar tasks per [role_task_index.json](../tools/data/role_task_index.json) — it is Informed on 6 Incident Response family tasks (all ISSM-accountable, ISSO-consulted) but performs no hands-on execution or sign-off itself. Its function is liaison/governance oversight rather than calendar-cadence operational work. The following table lists its JSIG-cited event-driven governance actions, drawn from [playbooks/roles/CISO.md](../../playbooks/roles/CISO.md) and [JSIG §1.5.4](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md), each using Pattern H (Governance/Authorization Decision):

| # | Governance Action | JSIG Citation | Trigger | Pattern |
|---|---|---|---|---|
| 1 | Coordinate, develop, implement, and maintain the organization-wide information security program (if appointed under PM-2) | [JSIG §1.5.4](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) | Program stand-up, or annual program plan review | H |
| 2 | Report FISMA activities within channels to the cognizant authority's SAPCO | [JSIG §1.5.4](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) | Recurring, aligned with the CIO's annual reporting cycle | H |
| 3 | Relay consolidated AO/ISO/CCP/ISSM/ISSO security posture information to the CIO | [JSIG §1.5.4](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) | Continuous liaison function, aggregated for the CIO's annual report | H |
| 4 | Maintain and demonstrate the professional qualifications required to administer information security program functions | [JSIG §1.5.4](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) | Annual qualification/training currency review, or upon appointment | H |

## 3. Preconditions

| Category | Requirement |
|---|---|
| Required Access | Visibility into consolidated security posture reporting relayed from AO, ISO, CCP, and ISSM/ISSO channels |
| Required Tools | Local ticketing/GRC system (for reviewing consolidated posture and incident-status roll-ups); no technical scanning tools required for this role |
| Roles/Permissions Needed | Liaison standing between the CIO and the AO/ISO/CCP/ISSM/ISSO community; U.S. citizen, government-employee status per JSIG requirement — no system-level account access needed |

## 4. RACI Position Summary

The CISO is Informed (not Responsible or Accountable) on 6 Master Calendar tasks — all in the Incident Response family (handling/monitoring, status updates, IR exercise, IR training, IR plan review, and incident-record retention), each ISSM-accountable and ISSO-consulted ([execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md) Part B) — meaning the CISO receives incident-program status but does not execute or approve these tasks. Per [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md), no operational title is absorbed into this role; it is the CIO's direct liaison to the ISSM/ISSO chain rather than a delegated executor.

## 5. Execution Procedures

### Governance Action #1: Coordinate/develop/implement/maintain the org-wide information security program
- Pattern H (per [_EXECUTION-PATTERNS.md](_EXECUTION-PATTERNS.md)) — decision package is the current program plan and resourcing state; CISO renders and documents program-plan decisions, distributed to the CIO and ISSM as Informed/coordinating parties.

### Governance Action #2: Report FISMA activities within channels to the SAPCO
- Pattern H — decision package is the aggregated FISMA activity data for the reporting period; CISO's decision is what to certify upward through channels, not a technical remediation decision.

### Governance Action #3: Relay consolidated security posture to the CIO
- Pattern H — decision package is the incoming posture data from AO/ISO/CCP/ISSM/ISSO channels (including the 6 IR-family tasks this role is Informed on); CISO's "decision" is what synthesis/escalation the CIO needs to see, not the underlying technical finding itself.

### Governance Action #4: Maintain professional qualifications currency
- Pattern H — decision package is the CISO's own training/experience record against the JSIG-required standard; this is a self-attestation-style governance action reviewed by the CIO rather than a technical control decision.

## 6. Standard Validation, Evidence, Findings, Escalation, and Closure

This role follows the Standard Sections 6–10 (Validation, Evidence Package, Findings and Exceptions, Remediation and Escalation, Closure) defined in [_EXECUTION-PATTERNS.md](_EXECUTION-PATTERNS.md) for every action above. Role-specific delta: for the 6 Incident Response tasks where the CISO is an Informed party, the CISO's Section 6 "Reviewed By" role is receipt-of-notification only — the ISSM remains the Accountable party and Approver per [ESCALATION-MATRIX.md](../templates/ESCALATION-MATRIX.md); the CISO does not independently re-validate those cycles.

## Sources

- [playbooks/roles/CISO.md](../../playbooks/roles/CISO.md)
- [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md)
- [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md)
- [references/JSIG-source/section-1.5-roles-and-responsibilities.md § 1.5.4](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)
- [MAINTENANCE-PLAN.md §4](../../MAINTENANCE-PLAN.md)
