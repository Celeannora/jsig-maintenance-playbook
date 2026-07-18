# Escalation Matrix — Severity, SLA, and Escalation Chain

> Applies to every recurring task runbook and every Variance/Risk-Acceptance record in this execution plan. When in doubt about whether a finding or missed check is severe enough to escalate, **escalate anyway** — the cost of an unnecessary escalation is far lower than the cost of a missed one (PagerDuty incident-response convention).

## 1. Severity Definitions

| Severity | Definition | Maps To |
|---|---|---|
| CAT I / Critical / High | Allows immediate unauthorized access, loss of confidentiality/integrity/availability, or direct compromise of the system | STIG severity `high`; control-family findings assessed as highest risk |
| CAT II / Moderate | Has a significant but not immediately catastrophic impact | STIG severity `medium` |
| CAT III / Low | Degrades security posture but has minimal immediate impact | STIG severity `low` |

## 1a. CVE / CVSS Severity Mapping (Nessus and other CVE-based findings)

For findings identified by CVE ID (typically from a Nessus vulnerability scan, as opposed to a STIG compliance-audit finding) rather than a STIG Vulnerability ID, the same CAT tiers apply, mapped from the CVSS Base Severity published by the [National Vulnerability Database](https://nvd.nist.gov/vuln/detail) for that CVE. Use the highest-version CVSS metric NVD publishes for the CVE (prefer 3.1, then 3.0, then 2.0) — never re-derive a CVSS score by hand.

| CVSS Base Severity | Maps To | Note |
|---|---|---|
| CRITICAL (9.0–10.0) | CAT I | |
| HIGH (7.0–8.9, or CVSS v2 HIGH) | CAT I | |
| MEDIUM (4.0–6.9, or CVSS v2 MEDIUM) | CAT II | |
| LOW (0.1–3.9, or CVSS v2 LOW) | CAT III | |
| No CVSS score published yet | **CAT I (provisional)** | Fails closed to the most conservative tier until a human confirms actual severity — never silently treated as low-priority |

This mapping is applied automatically by `execution-plan/tools/cve_reference_builder.py` when it caches a CVE's official NVD record, and is then read as-is by `generate_variance.py` — see Section 6 below for the CISA KEV escalation rule layered on top of this base mapping.

## 2. Remediation / Re-Review SLA by Severity

| Severity | Remediation or Formal Risk-Decision Window | Basis |
|---|---|---|
| CAT I / Critical / High | **30 days** | [FedRAMP POA&M Template](https://www.fedramp.gov/resources/templates/FedRAMP-POAM-Template.xlsx) remediation window for Critical/High findings |
| CAT II / Moderate | **90 days** | [FedRAMP POA&M Template](https://www.fedramp.gov/resources/templates/FedRAMP-POAM-Template.xlsx) remediation window for Moderate findings |
| CAT III / Low | **180 days** | [FedRAMP POA&M Template](https://www.fedramp.gov/resources/templates/FedRAMP-POAM-Template.xlsx) remediation window for Low findings |

These windows apply whether the eventual decision is remediation, a compensating control, or a formal risk acceptance — the clock is on reaching a *documented decision*, not only on technical remediation.

## 3. Control-Testing Cadence (Independent of Individual Findings)

| Requirement | Cadence | Basis |
|---|---|---|
| Minimum share of controls tested annually | At least one-third of all controls | [DCSA DoD SAP PM Handbook](https://www.dcsa.mil/Portals/91/Documents/CTP/special/DoD_SAP_PM_Handbook_JSIG_RMF_2015Aug11.pdf) |
| Every control tested at least once | Within each 3-year authorization cycle | [DCSA DoD SAP PM Handbook](https://www.dcsa.mil/Portals/91/Documents/CTP/special/DoD_SAP_PM_Handbook_JSIG_RMF_2015Aug11.pdf) |
| Critical/volatile controls | Quarterly to semiannually | [DCSA DoD SAP PM Handbook](https://www.dcsa.mil/Portals/91/Documents/CTP/special/DoD_SAP_PM_Handbook_JSIG_RMF_2015Aug11.pdf) |
| Incident response plan testing | Annual (Moderate systems); every 6 months functional (High systems) | FedRAMP IR testing conventions, `research/operational-runbook-and-artifact-standards.md` §5 |
| Contingency plan testing | Annual functional (Moderate/High); every 3 years tabletop (Low) | FedRAMP contingency testing conventions, `research/operational-runbook-and-artifact-standards.md` §5 |

## 4. Escalation Chain

1. **Preparer/finder** identifies the issue and opens the runbook or variance record. If unsure whether it rises to a reportable finding, treat it as one and let the reviewer downgrade it — never suppress at this stage.
2. **First-line reviewer** (role varies by task — see the task's own RACI in Section 4 of its runbook) confirms the finding and severity within 1 business day of detection.
3. **Escalation Owner** (ISSM by default, unless the task's runbook names a different Escalation Owner) is notified immediately for CAT I/Critical findings, and at the next standing review for CAT II/III.
4. If the SLA in Section 2 is at risk of being missed, the Escalation Owner formally notifies the Accountable role (see the task's RACI) **before** the deadline, not after.
5. For findings requiring a Configuration/Change Control Board (CCB) decision, the CCB disposes of the request as **Approved / Not Approved / On Hold** — an "On Hold" disposition still counts as a decision milestone and restarts a short internal review clock, not the full SLA.
6. Missed SLAs escalate one level up the accountable chain automatically (e.g., ISSM-owned decision that misses its window escalates to the AO/DAO) and must be documented as a finding against the process itself, not just the original technical issue.

## 5. Incident Command Pattern (for active security incidents, as opposed to routine findings)

For an active incident (as distinct from a routine compliance finding), one person is designated Incident Commander for the duration of the response, with clear delegation of communications and technical-response roles — mirroring the standard Incident Commander delegation model. "If unsure, trigger anyway": declaring an incident that turns out to be minor costs little; failing to declare one that turns out to be major costs a great deal.

## 6. CISA Known Exploited Vulnerabilities (KEV) Escalation Rule (CVE-based findings only)

A CVE's CVSS score measures *potential impact*, not whether it is actually being exploited. If a CVE appears on [CISA's Known Exploited Vulnerabilities (KEV) catalog](https://www.cisa.gov/known-exploited-vulnerabilities-catalog), treat that as an independent, higher-priority escalation signal layered on top of the CVSS-derived CAT tier from Section 1a — never let a lower CVSS score override active-exploitation status.

**Rule (zero-judgment, mechanical):**

1. If the CVE's official NVD record carries a `cisaExploitAdd` date (i.e., it is KEV-listed), the finding's CAT tier is escalated to **CAT I at minimum**, regardless of what its CVSS Base Severity alone would map to in Section 1a. This is a floor, not a ceiling — never downgrade a CVSS-CRITICAL finding just because it isn't KEV-listed.
2. NVD also republishes CISA's own **`cisaActionDue`** date and **`cisaRequiredAction`** text directly on the CVE record — `cve_reference_builder.py` captures both verbatim. Surface these to the preparer as-is in the generated record; do not recompute a due date from CVSS alone for a KEV-listed finding.
3. If `cisaActionDue` has already passed relative to today, the finding is **already overdue** against CISA's own published deadline and must be flagged for immediate escalation per Section 4 above, independent of the 30/90/180-day SLA math in Section 2.
4. This tool never attempts to model CISA's newer four-variable risk-tiering scheme (internet exposure, confirmed exploitation, exploit automation, technical impact) introduced by BOD 26-04 (below) — those inputs are asset-specific facts only a human preparer can supply, consistent with this tool's rule of never fabricating asset-specific facts. The mechanical floor in step 1, plus CISA's own published per-entry due date in step 2, is the defensible, zero-judgment substitute.

**Regulatory basis and status (current as of this writing):** [CISA Binding Operational Directive 22-01](https://www.cisa.gov/news-events/directives/bod-22-01-reducing-significant-risk-known-exploited-vulnerabilities) (issued November 3, 2021) established the KEV catalog and originally required U.S. federal civilian executive branch (FCEB) agencies to remediate each listed CVE by a fixed per-entry due date (historically often 14 days for new entries). On **June 10, 2026**, CISA issued a successor directive, **BOD 26-04**, which **revokes BOD 22-01** and replaces its flat KEV timeline with a four-variable risk model (internet exposure, confirmed active exploitation, exploit automation, and technical impact) assigning remediation windows from as little as 3 days up to longer/deferred windows depending on those factors ([Cybersecurity Dive](https://www.cybersecuritydive.com/news/cisa-vulnerability-remediation-prioritization-directive/822504/)). FCEB agencies must have updated internal policy by August 9, 2026 and begin implementing the new timelines by December 7, 2026. The KEV catalog itself, and its per-entry `cisaActionDue` field surfaced through the NVD API, continue to exist independent of which BOD interprets them — this tool relies on that stable, official per-entry field rather than trying to re-implement either directive's specific day-count logic.

---

**Sources:**
- [FedRAMP POA&M Template](https://www.fedramp.gov/resources/templates/FedRAMP-POAM-Template.xlsx)
- [DCSA DoD SAP PM Handbook](https://www.dcsa.mil/Portals/91/Documents/CTP/special/DoD_SAP_PM_Handbook_JSIG_RMF_2015Aug11.pdf)
- [NVD CVE API 2.0](https://nvd.nist.gov/developers/vulnerabilities) (CVSS scoring source for CVE-based findings)
- [CISA KEV Catalog](https://www.cisa.gov/known-exploited-vulnerabilities-catalog)
- [CISA BOD 22-01](https://www.cisa.gov/news-events/directives/bod-22-01-reducing-significant-risk-known-exploited-vulnerabilities) (historical — established the KEV catalog; revoked June 10, 2026)
- [Cybersecurity Dive: CISA gives agencies new vulnerability remediation priorities](https://www.cybersecuritydive.com/news/cisa-vulnerability-remediation-prioritization-directive/822504/) (BOD 26-04, current as of June 10, 2026)
- `research/operational-runbook-and-artifact-standards.md` §5 (Escalation/exception patterns, full citation list)
