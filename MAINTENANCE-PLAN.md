# JSIG System Administration Maintenance Plan
### Operational Sustainment of Security Controls Across All 26 JSIG Control Families

**Scope:** This plan operationalizes the ongoing (RMF Step 6 / continuous-monitoring) maintenance obligations for a Special Access Program (SAP) information system governed by the [DoD/IC Joint Special Access Program (SAP) Implementation Guide (JSIG), 2016-04-11, Rev. 4](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf), cross-referenced to the [NIST SP 800-53 Rev. 4 control catalog](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml). It converts the 26-family control-family reference scaffold and the operational-maintenance-schedules research compilation into a single, actionable sustainment calendar, role assignment matrix, and evidence-retention plan intended to keep an Authorization to Operate (ATO) continuously defensible between assessments.

**Source documents used to build this plan:**
- Control-family reference scaffold: `reference/JSIG/control-families/INDEX.md` and the 26 family files (`AC.md` … `UL.md`)
- Cadence research compilation: `reference/research/operational-maintenance-schedules-research.md`
- Known extraction gaps: `reference/JSIG/appendices/EXTRACTION-LIMITATIONS.md`

---

## 1. Executive Summary

**This plan is built daily-operations-first.** The governing design principle, per current program direction, is that maintenance checks must primarily sustain the *daily* operational rhythm of the system — the continuous and daily/per-event tasks that a duty ISSO or System Administrator executes every shift — because that daily rhythm is what actually keeps a SAP system's security posture defensible between the weekly, monthly, and annual cadences layered on top of it. A missed daily malware-signature update, an unreviewed overnight remote-access anomaly, or a silent audit-logging gap does more real damage, more often, than a missed annual policy review; annual/periodic reviews mostly confirm that the daily fundamentals held. Accordingly, Section 1A now consolidates every continuous/daily/near-daily task from all 26 families into a single cross-domain daily checklist, and every family in Section 3 now carries a Deep-Dive Domain Analysis explaining the operational risk of letting that family's maintenance lapse — not just the cadence at which it should occur.

JSIG itself does not prescribe a single universal daily/weekly/monthly maintenance schedule. It defines RMF Step 6 (Monitor) as an ongoing activity — assessing control effectiveness, tracking system/environment changes, performing security impact analyses, and reporting security state to designated officials — without mandating fixed numeric intervals for most controls ([DCSA JSIG 2016](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)). NIST SP 800-53 Rev. 4 similarly leaves most timing decisions as organization-defined parameters (ODPs), and NIST SP 800-137 confirms that continuous-monitoring frequencies (daily, weekly, monthly, annual) are risk-based and not static across metrics or programs ([NIST SP 800-137](https://nvlpubs.nist.gov/nistpubs/legacy/sp/nistspecialpublication800-137.pdf)).

Because JSIG does not publish a numeric cadence catalog, this plan builds its maintenance calendar from the most rigorous **documented Federal analogues** — FedRAMP Low/Moderate/High SSP Appendix A control parameters, the FedRAMP Continuous Monitoring Playbook, IRS Publication 1075, CMS/HHS MARS-E/ARS guidance, the GSA Contingency Planning Guide, DoD's Cybersecurity Discipline Implementation Plan and IAVM program, and public STIG examples — all of which implement the same NIST SP 800-53 control set under binding numeric ODPs ([research compilation](https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf)). Every cadence in this plan is either (a) traceable to one of those sources, cited inline, or (b) explicitly flagged as **"no specific cadence documented"** with a reasoned interim default pending organization-defined tailoring and JSIG-specific verification, per the task's citation rule.

**What this plan covers:**
- A **Daily Operations & Sustainment Focus** section (1A) — a single consolidated, domain-grouped daily checklist covering every continuous/daily/near-daily task across all 26 families, with pass/fail criteria and named escalation paths, intended to be the primary operating document for the duty ISSO/SysAdmin.
- All **26 JSIG/NIST control families** (18 NIST Rev. 4 families plus the 8 Appendix J privacy families), each with its recurring/operational controls, a cadence table, a retained-evidence list, and — now — a **Deep-Dive Domain Analysis** covering the security purpose, failure modes, cross-family dependencies, and practical sustainment scenarios for that domain.
- A **master consolidated calendar** merging every recurring task from all 26 families into one frequency-sorted table for building an actual operations calendar or GRC tool schedule.
- **Roles & responsibilities** for the ISSM, ISSO, System Administrator, Network Administrator, Security Control Assessor (SCA)/Security Control Assessor Representative (SCAR), and supporting roles.
- A **phased "getting started" sequencing** plan for programs implementing this maintenance program from a cold start.
- A **risks/gaps** section flagging every family/control area where the underlying scaffold could not verify exact JSIG ODP values and needs manual confirmation against the primary JSIG PDF, per `EXTRACTION-LIMITATIONS.md`.

**Bottom line for planning purposes:** the recurring workload is dominated by weekly audit-log review (AU-6), monthly vulnerability scanning/POA&M/inventory update cycles (RA-5, CA-5, CM-8), monthly-to-semiannual account reviews (AC-2), and annual policy/plan/assessment refreshes (the family "-1" controls, CA-2, CP-2/CP-4, IR-8, PS-6, RA-3) — but underneath all of that sits a smaller, higher-frequency core of continuous and daily tasks (Section 1A) that determine whether the weekly/monthly/annual layers are even measuring a healthy system. Nothing in the public record suggests these cadences can safely be relaxed below the FedRAMP Moderate baseline for a SAP environment; where JSIG requires stricter values those must be substituted once verified.

## 1A. Daily Operations & Sustainment Focus

**Why this section exists:** the recurring feedback from ISSM/ISSO leadership is that this plan must be usable as an actual *daily* battle-rhythm document, not just an annual/monthly compliance calendar. Continuous ATO defensibility is won or lost in the day-to-day: a missed daily malware-signature update or an unreviewed access-log anomaly is the seed of most real-world incidents, while annual reviews mostly confirm that the daily fundamentals held. This section pulls every **continuous, daily, and per-event/near-daily task** out of the Section 4 master calendar and the family cadence tables, and re-organizes them into a literal checklist a duty ISSO or System Administrator can run through every shift, grouped by operational domain. Frequencies and control citations trace back to Section 3 and Section 4; consult those sections for full sourcing detail on each cadence.

**How to use this checklist:** treat it as the first and last action of every operational day (or every shift, in a 24/7 SOC model). Each row is one check. "Needs escalation" triggers should generate a ticket/incident and a named-role notification the same day — do not let a daily anomaly wait for the weekly AU-6 review or the monthly ConMon cycle to surface it.

---

### 1A.1 Access / Identity Domain

| # | Daily check | Why (control) | Normal | Needs escalation | Escalate to |
|---|---|---|---|---|---|
| D-AC1 | Confirm no account provisioning/disablement tickets are aging past their SLA window (8–24 hr notification, ≤72 hr temp/emergency account disablement, ≤90 day inactive-account disablement per JSIG ODP notes) | AC-2, AC-2(2), AC-2(3) — account management is the front door to every other control; a stale disablement ticket is an open, unmonitored attack surface | All termination/transfer/inactivity tickets from the prior 24 hours are closed within SLA | Any ticket open past its SLA window, especially a termination/transfer notice unprocessed after 24 hours | ISSO, System Administrator, Personnel Security Officer |
| D-AC2 | Spot-check that session-lock/session-termination enforcement (idle timeout, absence >6 hr logout) is functioning on a sample of endpoints/servers | AC-11, AC-12 — continuous enforcement per JSIG ODP; a silently-failed session lock is invisible until misused | Locks trigger at configured thresholds on all sampled systems | Any system where sessions remain unlocked past threshold | System Administrator |
| D-AC3 | Confirm least-privilege/access-enforcement mechanisms (RBAC rules, flow-enforcement rules) have not silently reverted or been bypassed by a change made in the last 24 hours | AC-3, AC-6, AC-6(1) — continuous enforcement; AC-6(1) is JSIG non-tailorable | No unapproved privilege changes since last check; CCB log matches deployed state | Privilege/role assignment found that does not trace to an approved CCB ticket | ISSO, CCB Chair |
| D-AC4 | Review overnight/prior-day remote access and wireless access connection logs for out-of-pattern sessions (unusual hours, unusual source, unfamiliar device) | AC-17, AC-18 — remote/wireless are the highest-value external entry points and are reviewed quarterly at the rule-set level, but connection anomalies must be caught daily | Connections match known user/device/location patterns | Connection from unrecognized device, impossible-travel geolocation, or after-hours access by an account with no after-hours business need | Network Administrator, ISSO |
| D-IA1 | Verify reauthentication/session-timeout enforcement (AAL2: 12 hr or 30 min inactivity; AAL3: 12 hr or 15 min inactivity) is active | IA-11 — continuous enforcement; degraded enforcement quietly extends every other risk in this table | Timeout enforced per configured AAL policy | Sessions observed persisting beyond configured timeout | System Administrator |
| D-PS1 | Confirm any termination/transfer notices received in the last 24 hours have triggered corresponding AC-2/PS-4/PS-5 access-revocation actions | AC-2, PS-4, PS-5 — personnel security and account management are two halves of the same control; a termination without same-day revocation is a live orphaned-credential risk | Every termination/transfer notice has a matching revocation ticket closed same day | Termination/transfer notice with no matching revocation action | Personnel Security Officer, System Administrator |

### 1A.2 Audit / Monitoring Domain

| # | Daily check | Why (control) | Normal | Needs escalation | Escalate to |
|---|---|---|---|---|---|
| D-AU1 | Verify audit logging is actively generating records on all critical systems (no silent logging outage) | AU-12, AU-4, AU-5 — continuous; an audit gap is worse than a bad finding because it blinds every other control's evidence trail | Log volume/heartbeat consistent with baseline on all monitored systems | Any system with no new audit records, a sudden volume drop, or a logging-service crash | System Administrator, ISSO |
| D-AU2 | Check audit storage capacity and audit-processing-failure alerts | AU-4, AU-5 — continuous monitoring | Storage utilization within normal threshold; no unacknowledged failure alerts | Storage nearing capacity or unacknowledged processing-failure alert | System Administrator |
| D-AU3 | Verify system clock/time-stamp synchronization across all audited systems | AU-8 — daily automated check (no JSIG-documented cadence; SAP default recommended in Section 3.3) | All systems within acceptable clock-drift tolerance of the authoritative time source | Clock drift beyond tolerance on any audited system (breaks correlation across logs) | System Administrator |
| D-SI1 | Monitor real-time security dashboards/SIEM for indicators of compromise or anomalous behavior flagged since the last shift | SI-4 — continuous monitoring; this is the "eyes on glass" function that the weekly AU-6 deep review builds on | No open high/critical alerts; routine alerts triaged and closed | Any open high/critical alert, or a pattern of repeated low-severity alerts from the same source | ISSO / SOC analyst, IR Team Lead if confirmed incident |
| D-IR1 | Confirm 24/7 incident monitoring/handling capability is staffed and operating; check for any open incident requiring a daily status update | IR-4, IR-5, IR-6 — continuous monitoring; daily status updates required during any active incident | IR watch is staffed; no active incidents, or all active incidents have a status update logged for the day | Unstaffed IR watch gap, or an active incident missing its required daily update | IR Team Lead |
| D-AR1 | Confirm the accounting-of-disclosures log has been updated for any PII disclosure made in the last 24 hours (if system processes PII) | AR-8 — continuous/per-event | Every disclosure event has a matching log entry | Disclosure event with no log entry | Privacy Officer |

### 1A.3 Configuration / Patching Domain

| # | Daily check | Why (control) | Normal | Needs escalation | Escalate to |
|---|---|---|---|---|---|
| D-CM1 | Verify automated asset/software inventory feed is current and reconciling (no stale or missing agent check-ins) | CM-8, CM-11 — continuous automated inventory is the substrate CA-5/RA-5/PM-5 all depend on | Inventory agent check-ins current within expected interval | Missing check-ins beyond threshold, or unexplained new/unauthorized asset appearing in inventory | System Administrator |
| D-SI2 | Check for newly released security-relevant patches, IAVA/IAVB notices, and CISA KEV catalog additions; log against the 21/30-day (DoD/FedRAMP) and 2-week (KEV/BOD 22-01) remediation clocks | SI-2, SI-5, RA-5 — patch currency is one of the highest-leverage daily habits; missing a day compounds against a hard deadline | No new IAVA/KEV item outstanding beyond its clock, or all new items logged same day with a remediation ticket opened | New IAVA/KEV item not logged same day, or an existing item approaching its deadline with no remediation progress | System Administrator, ISSO |
| D-CM2 | Confirm no unauthorized/unapproved configuration change occurred outside the CCB process in the last 24 hours (compare deployed state to last-approved baseline) | CM-2, CM-3, CM-5 — configuration drift is the single most common root cause of audit findings and incidents; catching it same-day is far cheaper than catching it at the next STIG scan | Deployed configuration matches last CCB-approved baseline | Any drift from approved baseline with no corresponding change ticket | System Administrator, CCB Chair |
| D-CM3 | Monitor for unauthorized user-installed software appearing on endpoints | CM-11 — continuous automated monitoring preferred | No new unauthorized software detected | Unauthorized/unlicensed software installation detected | System Administrator |

### 1A.4 Malware / Endpoint Domain

| # | Daily check | Why (control) | Normal | Needs escalation | Escalate to |
|---|---|---|---|---|---|
| D-SI3 | Verify malicious-code protection signatures/tools updated (not less than daily per IRS Pub 1075 analogue) | SI-3 — daily signature currency is the single cheapest control in this entire plan and the one most often silently skipped | Signature version current as of today's release | Signature version stale by more than one release cycle | System Administrator |
| D-SI4 | Confirm real-time malware scanning of externally sourced files (email attachments, downloads, removable media) is active and logging detections | SI-3 — continuous/real-time enforcement | Real-time scanning engine reports "active" status on all endpoints | Scanning engine disabled, crashed, or reporting "not running" on any endpoint | System Administrator |
| D-SI5 | Review malware detection/quarantine events from the last 24 hours for any that indicate lateral movement, repeated reinfection, or a new malware family | SI-3, SI-4 — a single blocked file is routine; a pattern is an incident | Detections are isolated, single-file, successfully quarantined | Repeated detections on the same host, detections across multiple hosts, or an unrecognized malware signature | ISSO / SOC analyst, IR Team Lead |

### 1A.5 Backup / Contingency Readiness Domain

| # | Daily check | Why (control) | Normal | Needs escalation | Escalate to |
|---|---|---|---|---|---|
| D-CP1 | Verify the prior night's/prior cycle's backup job(s) completed successfully (daily incremental / weekly full pattern) | CP-9 — a failed backup discovered only during a restore-time emergency defeats the entire contingency program | Backup job status shows "success" with expected data volume | Backup job failed, partially completed, or produced an unexpectedly small/large data volume | System Administrator |
| D-CP2 | Confirm backup media/repository is reachable and not showing corruption/capacity warnings | CP-9, CP-6 — supports alternate storage site readiness | Backup storage healthy, capacity within threshold | Corruption warning, unreachable repository, or capacity threshold breached | System Administrator |

### 1A.6 Physical / Environmental Domain

| # | Daily check | Why (control) | Normal | Needs escalation | Escalate to |
|---|---|---|---|---|---|
| D-PE1 | Monitor temperature/humidity environmental control readings for the facility/data center | PE-14 — continuous automated monitoring; environmental excursions are a leading cause of unplanned hardware failure and, in a SAP facility, of coverage/decontrol events | Readings within normal operating range | Reading outside threshold, or sensor offline | Facility Security Officer, System Administrator |
| D-PE2 | Spot-check physical access control point operation (badge readers, mantraps, alarms) and note any anomalous after-hours access | PE-3, PE-6 — daily spot-check feeds the monthly formal log review and catches problems before a month's worth of anomalies accumulate unnoticed | Access points functioning; no unexplained after-hours entries | Access-control device malfunction, or after-hours entry with no corresponding approved access/visit record | Facility Security Officer |
| D-PE3 | Confirm no unresolved delivery/removal-of-equipment event from the prior day remains undocumented | PE-16 — per-event control with same-day documentation expectation | All equipment movement logged with authorization | Equipment movement without a matching authorization record | Facility Security Officer |

### 1A.7 Network / Boundary Domain

| # | Daily check | Why (control) | Normal | Needs escalation | Escalate to |
|---|---|---|---|---|---|
| D-SC1 | Confirm boundary protection devices (firewalls, guards) are up, enforcing the current rule set, and free of unauthorized rule changes | SC-7 — continuous enforcement; a firewall rule silently added or removed outside change control is one of the most common breach preconditions | Boundary devices report "up" and rule set matches last-approved baseline | Device down/degraded, or rule set differs from approved baseline | Network Administrator |
| D-SC2 | Verify encryption-at-rest and encryption-in-transit mechanisms remain enabled across monitored systems | SC-28 (JSIG non-tailorable), SC-8 — continuous enforcement of a non-tailorable control deserves daily, not just quarterly, sampling | Encryption status reports "enabled" on all sampled systems | Any system reporting encryption disabled, expired certificate, or failed handshake pattern | System Administrator, Network Administrator |
| D-SC3 | Monitor denial-of-service protection status and session-authenticity mechanisms for active mitigation events | SC-5, SC-23 — continuous automated protection | No active DoS mitigation event, or mitigations resolving normally | Sustained DoS mitigation event or session-hijacking indicator | Network Administrator, IR Team Lead |

---

**Daily checklist completion record:** the duty ISSO/SysAdmin should log completion of all rows above (or documented exceptions with escalation ticket numbers) each operational day. This daily log itself becomes evidence supporting the weekly AU-6 review (Section 3.3), the monthly ConMon package (Section 3.4), and ultimately the continuous-ATO risk picture briefed to the AO. Treat any row left unchecked for more than one day as a control gap in its own right, not merely an administrative oversight — see the Section 6 risks/gaps discussion for how undocumented daily gaps compound into larger audit findings.


---

## 2. Roles & Responsibilities

| Role | Core maintenance responsibilities in this plan |
|---|---|
| **Information System Security Manager (ISSM)** | Owns the overall security program; approves policy (-1 controls) reviews; chairs the annual risk assessment (RA-3) and contingency/IR plan reviews; approves POA&M closures and risk acceptance; briefs the Authorizing Official (AO) on security posture. |
| **Information System Security Officer (ISSO)** | Day-to-day control owner for the accredited system; executes/oversees weekly audit review (AU-6), monthly ConMon package assembly (CA-5/CM-8/RA-5), account review cycles (AC-2), physical/visitor log reviews (PE-6/PE-8), and coordinates POA&M item tracking. |
| **System Administrator (SA)** | Executes technical maintenance: patching/updates (SI-2), malware tool operation (SI-3), backup execution and testing (CP-9), configuration baseline maintenance (CM-2/CM-6), account provisioning/disablement actions (AC-2), maintenance tool control (MA-3), and log generation/retention support (AU). |
| **Network Administrator (NA)** | Maintains boundary/communications protections (SC family), network device configuration baselines (CM-2/CM-6 for network devices), wireless/remote access controls (AC-17/AC-18), and network-layer monitoring feeding AU-6/SI-4. |
| **Security Control Assessor (SCA) / SCA-Representative (SCAR)** | Performs independent annual control assessments (CA-2), periodic penetration testing (CA-8), and validates control effectiveness evidence supporting continuous ATO. |
| **Facility Security Officer (FSO)/Physical Security** | Manages facility access lists, visitor logs, key/combination changes, and physical access device inventories (PE family). |
| **Personnel Security Officer** | Manages access agreements, personnel screening/reinvestigation cycles, and termination/transfer notifications feeding AC-2 and PS family. |
| **Incident Response (IR) Team Lead / CND Team** | Executes incident detection, handling, reporting, and after-action/lessons-learned cycles (IR family); coordinates with US-CERT/DoD/agency reporting chains. |
| **Configuration Control Board (CCB)** | Reviews/approves configuration changes (CM-3), reassesses privilege assignments tied to change (CM-5(5)), and maintains the authorized software/hardware baseline (CM-7/CM-8). |
| **Privacy Officer / Data Owner** | Owns Appendix J privacy-control maintenance (AP, AR, DI, DM, IP, SE, TR, UL) — data quality checks, retention/disposition schedules, transparency notice updates, and use-limitation reviews. |
| **Training Manager** | Administers initial and annual security/privacy awareness training and role-based training refreshers (AT family, IR-2, CP-3, PS training elements). |
| **Authorizing Official (AO) / Designated Approving Authority (DAA)** | Reviews ISSM briefings, accepts residual risk, and authorizes continued operation based on continuous monitoring evidence produced by this plan. |

---
## 3. Family-by-Family Maintenance Requirements

Each family below lists: (a) controls with an ongoing/recurring maintenance component (one-time-setup-only controls are noted briefly and excluded from the cadence table), (b) a maintenance cadence table, and (c) artifacts to retain for ATO/accreditation continuity. Unless otherwise cited, "research file" refers to `reference/research/operational-maintenance-schedules-research.md`. All family control inventories are drawn from `reference/JSIG/control-families/<CODE>.md`.

---

### 3.1 AC — Access Control

**Ongoing/operational controls:** AC-2 (Account Management), AC-3 (Access Enforcement — continuous enforcement, periodic rule review), AC-4 (Information Flow Enforcement — periodic rule review), AC-5 (Separation of Duties — periodic review), AC-6 and AC-6(1) (Least Privilege — periodic privileged-function review; **AC-6(1) is JSIG non-tailorable**), AC-7 (Unsuccessful Logon Attempts — periodic threshold review), AC-11/AC-12 (Session Lock/Termination — periodic settings verification), AC-17 (Remote Access — periodic review of allowed methods), AC-18 (Wireless Access — periodic review), AC-20 (Use of External Systems — periodic agreement review), AC-22 (Publicly Accessible Content — periodic content review). **Initial-only/documentation controls:** AC-1 (policy — reviewed on its own annual cadence, see AT/CM/etc. pattern below), AC-8/AC-14 (system use notification/permitted actions — verify text at deployment, re-verify on change).

| Task | Frequency | Responsible Role | Control ID(s) | Source/justification |
|---|---|---|---|---|
| Review privileged account list and entitlements | Monthly (FedRAMP High) / Quarterly (FedRAMP Moderate) — recommend Quarterly as SAP default pending JSIG ODP verification | ISSO | AC-2 | [FedRAMP High SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-High-FedRAMP-Security-Controls.docx), [FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx) |
| Review non-privileged/user account list | Semiannual (FedRAMP High) / Annual (FedRAMP Moderate/Low, IRS) — recommend Semiannual as SAP default | ISSO | AC-2 | [FedRAMP High SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-High-FedRAMP-Security-Controls.docx), [IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf) |
| Notify account manager of termination/transfer/need-to-know change | 8–24 hours (FedRAMP), 24 hours (IRS) | System Administrator, Personnel Security | AC-2 | [FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx), [IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf) |
| Disable temporary/emergency accounts | ≤72 hrs per JSIG ODP (per family scaffold note) | System Administrator | AC-2(2) | JSIG-specific ODP per `AC.md` extraction notes; corroborated range 24–96 hrs across [FedRAMP High](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-High-FedRAMP-Security-Controls.docx)/[Moderate](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx)/[IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf) |
| Disable inactive accounts | ≤90 days per JSIG ODP (per family scaffold note) | System Administrator | AC-2(3) | JSIG-specific ODP per `AC.md`; corroborated range 35–120 days across [FedRAMP High](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-High-FedRAMP-Security-Controls.docx)/[Moderate](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx)/[IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf) |
| Enforce logout after absence >6 hours | Continuous (session-lock enforcement); verify config quarterly | System Administrator | AC-11, AC-12 | JSIG-specific ODP per `AC.md` extraction notes |
| Review access-enforcement/flow-enforcement rule sets | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: quarterly, pending verification | Network Administrator, ISSO | AC-3, AC-4 | research file general RMF Step 6 framing only ([DCSA JSIG 2016](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)) |
| Review separation-of-duties matrix | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual, aligned with account/role recertification | ISSM | AC-5 | No documented cadence in research file; annual default aligns with account review cycle |
| Reassess least-privilege/privileged-function assignments | Quarterly (aligned to CM-5(5) privilege reevaluation pattern) | ISSO, CCB | AC-6, AC-6(1) | [FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx) (CM-5(5) quarterly privilege reevaluation used as proxy cadence) |
| Review remote access and wireless access authorization lists | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: quarterly | Network Administrator | AC-17, AC-18 | No documented cadence in research file for AC-17/18 specifically |
| Review external information system use agreements | Annual (aligned with PS-6 access agreement cadence) | ISSM | AC-20 | [FedRAMP Continuous Monitoring Playbook](https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf) (annual review pattern applied by analogy) |
| Review publicly accessible content for nonpublic information | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: quarterly | ISSO | AC-22 | No documented cadence in research file |
| Review/update access control policy and procedures | Annual | ISSM | AC-1 | [FedRAMP Continuous Monitoring Playbook](https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf) annual -1 control review pattern |

**Artifacts to retain:** account review sign-off logs/spreadsheets, account creation/modification/disablement tickets with timestamps, privileged-access lists with approval signatures, separation-of-duties matrix, remote/wireless access authorization lists, external system use agreements, AC policy/procedure document with version history and review dates.

**Deep-Dive Domain Analysis: Access Control**

Access control exists to enforce the principle that every subject's ability to reach every object on the system is deliberate, minimal, and traceable — it is the mechanism that turns an authorization decision made once (who should have access to what) into an enforced technical reality every second the system runs ([DCSA JSIG 2016](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf); AC-2/AC-3/AC-6 control statements, `AC.md`). The underlying security purpose is defense against both external compromise (an attacker who gains a foothold should not automatically gain broad access) and insider risk (a legitimate user should not retain more access than their current role requires). AC-6(1) least-privilege for security functions is JSIG non-tailorable, signaling that in a SAP environment this is treated as a floor, not a target.

**Common failure modes when AC maintenance lapses:** stale privileged accounts left active after role change or departure (the single most common finding in real-world breach post-mortems); privilege creep, where users accumulate access across role changes without corresponding removal; session controls (AC-11/AC-12) that are configured once at deployment and never re-verified, silently drifting out of compliance after a platform update resets defaults; and unreviewed remote-access/wireless authorization lists (AC-17/AC-18) that continue to authorize methods or devices no longer in active use, expanding the attack surface without anyone noticing.

**Cross-family dependencies:** AC is one of the most heavily depended-upon families in this plan. AC feeds AU directly — every account action (creation, privilege change, disablement) must generate an audit event that AU-6 weekly review can catch anomalies in; if AC-2 account management is sloppy, AU-6 review becomes noise rather than signal. AC depends on PS (Personnel Security) for its termination/transfer triggers — PS-4/PS-5 events are the input that starts the AC-2 24-hour disablement clock. AC depends on IA for the authentication layer underneath its enforcement (AC-3 access enforcement is meaningless without IA-2/IA-5 establishing who the subject actually is). AC feeds CM — privileged-access reassessment (AC-6/AC-6(1)) is explicitly reevaluated on the same quarterly cadence as CM-5(5) configuration-change privilege review, because a change-control privilege and a standing access privilege are two views of the same risk. AC also feeds SC — remote access (AC-17) and boundary protection (SC-7) are complementary controls over the same attack surface and should be reviewed together.

**What sustainment looks like in practice:**
1. A quarterly privileged-account review surfaces three service accounts with domain admin rights that were granted for a one-time migration project six months ago and never revoked — the ISSO revokes them and documents the finding in the POA&M rather than waiting for the next independent assessment to catch it.
2. A duty SysAdmin's daily access/identity checklist item catches a remote-access login from an unfamiliar geographic location on a privileged account at 3 a.m.; the session is suspended and escalated to the ISSO within the hour rather than surfacing a week later in the AU-6 audit review.
3. During the Phase 1 "getting-started" baseline stand-up (Section 5), the ISSO discovers the previous ad hoc process had no documented separation-of-duties matrix (AC-5); building one before the first CCB meeting prevents the same individual from both authoring and approving a configuration change.
4. A termination notice for a departing contractor triggers automatic account disablement within the AC-2(2) ODP window, and the System Administrator confirms in the same ticket that the account's remote-access and VPN certificates (AC-17) were also revoked — closing a gap where account disablement alone would have left a still-valid client certificate active.

---

### 3.2 AT — Awareness And Training

**Ongoing/operational controls:** AT-2 (Security Awareness Training — initial + annual refresh), AT-3 (Role-Based Training — initial + annual refresh), AT-4 (Training Records — continuous maintenance). **Initial-only:** AT-1 (policy — annual review cadence applies), AT-5 (withdrawn, incorporated into PM-15).

| Task | Frequency | Responsible Role | Control ID(s) | Source/justification |
|---|---|---|---|---|
| Deliver initial security awareness training to new users | Initial, at onboarding (one-time per user; not recurring) | Training Manager | AT-2 | [FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx) (analogous IR-2 initial timelines used as pattern) |
| Deliver annual security awareness refresher training | Annual | Training Manager | AT-2 | [IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf) annual training-refresh pattern |
| Deliver role-based training to privileged/specialized roles | Initial (within 10–30 days of role assignment) + Annual refresh | Training Manager | AT-3 | [FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx) IR-2 initial-training timelines applied by analogy to role-based training |
| Distribute quarterly security/privacy awareness reminders | Quarterly | Training Manager | AT-2 (supplemental) | [IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf) quarterly awareness reminder requirement |
| Update and reconcile training completion records | Monthly reconciliation recommended; no specific cadence documented in research file — recommend ODP per JSIG tailoring; suggested default: monthly | Training Manager | AT-4 | No documented cadence; monthly default aligned with ConMon reporting rhythm |
| Review/update awareness and training policy | Annual | ISSM | AT-1 | [FedRAMP Continuous Monitoring Playbook](https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf) annual -1 control pattern |

**Artifacts to retain:** training completion rosters/certificates, role-based training curricula and sign-in sheets, quarterly reminder distribution logs, AT policy document with review history.

**Deep-Dive Domain Analysis: Awareness And Training**

AT exists to ensure that every person with system access — not just the technical controls — is a functioning part of the security posture. Technical controls like AC and SC assume users will recognize phishing, follow procedures, and understand their reporting obligations; AT-2/AT-3 are the mechanism that makes that assumption true rather than aspirational ([DCSA JSIG 2016](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf); AT-2/AT-3 control statements, `AT.md`).

**Common failure modes when AT maintenance lapses:** training becomes a one-time checkbox at onboarding with no annual refresh, so awareness decays exactly as the threat landscape evolves; role-based training (AT-3) for privileged users lags behind actual privilege grants, meaning someone gets admin rights before they've been trained on the heightened responsibilities that come with them; and training records (AT-4) go unreconciled, so an audit or incident investigation cannot establish who was current on training at the time of an event.

**Cross-family dependencies:** AT feeds IR — a workforce that recognizes and reports anomalies faster shortens IR-4/IR-5 detection time, and IR-2 incident-response-specific training is really an AT-3 role-based-training instance for the IR team. AT feeds CP — CP-3 contingency training is likewise a specialized AT-3 track. AT depends on PS for its population data — new hires flagged by PS-2/PS-3 screening are the trigger for AT-2 initial training, and a broken PS-to-AT handoff means new personnel could gain system access before completing required training. AT feeds AC indirectly — Rules of Behavior acknowledgment (PL-4) is typically bundled with annual training refreshers.

**What sustainment looks like in practice:**
1. The Training Manager's quarterly awareness-reminder distribution (AT-2 supplemental) includes a real recent phishing attempt observed in SI-4 monitoring, turning a generic reminder into a concrete, memorable lesson.
2. During onboarding, a new privileged-role hire completes role-based training (AT-3) before — not after — their AC-2 privileged account request is approved, closing the sequencing gap that most audits find.
3. The annual training-record reconciliation (AT-4) catches two employees whose refresher training lapsed 45 days ago; their accounts are flagged for review pending completion, tying AT directly into AC-2 enforcement rather than treating training compliance as a separate, toothless metric.
4. A post-incident lessons-learned review (IR-4 post-incident) identifies that the initial user who reported the incident had never received the annual refresher; the finding becomes a training-content update rather than a one-off personnel note.

---

### 3.3 AU — Audit And Accountability

**Ongoing/operational controls:** AU-2 (Audit Events — periodic review), AU-3 (Content of Audit Records — verify on change), AU-4 (Audit Storage Capacity — continuous monitoring), AU-5 (Response to Audit Processing Failures — continuous), AU-6 (Audit Review, Analysis, Reporting — the core recurring task), AU-7 (Audit Reduction/Report Generation — continuous tool operation), AU-8 (Time Stamps — continuous sync verification), AU-9 (Protection of Audit Information — continuous), AU-11 (Audit Record Retention — ongoing retention management), AU-12 (Audit Generation — continuous), AU-13–16 (monitoring for information disclosure/cross-org auditing — periodic per JSIG tailoring). **Initial-only:** AU-1 (policy).

| Task | Frequency | Responsible Role | Control ID(s) | Source/justification |
|---|---|---|---|---|
| Review and analyze system audit records | At least weekly | ISSO / SOC analyst | AU-6 | [FedRAMP Low/Moderate/High SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx), [IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf), [STIG Viewer z/OS TSS V-3331](https://www.stigviewer.com/stig/zos_tss/2017-03-22/finding/V-3331) (every 7 days) |
| Escalate audit review frequency during anomalous activity | Event-driven (e.g., biweekly → weekly escalation) | ISSO | AU-6 | [NIST SP 800-137](https://nvlpubs.nist.gov/nistpubs/legacy/sp/nistspecialpublication800-137.pdf) |
| Review/update list of auditable events | Annual, and whenever threat environment changes | ISSM, ISSO | AU-2 | [FedRAMP High SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-High-FedRAMP-Security-Controls.docx), [IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf) |
| Monitor audit storage capacity and failure alerts | Continuous | System Administrator | AU-4, AU-5 | [NIST SP 800-137](https://nvlpubs.nist.gov/nistpubs/legacy/sp/nistspecialpublication800-137.pdf) general continuous-monitoring framing |
| Verify system clock/time-stamp synchronization | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: daily automated check | System Administrator | AU-8 | No documented cadence in research file |
| Retain audit records (online) | ≥90 days online | System Administrator | AU-11 | [FedRAMP Low/Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx) |
| Retain audit records (offline/archive) | Per NARA schedule (FedRAMP) or 6–7 years (IRS) — recommend organization records-schedule verification | System Administrator, ISSM | AU-11 | [FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx), [IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf), [IRS Safeguards audit requirements](https://www.irs.gov/privacy-disclosure/meeting-irs-safeguards-audit-requirements) |
| Review protection of audit tools/information for tampering | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: quarterly | ISSO | AU-9 | No documented cadence in research file |
| Review/update audit and accountability policy | Annual | ISSM | AU-1 | [FedRAMP Continuous Monitoring Playbook](https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf) annual -1 pattern |

**Artifacts to retain:** weekly audit-review logs/sign-offs with reviewer identity and findings disposition, auditable-events list with revision history, audit storage capacity alerts and remediation tickets, retention/disposition records, AU policy document.

**Deep-Dive Domain Analysis: Audit And Accountability**

AU exists to produce the evidentiary record that every other control's effectiveness is ultimately judged against — without reliable audit records, no other family can prove it is working, and no incident investigation can reconstruct what happened ([DCSA JSIG 2016](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf); AU-2/AU-6/AU-12 control statements, `AU.md`). AU-6 weekly review is the strongest cross-source cadence convergence in this entire plan — FedRAMP Low/Moderate/High, IRS Publication 1075, and a public STIG example all independently arrive at "at least weekly" ([FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx), [IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf), [STIG Viewer z/OS TSS V-3331](https://www.stigviewer.com/stig/zos_tss/2017-03-22/finding/V-3331)) — which is itself evidence that audit review sits at the center of the daily/weekly operational rhythm this plan is built around.

**Common failure modes when AU maintenance lapses:** silent logging outages (a crashed audit daemon or a disk-full condition) that go undetected until an incident investigation discovers a gap in the record exactly when it was needed most; audit storage filling up and either dropping new events or, worse, being configured to halt system operation (AU-5) without anyone noticing until it takes down production; clock drift across systems (AU-8) that makes correlating events across multiple log sources unreliable during an investigation; and audit review becoming a rubber-stamp weekly exercise that never escalates frequency even when NIST SP 800-137 explicitly expects biweekly-to-weekly escalation during anomalous periods ([NIST SP 800-137](https://nvlpubs.nist.gov/nistpubs/legacy/sp/nistspecialpublication800-137.pdf)).

**Cross-family dependencies:** AU is the most depended-upon family in the entire plan — nearly every other family's maintenance activity is only verifiable because AU generates the record of it. CM feeds AU (every configuration change should generate an audit trail that AU-6 review can compare against the CCB-approved change log). AC feeds AU (every account action must be auditable). SI feeds IR through AU — SI-4 continuous monitoring surfaces anomalies that AU-6 review analyzes, and confirmed anomalies become IR-4 incidents. PE feeds AU-adjacent physical logs (PE-6/PE-8) that are reviewed on a parallel monthly cadence. Because so much depends on AU, an audit gap is disproportionately dangerous: it doesn't just weaken AU's own controls, it removes the evidence needed to know whether AC, CM, SI, and PE are working at all.

**What sustainment looks like in practice:**
1. The daily audit-monitoring domain check (Section 1A.2) catches a logging service that silently stopped on one server overnight; it is restored and backfilled from local buffers before the weekly AU-6 review would have caught the multi-day gap.
2. During a period of elevated threat reporting, the ISSO escalates AU-6 review frequency from weekly to daily for the affected systems, consistent with the NIST SP 800-137 risk-based escalation model, and documents the temporary cadence change in the ConMon package.
3. The annual AU-2 auditable-events review adds a new event type after a tabletop exercise revealed that a particular privilege-escalation technique would not have generated any log entry under the current configuration.
4. Audit record retention verification (AU-11) confirms that 90 days of online retention plus the organization's records-schedule-driven offline archive are both intact ahead of a scheduled independent assessment (CA-2), avoiding a last-minute scramble to prove retention compliance.

---

### 3.4 CA — Security Assessment And Authorization

**Ongoing/operational controls:** CA-2 (Security Assessments — annual/periodic), CA-3 (System Interconnections — periodic review of agreements), CA-5 (Plan of Action and Milestones — the core recurring POA&M update task), CA-6 (Security Authorization — periodic reauthorization/continuous ATO decision), CA-7 (Continuous Monitoring — referenced in research though not separately itemized in `CA.md`; recurring monthly scan/report cycle), CA-8 (Penetration Testing — annual/periodic), CA-9 (Internal System Connections — periodic review). **Withdrawn:** CA-4 (→ CA-2).

| Task | Frequency | Responsible Role | Control ID(s) | Source/justification |
|---|---|---|---|---|
| Update Plan of Action and Milestones (POA&M) | At least monthly | ISSO | CA-5 | [FedRAMP Continuous Monitoring Playbook](https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf), [FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx), [CMS POA&M Handbook](https://security.cms.gov/learn/cms-plan-action-and-milestones-poam-handbook) |
| Assemble monthly continuous-monitoring (ConMon) deliverable package (executive summary, POA&M, inventory, scan results) | Monthly | ISSO | CA-7, CA-5, CM-8, RA-5 | [FedRAMP Continuous Monitoring Playbook](https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf) |
| Perform independent security control assessment | At least annually; every control assessed at least once per 3-year cycle | SCA/SCAR | CA-2 | [FedRAMP Continuous Monitoring Playbook](https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf), [FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx), [NIST SP 800-137](https://nvlpubs.nist.gov/nistpubs/legacy/sp/nistspecialpublication800-137.pdf) |
| Perform penetration testing | At least annually | SCA/SCAR, ISSM | CA-8 | [FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx), [FedRAMP High SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-High-FedRAMP-Security-Controls.docx) |
| Review system interconnection agreements | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual | ISSM | CA-3 | No documented cadence in research file; annual default aligned with -1 control pattern |
| Review internal system connections | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual | ISSO | CA-9 | No documented cadence in research file |
| Reauthorization / continuous-ATO risk determination briefing to AO | Annual at minimum, or per continuous-ATO risk-based cadence | ISSM, AO | CA-6 | [NIST SP 800-137](https://nvlpubs.nist.gov/nistpubs/legacy/sp/nistspecialpublication800-137.pdf) risk-based reauthorization framing |
| Review/update security assessment and authorization policy | Annual | ISSM | CA-1 | [FedRAMP Continuous Monitoring Playbook](https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf) |

**Artifacts to retain:** POA&M spreadsheet/tool export history (monthly snapshots), ConMon package archive, independent assessment reports (SAR), penetration test reports and remediation tracking, interconnection agreements (ISAs/MOUs), authorization/reauthorization decision memos, CA policy document.

**Deep-Dive Domain Analysis: Security Assessment And Authorization**

CA exists to convert the ongoing operational evidence generated by every other family into a formal, AO-facing risk decision — it is the family that closes the loop between "we are doing the maintenance" and "someone in authority has reviewed the evidence and accepted the residual risk" ([DCSA JSIG 2016](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf); CA-2/CA-5/CA-7 control statements, `CA.md`). The monthly POA&M/ConMon cycle (CA-5) and annual independent assessment (CA-2) are the two anchor cadences that make continuous ATO possible instead of relying on a static three-year reauthorization ([FedRAMP Continuous Monitoring Playbook](https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf)).

**Common failure modes when CA maintenance lapses:** the POA&M becomes a graveyard of stale, unprioritized findings that no one is actually working, which defeats its entire purpose as a risk-tracking tool and creates exactly the kind of audit finding ("known weaknesses tracked but not remediated") that damages ATO defensibility; the monthly ConMon package becomes a paperwork exercise disconnected from the actual state of RA-5 scans and CM-8 inventory it's supposed to summarize; and independent assessments (CA-2/CA-8) get treated as a one-time annual event rather than validating a continuously-operating program, so gaps discovered in March go unaddressed until next year's assessment surfaces them again.

**Cross-family dependencies:** CA is the aggregation point for almost every other family's evidence. CM feeds CA (CM-8 inventory is a direct ConMon input). RA feeds CA (RA-5 vulnerability scan results populate the POA&M). SI feeds CA (SI-2 patch status is a POA&M line item). AU feeds CA indirectly (audit review findings that indicate a control failure should generate a POA&M entry). PM depends on CA — the organization-level POA&M rollup (PM-4) is simply the CA-5 process aggregated across systems. Because CA sits downstream of so many other families, a lapse anywhere upstream (a skipped monthly scan, an unreviewed audit log) shows up as a gap in the CA deliverable, making CA a useful canary for detecting maintenance lapses elsewhere in the program.

**What sustainment looks like in practice:**
1. The ISSO's monthly ConMon assembly discovers that RA-5 vulnerability scan data is three weeks stale because the scanner license expired; rather than submitting an incomplete package, the ISSO flags the gap, expedites the license renewal, and documents the interim risk in the POA&M rather than silently omitting the scan data.
2. A finding from the annual independent assessment (CA-2) — that AC-6(1) privileged-function reviews were happening semiannually rather than the plan's quarterly commitment — is entered into the POA&M with a 30-day remediation date and closed out with evidence in the following month's ConMon package, rather than being noted and forgotten.
3. Between formal reauthorization cycles, the ISSM briefs the AO quarterly on the trend of open POA&M items and vulnerability aging, giving the AO a continuous risk picture (CA-6/CA-7) instead of a single point-in-time snapshot every three years.
4. Penetration testing (CA-8) findings are cross-walked against the master calendar in Section 4 to identify whether a finding represents a one-time gap or a systemic lapse in a specific family's daily/weekly maintenance — for example, a discovered stale account ties directly back to AC-2 daily checklist gaps rather than being treated as an isolated technical bug.

---
### 3.5 CM — Configuration Management

**Ongoing/operational controls:** CM-2 (Baseline Configuration — periodic review/update), CM-3 (Configuration Change Control — recurring CCB process), CM-4 (Security Impact Analysis — per-change recurring), CM-5 (Access Restrictions for Change — periodic, includes CM-5(5) quarterly privilege reevaluation), CM-6 (Configuration Settings — periodic compliance verification, e.g., STIG checks), CM-7 (Least Functionality — periodic review, CM-7(5) authorized software list), CM-8 (Information System Component Inventory — recurring update), CM-9 (Configuration Management Plan — periodic review), CM-10 (Software Usage Restrictions — periodic license review), CM-11 (User-Installed Software — periodic monitoring). **Initial-only:** CM-1 (policy, annual review cadence applies).

| Task | Frequency | Responsible Role | Control ID(s) | Source/justification |
|---|---|---|---|---|
| Review/update baseline configuration | At least annually and upon significant change | System Administrator, Network Administrator | CM-2 | [FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx), [FedRAMP High SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-High-FedRAMP-Security-Controls.docx), [IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf) |
| Update system component inventory | Continuously/automated preferred; Monthly minimum (FedRAMP) | System Administrator | CM-8 | [FedRAMP Continuous Monitoring Playbook](https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf), [NIST SP 800-40 Rev. 4](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-40r4.pdf), [IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf) (annual alternative) |
| Review authorized software list | At least quarterly or on change | CCB, System Administrator | CM-7(5) | [FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx), [FedRAMP High SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-High-FedRAMP-Security-Controls.docx), [IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf) (annual alternative) |
| Review unnecessary/nonsecure functions, ports, protocols, services | Annual | System Administrator, Network Administrator | CM-7(1) | [FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx) |
| Convene Configuration Control Board for proposed changes | Monthly when changes proposed (event-driven cadence) | CCB Chair (ISSM/SA) | CM-3 | [IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf) |
| Perform security impact analysis for each proposed change | Per-change (continuous/event-driven) | ISSO, System Administrator | CM-4 | Derived from CM-3 change-control cadence; no separate numeric cadence documented |
| Reassess/reevaluate privileged access tied to configuration change | At least quarterly | CCB, ISSO | CM-5(5) | [FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx) |
| Verify configuration settings against approved baseline/STIG | Aligned to SRG/STIG library update release cycle (no fixed interval published); recommend quarterly automated scan minimum | System Administrator, Network Administrator | CM-6 | [DoD Cyber Exchange SRG/STIG Library Compilations](https://public.cyber.mil/stigs/compilations/) |
| Retain configuration-controlled change records | Organization-defined (FedRAMP); 3 years (IRS) — recommend 3-year default pending JSIG verification | System Administrator | CM-3 | [IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf) |
| Review Configuration Management Plan | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual | ISSM | CM-9 | No documented cadence in research file; annual default aligned with -1 pattern |
| Review software usage/license compliance | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual | System Administrator | CM-10 | No documented cadence in research file |
| Monitor for unauthorized user-installed software | Continuous (automated) preferred, monthly manual review minimum | System Administrator | CM-11 | Derived by analogy to CM-8 monthly inventory cadence |
| Review/update configuration management policy | Annual | ISSM | CM-1 | [FedRAMP Continuous Monitoring Playbook](https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf) |

**Artifacts to retain:** baseline configuration documents with version history, component inventory exports (dated), authorized software/hardware lists, CCB meeting minutes and change tickets, security impact analysis records, privilege-reevaluation sign-offs, STIG/configuration-scan results, CM policy and CM plan documents.

**Deep-Dive Domain Analysis: Configuration Management**

CM exists to ensure the system's actual running state matches an approved, documented, and understood baseline at all times — every other control's effectiveness assumes the configuration underneath it hasn't silently drifted ([DCSA JSIG 2016](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf); CM-2/CM-3/CM-8 control statements, `CM.md`). NIST SP 800-40's guidance that inventory should be "constantly maintained" rather than checked monthly or quarterly reflects a broader shift in how CM is expected to operate: not as a periodic audit function but as a continuously-running control ([NIST SP 800-40 Rev. 4](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-40r4.pdf)).

**Common failure modes when CM maintenance lapses:** configuration drift — changes made informally outside the CCB process, often for legitimate operational reasons ("just this once") that never get formally reconciled back into the baseline, so the documented baseline diverges from reality until nobody can say with confidence what the system's actual attack surface is; inventory rot, where CM-8 asset/software inventory lags reality, meaning vulnerability scanning (RA-5) and patch management (SI-2) are working against a map that doesn't match the territory; and authorized-software list (CM-7(5)) staleness, which either blocks legitimate new tools (driving users to workarounds) or, more dangerously, fails to flag unauthorized software that has been quietly added.

**Cross-family dependencies:** CM is one of the two central hub families in this plan (alongside AU). CM feeds AU — every approved change should generate an audit trail, and every audit anomaly should be checked against the CM change log to see if it corresponds to an approved change. CM feeds RA and SI — vulnerability scanning and patch management are only meaningful against an accurate CM-8 inventory; scanning an incomplete inventory produces false confidence. CM feeds AC — CM-5(5) privileged-access reevaluation for configuration change is explicitly aligned to the same quarterly cadence as AC-6 least-privilege review, because configuration-change privilege and standing access privilege are the same underlying risk viewed from two angles. CM feeds CA — CM-8 inventory is a direct monthly ConMon input. CM depends on SA — SA-22 unsupported-component tracking flags end-of-life software that CM-7 authorized-software review must then formally retire.

**What sustainment looks like in practice:**
1. A daily configuration-drift check (Section 1A.3) catches that a firewall rule was modified outside the CCB process during an after-hours emergency fix; the change is retroactively documented and ratified by the CCB the next business day rather than silently becoming permanent undocumented drift.
2. The monthly CM-8 inventory reconciliation surfaces three servers that were decommissioned two months ago but never removed from the authorized inventory — closing a gap that would otherwise let a decommissioned, unpatched system remain a silent vulnerability.
3. The quarterly CM-7(5) authorized-software review identifies a legitimate but previously-unapproved diagnostic tool that several administrators have been using; rather than a punitive removal, the CCB formally evaluates and either approves or replaces it, closing the CM-11 unauthorized-software gap without disrupting operations.
4. During the Phase 1 baseline stand-up (Section 5), the System Administrator documents the CM-2 baseline configuration before any AU-6 or RA-5 cadence begins, because — as the getting-started sequencing notes — starting audit or vulnerability review against an undocumented baseline produces noisy, low-value findings.

---

### 3.6 CP — Contingency Planning

**Ongoing/operational controls:** CP-2 (Contingency Plan — periodic review/update), CP-3 (Contingency Training — initial + periodic), CP-4 (Contingency Plan Testing — periodic exercises), CP-6 (Alternate Storage Site — periodic verification), CP-7 (Alternate Processing Site — periodic verification), CP-8 (Telecommunications Services — periodic verification), CP-9 (Information System Backup — the core recurring backup task), CP-10 (Information System Recovery and Reconstitution — periodic testing), CP-11 (Alternate Communications Protocols — periodic review), CP-12/CP-13 (Safe Mode/Alternative Security Mechanisms — periodic review). **Withdrawn:** CP-5 (→ CP-2). **Initial-only:** CP-1 (policy).

| Task | Frequency | Responsible Role | Control ID(s) | Source/justification |
|---|---|---|---|---|
| Review/update contingency plan | At least annually | ISSM | CP-2 | [FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx), [GSA Contingency Planning Guide](https://www.gsa.gov/system/files/Contingency-Planning-(CP)-%5BCIO-IT-Security-06-29-Rev-7%5D.pdf), [NIST SP 800-34 Rev. 1](https://nvlpubs.nist.gov/nistpubs/legacy/sp/nistspecialpublication800-34r1.pdf) |
| Deliver contingency training | Within 10 days (privileged) / 60 days (newly hired critical personnel) initially; annually thereafter | Training Manager | CP-3 | [FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx), [GSA Contingency Planning Guide](https://www.gsa.gov/system/files/Contingency-Planning-(CP)-%5BCIO-IT-Security-06-29-Rev-7%5D.pdf) |
| Test/exercise contingency plan | At least annually | ISSM, System Administrator | CP-4 | [FedRAMP Continuous Monitoring Playbook](https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf), [GSA Contingency Planning Guide](https://www.gsa.gov/system/files/Contingency-Planning-(CP)-%5BCIO-IT-Security-06-29-Rev-7%5D.pdf), [IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf) |
| Perform information system backups | Daily incremental / weekly full (FedRAMP); weekly (IRS); RTO/RPO-driven per BIA | System Administrator | CP-9 | [FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx), [FedRAMP High SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-High-FedRAMP-Security-Controls.docx), [IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf), [NIST SP 800-34 Rev. 1](https://nvlpubs.nist.gov/nistpubs/legacy/sp/nistspecialpublication800-34r1.pdf) |
| Test backup integrity/restoration | At least monthly (FedRAMP High) / annually (FedRAMP Moderate, GSA) — recommend monthly as SAP default | System Administrator | CP-9(1) | [FedRAMP High SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-High-FedRAMP-Security-Controls.docx), [FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx), [GSA Contingency Planning Guide](https://www.gsa.gov/system/files/Contingency-Planning-(CP)-%5BCIO-IT-Security-06-29-Rev-7%5D.pdf) |
| Verify alternate storage/processing site readiness | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual, aligned with CP-4 test | ISSM, System Administrator | CP-6, CP-7 | No documented cadence in research file; annual default aligned with CP-4 pattern |
| Verify alternate telecommunications service availability | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual | Network Administrator | CP-8 | No documented cadence in research file |
| Test information system recovery/reconstitution procedures | Annual (aligned with CP-4 exercise) | System Administrator | CP-10 | [FedRAMP Continuous Monitoring Playbook](https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf) annual test pattern applied by analogy |
| Review/update contingency planning policy | Annual | ISSM | CP-1 | [FedRAMP Continuous Monitoring Playbook](https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf) |

**Artifacts to retain:** contingency plan document with revision history, training rosters, test/exercise after-action reports, backup logs/success-failure reports, backup restoration test results, alternate-site verification reports, recovery/reconstitution test results, CP policy document.

**Deep-Dive Domain Analysis: Contingency Planning**

CP exists to ensure the mission survives a disruption — not by preventing every failure (that is the job of SC, SI, and PE), but by guaranteeing that when a failure happens anyway, data and services can be recovered within an acceptable time and data-loss window ([DCSA JSIG 2016](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf); CP-2/CP-9/CP-4 control statements, `CP.md`). The backup cadence (CP-9) and the annual test/exercise cadence (CP-4) are only meaningful together — a backup that has never been test-restored is a hypothesis, not a capability ([GSA Contingency Planning Guide](https://www.gsa.gov/system/files/Contingency-Planning-(CP)-%5BCIO-IT-Security-06-29-Rev-7%5D.pdf); [NIST SP 800-34 Rev. 1](https://nvlpubs.nist.gov/nistpubs/legacy/sp/nistspecialpublication800-34r1.pdf)).

**Common failure modes when CP maintenance lapses:** backups that run successfully by every automated job-status metric but cannot actually be restored, because no one has performed a CP-9(1) restoration test since the backup software was last upgraded; a contingency plan that accurately described the system architecture a year ago but is now silently obsolete after several CM-2 baseline changes, so the recovery procedures reference systems, IP ranges, or vendors that no longer exist; and alternate site/telecom readiness (CP-6/CP-7/CP-8) that is documented on paper but never actually exercised, so a failover attempt during a real disruption discovers the alternate site was never actually provisioned to current capacity.

**Cross-family dependencies:** CP depends heavily on CM — the contingency plan's accuracy is only as good as the baseline configuration it describes, so a CM-2 baseline update should trigger a CP-2 plan review rather than the two drifting apart on separate calendars. CP depends on AT for CP-3 contingency training, which is a specialized training track parallel to AT-2/AT-3. CP feeds IR — a disruption event often starts as, or converts into, a security incident, and CP-10 recovery/reconstitution procedures frequently run in parallel with IR-4 incident handling. CP depends on PE for alternate-site physical readiness (PE controls apply at the alternate site just as they do at the primary facility).

**What sustainment looks like in practice:**
1. The monthly CP-9(1) backup-restoration test (the SAP default recommended over the FedRAMP Moderate annual minimum, given the sensitivity of SAP data) restores a sample dataset to an isolated environment and confirms both data integrity and that the restoration runbook is current — catching a stale runbook reference to a decommissioned storage array before an actual emergency would.
2. The annual CP-4 tabletop exercise deliberately scripts a scenario involving simultaneous loss of the primary ISSO and lead SysAdmin, testing whether the plan's designated alternates actually know their responsibilities, not just whether the technical failover works.
3. A CM-2 baseline change (a new storage backend) automatically triggers a CP-2 contingency-plan review within 30 days rather than waiting for the next scheduled annual review, keeping the plan synchronized with the environment it protects.
4. After a real (non-exercise) service disruption, the CP-10 recovery/reconstitution actually taken are compared against the documented plan in the post-event review, and any deviation becomes a plan-update item rather than an unrecorded lesson learned.

---

### 3.7 IA — Identification And Authentication

**Ongoing/operational controls:** IA-2 (Identification and Authentication — Org Users — continuous enforcement), IA-3 (Device Identification and Authentication — periodic verification), IA-4 (Identifier Management — ongoing issuance/reuse control), IA-5 (Authenticator Management — the core recurring credential-refresh task), IA-6 (Authenticator Feedback — periodic verification), IA-7 (Cryptographic Module Authentication — periodic verification), IA-8 (Identification/Authentication — Non-Org Users — periodic review), IA-9 (Service Identification and Authentication — periodic review), IA-10 (Adaptive Identification and Authentication — periodic review), IA-11 (Re-authentication — continuous session enforcement). **Initial-only:** IA-1 (policy).

| Task | Frequency | Responsible Role | Control ID(s) | Source/justification |
|---|---|---|---|---|
| Refresh/rotate user authenticators (passwords/tokens) | Every 90 days (IRS user example); organization-defined in FedRAMP — recommend 90-day SAP default pending JSIG ODP verification | System Administrator | IA-5 | [IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf), [FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx) |
| Refresh/rotate service-account authenticators | Every 366 days (IRS example) | System Administrator | IA-5 | [IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf) |
| Prevent identifier reuse | ≥2 years | System Administrator | IA-4 | [FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx), [FedRAMP High SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-High-FedRAMP-Security-Controls.docx) |
| Enforce reauthentication / session timeout | AAL2: 12 hrs or 30 min inactivity (Moderate); AAL3: 12 hrs or 15 min inactivity (High) — continuous enforcement, config verified quarterly | System Administrator | IA-11 | [FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx), [FedRAMP High SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-High-FedRAMP-Security-Controls.docx) |
| Verify device identification/authentication configuration | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: quarterly | Network Administrator | IA-3 | No documented cadence in research file |
| Review non-organizational user / service / adaptive authentication configurations | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual | ISSO | IA-8, IA-9, IA-10 | No documented cadence in research file |
| Review cryptographic module authentication configuration | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual, aligned with SC-13/SC-28 crypto review | System Administrator | IA-7 | No documented cadence in research file |
| Review/update identification and authentication policy | Annual | ISSM | IA-1 | [FedRAMP Continuous Monitoring Playbook](https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf) |

**Artifacts to retain:** authenticator issuance/rotation logs, identifier reuse tracking register, session-timeout configuration verification records, device authentication configuration records, IA policy document.

**Deep-Dive Domain Analysis: Identification And Authentication**

IA exists to establish, with assurance appropriate to the system's sensitivity, that a claimed identity is genuine before any access decision is made — it is the foundation every AC enforcement decision rests on, since access control is meaningless if the subject's identity cannot be trusted ([DCSA JSIG 2016](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf); IA-2/IA-5/IA-11 control statements, `IA.md`).

**Common failure modes when IA maintenance lapses:** authenticator rotation (IA-5) that is technically enforced by policy but not actually verified, so accounts quietly persist on stale credentials past the 90-day (user) or 366-day (service account) rotation window used as the SAP default; identifier reuse (IA-4) that violates the ≥2-year non-reuse window, creating confusion in audit trails when a new user is issued an identifier that partially overlaps with a former user's historical logs; and reauthentication/session-timeout (IA-11) settings that get silently reset to vendor defaults after a platform upgrade, extending session lifetimes beyond the AAL2/AAL3 policy without anyone noticing until an audit catches it.

**Cross-family dependencies:** IA is a foundational dependency for AC — every AC-3 access-enforcement decision assumes IA has already correctly identified and authenticated the subject. IA feeds AU — authentication events (successful and failed) are core auditable events under AU-2. IA depends on PS for identity provenance — an authenticator should never be issued to an identity that hasn't cleared PS-2/PS-3 screening. IA feeds SC — cryptographic authenticators (IA-5 with PKI-based credentials) depend on SC-12/SC-13 key management remaining sound.

**What sustainment looks like in practice:**
1. The daily access/identity checklist confirms reauthentication enforcement is active; a platform patch that silently reset session-timeout to a vendor default of 8 hours (instead of the configured AAL2 12-hour/30-minute-inactivity policy) is caught and corrected the same day rather than persisting until a quarterly configuration review.
2. The authenticator-rotation tracking system flags a batch of service accounts approaching their 366-day rotation deadline two weeks early, giving the System Administrator time to coordinate rotation without a service outage.
3. During the AC-2 termination workflow, the System Administrator confirms the departing user's identifier is formally retired and placed under the IA-4 non-reuse hold, rather than simply disabling the account and leaving the identifier available for accidental reissuance.
4. An IA-3 device-authentication configuration review (recommended quarterly, pending JSIG ODP verification) discovers several IoT/peripheral devices authenticating with shared, unrotated credentials — a finding that becomes a POA&M item rather than a permanent architectural blind spot.

---

### 3.8 IR — Incident Response

**Ongoing/operational controls:** IR-2 (Incident Response Training — initial + annual), IR-3 (Incident Response Testing — periodic exercises), IR-4 (Incident Handling — continuous/per-event), IR-5 (Incident Monitoring — continuous), IR-6 (Incident Reporting — per-event with defined timelines), IR-7 (Incident Response Assistance — continuous availability), IR-8 (Incident Response Plan — periodic review), IR-9 (Information Spillage Response — per-event), IR-10 (Integrated Information Security Analysis Team — ongoing operation). **Initial-only:** IR-1 (policy).

| Task | Frequency | Responsible Role | Control ID(s) | Source/justification |
|---|---|---|---|---|
| Deliver incident response training | Within 10 days (privileged users) / 30 days (IR roles) initially; annually thereafter | Training Manager | IR-2 | [FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx), [FedRAMP High SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-High-FedRAMP-Security-Controls.docx), [IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf) |
| Test/exercise incident response capability | At least annually (functional, FedRAMP Moderate/IRS tabletop); at least every 6 months incl. annual functional test (FedRAMP High) — recommend semiannual as SAP default | IR Team Lead | IR-3 | [FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx), [FedRAMP High SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-High-FedRAMP-Security-Controls.docx), [IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf) |
| Monitor for and handle incidents | Continuous (24/7 monitoring recommended) | IR Team Lead / CND Team | IR-4, IR-5 | [NIST SP 800-61 Rev. 2](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-61r2.pdf) 24/7 monitoring/staffing recommendation |
| Report incidents to designated authority (US-CERT/IRS-TIGTA analog/DoD chain) | Per-event, within 24 hours of discovery (IRS example) | IR Team Lead, ISSM | IR-6 | [IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf), [FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx) |
| Provide daily incident status updates after initial notification | Daily during active incident | IR Team Lead | IR-6 | [FedRAMP Continuous Monitoring Playbook](https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf) |
| Conduct post-incident lessons-learned review | Within several days of major-incident closure; periodically for lesser incidents | IR Team Lead, ISSM | IR-4 (post-incident) | [NIST SP 800-61 Rev. 2](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-61r2.pdf) |
| Review/update incident response plan | At least annually | ISSM | IR-8 | [FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx), [NIST SP 800-61 Rev. 2](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-61r2.pdf) |
| Retain incident records | 3 years after follow-up actions completed (NIST GRS 24 citation) | ISSM, System Administrator | IR/AU retention | [NIST SP 800-61 Rev. 2](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-61r2.pdf) |
| Exercise information spillage response procedures | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual, aligned with IR-3 test | IR Team Lead | IR-9 | No documented cadence in research file |
| Review/update incident response policy | Annual | ISSM | IR-1 | [FedRAMP Continuous Monitoring Playbook](https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf) |

**Artifacts to retain:** training rosters, IR test/exercise after-action reports, incident tickets/logs with timeline and reporting timestamps, notification records to external authorities, lessons-learned reports, IR plan with revision history, IR policy document.

**Deep-Dive Domain Analysis: Incident Response**

IR exists to ensure that when prevention and detection controls fail — as they eventually will — the organization can contain, eradicate, and recover from the resulting event faster than the event can cause damage, and can learn from it afterward so the same failure mode doesn't recur ([DCSA JSIG 2016](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf); IR-4/IR-5/IR-8 control statements, `IR.md`). NIST SP 800-61's recommendation of 24/7 monitoring/staffing availability reflects that incidents do not wait for business hours ([NIST SP 800-61 Rev. 2](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-61r2.pdf)).

**Common failure modes when IR maintenance lapses:** an incident response plan (IR-8) that exists on paper but was never actually exercised against a realistic scenario, so the first real incident becomes the first real test — usually at the worst possible time; reporting timelines (IR-6) that get missed not because of malice but because no one owns the notification checklist, turning a technical incident into a compliance incident as well; and IR training (IR-2) that lapses for the specific personnel who would actually be paged during a 2 a.m. incident, meaning the people with the plan memorized are asleep and the people awake don't know the plan.

**Cross-family dependencies:** IR is fed by nearly every detection-oriented family. SI feeds IR directly — SI-4 monitoring and SI-3 malware detections are the most common trigger for an IR-4 incident declaration. AU feeds IR — audit anomalies caught in AU-6 review frequently escalate into IR investigations. AC feeds IR — anomalous access patterns (caught in the daily access checklist) are a common incident precursor. CP and IR run in parallel during major events — CP-10 recovery/reconstitution and IR-4 incident handling are often executed by overlapping teams simultaneously. PS feeds IR for insider-threat scenarios — PS-8 sanctions and IR-4 handling intersect when an incident has a personnel-security dimension.

**What sustainment looks like in practice:**
1. The daily audit/monitoring checklist item on active incidents catches that a declared incident from two days ago is missing its required daily status update; the IR Team Lead is paged to close the compliance gap before it becomes a reporting-timeline violation.
2. The semiannual IR-3 tabletop exercise (the SAP default, stricter than FedRAMP Moderate's annual minimum) simulates a scenario where the primary incident-reporting contact is unreachable, testing the plan's designated backup notification chain rather than just the primary path.
3. A malware detection pattern surfaced by the daily malware/endpoint checklist (repeated detections across multiple hosts) is escalated from a routine SI-3 quarantine event into a formally declared IR-4 incident, triggering the IR-6 reporting clock rather than being closed as a routine antivirus log entry.
4. The post-incident lessons-learned review (conducted within days of a major incident's closure, per NIST SP 800-61 practice) identifies that the incident was detectable three days earlier in AU-6 weekly review data that wasn't escalated; the finding drives a change to the AU-6 escalation criteria rather than being filed away.

---

### 3.9 MA — Maintenance

**Ongoing/operational controls:** MA-2 (Controlled Maintenance — per-event scheduling/documentation), MA-3 (Maintenance Tools — periodic review), MA-4 (Nonlocal Maintenance — continuous/risk-based monitoring), MA-5 (Maintenance Personnel — periodic authorization review), MA-6 (Timely Maintenance — per-event). **Initial-only:** MA-1 (policy).

| Task | Frequency | Responsible Role | Control ID(s) | Source/justification |
|---|---|---|---|---|
| Schedule, document, and close controlled maintenance actions with defined start/end timeframes | Per-event (continuous operational cadence) | System Administrator | MA-2, MA-6, CM-3, SI-2 | [NIST SP 800-40 Rev. 4](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-40r4.pdf) |
| Review list of approved maintenance tools | At least annually | System Administrator, ISSM | MA-3 | [FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx), [FedRAMP High SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-High-FedRAMP-Security-Controls.docx), [IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf) |
| Monitor nonlocal maintenance session records | Risk-based; more frequent when risk assessment identifies concerns; no numeric baseline documented — recommend ODP per JSIG tailoring; suggested default: monthly review | System Administrator | MA-4, CA-7 | [NIST SP 800-137](https://nvlpubs.nist.gov/nistpubs/legacy/sp/nistspecialpublication800-137.pdf) |
| Review maintenance personnel authorization list | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual, aligned with MA-3 tool review | ISSM | MA-5 | No documented cadence in research file; annual default aligned with MA-3 |
| Review/update maintenance policy | Annual | ISSM | MA-1 | [FedRAMP Continuous Monitoring Playbook](https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf) |

**Artifacts to retain:** maintenance tickets/work orders with start/end timestamps, approved maintenance tool inventory and review sign-offs, nonlocal maintenance session logs, maintenance personnel authorization list, MA policy document.

**Deep-Dive Domain Analysis: Maintenance**

MA exists to ensure that the physical and logical maintenance activity necessary to keep the system running does not itself become an uncontrolled backdoor — maintenance access is powerful (it often bypasses normal operational controls by design) and therefore needs its own layer of control, documentation, and oversight ([DCSA JSIG 2016](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf); MA-2/MA-3/MA-4 control statements, `MA.md`). The research file explicitly flags that no public JSIG source specifies a fixed periodic MA-2 cadence, making MA one of the clearer examples in this plan of a control family that is inherently event-driven rather than calendar-driven ([research file](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)).

**Common failure modes when MA maintenance lapses:** maintenance tools (MA-3) that were approved for a specific engagement and never formally retired, remaining available for use long after the justification for their access expired; nonlocal/remote maintenance sessions (MA-4) that are technically logged but never actually reviewed, so a compromised vendor remote-access credential could be used repeatedly without detection; and maintenance personnel authorization lists (MA-5) that lag actual vendor/contractor staffing changes, so a departed maintenance technician's access credential remains valid.

**Cross-family dependencies:** MA feeds CM directly — every controlled maintenance action (MA-2) should be tracked through the same change-control discipline as CM-3, and a maintenance action that alters system configuration should update the CM-2 baseline. MA depends on AC — maintenance personnel access is a specialized case of AC-2 account management, often with elevated but time-boxed privilege. MA feeds AU — maintenance session logs are audit-relevant records that should be reviewable alongside standard AU-6 review, particularly for nonlocal maintenance. MA depends on PS — third-party maintenance personnel security compliance overlaps with PS-7.

**What sustainment looks like in practice:**
1. The annual MA-3 approved-maintenance-tools review discovers a diagnostic utility installed two years ago for a since-completed migration project still has standing access; it is formally retired and removed rather than left "just in case."
2. A nonlocal maintenance session from a vendor is reviewed the same week (rather than left for an annual audit) and found to originate from an unexpected IP range; the vendor's access is suspended pending verification, closing an MA-4 risk-based monitoring gap before it becomes an incident.
3. Every controlled maintenance ticket (MA-2/MA-6) is closed with a documented start/end time and, where the maintenance touched configuration, a corresponding CM-3 change ticket — so an auditor reviewing either MA or CM records finds a consistent, cross-referenced trail rather than two disconnected logs.
4. The MA-5 maintenance-personnel authorization list is reconciled against current vendor contract staffing rosters annually (aligned to the MA-3 review), catching and revoking access for a technician who rotated off the contract eight months earlier.


**Gap note carried from research file:** no public JSIG source specifies a fixed periodic MA-2 controlled-maintenance cadence; maintenance events should be scheduled/approved/documented/closed per ticket, anchored to the documented annual MA-3 review and risk-based MA-4 monitoring ([research file](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)).

---

### 3.10 MP — Media Protection

**Ongoing/operational controls:** MP-2 (Media Access — periodic review), MP-3 (Media Marking — per-event/periodic spot-check), MP-4 (Media Storage — periodic verification), MP-5 (Media Transport — per-event), MP-6 (Media Sanitization — per-event/periodic verification of procedures), MP-7 (Media Use — periodic review of restrictions). **Initial-only:** MP-1 (policy), MP-8 (Media Downgrading — if applicable, per-event).

| Task | Frequency | Responsible Role | Control ID(s) | Source/justification |
|---|---|---|---|---|
| Review media access authorization list | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: quarterly, aligned with account review cadence | ISSO | MP-2 | No documented cadence in research file |
| Verify media marking compliance | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: quarterly spot-check | System Administrator | MP-3 | No documented cadence in research file |
| Verify media storage physical/environmental controls | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: monthly, aligned with PE-6 physical log review | Facility Security Officer | MP-4 | No documented cadence in research file; monthly default aligned with PE pattern |
| Verify media transport controls/chain-of-custody | Per-event (continuous operational cadence) | System Administrator, Personnel Security | MP-5 | No documented cadence in research file; inherently event-driven |
| Sanitize/destroy media per approved procedures | Per-event, at end-of-life or reuse | System Administrator | MP-6 | No documented cadence in research file; inherently event-driven |
| Review approved media-use restrictions and devices | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual | ISSO | MP-7 | No documented cadence in research file |
| Review/update media protection policy | Annual | ISSM | MP-1 | [FedRAMP Continuous Monitoring Playbook](https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf) |

**Artifacts to retain:** media access authorization list, marking/labeling spot-check records, storage facility inspection logs, transport/chain-of-custody logs, sanitization/destruction certificates, approved media-use device list, MP policy document.

**Deep-Dive Domain Analysis: Media Protection**

MP exists to ensure that information doesn't leak through the physical/logical media that carries it once it leaves the direct protection of the access-controlled system — a perfectly access-controlled database is still vulnerable if its backup tape or removable drive walks out the door unprotected ([DCSA JSIG 2016](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf); MP-2/MP-5/MP-6 control statements, `MP.md`).

**Common failure modes when MP maintenance lapses:** media marking (MP-3) that is enforced rigorously at creation but never spot-checked afterward, so mislabeled or unlabeled sensitive media accumulates undetected; sanitization/destruction procedures (MP-6) that are documented but not actually verified against the equipment currently in use, so a decommissioned drive is "wiped" using a method inadequate for its classification level; and media access authorization lists (MP-2) that drift out of sync with the current AC-2 account population, allowing someone whose system access was revoked to retain physical media access.

**Cross-family dependencies:** MP depends on AC — media access authorization should track the same population and cadence as AC-2 account review, since the two are really the same access decision applied to different resource types. MP depends on PE — media storage physical/environmental controls (MP-4) are enforced through PE facility controls, and a PE-6 physical-access-log gap is also an MP-4 gap for any media stored in that space. MP feeds SC — encryption of data at rest (SC-28) is a complementary control to media protection; encrypted media that is lost is a materially lower-severity event than unencrypted media, which should inform how MP-5 transport risk is assessed.

**What sustainment looks like in practice:**
1. A quarterly MP-3 marking spot-check finds several external drives in active use without proper classification labels; the drives are pulled, remarked, and the finding is used to refresh handling-procedure training rather than treated as an isolated clerical slip.
2. A media sanitization event (MP-6) for decommissioned SAP-relevant storage is performed using the currently-approved method for the media's classification level, verified against updated NIST/CNSS sanitization guidance rather than a procedure last reviewed years earlier.
3. The quarterly MP-2 media-access-authorization review (aligned to the AC-2 account-review cadence) removes access for two individuals whose broader system accounts were already disabled the prior month, closing a gap where the physical/media authorization list lagged the logical account state.
4. A chain-of-custody log for a piece of media transported between facilities (MP-5) is reconciled against the PE visitor/access logs for both locations, confirming an unbroken custody trail.

---
### 3.11 PE — Physical And Environmental Protection

**Ongoing/operational controls:** PE-2 (Physical Access Authorizations — periodic list review), PE-3 (Physical Access Control — periodic device inventory/key changes), PE-4 (Access Control for Transmission Medium — periodic verification), PE-5 (Access Control for Output Devices — periodic verification), PE-6 (Monitoring Physical Access — recurring log review), PE-8 (Visitor Access Records — recurring log review), PE-9 through PE-6/18 (Power/Cooling/Fire/Water/Emanations — periodic inspection/testing per equipment maintenance schedule), PE-13 (Fire Protection — periodic testing), PE-14 (Temperature/Humidity Controls — continuous monitoring), PE-15 (Water Damage Protection — periodic inspection), PE-16 (Delivery/Removal — per-event), PE-17 (Alternate Work Site — periodic verification), PE-19 (Information Leakage — periodic TEMPEST-related verification), PE-20 (Asset Monitoring/Tracking — continuous). **Withdrawn:** PE-7 (→ PE-2/PE-3). **Initial-only:** PE-1 (policy).

| Task | Frequency | Responsible Role | Control ID(s) | Source/justification |
|---|---|---|---|---|
| Review facility/physical access authorization list | Every 90 days (FedRAMP High); annually (FedRAMP Moderate/IRS) — recommend 90-day SAP default given SCIF-equivalent sensitivity, pending JSIG ODP verification | Facility Security Officer | PE-2 | [FedRAMP High SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-High-FedRAMP-Security-Controls.docx), [FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx), [IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf) |
| Review Authorized Access List for restricted/SAPF areas | Monthly or upon security/personnel event | Facility Security Officer | PE-2, PE-3 | [IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf) |
| Inventory physical access devices (badges, keys, tokens) | Annually / every 12 months | Facility Security Officer | PE-3 | [FedRAMP High SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-High-FedRAMP-Security-Controls.docx), [IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf) |
| Change combinations/keys | At least annually, or immediately upon loss/compromise/transfer/termination | Facility Security Officer | PE-3 | [FedRAMP High SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-High-FedRAMP-Security-Controls.docx), [IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf) |
| Review physical access logs | At least monthly | Facility Security Officer | PE-6 | [FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx), [IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf) |
| Review visitor access records | Monthly review; retain 1 year (FedRAMP) or 5 years (IRS) | Facility Security Officer | PE-8 | [FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx), [IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf) |
| Test fire detection/suppression systems | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual, aligned with facility code inspection cycles | Facility Security Officer | PE-13 | No documented cadence in research file |
| Monitor temperature/humidity controls | Continuous (automated sensors) | Facility Security Officer / System Administrator | PE-14 | No documented cadence in research file; continuous default given environmental sensitivity |
| Inspect for water damage risk (pipes, drainage) | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual | Facility Security Officer | PE-15 | No documented cadence in research file |
| Verify transmission medium and output device access controls | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: quarterly | System Administrator | PE-4, PE-5 | No documented cadence in research file |
| Verify TEMPEST/information-leakage countermeasures | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual, per JSIG SAP-specific requirement — high-priority manual verification item | Facility Security Officer, ISSM | PE-19 | No documented cadence in research file; flagged as JSIG-SAP-specific item needing primary-source verification |
| Review/update physical and environmental protection policy | Annual | ISSM | PE-1 | [FedRAMP Continuous Monitoring Playbook](https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf) |

**Artifacts to retain:** facility access list review sign-offs, physical/visitor access logs (with retention per schedule above), physical access device inventory records, key/combination change logs, fire/environmental system test reports, TEMPEST/emanation security assessment records, PE policy document.

**Deep-Dive Domain Analysis: Physical And Environmental Protection**

PE exists to protect the system's physical substrate — the hardware, facility, and environment that every logical control ultimately depends on — because no amount of access control or encryption matters if an adversary can simply walk up to unattended hardware or if the facility's environment destroys the equipment outright ([DCSA JSIG 2016](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf); PE-2/PE-3/PE-6 control statements, `PE.md`). In a SAP context, PE carries additional weight because physical security is often the primary control boundary (a SAPF/SCIF-equivalent space), and PE-19 TEMPEST/information-leakage countermeasures are flagged in this plan as a SAP-specific high-priority manual-verification item precisely because generic Federal cadence sources don't cover it ([research file](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)).

**Common failure modes when PE maintenance lapses:** physical access lists (PE-2) that are reviewed on paper annually but never reconciled against actual badge-system logs, so a person who transferred departments six months ago still has facility access; visitor logs (PE-8) that are collected but never reviewed, missing patterns like the same "visitor" entering unusually often without an escort explanation; and environmental monitoring (PE-14) that has automated sensors but no one is watching the dashboard, so a slow HVAC failure isn't caught until equipment starts failing.

**Cross-family dependencies:** PE feeds AU — physical/visitor access logs are audit-adjacent records reviewed on a parallel monthly cadence to AU-6. PE feeds MP — media storage environmental and access controls are enforced through the same facility infrastructure. PE feeds CP — alternate site readiness (CP-6/CP-7) requires the alternate site to meet the same PE standards as the primary facility. PE depends on PS — physical access authorization should be revoked in lockstep with PS-4/PS-5 termination/transfer actions, the same dependency pattern as AC-2.

**What sustainment looks like in practice:**
1. The monthly PE-6 physical-access-log review cross-references badge entries against the current PE-2 authorized-access list and finds a badge still active for someone who transferred to a different program eight weeks ago; access is revoked same-day rather than waiting for the next annual PE-2 review cycle.
2. The daily environmental-monitoring spot-check (Section 1A.6) catches a gradual temperature rise in a server room hours before it would trip an automated shutdown, giving facilities staff time to address an HVAC issue proactively.
3. The annual PE-3 physical-access-device inventory and key/combination change cycle is executed on schedule, and an out-of-cycle combination change is also triggered immediately after a facility-badge loss report, demonstrating the event-driven exception path working alongside the calendar-driven baseline.
4. The high-priority PE-19 TEMPEST/emanation-security countermeasure verification, flagged as needing primary-source JSIG confirmation, is escalated to the ISSM for manual verification against the JSIG body text rather than left indefinitely as a placeholder annual default.

---

### 3.12 PL — Planning

**Ongoing/operational controls:** PL-2 (System Security Plan — periodic review/update), PL-4 (Rules of Behavior — periodic review/re-acknowledgment), PL-7 (Security Concept of Operations — periodic review), PL-8 (Information Security Architecture — periodic review), PL-9 (Central Management — continuous, if applicable). **Withdrawn:** PL-3, PL-5, PL-6. **Initial-only:** PL-1 (policy).

| Task | Frequency | Responsible Role | Control ID(s) | Source/justification |
|---|---|---|---|---|
| Review/update System Security Plan (SSP) | At least annually and upon significant change | ISSM | PL-2 | [FedRAMP Continuous Monitoring Playbook](https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf) annual documentation-review pattern applied by analogy |
| Review and re-obtain signed acknowledgment of Rules of Behavior | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual, aligned with training refresh | ISSO, Training Manager | PL-4 | No documented cadence in research file; annual default aligned with AT-2 refresh cycle |
| Review Security Concept of Operations (CONOPS) | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual | ISSM | PL-7 | No documented cadence in research file |
| Review Information Security Architecture | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual, or upon major system change | ISSM, Network Administrator | PL-8 | No documented cadence in research file |
| Verify central management configuration (if implemented) | Continuous (automated); config verified quarterly | System Administrator | PL-9 | No documented cadence in research file |
| Review/update planning policy | Annual | ISSM | PL-1 | [FedRAMP Continuous Monitoring Playbook](https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf) |

**Artifacts to retain:** SSP with version history and change log, signed Rules of Behavior acknowledgments, CONOPS document, security architecture diagrams/documentation, PL policy document.

**Deep-Dive Domain Analysis: Planning**

PL exists to keep the system's foundational governing documents — the System Security Plan, Rules of Behavior, security architecture, and CONOPS — synchronized with the system as it actually operates, so that every other family's maintenance activity is executed against an accurate description of the system rather than a stale snapshot from initial authorization ([DCSA JSIG 2016](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf); PL-2/PL-4/PL-8 control statements, `PL.md`).

**Common failure modes when PL maintenance lapses:** the SSP (PL-2) describes an architecture that has since been superseded by several CM-2 baseline changes, so an assessor (or an incident responder) working from the SSP is working from fiction; Rules of Behavior (PL-4) that users signed once at onboarding and never re-acknowledged, so behavioral expectations go stale as the system and its risks evolve; and security architecture documentation (PL-8) that lags actual network topology, undermining the accuracy of every downstream risk assessment (RA-3) that assumes the architecture diagram is current.

**Cross-family dependencies:** PL depends on CM — every significant CM-2 baseline change should trigger a PL-2 SSP review, the same "keep the description synchronized with reality" dependency seen between CM and CP. PL feeds RA — an accurate PL-8 security architecture is a prerequisite for a meaningful RA-3 risk assessment. PL depends on AT — PL-4 Rules of Behavior re-acknowledgment is typically bundled with the annual AT-2 training refresh cycle for operational efficiency and to reinforce the connection between behavioral expectations and security awareness.

**What sustainment looks like in practice:**
1. A significant architecture change (e.g., a new cloud storage integration) approved through the CM-3 change-control process automatically triggers a targeted PL-2 SSP update for the affected sections, rather than waiting for the next scheduled annual review to catch up on months of accumulated changes.
2. The annual PL-4 Rules of Behavior re-acknowledgment, bundled with AT-2 refresher training, updates the document's language to reflect a new remote-access policy adopted mid-year, ensuring users acknowledge current rather than outdated expectations.
3. The PL-8 security architecture documentation is validated against the actual network topology during the Phase 5 independent assessment prep, and a discrepancy discovered there (an undocumented network segment) is corrected before the assessor finds it independently.
4. The Configuration Management Plan (CM-9) and SSP (PL-2) are reviewed together during the annual cycle rather than on separate uncoordinated calendars, since the two documents describe overlapping aspects of the same system and are prone to drifting into contradiction if reviewed independently.

---

### 3.13 PS — Personnel Security

**Ongoing/operational controls:** PS-2 (Position Risk Designation — periodic review), PS-3 (Personnel Screening — periodic reinvestigation), PS-4 (Personnel Termination — per-event), PS-5 (Personnel Transfer — per-event), PS-6 (Access Agreements — periodic review/re-signature), PS-7 (Third-Party Personnel Security — periodic review), PS-8 (Personnel Sanctions — per-event). **Initial-only:** PS-1 (policy).

| Task | Frequency | Responsible Role | Control ID(s) | Source/justification |
|---|---|---|---|---|
| Review position risk designations | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual | Personnel Security Officer | PS-2 | No documented cadence in research file |
| Track personnel reinvestigation due dates and initiate reinvestigations | Per DoD/IC periodic reinvestigation schedule (typically 5-year Tier-dependent cycle under DoD personnel security policy) — recommend verification against current DoD/IC continuous vetting guidance | Personnel Security Officer | PS-3 | No cadence documented in research file; general DoD personnel security periodic reinvestigation practice cited as reasoned default pending JSIG-specific verification |
| Process termination actions (access revocation, debrief, property return) | Per-event, within 24 hours of termination notice | Personnel Security Officer, System Administrator | PS-4 | Aligned with AC-2 24-hour notification pattern ([IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf)) |
| Process transfer actions (access reassessment) | Per-event, within 24 hours of transfer notice | Personnel Security Officer, System Administrator | PS-5 | Aligned with AC-2 24-hour notification pattern ([IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf)) |
| Review and re-sign access agreements (NDAs, SAP indoctrination agreements) | At least annually | Personnel Security Officer | PS-6 | [FedRAMP Continuous Monitoring Playbook](https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf) annual documentation-review pattern applied by analogy |
| Review third-party/contractor personnel security compliance | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual | Personnel Security Officer | PS-7 | No documented cadence in research file |
| Apply personnel sanctions for security policy violations | Per-event | ISSM, Personnel Security Officer | PS-8 | No documented cadence in research file; inherently event-driven |
| Review/update personnel security policy | Annual | ISSM | PS-1 | [FedRAMP Continuous Monitoring Playbook](https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf) |

**Artifacts to retain:** position risk designation records, reinvestigation tracking log, termination/transfer checklists with timestamps, signed access agreements (with expiration/renewal dates), third-party personnel security compliance records, sanctions records, PS policy document.

**Deep-Dive Domain Analysis: Personnel Security**

PS exists to ensure that the trust extended to every individual with system or facility access is established deliberately (through screening and position-risk designation) and withdrawn promptly when that trust should no longer apply (through termination/transfer processing) — PS is the human-side mirror of AC-2's account-management discipline ([DCSA JSIG 2016](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf); PS-3/PS-4/PS-5 control statements, `PS.md`).

**Common failure modes when PS maintenance lapses:** termination processing (PS-4) that misses the 24-hour notification target because the HR-to-security handoff isn't automated or reliably triggered, leaving a departed employee's system and physical access valid for days; periodic reinvestigation (PS-3) tracking that falls behind the DoD/IC reinvestigation cycle, so personnel continue operating on clearances that are administratively overdue for renewal; and access agreements (PS-6) that were signed once at onboarding years ago and never re-executed, so current personnel haven't formally reacknowledged current handling requirements.

**Cross-family dependencies:** PS is the upstream trigger for AC — every PS-4/PS-5 termination or transfer event should generate a same-day AC-2 disablement/reassessment action, and a broken PS-to-AC handoff is one of the highest-severity gaps this plan identifies because it leaves valid credentials in the hands of someone who should no longer have them. PS feeds PE — physical access authorization should be revoked through the same trigger. PS feeds AT — new-hire screening completion (PS-2/PS-3) is the gate that should precede AT-2 initial training and, in turn, AC-2 account provisioning.

**What sustainment looks like in practice:**
1. A same-day PS-4 termination notice triggers a coordinated checklist covering AC-2 account disablement, PE physical-access revocation, and property/badge return, executed as a single cross-family workflow rather than three independently-tracked and potentially inconsistent processes.
2. The Personnel Security Officer's reinvestigation-tracking log flags an individual approaching their Tier-dependent reinvestigation due date 90 days in advance, giving enough lead time to avoid an administrative access suspension caused purely by paperwork lag.
3. The annual PS-6 access-agreement re-signature cycle is bundled with the AT-2 annual training refresh, so personnel reacknowledge both their behavioral/handling obligations and complete their awareness refresher in a single coordinated event.
4. A PS-8 personnel sanction for a policy violation is cross-referenced against that individual's AC-2 privileged-access status, and the privileged access is reviewed/restricted as part of the sanction rather than the two processes running in isolation.

---

### 3.14 RA — Risk Assessment

**Ongoing/operational controls:** RA-2 (Security Categorization — periodic review upon change), RA-3 (Risk Assessment — periodic update), RA-5 (Vulnerability Scanning — the core recurring scan task), RA-6 (Technical Surveillance Countermeasures Survey — periodic, if applicable). **Withdrawn:** RA-4 (→ RA-3). **Initial-only:** RA-1 (policy).

| Task | Frequency | Responsible Role | Control ID(s) | Source/justification |
|---|---|---|---|---|
| Perform vulnerability scanning (OS/infrastructure, web app, database) | Monthly minimum; internet-reachable assets continuously or every 3 days under newer FedRAMP guidance | System Administrator, ISSO | RA-5 | [FedRAMP Continuous Monitoring Playbook](https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf), [FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx), [IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf), [FedRAMP RFC-0012](https://www.fedramp.gov/rfcs/0012/) |
| Update scanner vulnerability signatures | At least monthly; within 24 hours prior to scheduled scans | System Administrator | RA-5(2) | [FedRAMP Continuous Monitoring Playbook](https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf), [FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx) |
| Remediate discovered vulnerabilities by severity | High: 30 days; Moderate: 90 days; Low: 180 days (FedRAMP); 21-day IAVA patch objective (DoD) | System Administrator | RA-5, SI-2 | [FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx), [FedRAMP High SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-High-FedRAMP-Security-Controls.docx), [DoD Cybersecurity Discipline Implementation Plan](https://dodcio.defense.gov/portals/0/documents/cyber/cyberdis-impplan.pdf) |
| Update/reassess organizational risk assessment | At least annually, or upon significant change | ISSM | RA-3 | [FedRAMP Continuous Monitoring Playbook](https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf) annual documentation-review pattern applied by analogy |
| Review security categorization | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual, or upon significant system change | ISSM | RA-2 | No documented cadence in research file |
| Conduct Technical Surveillance Countermeasures Survey (if applicable to facility) | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: per DoD/IC physical security policy (commonly periodic, e.g., biennial) — high-priority manual verification item | Facility Security Officer, ISSM | RA-6 | No documented cadence in research file; flagged as JSIG-SAP-specific item needing primary-source verification |
| Review/update risk assessment policy | Annual | ISSM | RA-1 | [FedRAMP Continuous Monitoring Playbook](https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf) |

**Artifacts to retain:** vulnerability scan reports (raw + summary, with 24-month history recommended), remediation tracking tied to POA&M, risk assessment report with revision history, security categorization worksheet, TSCM survey reports, RA policy document.

**Deep-Dive Domain Analysis: Risk Assessment**

RA exists to convert uncertainty about threats and vulnerabilities into a prioritized, documented picture of risk that drives remediation resourcing — RA-5 vulnerability scanning is the most mechanically continuous part of this, while RA-3 organizational risk assessment is the periodic synthesis that turns raw scan data into a risk narrative for the AO ([DCSA JSIG 2016](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf); RA-3/RA-5 control statements, `RA.md`). The convergence across FedRAMP, IRS, and DoD sources on monthly scanning with severity-based remediation timelines (30/90/180 days FedRAMP; 21-day DoD IAVA objective) shows this is one of the best-evidenced cadences in the entire program ([FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx); [DoD Cybersecurity Discipline Implementation Plan](https://dodcio.defense.gov/portals/0/documents/cyber/cyberdis-impplan.pdf)).

**Common failure modes when RA maintenance lapses:** vulnerability scans that run on schedule but whose results are never actually triaged into the POA&M, so scanning becomes an activity metric rather than a risk-reduction one; remediation timelines that are tracked loosely enough that "90 days" quietly becomes "90 days plus however long it takes," eroding the entire point of severity-based SLAs; and an annual risk assessment (RA-3) that is a copy-paste of the prior year's document rather than a genuine reassessment reflecting the system's current threat environment and architecture.

**Cross-family dependencies:** RA feeds SI directly — RA-5 vulnerability findings are the primary input to SI-2 flaw remediation prioritization. RA feeds CA — RA-5 results are a required monthly ConMon input and populate the POA&M (CA-5). RA depends on CM — vulnerability scanning is only complete if it covers the full CM-8 inventory; an incomplete inventory means an incomplete scan regardless of how well the scanning tool performs. RA feeds PE for the SAP-specific RA-6 Technical Surveillance Countermeasures Survey, which is a physical-security-adjacent risk assessment activity.

**What sustainment looks like in practice:**
1. The daily configuration/patching checklist item on IAVA/KEV tracking (Section 1A.3) ensures that a newly published CISA Known Exploited Vulnerability affecting a system component is logged and its 2-week BOD 22-01 remediation clock started the same day it's published, not discovered a week later during the monthly scan review.
2. The monthly RA-5 scan results are triaged the same week into severity-tagged POA&M entries with target remediation dates calculated from discovery date, and an ISSO-level weekly check confirms no high-severity item is drifting past its 30-day SLA.
3. The annual RA-3 risk assessment update incorporates the past year's actual incident history (from IR) and vulnerability trend data (from RA-5/SI-2) rather than being written from a generic template, giving the AO a risk picture grounded in this system's actual operating history.
4. A high-risk vulnerability that remains unremediated past the DoD 120-day overdue threshold triggers the documented escalation path — network access removal for the affected system — rather than being allowed to linger indefinitely on the POA&M.

---

### 3.15 SA — System And Services Acquisition

**Ongoing/operational controls:** SA-3 (System Development Life Cycle — per-project, but includes periodic SDLC process review), SA-4 (Acquisition Process — periodic review), SA-5 (Information System Documentation — periodic update), SA-8 (Security Engineering Principles — periodic review), SA-9 (External Information System Services — periodic review of provider compliance), SA-10 (Developer Configuration Management — periodic verification for active development), SA-11 (Developer Security Testing and Evaluation — per-release), SA-12 through SA-22 (Supply Chain Protection, Trustworthiness, Criticality Analysis, Development Process, Component Authenticity, Unsupported System Components — periodic review; **SA-22 is JSIG non-tailorable**). **Initial-only:** SA-1 (policy), SA-2 (Allocation of Resources). **Withdrawn:** SA-6, SA-7.

| Task | Frequency | Responsible Role | Control ID(s) | Source/justification |
|---|---|---|---|---|
| Review external/third-party information system service provider compliance | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual | ISSM | SA-9 | No documented cadence in research file; annual default aligned with -1/documentation-review pattern |
| Update system documentation (architecture, admin/user guides) | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual, or upon significant change | System Administrator | SA-5 | No documented cadence in research file |
| Review unsupported system components for end-of-life/end-of-support status | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: quarterly, given direct security-currency impact | System Administrator | SA-22 (non-tailorable) | No documented cadence in research file; quarterly default justified by non-tailorable status and patch-currency linkage to SI-2/RA-5 findings |
| Perform supply chain risk/criticality analysis review | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual | ISSM | SA-12, SA-14, SA-15 | No documented cadence in research file |
| Verify component authenticity (anti-counterfeit) on acquisition/receipt | Per-event (at acquisition) | System Administrator | SA-19 | No documented cadence in research file; inherently event-driven |
| Review developer security testing/evaluation results for in-house development | Per-release (event-driven) | ISSO, System Administrator | SA-11 | No documented cadence in research file; inherently event-driven |
| Review/update system and services acquisition policy | Annual | ISSM | SA-1 | [FedRAMP Continuous Monitoring Playbook](https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf) |

**Artifacts to retain:** service provider compliance review records, updated system documentation with version history, unsupported-component tracking register, supply chain risk assessment records, component authenticity verification records, developer test/evaluation reports, SA policy document.

**Deep-Dive Domain Analysis: System And Services Acquisition**

SA exists to ensure security is engineered into the system across its lifecycle — from acquisition and development through ongoing support — rather than bolted on afterward, and to ensure the organization retains visibility into third-party/supply-chain risk introduced by external developers, integrators, and service providers ([DCSA JSIG 2016](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf); SA-9/SA-22 control statements, `SA.md`). SA-22 (unsupported system components) is JSIG non-tailorable, reflecting how directly end-of-life software maps to unpatchable, permanently vulnerable attack surface.

**Common failure modes when SA maintenance lapses:** unsupported/end-of-life components (SA-22) that keep running because "it still works," accumulating unpatchable vulnerabilities that no SI-2 patch cycle can ever close since the vendor no longer issues patches; third-party service provider compliance (SA-9) that was verified once at contract signing and never revisited, so a provider's security posture can degrade for years without detection; and developer security testing (SA-11) for in-house development that becomes inconsistent across releases as team composition changes, so some releases get rigorous testing and others don't.

**Cross-family dependencies:** SA feeds CM directly — SA-22 unsupported-component findings should drive CM-7 authorized-software-list retirement decisions. SA feeds RA/SI — unsupported components are a standing, unremediable risk that RA-3 risk assessments and SI-2 patch tracking must account for differently than a normal patchable vulnerability (the remediation is replacement, not patching). SA depends on PS/AR for third-party personnel and privacy compliance overlaps when acquisition involves contractor access to SAP data.

**What sustainment looks like in practice:**
1. The quarterly SA-22 unsupported-component review (justified as quarterly rather than the generic annual default, given the non-tailorable status and direct link to unpatchable risk) identifies a network appliance running firmware that reached end-of-support eight months ago; a replacement is budgeted and the interim risk is documented in the POA&M rather than left implicit.
2. An annual SA-9 review of an external cloud service provider's compliance documentation (SOC 2, FedRAMP authorization status, etc.) catches that the provider's authorization has lapsed, triggering a risk conversation with the ISSM before, rather than after, an incident involving that provider's platform.
3. Developer security testing results (SA-11) for an in-house administrative tool reveal an injection vulnerability before release; the finding is remediated pre-deployment rather than becoming a post-deployment RA-5/SI-2 finding.
4. Component authenticity verification (SA-19) at receipt of new hardware catches a supply-chain irregularity (mismatched serial numbering) that is escalated to the ISSM before the hardware is placed into service.

---

### 3.16 SC — System And Communications Protection

**Ongoing/operational controls:** SC-5 (Denial of Service Protection — continuous), SC-7 (Boundary Protection — continuous enforcement, periodic rule review), SC-8 (Transmission Confidentiality/Integrity — continuous), SC-12/SC-13 (Cryptographic Key Establishment/Management, Cryptographic Protection — periodic key rotation), SC-15 (Collaborative Computing Devices — periodic review), SC-18 (Mobile Code — periodic review), SC-20/SC-21/SC-22 (DNS/Name Resolution — continuous), SC-23 (Session Authenticity — continuous), SC-28 (Protection of Information at Rest — continuous enforcement, **non-tailorable encryption requirement**), SC-39 (Process Isolation — continuous), SC-44 (Detonation Chambers — continuous, if applicable). **Initial-only:** SC-1 (policy).

| Task | Frequency | Responsible Role | Control ID(s) | Source/justification |
|---|---|---|---|---|
| Monitor and enforce boundary protection (firewalls, guards) | Continuous, with periodic rule-set review | Network Administrator | SC-7 | No specific cadence documented in research file for SC-7 review — recommend ODP per JSIG tailoring; suggested default: quarterly rule review |
| Verify encryption of data at rest remains enabled and compliant | Continuous enforcement; compliance verification recommended quarterly | System Administrator | SC-28 (non-tailorable) | JSIG non-tailorable control per `INDEX.md`; no specific review cadence documented — recommend ODP per JSIG tailoring; suggested default: quarterly compliance verification given non-tailorable/high-priority status |
| Verify transmission confidentiality/integrity (encryption in transit) | Continuous enforcement; compliance verification recommended quarterly | Network Administrator | SC-8 | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: quarterly |
| Rotate/manage cryptographic keys | Per organizational key management plan; commonly annual or shorter per algorithm/key-strength policy — recommend verification against JSIG/CNSS crypto guidance | System Administrator | SC-12, SC-13 | No documented cadence in research file; annual default is a common industry baseline pending JSIG-specific verification |
| Review collaborative computing device and mobile code policies/configurations | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual | System Administrator | SC-15, SC-18 | No documented cadence in research file |
| Monitor denial-of-service protections and session authenticity mechanisms | Continuous (automated) | Network Administrator | SC-5, SC-23 | No documented cadence in research file; continuous default given real-time protective function |
| Review/update system and communications protection policy | Annual | ISSM | SC-1 | [FedRAMP Continuous Monitoring Playbook](https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf) |

**Artifacts to retain:** boundary protection rule-set change records, encryption-at-rest/in-transit compliance verification reports, key management logs (rotation dates, custodian sign-off), collaborative computing/mobile code configuration reviews, SC policy document.

**Deep-Dive Domain Analysis: System And Communications Protection**

SC exists to protect data and communications while they are in motion or being processed — the complement to AC (which governs who may access what) and MP (which governs media at rest) — through boundary protection, encryption, and session-integrity mechanisms that operate continuously and largely without human intervention once configured ([DCSA JSIG 2016](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf); SC-7/SC-8/SC-28 control statements, `SC.md`). SC-28 (protection of information at rest) is JSIG non-tailorable, making it one of the highest-priority continuous-enforcement items in the entire plan alongside AC-6(1) and SA-22.

**Common failure modes when SC maintenance lapses:** boundary-protection rule sets (SC-7) that accumulate exceptions over time ("just open this port temporarily") that never get cleaned up, gradually eroding the boundary's effectiveness until it resembles Swiss cheese; encryption-at-rest (SC-28) that silently fails after a storage migration or software update — the data is still there, but no longer actually encrypted, and because encryption failures are often invisible in normal operation, this can persist for months undetected; and cryptographic key management (SC-12/SC-13) that misses rotation deadlines because no formal tracking system exists, leaving keys in service well past their intended cryptoperiod.

**Cross-family dependencies:** SC feeds MP — encryption at rest is a complementary control to media protection, and the two should be reviewed together rather than in isolation. SC feeds AC — boundary protection (SC-7) and remote access (AC-17) govern overlapping attack surface and should share review cycles. SC feeds IA — cryptographic authenticators depend on SC-12/SC-13 key management integrity. SC feeds SI — SI-4 monitoring often operates by inspecting traffic at SC-7 boundary points, so a boundary-protection blind spot is also a monitoring blind spot.

**What sustainment looks like in practice:**
1. The daily network/boundary checklist (Section 1A.7) catches an unauthorized firewall rule change made outside the CCB process during an after-hours vendor engagement; the rule is reverted and the change is retroactively evaluated through the CCB, closing the gap same-day rather than at the next quarterly SC-7 rule-set review.
2. A quarterly encryption-at-rest compliance verification (justified as quarterly given SC-28's non-tailorable status) discovers that a newly-provisioned storage volume was created without the organization's standard encryption template applied; it is remediated immediately and the provisioning process is corrected to prevent recurrence.
3. Cryptographic key rotation (SC-12/SC-13) is tracked in a dedicated register with automated reminders well ahead of each key's cryptoperiod expiration, avoiding the scenario where a key rotation is missed and discovered only when a certificate-dependent service fails in production.
4. A collaborative-computing-device policy review (SC-15) discovers that conference-room video equipment has a microphone/camera enabled by default in a SAP-relevant space; the configuration is corrected and the finding informs a broader review of similar devices across the facility.

---

### 3.17 SI — System And Information Integrity

**Ongoing/operational controls:** SI-2 (Flaw Remediation — the core recurring patch-management task), SI-3 (Malicious Code Protection — continuous/periodic scanning), SI-4 (Information System Monitoring — continuous), SI-5 (Security Alerts, Advisories, and Directives — continuous/per-event), SI-6 (Security Function Verification — periodic), SI-7 (Software, Firmware, and Information Integrity — periodic verification), SI-8 (Spam Protection — continuous), SI-10 (Information Input Validation — periodic verification), SI-11 (Error Handling — periodic verification), SI-12 (Information Handling and Retention — ongoing), SI-16 (Memory Protection — continuous), SI-17 (Fail-Safe Procedures — periodic verification). **Withdrawn:** SI-9. **Initial-only:** SI-1 (policy).

| Task | Frequency | Responsible Role | Control ID(s) | Source/justification |
|---|---|---|---|---|
| Install security-relevant software/firmware updates | Within 30 days of release (FedRAMP); within 21 days of IAVA release (DoD) | System Administrator | SI-2 | [FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx), [FedRAMP High SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-High-FedRAMP-Security-Controls.docx), [DoD Cybersecurity Discipline Implementation Plan](https://dodcio.defense.gov/portals/0/documents/cyber/cyberdis-impplan.pdf) |
| Check/report flaw-remediation (patch) status | At least monthly (SI-2(2)) | System Administrator | SI-2(2) | [FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx) |
| Remove network access for systems with high-risk weaknesses overdue >120 days | Event-driven, at 120-day threshold | ISSM, System Administrator | SI-2, RA-5, AC/SC enforcement | [DoD Cybersecurity Discipline Implementation Plan](https://dodcio.defense.gov/portals/0/documents/cyber/cyberdis-impplan.pdf) |
| Maintain IAVM operational-directive compliance | Continuous; acknowledge by JTF-GNO deadline; POA&M no later than directive date; scan ≤14 days old for POA&M support | System Administrator, ISSO | SI-2, RA-5, CA-5 | [USMC IAVM Program bulletin](https://www.marines.mil/News/Messages/Messages-Display/Article/889863/mcbul-5239-usmc-information-assurance-vulnerability-management-iavm-program/) |
| Remediate CISA Known Exploited Vulnerabilities (KEV) catalog items | Within 2 weeks under BOD 22-01 | System Administrator | SI-2, RA-5 | [NIST SP 800-40 Rev. 4](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-40r4.pdf) |
| Run periodic malicious-code (antivirus/anti-malware) scans | Weekly periodic scans | System Administrator | SI-3 | [FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx), [IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf) |
| Run real-time malicious-code scans on files from external sources | Continuous/real-time | System Administrator | SI-3 | [FedRAMP High SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-High-FedRAMP-Security-Controls.docx) |
| Update malicious-code protection signatures/tools | Not less than daily | System Administrator | SI-3 | [IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf) |
| Monitor system for indicators of compromise/anomalous behavior | Continuous | ISSO / SOC analyst | SI-4 | [NIST SP 800-137](https://nvlpubs.nist.gov/nistpubs/legacy/sp/nistspecialpublication800-137.pdf) general continuous-monitoring framing |
| Review/act on security alerts, advisories, and directives (IAVA/IAVB, CERT bulletins) | Continuous/per-event, tracked against directive deadlines | ISSO, System Administrator | SI-5 | [USMC IAVM Program bulletin](https://www.marines.mil/News/Messages/Messages-Display/Article/889863/mcbul-5239-usmc-information-assurance-vulnerability-management-iavm-program/) |
| Verify security function operation (e.g., self-tests) | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: monthly | System Administrator | SI-6 | No documented cadence in research file |
| Verify software/firmware/information integrity (checksums, integrity monitoring) | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: monthly, aligned with CM-8 inventory cycle | System Administrator | SI-7 | No documented cadence in research file |
| Review spam protection mechanism effectiveness | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: quarterly | System Administrator | SI-8 | No documented cadence in research file |
| Review/update system and information integrity policy | Annual | ISSM | SI-1 | [FedRAMP Continuous Monitoring Playbook](https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf) |

**Artifacts to retain:** patch/update deployment records, monthly patch-status reports, IAVM compliance tracking log, KEV remediation tracking, malware scan logs and signature-update logs, security alert/advisory disposition tracking, security function self-test results, integrity-monitoring reports, SI policy document.

**Deep-Dive Domain Analysis: System And Information Integrity**

SI exists to ensure the system's software, firmware, and data remain in a known-good, uncorrupted, and up-to-date state, and to provide the continuous monitoring capability that detects when they don't — SI-2 (flaw remediation/patching), SI-3 (malware protection), and SI-4 (system monitoring) together form the most operationally continuous, highest-tempo family in this entire plan ([DCSA JSIG 2016](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf); SI-2/SI-3/SI-4 control statements, `SI.md`). The convergence of DoD's 21-day IAVA patch objective, FedRAMP's 30/90/180-day severity-based remediation, and the newer FedRAMP RFC-0012 push toward continuous/3-day assessment reflects a field-wide trend toward tighter and tighter patch timelines ([DoD Cybersecurity Discipline Implementation Plan](https://dodcio.defense.gov/portals/0/documents/cyber/cyberdis-impplan.pdf); [FedRAMP RFC-0012](https://www.fedramp.gov/rfcs/0012/)).

**Common failure modes when SI maintenance lapses:** patch backlogs that grow because remediation is tracked by "we'll get to it" rather than a firm severity-based clock, eventually producing a system with dozens of aging unpatched vulnerabilities that individually seem tolerable but collectively represent a large attack surface; malware signature updates that are automated but silently fail (a broken update mechanism reporting false success), leaving endpoints protected against yesterday's threats but not today's; and monitoring (SI-4) that generates alerts no one is actually watching, which is functionally equivalent to having no monitoring at all while giving the false comfort of a checkbox marked "monitoring: enabled."

**Cross-family dependencies:** SI is fed by RA (vulnerability scan results drive SI-2 prioritization) and feeds CA (SI-2 patch status is a required monthly ConMon input) and IR (SI-3/SI-4 detections are the most common incident trigger). SI depends on CM — patches and updates must go through change control, and CM-8 inventory accuracy determines whether SI-2 patch coverage is actually complete. SI feeds AU — security alerts and directive compliance (SI-5) generate audit-relevant records that AU-6 review should incorporate.

**What sustainment looks like in practice:**
1. The daily malware/endpoint checklist (Section 1A.4) catches a stale antivirus signature version on a subset of endpoints the morning after a scheduled update failed silently; the update mechanism is fixed and signatures are force-pushed before those endpoints go a full day unprotected against current threats.
2. A newly published IAVA is logged and assigned a remediation owner and 21-day target the same day it's released (tracked via the daily patching checklist), rather than being discovered during the next monthly patch-status check with 20 of those 21 days already consumed.
3. The monthly SI-2(2) patch-status report shows a high-risk finding approaching the DoD 120-day network-removal threshold; the ISSM is alerted proactively so a remediation decision (patch, compensating control, or removal) is made deliberately rather than by default when the deadline arrives.
4. A repeated malware-detection pattern across multiple hosts, caught by the daily endpoint checklist, is escalated into a formal IR-4 incident rather than being closed out host-by-host as routine antivirus log noise, revealing what turns out to be a coordinated phishing campaign against the organization.

---

### 3.18 PM — Program Management

**Ongoing/operational controls:** PM-4 (Plan of Action and Milestones Process — program-level, feeds CA-5), PM-5 (Information System Inventory — periodic, feeds CM-8), PM-6 (Information Security Measures of Performance — periodic metrics reporting), PM-9 (Risk Management Strategy — periodic review). **Initial-only:** PM-1 (program plan — periodic review applies), PM-2 (Senior Information Security Officer — role designation), PM-3 (resources), PM-7 (Enterprise Architecture — periodic review), PM-8 (Critical Infrastructure Plan — periodic review).

| Task | Frequency | Responsible Role | Control ID(s) | Source/justification |
|---|---|---|---|---|
| Review/update organization-wide information security program plan | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual | ISSM | PM-1 | No documented cadence in research file; annual default aligned with -1/documentation-review pattern |
| Maintain organization-level POA&M process/rollup | Monthly (aligned with system-level CA-5 monthly cycle) | ISSM | PM-4 | [FedRAMP Continuous Monitoring Playbook](https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf) monthly POA&M cadence applied at program level |
| Maintain organization-wide information system inventory | Monthly (aligned with CM-8 cadence) | ISSM | PM-5 | [FedRAMP Continuous Monitoring Playbook](https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf) monthly inventory cadence applied at program level |
| Report information security performance measures | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: monthly/quarterly dashboard to AO | ISSM | PM-6 | No documented cadence in research file |
| Review enterprise architecture and critical infrastructure plan for security alignment | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual | ISSM | PM-7, PM-8 | No documented cadence in research file |
| Review/update risk management strategy | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual, aligned with RA-3 | ISSM | PM-9 | No documented cadence in research file |

**Artifacts to retain:** program security plan with revision history, program-level POA&M rollup, enterprise inventory export, performance-measure dashboards/reports, enterprise architecture review records, risk management strategy document.

**Deep-Dive Domain Analysis: Program Management**

PM exists at the organizational level above any single system's ATO — it aggregates POA&M, inventory, risk-management strategy, and performance metrics across the entire program so that the ISSM and AO have a portfolio-level view rather than only a system-by-system one ([DCSA JSIG 2016](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf); PM-4/PM-5/PM-9 control statements, `PM.md`).

**Common failure modes when PM maintenance lapses:** the organization-level POA&M rollup (PM-4) that lags behind the system-level CA-5 updates it's supposed to aggregate, giving program leadership a stale picture even when individual system teams are current; enterprise inventory (PM-5) that diverges from the sum of individual systems' CM-8 inventories because the rollup process is manual and error-prone; and a risk-management strategy (PM-9) that is written once and never revisited, so it fails to reflect how the threat landscape or the program's risk tolerance has evolved.

**Cross-family dependencies:** PM is explicitly the aggregation layer above CA, CM, and RA — PM-4 is the CA-5 POA&M process rolled up organization-wide, and PM-5 is the CM-8 inventory rolled up the same way. A lapse at the system level in any of these families propagates directly into a corresponding PM-level gap, making PM another useful canary (like CA) for detecting maintenance lapses elsewhere.

**What sustainment looks like in practice:**
1. The monthly PM-4 organization-level POA&M rollup is generated as a direct aggregation of that month's system-level CA-5 updates (rather than a separately-maintained shadow list), so any discrepancy between the two immediately flags a system that missed its monthly POA&M update.
2. The monthly PM-5 enterprise inventory reconciliation catches a system whose CM-8 inventory export failed to sync, closing the gap the same month rather than allowing a stale enterprise inventory to persist for a quarter.
3. Performance-measure reporting (PM-6) to the AO includes a trend line of POA&M aging and vulnerability-remediation timeliness across the full portfolio, giving the AO the ability to spot a program-wide degradation before it manifests as a specific system's ATO becoming indefensible.
4. The risk-management strategy (PM-9) is revisited alongside the annual RA-3 risk-assessment cycle, ensuring the organization's stated risk tolerance and its system-level risk assessments stay mutually consistent rather than drifting apart.


---
### 3.19–3.26 Appendix J Privacy Control Families (AP, AR, DI, DM, IP, SE, TR, UL)

**Important caveat:** These eight families have **no matching NIST SP 800-53 Rev. 4 XML baseline record** — the reference scaffold's family files (`AP.md`, `AR.md`, `DI.md`, `DM.md`, `IP.md`, `SE.md`, `TR.md`, `UL.md`) note this explicitly and flag every control for manual verification against JSIG Chapter 3 / Appendix J text. No cadence evidence for these controls appears in `reference/research/operational-maintenance-schedules-research.md`, which is scoped to NIST Rev. 4/RMF families. All cadences below are reasoned defaults built by analogy to the closest operational parallel in the NIST-mapped families (e.g., DM retention/disposition mapped to AU-11 retention patterns, TR notice updates mapped to annual policy-review patterns) and **must be verified against the primary JSIG PDF** before use in an actual ATO package.

#### 3.19 AP — Authority And Purpose

**Ongoing/operational controls:** AP-1 (Authority to Collect — periodic reverification if collection basis changes), AP-2 (Purpose Specification — periodic review).

| Task | Frequency | Responsible Role | Control ID(s) | Source/justification |
|---|---|---|---|---|
| Reverify legal/collection authority remains current | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual | Privacy Officer | AP-1 | No documented cadence in research file or family file (no NIST XML match); annual default by analogy to -1 policy-review pattern |
| Review purpose specification for continued accuracy | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual | Privacy Officer | AP-2 | No documented cadence in research file or family file; annual default by analogy |

**Artifacts to retain:** authority-to-collect determination memos, purpose specification statements with review dates.

**Deep-Dive Domain Analysis: Authority And Purpose**

AP exists to ensure that any collection of personally identifiable information rests on a clearly identified legal authority and a stated purpose, and that the system doesn't quietly begin using PII for purposes beyond what was originally authorized — it is the privacy-family equivalent of a scope boundary, performing for data collection what AC-3 performs for system access. As the plan notes, AP has no matching NIST Rev. 4 XML baseline record, so all maintenance framing here is by analogy to the closest NIST-mapped pattern rather than sourced from the research file directly ([reference scaffold extraction note](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)).

**Common failure modes when AP maintenance lapses:** a system's actual data-collection practice quietly expands beyond its originally authorized purpose as new features or integrations are added, without anyone re-checking that the AP-1 authority-to-collect determination still covers the expanded use; and purpose-specification language (AP-2) becomes stale, so privacy notices and internal documentation describe a narrower or different purpose than what the system now actually does with the data.

**Cross-family dependencies:** AP is upstream of DM (data minimization only makes sense against a clearly defined purpose) and TR (transparency notices must accurately reflect the AP-2 purpose specification). AP also interacts with SA — any new system feature or third-party integration approved through SA-3/SA-9 that touches PII should trigger an AP-1 reverification, not just a technical security review.

**What sustainment looks like in practice:**
1. Before a new data-sharing integration is approved through the SA change process, the Privacy Officer confirms the AP-1 authority-to-collect determination explicitly covers the new use case, rather than assuming the original authority is broad enough.
2. The annual AP-2 purpose-specification review is conducted alongside the AR-2 Privacy Impact Assessment update, since both documents describe overlapping aspects of why and how PII is used.
3. A feature request that would use existing PII for a new analytics purpose is paused pending a fresh AP-1/AP-2 review, preventing purpose creep from happening silently through normal development velocity.

---


#### 3.20 AR — Accountability, Audit And Risk Management

**Ongoing/operational controls:** AR-1 (Governance and Privacy Program — periodic review), AR-2 (Privacy Impact and Risk Assessment — periodic update), AR-3 (Privacy Requirements for Contractors — periodic review), AR-4 (Privacy Monitoring and Auditing — recurring), AR-5 (Privacy Awareness and Training — periodic refresh), AR-6 (Privacy Reporting — periodic), AR-7 (Privacy-Enhanced System Design and Development — per-project), AR-8 (Accounting of Disclosures — ongoing).

| Task | Frequency | Responsible Role | Control ID(s) | Source/justification |
|---|---|---|---|---|
| Review privacy program governance documentation | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual | Privacy Officer | AR-1 | No documented cadence in research file or family file (no NIST XML match); annual default by analogy |
| Update Privacy Impact Assessment (PIA) | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual or upon significant system/data change, aligned with RA-3 risk-assessment cadence | Privacy Officer | AR-2 | No documented cadence in research file; annual default by analogy to RA-3 |
| Review contractor privacy-requirement compliance | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual, aligned with PS-7 | Privacy Officer | AR-3 | No documented cadence in research file; annual default by analogy to PS-7 |
| Monitor/audit privacy control compliance | Monthly monitoring recommended, aligned with AU-6/CA-5 monthly ConMon rhythm | Privacy Officer, ISSO | AR-4 | No documented cadence in research file; monthly default by analogy to AU-6/CA-5 pattern |
| Deliver privacy awareness training | Annual refresh, aligned with AT-2 | Training Manager | AR-5 | No documented cadence in research file; annual default by analogy to AT-2 |
| Produce privacy compliance reports | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual | Privacy Officer | AR-6 | No documented cadence in research file |
| Maintain accounting of disclosures log | Continuous/per-event | Privacy Officer | AR-8 | No documented cadence in research file; inherently event-driven per disclosure |

**Artifacts to retain:** privacy governance review records, PIA documents with revision history, contractor privacy compliance records, privacy monitoring/audit logs, training rosters, privacy compliance reports, disclosure accounting log.

**Deep-Dive Domain Analysis: Accountability, Audit And Risk Management**

AR exists to build a governance layer specifically over privacy risk — parallel to how CA/RA build a governance layer over security risk — ensuring privacy impacts are assessed, contractors are held to privacy requirements, and disclosures of PII are tracked and accountable ([reference scaffold extraction note](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)).

**Common failure modes when AR maintenance lapses:** Privacy Impact Assessments (AR-2) that are written once at system deployment and never updated as the system's data practices evolve, leaving the PIA disconnected from actual current risk; an accounting-of-disclosures log (AR-8) that isn't updated consistently because no single process owns every disclosure pathway, making it impossible to answer "who has our data and when did we give it to them" during an incident or an individual's access request; and contractor privacy-requirement compliance (AR-3) that is verified once at contract signing and never revisited.

**Cross-family dependencies:** AR mirrors CA/RA for the privacy domain — AR-2 PIA updates should be triggered by the same significant-change events that trigger an RA-3 risk-assessment update. AR-4 privacy monitoring/auditing depends on AU providing the underlying audit trail of PII access and disclosure events. AR-8 accounting of disclosures depends on IP-2/IP-3 individual-access and redress processes to function as a complete privacy-rights system.

**What sustainment looks like in practice:**
1. A significant system change that alters how PII flows through the system (e.g., a new reporting export feature) triggers both an RA-3 security risk-assessment touchpoint and an AR-2 PIA update in the same change-review cycle, rather than the security and privacy assessments happening independently and inconsistently.
2. The monthly AR-4 privacy-monitoring pass (aligned to the AU-6/CA-5 ConMon rhythm) reviews a sample of PII access events against the accounting-of-disclosures log (AR-8) to confirm the two records are consistent.
3. An annual AR-3 review of contractor privacy compliance catches that a subcontractor's data-handling certification lapsed six months prior; the finding is escalated and remediated before it surfaces in an external audit.

---


#### 3.21 DI — Data Quality And Integrity

**Ongoing/operational controls:** DI-1 (Data Quality — recurring verification), DI-2 (Data Integrity and Data Integrity Board — periodic review, if a Data Integrity Board applies).

| Task | Frequency | Responsible Role | Control ID(s) | Source/justification |
|---|---|---|---|---|
| Verify data quality (accuracy, relevance, timeliness, completeness) of PII holdings | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: quarterly | Data Owner, Privacy Officer | DI-1 | No documented cadence in research file or family file (no NIST XML match) |
| Convene/review Data Integrity Board matters (if applicable) | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual, or per matching-agreement schedule | Privacy Officer | DI-2 | No documented cadence in research file |

**Artifacts to retain:** data quality review records/checklists, Data Integrity Board meeting minutes (if applicable).

**Deep-Dive Domain Analysis: Data Quality And Integrity**

DI exists to ensure PII holdings remain accurate, relevant, timely, and complete — poor data quality isn't just an operational inconvenience in a privacy context, it directly harms the individuals the data describes (wrong decisions made on stale or inaccurate PII) and increases legal/compliance exposure ([reference scaffold extraction note](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)).

**Common failure modes when DI maintenance lapses:** PII holdings accumulate outdated records (former employees, expired affiliations) that are never refreshed or purged, degrading both data quality and expanding the DM-1 minimization problem simultaneously; and a Data Integrity Board (DI-2), where one is required for data-matching programs, meets irregularly or not at all, leaving matching-program risk unreviewed.

**Cross-family dependencies:** DI feeds DM directly — a data-quality review often surfaces the same records that a minimization review would flag for disposal, so the two are efficiently run together. DI depends on AR-2 PIA findings to identify which PII holdings carry the highest data-quality risk and should be prioritized for review.

**What sustainment looks like in practice:**
1. The quarterly DI-1 data-quality review is run jointly with a DM-1 minimization pass over the same PII holdings, since a record that fails a quality check (e.g., an address for someone no longer affiliated with the program) is very often also a record ready for disposal under the retention schedule.
2. A Data Integrity Board convened for a specific data-matching program reviews match criteria and error rates against the program's original data-matching agreement, catching a drift in match logic that had begun producing more false positives than the agreement anticipated.

---


#### 3.22 DM — Data Minimization And Retention

**Ongoing/operational controls:** DM-1 (Minimization of PII — periodic review of holdings), DM-2 (Data Retention and Disposal — the core recurring disposition task), DM-3 (Minimization of PII Used in Testing/Training/Research — per-project review).

| Task | Frequency | Responsible Role | Control ID(s) | Source/justification |
|---|---|---|---|---|
| Review PII holdings for minimization opportunities | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual | Privacy Officer, Data Owner | DM-1 | No documented cadence in research file or family file (no NIST XML match) |
| Execute data retention and disposal per records schedule | Per organization records-retention schedule (analogous to AU-11 pattern: online/active retention with defined offline/archive period) — recommend verification against organization records schedule and NARA requirements | Data Owner, System Administrator | DM-2 | No documented cadence in research file for DM-2 specifically; retention-scheduling pattern borrowed from AU-11 ([FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx), [IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf)) |
| Review PII minimization in test/training/research data sets | Per-project (event-driven) | Data Owner | DM-3 | No documented cadence in research file; inherently event-driven |

**Artifacts to retain:** PII inventory/holdings review records, records-disposition logs and certificates of destruction, test/training/research data minimization sign-offs.

**Deep-Dive Domain Analysis: Data Minimization And Retention**

DM exists to ensure the system holds only the PII it actually needs, for only as long as it actually needs it, and disposes of it properly afterward — minimization and disposal are the privacy-domain's direct analogue to AU-11 audit-record retention, applied to personal data rather than log data ([reference scaffold extraction note](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)).

**Common failure modes when DM maintenance lapses:** retention/disposal schedules (DM-2) that exist on paper but aren't actually executed on schedule, so PII accumulates indefinitely past its authorized retention period, expanding the population of data at risk in any future breach; and test/training/research data sets (DM-3) that retain full, unminimized PII because minimizing it "would take extra work," creating an unnecessarily exposed copy of sensitive data outside the production system's controls.

**Cross-family dependencies:** DM depends on AP (minimization only makes sense relative to a defined purpose) and feeds AR (a stale/bloated PII inventory is itself a privacy risk factor that should surface in the AR-2 PIA). DM-2 disposal execution overlaps operationally with MP-6 media sanitization when disposal involves physical media destruction.

**What sustainment looks like in practice:**
1. The organization's records-retention schedule execution for DM-2 is verified on a defined cycle (analogous to the AU-11 online/offline retention pattern) with actual disposal/destruction certificates retained as evidence, rather than assuming the schedule "runs itself."
2. A test-environment refresh process is checked to confirm PII used for testing has been properly minimized/masked (DM-3) before the refresh, catching an instance where a full unmasked production PII extract had been copied into a lower-security test environment.
3. The annual DM-1 PII-holdings minimization review, run alongside DI-1 data-quality review, identifies a legacy dataset retained "just in case" for three years past its stated business need and schedules it for disposal.

---


#### 3.23 IP — Individual Participation And Redress

**Ongoing/operational controls:** IP-1 (Consent — per-event, at collection), IP-2 (Individual Access — recurring process operation), IP-3 (Redress — recurring process operation), IP-4 (Complaint Management — recurring process operation).

| Task | Frequency | Responsible Role | Control ID(s) | Source/justification |
|---|---|---|---|---|
| Operate individual-access request process (respond to access requests) | Per-event, with defined response-time SLA — recommend organization-defined SLA (e.g., 30 days, common in Privacy Act practice) pending JSIG-specific verification | Privacy Officer | IP-2 | No documented cadence in research file or family file (no NIST XML match); 30-day default drawn from general Privacy Act practice, not from research file |
| Operate redress process for individuals | Per-event, with defined response-time SLA | Privacy Officer | IP-3 | No documented cadence in research file |
| Track and respond to privacy complaints; report complaint trends | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: quarterly trend report | Privacy Officer | IP-4 | No documented cadence in research file |

**Artifacts to retain:** consent records, individual access request logs and responses, redress case files, complaint tracking log and trend reports.

**Deep-Dive Domain Analysis: Individual Participation And Redress**

IP exists to give individuals whose PII is held by the system meaningful rights over that data — the ability to consent, access what's held about them, seek correction/redress, and file complaints — which is both a legal/policy obligation and a practical check on whether DI/DM controls are actually working, since individuals are often the first to notice their own data is wrong ([reference scaffold extraction note](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)).

**Common failure modes when IP maintenance lapses:** individual-access request processes (IP-2) that exist in policy but have no operational owner, so requests sit unanswered past any reasonable SLA; redress processes (IP-3) that resolve individual complaints without ever feeding the underlying data-quality issue back into a DI-1/DM-1 corrective action, so the same error recurs for other individuals; and complaint trend reporting (IP-4) that tracks volume but never analyzes root cause, missing systemic issues hiding behind a series of individually-resolved complaints.

**Cross-family dependencies:** IP feeds DI/DM — a redress case that identifies inaccurate data should trigger a broader DI-1 data-quality check for similar records, not just a one-off correction. IP feeds AR-8 — every individual-access response and redress action should be reflected in the disclosure-accounting log where applicable.

**What sustainment looks like in practice:**
1. An individual-access request (IP-2) is answered within the organization's defined SLA, and the response process automatically checks whether the requested record shows any DI-1 data-quality flags that should be corrected as part of the response.
2. A redress case revealing a systemic data-entry error in one field across many records triggers a targeted DI-1 review of all similarly-sourced records, rather than correcting only the individual complainant's record.
3. Quarterly IP-4 complaint-trend reporting identifies a spike in access-request complaints tied to a specific system feature launch, prompting a review of that feature's data-handling design rather than treating each complaint as isolated.

---


#### 3.24 SE — Security (Privacy Family)

**Ongoing/operational controls:** SE-1 (Inventory of Personally Identifiable Information — recurring, aligned with CM-8-style inventory practice), SE-2 (Privacy Incident Response — recurring, aligned with IR family practice).

| Task | Frequency | Responsible Role | Control ID(s) | Source/justification |
|---|---|---|---|---|
| Update inventory of systems/holdings containing PII | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: monthly, aligned with CM-8 | Privacy Officer, System Administrator | SE-1 | No documented cadence in research file or family file (no NIST XML match); monthly default by analogy to CM-8 |
| Operate privacy incident response process (detect/handle/report privacy incidents) | Continuous capability, aligned with IR-4/IR-5/IR-6 cadences and timelines | Privacy Officer, IR Team Lead | SE-2 | No documented cadence in research file; cadence borrowed from IR family pattern ([FedRAMP Moderate SSP Appendix A](https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx), [IRS Pub 1075](https://www.irs.gov/pub/irs-pdf/p1075.pdf)) |

**Artifacts to retain:** PII inventory exports, privacy incident tickets/logs and reporting records.

**Deep-Dive Domain Analysis: Security (Privacy Family)**

SE exists to apply security-family discipline specifically to PII — maintaining an inventory of where PII lives (mirroring CM-8 for personal data) and operating a privacy-specific incident response capability (mirroring the IR family for privacy breaches) — because a generic system inventory or generic incident-response plan may not surface PII-specific handling and notification obligations ([reference scaffold extraction note](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)).

**Common failure modes when SE maintenance lapses:** PII inventory (SE-1) that misses shadow copies of personal data in ancillary systems (reporting extracts, backup exports, test environments) because the inventory process only covers the primary system of record; and privacy incident response (SE-2) that defaults to the generic IR-4 process without triggering the additional notification obligations (to affected individuals, to oversight bodies) that a privacy breach specifically carries.

**Cross-family dependencies:** SE-1 depends on and should be reconciled against CM-8 general asset inventory — every system holding PII identified in SE-1 should also appear in CM-8, and a mismatch between the two inventories is itself a finding. SE-2 depends on and extends IR — a privacy incident is first an IR-4 incident, with SE-2 adding the privacy-specific notification and impact-assessment steps on top.

**What sustainment looks like in practice:**
1. The monthly SE-1 PII inventory update (aligned to the CM-8 cadence) is reconciled against the CM-8 general asset inventory, and a discrepancy — a reporting database holding PII exports that wasn't on either list — is corrected on both inventories simultaneously.
2. A security incident declared through the normal IR-4 process is immediately cross-checked against SE-1 inventory to determine whether PII was involved; when it is, the SE-2 privacy-specific notification and impact-assessment track is activated in parallel with the standard IR-6 reporting track, rather than as an afterthought once the technical incident is already closed.

---


#### 3.25 TR — Transparency

**Ongoing/operational controls:** TR-1 (Privacy Notice — periodic review/update), TR-2 (System of Records Notices and Privacy Act Statements — periodic review), TR-3 (Dissemination of Privacy Program Information — periodic).

| Task | Frequency | Responsible Role | Control ID(s) | Source/justification |
|---|---|---|---|---|
| Review/update privacy notices | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual | Privacy Officer | TR-1 | No documented cadence in research file or family file (no NIST XML match); annual default by analogy to -1/documentation-review pattern |
| Review System of Records Notices (SORNs) and Privacy Act statements for currency | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual | Privacy Officer | TR-2 | No documented cadence in research file |
| Disseminate/update privacy program information to stakeholders | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual | Privacy Officer | TR-3 | No documented cadence in research file |

**Artifacts to retain:** privacy notice version history, SORN/Privacy Act statement review records, dissemination records (intranet postings, briefings).

**Deep-Dive Domain Analysis: Transparency**

TR exists to ensure individuals and the public can find out, in accurate and current terms, what PII the organization collects and why — privacy notices, System of Records Notices (SORNs), and Privacy Act statements are the public-facing contract that AP-2's internal purpose specification is supposed to match ([reference scaffold extraction note](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)).

**Common failure modes when TR maintenance lapses:** privacy notices (TR-1) that describe a data-collection practice from several system versions ago, so the publicly stated purpose no longer matches what AP-2/AR-2 internal documentation says the system actually does — a discrepancy that is itself a compliance and trust risk independent of any technical security issue; and SORNs (TR-2) that are never revisited after initial publication even as the underlying system of records evolves.

**Cross-family dependencies:** TR depends directly on AP-2 (purpose specification) and AR-2 (PIA) staying current — TR-1/TR-2 review should always follow, not precede, any AP-2/AR-2 update, since the public notice must describe the internally-authorized practice, not the reverse.

**What sustainment looks like in practice:**
1. Whenever an AP-2 purpose-specification review or AR-2 PIA update identifies a material change in how PII is used, a corresponding TR-1 privacy-notice update is scheduled as a direct follow-on task rather than left to the next independent annual TR cycle.
2. The annual TR-2 SORN review confirms the system of records description still matches current data fields and retrieval methods, catching a case where a new search/query capability had been added without updating the SORN's description of how records are retrieved.

---


#### 3.26 UL — Use Limitation

**Ongoing/operational controls:** UL-1 (Internal Use — periodic review), UL-2 (Information Sharing with Third Parties — periodic review).

| Task | Frequency | Responsible Role | Control ID(s) | Source/justification |
|---|---|---|---|---|
| Review internal use of PII against stated purpose | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual | Privacy Officer, Data Owner | UL-1 | No documented cadence in research file or family file (no NIST XML match); annual default by analogy |
| Review third-party information-sharing agreements for continued compliance | No specific cadence documented — recommend ODP per JSIG tailoring; suggested default: annual, aligned with PS-6/SA-9 agreement-review cadence | Privacy Officer | UL-2 | No documented cadence in research file; annual default by analogy to PS-6/SA-9 |

**Artifacts to retain:** internal-use compliance review records, third-party information-sharing agreements with review dates.

**Deep-Dive Domain Analysis: Use Limitation**

UL exists to ensure PII collected for one stated purpose isn't used or shared beyond that purpose without a fresh, deliberate authorization — it is the ongoing enforcement mechanism for the boundary that AP-1/AP-2 originally established, applied continuously as internal use cases and external sharing requests arise over the system's operational life ([reference scaffold extraction note](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)).

**Common failure modes when UL maintenance lapses:** internal use of PII (UL-1) that expands past its original purpose through informal, undocumented decisions (a report built for one purpose gets repurposed for another without anyone re-checking the use-limitation boundary); and third-party information-sharing agreements (UL-2) that are reviewed once at signing and never revisited even as the receiving party's practices or the shared data's sensitivity change.

**Cross-family dependencies:** UL is the enforcement-side complement to AP (authority/purpose) — AP defines the boundary at collection time, UL enforces it at every subsequent use/sharing decision. UL-2 third-party sharing agreements overlap with SA-9 external-service-provider compliance review and PS-6/PS-7 access-agreement patterns, and should ideally be reviewed on a coordinated cycle with those families to avoid the same external relationship being assessed three separate times under three separate processes.

**What sustainment looks like in practice:**
1. A request to repurpose an existing PII dataset for a new internal analytics use case is routed through a UL-1 use-limitation check against the original AP-2 purpose specification before the repurposing proceeds, catching a case where the new use would have exceeded the original authorized purpose.
2. The annual UL-2 review of third-party information-sharing agreements (aligned with the PS-6/SA-9 cadence) identifies a data-sharing partner whose own privacy practices have materially changed since the agreement was signed, prompting a renegotiation rather than continued sharing under stale terms.


---
## 4. Master Consolidated Calendar

The table below merges every recurring/operational task identified across all 26 families into a single frequency-sorted schedule (continuous → daily → weekly → monthly → quarterly → semi-annual → annual → multi-year/retention). Use this table to seed a GRC tool, shared calendar, or ticketing-system recurrence rule set. Family code is shown for cross-reference to Section 3.

| # | Frequency Tier | Task | Family | Control ID(s) | Responsible Role |
|---|---|---|---|---|---|
| 1 | Continuous | Maintain asset/software inventory (automated) | CM | CM-8, CM-11 | System Administrator |
| 2 | Continuous | Monitor system communications/security dashboards | SI | SI-4 | ISSO / SOC analyst |
| 3 | Continuous | Real-time malware scanning of externally sourced files | SI | SI-3 | System Administrator |
| 4 | Continuous | Maintain IAVM directive compliance | SI | SI-2, RA-5, CA-5 | System Administrator, ISSO |
| 5 | Continuous | Enforce access control/session/least-privilege mechanisms | AC | AC-3, AC-6, AC-11, AC-12 | System Administrator |
| 6 | Continuous | Monitor audit storage capacity and processing-failure alerts | AU | AU-4, AU-5 | System Administrator |
| 7 | Continuous | Enforce boundary protection (firewalls/guards) | SC | SC-7 | Network Administrator |
| 8 | Continuous | Enforce encryption at rest (non-tailorable) | SC | SC-28 | System Administrator |
| 9 | Continuous | Enforce transmission confidentiality/integrity | SC | SC-8 | Network Administrator |
| 10 | Continuous | Enforce reauthentication/session timeout | IA | IA-11 | System Administrator |
| 11 | Continuous | Monitor denial-of-service protections/session authenticity | SC | SC-5, SC-23 | Network Administrator |
| 12 | Continuous | Monitor temperature/humidity environmental controls | PE | PE-14 | Facility Security Officer |
| 13 | Continuous | Operate privacy incident response capability | SE | SE-2 | Privacy Officer, IR Team Lead |
| 14 | Continuous | Handle and monitor for security incidents (24/7) | IR | IR-4, IR-5 | IR Team Lead / CND Team |
| 15 | Continuous | Maintain accounting-of-disclosures log | AR | AR-8 | Privacy Officer |
| 16 | Daily | Check/update malware-tool signatures | SI | SI-3 | System Administrator |
| 17 | Daily (per-event) | Provide incident status updates during active incident | IR | IR-6 | IR Team Lead |
| 18 | Daily (per-event) | Notify account manager on termination/transfer/need-to-know change (8–24 hr window) | AC | AC-2 | System Administrator, Personnel Security |
| 19 | Daily (per-event) | Process termination access-revocation actions (≤24 hr) | PS | PS-4 | Personnel Security Officer |
| 20 | Daily (per-event) | Process transfer access-reassessment actions (≤24 hr) | PS | PS-5 | Personnel Security Officer |
| 21 | Daily (automated check) | Verify system clock/time-stamp synchronization | AU | AU-8 | System Administrator |
| 22 | Weekly | Review and analyze system audit records | AU | AU-6 | ISSO / SOC analyst |
| 23 | Weekly | Run periodic malicious-code (antivirus) scans | SI | SI-3 | System Administrator |
| 24 | Weekly | Perform incremental backups (daily-incremental/weekly-full pattern) | CP | CP-9 | System Administrator |
| 25 | Monthly | Update Plan of Action and Milestones (POA&M) | CA | CA-5 | ISSO |
| 26 | Monthly | Assemble ConMon deliverable package | CA | CA-7, CA-5, CM-8, RA-5 | ISSO |
| 27 | Monthly | Perform vulnerability scanning | RA | RA-5 | System Administrator, ISSO |
| 28 | Monthly | Update scanner vulnerability signatures | RA | RA-5(2) | System Administrator |
| 29 | Monthly | Check/report flaw-remediation (patch) status | SI | SI-2(2) | System Administrator |
| 30 | Monthly | Test backup integrity/restoration | CP | CP-9(1) | System Administrator |
| 31 | Monthly | Review physical access logs | PE | PE-6 | Facility Security Officer |
| 32 | Monthly | Review visitor access records | PE | PE-8 | Facility Security Officer |
| 33 | Monthly | Review Authorized Access List for restricted/SAPF areas | PE | PE-2, PE-3 | Facility Security Officer |
| 34 | Monthly | Convene Configuration Control Board (when changes proposed) | CM | CM-3 | CCB Chair |
| 35 | Monthly | Update system component inventory (manual/verification pass) | CM | CM-8 | System Administrator |
| 36 | Monthly | Maintain organization-level POA&M rollup | PM | PM-4 | ISSM |
| 37 | Monthly | Maintain organization-wide information system inventory | PM | PM-5 | ISSM |
| 38 | Monthly | Monitor nonlocal maintenance session records | MA | MA-4, CA-7 | System Administrator |
| 39 | Monthly | Verify media storage physical/environmental controls | MP | MP-4 | Facility Security Officer |
| 40 | Monthly | Monitor/audit privacy control compliance | AR | AR-4 | Privacy Officer, ISSO |
| 41 | Monthly | Update PII/system-holdings inventory | SE | SE-1 | Privacy Officer, System Administrator |
| 42 | Monthly | Verify security function operation (self-tests) | SI | SI-6 | System Administrator |
| 43 | Monthly | Verify software/firmware/information integrity | SI | SI-7 | System Administrator |
| 44 | Monthly/30 days | Install security-relevant software/firmware updates | SI | SI-2 | System Administrator |
| 45 | Monthly/quarterly | Report information security performance measures | PM | PM-6 | ISSM |
| 46 | Quarterly | Review privileged account list and entitlements | AC | AC-2 | ISSO |
| 47 | Quarterly | Reassess least-privilege/privileged-function assignments | AC | AC-6, AC-6(1) | ISSO, CCB |
| 48 | Quarterly | Review authorized software list | CM | CM-7(5) | CCB, System Administrator |
| 49 | Quarterly | Reassess/reevaluate privileged access tied to change | CM | CM-5(5) | CCB, ISSO |
| 50 | Quarterly | Review unsupported system components (EOL/EOS) | SA | SA-22 (non-tailorable) | System Administrator |
| 51 | Quarterly | Verify encryption-at-rest compliance | SC | SC-28 (non-tailorable) | System Administrator |
| 52 | Quarterly | Verify transmission encryption compliance | SC | SC-8 | Network Administrator |
| 53 | Quarterly | Distribute quarterly security/privacy awareness reminders | AT | AT-2 (supplemental) | Training Manager |
| 54 | Quarterly | Review remote access and wireless access authorization lists | AC | AC-17, AC-18 | Network Administrator |
| 55 | Quarterly | Review publicly accessible content | AC | AC-22 | ISSO |
| 56 | Quarterly | Review access-enforcement/flow-enforcement rule sets | AC | AC-3, AC-4 | Network Administrator, ISSO |
| 57 | Quarterly | Verify device identification/authentication configuration | IA | IA-3 | Network Administrator |
| 58 | Quarterly | Verify configuration settings against baseline/STIG | CM | CM-6 | System Administrator, Network Administrator |
| 59 | Quarterly | Review protection of audit tools/information | AU | AU-9 | ISSO |
| 60 | Quarterly | Review media access authorization list | MP | MP-2 | ISSO |
| 61 | Quarterly | Verify media marking compliance | MP | MP-3 | System Administrator |
| 62 | Quarterly | Review transmission medium/output device access controls | PE | PE-4, PE-5 | System Administrator |
| 63 | Quarterly | Review data quality of PII holdings | DI | DI-1 | Data Owner, Privacy Officer |
| 64 | Quarterly | Track and report privacy complaint trends | IP | IP-4 | Privacy Officer |
| 65 | Quarterly | Review boundary-protection rule set | SC | SC-7 | Network Administrator |
| 66 | Quarterly | Review spam protection mechanism effectiveness | SI | SI-8 | System Administrator |
| 67 | Semi-annual | Review non-privileged/user account list | AC | AC-2 | ISSO |
| 68 | Semi-annual | Test/exercise incident response capability (SAP default) | IR | IR-3 | IR Team Lead |
| 69 | Semi-annual | Review inventory records for computers/removable media (IRS-analog practice) | CM | CM-8 (supplemental) | System Administrator |
| 70 | Annual | Review/update baseline configuration | CM | CM-2 | System Administrator, Network Administrator |
| 71 | Annual | Review/update all family policies and procedures (-1 controls) | All 26 | AC-1, AT-1, AU-1, CA-1, CM-1, CP-1, IA-1, IR-1, MA-1, MP-1, PE-1, PL-1, PS-1, RA-1, SA-1, SC-1, SI-1 | ISSM |
| 72 | Annual | Review/update contingency plan | CP | CP-2 | ISSM |
| 73 | Annual | Test/exercise contingency plan | CP | CP-4 | ISSM, System Administrator |
| 74 | Annual | Perform independent security control assessment | CA | CA-2 | SCA/SCAR |
| 75 | Annual | Perform penetration testing | CA | CA-8 | SCA/SCAR, ISSM |
| 76 | Annual | Review approved maintenance tools | MA | MA-3 | System Administrator, ISSM |
| 77 | Annual | Update/reassess organizational risk assessment | RA | RA-3 | ISSM |
| 78 | Annual | Review/re-sign personnel access agreements | PS | PS-6 | Personnel Security Officer |
| 79 | Annual | Deliver annual security awareness refresher training | AT | AT-2 | Training Manager |
| 80 | Annual | Deliver role-based training refresher | AT | AT-3 | Training Manager |
| 81 | Annual | Deliver incident response training refresher | IR | IR-2 | Training Manager |
| 82 | Annual | Deliver contingency training refresher | CP | CP-3 | Training Manager |
| 83 | Annual | Review/update incident response plan | IR | IR-8 | ISSM |
| 84 | Annual | Review/update auditable events list | AU | AU-2 | ISSM, ISSO |
| 85 | Annual | Review unnecessary functions/ports/protocols/services | CM | CM-7(1) | System Administrator, Network Administrator |
| 86 | Annual | Inventory physical access devices; change combinations/keys | PE | PE-3 | Facility Security Officer |
| 87 | Annual | Review/update System Security Plan (SSP) | PL | PL-2 | ISSM |
| 88 | Annual | Review Rules of Behavior acknowledgment | PL | PL-4 | ISSO, Training Manager |
| 89 | Annual | Review external system service provider compliance | SA | SA-9 | ISSM |
| 90 | Annual | Rotate/manage cryptographic keys | SC | SC-12, SC-13 | System Administrator |
| 91 | Annual | Review security categorization | RA | RA-2 | ISSM |
| 92 | Annual | Review position risk designations | PS | PS-2 | Personnel Security Officer |
| 93 | Annual | Update Privacy Impact Assessment | AR | AR-2 | Privacy Officer |
| 94 | Annual | Review PII minimization opportunities in holdings | DM | DM-1 | Privacy Officer, Data Owner |
| 95 | Annual | Review/update privacy notices, SORNs, and Privacy Act statements | TR | TR-1, TR-2 | Privacy Officer |
| 96 | Annual | Review internal-use and third-party info-sharing compliance | UL | UL-1, UL-2 | Privacy Officer |
| 97 | Annual | Review Configuration Management Plan | CM | CM-9 | ISSM |
| 98 | Annual | Test information system recovery/reconstitution procedures | CP | CP-10 | System Administrator |
| 99 | Annual | Verify alternate storage/processing site and telecom readiness | CP | CP-6, CP-7, CP-8 | ISSM, System Administrator, Network Administrator |
| 100 | Annual | Verify TEMPEST/information-leakage countermeasures (SAP-specific) | PE | PE-19 | Facility Security Officer, ISSM |
| 101 | Annual | Test fire detection/suppression and inspect water-damage risk | PE | PE-13, PE-15 | Facility Security Officer |
| 102 | Annual | Review third-party/contractor personnel security compliance | PS | PS-7 | Personnel Security Officer |
| 103 | Multi-year / retention | Retain audit records offline per NARA schedule or 6–7 years (IRS analog) | AU | AU-11 | System Administrator, ISSM |
| 104 | Multi-year / retention | Prevent identifier reuse for ≥2 years | IA | IA-4 | System Administrator |
| 105 | Multi-year / retention | Ensure every control assessed at least once per 3-year cycle | CA | CA-2 | SCA/SCAR |
| 106 | Multi-year / retention | Retain incident records 3 years after follow-up actions complete | IR | IR/AU retention | ISSM, System Administrator |
| 107 | Multi-year / retention | Retain visitor access records (1–5 years per source) | PE | PE-8 | Facility Security Officer |
| 108 | Multi-year / retention | Execute PII retention/disposal per records schedule | DM | DM-2 | Data Owner, System Administrator |
| 109 | Periodic (DoD/IC cycle) | Track and initiate personnel reinvestigations | PS | PS-3 | Personnel Security Officer |
| 110 | Periodic (facility policy) | Conduct Technical Surveillance Countermeasures Survey | RA | RA-6 | Facility Security Officer, ISSM |

**Total recurring tasks in master calendar: 110.** (Row 71 consolidates the 17 NIST-mapped family -1 policy-review controls into a single annual line item to avoid 17 near-duplicate rows; if tracked individually in a GRC tool, the effective annual policy-review task count is 17 separate entries, one per family, bringing the total trackable line items to 126.)

---

## 5. Getting-Started Implementation Sequencing

Recommended phased rollout for a program implementing this maintenance plan from a cold start (e.g., new ATO, new system, or first formalization of an existing ad hoc process). Each phase assumes the prior phase's outputs are prerequisites.

### Phase 0 — Foundational Documentation (Weeks 1–4)
- Finalize and approve all family "-1" policies and procedures (AC-1, AU-1, CM-1, CP-1, IA-1, IR-1, MA-1, MP-1, PE-1, PL-1, PS-1, RA-1, SA-1, SC-1, SI-1, AT-1, CA-1).
- Approve the System Security Plan (PL-2), Rules of Behavior (PL-4), and Configuration Management Plan (CM-9).
- Stand up the Configuration Control Board (CM-3) and designate ISSM/ISSO/SA/NA/SCA roles formally.

### Phase 1 — Baseline Configuration and Account Management (Weeks 3–8, overlapping Phase 0)
- Establish and document the system baseline configuration (CM-2) before any recurring audit or vulnerability cadence can be meaningfully measured against it.
- Stand up account management processes (AC-2): provisioning, disablement timelines (AC-2(2)/(3)), and initial privileged/non-privileged account review.
- Deploy identification/authentication controls and authenticator issuance (IA-2/IA-4/IA-5) — required before AC-2 reviews are trustworthy.
- Complete initial personnel screening/position risk designation (PS-2/PS-3) and access agreements (PS-6) for all current personnel.

**Rationale:** account and configuration baselines are the substrate that every later audit, vulnerability, and assessment cadence measures against; starting audit review (AU-6) or vulnerability scanning (RA-5) before accounts and baselines are stable produces noisy, low-value findings.

### Phase 2 — Audit, Monitoring, and Vulnerability Management Cadences (Weeks 6–10)
- Turn on audit logging per the auditable-events list (AU-2/AU-3) and begin weekly AU-6 review.
- Deploy vulnerability scanning tooling and begin monthly RA-5 scans; establish SI-2 patch-management workflow and SI-3 malware protection.
- Begin monthly CM-8 inventory reconciliation.
- Stand up the POA&M process (CA-5) to capture findings from the above as they start generating results.

### Phase 3 — Physical, Personnel, and Media Controls (Weeks 8–12, overlapping Phase 2)
- Finalize physical access authorization lists (PE-2), device inventories (PE-3), and begin monthly PE-6/PE-8 log reviews.
- Finalize media protection procedures (MP-2 through MP-7).
- Complete Phase 1 personnel security actions for any remaining personnel; begin PS-4/PS-5 event-driven processes.

### Phase 4 — Contingency, Incident Response, and Training Program (Weeks 10–16)
- Finalize and table-top-test the contingency plan (CP-2/CP-4) and backup procedures (CP-9), building on the stable baseline from Phase 1.
- Finalize and exercise the incident response plan (IR-3/IR-8); this depends on AU-6/SI-4 monitoring from Phase 2 being operational so incidents can actually be detected.
- Roll out initial and annual security awareness (AT-2) and role-based training (AT-3) program-wide.

### Phase 5 — Independent Assessment and Continuous ATO Operations (Weeks 14–20+)
- Schedule the first independent security control assessment (CA-2) and, if required, penetration test (CA-8) — these should occur only after Phases 1–4 controls have at least one full cycle of operating evidence.
- Formalize the monthly ConMon package (CA-7 pattern) merging POA&M, inventory, and scan results generated since Phase 2.
- Brief the AO on initial security posture and transition into steady-state operation of the master calendar in Section 4.

### Phase 6 — Privacy Program Integration (Weeks 12–20, parallel to Phases 3–5 where privacy data is in scope)
- Stand up Appendix J privacy controls (AP, AR, DI, DM, IP, SE, TR, UL) if the system processes PII: PIA (AR-2), PII inventory (SE-1), retention/disposal schedule (DM-2), and privacy notices (TR-1/TR-2) should be finalized before the first annual review cycle in Phase 5.

### Steady State (Month 5 onward)
- Operate strictly against the Section 4 master calendar; ISSM conducts a semiannual sanity check that all "no specific cadence documented" ODP defaults in Section 3 have been formally tailored/approved rather than left as placeholders.

---

## 6. Risks and Gaps

This scaffold and plan were built primarily from the JSIG table of contents and the NIST SP 800-53 Rev. 4 XML catalog because direct downloads of the full JSIG PDF returned HTTP 403 errors, and the document-aware fetcher used during scaffold construction only returned the early portion of the parsed JSIG document text ([EXTRACTION-LIMITATIONS.md](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)). As a direct consequence, the following require **manual verification against the primary JSIG PDF** before this plan is used as an authoritative compliance artifact in an actual ATO package:

1. **Exact JSIG organization-defined parameter (ODP) values for most controls and enhancements.** Only a small number of ODPs were confirmed directly from JSIG extraction notes embedded in the family files (e.g., AC-2 account-review/disablement timelines, AC-6(1) non-tailorable status). Every cadence in Section 3 marked "no specific cadence documented — recommend ODP per JSIG tailoring" is a reasoned default from FedRAMP/IRS/DoD/GSA analogues, **not a verified JSIG value**, and must be checked against the JSIG body text (`EXTRACTION-LIMITATIONS.md`).
2. **JSIG SAP-specific supplemental guidance text boxes per family.** These often contain the actual required cadence, evidence format, or SAP-unique procedural nuance (e.g., PE-19 TEMPEST countermeasure review cycles, RA-6 TSCM survey frequency) that this plan could not extract and instead flagged as high-priority manual-verification items in Sections 3.11 and 3.14.
3. **Appendix C baseline-membership tables by impact/confidentiality level.** Without these, this plan cannot confirm which control enhancements are mandatory versus optional at a given SAP confidentiality impact level, which affects whether some Section 3 tasks (e.g., AC-6(1), enhancement-level reviews) apply uniformly or only above a threshold.
4. **Appendix B/E acronym and definitions tables.** Full definitions were not available to disambiguate some JSIG-specific terms used in family extraction notes; this is a lower-risk gap but should be closed before external distribution of this plan.
5. **The eight Appendix J privacy families (AP, AR, DI, DM, IP, SE, TR, UL) have no NIST Rev. 4 XML baseline at all** — every cadence in Sections 3.19–3.26 is a reasoned analogy to NIST-mapped family patterns, not sourced from either the JSIG PDF or the research file, and carries the highest verification priority of any section in this plan.
6. **The research file itself is scoped to NIST SP 800-53 Rev. 4/RMF programs and explicitly states JSIG does not publish universal cadences** ([DCSA JSIG 2016](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf); [NIST SP 800-53 Rev. 4](https://nvlpubs.nist.gov/nistpubs/specialpublications/nist.sp.800-53r4.pdf); [NIST SP 800-137](https://nvlpubs.nist.gov/nistpubs/legacy/sp/nistspecialpublication800-137.pdf)) — meaning every FedRAMP/IRS/DoD/GSA-sourced cadence in this plan is a **documented proxy**, appropriate for initial program design, but subject to being tightened or loosened once the authoritative JSIG ODP is confirmed by the ISSM/AO.
7. **Controls without a NIST Rev. 4 XML match even within the 18 non-privacy families** (e.g., AC-9, AC-13, AC-15, AC-16, AC-23–25 in the AC family; several PM controls) were noted in the family files as "Not listed in NIST XML / verify" — these should be reviewed for whether they carry independent maintenance obligations not captured in this plan's cadence tables.

**Recommended remediation for these gaps:** obtain a complete, unrestricted copy of the JSIG PDF (2016-04-11, Rev. 4) directly from the ISSM's document library rather than the public DCSA URL, extract the ODP tables and supplemental-guidance text boxes for all 26 families, and reissue this plan with verified values superseding every "no specific cadence documented" placeholder.

---

## 7. Document Control

| Field | Value |
|---|---|
| Plan title | JSIG System Administration Maintenance Plan |
| Source scaffold | `reference/JSIG/control-families/` (26 family files + INDEX.md) |
| Source research | `reference/research/operational-maintenance-schedules-research.md` |
| Known limitations | `reference/JSIG/appendices/EXTRACTION-LIMITATIONS.md` |
| Status | Draft — pending JSIG ODP verification per Section 6 |
| Next review | Upon completion of Section 6 remediation, or annually thereafter (see row 71 of Section 4) |
