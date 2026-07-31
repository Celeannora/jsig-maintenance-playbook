# Control Language Crosswalk

Auto-generated reconciliation report: resolves every Control ID cited in [MAINTENANCE-PLAN.md Section 4](../MAINTENANCE-PLAN.md#4-master-consolidated-calendar) (the 110-task Master Calendar) against the real verbatim JSIG control titles now available in `reference/JSIG-source/chapter-3-*-family.md` (see [EXTRACTION-LOG.md](../reference/JSIG-source/EXTRACTION-LOG.md)). **This report does not modify the Master Calendar, RACI-MATRIX.md, or role_task_index.json** -- it is a read-only audit so a human can decide whether any unresolved ID below needs a follow-up correction to the calendar itself. Regenerate with:

```
python3 execution-plan/tools/build_control_language_crosswalk.py
```

---

## Summary: 127 distinct Control ID(s) cited across 110 Master Calendar tasks

- **Resolved to a real verbatim JSIG control title:** 127
- **Unresolved (no exact match in the verbatim extraction):** 0

## Unresolved Control IDs (need human review)

None -- every Control ID cited in the Master Calendar resolved to a real verbatim JSIG control title.

---

## Full Task-to-Control-Language Table

| # | Task | Family | Control ID(s) (as cited in Master Calendar) | Real JSIG Title(s) | Source |
|---|---|---|---|---|---|
| 1 | Maintain asset/software inventory (automated) | CM | CM-8, CM-11 | CM-8: INFORMATION SYSTEM COMPONENT INVENTORY; CM-11: USER-INSTALLED SOFTWARE | [chapter-3-CM-family.md](../reference/JSIG-source/chapter-3-CM-family.md) |
| 2 | Monitor system communications/security dashboards | SI | SI-4 | SI-4: INFORMATION SYSTEM MONITORING | [chapter-3-SI-family.md](../reference/JSIG-source/chapter-3-SI-family.md) |
| 3 | Real-time malware scanning of externally sourced files | SI | SI-3 | SI-3: MALICIOUS CODE PROTECTION | [chapter-3-SI-family.md](../reference/JSIG-source/chapter-3-SI-family.md) |
| 4 | Maintain IAVM directive compliance | SI | SI-2, RA-5, CA-5 | SI-2: FLAW REMEDIATION; RA-5: VULNERABILITY SCANNING; CA-5: PLAN OF ACTION AND MILESTONES | [chapter-3-CA-family.md](../reference/JSIG-source/chapter-3-CA-family.md); [chapter-3-RA-family.md](../reference/JSIG-source/chapter-3-RA-family.md); [chapter-3-SI-family.md](../reference/JSIG-source/chapter-3-SI-family.md) |
| 5 | Enforce access control/session/least-privilege mechanisms | AC | AC-3, AC-6, AC-11, AC-12 | AC-3: ACCESS ENFORCEMENT; AC-6: LEAST PRIVILEGE; AC-11: SESSION LOCK; AC-12: SESSION TERMINATION | [chapter-3-AC-family.md](../reference/JSIG-source/chapter-3-AC-family.md) |
| 6 | Monitor audit storage capacity and processing-failure alerts | AU | AU-4, AU-5 | AU-4: AUDIT STORAGE CAPACITY; AU-5: RESPONSE TO AUDIT PROCESSING FAILURES | [chapter-3-AU-family.md](../reference/JSIG-source/chapter-3-AU-family.md) |
| 7 | Enforce boundary protection (firewalls/guards) | SC | SC-7 | SC-7: BOUNDARY PROTECTION | [chapter-3-SC-family.md](../reference/JSIG-source/chapter-3-SC-family.md) |
| 8 | Enforce encryption at rest (non-tailorable) | SC | SC-28 | SC-28: PROTECTION OF INFORMATION AT REST | [chapter-3-SC-family.md](../reference/JSIG-source/chapter-3-SC-family.md) |
| 9 | Enforce transmission confidentiality/integrity | SC | SC-8 | SC-8: TRANSMISSION CONFIDENTIALITY AND INTEGRITY | [chapter-3-SC-family.md](../reference/JSIG-source/chapter-3-SC-family.md) |
| 10 | Enforce reauthentication/session timeout | IA | IA-11 | IA-11: RE-AUTHENTICATION | [chapter-3-IA-family.md](../reference/JSIG-source/chapter-3-IA-family.md) |
| 11 | Monitor denial-of-service protections/session authenticity | SC | SC-5, SC-23 | SC-5: DENIAL OF SERVICE PROTECTION; SC-23: SESSION AUTHENTICITY | [chapter-3-SC-family.md](../reference/JSIG-source/chapter-3-SC-family.md) |
| 12 | Monitor temperature/humidity environmental controls | PE | PE-14 | PE-14: TEMPERATURE AND HUMIDITY CONTROLS | [chapter-3-PE-family.md](../reference/JSIG-source/chapter-3-PE-family.md) |
| 13 | Operate privacy incident response capability | SE | SE-2 | SE-2: PRIVACY INCIDENT RESPONSE | [chapter-3-privacy-SE-family.md](../reference/JSIG-source/chapter-3-privacy-SE-family.md) |
| 14 | Handle and monitor for security incidents (24/7) | IR | IR-4, IR-5 | IR-4: INCIDENT HANDLING; IR-5: INCIDENT MONITORING | [chapter-3-IR-family.md](../reference/JSIG-source/chapter-3-IR-family.md) |
| 15 | Maintain accounting-of-disclosures log | AR | AR-8 | AR-8: ACCOUNTING OF DISCLOSURES | [chapter-3-privacy-AR-family.md](../reference/JSIG-source/chapter-3-privacy-AR-family.md) |
| 16 | Check/update malware-tool signatures | SI | SI-3 | SI-3: MALICIOUS CODE PROTECTION | [chapter-3-SI-family.md](../reference/JSIG-source/chapter-3-SI-family.md) |
| 17 | Provide incident status updates during active incident | IR | IR-6 | IR-6: INCIDENT REPORTING | [chapter-3-IR-family.md](../reference/JSIG-source/chapter-3-IR-family.md) |
| 18 | Notify account manager on termination/transfer/need-to-know change (8–24 hr window) | AC | AC-2 | AC-2: ACCOUNT MANAGEMENT | [chapter-3-AC-family.md](../reference/JSIG-source/chapter-3-AC-family.md) |
| 19 | Process termination access-revocation actions (≤24 hr) | PS | PS-4 | PS-4: PERSONNEL TERMINATION | [chapter-3-PS-family.md](../reference/JSIG-source/chapter-3-PS-family.md) |
| 20 | Process transfer access-reassessment actions (≤24 hr) | PS | PS-5 | PS-5: PERSONNEL TRANSFER | [chapter-3-PS-family.md](../reference/JSIG-source/chapter-3-PS-family.md) |
| 21 | Verify system clock/time-stamp synchronization | AU | AU-8 | AU-8: TIME STAMPS | [chapter-3-AU-family.md](../reference/JSIG-source/chapter-3-AU-family.md) |
| 22 | Review and analyze system audit records | AU | AU-6 | AU-6: AUDIT REVIEW, ANALYSIS, AND REPORTING | [chapter-3-AU-family.md](../reference/JSIG-source/chapter-3-AU-family.md) |
| 23 | Run periodic malicious-code (antivirus) scans | SI | SI-3 | SI-3: MALICIOUS CODE PROTECTION | [chapter-3-SI-family.md](../reference/JSIG-source/chapter-3-SI-family.md) |
| 24 | Perform incremental backups (daily-incremental/weekly-full pattern) | CP | CP-9 | CP-9: INFORMATION SYSTEM BACKUP | [chapter-3-CP-family.md](../reference/JSIG-source/chapter-3-CP-family.md) |
| 25 | Update Plan of Action and Milestones (POA&M) | CA | CA-5 | CA-5: PLAN OF ACTION AND MILESTONES | [chapter-3-CA-family.md](../reference/JSIG-source/chapter-3-CA-family.md) |
| 26 | Assemble ConMon deliverable package | CA | CA-7, CA-5, CM-8, RA-5 | CA-7: CONTINUOUS MONITORING; CA-5: PLAN OF ACTION AND MILESTONES; CM-8: INFORMATION SYSTEM COMPONENT INVENTORY; RA-5: VULNERABILITY SCANNING | [chapter-3-CA-family.md](../reference/JSIG-source/chapter-3-CA-family.md); [chapter-3-CM-family.md](../reference/JSIG-source/chapter-3-CM-family.md); [chapter-3-RA-family.md](../reference/JSIG-source/chapter-3-RA-family.md) |
| 27 | Perform vulnerability scanning | RA | RA-5 | RA-5: VULNERABILITY SCANNING | [chapter-3-RA-family.md](../reference/JSIG-source/chapter-3-RA-family.md) |
| 28 | Update scanner vulnerability signatures | RA | RA-5(2) | RA-5(2): UPDATE BY FREQUENCY / PRIOR TO NEW SCAN / WHEN IDENTIFIED | [chapter-3-RA-family.md](../reference/JSIG-source/chapter-3-RA-family.md) |
| 29 | Check/report flaw-remediation (patch) status | SI | SI-2(2) | SI-2(2): AUTOMATED FLAW REMEDIATION STATUS | [chapter-3-SI-family.md](../reference/JSIG-source/chapter-3-SI-family.md) |
| 30 | Test backup integrity/restoration | CP | CP-9(1) | CP-9(1): TESTING FOR RELIABILITY / INTEGRITY | [chapter-3-CP-family.md](../reference/JSIG-source/chapter-3-CP-family.md) |
| 31 | Review physical access logs | PE | PE-6 | PE-6: MONITORING PHYSICAL ACCESS | [chapter-3-PE-family.md](../reference/JSIG-source/chapter-3-PE-family.md) |
| 32 | Review visitor access records | PE | PE-8 | PE-8: VISITOR ACCESS RECORDS | [chapter-3-PE-family.md](../reference/JSIG-source/chapter-3-PE-family.md) |
| 33 | Review Authorized Access List for restricted/SAPF areas | PE | PE-2, PE-3 | PE-2: PHYSICAL ACCESS AUTHORIZATIONS; PE-3: PHYSICAL ACCESS CONTROL | [chapter-3-PE-family.md](../reference/JSIG-source/chapter-3-PE-family.md) |
| 34 | Convene Configuration Control Board (when changes proposed) | CM | CM-3 | CM-3: CONFIGURATION CHANGE CONTROL | [chapter-3-CM-family.md](../reference/JSIG-source/chapter-3-CM-family.md) |
| 35 | Update system component inventory (manual/verification pass) | CM | CM-8 | CM-8: INFORMATION SYSTEM COMPONENT INVENTORY | [chapter-3-CM-family.md](../reference/JSIG-source/chapter-3-CM-family.md) |
| 36 | Maintain organization-level POA&M rollup | PM | PM-4 | PM-4: PLAN OF ACTION AND MILESTONES PROCESS | [chapter-3-PM-family.md](../reference/JSIG-source/chapter-3-PM-family.md) |
| 37 | Maintain organization-wide information system inventory | PM | PM-5 | PM-5: INFORMATION SYSTEM INVENTORY | [chapter-3-PM-family.md](../reference/JSIG-source/chapter-3-PM-family.md) |
| 38 | Monitor nonlocal maintenance session records | MA | MA-4, CA-7 | MA-4: NONLOCAL MAINTENANCE; CA-7: CONTINUOUS MONITORING | [chapter-3-CA-family.md](../reference/JSIG-source/chapter-3-CA-family.md); [chapter-3-MA-family.md](../reference/JSIG-source/chapter-3-MA-family.md) |
| 39 | Verify media storage physical/environmental controls | MP | MP-4 | MP-4: MEDIA STORAGE | [chapter-3-MP-family.md](../reference/JSIG-source/chapter-3-MP-family.md) |
| 40 | Monitor/audit privacy control compliance | AR | AR-4 | AR-4: PRIVACY MONITORING AND AUDITING | [chapter-3-privacy-AR-family.md](../reference/JSIG-source/chapter-3-privacy-AR-family.md) |
| 41 | Update PII/system-holdings inventory | SE | SE-1 | SE-1: INVENTORY OF PERSONALLY IDENTIFIABLE INFORMATION | [chapter-3-privacy-SE-family.md](../reference/JSIG-source/chapter-3-privacy-SE-family.md) |
| 42 | Verify security function operation (self-tests) | SI | SI-6 | SI-6: SECURITY FUNCTION VERIFICATION | [chapter-3-SI-family.md](../reference/JSIG-source/chapter-3-SI-family.md) |
| 43 | Verify software/firmware/information integrity | SI | SI-7 | SI-7: SOFTWARE, FIRMWARE, AND INFORMATION INTEGRITY | [chapter-3-SI-family.md](../reference/JSIG-source/chapter-3-SI-family.md) |
| 44 | Install security-relevant software/firmware updates | SI | SI-2 | SI-2: FLAW REMEDIATION | [chapter-3-SI-family.md](../reference/JSIG-source/chapter-3-SI-family.md) |
| 45 | Report information security performance measures | PM | PM-6 | PM-6: INFORMATION SECURITY MEASURES OF PERFORMANCE | [chapter-3-PM-family.md](../reference/JSIG-source/chapter-3-PM-family.md) |
| 46 | Review privileged account list and entitlements | AC | AC-2 | AC-2: ACCOUNT MANAGEMENT | [chapter-3-AC-family.md](../reference/JSIG-source/chapter-3-AC-family.md) |
| 47 | Reassess least-privilege/privileged-function assignments | AC | AC-6, AC-6(1) | AC-6: LEAST PRIVILEGE; AC-6(1): AUTHORIZE ACCESS TO SECURITY FUNCTIONS | [chapter-3-AC-family.md](../reference/JSIG-source/chapter-3-AC-family.md) |
| 48 | Review authorized software list | CM | CM-7(5) | CM-7(5): AUTHORIZED SOFTWARE / WHITELISTING | [chapter-3-CM-family.md](../reference/JSIG-source/chapter-3-CM-family.md) |
| 49 | Reassess/reevaluate privileged access tied to change | CM | CM-5(5) | CM-5(5): LIMIT PRODUCTION / OPERATIONAL PRIVILEGES | [chapter-3-CM-family.md](../reference/JSIG-source/chapter-3-CM-family.md) |
| 50 | Review unsupported system components (EOL/EOS) | SA | SA-22 | SA-22: UNSUPPORTED SYSTEM COMPONENTS | [chapter-3-SA-family.md](../reference/JSIG-source/chapter-3-SA-family.md) |
| 51 | Verify encryption-at-rest compliance | SC | SC-28 | SC-28: PROTECTION OF INFORMATION AT REST | [chapter-3-SC-family.md](../reference/JSIG-source/chapter-3-SC-family.md) |
| 52 | Verify transmission encryption compliance | SC | SC-8 | SC-8: TRANSMISSION CONFIDENTIALITY AND INTEGRITY | [chapter-3-SC-family.md](../reference/JSIG-source/chapter-3-SC-family.md) |
| 53 | Distribute quarterly security/privacy awareness reminders | AT | AT-2 | AT-2: SECURITY AWARENESS TRAINING | [chapter-3-AT-family.md](../reference/JSIG-source/chapter-3-AT-family.md) |
| 54 | Review remote access and wireless access authorization lists | AC | AC-17, AC-18 | AC-17: REMOTE ACCESS; AC-18: WIRELESS ACCESS | [chapter-3-AC-family.md](../reference/JSIG-source/chapter-3-AC-family.md) |
| 55 | Review publicly accessible content | AC | AC-22 | AC-22: PUBLICLY ACCESSIBLE CONTENT | [chapter-3-AC-family.md](../reference/JSIG-source/chapter-3-AC-family.md) |
| 56 | Review access-enforcement/flow-enforcement rule sets | AC | AC-3, AC-4 | AC-3: ACCESS ENFORCEMENT; AC-4: INFORMATION FLOW ENFORCEMENT | [chapter-3-AC-family.md](../reference/JSIG-source/chapter-3-AC-family.md) |
| 57 | Verify device identification/authentication configuration | IA | IA-3 | IA-3: DEVICE IDENTIFICATION AND AUTHENTICATION | [chapter-3-IA-family.md](../reference/JSIG-source/chapter-3-IA-family.md) |
| 58 | Verify configuration settings against baseline/STIG | CM | CM-6 | CM-6: CONFIGURATION SETTINGS | [chapter-3-CM-family.md](../reference/JSIG-source/chapter-3-CM-family.md) |
| 59 | Review protection of audit tools/information | AU | AU-9 | AU-9: PROTECTION OF AUDIT INFORMATION | [chapter-3-AU-family.md](../reference/JSIG-source/chapter-3-AU-family.md) |
| 60 | Review media access authorization list | MP | MP-2 | MP-2: MEDIA ACCESS | [chapter-3-MP-family.md](../reference/JSIG-source/chapter-3-MP-family.md) |
| 61 | Verify media marking compliance | MP | MP-3 | MP-3: MEDIA MARKING | [chapter-3-MP-family.md](../reference/JSIG-source/chapter-3-MP-family.md) |
| 62 | Review transmission medium/output device access controls | PE | PE-4, PE-5 | PE-4: ACCESS CONTROL FOR TRANSMISSION MEDIUM; PE-5: ACCESS CONTROL FOR OUTPUT DEVICES | [chapter-3-PE-family.md](../reference/JSIG-source/chapter-3-PE-family.md) |
| 63 | Review data quality of PII holdings | DI | DI-1 | DI-1: DATA QUALITY | [chapter-3-privacy-DI-family.md](../reference/JSIG-source/chapter-3-privacy-DI-family.md) |
| 64 | Track and report privacy complaint trends | IP | IP-4 | IP-4: COMPLAINT MANAGEMENT | [chapter-3-privacy-IP-family.md](../reference/JSIG-source/chapter-3-privacy-IP-family.md) |
| 65 | Review boundary-protection rule set | SC | SC-7 | SC-7: BOUNDARY PROTECTION | [chapter-3-SC-family.md](../reference/JSIG-source/chapter-3-SC-family.md) |
| 66 | Review spam protection mechanism effectiveness | SI | SI-8 | SI-8: SPAM PROTECTION | [chapter-3-SI-family.md](../reference/JSIG-source/chapter-3-SI-family.md) |
| 67 | Review non-privileged/user account list | AC | AC-2 | AC-2: ACCOUNT MANAGEMENT | [chapter-3-AC-family.md](../reference/JSIG-source/chapter-3-AC-family.md) |
| 68 | Test/exercise incident response capability (SAP default) | IR | IR-3 | IR-3: INCIDENT RESPONSE TESTING | [chapter-3-IR-family.md](../reference/JSIG-source/chapter-3-IR-family.md) |
| 69 | Review inventory records for computers/removable media (IRS-analog practice) | CM | CM-8 | CM-8: INFORMATION SYSTEM COMPONENT INVENTORY | [chapter-3-CM-family.md](../reference/JSIG-source/chapter-3-CM-family.md) |
| 70 | Review/update baseline configuration | CM | CM-2 | CM-2: BASELINE CONFIGURATION | [chapter-3-CM-family.md](../reference/JSIG-source/chapter-3-CM-family.md) |
| 71 | Review/update all family policies and procedures (-1 controls) | All 26 | AC-1, AT-1, AU-1, CA-1, CM-1, CP-1, IA-1, IR-1, MA-1, MP-1, PE-1, PL-1, PS-1, RA-1, SA-1, SC-1, SI-1 | AC-1: ACCESS CONTROL POLICY AND PROCEDURES; AT-1: SECURITY AWARENESS AND TRAINING POLICY AND PROCEDURES; AU-1: AUDIT AND ACCOUNTABILITY POLICY AND PROCEDURES; CA-1: SECURITY ASSESSMENT AND AUTHORIZATION POLICY AND PROCEDURES; CM-1: CONFIGURATION MANAGEMENT POLICY AND PROCEDURES; CP-1: CONTINGENCY PLANNING POLICY AND PROCEDURES; IA-1: IDENTIFICATION AND AUTHENTICATION POLICY AND PROCEDURES; IR-1: INCIDENT RESPONSE POLICY AND PROCEDURES; MA-1: SYSTEM MAINTENANCE POLICY AND PROCEDURES; MP-1: MEDIA PROTECTION POLICY AND PROCEDURES; PE-1: PHYSICAL AND ENVIRONMENTAL PROTECTION POLICY AND PROCEDURES; PL-1: SECURITY PLANNING POLICY AND PROCEDURES; PS-1: PERSONNEL SECURITY POLICY AND PROCEDURES; RA-1: RISK ASSESSMENT POLICY AND PROCEDURES; SA-1: SYSTEM AND SERVICES ACQUISITION POLICY AND PROCEDURES; SC-1: SYSTEM AND COMMUNICATIONS PROTECTION POLICY AND PROCEDURES; SI-1: SYSTEM AND INFORMATION INTEGRITY POLICY AND PROCEDURES | [chapter-3-AC-family.md](../reference/JSIG-source/chapter-3-AC-family.md); [chapter-3-AT-family.md](../reference/JSIG-source/chapter-3-AT-family.md); [chapter-3-AU-family.md](../reference/JSIG-source/chapter-3-AU-family.md); [chapter-3-CA-family.md](../reference/JSIG-source/chapter-3-CA-family.md); [chapter-3-CM-family.md](../reference/JSIG-source/chapter-3-CM-family.md); [chapter-3-CP-family.md](../reference/JSIG-source/chapter-3-CP-family.md); [chapter-3-IA-family.md](../reference/JSIG-source/chapter-3-IA-family.md); [chapter-3-IR-family.md](../reference/JSIG-source/chapter-3-IR-family.md); [chapter-3-MA-family.md](../reference/JSIG-source/chapter-3-MA-family.md); [chapter-3-MP-family.md](../reference/JSIG-source/chapter-3-MP-family.md); [chapter-3-PE-family.md](../reference/JSIG-source/chapter-3-PE-family.md); [chapter-3-PL-family.md](../reference/JSIG-source/chapter-3-PL-family.md); [chapter-3-PS-family.md](../reference/JSIG-source/chapter-3-PS-family.md); [chapter-3-RA-family.md](../reference/JSIG-source/chapter-3-RA-family.md); [chapter-3-SA-family.md](../reference/JSIG-source/chapter-3-SA-family.md); [chapter-3-SC-family.md](../reference/JSIG-source/chapter-3-SC-family.md); [chapter-3-SI-family.md](../reference/JSIG-source/chapter-3-SI-family.md) |
| 72 | Review/update contingency plan | CP | CP-2 | CP-2: CONTINGENCY PLAN | [chapter-3-CP-family.md](../reference/JSIG-source/chapter-3-CP-family.md) |
| 73 | Test/exercise contingency plan | CP | CP-4 | CP-4: CONTINGENCY PLAN TESTING | [chapter-3-CP-family.md](../reference/JSIG-source/chapter-3-CP-family.md) |
| 74 | Perform independent security control assessment | CA | CA-2 | CA-2: SECURITY ASSESSMENTS | [chapter-3-CA-family.md](../reference/JSIG-source/chapter-3-CA-family.md) |
| 75 | Perform penetration testing | CA | CA-8 | CA-8: PENETRATION TESTING | [chapter-3-CA-family.md](../reference/JSIG-source/chapter-3-CA-family.md) |
| 76 | Review approved maintenance tools | MA | MA-3 | MA-3: MAINTENANCE TOOLS | [chapter-3-MA-family.md](../reference/JSIG-source/chapter-3-MA-family.md) |
| 77 | Update/reassess organizational risk assessment | RA | RA-3 | RA-3: RISK ASSESSMENT | [chapter-3-RA-family.md](../reference/JSIG-source/chapter-3-RA-family.md) |
| 78 | Review/re-sign personnel access agreements | PS | PS-6 | PS-6: ACCESS AGREEMENTS | [chapter-3-PS-family.md](../reference/JSIG-source/chapter-3-PS-family.md) |
| 79 | Deliver annual security awareness refresher training | AT | AT-2 | AT-2: SECURITY AWARENESS TRAINING | [chapter-3-AT-family.md](../reference/JSIG-source/chapter-3-AT-family.md) |
| 80 | Deliver role-based training refresher | AT | AT-3 | AT-3: ROLE-BASED SECURITY TRAINING | [chapter-3-AT-family.md](../reference/JSIG-source/chapter-3-AT-family.md) |
| 81 | Deliver incident response training refresher | IR | IR-2 | IR-2: INCIDENT RESPONSE TRAINING | [chapter-3-IR-family.md](../reference/JSIG-source/chapter-3-IR-family.md) |
| 82 | Deliver contingency training refresher | CP | CP-3 | CP-3: CONTINGENCY TRAINING | [chapter-3-CP-family.md](../reference/JSIG-source/chapter-3-CP-family.md) |
| 83 | Review/update incident response plan | IR | IR-8 | IR-8: INCIDENT RESPONSE PLAN | [chapter-3-IR-family.md](../reference/JSIG-source/chapter-3-IR-family.md) |
| 84 | Review/update auditable events list | AU | AU-2 | AU-2: AUDIT EVENTS | [chapter-3-AU-family.md](../reference/JSIG-source/chapter-3-AU-family.md) |
| 85 | Review unnecessary functions/ports/protocols/services | CM | CM-7(1) | CM-7(1): PERIODIC REVIEW | [chapter-3-CM-family.md](../reference/JSIG-source/chapter-3-CM-family.md) |
| 86 | Inventory physical access devices; change combinations/keys | PE | PE-3 | PE-3: PHYSICAL ACCESS CONTROL | [chapter-3-PE-family.md](../reference/JSIG-source/chapter-3-PE-family.md) |
| 87 | Review/update System Security Plan (SSP) | PL | PL-2 | PL-2: SYSTEM SECURITY PLAN | [chapter-3-PL-family.md](../reference/JSIG-source/chapter-3-PL-family.md) |
| 88 | Review Rules of Behavior acknowledgment | PL | PL-4 | PL-4: RULES OF BEHAVIOR | [chapter-3-PL-family.md](../reference/JSIG-source/chapter-3-PL-family.md) |
| 89 | Review external system service provider compliance | SA | SA-9 | SA-9: EXTERNAL INFORMATION SYSTEM SERVICES | [chapter-3-SA-family.md](../reference/JSIG-source/chapter-3-SA-family.md) |
| 90 | Rotate/manage cryptographic keys | SC | SC-12, SC-13 | SC-12: CRYPTOGRAPHIC KEY ESTABLISHMENT AND MANAGEMENT; SC-13: CRYPTOGRAPHIC PROTECTION | [chapter-3-SC-family.md](../reference/JSIG-source/chapter-3-SC-family.md) |
| 91 | Review security categorization | RA | RA-2 | RA-2: SECURITY CATEGORIZATION | [chapter-3-RA-family.md](../reference/JSIG-source/chapter-3-RA-family.md) |
| 92 | Review position risk designations | PS | PS-2 | PS-2: POSITION RISK DESIGNATION | [chapter-3-PS-family.md](../reference/JSIG-source/chapter-3-PS-family.md) |
| 93 | Update Privacy Impact Assessment | AR | AR-2 | AR-2: PRIVACY IMPACT AND RISK ASSESSMENT | [chapter-3-privacy-AR-family.md](../reference/JSIG-source/chapter-3-privacy-AR-family.md) |
| 94 | Review PII minimization opportunities in holdings | DM | DM-1 | DM-1: MINIMIZATION OF PERSONALLY IDENTIFIABLE INFORMATION | [chapter-3-privacy-DM-family.md](../reference/JSIG-source/chapter-3-privacy-DM-family.md) |
| 95 | Review/update privacy notices, SORNs, and Privacy Act statements | TR | TR-1, TR-2 | TR-1: PRIVACY NOTICE; TR-2: SYSTEM OF RECORDS NOTICES AND PRIVACY ACT STATEMENTS | [chapter-3-privacy-TR-family.md](../reference/JSIG-source/chapter-3-privacy-TR-family.md) |
| 96 | Review internal-use and third-party info-sharing compliance | UL | UL-1, UL-2 | UL-1: INTERNAL USE; UL-2: INFORMATION SHARING WITH THIRD PARTIES | [chapter-3-privacy-UL-family.md](../reference/JSIG-source/chapter-3-privacy-UL-family.md) |
| 97 | Review Configuration Management Plan | CM | CM-9 | CM-9: CONFIGURATION MANAGEMENT PLAN | [chapter-3-CM-family.md](../reference/JSIG-source/chapter-3-CM-family.md) |
| 98 | Test information system recovery/reconstitution procedures | CP | CP-10 | CP-10: INFORMATION SYSTEM RECOVERY AND RECONSTITUTION | [chapter-3-CP-family.md](../reference/JSIG-source/chapter-3-CP-family.md) |
| 99 | Verify alternate storage/processing site and telecom readiness | CP | CP-6, CP-7, CP-8 | CP-6: ALTERNATE STORAGE SITE; CP-7: ALTERNATE PROCESSING SITE; CP-8: TELECOMMUNICATIONS SERVICES | [chapter-3-CP-family.md](../reference/JSIG-source/chapter-3-CP-family.md) |
| 100 | Verify TEMPEST/information-leakage countermeasures (SAP-specific) | PE | PE-19 | PE-19: INFORMATION LEAKAGE | [chapter-3-PE-family.md](../reference/JSIG-source/chapter-3-PE-family.md) |
| 101 | Test fire detection/suppression and inspect water-damage risk | PE | PE-13, PE-15 | PE-13: FIRE PROTECTION; PE-15: WATER DAMAGE PROTECTION | [chapter-3-PE-family.md](../reference/JSIG-source/chapter-3-PE-family.md) |
| 102 | Review third-party/contractor personnel security compliance | PS | PS-7 | PS-7: THIRD-PARTY PERSONNEL SECURITY | [chapter-3-PS-family.md](../reference/JSIG-source/chapter-3-PS-family.md) |
| 103 | Retain audit records offline per NARA schedule or 6–7 years (IRS analog) | AU | AU-11 | AU-11: AUDIT RECORD RETENTION | [chapter-3-AU-family.md](../reference/JSIG-source/chapter-3-AU-family.md) |
| 104 | Prevent identifier reuse for ≥2 years | IA | IA-4 | IA-4: IDENTIFIER MANAGEMENT | [chapter-3-IA-family.md](../reference/JSIG-source/chapter-3-IA-family.md) |
| 105 | Ensure every control assessed at least once per 3-year cycle | CA | CA-2 | CA-2: SECURITY ASSESSMENTS | [chapter-3-CA-family.md](../reference/JSIG-source/chapter-3-CA-family.md) |
| 106 | Retain incident records 3 years after follow-up actions complete | IR | IR/AU retention | (no parseable Control ID token in cell) | — |
| 107 | Retain visitor access records (1–5 years per source) | PE | PE-8 | PE-8: VISITOR ACCESS RECORDS | [chapter-3-PE-family.md](../reference/JSIG-source/chapter-3-PE-family.md) |
| 108 | Execute PII retention/disposal per records schedule | DM | DM-2 | DM-2: DATA RETENTION AND DISPOSAL | [chapter-3-privacy-DM-family.md](../reference/JSIG-source/chapter-3-privacy-DM-family.md) |
| 109 | Track and initiate personnel reinvestigations | PS | PS-3 | PS-3: PERSONNEL SCREENING | [chapter-3-PS-family.md](../reference/JSIG-source/chapter-3-PS-family.md) |
| 110 | Conduct Technical Surveillance Countermeasures Survey | RA | RA-6 | RA-6: TECHNICAL SURVEILLANCE COUNTERMEASURES SURVEY | [chapter-3-RA-family.md](../reference/JSIG-source/chapter-3-RA-family.md) |

