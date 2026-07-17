# Common Control Provider (CCP) — Operational Playbook

> Network-agnostic role playbook. Applies regardless of network architecture, classification enclave, or technology stack. Source: [JSIG §1.5.8](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md), cross-referenced to [MAINTENANCE-PLAN.md](../../MAINTENANCE-PLAN.md) and the [JSIG control-families INDEX](../../reference/JSIG/control-families/INDEX.md).

## 1. Role Summary

A CCP is an individual, group, or organization responsible for the development, implementation, assessment, and monitoring of common security controls — controls inherited by one or more information systems — so that inheriting systems do not need to separately assess and document those controls ([JSIG §1.5.8](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)).

## 2. JSIG-Defined Responsibilities (verbatim, JSIG §1.5.8)

Responsibilities of the CCP include, but are not limited to:
- a. Document the organization-identified common controls in a SSP;
- b. Ensure that required assessments of common controls are carried out by qualified assessors;
- c. Document assessment findings in a SAR;
- d. Produce and maintain a POA&M for all common security controls having weaknesses or deficiencies; and
- e. Ensure SSPs, SARs, and POA&Ms for common controls are made available to ISOs inheriting those controls.

## 3. Daily/Recurring Operational Duties

Derived/synthesized from [MAINTENANCE-PLAN.md](../../MAINTENANCE-PLAN.md); not verbatim JSIG text.

| Recurring Duty | Cadence | Related Control Family/ID(s) | Basis |
|---|---|---|---|
| Maintain the common-control SSP documenting all organization-identified inherited controls | Annual review, plus event-driven on significant change | PL-2 | [MAINTENANCE-PLAN §3.12 PL](../../MAINTENANCE-PLAN.md); [JSIG §1.5.8(a)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) |
| Coordinate/ensure qualified-assessor assessment of common controls | At least annually; every control assessed at least once per 3-year cycle | CA-2 | [MAINTENANCE-PLAN §3.4 CA](../../MAINTENANCE-PLAN.md) |
| Document assessment findings in a common-control SAR | Per assessment cycle | CA-2 | [JSIG §1.5.8(c)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) |
| Produce/maintain POA&M for common controls with weaknesses/deficiencies | At least monthly | CA-5 | [MAINTENANCE-PLAN §3.4 CA](../../MAINTENANCE-PLAN.md); [JSIG §1.5.8(d)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) |
| Make current SSP/SAR/POA&M available to inheriting ISOs | Ongoing, refreshed whenever any of the three documents is updated | PL-2, CA-2, CA-5 | [JSIG §1.5.8(e)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) |
| Update inventory of systems/controls inherited from this CCP | Monthly, aligned with CM-8/PM-5 inventory cadence | CM-8, PM-5 | [MAINTENANCE-PLAN §3.5 CM](../../MAINTENANCE-PLAN.md), [§3.18 PM](../../MAINTENANCE-PLAN.md) |
| Assess impact of proposed changes to common controls on all inheriting systems | Per-change (event-driven), coordinated with CCB | CM-3, CM-4 | [MAINTENANCE-PLAN §3.5 CM](../../MAINTENANCE-PLAN.md) |

## 4. Coordination Interfaces

- **Information System Owner (ISO):** provides SSP, SAR, and POA&M for inherited common controls so ISOs can incorporate them into their own authorization packages ([JSIG §1.5.8(e)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md), [§1.5.12](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **Authorizing Official (AO):** coordinates with the AO during the security authorization process for systems inheriting common controls ([JSIG §1.5.5(l)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **Security Control Assessor (SCA) / qualified assessors:** ensures required assessments of common controls are carried out by qualified assessors ([JSIG §1.5.8(b)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **CISO:** the CISO serves as a liaison point that includes CCPs among the roles it coordinates with the CIO ([JSIG §1.5.4](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)).

## 5. Key Artifacts Owned/Produced

- Common-control System Security Plan (SSP).
- Common-control Security Assessment Report (SAR).
- Common-control Plan of Action and Milestones (POA&M).
- Distribution/availability records confirming inheriting ISOs have current SSP/SAR/POA&M copies.
