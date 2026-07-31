# Information System Security Officer (ISSO) — Operational Playbook

> Network-agnostic role playbook. Applies regardless of network architecture, classification enclave, or technology stack. Source: [JSIG §1.5.15](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md), cross-referenced to [MAINTENANCE-PLAN.md](../../MAINTENANCE-PLAN.md) and the [JSIG control-families INDEX](../../reference/JSIG/control-families/INDEX.md).

## 1. Role Summary

An ISSO is an individual responsible for ensuring the appropriate operational security posture is maintained for an information system, working in close collaboration with the ISSM and ISO. The ISSO is appointed in writing by the responsible site authority (e.g., ISSM, Commander, Commanding Officer, PM, CIO, PSO, or corporate equivalent) and typically holds day-to-day security-operations responsibility, including physical/environmental protection, personnel security, incident handling, and security training/awareness — while also actively monitoring the system and its environment, including SSP updates and change management ([JSIG §1.5.15](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).

## 2. JSIG-Defined Responsibilities (verbatim, JSIG §1.5.15)

Responsibilities of the ISSO include, but are not limited to:
- a. Assist the ISSM in meeting their duties and responsibilities. The ISSO shall assume ISSM responsibilities in the absence of the ISSM;
- b. Ensure systems are operated, maintained, and disposed of in accordance with security policies and procedures as outlined in the security authorization package;
- c. Attend required technical and security training (e.g., operating system, networking, security management) relative to assigned duties;
- d. Maintain required IA certifications;
- e. Ensure all users have the requisite security clearances, authorization, need-to-know, and are aware of their security responsibilities before granting access to the IS;
- f. Report all security-related incidents to the ISSM;
- g. Conduct periodic reviews of information systems to ensure compliance with the security authorization package;
- h. Serve as member of the CCB, if designated by the ISSM;
- i. Coordinate any changes or modifications to hardware, software, or firmware of a system with the ISSM and AO/DAO prior to the change;
- j. Formally notify the ISSM and AO/DAO when changes occur that might affect system authorization;
- k. Monitor system recovery processes to ensure security features and procedures are properly restored and functioning correctly;
- l. Ensure all IS security-related documentation is current and accessible to properly authorized individuals; and
- m. Ensure audit records are collected, reviewed, and documented (to include any anomalies).

## 3. Daily/Recurring Operational Duties

Derived/synthesized from the [MAINTENANCE-PLAN.md master calendar](../../MAINTENANCE-PLAN.md#4-master-consolidated-calendar) and family sections; not verbatim JSIG text. The ISSO carries the largest share of day-to-day/weekly recurring execution in this plan.

| Recurring Duty | Cadence | Related Control Family/ID(s) | Basis |
|---|---|---|---|
| Review and analyze system audit records (anomaly disposition) | At least weekly | AU-6 | [JSIG §1.5.15(m)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md); [MAINTENANCE-PLAN §3.3 AU](../../MAINTENANCE-PLAN.md) |
| Monitor system/security dashboards for indicators of compromise | Continuous | SI-4 | [MAINTENANCE-PLAN §4, row 2](../../MAINTENANCE-PLAN.md#4-master-consolidated-calendar) |
| Update Plan of Action and Milestones (POA&M) | At least monthly | CA-5 | [MAINTENANCE-PLAN §3.4 CA](../../MAINTENANCE-PLAN.md) |
| Assemble monthly continuous-monitoring (ConMon) deliverable package | Monthly | CA-7, CA-5, CM-8, RA-5 | [MAINTENANCE-PLAN §3.4 CA](../../MAINTENANCE-PLAN.md) |
| Perform/coordinate vulnerability scanning and track remediation | Monthly minimum | RA-5 | [MAINTENANCE-PLAN §3.14 RA](../../MAINTENANCE-PLAN.md) |
| Review privileged and non-privileged account lists | Quarterly (privileged) / semiannual (non-privileged) | AC-2 | [MAINTENANCE-PLAN §3.1 AC](../../MAINTENANCE-PLAN.md) |
| Ensure all users hold requisite clearance, authorization, and need-to-know before granting access | Per-access-request (event-driven), reviewed at each account-review cycle | AC-2, PS-6 | [JSIG §1.5.15(e)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md); [MAINTENANCE-PLAN §3.1 AC](../../MAINTENANCE-PLAN.md), [§3.13 PS](../../MAINTENANCE-PLAN.md) |
| Report all security-related incidents to the ISSM; monitor/handle incidents | Continuous monitoring; per-event reporting (within 24 hours of discovery, per plan default) | IR-4, IR-5, IR-6 | [JSIG §1.5.15(f)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md); [MAINTENANCE-PLAN §3.8 IR](../../MAINTENANCE-PLAN.md) |
| Conduct periodic reviews of the IS for compliance with the security authorization package | Recommend quarterly (no fixed JSIG cadence documented) | PL-2, CA-6 | [JSIG §1.5.15(g)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md); [MAINTENANCE-PLAN §3.12 PL](../../MAINTENANCE-PLAN.md) |
| Serve as CCB member (if designated by the ISSM) and coordinate hardware/software/firmware changes with the ISSM and AO/DAO prior to implementation | Monthly, when changes are proposed | CM-3 | [JSIG §1.5.15(h)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md), [(i)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md); [MAINTENANCE-PLAN §3.5 CM](../../MAINTENANCE-PLAN.md) |
| Formally notify the ISSM and AO/DAO of changes that might affect authorization | Event-driven | CM-4, CA-6 | [JSIG §1.5.15(j)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md); [MAINTENANCE-PLAN §3.5 CM](../../MAINTENANCE-PLAN.md) |
| Review physical access logs and visitor access records (where ISSO holds this duty locally) | Monthly | PE-6, PE-8 | [MAINTENANCE-PLAN §3.11 PE](../../MAINTENANCE-PLAN.md) |
| Review media access authorization list and media-use restrictions | Quarterly | MP-2, MP-7 | [MAINTENANCE-PLAN §3.10 MP](../../MAINTENANCE-PLAN.md) |
| Review protection of audit tools/information for tampering | Quarterly | AU-9 | [MAINTENANCE-PLAN §3.3 AU](../../MAINTENANCE-PLAN.md) |
| Review remote/wireless access authorization lists and publicly accessible content | Quarterly | AC-17, AC-18, AC-22 | [MAINTENANCE-PLAN §3.1 AC](../../MAINTENANCE-PLAN.md) |
| Monitor system recovery processes after outages/incidents to confirm security features properly restored | Per-event (continuous readiness) | CP-10, IR-4 | [JSIG §1.5.15(k)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md); [MAINTENANCE-PLAN §3.6 CP](../../MAINTENANCE-PLAN.md) |
| Ensure IS security-related documentation remains current and accessible to authorized individuals | Ongoing/continuous, formally re-verified at each SSP annual review | PL-2 | [JSIG §1.5.15(l)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md); [MAINTENANCE-PLAN §3.12 PL](../../MAINTENANCE-PLAN.md) |
| Attend required technical/security training; maintain IA certifications | Annual refresh | AT-3 | [JSIG §1.5.15(c)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md), [(d)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md); [MAINTENANCE-PLAN §3.2 AT](../../MAINTENANCE-PLAN.md) |
| Assume ISSM responsibilities in the ISSM's absence | As needed (continuous contingency coverage) | Same duties as ISSM (see [ISSM.md](./ISSM.md)) | [JSIG §1.5.15(a)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md) |

## 4. Coordination Interfaces

- **ISSM:** assists the ISSM in meeting duties, assumes ISSM responsibilities in their absence, reports all security incidents to the ISSM, and coordinates all hardware/software/firmware changes with the ISSM before implementation ([JSIG §1.5.15(a)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md), [(f)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md), [(i)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **Authorizing Official (AO)/DAO:** coordinates proposed changes prior to implementation and formally notifies AO/DAO of changes that might affect system authorization ([JSIG §1.5.15(i)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md), [(j)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **Information System Owner (ISO):** works in close collaboration on system monitoring, SSP updates, and change management ([JSIG §1.5.15](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **Configuration Control Board (CCB):** serves as a member if designated by the ISSM ([JSIG §1.5.15(h)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **Users (Privileged and General):** verifies clearance/authorization/need-to-know and awareness of security responsibilities before granting access ([JSIG §1.5.15(e)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).

## 5. Key Artifacts Owned/Produced

- Weekly audit-review logs/sign-offs with findings disposition.
- Monthly POA&M updates and ConMon package contributions.
- Incident tickets/logs and ISSM notification records.
- Periodic compliance-review records against the security authorization package.
- CCB change-coordination records and AO/DAO change notifications.
- Current, accessible IS security-related documentation repository.
- Training/certification records demonstrating currency.
