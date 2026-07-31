# Authorizing Official (AO) — Operational Playbook

> Network-agnostic role playbook. Applies regardless of network architecture, classification enclave, or technology stack. Source: [JSIG §1.5.5](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md), cross-referenced to [MAINTENANCE-PLAN.md](../../MAINTENANCE-PLAN.md) and the [JSIG control-families INDEX](../../reference/JSIG/control-families/INDEX.md).

## 1. Role Summary

The AO is a senior official or executive with authority to formally assume responsibility for operating an information system at an acceptable level of risk to organizational operations, assets, individuals, other organizations, and national security. The AO must be a U.S. citizen and government employee, typically holds budgetary oversight or mission/business responsibility for the system, and — through the security authorization process — is accountable for the security risks associated with system operation ([JSIG §1.5.5](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).

## 2. JSIG-Defined Responsibilities (verbatim, JSIG §1.5.5)

Responsibilities of the AO include, but are not limited to:
- a. Ensure each IS is properly assessed and authorized based on its environment of operation, security impact levels and security requirements;
- b. Evaluate threats and vulnerabilities to information systems to ascertain the need for additional safeguards;
- c. Issue and maintain written security authorization statements;
- d. Ensure records are maintained for all IS authorizations under his/her purview;
- e. Ensure a security education, training, and awareness program is in place;
- f. Ensure information system security is an element of the life-cycle process;
- g. Ensure all DAOs and security control assessors (SCAs) are trained to properly perform their duties;
- h. Ensure all assessments are coordinated with the CA Program Security Officer (PSO);
- i. Ensure organizations plan, budget, allocate, and spend adequate resources in support of IS security;
- j. Approve security plans, memorandums of agreement or understanding, and plans of action and milestones and determine whether significant changes in the information systems or environments of operation require reauthorization;
- k. Deny authorization to operate an information system or if the system is operational, halt operations, if unacceptable risks exist;
- l. Coordinate their activities with the REF, CIO, CISO, CCP, ISO, ISSM/ISSO, SCA, and other interested parties during the security authorization process; and
- m. Authority to specify, notwithstanding the requirements stated in this JSIG, a greater impact level or amount of protection for any given system in any given environment.

An AO may appoint one or more DAOs to expedite authorizations and provide mission support, and remains responsible for ensuring all delegated activities and functions are carried out ([JSIG §1.5.5](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).

## 3. Daily/Recurring Operational Duties

Derived/synthesized from [MAINTENANCE-PLAN.md](../../MAINTENANCE-PLAN.md); not verbatim JSIG text.

| Recurring Duty | Cadence | Related Control Family/ID(s) | Basis |
|---|---|---|---|
| Approve/deny security authorization (ATO) and reauthorization decisions | Annual at minimum, or per continuous-ATO risk-based cadence | CA-6 | [MAINTENANCE-PLAN §3.4 CA](../../MAINTENANCE-PLAN.md) |
| Receive/act on Security Assessment Report (SAR) and recommended authorization decision from SCA | Per assessment cycle (annual independent assessment minimum) | CA-2 | [MAINTENANCE-PLAN §3.4 CA](../../MAINTENANCE-PLAN.md) |
| Approve SSP, POA&M, and MOA/MOUs; determine whether changes require reauthorization | Annual SSP review cycle, plus event-driven on significant change | PL-2, CA-5 | [MAINTENANCE-PLAN §3.12 PL](../../MAINTENANCE-PLAN.md), [§3.4 CA](../../MAINTENANCE-PLAN.md) |
| Receive ISSM escalation of unresolved/serious security violations and vulnerabilities | Event-driven (continuous availability expected) | AU-6 (escalation path), IR-6 | [JSIG §1.5.14(t)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md); [MAINTENANCE-PLAN §3.8 IR](../../MAINTENANCE-PLAN.md) |
| Review continuous-monitoring (ConMon) package/executive summary to sustain authorization decision | Monthly | CA-7, CA-5, CM-8, RA-5 | [MAINTENANCE-PLAN §3.4 CA](../../MAINTENANCE-PLAN.md) |
| Ensure DAOs and SCAs under purview receive required training | Annual, aligned with AT-3 role-based training refresh | AT-3 | [MAINTENANCE-PLAN §3.2 AT](../../MAINTENANCE-PLAN.md) |
| Ensure security education/training/awareness program is in place organization-wide | Annual program review | AT-1, AT-2 | [MAINTENANCE-PLAN §3.2 AT](../../MAINTENANCE-PLAN.md) |
| Ensure adequate resources are planned/budgeted for IS security | Annual budget cycle | PM-3 (resourcing) | [MAINTENANCE-PLAN §3.18 PM](../../MAINTENANCE-PLAN.md) |
| Coordinate assessments with the CA Program Security Officer (PSO) | Per assessment cycle | CA-2 | [JSIG §1.5.5(h)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md) |
| Decide to halt operations or deny authorization upon unacceptable risk | Event-driven | CA-6, IR-4 | [JSIG §1.5.5(k)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md) |
| Adjudicate ISSM/ISSO configuration-change veto appeals | Event-driven, tied to CCB monthly cadence | CM-3 | [MAINTENANCE-PLAN §3.5 CM](../../MAINTENANCE-PLAN.md); [JSIG §1.5.14(q)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md) |

## 4. Coordination Interfaces

- **Delegated Authorizing Official (DAO):** may appoint one or more DAOs to expedite authorizations; remains accountable for all delegated activity ([JSIG §1.5.5](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md), [§1.5.6](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **Security Control Assessor (SCA):** appoints the SCA in writing; receives the SAR, evaluated documentation, and authorization package/recommendation from the SCA ([JSIG §1.5.7](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **Risk Executive (Function) (REF):** coordinates authorization-process activities with the REF for organization-wide risk context ([JSIG §1.5.5(l)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **CIO / CISO:** coordinates authorization-process activities; CISO serves as primary liaison to the AO ([JSIG §1.5.5(l)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md), [§1.5.4](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **Common Control Provider (CCP):** coordinates on inherited common controls during authorization ([JSIG §1.5.5(l)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **Information System Owner (ISO):** coordinates authorization-package submission and change-impact decisions ([JSIG §1.5.5(l)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md), [§1.5.12](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **ISSM/ISSO:** receives escalation of unresolved vulnerabilities/violations and change notifications; adjudicates CCB veto appeals ([JSIG §1.5.14](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md), [§1.5.15](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **Program Security Officer (PSO):** coordinates assessments with the CA PSO ([JSIG §1.5.5(h)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).

## 5. Key Artifacts Owned/Produced

- Written security authorization statements (ATO/interim ATO/denial memos).
- Authorization records repository for all IS under purview.
- Approved SSPs, MOAs/MOUs, and POA&Ms (approval signatures).
- Reauthorization determinations upon significant change.
- DAO appointment/delegation letters (when delegating).
- Adjudications of CCB veto appeals.
