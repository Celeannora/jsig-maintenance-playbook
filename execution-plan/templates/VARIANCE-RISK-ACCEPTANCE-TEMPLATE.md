# Variance / Risk-Acceptance Record — Blank Template

> **What this is:** a single, self-contained record for ONE STIG finding (identified by its official DISA Vulnerability ID, e.g. `V-253259`) that needs a documented decision — remediate, mitigate, or formally accept the risk — instead of silent non-compliance. It is peer-reviewed, then signed by the stakeholders whose sign-off is required at that finding's severity tier.
>
> This template is a severity-scoped specialization of the general 10-section runbook/artifact structure defined in `execution-plan/templates/AUDIT-ARTIFACT-TEMPLATE.md`. Do not invent a different structure — every field below maps back to that canonical scaffold.
>
> **Do not hand-author this document.** Use `execution-plan/tools/generate_variance.py` to auto-populate Sections 1–3 and 8 from the offline STIG reference database (built by `stig_reference_builder.py` from official DISA XCCDF documents). Only Sections 4–7 and 9–10 require human input. This prevents transcription errors in official check/fix text and CCI mappings.

---

## 1. Identity

| Field | Value |
|---|---|
| Variance Record ID | `VAR-<VulnID>-<AssetID>-<YYYYMMDD>` (auto-generated) |
| STIG Vulnerability ID | `V-XXXXXX` |
| STIG Rule ID | `SV-XXXXXXrNNNNNN_rule` |
| STIG Rule Version (short ID) | e.g. `WN11-00-000030` |
| Benchmark / STIG Title | *(from reference DB)* |
| Benchmark Release | *(from reference DB, e.g. "Release: 8 Benchmark Date: 01 Jul 2026")* |
| Finding Title | *(official title, from reference DB)* |
| Severity / CAT Level | `CAT I` / `CAT II` / `CAT III` *(from reference DB `severity` → CAT mapping)* |
| CCI Reference(s) | *(from reference DB)* |
| System / Enclave Scope | *(name of the accredited system or enclave this finding applies to)* |
| Source Requirement | JSIG §1.5 / control family per `references/JSIG-source/` control mapping for this CCI |
| Document Version | v1.0 |
| Last Reviewed | *(date)* |

## 2. Trigger and Cadence

| Field | Value |
|---|---|
| Trigger Condition | A configuration/vulnerability review (manual STIG checklist review, or scan tool output cross-referenced against this Vulnerability ID) identified this finding as **Open** / **Not a Finding** / **Not Applicable** / **Not Reviewed** |
| Detection Date | *(date the finding was identified)* |
| Detection Method | Manual STIG checklist review / Nessus / SCC / OpenSCAP / other *(state tool + version if a scan tool was used)* |
| Reporting Period | *(the compliance reporting cycle this record belongs to)* |
| Re-Review Due Date | Per Escalation Matrix severity-based SLA (see `execution-plan/templates/ESCALATION-MATRIX.md`) — CAT I: 30 days; CAT II: 90 days; CAT III: 180 days from Detection Date, unless a longer POA&M milestone is separately approved |
| Repository Location | `execution-plan/variance-records/<Variance Record ID>.md` |

## 3. Preconditions

| Field | Value |
|---|---|
| Required Access | Read access to the affected asset's configuration baseline; read access to the offline STIG reference database |
| Required Tools | Offline STIG reference database (`execution-plan/tools/data/stig_reference.json`); local ticketing/GRC system record for cross-linking |
| Required Roles/Permissions | Preparer must hold an account with authority to review the affected asset's configuration; reviewer/approver roles per Section 4 |
| Input Artifacts | Official DISA STIG check-text/fix-text for this Vulnerability ID (auto-populated); prior variance record for this finding/asset pair, if this is a renewal |

## 4. RACI (Severity-Tiered)

The sign-off chain scales with the finding's CAT level. ISSM is a **standing reviewer at every tier** regardless of who holds final accept/reject authority.

| CAT Level | Responsible (prepares record) | Accountable (final accept/reject authority) | Consulted | Informed | Evidence Owner | Escalation Owner |
|---|---|---|---|---|---|---|
| CAT I | ISSO or Privileged User who identified the finding | **AO / DAO** | ISSM, Information Owner/Steward | Risk Executive Function, CISO | ISSO | ISSM |
| CAT II | ISSO or Privileged User who identified the finding | **ISSM** | Information Owner/Steward | AO/DAO (Informed only) | ISSO | ISSM |
| CAT III | ISSO or Privileged User who identified the finding | **ISSO** | ISSM | — | ISSO | ISSM |

> This finding is **CAT ___**, so the Accountable role for this record is: **______________**.

## 5. Execution Steps (Preparation)

1. Identify the exact Vulnerability ID and affected asset(s). Record expected result: a single, unambiguous `V-XXXXXX` and asset identifier.
2. Run `generate_variance.py` against the offline reference database to auto-populate Sections 1–3 and 8. Expected result: Sections 1–3 and 8 are filled with official DISA text; stop and do not proceed if the finding ID is not found in the reference database — update the database from a current official STIG package first.
3. Fill in Section 2's Detection Date/Method by hand. Expected result: a specific date and named detection method, never left blank.
4. Fill in Section 6 (Validation) with the actual observed state of the asset. Expected result: a factual, first-person account of what was checked and what was found — not a restatement of the official check text.
5. Route the draft to the Consulted roles from Section 4 for comments before requesting sign-off. Expected result: comments (or explicit "no comment") recorded in Section 9.
6. Route to the Accountable role from Section 4 for the risk decision. Do not proceed to Closure until this signature is captured.

## 6. Validation

| Field | Value |
|---|---|
| Assessment Method | Examine / Interview / Test *(NIST SP 800-53A methods — state which was used)* |
| Expected Result (per official check text) | *(auto-populated from reference DB Section 1)* |
| Actual Result Observed | *(preparer fills in — what was actually found on the asset)* |
| Pass / Fail | *(Pass = Not a Finding; Fail = Open)* |
| Reviewed By | *(name, role)* |
| Review Date | *(date)* |

## 7. Evidence Package

| Field | Value |
|---|---|
| Artifact List | Configuration export, screenshot, scan output excerpt, or manual checklist entry supporting the Actual Result above |
| File Names | *(list)* |
| Repository Path | *(where the evidence files are stored, e.g. `execution-plan/variance-records/evidence/<Variance Record ID>/`)* |
| Retention Period | Per local records-retention policy (minimum: current + 1 prior accreditation cycle) |
| Chain-of-Custody Note | *(who collected the evidence, when, and how it was transferred to the repository)* |

## 8. Findings and Exceptions (Official Reference — Auto-Populated)

| Field | Value |
|---|---|
| Official Finding Description | *(auto-populated `description` field from reference DB)* |
| Official Check Text | *(auto-populated `check_text` field from reference DB)* |
| Official Fix Text | *(auto-populated `fix_text` field from reference DB)* |
| Affected Asset(s) | *(preparer fills in — hostname/asset ID)* |
| Exception Type | Risk Acceptance / Compensating Control / False Positive Correction / Remediation In Progress |
| Rationale | *(why this exception is being requested instead of straightforward remediation)* |
| Compensating Controls | *(if any — describe the control and how it offsets the risk)* |
| POA&M ID (if remediation is tracked separately) | *(link to the local ticketing/GRC POA&M entry, if applicable)* |

## 9. Remediation and Escalation

| Field | Value |
|---|---|
| Decision | ☐ Accept Risk &nbsp;&nbsp; ☐ Reject — Remediate &nbsp;&nbsp; ☐ Mitigate with Compensating Control |
| Remediation Plan (if not accepting as-is) | *(steps and target state)* |
| Owner | *(name, role)* |
| Resources Required | *(if any)* |
| Scheduled Completion Date | *(if remediating)* |
| Escalation Trigger | Per Escalation Matrix — if the SLA in Section 2 is missed, this record escalates automatically (see `ESCALATION-MATRIX.md`) |
| Escalation Owner | ISSM |
| Status Date | *(date this section was last updated)* |
| Closure Evidence | *(reference to evidence confirming remediation, if applicable)* |

## 10. Closure and Sign-Off

| Role | Name | Signature | Date | Decision Recorded |
|---|---|---|---|---|
| Preparer | | | | |
| ISSM (standing reviewer, all tiers) | | | | |
| Accountable role per Section 4 (AO/DAO, ISSM, or ISSO as applicable) | | | | |

| Field | Value |
|---|---|
| Actual Completion Date | |
| Evidence Verified By | |
| Next Due Date (re-review) | *(per Section 2 SLA)* |
| Lessons Learned / Runbook Update Flag | *(note here if this finding reveals a gap in a role's runbook that should be corrected)* |

---

*Generated in whole or in part by `execution-plan/tools/generate_variance.py` from the offline STIG reference database. Official check text, fix text, and CCI mappings are sourced verbatim from DISA-published XCCDF benchmark content (https://public.cyber.mil/stigs/downloads/) — do not edit those fields; if they appear wrong, the underlying STIG package in the reference database is outdated and should be refreshed, not hand-corrected.*
