# Delegated Authorizing Official (DAO) — Operational Playbook

> Network-agnostic role playbook. Applies regardless of network architecture, classification enclave, or technology stack. Source: [JSIG §1.5.6](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md), cross-referenced to [MAINTENANCE-PLAN.md](../../MAINTENANCE-PLAN.md) and the [JSIG control-families INDEX](../../reference/JSIG/control-families/INDEX.md).

## 1. Role Summary

The DAO is an organizational official appointed in writing and authorized to act on behalf of an AO in carrying out and coordinating security-authorization activities, including — when explicitly delegated — the authority to authorize a system to operate. The DAO must be a government employee, must have a broad and strategic understanding of the DoD SAP Community, and uses that understanding to weigh competing equities (mission, security, budget, schedule, counterintelligence, civil liberties/privacy, and other policy requirements) when determining acceptable risk ([JSIG §1.5.6](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).

## 2. JSIG-Defined Responsibilities (verbatim/near-verbatim, JSIG §1.5.6)

- Acts on behalf of an AO in carrying out and coordinating the required activities associated with security authorization, including, when explicitly delegated, the authority to authorize a system to operate.
- Has inherent U.S. Government authority and, as such, must be a government employee.
- Shall have a broad and strategic understanding of the DoD SAP Community, used to assign appropriate weight to competing equities: mission and security requirements, budget consequences, operational performance efficiencies, schedule requirements, counterintelligence concerns, civil liberty and privacy protection, and other relevant policy requirements.
- Shall determine the level of risk deemed acceptable when authorizing systems, in light of the above factors.
- Can be empowered by the AO to make decisions regarding: planning and resourcing of the security authorization process; approval of the SSP; approval and monitoring of implementation of the POA&M; and the assessment and/or determination of risk.
- The delegation letter must outline specific authorities including impact levels (low, moderate, or high) for confidentiality, integrity, and availability.

## 3. Daily/Recurring Operational Duties

Derived/synthesized from [MAINTENANCE-PLAN.md](../../MAINTENANCE-PLAN.md); not verbatim JSIG text. Scope of duties below applies only to the extent explicitly delegated by the AO's delegation letter.

| Recurring Duty | Cadence | Related Control Family/ID(s) | Basis |
|---|---|---|---|
| Approve and monitor implementation of the POA&M (if delegated) | Monthly | CA-5 | [MAINTENANCE-PLAN §3.4 CA](../../MAINTENANCE-PLAN.md); [JSIG §1.5.6](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md) |
| Approve the SSP (if delegated) | Annual review cycle, plus event-driven on significant change | PL-2 | [MAINTENANCE-PLAN §3.12 PL](../../MAINTENANCE-PLAN.md) |
| Review monthly ConMon package to support ongoing risk determination | Monthly | CA-7, CM-8, RA-5 | [MAINTENANCE-PLAN §3.4 CA](../../MAINTENANCE-PLAN.md) |
| Participate in reauthorization / continuous-ATO risk determination as delegated | Annual at minimum | CA-6 | [MAINTENANCE-PLAN §3.4 CA](../../MAINTENANCE-PLAN.md) |
| Coordinate resourcing/planning of the security authorization process (if delegated) | Ongoing/annual budget cycle | PM-3 | [MAINTENANCE-PLAN §3.18 PM](../../MAINTENANCE-PLAN.md) |
| Receive SCA assessment results/recommendations for systems under delegated purview | Per assessment cycle (annual minimum) | CA-2 | [MAINTENANCE-PLAN §3.4 CA](../../MAINTENANCE-PLAN.md) |
| Receive ISSM/ISSO notification of changes/incidents that might affect authorization | Event-driven | CM-3, CM-4, IR-6 | [JSIG §1.5.15(j)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md); [MAINTENANCE-PLAN §3.5 CM](../../MAINTENANCE-PLAN.md) |
| Verify own delegated authority scope remains current against delegation letter (impact levels for C/I/A) | Annual, or upon delegation renewal | RA-2 (impact-level linkage) | [JSIG §1.5.6](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md) |

## 4. Coordination Interfaces

- **Authorizing Official (AO):** acts on behalf of, and within limits set by, the AO's written delegation letter; escalates matters outside delegated authority ([JSIG §1.5.6](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **Security Control Assessor (SCA):** receives assessment results and recommendations for delegated systems ([JSIG §1.5.7](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **Information System Owner (ISO):** coordinates SSP/POA&M approval and authorization-package review for delegated systems ([JSIG §1.5.12](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **ISSM/ISSO:** receives change/incident notifications that might affect the authorization decision ([JSIG §1.5.14](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md), [§1.5.15](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **AO's other DAOs / REF / CIO / CISO:** coordinates as needed for consistency across delegated authorization decisions ([JSIG §1.5.5(l)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md) applied by extension to delegated authority).

## 5. Key Artifacts Owned/Produced

- Written delegation letter defining scope of delegated authority and applicable impact levels (C/I/A).
- Approved SSPs and POA&Ms for delegated systems (when authority is delegated).
- Risk-acceptance/authorization determinations issued under delegated authority.
- Records of coordination with the AO on decisions requiring AO-level authority.
