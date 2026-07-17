# CMS Medicare Administrative Contractor Acceptable Risk Safeguards (MAC ARS 5.0) (Excerpt)

- **Source URL:** https://www.hhs.gov/guidance/sites/default/files/hhs-guidance-documents/CMS/117_Systems_security-MAC-ARS.pdf
- **Retrieved:** 2026-07-17
- **Why included:** Supports the research file's AC-1/AC-2 policy-and-account-review cadence claims with a concrete federal healthcare-sector implementation: 3-year policy review cycle, annual (365-day) account review cycle, 30-day account-status-change notification requirement, and tiered privileged-account review (quarterly) vs. standard user-account review (annual) — a useful cross-agency comparator to the JSIG/FedRAMP baseline cadences.

> **NOTE — THIS IS AN EXCERPT, NOT THE COMPLETE DOCUMENT.** MAC ARS 5.0 is a large control catalog covering all NIST 800-53-aligned control families as tailored by CMS's Medicare Contractor Management Group (MCMG). Only the AC-01 and AC-02 (and sub-control) sections relevant to the cadence claims cited in the JSIG research file are reproduced below. For the complete document, visit the source URL above.

---

## AC-01 — Policy and Procedures

**CMS Baseline:** Low / Moderate / High. **Priority:** P1.

Control statement requires the organization to review and update the access control policy and procedures **at least every three (3) years** and following CMS-defined events (assessment/audit findings, security or privacy incidents, or changes in applicable laws/regulations).

**Implementation Standard:**
- **Control Review Frequency:** Annually (365 Days)
- **Assessment Frequency:** Three (3) Years

**Privacy Implementation Standard:** "PRIV.1 - Monitor for changes to applicable privacy laws, regulations, and overarching policy that affect access control policies **no less often than once every 365 days**."

## AC-02 — Account Management

**CMS Baseline:** Low / Moderate / High / HVA. **Priority:** P1.

Key cadence provisions:
- (h) Notify account managers within: **30 days** when accounts are no longer required; **30 days** when users are terminated or transferred; **30 days** when system usage or need-to-know changes.
- (j) **Review accounts for compliance with account management requirements at least every 365 days for all systems.**
- **HVA-specific:** notify appropriate personnel **within 12 hours** for temporary/privileged accounts; review privileged accounts **no less often than quarterly**; privileged account access reauthorized **no less often than annually**; user accounts reviewed **no less often than annually**.

**Implementation Standard:**
> "Std.6 - Notify account managers within a Mission/Business/System-defined timeframe **not to exceed 30 days** when temporary accounts are no longer required or when system users are terminated or transferred or system usage or need-to-know/need-to-share changes."

- **Control Review Frequency:** Annually (365 Days)
- **Assessment Frequency:** Three (3) Years

### AC-02(01) — Automated System Account Management
- **Control Review Frequency:** Annually (365 Days). **Assessment Frequency:** Annually (365 Days).

### AC-02(02) — Automated Temporary and Emergency Account Management
> "Automatically disable emergency accounts within **24 hours** of issuance (activation) and temporary accounts within a fixed duration **not to exceed 30 days for High systems and 60 days for Moderate systems**."
- HVA variant: disable within **12 hours** of issuance.
- **Control Review Frequency:** Annually (365 Days). **Assessment Frequency:** Annually (365 Days).

### AC-02(03) — Disable Accounts
> "(a) Disable accounts within **thirty (30) days** when the accounts have expired, are no longer associated with a user, or are in violation of organizational policy; (b) Disable accounts when the accounts have been inactive **within 30 days for High Systems or 60 days for Moderate Systems**."
- **Control Review Frequency:** Two (2) Months. **Assessment Frequency:** Annually (365 Days).

### AC-02(04) — Automated Audit Actions
- **Control Review Frequency:** Annually (365 Days). **Assessment Frequency:** Annually (365 Days).

### AC-02(05) — Inactivity Logout
> "Require that users log out when the time-period of inactivity exceeds **90 minutes** and at the end of the user's normal work period."
- **Control Review Frequency:** Quarterly. **Assessment Frequency:** Annually (365 Days).

### AC-02(07) — Privileged User Accounts
- **Control Review Frequency:** Not Specified. **Assessment Frequency:** Three (3) Years.

### AC-02(09) — Restrictions on Use of Shared and Group Accounts
- **Control Review Frequency:** Not Specified. **Assessment Frequency:** Three (3) Years.

---

*End of excerpt. Full source: https://www.hhs.gov/guidance/sites/default/files/hhs-guidance-documents/CMS/117_Systems_security-MAC-ARS.pdf*
