# FedRAMP Continuous Monitoring (ConMon) Playbook (Excerpt)

- **Source URL:** https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf
- **Retrieved:** 2026-07-17
- **Why included:** Supports the monthly vulnerability scanning (RA-5), monthly OS/web/database scan cadence, monthly signature updates, POA&M remediation deadlines (30/60/90/120-day escalation to DFR/CAP), monthly ConMon deliverable cadence, and the "at least once in a three-year period" control assessment scoping rule cited throughout the research file's CA/RA/SI cadence discussion.

> **NOTE — THIS IS AN EXCERPT, NOT THE COMPLETE DOCUMENT.** The version retrieved from the canonical URL above is v1.0, dated 11/17/2025 — a newer edition than may have been originally referenced by the research file, but published at the same canonical FedRAMP URL. The core cadence facts (monthly ConMon deliverables/scanning, POA&M escalation timelines, three-year control assessment scoping) are unchanged from prior versions and match the claims in the research file. The full document runs to more than 40 pages and includes complete escalation procedures (DFR/CAP/OSA), significant-change request procedures, incident handling coordination, deviation-request processes, and detailed templates. Only the sections relevant to cadence/frequency claims are reproduced below. For the complete playbook, download the PDF from the source URL above.

---

## Continuous Monitoring Process Areas — Operational Visibility

CSPs demonstrate a mature and effective security program through the implementation of security controls (for example, system monitoring and event logging) and provide operational visibility by producing required deliverables and supporting evidence. **Deliverables and supporting evidence are provided monthly, annually, every three years, and on an as-needed basis.** Controls with minimally required frequencies for each continuous monitoring activity are identified in Column J of the FedRAMP Security Controls Baseline workbook.

## Vulnerability Scanning Requirements

**Signature Updates:** For each deliverable, the CSP must update the list of vulnerabilities scanned to the latest available list. [RA-5(2)]

- The CSP must use a vulnerability scanner that checks for automatic signature updates of the scanner's vulnerability database **at least monthly**.
- The CSP must provide automated machine-readable evidence of the most recent update performed prior to scanning.

**Adequate Asset Identification:**

- The CSP must have an automated mechanism to identify and catalog all assets, within the authorization boundary, **every month**, in order to ensure that everything is being scanned appropriately.
- Ephemeral/dynamic assets must be uniquely tagged as such.
- Container images: every production-deployed container image class must be uniquely identified and tracked, validated by an assessor to meet the baseline control CM-8.

**Types of Scans:** CSPs must scan operating systems, Web applications, and databases **monthly**. [RA-5]

- The entire inventory (or approved sampling percentage) within the boundary must be scanned at the OS level **at least once a month**.
- All Web interfaces and services (or approved sampling percentage) must be scanned monthly.
- All databases (or approved sampling percentage) must be scanned monthly, including those required to support the infrastructure.

**POA&M Entries:** The CSP must track each unique vulnerability as an individual POA&M item, based on the scanning tool's unique vulnerability reference identifier (ID). Unique vulnerabilities must not be grouped into a single POA&M item.

## Annual Assessment Scope — Three-Year Control Coverage Rule

The CSP and assessor work together to define the scope of the FedRAMP Rev 5 annual assessment using the FedRAMP Annual Assessment Control Selection Worksheet. The scope of a FedRAMP Rev 5 annual assessment includes:

- FedRAMP-selected list of core controls (as defined in the control selection worksheet)
- CSP-selected controls required to address system changes implemented/changed since the last assessment
- Validation of POA&Ms closed since the last assessment
- Validation of POA&Ms identified as vendor dependencies (VDs) or deviation requests (DRs)
- Controls identified as "Not Applicable" (N/A), to validate they are in fact not applicable
- **Controls that have not been assessed at least once in a three-year period, to ensure controls are meeting periodicity requirements**

Assessment plan briefings to agency customers should be scheduled during the **monthly** collaborative ConMon meeting when multiple agencies leverage the same CSO.

## Remediation Timeline / Escalation Thresholds

| Condition | Threshold | Escalation |
|---|---|---|
| Late Remediation — High Impact Vulnerabilities | Five or more unique vulnerabilities/POA&M items aged **> 30 days** | Documented Finding Report (DFR) |
| Late Remediation — High Impact Vulnerabilities | Five or more unique vulnerabilities/POA&M items aged **> 60 days** | Corrective Action Plan (CAP) |
| Late Remediation — Moderate Impact Vulnerabilities | Ten or more unique vulnerabilities/POA&M items aged **> 90 days** | Documented Finding Report (DFR) |
| Late Remediation — Moderate Impact Vulnerabilities | Ten or more unique vulnerabilities/POA&M items aged **> 120 days** | Corrective Action Plan (CAP) |

Escalation actions (DFR → CAP → Ongoing Security Authorization action) are triggered by repeated or unresolved remediation delays and are detailed further in Section 8 of the full playbook.

---

*End of excerpt. Full source: https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf*
