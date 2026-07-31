# Information Owner/Steward — Operational Playbook

> Network-agnostic role playbook. Applies regardless of network architecture, classification enclave, or technology stack. Source: [JSIG §1.5.10](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md), cross-referenced to [MAINTENANCE-PLAN.md](../../MAINTENANCE-PLAN.md) and the [JSIG control-families INDEX](../../reference/JSIG/control-families/INDEX.md).

## 1. Role Summary

An Information Owner/Steward is an organizational official with statutory, management, or operational authority for specific information, responsible for establishing policies and procedures governing that information's generation, collection, processing, dissemination, and disposal. The Information Owner/Steward must be a U.S. citizen and government employee; each respective CA SAPCO also serves in this role. Responsibility for appropriate use and protection of the information is retained even when the information is shared with other organizations, and the Information Owner/Steward may or may not be the same individual as the Information System Owner ([JSIG §1.5.10](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).

## 2. JSIG-Defined Responsibilities (verbatim/near-verbatim, JSIG §1.5.10)

- Establishes the policies and procedures governing the generation, collection, processing, dissemination, and disposal of specific information under their statutory, management, or operational authority.
- In information-sharing environments, establishes the rules for appropriate use and protection of the subject information (e.g., rules of behavior), and retains that responsibility even when the information is shared with or provided to other organizations.
- May or may not be the same individual as the Information System Owner (ISO); a single information system may contain information from multiple Information Owners/Stewards.
- Each respective CA SAPCO shall also serve as the information owner/steward.

Information Owners/Stewards provide input to ISOs regarding:
- Sensitivity of information under the information owner/steward's purview;
- Confidentiality, integrity, and availability impact levels associated with the information owner/steward's data;
- Unique requirements for managing the information owner/steward's data (e.g., incident response, information contamination to other systems/media, unique audit requirements); and
- Whether foreign nationals may access the information owner/steward's data.

## 3. Daily/Recurring Operational Duties

Derived/synthesized from [MAINTENANCE-PLAN.md](../../MAINTENANCE-PLAN.md); not verbatim JSIG text.

| Recurring Duty | Cadence | Related Control Family/ID(s) | Basis |
|---|---|---|---|
| Provide/confirm confidentiality, integrity, and availability impact-level input for owned data | Annual, or upon significant change to the information's sensitivity/use | RA-2 | [MAINTENANCE-PLAN §3.14 RA](../../MAINTENANCE-PLAN.md); [JSIG §1.5.10](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md) |
| Review/update rules of behavior governing information use in sharing environments | Annual, aligned with PL-4 rules-of-behavior refresh | PL-4 | [MAINTENANCE-PLAN §3.12 PL](../../MAINTENANCE-PLAN.md) |
| Determine, in coordination with the ISO, individuals eligible for access and required access types | Ongoing/event-driven, informed by AC-2 account-review cycle | AC-2 | [JSIG §1.5.12(d)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md); [MAINTENANCE-PLAN §3.1 AC](../../MAINTENANCE-PLAN.md) |
| Communicate unique audit/incident-response requirements for owned data to the ISSM/ISSO | Annual review, plus event-driven when data handling requirements change | AU-2, IR-8 | [MAINTENANCE-PLAN §3.3 AU](../../MAINTENANCE-PLAN.md), [§3.8 IR](../../MAINTENANCE-PLAN.md) |
| Confirm foreign-national access restrictions remain current for owned data | Annual, or upon personnel/foreign-disclosure policy change | AC-2 (access eligibility) | [JSIG §1.5.10](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md) |
| Support data-quality/PII-minimization reviews for owned information (where applicable) | Quarterly (DI-1) / annual (DM-1) | DI-1, DM-1 | [MAINTENANCE-PLAN §3.21 DI](../../MAINTENANCE-PLAN.md), [§3.22 DM](../../MAINTENANCE-PLAN.md) |

## 4. Coordination Interfaces

- **Information System Owner (ISO):** provides input on data sensitivity, impact levels, unique handling requirements, and foreign-national access eligibility; jointly determines access eligibility and privilege types ([JSIG §1.5.10](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md), [§1.5.12(d)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **Security Control Assessor (SCA):** SCA advises on impact levels informed partly by Information Owner/Steward input ([JSIG §1.5.7(a)](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **ISSM/ISSO:** relays unique audit, incident-response, and information-contamination requirements for owned data ([JSIG §1.5.10](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **CA SAPCO:** each CA SAPCO also serves as an Information Owner/Steward, linking this role directly into the program's cognizant-authority structure ([JSIG §1.5.10](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).

## 5. Key Artifacts Owned/Produced

- Policies and procedures governing generation, collection, processing, dissemination, and disposal of owned information.
- Rules of behavior for information shared across organizations.
- Documented impact-level determinations (confidentiality/integrity/availability) for owned data, provided to the ISO.
- Access-eligibility determinations and foreign-national access restrictions for owned data.
- Statements of unique handling/audit/incident-response requirements provided to the ISSM/ISSO.
