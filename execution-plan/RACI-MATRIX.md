# Master RACI Matrix

Auto-generated from [MAINTENANCE-PLAN.md Section 4](../MAINTENANCE-PLAN.md#4-master-consolidated-calendar) (the 110-task Master Consolidated Calendar) and [ROLE-CROSSWALK.md](ROLE-CROSSWALK.md) (operational title -> JSIG-formal role mapping). Regenerate any time with:

```
python3 execution-plan/tools/build_raci_matrix.py
```

**Do not hand-edit the tables below.** The Master Calendar states who *executes* each task (Responsible); this script derives Accountable from ROLE-CROSSWALK.md and assigns Consulted/Informed from a per-control-family default (documented in the script's `FAMILY_RACI_DEFAULTS`) since JSIG does not itself specify family-level RACI. Treat Consulted/Informed as this project's judgment call, not a verbatim JSIG requirement -- update the script's defaults, not this file, if your organization staffs differently.

---

## Part A — Task-Level RACI (all 110 Master Calendar tasks)

| # | Task | Family | Responsible (executes) | Accountable | Consulted | Informed |
|---|---|---|---|---|---|---|
| 1 | Maintain asset/software inventory (automated) | CM | System Administrator | **ISSM** | CCB | AO/DAO |
| 2 | Monitor system communications/security dashboards | SI | ISSO / SOC analyst | **ISSO** | ISSM | ISSM |
| 3 | Real-time malware scanning of externally sourced files | SI | System Administrator | **ISSM** | ISSO | AO/DAO |
| 4 | Maintain IAVM directive compliance | SI | System Administrator, ISSO | **ISSM** | ISSO | AO/DAO |
| 5 | Enforce access control/session/least-privilege mechanisms | AC | System Administrator | **ISSM** | ISSO | AO/DAO |
| 6 | Monitor audit storage capacity and processing-failure alerts | AU | System Administrator | **ISSM** | ISSO | AO/DAO |
| 7 | Enforce boundary protection (firewalls/guards) | SC | Network Administrator | **ISSM** | ISSO | AO/DAO |
| 8 | Enforce encryption at rest (non-tailorable) | SC | System Administrator | **ISSM** | ISSO | AO/DAO |
| 9 | Enforce transmission confidentiality/integrity | SC | Network Administrator | **ISSM** | ISSO | AO/DAO |
| 10 | Enforce reauthentication/session timeout | IA | System Administrator | **ISSM** | ISSO | AO/DAO |
| 11 | Monitor denial-of-service protections/session authenticity | SC | Network Administrator | **ISSM** | ISSO | AO/DAO |
| 12 | Monitor temperature/humidity environmental controls | PE | Facility Security Officer | **PSO** | ISSM | AO/DAO |
| 13 | Operate privacy incident response capability | SE | Privacy Officer, IR Team Lead | **Information Owner/Steward** | ISSM | ISSM |
| 14 | Handle and monitor for security incidents (24/7) | IR | IR Team Lead / CND Team | **ISSM** | ISSO | AO/DAO, CISO |
| 15 | Maintain accounting-of-disclosures log | AR | Privacy Officer | **Information Owner/Steward** | ISSM | ISSM |
| 16 | Check/update malware-tool signatures | SI | System Administrator | **ISSM** | ISSO | AO/DAO |
| 17 | Provide incident status updates during active incident | IR | IR Team Lead | **ISSM** | ISSO | AO/DAO, CISO |
| 18 | Notify account manager on termination/transfer/need-to-know change (8–24 hr window) | AC | System Administrator, Personnel Security | **ISSM** | ISSO | AO/DAO |
| 19 | Process termination access-revocation actions (≤24 hr) | PS | Personnel Security Officer | **PSO** | ISSM | AO/DAO |
| 20 | Process transfer access-reassessment actions (≤24 hr) | PS | Personnel Security Officer | **PSO** | ISSM | AO/DAO |
| 21 | Verify system clock/time-stamp synchronization | AU | System Administrator | **ISSM** | ISSO | AO/DAO |
| 22 | Review and analyze system audit records | AU | ISSO / SOC analyst | **ISSO** | ISSM | ISSM |
| 23 | Run periodic malicious-code (antivirus) scans | SI | System Administrator | **ISSM** | ISSO | AO/DAO |
| 24 | Perform incremental backups (daily-incremental/weekly-full pattern) | CP | System Administrator | **ISSM** | ISSO | AO/DAO |
| 25 | Update Plan of Action and Milestones (POA&M) | CA | ISSO | **ISSO** | ISSM | AO/DAO |
| 26 | Assemble ConMon deliverable package | CA | ISSO | **ISSO** | ISSM | AO/DAO |
| 27 | Perform vulnerability scanning | RA | System Administrator, ISSO | **ISSM** | SCA | AO/DAO |
| 28 | Update scanner vulnerability signatures | RA | System Administrator | **ISSM** | SCA | AO/DAO |
| 29 | Check/report flaw-remediation (patch) status | SI | System Administrator | **ISSM** | ISSO | AO/DAO |
| 30 | Test backup integrity/restoration | CP | System Administrator | **ISSM** | ISSO | AO/DAO |
| 31 | Review physical access logs | PE | Facility Security Officer | **PSO** | ISSM | AO/DAO |
| 32 | Review visitor access records | PE | Facility Security Officer | **PSO** | ISSM | AO/DAO |
| 33 | Review Authorized Access List for restricted/SAPF areas | PE | Facility Security Officer | **PSO** | ISSM | AO/DAO |
| 34 | Convene Configuration Control Board (when changes proposed) | CM | CCB Chair | **ISSM** | CCB | AO/DAO |
| 35 | Update system component inventory (manual/verification pass) | CM | System Administrator | **ISSM** | CCB | AO/DAO |
| 36 | Maintain organization-level POA&M rollup | PM | ISSM | **ISSM** | AO/DAO | Risk Executive Function |
| 37 | Maintain organization-wide information system inventory | PM | ISSM | **ISSM** | AO/DAO | Risk Executive Function |
| 38 | Monitor nonlocal maintenance session records | MA | System Administrator | **ISSM** | ISSO | AO/DAO |
| 39 | Verify media storage physical/environmental controls | MP | Facility Security Officer | **PSO** | ISSO | ISSM |
| 40 | Monitor/audit privacy control compliance | AR | Privacy Officer, ISSO | **Information Owner/Steward** | ISSM | ISSM |
| 41 | Update PII/system-holdings inventory | SE | Privacy Officer, System Administrator | **Information Owner/Steward** | ISSM | ISSM |
| 42 | Verify security function operation (self-tests) | SI | System Administrator | **ISSM** | ISSO | AO/DAO |
| 43 | Verify software/firmware/information integrity | SI | System Administrator | **ISSM** | ISSO | AO/DAO |
| 44 | Install security-relevant software/firmware updates | SI | System Administrator | **ISSM** | ISSO | AO/DAO |
| 45 | Report information security performance measures | PM | ISSM | **ISSM** | AO/DAO | Risk Executive Function |
| 46 | Review privileged account list and entitlements | AC | ISSO | **ISSO** | ISSM | ISSM |
| 47 | Reassess least-privilege/privileged-function assignments | AC | ISSO, CCB | **ISSO** | ISSM | ISSM |
| 48 | Review authorized software list | CM | CCB, System Administrator | **ISSM** | CCB | AO/DAO |
| 49 | Reassess/reevaluate privileged access tied to change | CM | CCB, ISSO | **ISSM** | CCB | AO/DAO |
| 50 | Review unsupported system components (EOL/EOS) | SA | System Administrator | **ISSM** | ISSO | AO/DAO |
| 51 | Verify encryption-at-rest compliance | SC | System Administrator | **ISSM** | ISSO | AO/DAO |
| 52 | Verify transmission encryption compliance | SC | Network Administrator | **ISSM** | ISSO | AO/DAO |
| 53 | Distribute quarterly security/privacy awareness reminders | AT | Training Manager | **ISSM** | ISSO | ISSO |
| 54 | Review remote access and wireless access authorization lists | AC | Network Administrator | **ISSM** | ISSO | AO/DAO |
| 55 | Review publicly accessible content | AC | ISSO | **ISSO** | ISSM | ISSM |
| 56 | Review access-enforcement/flow-enforcement rule sets | AC | Network Administrator, ISSO | **ISSM** | ISSO | AO/DAO |
| 57 | Verify device identification/authentication configuration | IA | Network Administrator | **ISSM** | ISSO | AO/DAO |
| 58 | Verify configuration settings against baseline/STIG | CM | System Administrator, Network Administrator | **ISSM** | CCB | AO/DAO |
| 59 | Review protection of audit tools/information | AU | ISSO | **ISSO** | ISSM | ISSM |
| 60 | Review media access authorization list | MP | ISSO | **ISSO** | ISSM | ISSM |
| 61 | Verify media marking compliance | MP | System Administrator | **ISSM** | ISSO | AO/DAO |
| 62 | Review transmission medium/output device access controls | PE | System Administrator | **ISSM** | ISSO | PSO |
| 63 | Review data quality of PII holdings | DI | Data Owner, Privacy Officer | **Information Owner/Steward** | ISSM | ISSM |
| 64 | Track and report privacy complaint trends | IP | Privacy Officer | **Information Owner/Steward** | ISSM | ISSM |
| 65 | Review boundary-protection rule set | SC | Network Administrator | **ISSM** | ISSO | AO/DAO |
| 66 | Review spam protection mechanism effectiveness | SI | System Administrator | **ISSM** | ISSO | AO/DAO |
| 67 | Review non-privileged/user account list | AC | ISSO | **ISSO** | ISSM | ISSM |
| 68 | Test/exercise incident response capability (SAP default) | IR | IR Team Lead | **ISSM** | ISSO | AO/DAO, CISO |
| 69 | Review inventory records for computers/removable media (IRS-analog practice) | CM | System Administrator | **ISSM** | CCB | AO/DAO |
| 70 | Review/update baseline configuration | CM | System Administrator, Network Administrator | **ISSM** | CCB | AO/DAO |
| 71 | Review/update all family policies and procedures (-1 controls) | All 26 | ISSM | **ISSM** | ISSO | AO/DAO |
| 72 | Review/update contingency plan | CP | ISSM | **ISSM** | ISSO | AO/DAO |
| 73 | Test/exercise contingency plan | CP | ISSM, System Administrator | **ISSM** | ISSO | AO/DAO |
| 74 | Perform independent security control assessment | CA | SCA/SCAR | **SCA** | ISSM | AO/DAO |
| 75 | Perform penetration testing | CA | SCA/SCAR, ISSM | **SCA** | ISSM | AO/DAO |
| 76 | Review approved maintenance tools | MA | System Administrator, ISSM | **ISSM** | ISSO | AO/DAO |
| 77 | Update/reassess organizational risk assessment | RA | ISSM | **ISSM** | SCA | AO/DAO |
| 78 | Review/re-sign personnel access agreements | PS | Personnel Security Officer | **PSO** | ISSM | AO/DAO |
| 79 | Deliver annual security awareness refresher training | AT | Training Manager | **ISSM** | ISSO | ISSO |
| 80 | Deliver role-based training refresher | AT | Training Manager | **ISSM** | ISSO | ISSO |
| 81 | Deliver incident response training refresher | IR | Training Manager | **ISSM** | ISSO | AO/DAO, CISO |
| 82 | Deliver contingency training refresher | CP | Training Manager | **ISSM** | ISSO | AO/DAO |
| 83 | Review/update incident response plan | IR | ISSM | **ISSM** | ISSO | AO/DAO, CISO |
| 84 | Review/update auditable events list | AU | ISSM, ISSO | **ISSM** | ISSO | AO/DAO |
| 85 | Review unnecessary functions/ports/protocols/services | CM | System Administrator, Network Administrator | **ISSM** | CCB | AO/DAO |
| 86 | Inventory physical access devices; change combinations/keys | PE | Facility Security Officer | **PSO** | ISSM | AO/DAO |
| 87 | Review/update System Security Plan (SSP) | PL | ISSM | **ISSM** | ISSO | AO/DAO |
| 88 | Review Rules of Behavior acknowledgment | PL | ISSO, Training Manager | **ISSO** | ISSM | AO/DAO |
| 89 | Review external system service provider compliance | SA | ISSM | **ISSM** | ISSO | AO/DAO |
| 90 | Rotate/manage cryptographic keys | SC | System Administrator | **ISSM** | ISSO | AO/DAO |
| 91 | Review security categorization | RA | ISSM | **ISSM** | SCA | AO/DAO |
| 92 | Review position risk designations | PS | Personnel Security Officer | **PSO** | ISSM | AO/DAO |
| 93 | Update Privacy Impact Assessment | AR | Privacy Officer | **Information Owner/Steward** | ISSM | ISSM |
| 94 | Review PII minimization opportunities in holdings | DM | Privacy Officer, Data Owner | **Information Owner/Steward** | ISSM | ISSM |
| 95 | Review/update privacy notices, SORNs, and Privacy Act statements | TR | Privacy Officer | **Information Owner/Steward** | ISSM | ISSM |
| 96 | Review internal-use and third-party info-sharing compliance | UL | Privacy Officer | **Information Owner/Steward** | ISSM | ISSM |
| 97 | Review Configuration Management Plan | CM | ISSM | **ISSM** | CCB | AO/DAO |
| 98 | Test information system recovery/reconstitution procedures | CP | System Administrator | **ISSM** | ISSO | AO/DAO |
| 99 | Verify alternate storage/processing site and telecom readiness | CP | ISSM, System Administrator, Network Administrator | **ISSM** | ISSO | AO/DAO |
| 100 | Verify TEMPEST/information-leakage countermeasures (SAP-specific) | PE | Facility Security Officer, ISSM | **PSO** | ISSM | AO/DAO |
| 101 | Test fire detection/suppression and inspect water-damage risk | PE | Facility Security Officer | **PSO** | ISSM | AO/DAO |
| 102 | Review third-party/contractor personnel security compliance | PS | Personnel Security Officer | **PSO** | ISSM | AO/DAO |
| 103 | Retain audit records offline per NARA schedule or 6–7 years (IRS analog) | AU | System Administrator, ISSM | **ISSM** | ISSO | AO/DAO |
| 104 | Prevent identifier reuse for ≥2 years | IA | System Administrator | **ISSM** | ISSO | AO/DAO |
| 105 | Ensure every control assessed at least once per 3-year cycle | CA | SCA/SCAR | **SCA** | ISSM | AO/DAO |
| 106 | Retain incident records 3 years after follow-up actions complete | IR | ISSM, System Administrator | **ISSM** | ISSO | AO/DAO, CISO |
| 107 | Retain visitor access records (1–5 years per source) | PE | Facility Security Officer | **PSO** | ISSM | AO/DAO |
| 108 | Execute PII retention/disposal per records schedule | DM | Data Owner, System Administrator | **Information Owner/Steward** | ISSM | ISSM |
| 109 | Track and initiate personnel reinvestigations | PS | Personnel Security Officer | **PSO** | ISSM | AO/DAO |
| 110 | Conduct Technical Surveillance Countermeasures Survey | RA | Facility Security Officer, ISSM | **PSO** | SCA | AO/DAO |

---

## Part B — Role Rollup (task counts per JSIG §1.5 role)

Reverse index of Part A: for each of the 17 JSIG-formal roles, how many of the 110 Master Calendar tasks name that role as Accountable, Responsible/Executing, Consulted, or Informed. Roles with all zeros are not tied to a specific recurring operational task in the Master Calendar but still hold their JSIG §1.5 duties (governance, oversight, authorization) described in [references/JSIG-source/section-1.5-roles-and-responsibilities.md](../references/JSIG-source/section-1.5-roles-and-responsibilities.md) and their role playbook.

| JSIG §1.5 Role | Accountable (# tasks) | Responsible/Executing (# tasks) | Consulted (# tasks) | Informed (# tasks) |
|---|---|---|---|---|
| Agency/Component Head | 0 | 0 | 0 | 0 |
| Risk Executive Function | 0 | 0 | 0 | 3 |
| CIO | 0 | 0 | 0 | 0 |
| CISO | 0 | 0 | 0 | 6 |
| AO | 0 | 0 | 3 | 83 |
| DAO | 0 | 0 | 3 | 83 |
| PSO | 17 | 17 | 0 | 1 |
| CCP | 0 | 0 | 0 | 0 |
| ISO | 0 | 0 | 0 | 0 |
| ISSM | 77 | 87 | 39 | 20 |
| ISSO | 17 | 17 | 53 | 3 |
| ISSE | 0 | 0 | 0 | 0 |
| SCA | 3 | 3 | 5 | 0 |
| Information Owner/Steward | 11 | 13 | 0 | 0 |
| Privileged Users | 0 | 0 | 0 | 0 |
| General Users | 0 | 0 | 0 | 0 |
| MBO | 0 | 0 | 0 | 0 |

---

*Generated by `execution-plan/tools/build_raci_matrix.py` from 110 Master Calendar rows and the ROLE-CROSSWALK.md mapping. See also the finding-level (not task-level) severity-tiered RACI in [ESCALATION-MATRIX.md](templates/ESCALATION-MATRIX.md) and [VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md](templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md), which govern individual STIG/CVE findings rather than recurring operational tasks.*

