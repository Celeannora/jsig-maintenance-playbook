# Delegated Authorizing Official (DAO) — Actionable Task Runbook

The DAO is the delegated authorization official defined in [JSIG §1.5.6](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md), acting on behalf of the AO within the scope of a written delegation letter and coordinating with the SCA and ISO for delegated systems, per [playbooks/roles/DAO.md](../../playbooks/roles/DAO.md). Executes 0 Master Calendar tasks directly, is Accountable for 0, Consulted on 3, Informed on 83 — see [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md) Part B for the full rollup.

## 1. Role Overview

The DAO is an organizational official appointed in writing and authorized to act on behalf of an AO in carrying out and coordinating security-authorization activities, including — when explicitly delegated — the authority to authorize a system to operate. The DAO must be a government employee with a broad and strategic understanding of the DoD SAP Community, using that understanding to weigh competing equities (mission, security, budget, schedule, counterintelligence, civil liberties/privacy, and other policy requirements) when determining acceptable risk. See [playbooks/roles/DAO.md](../../playbooks/roles/DAO.md) for the full role narrative, JSIG-cited duties, and key artifacts owned.

## 2. Task Index

Per [role_task_index.json](../tools/data/role_task_index.json), the DAO has **0 executing** and **0 accountable** Master Calendar tasks — identical in shape to the AO: it does not perform hands-on control work, and it is never the named Accountable party on any of the 110 recurring tasks (that role falls to the ISSM, ISSO, PSO, SCA, or Information Owner/Steward per [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md)). It is **Consulted on 3 tasks** and **Informed on 83 tasks** — the same footprint as the AO, since the calendar's `AO/DAO` RACI entries name both roles jointly rather than distinguishing which one is actually reached day to day.

**Consulted tasks (3):**

| # | Task | Family | Frequency | Control ID(s) | Pattern |
|---|---|---|---|---|---|
| 36 | Maintain organization-level POA&M rollup | PM | Monthly | PM-4 | H |
| 37 | Maintain organization-wide information system inventory | PM | Monthly | PM-5 | H |
| 45 | Report information security performance measures | PM | Monthly/quarterly | PM-6 | H |

These three are consulted, not executed: the ISSM executes and is Accountable for each; the DAO's role — where the AO has delegated risk-determination authority for the systems in question — is to provide risk-tolerance input before the rollup/report is finalized, per Pattern H's consultation step.

**Informed tasks (83):** span nearly every control family on the calendar (CM, SI, SC, PE, CP, IR, PS, CA, RA, AC, AU, IA, MA, SA, PL, MP, and the omnibus "All 26" policy-review task) — see [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md) Part A for the authoritative per-task listing; every row where the Informed column reads "AO/DAO" is one of these 83.

Because the DAO holds no calendar-cadence executing or accountable task, its actual decision authority is event-driven and scoped by its delegation letter. The following table lists the DAO's JSIG-cited authorization/risk-acceptance governance actions, drawn from [playbooks/roles/DAO.md](../../playbooks/roles/DAO.md) and [JSIG §1.5.6](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md), each using Pattern H (Governance/Authorization Decision):

| # | Governance Action | JSIG Citation | Trigger | Pattern |
|---|---|---|---|---|
| 1 | Authorize a system to operate, if explicitly delegated that authority | [JSIG §1.5.6](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) | Initial authorization or reauthorization for a system within delegated scope | H |
| 2 | Approve the SSP, if delegated | [JSIG §1.5.6](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) | Annual SSP review, or a significant change, for a delegated system | H |
| 3 | Approve and monitor implementation of the POA&M, if delegated | [JSIG §1.5.6](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) | POA&M submission or monthly monitoring cycle for a delegated system | H |
| 4 | Determine the level of risk deemed acceptable when authorizing systems within delegated scope | [JSIG §1.5.6](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) | Any authorization decision within the delegation letter's stated impact levels (confidentiality/integrity/availability) | H |
| 5 | Receive ISSM/ISSO notification of changes or incidents that might affect the authorization of a delegated system | [JSIG §1.5.15(j)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) | A change or incident occurs on a system within delegated scope | H |
| 6 | Escalate to the AO any matter outside the scope of the delegation letter | [JSIG §1.5.6](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) | A decision required exceeds the delegated impact levels or authority stated in the delegation letter | H |

## 3. Preconditions

| Category | Requirement |
|---|---|
| Required Access | Visibility into the delegation letter's stated scope (systems, impact levels for C/I/A) and the monthly POA&M/inventory/performance-measure rollups for delegated systems |
| Required Tools | Local ticketing/GRC system (for reviewing rollups and logging delegated authorization decisions); no technical scanning or monitoring tools required for this role directly |
| Roles/Permissions Needed | Written delegation letter from the AO defining scope of delegated authority; authority to issue authorization determinations within that scope; no system-level account access needed |

## 4. RACI Position Summary

Like the AO, the DAO's RACI footprint is **0 executing, 0 accountable, 3 consulted, 83 informed** — the calendar treats "AO/DAO" as a single joint destination rather than separately routing to each. Being Consulted on only 3 tasks (all PM-family organizational rollups) means the DAO's routine touchpoint with the calendar is narrow, mirroring the AO. Being Informed on 83 of 110 tasks means the DAO is likewise a standing recipient of nearly all operational-tier output without being asked to act on each one. Operationally, this implies the same **passive-until-triggered oversight posture** as the AO, with one added dimension specific to the DAO: everything it does is bounded by its written delegation letter (impact levels for confidentiality, integrity, and availability), so the DAO's oversight/escalation posture has an explicit scope check built in — before acting on an Informed-party signal or a Consulted request, the DAO first confirms the matter falls within delegated scope, and escalates to the AO per Governance Action #6 if it does not. Per [ESCALATION-MATRIX.md §4](../templates/ESCALATION-MATRIX.md), a missed SLA on an ISSM-owned decision escalates automatically to the "AO/DAO" tier jointly, and per [VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md §4](../templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md), "AO / DAO" is named jointly as the Accountable (final accept/reject) authority for every CAT I variance/risk-acceptance record, with a 30-day SLA — so a DAO with delegated authority over the affected system can be the one who actually signs that CAT I decision, standing in for the AO, even though the DAO likewise never appears as the RACI "Accountable" party on the underlying routine task that surfaced the finding. Per [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md), no operational title is absorbed into the DAO role; its governance actions map directly to the JSIG-named role, scoped entirely by the AO's delegation letter.

## 5. Execution Procedures

The DAO has no executing tasks, so no per-task Execution Procedures subsections apply. The 3 Consulted tasks require no subsection either, per the Authoring Brief's rule that accountable/consulted-only rows need no full procedure. The DAO's governance actions from Section 2's table are procedurally identical to Pattern H's five steps as written in [_EXECUTION-PATTERNS.md](_EXECUTION-PATTERNS.md); the task-specific delta for each is:

### Governance Action #1: Authorize a system to operate, if delegated
- Pattern H (per [_EXECUTION-PATTERNS.md](_EXECUTION-PATTERNS.md)) — decision package is the full authorization/reauthorization submission; DAO first confirms the system falls within the delegation letter's scope before acting as Approver, in place of Pattern H's generic step 1 completeness check.

### Governance Action #2: Approve the SSP, if delegated
- Pattern H — decision package is the SSP and its version history; DAO is the Approver for delegated systems only, escalating to the AO otherwise.

### Governance Action #3: Approve and monitor POA&M implementation, if delegated
- Pattern H — decision package is the POA&M and its milestone-completion status; DAO's decision is monthly approval/continuation of the remediation plan for delegated systems.

### Governance Action #4: Determine acceptable risk within delegated scope
- Pattern H — decision package is the risk assessment and the delegation letter's stated impact-level ceiling; DAO renders the accept/reject/mitigate decision only up to that ceiling.

### Governance Action #5: Receive ISSM/ISSO notification of changes/incidents affecting authorization
- Pattern H — decision package is the ISSM/ISSO's notification record; DAO's decision is whether the change/incident requires a reauthorization action within delegated scope.

### Governance Action #6: Escalate matters outside delegated scope to the AO
- Pattern H — decision package is the matter itself plus a scope determination against the delegation letter; DAO is explicitly not the terminal Approver here — it routes the decision to the AO rather than rendering one, the one governance action where the DAO's role is referral rather than authorization.

## 6. Standard Validation, Evidence, Findings, Escalation, and Closure

This role follows the Standard Sections 6–10 (Validation, Evidence Package, Findings and Exceptions, Remediation and Escalation, Closure) defined in [_EXECUTION-PATTERNS.md](_EXECUTION-PATTERNS.md) for every action above. Role-specific delta: for systems within its delegated scope, the DAO shares the **AO/DAO joint terminal Approver and sign-off authority for CAT I findings** (30-day SLA per [ESCALATION-MATRIX.md](../templates/ESCALATION-MATRIX.md) §2 and the named Accountable role for CAT I in [VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md](../templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md) §4) even though the DAO is not the RACI "Accountable" party for the routine tasks that surface those findings — mirroring the AO's delta, but bounded by delegation scope. Unlike the AO, the DAO is **not** a terminal Approver for matters outside that scope (Governance Action #6) — those escalate one level further to the AO itself, a delta the AO's own runbook does not have.

## Sources

- [playbooks/roles/DAO.md](../../playbooks/roles/DAO.md)
- [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md)
- [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md)
- [references/JSIG-source/section-1.5-roles-and-responsibilities.md § 1.5.6](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)
- [execution-plan/templates/ESCALATION-MATRIX.md](../templates/ESCALATION-MATRIX.md)
- [execution-plan/templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md](../templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md)
- [MAINTENANCE-PLAN.md §4](../../MAINTENANCE-PLAN.md)
