# IRS Publication 1075 — Tax Information Security Guidelines for Federal, State, and Local Agencies (Excerpt)

- **Source URL:** https://www.irs.gov/pub/irs-pdf/p1075.pdf
- **Retrieved:** 2026-07-17
- **Why included:** Supports AU-6 (weekly audit review) / AU-11 (7-year audit retention), CP-9 (weekly backups), RA-5/SI-2 (monthly vulnerability scans, 30-day scan-signature updates), SI-3 (daily malicious-code tool updates, weekly + real-time scans, daily patch checks), PE-2/PE-3/PE-8 (annual facility access-list review, 12-month device inventory, monthly visitor-log review, 5-year visitor-log retention), IR-2 (30-day/annual incident response training, 3-year policy review), 24-hour TIGTA/Safeguards breach notification, and AC-2 (24-hour account-change notifications, annual/semiannual account review, 2-business-day temporary account removal, 120-day inactive account disablement) cadence claims in the research file.

> **NOTE — THIS IS AN EXCERPT, NOT THE COMPLETE DOCUMENT.** IRS Publication 1075 runs to more than 200 pages and includes the complete Safeguard Security Report requirements, the full NIST 800-53-based control catalog as tailored by the IRS Office of Safeguards, background investigation and disclosure-awareness training requirements, and detailed data-sharing agreement language. Only the control statements and IRS-defined parameters relevant to cadence/frequency claims in the JSIG research file are reproduced below. For the complete document, download the PDF from the source URL above.

---

## AU-6: Audit Review, Analysis and Reporting

a. Review and analyze system audit records **weekly** for indications of inappropriate or unusual activity and the potential impact of the inappropriate or unusual activity;
b. Report findings to the individual(s) specified within the agency's incident response procedures; and
c. Adjust the level of audit record review, analysis, and reporting within the system when there is a change in risk based on law enforcement information, intelligence information, or other credible sources of information.

**(CE-1) Storage Warning Capacity:** Provide a warning to the SA and ISSO within **24 hours** when allocated audit log storage volume reaches a specified percentage of repository maximum capacity.

## AU-11: Audit Record Retention

**Retain audit records seven (7) years** to provide support for after-the-fact investigations of incidents and to meet regulatory and organizational information retention requirements.

## CP-9: System Backup

a. Conduct backups of user-level information contained in system documentation, including security-related documentation, **weekly**;
b. Conduct backups of system-level information contained in the system **weekly**;
c. Conduct backups of system documentation, including security- and privacy-related documentation, **weekly**; and
d. Protect the confidentiality, integrity, and availability of backup information.

## RA-5: Vulnerability Monitoring and Scanning (relevant excerpt)

Supplemental Guidance: Automated security scanning of assets (including wireless networks) for inventory, configuration, and vulnerability data, including at the application level, **must be included in monthly required vulnerability scans**.

**(CE-2) Update by Vulnerabilities to be Scanned:** Update the system vulnerabilities to be scanned **at least every 30 days**; prior to a new scan; when new vulnerabilities are identified and reported.

## SI-3: Malicious Code Protection

a. Implement signature-based and/or non-signature-based malicious code protection mechanisms at system entry and exit points to detect and eradicate malicious code;
b. Automatically update malicious code protection mechanisms as new releases are available in accordance with organizational configuration management policy and procedures;
c. Configure malicious code protection mechanisms to:
   1. Perform periodic scans of the system and implement **weekly and real-time scans** of files from external sources at endpoint and network entry/exit points as the files are downloaded, opened, or executed in accordance with agency security policy; and
   2. Either block or quarantine and send alert to system administrator in response to malicious code detection; and
d. Address the receipt of false positives during malicious code detection and eradication.

**(IRS-Defined):** Not less than **daily**, the agency shall check for updates to malicious code scanning tools, including anti-virus (AV) and anti-spyware software and intrusion detection tools, and when updates are available, implement on all devices on which such tools reside.

**(IRS-Defined, patch checking):** The agency shall ensure that, upon daily power up and connection to the agency's network, workstations (including remote GFE connections) are checked to ensure the most recent agency-approved patches have been applied, and that any absent or new patches are applied as necessary or otherwise checked **not less than once every 24 hours** (excluding weekends, holidays, etc.).

## PE-2: Physical Access Authorizations

a. Develop, approve, and maintain a list of individuals with authorized access to the facility where the system resides;
b. Issue authorization credentials for facility access;
c. **Review the access list detailing authorized facility access by individuals at least annually**; and
d. Remove individuals from the facility access list when access is no longer required.

## PE-3: Physical Access Control (relevant excerpt)

f. Inventory organization-defined physical access devices **every twelve (12) months**; and
g. Change combinations and keys **at least annually** and/or when keys are lost, combinations are compromised, or when individuals possessing the keys or combinations are transferred or terminated.

## PE-8: Visitor Access Records

a. Maintain visitor access records to the facility where the system resides **for five (5) years**;
b. **Review visitor access records at least monthly**; and
c. Report anomalies in visitor access records to agency-defined personnel.

## IR-1 / IR-2: Incident Response Policy, Procedures, and Training

IR-1c. Review and update the current incident response:
   1. Policy **every three (3) years** (or if there is a significant change); and
   2. Procedures **every three (3) years** (or if there is a significant change).

IR-2. Provide incident response training to system users consistent with assigned roles and responsibilities:
   1. **Within 30 days** of assuming an incident response role or responsibility or acquiring system access;
   2. When required by system changes; and
   3. **Annually thereafter**; and
   b. Review and update incident response training content **every three (3) years** and following major business/system change.

## Breach / Incident Notification — 24-Hour Rule

The employee, contractor, or sub-contractor confidentiality statement must contain a statement that the employee understands they must report possible improper inspection or disclosure of FTI, including breaches and security incidents, and that **the Office of Safeguards and the Treasury Inspector General for Tax Administration (TIGTA) must be notified within 24 hours** of discovering a possible improper inspection or disclosure.

## AC-2: Account Management (relevant excerpt)

h. Notify account managers and designated agency official within:
   1. **24 hours** when accounts are no longer required;
   2. **24 hours** when users are terminated or transferred; and
   3. **24 hours** when system usage or need-to-know changes for an individual;
...
j. **Review accounts for compliance with account management requirements annually for user accounts and semi-annually for privileged accounts**;

**(CE-2) Removal of Temporary and Emergency Accounts:** Automatically disable and remove temporary and emergency accounts **after two (2) business days**.

**(CE-3) Disable Accounts:** Disable accounts within **120 days** when the accounts:
a. Have expired;
b. Are no longer associated with a user or individual;
c. Are in violation of organizational policy; or
d. Have been inactive for **120 days for non-privileged accounts and 60 days for privileged accounts**.

---

*End of excerpt. Full source: https://www.irs.gov/pub/irs-pdf/p1075.pdf*
