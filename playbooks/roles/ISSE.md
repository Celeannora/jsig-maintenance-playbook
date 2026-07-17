# Information System Security Engineer (ISSE) — Operational Playbook

> Network-agnostic role playbook. Applies regardless of network architecture, classification enclave, or technology stack. Source: [JSIG §1.5.13](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md), cross-referenced to [MAINTENANCE-PLAN.md](../../MAINTENANCE-PLAN.md) and the [JSIG control-families INDEX](../../reference/JSIG/control-families/INDEX.md).

## 1. Role Summary

An ISSE is an individual or group responsible for information system security engineering — the process of capturing and refining information security requirements and ensuring they are effectively integrated into information systems through purposeful security architecting, design, development, and configuration. The ISSE is an integral part of the development team designing/developing organizational information systems or upgrading legacy systems, and employs best practices including software engineering methodologies, system/security engineering principles, secure design, secure architecture, and secure coding techniques ([JSIG §1.5.13](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)).

## 2. JSIG-Defined Responsibilities (verbatim/near-verbatim, JSIG §1.5.13)

- Conducts information system security engineering activities — capturing and refining information security requirements and ensuring effective integration into IS through security architecting, design, development, and configuration.
- Is an integral part of the development team designing and developing organizational information systems or upgrading legacy systems.
- Employs best practices when implementing security requirements, including software engineering methodologies, system/security engineering principles, secure design, secure architecture, and secure coding techniques.
- Shall be appointed in writing and shall ensure the information system is designed, developed, and implemented with required security features and safeguards.
- If the ISSM/ISSO is identified to fulfill the ISSE role, their appointment letter must reflect this, and they fulfill ISSE tasks in addition to their ISSM/ISSO tasks.
- Some organizations refer to an ISSE as an Information Security Architect or Information Assurance Systems Architect and Engineer (IASAE).

## 3. Daily/Recurring Operational Duties

Derived/synthesized from [MAINTENANCE-PLAN.md](../../MAINTENANCE-PLAN.md); not verbatim JSIG text.

| Recurring Duty | Cadence | Related Control Family/ID(s) | Basis |
|---|---|---|---|
| Ensure security requirements/features are integrated into system design and development artifacts | Per development milestone (continuous during active development) | SA-3, SA-8 | [MAINTENANCE-PLAN §3.15 SA](../../MAINTENANCE-PLAN.md) |
| Participate in security control assessments' preliminary and critical design reviews (PDR/CDR) with the SCA | Per-project milestone | CA-2 | [JSIG §1.5.12(f)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) (ISO/SCA coordination point the ISSE supports) |
| Review/verify security architecture remains aligned with implemented safeguards | Annual, or upon major system change | PL-8 | [MAINTENANCE-PLAN §3.12 PL](../../MAINTENANCE-PLAN.md) |
| Support risk assessment currency during system development | Annual, or upon significant change | RA-3 | [MAINTENANCE-PLAN §3.14 RA](../../MAINTENANCE-PLAN.md) |
| Verify enhancements to legacy/existing systems provide equal or improved security safeguards | Per-change (event-driven), coordinated with CCB | CM-3, CM-4 | [MAINTENANCE-PLAN §3.5 CM](../../MAINTENANCE-PLAN.md); [JSIG §1.5.13](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) |
| Apply secure-coding/secure-configuration best practices during development/modification activity | Per-release (event-driven) | SA-11 | [MAINTENANCE-PLAN §3.15 SA](../../MAINTENANCE-PLAN.md) |
| Maintain appointment-letter currency (including combined ISSM/ISSO+ISSE scope, if applicable) | Annual, or upon role change | N/A (administrative) | [JSIG §1.5.13](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md) |

## 4. Coordination Interfaces

- **Information System Owner (ISO):** the ISO resources and appoints the ISSE in writing and relies on the ISSE to ensure required security features/safeguards are designed and implemented ([JSIG §1.5.12(e)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md), [§1.5.13](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **Security Control Assessor (SCA):** ISSE engineering decisions are exercised at PDR/CDR where SCA participation is most important; ISSE work feeds SCA assessment ([JSIG §1.5.12(f)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **ISSM/ISSO:** if the ISSM/ISSO also fulfills the ISSE role, they perform both task sets under one appointment letter; otherwise the ISSE coordinates security-engineering decisions with the ISSM/ISSO for operational security continuity ([JSIG §1.5.13](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **Development Team:** the ISSE is an integral member of the team designing/developing or upgrading the system ([JSIG §1.5.13](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)).

## 5. Key Artifacts Owned/Produced

- Written ISSE appointment letter (or combined ISSM/ISSO+ISSE appointment letter, if applicable).
- Security architecture and design documentation demonstrating integrated security requirements.
- Secure-design/secure-coding review records for development and legacy-system upgrade activities.
- Evidence that enhancements to existing systems provide equal or improved security safeguards.
