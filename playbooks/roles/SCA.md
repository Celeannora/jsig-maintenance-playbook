# Security Control Assessor (SCA) — Operational Playbook

> Network-agnostic role playbook. Applies regardless of network architecture, classification enclave, or technology stack. Source: [JSIG §1.5.7](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md), cross-referenced to [MAINTENANCE-PLAN.md](../../MAINTENANCE-PLAN.md) and the [JSIG control-families INDEX](../../reference/JSIG/control-families/INDEX.md).

## 1. Role Summary

The SCA is an individual appointed in writing by the AO to conduct a comprehensive assessment of the management, operational, and technical security controls employed within or inherited by an information system, determining overall control effectiveness. The SCA assesses the severity of discovered weaknesses/deficiencies and recommends corrective actions; within the DoD SAP Community, an ISSM or other AO designee may be delegated in writing to perform assessments on the SCA's behalf but must forward results to the SCA for further action ([JSIG §1.5.7](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).

## 2. JSIG-Defined Responsibilities (verbatim, JSIG §1.5.7)

Responsibilities of the SCA, under the direction of the AO, include, but are not limited to:
- a. Advise the ISO and PSO concerning the impact levels for confidentiality, integrity, and availability for the information on a system;
- b. Evaluate threats and vulnerabilities to information systems to ascertain the need for additional safeguards;
- c. Review and approve the information system Security Assessment Plan, comprised of the SSP, the SCTM, and the Security Control Assessment Procedures;
- d. Ensure security assessments are completed for each IS;
- e. At the conclusion of each security assessment activity, prepare and submit the final Security Assessment Report (SAR) containing results/findings and a recommended authorization decision to the AO;
- f. Ensure system POA&M reflects identified weaknesses and suspense dates for each IS based on findings and recommendations from the SAR;
- g. Evaluate security assessment documentation and provide written recommendations for security authorization to the AO;
- h. Submit the security authorization package to the AO; and
- i. Assess proposed changes to information systems, their environment of operation, and mission needs that could affect system authorization.

## 3. Daily/Recurring Operational Duties

Derived/synthesized from [MAINTENANCE-PLAN.md](../../MAINTENANCE-PLAN.md); not verbatim JSIG text.

| Recurring Duty | Cadence | Related Control Family/ID(s) | Basis |
|---|---|---|---|
| Perform independent security control assessment | At least annually; every control assessed at least once per 3-year cycle | CA-2 | [MAINTENANCE-PLAN §3.4 CA](../../MAINTENANCE-PLAN.md) |
| Perform penetration testing | At least annually | CA-8 | [MAINTENANCE-PLAN §3.4 CA](../../MAINTENANCE-PLAN.md) |
| Review and approve the Security Assessment Plan (SSP + SCTM + assessment procedures) prior to assessment | Per assessment cycle (annual minimum) | CA-2, PL-2 | [JSIG §1.5.7](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md); [MAINTENANCE-PLAN §3.4 CA](../../MAINTENANCE-PLAN.md) |
| Prepare and submit the final SAR with recommended authorization decision to the AO | Per assessment cycle | CA-2 | [JSIG §1.5.7(e)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md) |
| Ensure POA&M reflects SAR findings and suspense dates | Monthly POA&M update cycle, refreshed at each assessment | CA-5 | [MAINTENANCE-PLAN §3.4 CA](../../MAINTENANCE-PLAN.md) |
| Assess proposed system/environment changes for authorization impact | Per-change (event-driven), coordinated with CCB monthly cadence | CM-3, CM-4 | [MAINTENANCE-PLAN §3.5 CM](../../MAINTENANCE-PLAN.md); [JSIG §1.5.7(i)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md) |
| Advise ISO/PSO on confidentiality/integrity/availability impact levels | Annual, or upon significant system change | RA-2 | [MAINTENANCE-PLAN §3.14 RA](../../MAINTENANCE-PLAN.md) |
| Evaluate threats/vulnerabilities to determine need for additional safeguards | Informed by monthly vulnerability scanning cycle | RA-5 | [MAINTENANCE-PLAN §3.14 RA](../../MAINTENANCE-PLAN.md) |
| Receive assessment results from ISSM/AO designee performing delegated assessments | Per delegated-assessment event | CA-2 | [JSIG §1.5.7](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md) |

## 4. Coordination Interfaces

- **Authorizing Official (AO):** operates under the AO's direction and written appointment; submits SAR, evaluated documentation, and the full authorization package to the AO ([JSIG §1.5.7](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **Information System Owner (ISO):** advises on impact levels; reviews ISO-produced SSP/POA&M/authorization documentation ([JSIG §1.5.7(a)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md), [§1.5.12](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **Program Security Officer (PSO):** advises jointly with the ISO on impact levels; AO ensures assessments are coordinated with the PSO ([JSIG §1.5.7(a)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md), [§1.5.5(h)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **ISSM (delegated assessor):** an ISSM or other AO designee may perform assessments on the SCA's behalf but must send results to the SCA for further action ([JSIG §1.5.7](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **ISSO:** shares audit/vulnerability review findings that feed the SCA's threat/vulnerability evaluation ([JSIG §1.5.15(m)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).

## 5. Key Artifacts Owned/Produced

- Security Assessment Plan review/approval record (SSP + SCTM + assessment procedures).
- Security Assessment Report (SAR) with findings, severity ratings, and recommended authorization decision.
- POA&M input reflecting SAR findings and suspense dates.
- Written recommendations for security authorization to the AO.
- Submitted security authorization package.
- Change-impact assessment records for proposed system/environment changes.
