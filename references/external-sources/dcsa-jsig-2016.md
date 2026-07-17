# DoD Joint SAP Implementation Guide (JSIG), 11 April 2016 (Based on NIST SP 800-53 Rev. 4) (Excerpt)

- **Source URL:** https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf
- **Retrieved:** 2026-07-17
- **Why included:** This is the JSIG source document itself — the authoritative basis for the entire scaffold. Included here to preserve the Preface (non-tailorable controls, effective date, 5-year reissue requirement), the RMF Step 6 "Monitor" ongoing-basis framing, and the Table of Contents (control family structure) that the rest of the scaffold's cadence research maps onto.

> **NOTE — THIS IS AN EXCERPT, NOT THE COMPLETE DOCUMENT.** The full JSIG runs to hundreds of pages covering every NIST 800-53 Rev.4 control family in detail. Only the Preface, RMF Step overview, and Table of Contents (through the IR family) are reproduced below — the specific per-control cadence language (e.g., AU-6, CA-7, CP-4, RA-5, SI-2) is addressed with excerpts in the other files in this directory (see `nist-sp-800-53-rev4-controls.md` and the accompanying full XML catalog copy). For the complete JSIG text, visit the source URL above.

---

## Preface — Non-Tailorable Controls (Introduced in This 2016 Revision)

> "Given the rapid increase in cybersecurity threats and prioritization from the SECDEF, the senior cybersecurity professionals responsible for authorizing information systems to process SAP have identified three security controls which offer mitigations so significant they can no longer be tailored... Recognizing there may be extreme situations in which it is not feasible to implement these controls in their entirety, the authority to tailor or modify these controls is delegated to the component SAP senior authorizing official. This waiver authority cannot be further delegated."

**The three non-tailorable controls established by this revision:**
- **AC-6(1)** — Least Privilege | Authorize Access to Security Functions: "System endpoint protection shall not be tailored out."
- **SA-22** — Unsupported System Components: "Added to the baseline and required to be implemented on all SAP systems."
- **SC-28** — Protection of Information at Rest: "Encryption of data at rest shall be implemented for all SAP systems."

> "Waivers to these controls will be submitted to the DoD SAPCO and DoD SAP CIO **within 30 days of approval**."

## Effective Date and Reissue Cadence

> "This document is effective immediately and organizations should begin tracking the changes from the Revision 3 to Revision 4 security controls (new, modified and deleted) in an information system POA&M, with a focus on the three non-tailorable controls identified above... **This document must be reissued, cancelled, or certified current within 5 years of its publication to be considered current.**"

Signed by David B. Been, Brigadier General, USAF, Director, Special Access Program Central Office, and Kenneth R. Bowen, Chief Information Officer for DoD Special Access Programs.

## RMF Six-Step Process (Section 2.3)

1. RMF Step 1, Categorize
2. RMF Step 2, Select
3. RMF Step 3, Implement (Develop/Build)
4. RMF Step 4, Assess (Test)
5. RMF Step 5, Authorize (Deploy/Operate)
6. **RMF Step 6, Monitor** — the step establishing continuous/ongoing-basis monitoring as the operational cadence backbone that the rest of the scaffold's maintenance schedules elaborate on.

## Table of Contents (Control Families, Through Incident Response)

Family: Access Control (AC-1 through AC-25) — including **AC-2 Account Management**, **AC-6 Least Privilege**.
Family: Awareness and Training (AT-1 through AT-5).
Family: Audit and Accountability (AU-1 through AU-16) — including **AU-6 Audit Review, Analysis, and Reporting**, **AU-11 Audit Record Retention**.
Family: Security Assessment and Authorization (CA-1 through CA-9) — including **CA-2 Security Assessments**, **CA-5 Plan of Action and Milestones**, **CA-7** (Continuous Monitoring, listed later in the full document), **CA-8 Penetration Testing**.
Family: Configuration Management (CM-1 through CM-11) — including **CM-2 Baseline Configuration**, **CM-6 Configuration Settings**, **CM-8 Information System Component Inventory**.
Family: Contingency Planning (CP-1 through CP-13) — including **CP-2 Contingency Plan**, **CP-4 Contingency Plan Testing**, **CP-9 Information System Backup**.
Family: Identification and Authentication (IA-1 through IA-11) — including **IA-4 Identifier Management**, **IA-5 Authenticator Management**.
Family: Incident Response (IR-1 through IR-6+) — including **IR-2 Incident Response Training**, **IR-3 Incident Response Testing**.

*(Additional families — Maintenance, Media Protection, Physical/Environmental Protection, Planning, Personnel Security, Risk Assessment, System/Services Acquisition, System/Comms Protection, System/Information Integrity, Program Management — continue in the full document beyond this excerpt.)*

---

*End of excerpt. Full source: https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf*
