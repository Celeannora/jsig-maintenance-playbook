# Authorizing Official (AO) — Actionable Task Runbook

The AO is the senior authorization official defined in [JSIG §1.5.5](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md), sitting above the ISSM/ISSO operational tier and coordinating with the REF, CIO, CISO, CCP, ISO, and SCA during the security authorization process, per [playbooks/roles/AO.md](../../playbooks/roles/AO.md). Executes 0 Master Calendar tasks directly, is Accountable for 0, Consulted on 3, Informed on 83 — see [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md) Part B for the full rollup.

For the real verbatim JSIG title behind any Control ID cited in this runbook, see [CONTROL-LANGUAGE-CROSSWALK.md](../CONTROL-LANGUAGE-CROSSWALK.md), which reconciles every Control ID in the Master Calendar against the full verbatim JSIG family extractions.

## 1. Role Overview

The AO is a senior official or executive with authority to formally assume responsibility for operating an information system at an acceptable level of risk to organizational operations, assets, individuals, other organizations, and national security. The AO must be a U.S. citizen and government employee, typically holds budgetary oversight or mission/business responsibility for the system, and — through the security authorization process — is accountable for the security risks associated with system operation. See [playbooks/roles/AO.md](../../playbooks/roles/AO.md) for the full role narrative, JSIG-cited duties, and key artifacts owned.

## 2. Task Index

Per [role_task_index.json](../tools/data/role_task_index.json), the AO has **0 executing** and **0 accountable** Master Calendar tasks — it does not perform hands-on control work, and it is never the named Accountable party on any of the 110 recurring tasks (that role falls to the ISSM, ISSO, PSO, SCA, or Information Owner/Steward per [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md)). It is, however, **Consulted on 3 tasks** and **Informed on 83 tasks** — the largest Informed-party footprint of any role in the matrix, reflecting its position as the organization-wide risk-acceptance authority that must retain visibility into virtually every operational control area even though it does not execute or sign off on the routine task itself.

**Consulted tasks (3):**

| # | Task | Family | Frequency | Control ID(s) | Pattern |
|---|---|---|---|---|---|
| 36 | Maintain organization-level POA&M rollup | PM | Monthly | PM-4 | H |
| 37 | Maintain organization-wide information system inventory | PM | Monthly | PM-5 | H |
| 45 | Report information security performance measures | PM | Monthly/quarterly | PM-6 | H |

These three are consulted, not executed: the ISSM executes and is Accountable for each; the AO's role is to provide organization-wide risk-tolerance input before the rollup/report is finalized, per Pattern H's consultation step.

**Informed tasks (83):** span nearly every control family on the calendar (CM, SI, SC, PE, CP, IR, PS, CA, RA, AC, AU, IA, MA, SA, PL, MP, and the omnibus "All 26" policy-review task). Rather than list all 83 rows here — they are simply the full Master Calendar minus the handful of PM/AR/AT-family tasks routed to the ISSM or Information Owner/Steward as Informed party instead — see [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md) Part A for the authoritative per-task listing; every row where the Informed column reads "AO/DAO" is one of these 83.

Because the AO holds no calendar-cadence executing or accountable task, its actual decision authority is event-driven rather than calendar-driven. The following table lists the AO's JSIG-cited authorization/risk-acceptance governance actions, drawn from [playbooks/roles/AO.md](../../playbooks/roles/AO.md) and [JSIG §1.5.5](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md), each using Pattern H (Governance/Authorization Decision):

| # | Governance Action | JSIG Citation | Trigger | Pattern |
|---|---|---|---|---|
| 1 | Approve/deny security authorization (ATO) and reauthorization decisions | [JSIG §1.5.5(a)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md) | Initial authorization, scheduled reauthorization, or a significant system/environment change | H |
| 2 | Receive and act on the SCA's Security Assessment Report (SAR) and recommended authorization decision | [JSIG §1.5.5(a)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md) | Conclusion of each independent security control assessment | H |
| 3 | Approve SSP, POA&M, and MOA/MOUs; determine whether a change requires reauthorization | [JSIG §1.5.5(j)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md) | Annual SSP review, or an ISO/ISSM change-impact submission | H |
| 4 | Receive ISSM escalation of unresolved/serious security violations and vulnerabilities, and CAT I findings under the Escalation Matrix | [JSIG §1.5.14(t)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md); [ESCALATION-MATRIX.md §4](../templates/ESCALATION-MATRIX.md) | A CAT I finding is identified, or a CAT I SLA is at risk of being missed | H |
| 5 | Deny authorization, or halt operations of an already-operational system, upon unacceptable risk | [JSIG §1.5.5(k)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md) | An assessment, incident, or escalated finding reveals unacceptable risk | H |
| 6 | Adjudicate ISSM/ISSO configuration-change veto appeals | [JSIG §1.5.14(q)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md) | An ISSM/ISSO vetoes a proposed change and the requester appeals | H |

## 3. Preconditions

| Category | Requirement |
|---|---|
| Required Access | Visibility into organization-wide authorization status, the monthly POA&M/inventory/performance-measure rollups, and the full Informed-party distribution stream from the 83 Informed tasks |
| Required Tools | Local ticketing/GRC system (for reviewing rollups and logging authorization decisions); no technical scanning or monitoring tools required for this role directly |
| Roles/Permissions Needed | Executive authority to issue and sign written security authorization statements; authority to deny authorization or halt operations; no system-level account access needed |

## 4. RACI Position Summary

The AO's RACI footprint is deliberately asymmetric: **0 executing, 0 accountable, 3 consulted, 83 informed.** Being Consulted on only 3 tasks (all PM-family organizational rollups) means the AO's routine touchpoint with the calendar is narrow and intentional — it is asked for organization-wide risk-tolerance input only where a decision genuinely needs it, not on every control check. Being Informed on 83 of 110 tasks — the largest Informed footprint of any role — means the opposite: the AO is a standing recipient of nearly all operational-tier output (scan results, backup tests, access reviews, training completions, and more) without being asked to act on each one. Operationally, this Consulted-on-3/Informed-on-83 shape implies a **passive-until-triggered oversight posture**: the AO's job on the routine calendar is to remain positioned to notice patterns and receive escalations, not to review or sign every artifact that flows past it. That posture flips to active the moment a CAT I finding, an unresolved violation, a significant system change, or a configuration-change veto appeal is escalated — at which point the AO becomes the terminal decision-maker even though it never appeared as the RACI "Accountable" party on the underlying routine task. Per [ESCALATION-MATRIX.md §4](../templates/ESCALATION-MATRIX.md), a missed SLA on an ISSM-owned decision escalates automatically to the AO/DAO, and per [VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md §4](../templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md), the AO/DAO is the named Accountable (final accept/reject) authority for every CAT I variance/risk-acceptance record, with a 30-day SLA — the AO's authorization-official authority under JSIG operates independently of, and above, its narrow RACI task footprint. Per [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md), no operational title is absorbed into the AO role; its governance actions map directly to the JSIG-named role with no delegation ambiguity, though the AO may delegate specific authorization activities to a DAO.

## 5. Execution Procedures

The AO has no executing tasks, so no per-task Execution Procedures subsections apply (Section 5's rows are reserved for a role's executing-task table, which is empty here). The 3 Consulted tasks require no subsection either, per the Authoring Brief's rule that accountable/consulted-only rows need no full procedure. The AO's governance actions from Section 2's table are procedurally identical to Pattern H's five steps as written in [_EXECUTION-PATTERNS.md](_EXECUTION-PATTERNS.md); the task-specific delta for each is:

### Governance Action #1: Approve/deny authorization and reauthorization decisions
- Pattern H (per [_EXECUTION-PATTERNS.md](_EXECUTION-PATTERNS.md)) — decision package is the full authorization/reauthorization submission (SSP, SAR, POA&M); AO is the terminal Approver, with no further escalation tier above it for this decision.

### Governance Action #2: Receive and act on the SCA's SAR and recommendation
- Pattern H — decision package is the SCA's SAR and recommended authorization decision; AO consults the REF per Pattern H step 3 before finalizing.

### Governance Action #3: Approve SSP, POA&M, and MOA/MOUs; determine reauthorization need
- Pattern H — decision package is the document set plus, where applicable, the ISO/ISSM's change-impact analysis; AO's decision determines whether the change triggers reauthorization.

### Governance Action #4: Receive escalation of unresolved violations, vulnerabilities, and CAT I findings
- Pattern H — decision package is the ISSM's escalation record or the CAT I variance/risk-acceptance record per [VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md](../templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md) §4; AO is the named Accountable signer for CAT I records, within the 30-day SLA in [ESCALATION-MATRIX.md](../templates/ESCALATION-MATRIX.md) §2.

### Governance Action #5: Deny authorization or halt operations upon unacceptable risk
- Pattern H — decision package is the assessment/incident/escalation record showing unacceptable risk; AO is the terminal Approver — this is the AO's non-delegable denial/halt authority under JSIG §1.5.5(k).

### Governance Action #6: Adjudicate configuration-change veto appeals
- Pattern H — decision package is the ISSM/ISSO's veto rationale and the requester's appeal; AO is the terminal Approver for the appeal.

## 6. Standard Validation, Evidence, Findings, Escalation, and Closure

This role follows the Standard Sections 6–10 (Validation, Evidence Package, Findings and Exceptions, Remediation and Escalation, Closure) defined in [_EXECUTION-PATTERNS.md](_EXECUTION-PATTERNS.md) for every action above. Role-specific delta: the AO is the **terminal Approver and sign-off authority for CAT I findings** (30-day SLA per [ESCALATION-MATRIX.md](../templates/ESCALATION-MATRIX.md) §2 and the named Accountable role for CAT I in [VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md](../templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md) §4) even though the AO is not the RACI "Accountable" party for the routine tasks that surface those findings — this is the one point where the AO's event-driven authorization authority overrides its otherwise Consulted/Informed-only position on the calendar. For authorization/denial/halt decisions themselves (Governance Actions #1, #5, #6), the AO is likewise the terminal Approver with no escalation tier above it.

## Sources

- [playbooks/roles/AO.md](../../playbooks/roles/AO.md)
- [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md)
- [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md)
- [reference/JSIG-source/section-1.5-roles-and-responsibilities.md § 1.5.5](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)
- [execution-plan/templates/ESCALATION-MATRIX.md](../templates/ESCALATION-MATRIX.md)
- [execution-plan/templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md](../templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md)
- [MAINTENANCE-PLAN.md §4](../../MAINTENANCE-PLAN.md)
