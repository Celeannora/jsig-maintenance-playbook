# Agency/Component Head — Actionable Task Runbook

The Agency/Component Head is the DoD SAP Component Head defined in [JSIG §1.5.1](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md), sitting at the top of the org hierarchy above the Authorizing Official (AO), Risk Executive Function (REF), and CIO per [playbooks/roles/Agency-Component-Head.md](../../playbooks/roles/Agency-Component-Head.md). Executes 0 Master Calendar tasks directly, is Accountable for 0, Consulted on 0, Informed on 0 — see [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md) Part B for the full rollup.

## 1. Role Overview

The Component Head bears ultimate responsibility for mission accomplishment and for adequately mitigating risk to the element, its individuals, and the Nation; it appoints the AO(s) for every DoD Information System (IS) and Platform IT (PIT) system under its purview and establishes, in writing, the component's SAP senior authorizing official — the sole waiver authority for non-tailorable controls. See [playbooks/roles/Agency-Component-Head.md](../../playbooks/roles/Agency-Component-Head.md) for the full role narrative, JSIG-cited duties, and key artifacts owned.

## 2. Task Index

This role has **0 executing** and **0 accountable** Master Calendar tasks per [role_task_index.json](../tools/data/role_task_index.json) — it holds no recurring, calendar-driven operational task in the 110-task Master Calendar. Its function is entirely event-driven governance/appointment authority that anchors the control structure without performing hands-on control work itself. The following table lists its JSIG-cited event-driven governance actions, drawn from [playbooks/roles/Agency-Component-Head.md](../../playbooks/roles/Agency-Component-Head.md) and [JSIG §1.5.1](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md), each using Pattern H (Governance/Authorization Decision):

| # | Governance Action | JSIG Citation | Trigger | Pattern |
|---|---|---|---|---|
| 1 | Appoint an AO for every DoD IS/PIT system under purview | [JSIG §1.5.1](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) | New system stood up, or existing AO appointment lapses/turns over | H |
| 2 | Establish in writing the component's SAP senior authorizing official (DoD-level SAP cybersecurity strategy/policy/investment lead) | [JSIG §1.5.1](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) | New component stand-up, or incumbent senior authorizing official departs/changes | H |
| 3 | Render non-tailorable-control waiver decisions (through the designated senior authorizing official, the only authorized waiver authority) | [JSIG §1.5.1](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) | A program submits a waiver request for a non-tailorable control | H |
| 4 | Confirm DoD SAP systems under purview are authorized per DoDM 5205.07-V1 and the JSIG before operation | [JSIG §1.5.1](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) | Prior to any new system's operational start, or upon reauthorization | H |
| 5 | Set component-wide risk-management/resourcing priorities enabling element- and Community-wide mission accomplishment | [JSIG §1.5.1](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) | Annual planning cycle, or a significant mission/resourcing change | H |

## 3. Preconditions

| Category | Requirement |
|---|---|
| Required Access | Authority to issue formal appointment memoranda; visibility into component-wide authorization status roll-up |
| Required Tools | Local ticketing/GRC system (for tracking appointment and waiver records); no technical scanning or monitoring tools required for this role |
| Roles/Permissions Needed | Component-level executive authority to appoint AOs and designate the SAP senior authorizing official; no system-level account access needed |

## 4. RACI Position Summary

The Agency/Component Head does not appear as Responsible, Accountable, Consulted, or Informed on any of the 110 Master Calendar tasks ([execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md) Part B) — it sits above the RACI structure as the appointing/chartering authority for the AO, who in turn carries the bulk of Informed-party visibility across the calendar. Per [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md), no operational title is absorbed into this role; its governance actions map directly to the JSIG-named role with no delegation ambiguity.

## 5. Execution Procedures

### Governance Action #1: Appoint an AO for every DoD IS/PIT system under purview
- Pattern H (per [_EXECUTION-PATTERNS.md](_EXECUTION-PATTERNS.md)) — the "decision package" here is the candidate AO's qualifications and the system's mission/risk context; the Component Head renders an appointment decision rather than a risk-acceptance decision, and distributes the signed appointment memorandum to the AO, REF, and CIO as Informed parties.

### Governance Action #2: Establish the component's SAP senior authorizing official
- Pattern H — decision package is the candidate's qualifications for DoD-level SAP cybersecurity strategy/policy/investment representation; output is a written designation memorandum, not a risk decision.

### Governance Action #3: Render non-tailorable-control waiver decisions
- Pattern H — decision package is the waiver request and its supporting risk rationale; this is the one action where the Component Head (via its designated senior authorizing official) is itself the final Approver rather than routing the decision elsewhere, since JSIG names this official the *only* authorized waiver authority for non-tailorable controls.

### Governance Action #4: Confirm DoD SAP systems under purview are authorized
- Pattern H — decision package is the component-wide authorization status roll-up; review confirms every system has a current AO-issued authorization before allowing continued/new operation.

### Governance Action #5: Set component-wide risk-management/resourcing priorities
- Pattern H — decision package is the REF's aggregated organization-wide risk posture briefing and the CIO's annual program-effectiveness report; output is a documented priorities/resourcing decision distributed to the AO, REF, and CIO.

## 6. Standard Validation, Evidence, Findings, Escalation, and Closure

This role follows the Standard Sections 6–10 (Validation, Evidence Package, Findings and Exceptions, Remediation and Escalation, Closure) defined in [_EXECUTION-PATTERNS.md](_EXECUTION-PATTERNS.md) for every action above. Role-specific delta: for the non-tailorable-control waiver action (Governance Action #3), the Component Head's designated senior authorizing official is the terminal Approver — there is no further escalation tier above it for that specific decision type, unlike other governance actions where CAT I findings would otherwise escalate further up the chain.

## Sources

- [playbooks/roles/Agency-Component-Head.md](../../playbooks/roles/Agency-Component-Head.md)
- [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md)
- [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md)
- [references/JSIG-source/section-1.5-roles-and-responsibilities.md § 1.5.1](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)
- [MAINTENANCE-PLAN.md §4](../../MAINTENANCE-PLAN.md)
