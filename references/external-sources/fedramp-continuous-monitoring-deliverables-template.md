# FedRAMP Continuous Monitoring Deliverables Template (v3.1) — Structure and Cadence Summary

- **Source URL:** https://www.fedramp.gov/resources/templates/FedRAMP-Continuous-Monitoring-Deliverables-Template.xlsx
- **Retrieved:** 2026-07-17
- **Why included:** This is one of the single richest cadence sources in the entire collection — it directly enumerates the required delivery frequency for every major ConMon deliverable (CA-02, CA-05, CA-07, CA-08, CM-06, CM-08, CP-04, IR-03, PL-02, RA-05, SA-11, SI-05) mapped to specific control IDs, impact-level-differentiated schedules, and responsible party (CSP vs. 3PAO). This directly corroborates and extends the research file's cadence table.

> **NOTE:** This source is a Microsoft Excel workbook, not a text/prose document. The full original `.xlsx` file has been copied verbatim into this same directory as `fedramp-continuous-monitoring-deliverables-template.xlsx` (124 KB) for complete offline fidelity. This markdown file is a structured transcription of its content, not an excerpt — all rows from the "Con Mon Deliverables" sheet are reproduced below in full.

---

## Workbook Structure

Three sheets: **Instructions**, **Con Mon Deliverables** (the core data table), **Record of Change** (version history).

### Instructions Sheet — Key Process Notes

> "This template summarizes what continuous monitoring (ConMon) deliverables must be submitted to the Cloud Service Offering (CSO) designated document repository for the AO's review. Cloud Service Providers (CSPs) must use this worksheet to document the schedule and location of CSO ConMon deliverables."

- **Initial submission:** CSPs in the continuous monitoring phase submit "as soon as possible"; CSPs pending authorization must complete the worksheet **within 10 business days from receipt of the authorization**.
- **Maintenance cadence:** "Update the worksheet when deliverables are completed and **annually**, by the CSO's Annual Assessment due date."

### Record of Change (Version History)

| Date | Version | Change |
|---|---|---|
| 2024-02-15 | 1 | Initial publication |
| 2024-03-04 | 2 | Added Instructions tab; corrected Service Model dropdown; updated Collaborative ConMon frequency; clarified Low/Li-SaaS requirements; integrated CA-07/CM-06 for configuration scanning (renamed to "Vulnerability and Configuration Scanning"); split deliverable-location column into JAB-Internal/Customer-Facing; added Security Alerts, Advisories, and Directives (SI-05) |
| 2024-10-08 | 3 | Updated to align with OMB Memo M-24-15; removed JAB and PMO references |
| 2024-12-04 | 3.1 | Minor formatting updates |

## Con Mon Deliverables Table — Full Cadence Schedule

| Activity | Control ID(s) | Frequency | Responsible |
|---|---|---|---|
| Continuous Monitoring Monthly Executive Summary (incl. current POA&M) | CA-05, RA-05a | **Monthly** | CSP |
| Collaborative Continuous Monitoring (multi-agency ATOs) | CA-07g | CSP-defined, per FedRAMP Collaborative ConMon Quick Guide | CSP |
| Vulnerability and Configuration Scanning (OS/infra, web app, DB, container, config) | RA-05a, CA-07, CM-06 | **Monthly** | CSP |
| Plan of Action & Milestones (POA&M) | CA-05 | **Monthly** (updated as needed) | CSP |
| Inventory | CM-08 | **Monthly** (updated as needed) | CSP |
| Contingency Plan Test Plan | CP-04a | Moderate/High: functional, **at least annually**; Low: tabletop, **at least every 3 years**; Li-SaaS: N/A | CSP |
| Contingency Plan Test Results | CP-04a | Same as above (Moderate/High annually; Low every 3 years) | CSP |
| Incident Response Test Plan | IR-03 | Moderate: functional **annually**; High: **every six (6) months** (incl. functional annually); Low/Li-SaaS: N/A | CSP |
| Incident Response Test Results | IR-03 | Same as above | CSP |
| System Security Plan (SSP) and Supporting Documents Update | PL-02c, PL-02d | **Annually**; submitted to 3PAO **at least 30 days prior** to annual assessment | CSP |
| Static Code Analysis Methodology | SA-11(01) | Moderate/High: **Annually**; Low/Li-SaaS: N/A (submitted to 3PAO ≥30 days before annual assessment) | CSP |
| Security Assessments Plan (SAP) | CA-02 | **Annually** | 3PAO |
| Penetration Testing (High/Moderate, by independent 3PAO, included in SAR) | CA-08, CA-08(01) | **Annually** | 3PAO |
| Penetration Testing (Low and Li-SaaS) | CA-08 | **Annually** | CSP |
| Penetration Testing — Red Team Test Plan | CA-08(02) | Moderate/High: **Annually**; Low/Li-SaaS: N/A | CSP |
| Penetration Testing — Red Team Test Report | CA-08(02) | Moderate/High: **Annually**; Low/Li-SaaS: N/A | CSP |
| Vulnerability and Configuration Scanning (3PAO-conducted/overseen, in SAR) | RA-05a, CA-07, CM-06 | **Annually** | 3PAO |
| Security Assessments and Security Assessment Report (SAR) | CA-02c | **Annually** | 3PAO |
| Security Alerts, Advisories, and Directives (CISA Emergency/Binding Operational Directives) | SI-05 | **Ad hoc**, per FedRAMP guidance | CSP |

---

*End of transcription. Full source (live workbook): https://www.fedramp.gov/resources/templates/FedRAMP-Continuous-Monitoring-Deliverables-Template.xlsx — full raw copy saved alongside this file as `fedramp-continuous-monitoring-deliverables-template.xlsx`.*
