# Information System Security Manager (ISSM) — Operational Playbook

> Network-agnostic role playbook. Applies regardless of network architecture, classification enclave, or technology stack. Source: [JSIG §1.5.14](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md), cross-referenced to [MAINTENANCE-PLAN.md](../../MAINTENANCE-PLAN.md) and the [JSIG control-families INDEX](../../reference/JSIG/control-families/INDEX.md).

## 1. Role Summary

An ISSM is an individual who serves as the principal advisor on all matters, technical and otherwise, involving the security of information systems under their purview. The ISSM is appointed in writing by the respective chain of command/leadership (e.g., Commander, Commanding Officer, PM, CIO, PSO, or corporate equivalent); ISSM responsibilities should not be assigned as a collateral duty, and the ISSM must retain a copy of their appointment letter. A single individual may fill both the ISSM and ISSO roles when circumstances warrant ([JSIG §1.5.14](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)).

## 2. JSIG-Defined Responsibilities (verbatim, JSIG §1.5.14)

Responsibilities of an ISSM include, but are not limited to:
- a. Develop and maintain a formal IS security program and policies for their assigned area of responsibility;
- b. Develop and oversee operational information systems security implementation policy and guidelines;
- c. Coordinate with PSO or cognizant security official on approval of external information systems (e.g., guest systems, interconnected system with another organization);
- d. Ensure ISSOs under their purview are appointed in writing and provide oversight to ensure ISSOs follow established IS policies and procedures;
- e. The ISSM shall assume ISSO responsibilities in the absence of the ISSO;
- f. Maintain required IA certifications;
- g. Ensure System Administrators (SA) monitor all available resources that provide warnings of system vulnerabilities or ongoing attacks;
- h. Ensure periodic testing is conducted to evaluate the security posture of IS by employing various intrusion/attack detection and monitoring tools (shared responsibility with ISSOs);
- i. Ensure all ISSOs receive the necessary technical and security training (e.g., operating system, networking, security management) to carry out their duties;
- j. Ensure approved procedures are used for sanitizing and releasing system components and media;
- k. Maintain a repository of all organizational or system-level cybersecurity-related documentation (including ATOs) for IS under their purview;
- l. Coordinate IS security inspections, tests, and reviews;
- m. Ensure proper measures are taken when an IS incident or vulnerability is discovered;
- n. Ensure data ownership and responsibilities are established for each IS, and specific requirements (accountability, access, and special handling) are enforced;
- o. Ensure development and implementation of an effective IS security education, training, and awareness program;
- p. Ensure CM policies and procedures for authorizing hardware/software use on an IS are followed; any hardware/software/firmware additions, changes, or modifications must be coordinated with the ISSM/ISSO and appropriate AO prior to the change;
- q. Serve as a voting member of the Configuration Control Board (CCB) and/or the Risk Executive Board, if applicable, with authority to veto any proposed change deemed detrimental to security (appeals go to the AO; the ISSM may delegate this to the ISSO);
- r. Maintain a working knowledge of system functions, security policies, technical security safeguards, and operational security measures;
- s. Manage, maintain, and execute the information security continuous monitoring plan;
- t. Ensure a record is maintained of all security-related vulnerabilities and ensure serious or unresolved violations are reported to the AO/DAO; and
- u. Assess changes to the system, its environment, and operational needs that could affect the security authorization.

## 3. Daily/Recurring Operational Duties

Derived/synthesized from the [MAINTENANCE-PLAN.md master calendar](../../MAINTENANCE-PLAN.md#4-master-consolidated-calendar) and family sections; not verbatim JSIG text. The ISSM's role in this plan is heavily weighted toward program-level oversight, policy currency, and escalation, versus the ISSO's day-to-day execution.

| Recurring Duty | Cadence | Related Control Family/ID(s) | Basis |
|---|---|---|---|
| Chair/vote in the Configuration Control Board (CCB) and/or Risk Executive Board; exercise veto authority on security-detrimental changes | Monthly, when changes are proposed | CM-3 | [JSIG §1.5.14(q)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md); [MAINTENANCE-PLAN §3.5 CM](../../MAINTENANCE-PLAN.md) |
| Manage/execute the information security continuous monitoring (ConMon) plan; approve monthly ConMon package | Monthly | CA-7, CA-5, CM-8, RA-5 | [JSIG §1.5.14(s)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md); [MAINTENANCE-PLAN §3.4 CA](../../MAINTENANCE-PLAN.md) |
| Maintain organization-level POA&M rollup and organization-wide IS inventory | Monthly | PM-4, PM-5 | [MAINTENANCE-PLAN §4, rows 36–37](../../MAINTENANCE-PLAN.md#4-master-consolidated-calendar) |
| Ensure serious/unresolved security violations and vulnerabilities are reported to the AO/DAO | Event-driven (continuous escalation readiness) | AU-6 (escalation), IR-6 | [JSIG §1.5.14(t)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md); [MAINTENANCE-PLAN §3.8 IR](../../MAINTENANCE-PLAN.md) |
| Ensure ISSOs are appointed in writing and follow established IS policies/procedures | Annual verification, or upon ISSO turnover | N/A (administrative/oversight) | [JSIG §1.5.14(d)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) |
| Ensure ISSOs receive required technical/security training | Annual, aligned with AT-3 role-based training refresh | AT-3 | [MAINTENANCE-PLAN §3.2 AT](../../MAINTENANCE-PLAN.md) |
| Maintain required IA certifications (own) | Annual/per-certification renewal cycle | AT-3 | [MAINTENANCE-PLAN §3.2 AT](../../MAINTENANCE-PLAN.md) |
| Review/update the annual risk assessment and coordinate reauthorization/continuous-ATO briefing to the AO | At least annually | RA-3, CA-6 | [MAINTENANCE-PLAN §3.14 RA](../../MAINTENANCE-PLAN.md), [§3.4 CA](../../MAINTENANCE-PLAN.md) |
| Review/update the System Security Plan (SSP) | At least annually and upon significant change | PL-2 | [MAINTENANCE-PLAN §3.12 PL](../../MAINTENANCE-PLAN.md) |
| Review/update the Contingency Plan and coordinate its annual test | Annual (review + test) | CP-2, CP-4 | [MAINTENANCE-PLAN §3.6 CP](../../MAINTENANCE-PLAN.md) |
| Review/update the Incident Response Plan | At least annually | IR-8 | [MAINTENANCE-PLAN §3.8 IR](../../MAINTENANCE-PLAN.md) |
| Review/update all family "-1" policies within assigned area of responsibility | Annual | AC-1, AT-1, AU-1, CA-1, CM-1, CP-1, IA-1, IR-1, MA-1, MP-1, PE-1, PL-1, PS-1, RA-1, SA-1, SC-1, SI-1 | [JSIG §1.5.14(a)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md); [MAINTENANCE-PLAN §4, row 71](../../MAINTENANCE-PLAN.md#4-master-consolidated-calendar) |
| Ensure approved sanitization/release procedures are used for media and system components | Per-event, with periodic procedure review (recommend annual) | MP-6 | [JSIG §1.5.14(j)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md); [MAINTENANCE-PLAN §3.10 MP](../../MAINTENANCE-PLAN.md) |
| Coordinate with PSO/cognizant security official on approval of external/guest/interconnected systems | Event-driven, plus annual review of existing agreements | CA-3, AC-20 | [JSIG §1.5.14(c)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md); [MAINTENANCE-PLAN §3.4 CA](../../MAINTENANCE-PLAN.md), [§3.1 AC](../../MAINTENANCE-PLAN.md) |
| Maintain repository of all cybersecurity-related documentation (including ATOs) for IS under purview | Ongoing/continuous | PL-2, CA-6 | [JSIG §1.5.14(k)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) |
| Coordinate IS security inspections, tests, and reviews (including SCA independent assessments and penetration tests) | Annual minimum | CA-2, CA-8 | [MAINTENANCE-PLAN §3.4 CA](../../MAINTENANCE-PLAN.md) |
| Ensure IS security education/training/awareness program is developed and implemented | Annual program refresh | AT-1, AT-2 | [MAINTENANCE-PLAN §3.2 AT](../../MAINTENANCE-PLAN.md) |
| Approve list of approved maintenance tools and maintenance personnel authorization | Annual | MA-3, MA-5 | [MAINTENANCE-PLAN §3.9 MA](../../MAINTENANCE-PLAN.md) |
| Assume ISSO responsibilities in the ISSO's absence | As needed (continuous contingency coverage) | Same duties as ISSO (see [ISSO.md](./ISSO.md)) | [JSIG §1.5.14(e)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) |

## 4. Coordination Interfaces

- **ISSO:** appoints ISSOs in writing, oversees their compliance with policy, ensures their training, and assumes their responsibilities in their absence; the ISSO reports security incidents up to the ISSM ([JSIG §1.5.14(d)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md), [(e)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md), [(i)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md); [§1.5.15(f)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **Authorizing Official (AO)/DAO:** escalates unresolved/serious vulnerabilities and violations; receives CCB veto appeals adjudication; briefs on continuous-ATO risk posture ([JSIG §1.5.14(q)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md), [(t)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **Program Security Officer (PSO)/cognizant security official:** coordinates approval of external/guest/interconnected information systems ([JSIG §1.5.14(c)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **System Administrators (SA):** directs SAs to monitor vulnerability/attack-warning resources ([JSIG §1.5.14(g)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **Configuration Control Board (CCB) / Risk Executive Board:** serves as voting member with veto authority over security-detrimental changes ([JSIG §1.5.14(q)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **Security Control Assessor (SCA):** an ISSM may be delegated in writing to perform assessments on the SCA's behalf, forwarding results to the SCA ([JSIG §1.5.7](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)).

## 5. Key Artifacts Owned/Produced

- Written ISSM appointment letter (retained by the ISSM).
- Formal IS security program documentation and area-of-responsibility policies.
- Repository of all organizational/system-level cybersecurity documentation, including ATOs.
- Record of all security-related vulnerabilities and escalation reports to the AO/DAO.
- CCB/Risk Executive Board voting records and veto/appeal documentation.
- Continuous monitoring plan and monthly ConMon package approvals.
- ISSO appointment letters and training records for ISSOs under purview.
- Approved maintenance-tool and maintenance-personnel authorization lists.
