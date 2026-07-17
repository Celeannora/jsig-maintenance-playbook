# Program Security Officer (PSO) — Operational Playbook

> Network-agnostic role playbook. Applies regardless of network architecture, classification enclave, or technology stack. Source: [JSIG §1.5.9](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md), cross-referenced to [MAINTENANCE-PLAN.md](../../MAINTENANCE-PLAN.md) and the [JSIG control-families INDEX](../../reference/JSIG/control-families/INDEX.md).

## 1. Role Summary

JSIG §1.5.9 defines the PSO by reference only: "Reference DoDM 5205.07, SAP Security Manual, all volumes" ([JSIG §1.5.9](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)). The JSIG text does not itself enumerate PSO duties; instead, the PSO's core program-security functions are established by DoDM 5205.07 (all volumes), and JSIG's other role sections reference the PSO's interaction points within the RMF process — most notably that the AO "ensure[s] all assessments are coordinated with the CA Program Security Officer (PSO)" and that the SCA "advise[s] the ISO and PSO concerning the impact levels for confidentiality, integrity, and availability."

## 2. JSIG-Defined Responsibilities (verbatim, JSIG §1.5.9, plus JSIG cross-references)

- **JSIG §1.5.9 (verbatim, in full):** "Reference DoDM 5205.07, SAP Security Manual, all volumes."
- **Cross-referenced JSIG touchpoints involving the PSO elsewhere in Section 1.5:**
  - The AO must "ensure all assessments are coordinated with the CA Program Security Officer (PSO)" ([JSIG §1.5.5(h)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)).
  - The SCA responsibilities include "advise the ISO and PSO concerning the impact levels for confidentiality, integrity, and availability for the information on a system" ([JSIG §1.5.7(a)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)).
  - The ISSM must "coordinate with PSO or cognizant security official on approval of external information systems (e.g., guest systems, interconnected system with another organization)" ([JSIG §1.5.14(c)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)).

**Note:** JSIG does not enumerate a standalone PSO duty list in Section 1.5; the substantive PSO role is defined in DoDM 5205.07 (SAP Security Manual, all volumes), which is outside the scope of this JSIG-derived scaffold and should be consulted directly for full PSO responsibilities.

## 3. Daily/Recurring Operational Duties

Derived/synthesized from the JSIG cross-references above and [MAINTENANCE-PLAN.md](../../MAINTENANCE-PLAN.md); not verbatim JSIG text, and necessarily partial given JSIG's reference-only treatment of this role.

| Recurring Duty | Cadence | Related Control Family/ID(s) | Basis |
|---|---|---|---|
| Coordinate with the AO on assessment scheduling/results for systems under program purview | Per assessment cycle (annual minimum) | CA-2 | [JSIG §1.5.5(h)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md); [MAINTENANCE-PLAN §3.4 CA](../../MAINTENANCE-PLAN.md) |
| Advise the SCA/ISO on confidentiality/integrity/availability impact-level determinations | Annual, or upon significant system change | RA-2 | [JSIG §1.5.7(a)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md); [MAINTENANCE-PLAN §3.14 RA](../../MAINTENANCE-PLAN.md) |
| Coordinate with the ISSM on approval of external/interconnected/guest information systems | Event-driven, plus annual review of existing interconnection agreements | CA-3, AC-20 | [JSIG §1.5.14(c)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md); [MAINTENANCE-PLAN §3.4 CA](../../MAINTENANCE-PLAN.md), [§3.1 AC](../../MAINTENANCE-PLAN.md) |
| Support program-level physical/personnel security oversight consistent with DoDM 5205.07 (facility access, personnel security coordination) | Monthly (aligned with PE-2/PE-6 physical access log/list review cadence) | PE-2, PE-6, PS family | [MAINTENANCE-PLAN §3.11 PE](../../MAINTENANCE-PLAN.md), [§3.13 PS](../../MAINTENANCE-PLAN.md) — reasoned analogy given the PSO's program-security scope; not a JSIG-specified cadence |

## 4. Coordination Interfaces

- **Authorizing Official (AO):** the AO ensures all security assessments for the program are coordinated with the PSO ([JSIG §1.5.5(h)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **Security Control Assessor (SCA):** receives PSO input (alongside the ISO) on impact-level determinations ([JSIG §1.5.7(a)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **Information System Owner (ISO):** joint recipient of SCA impact-level advisement; coordinates on program-security matters affecting the system ([JSIG §1.5.7(a)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **Information System Security Manager (ISSM):** coordinates approval of external/interconnected/guest systems with the PSO or cognizant security official ([JSIG §1.5.14(c)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)).

## 5. Key Artifacts Owned/Produced

- Program-security coordination records supporting AO assessment scheduling (per DoDM 5205.07).
- Impact-level advisement input provided to the SCA/ISO.
- External/interconnected/guest-system approval coordination records with the ISSM.
- Program security documentation maintained under DoDM 5205.07, SAP Security Manual (all volumes) — outside direct JSIG scope but referenced by JSIG §1.5.9.
