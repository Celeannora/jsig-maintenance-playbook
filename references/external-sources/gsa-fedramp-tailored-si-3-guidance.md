# GSA FedRAMP Tailored — SI-3 Malicious Code Protection Guidance (GitHub) (Excerpt)

- **Source URL:** https://github.com/GSA/fedramp-tailored/blob/master/_guidance/controls/SI-3.md
- **Retrieved:** 2026-07-17
- **Why included:** Supports the research file's SI-3 malicious-code-protection cadence claim: the concrete "at least weekly" periodic scan frequency for Low/Moderate systems (an interpretive gloss the FedRAMP Tailored guidance adds on top of the base control's [Assignment: organization-defined frequency] parameter) plus the "whenever new releases are available" signature/update cadence.

> **NOTE:** This page (from the archived GSA/fedramp-tailored GitHub repository) was retrieved in full (87 lines, ~8.6 KB) — no excerpting was required. The repository itself was archived (read-only) by GSA on May 16, 2022; the content reflects FedRAMP Tailored SI-3 guidance as last updated November 9, 2017.

---

## SI-3 Control Requirement (base control)

The organization:
(a) Employs malicious code protection mechanisms at information system entry and exit points to detect and eradicate malicious code;
(b) Updates malicious code protection mechanisms **whenever new releases are available** in accordance with organizational configuration management policy and procedures;
(c) Configures malicious code protection mechanisms to:
   (1) Perform periodic scans of the information system [Assignment: organization-defined frequency] and real-time scans of files from external sources at endpoint/network entry-exit points as files are downloaded, opened, or executed; and
   (2) Block malicious code, quarantine malicious code, or send alert to administrator in response to malicious code detection; and
(d) Addresses the receipt of false positives during malicious code detection and eradication and the resulting potential impact on availability.

## SI-3(c) Control Objective — FedRAMP's "At Least Weekly" Interpretation

> "The objective/intent of this part (c) of this control is to ensure that the CSP is aware that the FedRAMP requirements for a Low or Moderate system: Describe how the organization configures malicious code protection mechanisms to perform periodic scans of the information system **at least weekly** and real-time scans of files from external sources at to include endpoints, as the files are downloaded, opened, or executed in accordance with organizational security policy."

### SI-3(c) "Write the Control" Guidance (for Low or Moderate systems)

> "(Verb) Describe how the organization (verb) configures (noun) malicious code protection mechanisms to (verb) perform (adjective) periodic (noun) scans of the information system (i) **at least weekly** and (ii) real-time scans of files from external sources to include endpoints, as the files are either downloaded, opened, or executed in accordance with organizational security policy."

## SI-3(b) — Update Cadence Guidance

> "When speaking about 'updates' to 'malicious code protection mechanisms' this most often refers to malicious code protection mechanisms installed on all devices to include antivirus software that is kept current with antivirus signatures and repudiation-based technologies... Explain how this is integrated into the organizational configuration management policy and procedures."

Updates occur **whenever new releases are available**, per the base control statement — i.e., event-driven rather than fixed-interval, though in practice this is typically implemented as at-least-daily automated signature updates (see the IRS Publication 1075 and FedRAMP SSP Appendix A excerpts elsewhere in this directory for the daily/weekly concrete implementations).

---

*End of excerpt. Full source: https://github.com/GSA/fedramp-tailored/blob/master/_guidance/controls/SI-3.md*
