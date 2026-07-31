# Information System Owner (ISO) — Operational Playbook

> Network-agnostic role playbook. Applies regardless of network architecture, classification enclave, or technology stack. Source: [JSIG §1.5.12](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md), cross-referenced to [MAINTENANCE-PLAN.md](../../MAINTENANCE-PLAN.md) and the [JSIG control-families INDEX](../../reference/JSIG/control-families/INDEX.md).

## 1. Role Summary

An ISO is an organizational official (government PM, or contractor PM for contractor-owned systems) responsible for the procurement, development, integration, modification, operation, maintenance, and disposal of an information system. The ISO addresses the operational interests of the user community and ensures compliance with information security requirements throughout the system's lifecycle ([JSIG §1.5.12](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).

## 2. JSIG-Defined Responsibilities (verbatim, JSIG §1.5.12)

Responsibilities of the ISO include, but are not limited to:
- a. Plan and budget for adequate on-site information security resources assigned to information systems under their purview;
- b. Ensure compliance with current cybersecurity/IA policies, concepts, and measures when designing, procuring, adopting, and developing new IS;
- c. Ensure development and maintenance of the documentation required for authorization to operate (e.g., SSP, SAR, POA&M) and that the system is deployed and operated in accordance with the agreed-upon security controls;
- d. Determine, in coordination with the information owner/steward, the individuals eligible for access to the system and the types of privileges or access rights required;
- e. If required to meet DoDI 5000.02, and as directed by the CA SAPCO, resource and appoint an ISSE in writing to ensure the system is designed/developed/implemented with required security features and safeguards, and that enhancements provide equal or improved security features;
- f. Coordinate with the AO to ensure the appropriate SCA (or other AO designee) is identified as early as possible, with SCA participation most important at PDR and CDR;
- g. Ensure the Configuration Management (CM) process is addressed and used when new IS are under development, procured, or delivered for operation, and that the AO/DAO is advised of CM decisions;
- h. Ensure all IS acquisitions (including weapon systems) remain compliant with IA and technology acquisition requirements per DoDD 5000.01 and DoDI 5000.02;
- i. Ensure a risk assessment is performed on the IS while under development and kept current throughout the acquisition/development lifecycle;
- j. Ensure security controls are implemented that protect the IS during development;
- k. Ensure all acquisition/delivery steps are followed, including: clearly describing the IS mission; formulating a concept/design meeting security requirements; incorporating security requirements during development; evaluating interoperability with other systems;
- l. Produce/develop security documentation (SSP, POA&M, Security Assessment Plan, etc.) as input to the Security Authorization Package and submit the package to the AO via the SCA;
- m. Coordinate a Security Assessment schedule with the SCA; and
- n. Ensure the POA&M is updated to describe planned tasks for correcting identified weaknesses within established timeframes and address residual findings.

## 3. Daily/Recurring Operational Duties

Derived/synthesized from [MAINTENANCE-PLAN.md](../../MAINTENANCE-PLAN.md); not verbatim JSIG text.

| Recurring Duty | Cadence | Related Control Family/ID(s) | Basis |
|---|---|---|---|
| Develop/maintain SSP, SAR, and POA&M documentation | Annual SSP review; monthly POA&M update | PL-2, CA-2, CA-5 | [MAINTENANCE-PLAN §3.12 PL](../../MAINTENANCE-PLAN.md), [§3.4 CA](../../MAINTENANCE-PLAN.md) |
| Update POA&M with planned corrective tasks and suspense dates | At least monthly | CA-5 | [MAINTENANCE-PLAN §3.4 CA](../../MAINTENANCE-PLAN.md); [JSIG §1.5.12(n)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md) |
| Plan/budget for on-site information security resources | Annual budget cycle | PM-3 | [MAINTENANCE-PLAN §3.18 PM](../../MAINTENANCE-PLAN.md) |
| Coordinate a Security Assessment schedule with the SCA | Annual (assessment cycle), earlier at PDR/CDR for systems in development | CA-2 | [JSIG §1.5.12(f)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md), [(m)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md) |
| Ensure system component inventory and baseline configuration remain current | Monthly (inventory), annual (baseline) | CM-8, CM-2 | [MAINTENANCE-PLAN §3.5 CM](../../MAINTENANCE-PLAN.md) |
| Ensure CM process is followed and advise AO/DAO of CM decisions | Monthly (CCB cadence when changes proposed) | CM-3 | [MAINTENANCE-PLAN §3.5 CM](../../MAINTENANCE-PLAN.md); [JSIG §1.5.12(g)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md) |
| Keep the risk assessment current throughout system development/operation | Annual, or upon significant change | RA-3 | [MAINTENANCE-PLAN §3.14 RA](../../MAINTENANCE-PLAN.md); [JSIG §1.5.12(i)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md) |
| Determine, with the information owner/steward, access eligibility and privilege types | Ongoing/event-driven, reviewed at least quarterly with account reviews | AC-2 | [MAINTENANCE-PLAN §3.1 AC](../../MAINTENANCE-PLAN.md); [JSIG §1.5.12(d)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md) |
| Ensure compliance with acquisition/technology-development IA requirements | Per acquisition milestone; annual for sustained systems | SA-3, SA-4, SA-22 | [MAINTENANCE-PLAN §3.15 SA](../../MAINTENANCE-PLAN.md) |
| Verify external/third-party service provider compliance for the system | Annual | SA-9 | [MAINTENANCE-PLAN §3.15 SA](../../MAINTENANCE-PLAN.md) |

## 4. Coordination Interfaces

- **Authorizing Official (AO):** submits the security authorization package (via the SCA); coordinates SCA identification early in development, especially at PDR/CDR; advises AO/DAO of CM decisions ([JSIG §1.5.12(f)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md), [(g)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md), [(l)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **Security Control Assessor (SCA):** coordinates assessment scheduling; submits the authorization package through the SCA ([JSIG §1.5.12(l)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md), [(m)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **Information Owner/Steward:** jointly determines access eligibility and privilege/access-rights types ([JSIG §1.5.12(d)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **Information System Security Engineer (ISSE):** resources and appoints the ISSE in writing when required by DoDI 5000.02/CA SAPCO direction ([JSIG §1.5.12(e)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **ISSM/ISSO:** coordinates CM decisions and hardware/software/firmware changes affecting the system ([JSIG §1.5.14(p)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md), [§1.5.15(i)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **Mission/Business Owner (MBO):** addresses the operational interests of the MBO's user community ([JSIG §1.5.11](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md), [§1.5.12](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).

## 5. Key Artifacts Owned/Produced

- System Security Plan (SSP).
- Security Assessment Report (SAR) input/coordination records.
- Plan of Action and Milestones (POA&M).
- Security Assessment Plan documentation submitted as authorization-package input.
- ISSE appointment letter (when applicable).
- Risk assessment records maintained through the development/acquisition lifecycle.
- System component inventory and CM decision records.
