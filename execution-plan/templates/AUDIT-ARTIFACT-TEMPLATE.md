# Audit Artifact / Runbook Template — Canonical 10-Section Scaffold

> **What this is:** the single standardized structure every recurring task runbook and every proof-of-completion record in this execution plan must follow. It is derived from published runbook, audit-evidence, and RACI conventions — NIST SP 800-53A (Examine/Interview/Test assessment methods), NIST SP 800-37 (accountability), FedRAMP POA&M/ConMon templates, IRS Pub 1075 audit-trail field requirements, DCSA SAP RMF checklist conventions, and standard SRE/runbook structure (Google SRE, AWS Well-Architected, PagerDuty, ServiceNow) — consolidated in `reference/research/operational-runbook-and-artifact-standards.md`. Full citations are preserved there; do not re-derive this structure differently elsewhere in the repo.
>
> Every task-specific runbook in `execution-plan/runbooks/<Role>.md` fills in these 10 sections for its own task. The `execution-plan/templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md` is a severity-scoped specialization of this same scaffold for STIG-finding risk decisions specifically — same bones, tuned fields.
>
> **Vendor-agnostic / locally-hosted only:** every field and example below assumes on-premises, air-gapped, or otherwise locally hosted tooling. Do not reference any cloud or SaaS product by name anywhere this template is filled in — use generic terms ("local ticketing/GRC system," "local log management system," "local vulnerability scanner").

---

## 1. Identity

| Field | Value |
|---|---|
| Task Title | *(plain-language name of the recurring task)* |
| Unique Task ID | Cross-reference to `MAINTENANCE-PLAN.md` master calendar task number, if applicable |
| Control ID(s) | *(JSIG/NIST SP 800-53 control family and control ID this task satisfies)* |
| Scope | *(system, enclave, or asset class this task applies to)* |
| Source Requirement | *(JSIG §1.5.x citation or control text this task derives from)* |
| Document Version | |
| Last Reviewed | |
| Last Tested | |

## 2. Trigger and Cadence

| Field | Value |
|---|---|
| Trigger Condition | Scheduled (time-based) / Event-driven (state a specific triggering event) |
| Frequency | Continuous / Daily / Weekly / Monthly / Quarterly / Semiannual / Annual / Every 3 years |
| Due Date | *(specific date or day-of-cycle)* |
| Reporting Period | |
| Next Due Date | *(auto-carried forward at Closure, Section 10)* |
| Repository Location | Where the completed artifact for each cycle is filed |

## 3. Preconditions

| Field | Value |
|---|---|
| Required Access | |
| Required Tools | *(generic/local tooling only — no vendor/SaaS names)* |
| Required Logs | |
| Roles/Permissions Needed | |
| Input Artifacts | *(prior cycle's artifact, baseline documents, etc.)* |

## 4. RACI

| Field | Value |
|---|---|
| Responsible | *(role that performs the task — cross-reference `execution-plan/ROLE-CROSSWALK.md`)* |
| Accountable | *(role answerable for the outcome — per NIST SP 800-37, "primary responsibility remains accountable" even when execution is delegated)* |
| Consulted | |
| Informed | |
| Evidence Owner | |
| Reviewer / Approver | |
| Escalation Owner | |

## 5. Execution Steps

Numbered, one action per step. Each step states an expected result, a capture instruction (what to screenshot/export/log), and any stop/continue rule. Never combine two decisions into one step — a zero-judgment runbook has exactly one action per line.

1. *(Step)* — Expected result: — Capture: — Stop/continue rule:
2. *(Step)* — Expected result: — Capture: — Stop/continue rule:
3. ...

## 6. Validation

| Field | Value |
|---|---|
| Assessment Method | Examine / Interview / Test (NIST SP 800-53A) |
| Expected Result | |
| Actual Result | |
| Pass / Fail | |
| Reviewed By | |
| Signature / Date | |

## 7. Evidence Package

| Field | Value |
|---|---|
| Artifact List | |
| File Names | |
| Repository Path | |
| Retention Period | |
| Chain-of-Custody Note | |

## 8. Findings and Exceptions

| Field | Value |
|---|---|
| Finding Description | |
| Affected Assets | |
| Severity / Risk | |
| Exception Type | |
| Rationale | |
| Compensating Controls | |
| Approval Status | |
| POA&M ID | |

## 9. Remediation and Escalation

| Field | Value |
|---|---|
| Remediation Plan | |
| Owner | |
| Resources Required | |
| Scheduled Completion Date | |
| Escalation Trigger | Per `execution-plan/templates/ESCALATION-MATRIX.md` |
| Approver | |
| Status Date | |
| Closure Evidence | |

## 10. Closure

| Field | Value |
|---|---|
| Reviewer Sign-Off | |
| Actual Completion Date | |
| Evidence Verified | |
| Next Due Date | |
| Lessons Learned / Runbook Update Flag | |

---

**Sources for this scaffold** (see `reference/research/operational-runbook-and-artifact-standards.md` for full context):
- NIST SP 800-53A Rev. 5, assessment methods and objects: https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-53Ar5.pdf
- NIST SP 800-37 Rev. 2, Risk Management Framework accountability model: https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-37r2.pdf
- FedRAMP POA&M Template: https://www.fedramp.gov/resources/templates/FedRAMP-POAM-Template.xlsx
- IRS Pub 1075, audit-trail field requirements: https://www.irs.gov/pub/irs-pdf/p1075.pdf
- DCSA DoD SAP PM Handbook (control-testing cadence conventions): https://www.dcsa.mil/Portals/91/Documents/CTP/special/DoD_SAP_PM_Handbook_JSIG_RMF_2015Aug11.pdf
