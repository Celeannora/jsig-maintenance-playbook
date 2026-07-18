# Security Control Assessor (SCA) — Actionable Task Runbook

The SCA is the independent-assessment role defined in [JSIG §1.5.7](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md), appointed in writing by the AO and operating under the AO's direction, per [playbooks/roles/SCA.md](../../playbooks/roles/SCA.md). Executes 3 Master Calendar tasks directly, is Accountable for 3, Consulted on 5, Informed on 0 — see [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md) Part B for the full rollup.

## 1. Role Overview

The SCA conducts a comprehensive, independent assessment of the management, operational, and technical security controls employed within or inherited by an information system, determining overall control effectiveness and recommending corrective actions for discovered weaknesses. Within the DoD SAP Community, an ISSM or other AO designee may be delegated in writing to perform assessments on the SCA's behalf, but must forward results to the SCA for further action. See [playbooks/roles/SCA.md](../../playbooks/roles/SCA.md) for the full role narrative, JSIG-cited duties, and key artifacts owned.

## 2. Task Index

Per [role_task_index.json](../tools/data/role_task_index.json), all 3 of the SCA's tasks are both executed and Accountable by this role — there are no Accountable-only (review-but-not-execute) tasks for the SCA.

| # | Task | Family | Frequency | Control ID(s) | Pattern |
|---|---|---|---|---|---|
| 74 | Perform independent security control assessment | CA | Annual | CA-2 | D |
| 75 | Perform penetration testing | CA | Annual | CA-8 | D |
| 105 | Ensure every control assessed at least once per 3-year cycle | CA | Multi-year / retention | CA-2 | G |

**Accountable-only tasks: none.** All 3 tasks in the Accountable list (74, 75, 105) are identical to the executing list above.

## 3. Preconditions

| Category | Requirement |
|---|---|
| Required Access | Read access to the current SSP, SCTM, and Security Control Assessment Procedures; read access to prior assessment/penetration-test results and the control-assessment history log |
| Required Tools | Independent assessment/testing toolset separate from the system administrator's own scanning tools (to preserve assessment independence); local ticketing/GRC system for SAR and POA&M-input tracking |
| Roles/Permissions Needed | Written AO appointment as SCA; authority to conduct assessments independent of the system's operational chain; authority to submit the SAR and authorization package directly to the AO |

## 4. RACI Position Summary

The SCA both executes and is Accountable for all 3 of its Master Calendar tasks — the independent control assessment, penetration testing, and the multi-year full-coverage assessment requirement — meaning it is its own sign-off authority for this work rather than routing to a separate approver, consistent with its role as the *independent* assessor. On these 3 tasks the ISSM is Consulted and the AO/DAO is Informed, per [role_task_index.json](../tools/data/role_task_index.json): the ISSM's operational familiarity is sought before the SCA finalizes results, but the SCA's assessment must remain independent of ISSM/operational influence on the underlying finding. The SCA is also Consulted on 5 tasks it does not execute (vulnerability scanning, scanner signature updates, organizational risk-assessment reassessment, security-categorization review, and technical surveillance countermeasures survey) — all RA-family inputs that feed the SCA's own threat/vulnerability evaluation duty under [JSIG §1.5.7(b)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) even though the SCA does not perform them directly. Per [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md), the "SCA / SCAR" operational title maps directly to this role with no delegation ambiguity; where an ISSM or AO designee performs a delegated assessment on the SCA's behalf, results still route back to the SCA for further action rather than closing independently.

## 5. Execution Procedures

### Task #74: Perform independent security control assessment
- Pattern D (per [_EXECUTION-PATTERNS.md](_EXECUTION-PATTERNS.md)) — test plan is the current approved Security Assessment Plan (SSP + SCTM + assessment procedures per [JSIG §1.5.7(c)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)); the after-action deliverable is the Security Assessment Report (SAR) with a recommended authorization decision submitted to the AO.

### Task #75: Perform penetration testing
- Pattern D — test plan is the current approved penetration-test rules of engagement; the after-action deliverable feeds the SAR alongside Task #74's control-assessment results.

### Task #105: Ensure every control assessed at least once per 3-year cycle
- Pattern G (retention/coverage tracking rather than disposal): candidate list is every control not yet assessed within the rolling 3-year window per [ESCALATION-MATRIX.md](../templates/ESCALATION-MATRIX.md) §3; instead of disposal, the "cleared candidate" action is scheduling that control into an upcoming assessment cycle rather than destroying a record.

## 6. Standard Validation, Evidence, Findings, Escalation, and Closure

This role follows the Standard Sections 6–10 (Validation, Evidence Package, Findings and Exceptions, Remediation and Escalation, Closure) defined in [_EXECUTION-PATTERNS.md](_EXECUTION-PATTERNS.md) for every task above. Role-specific delta: the SCA is the author of the Security Assessment Report and the party that ensures the POA&M reflects SAR findings and suspense dates per [JSIG §1.5.7(f)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md), but the SCA is never itself the terminal Approver on the resulting CAT-rated findings — those still route through [ESCALATION-MATRIX.md](../templates/ESCALATION-MATRIX.md) and [VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md](../templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md) §4 to the AO/DAO (CAT I), ISSM (CAT II), or ISSO (CAT III) for accept/reject sign-off.

## Sources

- [playbooks/roles/SCA.md](../../playbooks/roles/SCA.md)
- [execution-plan/RACI-MATRIX.md](../RACI-MATRIX.md)
- [execution-plan/ROLE-CROSSWALK.md](../ROLE-CROSSWALK.md)
- [references/JSIG-source/section-1.5-roles-and-responsibilities.md § 1.5.7](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)
- [execution-plan/templates/ESCALATION-MATRIX.md](../templates/ESCALATION-MATRIX.md)
- [execution-plan/templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md](../templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md)
- [MAINTENANCE-PLAN.md §4](../../MAINTENANCE-PLAN.md)
