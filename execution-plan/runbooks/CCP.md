# Common Control Provider (CCP) — Actionable Task Runbook

The CCP is the common-security-control steward defined in [JSIG §1.5.8](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md), coordinating with the AO and inheriting ISOs per [playbooks/roles/CCP.md](../../playbooks/roles/CCP.md). Executes 0 Master Calendar tasks directly, is Accountable for 0, Consulted on 0, Informed on 0 — see [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md) Part B for the full rollup.

For the real verbatim JSIG title behind any Control ID cited in this runbook, see [CONTROL-LANGUAGE-CROSSWALK.md](../CONTROL-LANGUAGE-CROSSWALK.md), which reconciles every Control ID in the Master Calendar against the full verbatim JSIG family extractions.

## 1. Role Overview

The CCP is an individual, group, or organization responsible for the development, implementation, assessment, and monitoring of common security controls — controls inherited by one or more information systems — so that inheriting systems do not need to separately assess and document those controls. See [playbooks/roles/CCP.md](../../playbooks/roles/CCP.md) for the full role narrative, JSIG-cited duties, and key artifacts owned.

## 2. Task Index

This role has **0 executing** and **0 accountable** Master Calendar tasks per [role_task_index.json](../tools/data/role_task_index.json) — it does not appear as Responsible, Accountable, Consulted, or Informed on any of the 110 Master Calendar tasks. Its function is entirely event-driven common-control stewardship rather than calendar-cadence operational work. The following table lists its JSIG-cited event-driven governance actions, drawn from [playbooks/roles/CCP.md](../../playbooks/roles/CCP.md) and [JSIG §1.5.8](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md), each using Pattern H (Governance/Authorization Decision):

| # | Governance Action | JSIG Citation | Trigger | Pattern |
|---|---|---|---|---|
| 1 | Document organization-identified common controls in a common-control SSP | [JSIG §1.5.8(a)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md) | New common control identified, or annual SSP review | H |
| 2 | Ensure required assessments of common controls are carried out by qualified assessors | [JSIG §1.5.8(b)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md) | Assessment cycle due, or a common control changes | H |
| 3 | Document assessment findings in a common-control SAR | [JSIG §1.5.8(c)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md) | Conclusion of each common-control assessment | H |
| 4 | Produce/maintain a POA&M for common controls with weaknesses or deficiencies | [JSIG §1.5.8(d)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md) | Assessment or review identifies a weakness/deficiency | H |
| 5 | Make current SSP, SAR, and POA&M for common controls available to inheriting ISOs | [JSIG §1.5.8(e)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md) | Any of the three documents is updated, or a new system begins inheriting the control | H |

## 3. Preconditions

| Category | Requirement |
|---|---|
| Required Access | Read/write access to the common-control SSP/SAR/POA&M repository; visibility into the list of systems inheriting each common control |
| Required Tools | Local ticketing/GRC system (for POA&M tracking and distribution records); no technical scanning tools required for this role directly, though it relies on qualified-assessor output |
| Roles/Permissions Needed | Authority to commission qualified assessors for common-control assessments; no system-level account access needed on inheriting systems |

## 4. RACI Position Summary

The CCP does not appear as Responsible, Accountable, Consulted, or Informed on any of the 110 Master Calendar tasks ([execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md) Part B) — its common-control SSP/SAR/POA&M outputs are consumed by inheriting ISOs as authorization-package inputs rather than tracked as calendar task line items themselves. Per [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md), no operational title is absorbed into this role; its governance actions map directly to the JSIG-named role with no delegation ambiguity.

## 5. Execution Procedures

### Governance Action #1: Document common controls in a common-control SSP
- Pattern H (per [_EXECUTION-PATTERNS.md](_EXECUTION-PATTERNS.md)) — decision package is the set of controls the organization has designated as common/inheritable; output is a published or revised common-control SSP distributed to inheriting ISOs as Informed parties.

### Governance Action #2: Ensure qualified-assessor assessment of common controls
- Pattern H — decision package is the assessment scope and assessor qualifications; CCP's decision is whether the assessor and scope satisfy the qualified-assessor requirement before assessment begins.

### Governance Action #3: Document assessment findings in a common-control SAR
- Pattern H — decision package is the assessor's raw findings; CCP renders the documented SAR as the decision record, capturing control-effectiveness determinations for all inheriting systems at once.

### Governance Action #4: Produce/maintain POA&M for common-control weaknesses
- Pattern H — decision package is each open weakness/deficiency from the SAR; CCP's decision is the remediation owner, milestone, and target date recorded per open item.

### Governance Action #5: Make SSP/SAR/POA&M available to inheriting ISOs
- Pattern H — decision package is the current document set; CCP's action is a distribution/availability decision rather than a risk decision — confirming every inheriting ISO has the current versions.

## 6. Standard Validation, Evidence, Findings, Escalation, and Closure

This role follows the Standard Sections 6–10 (Validation, Evidence Package, Findings and Exceptions, Remediation and Escalation, Closure) defined in [_EXECUTION-PATTERNS.md](_EXECUTION-PATTERNS.md) for every action above. No role-specific delta applies — the CCP routes common-control findings and approvals through the standard chain rather than serving as a terminal Approver for any technical finding.

## Sources

- [playbooks/roles/CCP.md](../../playbooks/roles/CCP.md)
- [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md)
- [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md)
- [reference/JSIG-source/section-1.5-roles-and-responsibilities.md § 1.5.8](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)
- [MAINTENANCE-PLAN.md §4](../../MAINTENANCE-PLAN.md)
