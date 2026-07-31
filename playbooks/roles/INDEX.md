# JSIG Section 1.5 Role Playbooks — Master Index

Network-agnostic operational playbooks for all 17 roles defined in [JSIG §1.5 Roles and Responsibilities](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md). Each playbook translates the role's verbatim JSIG duties into a role summary, JSIG-cited responsibility list, a synthesized "Daily/Recurring Operational Duties" table mapped to specific control IDs (drawn from [MAINTENANCE-PLAN.md](../../MAINTENANCE-PLAN.md) and the [control-families INDEX](../../reference/JSIG/control-families/INDEX.md)), a coordination-interfaces section, and a list of key artifacts owned/produced. Guidance is intentionally independent of any specific network architecture, classification enclave, or technology stack.

Roles are grouped below roughly by hierarchy: agency/executive → authorization → common-control/program-security → data/mission ownership → technical/operational security → end users.

## Agency / Executive Roles

| Role | One-line Summary | Playbook |
|---|---|---|
| Agency/Component Head | Bears ultimate responsibility for mission accomplishment and risk mitigation; appoints the AO and the component's SAP senior authorizing official. | [Agency-Component-Head.md](./Agency-Component-Head.md) |
| Risk Executive (Function) (REF) | Organization-wide adjunct advisor (no authorization authority) ensuring risk is viewed holistically and consistently across the organization. | [Risk-Executive-Function.md](./Risk-Executive-Function.md) |
| Chief Information Officer (CIO) | Designates the CISO, sets organization-wide security policy, and reports annually on program effectiveness to the agency head. | [CIO.md](./CIO.md) |
| Chief Information Security Officer (CISO) | Carries out the CIO's FISMA security duties and serves as primary liaison between the CIO and AOs/ISOs/CCPs/ISSM/ISSO. | [CISO.md](./CISO.md) |

## Authorization Roles

| Role | One-line Summary | Playbook |
|---|---|---|
| Authorizing Official (AO) | Senior official who formally accepts risk and authorizes (or denies/halts) system operation; accountable for authorization decisions. | [AO.md](./AO.md) |
| Delegated Authorizing Official (DAO) | Acts on behalf of the AO within a written delegation, potentially including authority to authorize a system to operate. | [DAO.md](./DAO.md) |
| Security Control Assessor (SCA) | AO-appointed assessor who evaluates control effectiveness, produces the SAR, and recommends authorization decisions. | [SCA.md](./SCA.md) |

## Common-Control & Program-Security Roles

| Role | One-line Summary | Playbook |
|---|---|---|
| Common Control Provider (CCP) | Develops, implements, assesses, and monitors common (inheritable) security controls for use by multiple systems. | [CCP.md](./CCP.md) |
| Program Security Officer (PSO) | Program-security role defined by reference to DoDM 5205.07; coordinates with the AO/SCA/ISSM on assessments, impact levels, and external-system approvals. | [PSO.md](./PSO.md) |

## Data & Mission Ownership Roles

| Role | One-line Summary | Playbook |
|---|---|---|
| Information Owner/Steward | Establishes policies governing specific information's lifecycle and provides sensitivity/impact-level input to the ISO. | [Information-Owner-Steward.md](./Information-Owner-Steward.md) |
| Mission/Business Owner (MBO) | Key stakeholder for system lifecycle decisions; ensures security requirements are integrated into the SDLC for the mission/business process. | [MBO.md](./MBO.md) |

## Technical / Operational Security Roles

| Role | One-line Summary | Playbook |
|---|---|---|
| Information System Owner (ISO) | PM-level owner responsible for an IS's procurement, development, operation, maintenance, and disposal, and for its authorization documentation. | [ISO.md](./ISO.md) |
| Information System Security Engineer (ISSE) | Integrates security requirements into system design/development through security architecting, engineering, and secure coding. | [ISSE.md](./ISSE.md) |
| Information System Security Manager (ISSM) | Principal security advisor for assigned systems; owns the security program, policy, CCB veto authority, and ConMon plan execution. | [ISSM.md](./ISSM.md) |
| Information System Security Officer (ISSO) | Day-to-day operational security owner; executes audit review, incident reporting, POA&M updates, and compliance monitoring. | [ISSO.md](./ISSO.md) |

## User Roles

| Role | One-line Summary | Playbook |
|---|---|---|
| Privileged Users | Elevated-access individuals (e.g., system/security administrators) governed by AC-2, AC-5, and PL-4. | [Privileged-Users.md](./Privileged-Users.md) |
| General Users | Standard-access individuals governed by AC-2 and PL-4. | [General-Users.md](./General-Users.md) |

## Source Documents

- [JSIG Section 1.5 — Roles and Responsibilities (verbatim extract)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)
- [JSIG Control Families Index](../../reference/JSIG/control-families/INDEX.md)
- [JSIG System Administration Maintenance Plan](../../MAINTENANCE-PLAN.md)

**Note on synthesis:** Sections 1 and 2 of each playbook (Role Summary, JSIG-Defined Responsibilities) are verbatim or near-verbatim extractions from JSIG §1.5. Sections 3–5 (Daily/Recurring Operational Duties, Coordination Interfaces, Key Artifacts) are derived/synthesized by mapping each role's JSIG duties onto the control-family cadence data in [MAINTENANCE-PLAN.md](../../MAINTENANCE-PLAN.md) — they are not verbatim JSIG text and should be validated against organization-defined parameters (ODPs) and primary JSIG source material before operational use.
