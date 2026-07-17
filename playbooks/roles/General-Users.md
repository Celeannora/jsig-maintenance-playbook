# General Users — Operational Playbook

> Network-agnostic role playbook. Applies regardless of network architecture, classification enclave, or technology stack. Source: [JSIG §1.5.17](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md), cross-referenced to [MAINTENANCE-PLAN.md](../../MAINTENANCE-PLAN.md) and the [JSIG control-families INDEX](../../reference/JSIG/control-families/INDEX.md).

## 1. Role Summary

JSIG §1.5.17 defines General Users by reference: "See Account Management [AC-2] and Rules of Behavior [PL-4], for general user responsibilities" ([JSIG §1.5.17](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)). General Users are individuals granted standard (non-privileged) access to an information system to perform mission, business, or operational tasks, and their responsibilities are governed by the account-management and rules-of-behavior controls JSIG points to.

## 2. JSIG-Defined Responsibilities (verbatim, JSIG §1.5.17)

- **JSIG §1.5.17 (verbatim, in full):** "See Account Management [AC-2] and Rules of Behavior [PL-4], for general user responsibilities."

JSIG does not enumerate a standalone General User duty list in Section 1.5; responsibilities derive from the referenced controls (AC-2, PL-4) and from the access-eligibility duty the ISSO performs before granting any user — general or privileged — access ([JSIG §1.5.15(e)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)).

## 3. Daily/Recurring Operational Duties

Derived/synthesized from [MAINTENANCE-PLAN.md](../../MAINTENANCE-PLAN.md) and the referenced control families (AC-2, PL-4); not verbatim JSIG text.

| Recurring Duty | Cadence | Related Control Family/ID(s) | Basis |
|---|---|---|---|
| Acknowledge/re-acknowledge Rules of Behavior prior to and during system access | Initial at account creation; annual re-acknowledgment thereafter | PL-4 | [MAINTENANCE-PLAN §3.12 PL](../../MAINTENANCE-PLAN.md) |
| Undergo periodic non-privileged account review | Semiannual (SAP default) | AC-2 | [MAINTENANCE-PLAN §3.1 AC](../../MAINTENANCE-PLAN.md) |
| Complete initial and annual security awareness training | Initial at onboarding; annual refresher | AT-2 | [MAINTENANCE-PLAN §3.2 AT](../../MAINTENANCE-PLAN.md) |
| Comply with account lifecycle actions (report change in need-to-know/status promptly so accounts can be updated/disabled) | Notify within the applicable notification window (8–24 hr per plan default) | AC-2 | [MAINTENANCE-PLAN §3.1 AC](../../MAINTENANCE-PLAN.md) |
| Maintain awareness of and report suspected security incidents encountered during normal use | Per-event (continuous readiness expectation) | IR-6 | [MAINTENANCE-PLAN §3.8 IR](../../MAINTENANCE-PLAN.md) |
| Rotate/refresh personal authenticators (passwords) as required | Per organization-defined credential-refresh cadence (90-day SAP default pending JSIG ODP verification) | IA-5 | [MAINTENANCE-PLAN §3.7 IA](../../MAINTENANCE-PLAN.md) |

## 4. Coordination Interfaces

- **ISSO:** verifies clearance, authorization, and need-to-know, and confirms user awareness of security responsibilities before granting IS access ([JSIG §1.5.15(e)](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)); receives incident reports from General Users.
- **Information Owner/Steward:** establishes rules for appropriate use and protection of the information General Users access ([JSIG §1.5.10](../../references/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **Training Manager (per MAINTENANCE-PLAN role table):** delivers initial and annual security awareness training to General Users ([MAINTENANCE-PLAN §2](../../MAINTENANCE-PLAN.md#2-roles--responsibilities)).
- **Personnel Security:** processes termination/transfer notifications that trigger General User account changes ([MAINTENANCE-PLAN §3.13 PS](../../MAINTENANCE-PLAN.md)).

## 5. Key Artifacts Owned/Produced

- Signed Rules of Behavior acknowledgment.
- Security awareness training completion record.
- Account request/access justification documentation (as the subject of, not author of, formal access records).
- Incident reports submitted for suspected security events.
