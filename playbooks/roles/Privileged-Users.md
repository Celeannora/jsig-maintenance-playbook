# Privileged Users — Operational Playbook

> Network-agnostic role playbook. Applies regardless of network architecture, classification enclave, or technology stack. Source: [JSIG §1.5.16](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md), cross-referenced to [MAINTENANCE-PLAN.md](../../MAINTENANCE-PLAN.md) and the [JSIG control-families INDEX](../../reference/JSIG/control-families/INDEX.md).

## 1. Role Summary

JSIG §1.5.16 defines Privileged Users by reference: "See Account Management [AC-2], Separation of Duties [AC-5] and Rules of Behavior [PL-4], for privileged user responsibilities and considerations when appointing individuals to this role" ([JSIG §1.5.16](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)). Privileged Users are individuals granted elevated access rights (e.g., system administration, security administration, database administration) beyond those of general users, and their appointment and ongoing conduct are governed by the account-management, separation-of-duties, and rules-of-behavior controls JSIG points to.

## 2. JSIG-Defined Responsibilities (verbatim, JSIG §1.5.16)

- **JSIG §1.5.16 (verbatim, in full):** "See Account Management [AC-2], Separation of Duties [AC-5] and Rules of Behavior [PL-4], for privileged user responsibilities and considerations when appointing individuals to this role."

JSIG does not enumerate a standalone Privileged User duty list in Section 1.5; responsibilities derive from the referenced NIST/JSIG controls (AC-2, AC-5, PL-4) and from the operational duties assigned to Privileged Users elsewhere in Section 1.5 (e.g., System Administrator monitoring duties referenced under the ISSM at [JSIG §1.5.14(g)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)).

## 3. Daily/Recurring Operational Duties

Derived/synthesized from [MAINTENANCE-PLAN.md](../../MAINTENANCE-PLAN.md) and the referenced control families (AC-2, AC-5, PL-4); not verbatim JSIG text.

| Recurring Duty | Cadence | Related Control Family/ID(s) | Basis |
|---|---|---|---|
| Operate under least-privilege/separation-of-duties constraints; undergo periodic reassessment of privileged-function assignments | Quarterly reassessment | AC-6, AC-6(1), AC-5, CM-5(5) | [MAINTENANCE-PLAN §3.1 AC](../../MAINTENANCE-PLAN.md), [§3.5 CM](../../MAINTENANCE-PLAN.md) |
| Acknowledge/re-acknowledge Rules of Behavior applicable to privileged access | Annual, aligned with training refresh | PL-4 | [MAINTENANCE-PLAN §3.12 PL](../../MAINTENANCE-PLAN.md) |
| Undergo privileged-account entitlement review | Quarterly (recommended SAP default) | AC-2 | [MAINTENANCE-PLAN §3.1 AC](../../MAINTENANCE-PLAN.md) |
| Complete role-based technical/security training required for privileged functions | Initial (10–30 days of assignment) + annual refresh | AT-3 | [MAINTENANCE-PLAN §3.2 AT](../../MAINTENANCE-PLAN.md) |
| Monitor available resources providing warnings of system vulnerabilities or ongoing attacks (System Administrator subset of Privileged Users) | Continuous | SI-4, SI-5, RA-5 | [JSIG §1.5.14(g)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md); [MAINTENANCE-PLAN §3.17 SI](../../MAINTENANCE-PLAN.md) |
| Comply with account lifecycle actions (disable temporary/emergency accounts, disable inactive accounts) applicable to privileged accounts | ≤72 hrs (temporary/emergency); ≤90 days (inactive), per JSIG ODP | AC-2(2), AC-2(3) | [MAINTENANCE-PLAN §3.1 AC](../../MAINTENANCE-PLAN.md) |
| Rotate/refresh authenticators for privileged accounts | Per organization-defined credential-refresh cadence (90-day SAP default pending JSIG ODP verification) | IA-5 | [MAINTENANCE-PLAN §3.7 IA](../../MAINTENANCE-PLAN.md) |

## 4. Coordination Interfaces

- **ISSM/ISSO:** the ISSM ensures System Administrators (a Privileged User category) monitor vulnerability/attack-warning resources, and coordinates hardware/software/firmware changes that Privileged Users execute ([JSIG §1.5.14(g)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md), [(p)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)); Privileged Users report vulnerabilities/incidents discovered during operations to the ISSO/ISSM ([JSIG §1.5.15(f)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **Information Owner/Steward:** Privileged Users' access eligibility and privilege type are determined by the ISO in coordination with the Information Owner/Steward ([JSIG §1.5.12(d)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **Personnel Security:** privileged-account holders are subject to termination/transfer access-revocation actions coordinated through personnel security ([MAINTENANCE-PLAN §3.13 PS](../../MAINTENANCE-PLAN.md)).

## 5. Key Artifacts Owned/Produced

- Signed Rules of Behavior acknowledgment (privileged-user variant, where applicable).
- Privileged-account entitlement review sign-offs.
- Role-based training completion records.
- Change/maintenance tickets documenting privileged actions taken (e.g., configuration changes, account provisioning).
