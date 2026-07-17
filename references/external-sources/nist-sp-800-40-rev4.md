# NIST SP 800-40 Revision 4 — Guide to Enterprise Patch Management Planning (Excerpt)

- **Source URL:** https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-40r4.pdf
- **Retrieved:** 2026-07-17
- **Why included:** Supports the research file's SI-2/CM-8 cadence claims: the shift away from "monthly or quarterly" inventory updates toward continuous/automated inventory maintenance, the maintenance-plan concept (with defined timeframes for beginning/ending remediation actions per maintenance group), and the CISA Known Exploited Vulnerabilities (KEV) Catalog's Binding Operational Directive 22-01 two-week remediation deadline for federal agencies.

> **NOTE — THIS IS AN EXCERPT, NOT THE COMPLETE DOCUMENT.** The full publication runs to roughly 1,300 lines (~50 pages) and covers the complete patch management planning methodology, including asset/software inventory practices, patch prioritization, maintenance group definitions, and four maintenance-plan risk-response scenarios (routine patching, emergency patching, emergency mitigation, unpatchable assets). Only the sections on inventory-update cadence and the maintenance-plan/KEV-catalog deadline cited in the JSIG research file are reproduced below. For the complete document, download the PDF from the source URL above.

---

## Inventory Maintenance — Moving Beyond Monthly/Quarterly Scans

Organizations should establish and **constantly maintain up-to-date software inventories** for their physical and virtual computing assets, including OT, IoT, and container assets. A realistic goal is to maintain a close-to-comprehensive inventory by relying on automation to constantly discover new assets and collect up-to-date information on all assets.

**Without constant updates, inventories will quickly become outdated** and provide increasingly inaccurate and incomplete information for patching efforts. At one time, when assets and software were mostly static and located within static logical and physical perimeters, it was generally considered acceptable to update inventories **on a monthly or quarterly basis** by performing a vulnerability scan. **That model should no longer be used.**

## 3.5 Define Maintenance Plans for Each Maintenance Group

Organizations should define a maintenance plan for each maintenance group for each applicable risk-response scenario. A maintenance plan defines the actions to be taken when a scenario occurs for a maintenance group, **including the timeframes for beginning and ending each action**, along with any other pertinent information.

## Known Exploited Vulnerabilities (KEV) Catalog — Two-Week Federal Remediation Deadline

The Known Exploited Vulnerabilities Catalog is a list of vulnerabilities that are considered particularly important for organizations to mitigate. The Cybersecurity and Infrastructure Security Agency (CISA) created and maintains the catalog. **CISA's Binding Operational Directive 22-01 requires federal agencies to remediate new vulnerabilities added to the catalog within two weeks.** Other organizations may voluntarily choose to use the catalog to help prioritize their patching efforts.

CISA has also released Cybersecurity Incident & Vulnerability Response Playbooks for federal agencies, which "standardize the high-level process that agencies should follow when responding to...urgent and high-priority vulnerabilities" being actively exploited in the wild.

---

*End of excerpt. Full source: https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-40r4.pdf*
