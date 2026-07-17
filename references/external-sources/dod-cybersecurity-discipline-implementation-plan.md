# DoD Cybersecurity Discipline Implementation Plan (Excerpt)

- **Source URL:** https://dodcio.defense.gov/portals/0/documents/cyber/cyberdis-impplan.pdf
- **Retrieved:** 2026-07-17
- **Why included:** Supports the research file's claims regarding IAVA patch compliance cadence (servers/network infrastructure devices must comply with all *current* IAVA patch releases), quarterly review of Internet-facing assets, and the four Lines of Effort (Strong Authentication, Device Hardening, Reduce Attack Surface, CNDSP Alignment) that anchor DoD-side patching/hardening cadence discipline referenced alongside STIG and IAVM cadence claims.

> **NOTE — THIS IS AN EXCERPT, NOT THE COMPLETE DOCUMENT.** The plan (October 2015, amended February 2016) runs to roughly 25 pages including Appendices A–D (References, Acronyms, Order of Priority/Task Accomplishment, and a Crosswalk with DoD Cybersecurity Requirements/Scorecard). This document was retrieved directly via `dodcio.defense.gov`, which blocks generic HTTP clients (returns HTTP 403) but was successfully retrieved via a document-aware fetch. Only the Executive Summary, Introduction, Background, and the portions of Lines of Effort 1–3 most relevant to patch/inspection cadence are reproduced below. **Note:** the specific "21-day IAVA patch release" and "120-day overdue removal" figures referenced in some secondary summaries of DoD cybersecurity discipline policy were not found verbatim in the retrieved text of this particular document (they may originate from a related USCYBERCOM TASKORD, the IAVM program instruction (CJCSM 6510.02), or a different DoD cybersecurity policy document) — this should be treated as unconfirmed against the primary source until verified against the full PDF or the underlying CJCSM 6510.02 IAVM instruction. For the complete document, download the PDF from the source URL above.

---

## Executive Summary (relevant excerpt)

"Cyber defense of DoD systems is [my] highest cyber priority; if DoD systems are not dependable in the face of cyber warfare, all other DoD missions are at risk." — Secretary of Defense Ashton Carter, April 18, 2015

Inspections and incidents across the Department of Defense (DoD) reveal a need to reinforce basic cybersecurity requirements identified in policies, directives, and orders. As part of the Campaign, this Implementation Plan is grouped into four Lines of Effort:

1. **Strong authentication** – to degrade the adversaries' ability to maneuver on DoD information networks;
2. **Device hardening** – to reduce internal and external attack vectors into DoD information networks;
3. **Reduce attack surface** – to reduce external attack vectors into DoD information networks; and
4. **Alignment to cybersecurity / computer network defense service providers** – to improve detection of and response to adversary activity.

Commanders and Supervisors at all levels will report their status with these requirements via the Defense Readiness Reporting System (DRRS).

## Background (relevant excerpt)

Inspections, reports, and lessons learned from recent intrusions have revealed Department-wide systemic shortfalls in implementing the basic cybersecurity requirements. These requirements are established in DoD issuances, USCYBERCOM tasking orders (TASKORDs), Information Assurance Vulnerability Alerts (IAVAs), and DISA Security Requirements Guides (SRGs) and Security Technical Implementation Guides (STIGs).

## Line of Effort 2: Device Hardening — Task 2.6 (IAVA Patch Compliance)

**Task 2.6:** Commanders and Supervisors will ensure all servers and network infrastructure devices (e.g., IDS, routers, RAS, NAS, firewalls) are compliant with **all current (i.e., those that have not been rescinded or superseded) IAVA patch releases**.

> Inspections reflect an unacceptable number of unpatched vulnerabilities. The IAVM program is responsible for releasing IAVAs, ensuring an integrated capability to improve continually the Department's ability to identify and respond rapidly to vulnerabilities that adversely affect DoD servers and network infrastructure devices.

a. Are all servers and network infrastructure devices compliant with all current IAVA patch releases?
   - If yes, then Achieved.
   - **If no, or if the status is unknown, then Not Achieved.**

## Line of Effort 3: Reduce Attack Surface — Task 3.1 (Quarterly Review Cadence)

**Task 3.1:** Commanders and Supervisors will review all Internet-facing assets to ensure they are hosted in a DoD DMZ and disconnect all Internet-facing web servers and web applications without an operational requirement.

> Commanders and Supervisors will **review and report Internet-facing assets at least quarterly**; remove Internet-facing assets that no longer have a mission requirement from the network; and, for the remaining Internet-facing assets, verify that accessibility to/from the Internet is still required to support the mission.

b. Has the operational requirement for all Internet-facing servers and web applications that have access to/from the Internet been **validated within the last three months**?
   - If yes, then Achieved.
   - If no, then Not Achieved.

## Device Hardening Program References (context)

The Department has instituted various means to mitigate device vulnerabilities, including STIGs, the Information Assurance Vulnerability Management (IAVM) program, and the security controls adopted from NIST 800-53 in coordination with CNSSI 1253 within the DoD Risk Management Framework (RMF). Per DoDI 8510.01, "IT products... will be configured in accordance with applicable STIGs under a cognizant [Information System Security Manager] and security control assessor." CJCSM 6510.02 outlines the IAVM program and its requirements, including that "[Combatant Commands/Services/Agencies/Field Agencies] are responsible for ensuring all affected assets under their purview are compliant with IAVA directives."

---

*End of excerpt. Full source: https://dodcio.defense.gov/portals/0/documents/cyber/cyberdis-impplan.pdf*
