# Chief Information Officer (CIO) — Actionable Task Runbook

The CIO is the FISMA-responsible organizational official defined in [JSIG §1.5.3](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md), sitting between the Agency/Component Head and the CISO — whom the CIO designates — per [playbooks/roles/CIO.md](../../playbooks/roles/CIO.md). Executes 0 Master Calendar tasks directly, is Accountable for 0, Consulted on 0, Informed on 0 — see [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md) Part B for the full rollup.

For the real verbatim JSIG title behind any Control ID cited in this runbook, see [CONTROL-LANGUAGE-CROSSWALK.md](../CONTROL-LANGUAGE-CROSSWALK.md), which reconciles every Control ID in the Master Calendar against the full verbatim JSIG family extractions.

## 1. Role Overview

The CIO designates a CISO, develops and maintains organization-wide information security policy, oversees training for security-responsible personnel, assists senior officials with their security responsibilities, and reports annually to the agency head on information security program effectiveness. The CIO must be a U.S. citizen and government employee, and works closely with the AO — supported by the REF and CISO — to ensure the organization-wide security program is effectively implemented. See [playbooks/roles/CIO.md](../../playbooks/roles/CIO.md) for the full role narrative, JSIG-cited duties, and key artifacts owned.

## 2. Task Index

This role has **0 executing** and **0 accountable** Master Calendar tasks per [role_task_index.json](../tools/data/role_task_index.json) — it does not appear as Responsible, Accountable, Consulted, or Informed on any of the 110 Master Calendar tasks. Its function is entirely event-driven program governance rather than calendar-cadence operational work. The following table lists its JSIG-cited event-driven governance actions, drawn from [playbooks/roles/CIO.md](../../playbooks/roles/CIO.md) and [JSIG §1.5.3](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md), each using Pattern H (Governance/Authorization Decision):

| # | Governance Action | JSIG Citation | Trigger | Pattern |
|---|---|---|---|---|
| 1 | Designate a CISO | [JSIG §1.5.3](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md) | New organization stand-up, or incumbent CISO departs/changes | H |
| 2 | Develop/maintain organization-wide information security policies, procedures, and control techniques | [JSIG §1.5.3](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md) | Annual policy review, or a control/regulatory requirement change | H |
| 3 | Report annually to the Agency/Component Head on information security program effectiveness, including remedial-action progress | [JSIG §1.5.3](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md) | Annual reporting cycle | H |
| 4 | Confirm information systems are covered by approved security plans and hold current authorization before operation | [JSIG §1.5.3](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)(c) | A system requests or renews authorization | H |
| 5 | Integrate information security considerations into programming/planning/budgeting cycles and acquisition/SDLC processes | [JSIG §1.5.3](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)(b) | Annual budget cycle, or a new acquisition/development effort begins | H |

## 3. Preconditions

| Category | Requirement |
|---|---|
| Required Access | Visibility into organization-wide policy set, centralized security-activity reporting roll-ups, and system authorization status |
| Required Tools | Local ticketing/GRC system (for reviewing centralized reporting roll-ups); no technical scanning tools required for this role |
| Roles/Permissions Needed | Executive authority to designate the CISO and issue organization-wide policy; no system-level account access needed |

## 4. RACI Position Summary

The CIO does not appear as Responsible, Accountable, Consulted, or Informed on any of the 110 Master Calendar tasks ([execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md) Part B) — it receives centralized security-activity reporting through the CISO it designates rather than through any calendar task line item. Per [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md), no operational title is absorbed into this role; its governance actions map directly to the JSIG-named role with no delegation ambiguity.

## 5. Execution Procedures

### Governance Action #1: Designate a CISO
- Pattern H (per [_EXECUTION-PATTERNS.md](_EXECUTION-PATTERNS.md)) — decision package is the candidate's professional qualifications and training/experience against the CISO's JSIG-required primary-duty standard; output is a written designation memorandum distributed to the AO, REF, and Agency/Component Head as Informed parties.

### Governance Action #2: Develop/maintain organization-wide information security policy
- Pattern H — decision package is the current policy set plus any control/regulatory changes since the last review; CIO renders and documents the policy revision decision (approve / approve with conditions / deny a proposed change) before publication.

### Governance Action #3: Report annually on information security program effectiveness
- Pattern H — decision package is the aggregated centralized reporting (fed by the CISO's consolidated posture data) plus remedial-action status; CIO's "decision" here is what to certify to the Agency/Component Head, consulting the REF and CISO first.

### Governance Action #4: Confirm systems are covered by approved security plans and current authorization
- Pattern H — decision package is the organization-wide authorization status roll-up; review confirms every system in scope has an approved plan and current AO-issued authorization.

### Governance Action #5: Integrate information security into budgeting/acquisition cycles
- Pattern H — decision package is the annual budget/acquisition proposal; CIO's decision is whether security requirements are adequately funded and integrated before the cycle is finalized.

## 6. Standard Validation, Evidence, Findings, Escalation, and Closure

This role follows the Standard Sections 6–10 (Validation, Evidence Package, Findings and Exceptions, Remediation and Escalation, Closure) defined in [_EXECUTION-PATTERNS.md](_EXECUTION-PATTERNS.md) for every action above. No role-specific delta applies — the CIO routes findings and approvals through the standard chain rather than serving as a terminal Approver for any technical finding.

## Sources

- [playbooks/roles/CIO.md](../../playbooks/roles/CIO.md)
- [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md)
- [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md)
- [reference/JSIG-source/section-1.5-roles-and-responsibilities.md § 1.5.3](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)
- [MAINTENANCE-PLAN.md §4](../../MAINTENANCE-PLAN.md)
