# NIST SP 800-34 Revision 1 — Contingency Planning Guide for Federal Information Systems (Excerpt)

- **Source URL:** https://nvlpubs.nist.gov/nistpubs/legacy/sp/nistspecialpublication800-34r1.pdf
- **Retrieved:** 2026-07-17
- **Why included:** Supports the research file's CP-2/CP-3/CP-4 cadence claims: backup frequency policy language (daily/weekly, incremental/full), at-least-annual ISCP (Information System Contingency Plan) training, and the sample yearly test-and-maintenance schedule used as the template basis for tabletop-exercise cadence across Low/Moderate/High-impact systems.

> **NOTE — THIS IS AN EXCERPT, NOT THE COMPLETE DOCUMENT.** The full guide runs to roughly 7,600 lines (~150 pages including appendices) and includes complete ISCP templates for Low, Moderate, and High-impact systems, detailed BIA methodology, alternate site selection guidance, and full sample test-and-maintenance schedules. Only the backup-frequency, TT&E (Test, Training, and Exercise), and annual-training sections cited in the JSIG research file are reproduced below. For the complete document, download the PDF from the source URL above.

---

## 3.4.2 Backup Methods and Offsite Storage

System data should be backed up regularly. **Policies should specify the minimum frequency and scope of backups (e.g., daily or weekly, incremental or full) based on data criticality and the frequency that new information is introduced.** Data backup policies should designate the location of stored data, file-naming conventions, media rotation frequency, and method for transporting data offsite.

It is good business practice to store backed-up data offsite. Commercial data storage facilities are specially designed to archive media and protect data from threatening elements.

## 3.5 Plan Testing, Training, and Exercises (TT&E)

**Testing** — Tests are evaluation tools that use quantifiable metrics to validate the operability of an information system or system component in an operational environment. Tests often focus on recovery and backup operations; testing scope and frequency vary depending on the FIPS 199 impact level, the goal of the test, and its relation to a specific ISCP.

**3.5.2 Training** — Training for personnel with contingency plan responsibilities should focus on familiarizing them with ISCP roles and teaching skills necessary to accomplish those roles. **Training should be provided at least annually.** Personnel newly appointed to ISCP roles should receive training shortly thereafter.

## Appendix I — Sample Test and Maintenance Schedule

All ISCPs should be reviewed and tested **at the organization-defined frequency (e.g., yearly)** or whenever there is a significant change to the system. **For low-impact systems, a yearly tabletop exercise is sufficient.** The tabletop exercise should include all ISCP points of contact and be conducted by an outside or impartial observer.

The walk-through during the tabletop should cover:
- Notification procedures;
- System recovery on an alternate platform from backup media;
- Internal and external connectivity; and
- Reconstitution procedures.

Results of the test are documented in an After Action Report, and Lessons Learned are developed for updating information in the ISCP. The guide provides a sample yearly test-and-maintenance schedule (with dated milestones such as "Identify tabletop facilitator — April 1," "Develop tabletop test plan — May 1," "Invite participants — May 10") separately for low-, moderate-, and high-impact systems, each reflecting increasing TT&E rigor with FIPS 199 impact level.

Each ISCP includes an attestation: **"I further attest that this ISCP for {system name} will be tested at least annually."**

---

*End of excerpt. Full source: https://nvlpubs.nist.gov/nistpubs/legacy/sp/nistspecialpublication800-34r1.pdf*
