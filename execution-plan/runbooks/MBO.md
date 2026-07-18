# Mission/Business Owner (MBO) — Actionable Task Runbook

The MBO is the organizational official with operational responsibility for the mission or business process a system supports, and the key stakeholder for system lifecycle decisions, per [JSIG §1.5.11](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md), sitting alongside the AO and Information System Owner as a governance-tier stakeholder rather than an operational-control executor per [playbooks/roles/MBO.md](../../playbooks/roles/MBO.md). Executes 0 Master Calendar tasks directly, is Accountable for 0, Consulted on 0, Informed on 0 — see [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md) Part B for the full rollup.

For the real verbatim JSIG title behind any Control ID cited in this runbook, see [CONTROL-LANGUAGE-CROSSWALK.md](../CONTROL-LANGUAGE-CROSSWALK.md), which reconciles every Control ID in the Master Calendar against the full verbatim JSIG family extractions.

## 1. Role Overview

The MBO ensures information security requirements are integrated into the system development life cycle and represents mission/business risk tolerance into AO authorization decisions, but does not itself perform or sign off on any recurring Master Calendar control task. See [playbooks/roles/MBO.md](../../playbooks/roles/MBO.md) for the full role narrative, JSIG-cited duties, and key artifacts owned.

## 2. Task Index

This role has **0 executing** and **0 accountable** Master Calendar tasks per [role_task_index.json](../tools/data/role_task_index.json) — it does not appear as Responsible, Accountable, Consulted, or Informed on any of the 110 Master Calendar tasks. Its function is entirely event-driven mission/business stakeholder governance rather than calendar-cadence operational work. The following table lists its JSIG-cited event-driven governance actions, drawn from [playbooks/roles/MBO.md](../../playbooks/roles/MBO.md) and [JSIG §1.5.11](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md), each using Pattern H (Governance/Authorization Decision):

| # | Governance Action | JSIG Citation | Trigger | Pattern |
|---|---|---|---|---|
| 1 | Confirm information security requirements remain integrated into SDLC/acquisition activities for the mission/business system | [JSIG §1.5.11](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) | Annual review, or a major lifecycle milestone (e.g., PDR/CDR) | H |
| 2 | Participate in system lifecycle decisions affecting the mission/business process | [JSIG §1.5.11](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) | Major system change, modernization, or decommissioning trigger | H |
| 3 | Review resourcing/budget adequacy for mission-supporting IS security | [JSIG §1.5.11](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) | Annual budget cycle | H |
| 4 | Confirm business-continuity/contingency priorities for the mission process are reflected in the contingency plan | [JSIG §1.5.11](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) | Annual, aligned with contingency plan review cycle | H |
| 5 | Review risk-acceptance implications for the mission/business process ahead of AO reauthorization decisions | [JSIG §1.5.11](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) | Annual at minimum, or ahead of a reauthorization decision | H |

## 3. Preconditions

| Category | Requirement |
|---|---|
| Required Access | Visibility into the mission/business system's SDLC/acquisition status, budget/resourcing roll-ups, and contingency-plan priorities; no system-level technical account access required |
| Required Tools | Local ticketing/GRC system (for tracking lifecycle-decision and risk-review records); no technical scanning or monitoring tools required for this role |
| Roles/Permissions Needed | Executive/stakeholder authority over the mission/business process; standing as a recognized stakeholder in AO reauthorization consultation — no elevated system permissions needed |

## 4. RACI Position Summary

The MBO does not appear as Responsible, Accountable, Consulted, or Informed on any of the 110 Master Calendar tasks ([execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md) Part B) — its mission/business risk tolerance and resourcing input reach the AO's authorization decision through direct stakeholder consultation rather than through any calendar task line item. Per [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md), no operational title is absorbed into this role; its governance actions map directly to the JSIG-named role with no delegation ambiguity.

## 5. Execution Procedures

### Governance Action #1: Confirm information security requirements remain integrated into SDLC/acquisition activities
- Pattern H (per [_EXECUTION-PATTERNS.md](_EXECUTION-PATTERNS.md)) — decision package is the current SDLC/acquisition status and its security-requirements traceability; MBO's decision is whether integration remains adequate or needs correction ahead of the next milestone.

### Governance Action #2: Participate in system lifecycle decisions
- Pattern H — decision package is the proposed lifecycle change (modernization, sustainment, decommissioning) and its mission impact; MBO input is consulted alongside the ISO and factored into the resulting lifecycle decision record.

### Governance Action #3: Review resourcing/budget adequacy for mission-supporting IS security
- Pattern H — decision package is the annual budget proposal for mission-supporting security controls; MBO's decision is whether resourcing is adequate before the budget cycle finalizes.

### Governance Action #4: Confirm contingency-plan priorities reflect business-continuity needs
- Pattern H — decision package is the current contingency plan's stated recovery priorities; MBO's decision is whether they still match actual mission/business continuity requirements.

### Governance Action #5: Review risk-acceptance implications ahead of AO reauthorization
- Pattern H — decision package is the mission/business risk-tolerance summary prepared ahead of the AO's reauthorization decision; MBO input is consulted by the AO/Risk Executive Function before the authorization decision is rendered, per [JSIG §1.5.2(e)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md).

## 6. Standard Validation, Evidence, Findings, Escalation, and Closure

This role follows the Standard Sections 6–10 (Validation, Evidence Package, Findings and Exceptions, Remediation and Escalation, Closure) defined in [_EXECUTION-PATTERNS.md](_EXECUTION-PATTERNS.md) for every action above. No role-specific delta applies — the MBO is never itself the terminal Approver for a technical finding; its input feeds the AO's authorization decision rather than closing any finding independently.

## Sources

- [playbooks/roles/MBO.md](../../playbooks/roles/MBO.md)
- [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md)
- [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md)
- [references/JSIG-source/section-1.5-roles-and-responsibilities.md § 1.5.11](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)
- [MAINTENANCE-PLAN.md §4](../../MAINTENANCE-PLAN.md)
