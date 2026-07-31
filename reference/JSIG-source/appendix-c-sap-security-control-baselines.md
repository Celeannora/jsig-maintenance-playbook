# JSIG Appendix C - SAP Security Control Baselines

Source URL: https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Archived source (used for extraction, direct URL returns HTTP 403): http://web.archive.org/web/20260405054539/https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Extraction note: Parsed from `pdftotext -layout` output of the complete 378-page JSIG PDF (retrieved 2026-07-17 via the Wayback Machine snapshot above) using a dedicated column-position parser (`parse_appendix_c.py`, in this directory) that derives real mark-column positions per page directly from the data rows (header-row text was found to be positioned inconsistently relative to data marks, so header text is not used for column alignment; see the script's docstring for the full method and its spot-check verification). `X` = control selected for that baseline; `S` = applies specifically to SAP systems; `+` = Classified Overlay / Potentially Common-Inheritable flag; blank = not selected/not applicable; *Withdrawn* = control withdrawn from the catalog (per source). This supersedes the prior partial extraction of this appendix. Known limitation: in a small number of all-blank-marks rows within the Privacy sub-families (AP/AR/DI/DM/IP/SE/TR/UL), a wrapped title continuation line in the source may print attached to the adjacent row instead of its own row (e.g. DI-2's title shows a duplicated "Data Integrity" fragment); no baseline mark data is affected, since these rows carry no marks at all. See EXTRACTION-LOG.md for detail.

---

The table below lists, for every JSIG security control and control enhancement, whether it is selected for the Confidentiality-Low/Moderate/High, Integrity-Low/Moderate/High, and Availability-Low/Moderate/High baselines, plus whether it carries the Classified Overlay flag or the Potentially Common/Inheritable flag.


| ID | Title | C-L | C-M | C-H | I-L | I-M | I-H | A-L | A-M | A-H | Classified Overlay | Potentially Common/Inheritable |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| AC-1 | Access Control Policy And Procedures | X | X | X | X | X | X | X | X | X |  | X |
| AC-2 | Account Management | X | X | X | X | X | X |  |  |  |  |  |
| AC-2(1) | AUTOMATED SYSTEM ACCOUNT MANAGEMENT |  | X | X |  | X | X |  |  |  |  | X |
| AC-2(2) | REMOVAL OF TEMPORARY / EMERGENCY ACCOUNTS |  | X | X |  | X | X |  |  |  |  | X |
| AC-2(3) | DISABLE INACTIVE ACCOUNTS |  | X | X |  | X | X |  |  |  |  | X |
| AC-2(4) | AUTOMATED AUDIT ACTIONS | X | X | X | X | X | X |  |  |  |  | X |
| AC-2(5) | INACTIVITY LOGOUT | X | X | X | X | X | X | X | X | X |  | X |
| AC-2(6) | DYNAMIC PRIVILEGE MANAGEMENT |  |  |  |  |  |  |  |  |  |  |  |
| AC-2(7) | ROLE-BASED SCHEMES | X | X | X | X | X | X |  |  |  |  |  |
| AC-2(8) | DYNAMIC ACCOUNT CREATION |  |  |  |  |  |  |  |  |  |  |  |
| AC-2(9) | RESTRICTIONS ON USE OF SHARED GROUPS / ACCOUNTS | X | X | X | X | X | X |  |  |  |  | X |
| AC-2(10) | SHARED / GROUP ACCOUNT CREDENTIAL TERMINATION | X | X | X | X | X | X |  |  |  |  |  |
| AC-2(11) | USAGE CONDITIONS |  |  | X |  |  | X |  |  |  |  |  |
| AC-2(12) | ACCOUNT MONITORING / ATYPICAL USAGE | X | X | X | X | X | X |  |  |  |  | X |
| AC-2(13) | DISABLE ACCOUNTS FOR HIGH-RISK INDIVIDUALS | X | X | X | X | X | X |  |  |  |  |  |
| AC-3 | Access Enforcement | X | X | X | X | X | X |  |  |  |  |  |
| AC-3(1) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| AC-3(2) | DUAL AUTHORIZATION |  |  |  |  |  |  |  |  |  | + |  |
| AC-3(3) | MANDATORY ACCESS CONTROL |  |  |  |  |  |  |  |  |  |  |  |
| AC-3(4) | DISCRETIONARY ACCESS CONTROL | X | X | X | X | X | X |  |  |  | + |  |
| AC-3(5) | SECURITY-RELEVANT INFORMATION |  |  |  |  |  |  |  |  |  |  |  |
| AC-3(6) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| AC-3(7) | ROLE-BASED ACCESS CONTROL |  |  |  |  |  |  |  |  |  |  |  |
| AC-3(8) | REVOCATION OF ACCESS AUTHORIZATIONS |  |  |  |  |  |  |  |  |  |  |  |
| AC-3(9) | CONTROLLED RELEASE |  |  |  |  |  |  |  |  |  |  |  |
| AC-3(10) | AUDITED OVERRIDE OF ACCESS CONTROL MECHANISMS |  |  |  |  |  |  |  |  |  |  |  |
| AC-4 | Information Flow Enforcement |  | X | X |  | X | X |  |  |  |  | X |
| AC-4(1) | OBJECT SECURITY ATTRIBUTES |  |  |  |  |  |  |  |  |  |  | X |
| AC-4(2) | PROCESSING DOMAINS |  |  |  |  |  |  |  |  |  |  | X |
| AC-4(3) | DYNAMIC INFORMATION FLOW CONTROL |  |  |  |  |  |  |  |  |  |  | X |
| AC-4(4) | CONTENT CHECK ENCRYPTED INFORMATION |  |  |  |  |  |  |  |  |  |  | X |
| AC-4(5) | EMBEDDED DATA TYPES |  |  |  |  |  |  |  |  |  |  | X |
| AC-4(6) | METADATA |  |  |  |  |  |  |  |  |  |  | X |
| AC-4(7) | ONE-WAY FLOW MECHANISMS |  |  |  |  |  |  |  |  |  |  | X |
| AC-4(8) | SECURITY POLICY FILTERS |  |  |  |  |  |  |  |  |  |  | X |
| AC-4(9) | HUMAN REVIEWS |  |  |  |  |  |  |  |  |  |  | X |
| AC-4(10) | ENABLE / DISABLE SECURITY POLICY FILTERS |  |  |  |  |  |  |  |  |  |  | X |
| AC-4(11) | CONFIGURATION OF SECURITY POLICY FILTERS |  |  |  |  |  |  |  |  |  |  | X |
| AC-4(12) | DATA TYPE IDENTIFIERS |  |  |  |  |  |  |  |  |  |  | X |
| AC-4(13) | DECOMPOSITION INTO POLICY- RELEVANT SUBCOMPONENTS |  |  |  |  |  |  |  |  |  |  | X |
| AC-4(14) | SECURITY POLICY FILTER CONSTRAINTS |  |  |  |  |  |  |  |  |  |  | X |
| AC-4(15) | DETECTION OF UNSANCTIONED INFORMATION |  |  |  |  |  |  |  |  |  |  | X |
| AC-4(16) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| AC-4(17) | DOMAIN AUTHENTICATION |  |  |  |  |  |  |  |  |  |  | X |
| AC-4(18) | SECURITY ATTRIBUTE BINDING |  |  |  |  |  |  |  |  |  |  |  |
| AC-4(19) | VALIDATION OF METADATA |  |  |  |  |  |  |  |  |  |  | X |
| AC-4(20) | APPROVED SOLUTIONS |  |  |  |  |  |  |  |  |  |  | X |
| AC-4(21) | PHYSICAL / LOGICAL SEPARATION OF INFORMATION FLOWS |  |  |  |  |  |  |  |  |  |  | X |
| AC-4(22) | ACCESS ONLY |  |  |  |  |  |  |  |  |  |  | X |
| AC-5 | Separation Of Duties | X | X | X | X | X | X |  |  |  | + |  |
| AC-6 | Least Privilege | X | X | X | X | X | X |  |  |  | + |  |
| AC-6(1) | AUTHORIZE ACCESS TO SECURITY FUNCTIONS | X | X | X | X | X | X |  |  |  |  |  |
| AC-6(2) | NON-PRIVILEGED ACCESS FOR NONSECURITY FUNCTIONS | X | X | X | X | X | X |  |  |  |  |  |
| AC-6(3) | NETWORK ACCESS TO PRIVILEGED COMMANDS |  |  | X |  |  | X |  |  |  |  |  |
| AC-6(4) | SEPARATE PROCESSING DOMAINS |  |  |  |  |  |  |  |  |  |  |  |
| AC-6(5) | PRIVILEGED ACCOUNTS | X | X | X | X | X | X |  |  |  |  | X |
| AC-6(6) | PRIVILEGED ACCESS BY NON- ORGANIZATIONAL USERS |  |  |  |  |  |  |  |  |  |  | X |
| AC-6(7) | REVIEW OF USER PRIVILEGES | X | X | X | X | X | X |  |  |  | + |  |
| AC-6(8) | PRIVILEGE LEVELS FOR CODE EXECUTION | X | X | X | X | X | X |  |  |  |  |  |
| AC-6(9) | AUDITING USE OF PRIVILEGED FUNCTIONS | X | X | X | X | X | X |  |  |  |  |  |
| AC-6(10) | PROHIBIT NON-PRIVILEGED USERS FROM EXECUTING PRIVILEGED FUNCTIONS | X | X | X | X | X | X |  |  |  |  |  |
| AC-7 | Unsuccessful Logon Attempts | X | X | X | X | X | X | X | X | X |  |  |
| AC-7(1) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| AC-7(2) | PURGE / WIPE MOBILE DEVICE |  |  |  |  |  |  |  |  |  |  |  |
| AC-8 | System Use Notification | X | X | X | X | X | X |  |  |  |  | X |
| AC-9 | Previous Logon (Access) Notification |  |  |  |  |  |  |  |  |  |  |  |
| AC-9(1) | UNSUCCESSFUL LOGONS |  |  |  |  |  |  |  |  |  |  |  |
| AC-9(2) | SUCCESSFUL / UNSUCCESSFUL LOGONS |  |  |  |  |  |  |  |  |  |  |  |
| AC-9(3) | NOTIFICATION OF ACCOUNT CHANGES |  |  |  |  |  |  |  |  |  |  |  |
| AC-9(4) | ADDITIONAL LOGON INFORMATION |  |  |  |  |  |  |  |  |  |  |  |
| AC-10 | Concurrent Session Control |  | X | X |  | X | X |  | X | X |  |  |
| AC-11 | Session Lock | X | X | X | X | X | X |  |  |  | + |  |
| AC-11(1) | PATTERN-HIDING DISPLAYS | X | X | X |  |  |  |  |  |  | + |  |
| AC-12 | Session Termination |  | X | X |  | X | X |  |  |  |  |  |
| AC-12(1) | USER-INITIATED LOGOUTS / MESSAGE DISPLAYS |  | X | X |  | X | X |  |  |  |  |  |
| AC-13 | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| AC-14 | Permitted Actions Without Identification Or Authentication | X | X | X | X | X | X |  |  |  |  |  |
| AC-14(1) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| AC-15 | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| AC-16 | Security Attributes |  | X | X |  | X | X |  |  |  | + |  |
| AC-16(1) | DYNAMIC ATTRIBUTE ASSOCIATION |  |  |  |  |  |  |  |  |  |  |  |
| AC-16(2) | ATTRIBUTE VALUE CHANGES BY AUTHORIZED INDIVIDUALS |  |  |  |  |  |  |  |  |  |  |  |
| AC-16(3) | MAINTENANCE OF ATTRIBUTE ASSOCIATIONS BY INFORMATION SYSTEM |  |  |  |  |  |  |  |  |  |  |  |
| AC-16(4) | ASSOCIATION OF ATTRIBUTES BY AUTHORIZED INDIVIDUALS |  |  |  |  |  |  |  |  |  |  |  |
| AC-16(5) | ATTRIBUTE DISPLAYS FOR OUTPUT DEVICES |  |  |  |  |  |  |  |  |  | + |  |
| AC-16(6) | MAINTENANCE OF ATTRIBUTE ASSOCIATION BY ORGANIZATION |  | X | X |  | X | X |  |  |  | + |  |
| AC-16(7) | CONSISTENT ATTRIBUTE INTERPRETATION |  |  |  |  |  |  |  |  |  | + |  |
| AC-16(8) | ASSOCIATION TECHNIQUES / TECHNOLOGIES |  |  |  |  |  |  |  |  |  |  |  |
| AC-16(9) | ATTRIBUTE REASSIGNMENT |  |  |  |  |  |  |  |  |  |  |  |
| AC-16(10) | ATTRIBUTE CONFIGURATION BY AUTHORIZED INDIVIDUALS |  |  |  |  |  |  |  |  |  |  |  |
| AC-17 | Remote Access | X | X | X | X | X | X |  |  |  |  | X |
| AC-17(1) | AUTOMATED MONITORING / CONTROL | X | X | X | X | X | X |  |  |  |  | X |
| AC-17(2) | PROTECTION OF CONFIDENTIALITY / INTEGRITY USING ENCRYPTION | X | X | X | X | X | X |  |  |  |  | X |
| AC-17(3) | MANAGED ACCESS CONTROL POINTS | X | X | X | X | X | X |  |  |  |  | X |
| AC-17(4) | PRIVILEGED COMMANDS / ACCESS | X | X | X | X | X | X |  |  |  |  |  |
| AC-17(5) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| AC-17(6) | PROTECTION OF INFORMATION | X | X | X |  |  |  |  |  |  |  | X |
| AC-17(7) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| AC-17(8) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| AC-17(9) | DISCONNECT / DISABLE ACCESS | X | X | X | X | X | X |  |  |  |  | X |
| AC-18 | Wireless Access | X | X | X | X | X | X |  |  |  | + | X |
| AC-18(1) | AUTHENTICATION AND ENCRYPTION | X | X | X | X | X | X |  |  |  |  | X |
| AC-18(2) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| AC-18(3) | DISABLE WIRELESS NETWORKING | X | X | X | X | X | X |  |  |  | + | X |
| AC-18(4) | RESTRICT CONFIGURATIONS BY USERS | X | X | X | X | X | X |  |  |  | + | X |
| AC-18(5) | ANTENNAS / TRANSMISSION POWER LEVELS |  |  | X |  |  | X |  |  |  |  | X |
| AC-19 | Access Control For Mobile Devices | X | X | X | X | X | X |  |  |  | + |  |
| AC-19(1) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| AC-19(2) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| AC-19(3) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| AC-19(4) | RESTRICTIONS FOR CLASSIFIED INFORMATION |  |  |  |  |  |  |  |  |  |  | X |
| AC-19(5) | FULL DEVICE / CONTAINER- BASED ENCRYPTION |  | X | X |  | X | X |  |  |  |  |  |
| AC-20 | Use Of External Information Systems | X | X | X | X | X | X |  |  |  | + | X |
| AC-20(1) | LIMITS ON AUTHORIZED USE | X | X | X | X | X | X |  |  |  | + | X |
| AC-20(2) | PORTABLE STORAGE DEVICES | X | X | X |  |  |  |  |  |  | + | X |
| AC-20(3) | NON-ORGANIZATIONALLY OWNED SYSTEMS / COMPONENTS / DEVICES | X | X | X | X | X | X |  |  |  | + |  |
| AC-20(4) | NETWORK ACCESSIBLE STORAGE DEVICES |  |  |  |  |  |  |  |  |  | + |  |
| AC-21 | Information Sharing |  | X | X |  |  |  |  |  |  |  |  |
| AC-21(1) | AUTOMATED DECISION SUPPORT |  |  |  |  |  |  |  |  |  |  |  |
| AC-21(2) | INFORMATION SEARCH AND RETRIEVAL |  |  |  |  |  |  |  |  |  |  |  |
| AC-22 | Publicly Accessible Content | X | X | X |  |  |  |  |  |  |  | X |
| AC-23 | DATA MINING PROTECTION |  | X | X |  |  |  |  |  |  | + | X |
| AC-24 | ACCESS CONTROL DECISIONS |  |  |  |  |  |  |  |  |  |  |  |
| AC-24(1) | TRANSMIT ACCESS AUTHORIZATION INFORMATION |  |  |  |  |  |  |  |  |  |  |  |
| AC-24(2) | NO USER OR PROCESS IDENTITY |  |  |  |  |  |  |  |  |  |  |  |
| AC-25 | REFERENCE MONITOR |  |  |  |  |  |  |  |  |  |  |  |
| AT-1 | Security Awareness And Training Policy And Procedures | X | X | X | X | X | X | X | X | X |  | X |
| AT-2 | Security Awareness Training | X | X | X | X | X | X | X | X | X | + | X |
| AT-2(1) | PRACTICAL EXERCISES |  |  |  |  |  |  |  |  |  |  | X |
| AT-2(2) | INSIDER THREAT | X | X | X | X | X | X | X | X | X | + | X |
| AT-3 | Role-Based Security Training | X | X | X | X | X | X | X | X | X |  | X |
| AT-3(1) | ENVIRONMENTAL CONTROLS |  |  |  |  |  |  |  |  |  |  | X |
| AT-3(2) | PHYSICAL SECURITY CONTROLS | X | X | X | X | X | X | X | X | X |  | X |
| AT-3(3) | PRACTICAL EXERCISES |  |  |  |  |  |  |  |  |  |  | X |
| AT-3(4) | SUSPICIOUS COMMUNICATIONS AND ANOMALOUS SYSTEM BEHAVIOR | X | X | X | X | X | X | X | X | X |  | X |
| AT-4 | Security Training Records | X | X | X | X | X | X | X | X | X |  | X |
| AT-5 | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| AU-1 | Audit And Accountability Policy And Procedures | X | X | X | X | X | X | X | X | X |  | X |
| AU-2 | Audit Events | X | X | X | X | X | X |  |  |  |  |  |
| AU-2(1) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| AU-2(2) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| AU-2(3) | REVIEWS AND UPDATES | X | X | X | X | X | X |  |  |  |  | X |
| AU-2(4) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| AU-3 | Content Of Audit Records | X | X | X | X | X | X |  |  |  |  |  |
| AU-3(1) | ADDITIONAL AUDIT INFORMATION | X | X | X | X | X | X |  |  |  |  |  |
| AU-3(2) | CENTRALIZED MANAGEMENT OF PLANNED AUDIT RECORD CONTENT |  |  | X |  |  | X |  |  |  |  | X |
| AU-4 | Audit Storage Capacity |  |  |  |  |  |  | X | X | X |  |  |
| AU-4(1) | TRANSFER TO ALTERNATE STORAGE | X | X | X | X | X | X | X | X | X |  |  |
| AU-5 | Response To Audit Processing Failures |  |  |  |  |  |  | X | X | X |  |  |
| AU-5(1) | AUDIT STORAGE CAPACITY |  |  |  |  |  |  | X | X | X |  |  |
| AU-5(2) | REAL-TIME ALERTS |  |  |  |  |  |  |  |  | X |  |  |
| AU-5(3) | CONFIGURABLE TRAFFIC VOLUME THRESHOLDS |  |  |  |  |  |  |  |  |  |  |  |
| AU-5(4) | SHUTDOWN ON FAILURE |  |  |  |  |  |  |  |  |  |  |  |
| AU-6 | Audit Review, Analysis, And Reporting | X | X | X | X | X | X |  |  |  | + | X |
| AU-6(1) | PROCESS INTEGRATION | X | X | X | X | X | X |  |  |  |  | X |
| AU-6(2) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| AU-6(3) | CORRELATE AUDIT REPOSITORIES | X | X | X | X | X | X |  |  |  |  | X |
| AU-6(4) | CENTRAL REVIEW AND ANALYSIS | X | X | X | X | X | X |  |  |  | + |  |
| AU-6(5) | INTEGRATION / SCANNING AND MONITORING CAPABILITIES |  |  | X |  |  | X |  |  |  | + | X |
| AU-6(6) | CORRELATION WITH PHYSICAL MONITORING |  |  | X |  |  | X |  |  |  |  | X |
| AU-6(7) | PERMITTED ACTIONS |  |  |  |  |  |  |  |  |  |  |  |
| AU-6(8) | FULL TEXT ANALYSIS OF PRIVILEGED COMMANDS |  |  |  |  |  |  |  |  |  | + |  |
| AU-6(9) | CORRELATION WITH INFORMATION FROM NONTECHNICAL SOURCES |  |  |  |  |  |  |  |  |  | + | X |
| AU-6(10) | AUDIT LEVEL ADJUSTMENT | X | X | X | X | X | X |  |  |  |  |  |
| AU-7 | Audit Reduction And Report Generation |  | X | X |  | X | X |  |  |  |  | X |
| AU-7(1) | AUTOMATIC PROCESSING |  | X | X |  | X | X |  |  |  |  | X |
| AU-7(2) | AUTOMATIC SORT AND SEARCH |  |  |  |  |  |  |  |  |  |  |  |
| AU-8 | Time Stamps |  |  |  | X | X | X |  |  |  |  |  |
| AU-8(1) | SYNCHRONIZATION WITH AUTHORITATIVE TIME SOURCE |  |  |  | X | X | X |  |  |  |  |  |
| AU-8(2) | SECONDARY AUTHORITATIVE TIME SOURCE |  |  |  |  |  |  |  |  |  |  |  |
| AU-9 | Protection Of Audit Information | X | X | X | X | X | X | X | X | X |  |  |
| AU-9(1) | HARDWARE WRITE-ONCE MEDIA |  |  |  |  |  |  |  |  |  |  |  |
| AU-9(2) | AUDIT BACKUP ON SEPARATE PHYSICAL SYSTEMS / COMPONENTS |  |  |  |  |  |  |  |  | X |  |  |
| AU-9(3) | CRYPTOGRAPHIC PROTECTION |  |  |  |  |  | X |  |  |  |  |  |
| AU-9(4) | ACCESS BY SUBSET OF PRIVILEGED USERS | X | X | X | X | X | X |  |  |  |  | X |
| AU-9(5) | DUAL AUTHORIZATION |  |  |  |  |  |  |  |  |  |  |  |
| AU-9(6) | READ ONLY ACCESS |  |  |  |  |  |  |  |  |  |  |  |
| AU-10 | Non-Repudiation |  |  |  |  | X | X |  |  |  |  |  |
| AU-10(1) | ASSOCIATION OF IDENTITIES |  |  |  |  |  |  |  |  |  |  |  |
| AU-10(2) | VALIDATE BINDING OF INFORMATION PRODUCER IDENTITY |  |  |  |  |  |  |  |  |  |  |  |
| AU-10(3) | CHAIN OF CUSTODY |  |  |  |  |  |  |  |  |  |  |  |
| AU-10(4) | VALIDATE BINDING OF INFORMATION REVIEWER IDENTITY |  |  |  |  |  |  |  |  |  |  |  |
| AU-10(5) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| AU-11 | Audit Record Retention |  |  |  |  |  |  | X | X | X |  | X |
| AU-11(1) | LONG-TERM RETRIEVAL CAPABILITY |  |  |  |  |  |  | X | X | X |  |  |
| AU-12 | Audit Generation | X | X | X | X | X | X |  |  |  | + |  |
| AU-12(1) | SYSTEM-WIDE / TIME- CORRELATED AUDIT TRAIL |  |  |  | X | X | X |  |  |  |  |  |
| AU-12(2) | STANDARDIZED FORMATS |  |  |  |  |  |  |  |  |  |  |  |
| AU-12(3) | CHANGES BY AUTHORIZED INDIVIDUALS | X | X | X | X | X | X |  |  |  |  |  |
| AU-13 | Monitoring For Information Disclosure |  |  |  |  |  |  |  |  |  |  | X |
| AU-13(1) | USE OF AUTOMATED TOOLS |  |  |  |  |  |  |  |  |  |  |  |
| AU-13(2) | REVIEW OF MONITORED SITES |  |  |  |  |  |  |  |  |  |  |  |
| AU-14 | Session Audit | X | X | X | X | X | X |  |  |  | + |  |
| AU-14(1) | SYSTEM START-UP | X | X | X | X | X | X |  |  |  |  |  |
| AU-14(2) | CAPTURE/RECORD AND LOG CONTENT | X | X | X | X | X | X |  |  |  |  |  |
| AU-14(3) | REMOTE VIEWING / LISTENING | X | X | X |  |  |  |  |  |  |  |  |
| AU-15 | Alternate Audit Capability |  |  |  |  |  |  |  |  |  |  |  |
| AU-16 | Cross-Organizational Auditing |  |  |  |  |  |  |  |  |  | + | X |
| AU-16(1) | IDENTITY PRESERVATION |  |  |  |  |  |  |  |  |  | + |  |
| AU-16(2) | SHARING OF AUDIT INFORMATION |  |  |  |  |  |  |  |  |  | + |  |
| CA-1 | Security Assessment And Authorization Policies And Procedures | X | X | X | X | X | X | X | X | X |  | X |
| CA-2 | Security Assessments | X | X | X | X | X | X | X | X | X |  | X |
| CA-2(1) | INDEPENDENT ASSESSORS | X | X | X | X | X | X | X | X | X |  | X |
| CA-2(2) | SPECIALIZED ASSESSMENTS |  |  | X |  |  | X |  |  | X |  | X |
| CA-2(3) | EXTERNAL ORGANIZATIONS |  |  |  |  |  |  |  |  |  |  | X |
| CA-3 | System Interconnections | X | X | X | X | X | X |  |  |  | + |  |
| CA-3(1) | UNCLASSIFIED NATIONAL SECURITY SYSTEM CONNECTIONS | X | X | X |  |  |  |  |  |  |  | X |
| CA-3(2) | CLASSIFIED NATIONAL SECURITY SYSTEM CONNECTIONS |  |  |  |  |  |  |  |  |  | + | X |
| CA-3(3) | UNCLASSIFIED NON-NATIONAL SECURITY SYSTEM CONNECTIONS |  |  |  |  |  |  |  |  |  |  |  |
| CA-3(4) | CONNECTIONS TO PUBLIC NETWORKS |  |  |  |  |  |  |  |  |  |  |  |
| CA-3(5) | RESTRICTIONS ON EXTERNAL SYSTEM CONNECTIONS | X | X | X | X | X | X |  |  |  |  |  |
| CA-4 | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| CA-5 | Plan Of Action And Milestones | X | X | X | X | X | X | X | X | X |  |  |
| CA-5(1) | AUTOMATION SUPPORT FOR ACCURACY / CURRENCY |  |  |  |  |  |  |  |  |  |  |  |
| CA-6 | Security Authorization | X | X | X | X | X | X | X | X | X |  |  |
| CA-7 | Continuous Monitoring | X | X | X | X | X | X | X | X | X |  |  |
| CA-7(1) | INDEPENDENT ASSESSMENT |  | X | X |  | X | X |  | X | X |  | X |
| CA-7(2) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| CA-7(3) | TREND ANALYSES |  |  |  |  |  |  |  |  |  |  |  |
| CA-8 | Penetration Testing |  |  |  |  |  | X |  |  |  |  |  |
| CA-8(1) | INDEPENDENT PENETRATION AGENT OR TEAM |  |  |  |  |  |  |  |  |  |  |  |
| CA-8(2) | RED TEAM EXERCISES |  |  |  |  |  |  |  |  |  |  |  |
| CA-9 | Internal System Connections | X | X | X | X | X | X |  |  |  |  | X |
| CA-9(1) | SECURITY COMPLIANCE CHECKS |  |  |  |  |  |  |  |  |  |  |  |
| CM-1 | Configuration Management Policy And Procedures | X | X | X | X | X | X |  |  |  |  | X |
| CM-2 | Baseline Configuration |  |  |  | X | X | X |  |  |  |  |  |
| CM-2(1) | REVIEWS AND UPDATES |  |  |  | X | X | X |  |  |  |  | X |
| CM-2(2) | AUTOMATION SUPPORT FOR ACCURACY / CURRENCY |  |  |  |  |  | X |  |  |  |  |  |
| CM-2(3) | RETENTION OF PREVIOUS CONFIGURATIONS |  |  |  |  | X | X |  |  |  |  |  |
| CM-2(4) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| CM-2(5) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| CM-2(6) | DEVELOPMENT AND TEST ENVIRONMENTS |  |  |  |  |  |  |  |  |  |  |  |
| CM-2(7) | CONFIGURE SYSTEMS, COMPONENTS, OR DEVICES FOR HIGH-RISK AREAS |  |  |  |  | X | X |  |  |  |  |  |
| CM-3 | Configuration Change Control |  |  |  | X | X | X |  |  |  |  | X |
| CM-3(1) | AUTOMATED DOCUMENT / NOTIFICATION / PROHIBITION OF CHANGES |  |  |  |  |  | X |  |  |  |  | X |
| CM-3(2) | TEST / VALIDATE / DOCUMENT CHANGES |  |  |  |  | X | X |  |  |  |  |  |
| CM-3(3) | AUTOMATED CHANGE IMPLEMENTATION |  |  |  |  |  |  |  |  |  |  |  |
| CM-3(4) | SECURITY REPRESENTATIVE |  |  |  | X | X | X |  |  |  |  | X |
| CM-3(5) | AUTOMATED SECURITY RESPONSE |  |  |  |  |  | X |  |  |  |  |  |
| CM-3(6) | CRYPTOGRAPHY MANAGEMENT |  |  |  | X | X | X |  |  |  | + |  |
| CM-4 | Security Impact Analysis |  |  |  | X | X | X |  |  |  |  | X |
| CM-4(1) | SEPARATE TEST ENVIRONMENTS |  |  |  |  | X | X |  |  |  |  |  |
| CM-4(2) | VERIFICATION OF SECURITY FUNCTIONS |  |  |  |  |  |  |  |  |  |  |  |
| CM-5 | Access Restrictions For Change |  |  |  | X | X | X |  |  |  |  |  |
| CM-5(1) | AUTOMATED ACCESS ENFORCEMENT / AUDITING |  |  |  |  | X | X |  |  |  |  |  |
| CM-5(2) | REVIEW SYSTEM CHANGES |  |  |  |  | X | X |  |  |  |  |  |
| CM-5(3) | SIGNED COMPONENTS |  |  |  |  |  | X |  |  |  |  |  |
| CM-5(4) | DUAL AUTHORIZATION |  |  |  |  |  |  |  |  |  |  |  |
| CM-5(5) | LIMIT PRODUCTION / OPERATIONAL PRIVILEGES |  |  |  | X | X | X |  |  |  | + | X |
| CM-5(6) | LIMIT LIBRARY PRIVILEGES |  |  |  | X | X | X |  |  |  |  | X |
| CM-5(7) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| CM-6 | Configuration Settings |  |  |  | X | X | X |  |  |  |  | X |
| CM-6(1) | AUTOMATED CENTRAL MANAGEMENT / APPLICATION / VERIFICATION |  |  |  |  | X | X |  |  |  |  | X |
| CM-6(2) | RESPOND TO UNAUTHORIZED CHANGES |  |  |  |  |  | X |  |  |  |  |  |
| CM-6(3) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| CM-6(4) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| CM-7 | Least Functionality | X | X | X | X | X | X |  |  |  |  |  |
| CM-7(1) | PERIODIC REVIEW | X | X | X | X | X | X |  |  |  |  |  |
| CM-7(2) | PREVENT PROGRAM EXECUTION | X | X | X | X | X | X |  |  |  |  |  |
| CM-7(3) | REGISTRATION COMPLIANCE | X | X | X | X | X | X |  |  |  |  | X |
| CM-7(4) | UNAUTHORIZED SOFTWARE / BLACKLISTING |  |  |  |  |  |  |  |  |  |  | X |
| CM-7(5) | AUTHORIZED SOFTWARE / WHITELISTING | X | X | X | X | X | X |  |  |  |  | X |
| CM-8 | Information System Component Inventory |  |  |  | X | X | X |  |  |  |  | X |
| CM-8(1) | UPDATES DURING INSTALLATIONS / REMOVALS |  |  |  |  | X | X |  |  |  |  |  |
| CM-8(2) | AUTOMATED MAINTENANCE |  |  |  | X | X | X |  |  |  |  | X |
| CM-8(3) | AUTOMATED UNAUTHORIZED COMPONENT DETECTION |  |  |  | X | X | X |  |  |  |  | X |
| CM-8(4) | ACCOUNTABILITY INFORMATION |  |  | X |  |  | X |  |  |  |  | X |
| CM-8(5) | NO DUPLICATE ACCOUNTING OF COMPONENTS |  |  |  |  | X | X |  |  |  |  | X |
| CM-8(6) | ASSESSED CONFIGURATIONS / APPROVED DEVIATIONS |  |  |  |  |  |  |  |  |  |  | X |
| CM-8(7) | CENTRALIZED REPOSITORY |  |  |  |  |  |  |  |  |  |  | X |
| CM-8(8) | AUTOMATED LOCATION TRACKING |  |  |  |  |  |  |  |  |  |  | X |
| CM-8(9) | ASSIGNMENT OF COMPONENTS TO SYSTEMS |  |  |  |  |  |  |  |  |  |  | X |
| CM-9 | Configuration Management Plan |  |  |  | X | X | X |  |  |  |  |  |
| CM-9(1) | ASSIGNMENT OF RESPONSIBILITY |  |  |  |  |  |  |  |  |  |  | X |
| CM-10 | SOFTWARE USAGE RESTRICTIONS |  |  |  | X | X | X |  |  |  |  | X |
| CM-10(1) | OPEN SOURCE SOFTWARE |  |  |  | X | X | X |  |  |  |  | X |
| CM-11 | USER-INSTALLED SOFTWARE | X | X | X | X | X | X |  |  |  |  | X |
| CM-11(1) | ALERTS FOR UNAUTHORIZED INSTALLATIONS |  |  | X |  |  | X |  |  |  |  |  |
| CM-11(2) | PROHIBIT INSTALLATION WITHOUT PRIVILEGED STATUS | X | X | X | X | X | X |  |  |  |  |  |
| CP-1 | Contingency Planning Policy And Procedures | X | X | X | X | X | X | X | X | X |  | X |
| CP-2 | Contingency Plan |  |  |  |  |  |  | X | X | X |  |  |
| CP-2(1) | COORDINATE WITH RELATED PLANS |  |  |  |  |  |  |  | X | X |  |  |
| CP-2(2) | CAPACITY PLANNING |  |  |  |  |  |  |  |  | X |  | X |
| CP-2(3) | RESUME ESSENTIAL MISSIONS / BUSINESS FUNCTIONS |  |  |  |  |  |  |  | X | X |  | X |
| CP-2(4) | RESUME ALL MISSIONS / BUSINESS FUNCTIONS |  |  |  |  |  |  |  |  | X |  | X |
| CP-2(5) | CONTINUE ESSENTIAL MISSIONS / BUSINESS FUNCTIONS |  |  |  |  |  |  |  |  | X |  | X |
| CP-2(6) | ALTERNATE PROCESSING / STORAGE SITE |  |  |  |  |  |  |  |  |  |  | X |
| CP-2(7) | COORDINATE WITH EXTERNAL SERVICE PROVIDERS |  |  |  |  |  |  |  |  |  |  |  |
| CP-2(8) | IDENTIFY CRITICAL ASSETS |  |  |  |  |  |  |  | X | X |  |  |
| CP-3 | Contingency Training |  |  |  |  |  |  | X | X | X |  |  |
| CP-3(1) | SIMULATED EVENTS |  |  |  |  |  |  |  |  | X |  |  |
| CP-3(2) | AUTOMATED TRAINING ENVIRONMENTS |  |  |  |  |  |  |  |  |  |  |  |
| CP-4 | Contingency Plan Testing |  |  |  |  |  |  | X | X | X |  |  |
| CP-4(1) | COORDINATE WITH RELATED PLANS |  |  |  |  |  |  |  | X | X |  |  |
| CP-4(2) | ALTERNATE PROCESSING SITE |  |  |  |  |  |  |  |  | X |  |  |
| CP-4(3) | AUTOMATED TESTING |  |  |  |  |  |  |  |  |  |  |  |
| CP-4(4) | FULL RECOVERY / RECONSTITUTION |  |  |  |  |  |  |  |  |  |  |  |
| CP-5 | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| CP-6 | Alternate Storage Site |  |  |  |  |  |  |  | X | X |  | X |
| CP-6(1) | SEPARATION FROM PRIMARY SITE |  |  |  |  |  |  |  | X | X |  | X |
| CP-6(2) | RECOVERY TIME / POINT OBJECTIVES |  |  |  |  |  |  |  |  | X |  | X |
| CP-6(3) | ACCESSIBILITY |  |  |  |  |  |  |  | X | X |  | X |
| CP-7 | Alternate Processing Site |  | X | X |  | X | X |  | X | X |  | X |
| CP-7(1) | SEPARATION FROM PRIMARY SITE |  |  |  |  |  |  |  | X | X |  | X |
| CP-7(2) | ACCESSIBILITY |  |  |  |  |  |  |  | X | X |  | X |
| CP-7(3) | PRIORITY OF SERVICE |  |  |  |  |  |  |  | X | X |  | X |
| CP-7(4) | PREPARATION FOR USE |  |  |  |  |  |  |  |  | X |  | X |
| CP-7(5) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| CP-7(6) | INABILITY TO RETURN TO PRIMARY SITE |  |  |  |  |  |  |  |  |  |  | X |
| CP-8 | Telecommunications Services |  |  |  |  |  |  |  | X | X |  | X |
| CP-8(1) | PRIORITY OF SERVICE PROVISIONS |  |  |  |  |  |  |  | X | X |  | X |
| CP-8(2) | SINGLE POINTS OF FAILURE |  |  |  |  |  |  |  | X | X |  | X |
| CP-8(3) | SEPARATION OF PRIMARY / ALTERNATE PROVIDERS |  |  |  |  |  |  |  |  | X |  | X |
| CP-8(4) | PROVIDER CONTINGENCY PLAN |  |  |  |  |  |  |  |  | X |  | X |
| CP-8(5) | ALTERNATE TELECOMMUNICATION SERVICE TESTING |  |  |  |  |  |  |  |  | X |  |  |
| CP-9 | Information System Backup | X | X | X | X | X | X | X | X | X |  |  |
| CP-9(1) | TESTING FOR RELIABILITY / INTEGRITY |  |  |  |  | X | X |  | X | X |  |  |
| CP-9(2) | TEST RESTORATION USING SAMPLING |  |  |  |  |  |  |  |  | X |  |  |
| CP-9(3) | SEPARATE STORAGE FOR CRITICAL INFORMATION |  |  |  |  |  |  |  |  | X |  | X |
| CP-9(4) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| CP-9(5) | TRANSFER TO ALTERNATE STORAGE SITE |  |  |  |  |  |  |  | X | X |  |  |
| CP-9(6) | REDUNDANT SECONDARY SYSTEM |  |  |  |  |  |  |  |  |  |  |  |
| CP-9(7) | DUAL AUTHORIZATION |  |  |  |  |  |  |  |  |  |  |  |
| CP-10 | Information System Recovery And Reconstitution |  |  |  |  |  |  | X | X | X |  | X |
| CP-10(1) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| CP-10(2) | TRANSACTION RECOVERY |  |  |  |  | X | X |  | X | X |  |  |
| CP-10(3) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| CP-10(4) | RESTORE WITHIN TIME PERIOD |  |  |  |  |  | X |  |  | X |  |  |
| CP-10(5) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| CP-10(6) | COMPONENT PROTECTION |  |  |  |  |  |  |  |  |  |  |  |
| CP-11 | Alternate Communications Protocols |  |  |  |  |  |  |  |  |  |  |  |
| CP-12 | Safe Mode |  |  |  |  |  |  |  |  |  |  |  |
| CP-13 | Alternative Security Mechanisms |  |  |  |  |  |  |  |  |  |  |  |
| IA-1 | Identification And Authentication Policy And Procedures | X | X | X | X | X | X |  |  |  |  | X |
| IA-2 | Identification And Authentication (Organizational Users) | X | X | X | X | X | X |  |  |  | + |  |
| IA-2(1) | NETWORK ACCESS TO PRIVILEGED ACCOUNTS | X | X | X | X | X | X |  |  |  | + |  |
| IA-2(2) | NETWORK ACCESS TO NON- PRIVILEGED ACCOUNTS | X | X | X | X | X | X |  |  |  | + |  |
| IA-2(3) | LOCAL ACCESS TO PRIVILEGED ACCOUNTS |  | X | X |  | X | X |  |  |  |  |  |
| IA-2(4) | LOCAL ACCESS TO NON- PRIVILEGED ACCOUNTS |  | X | X |  | X | X |  |  |  |  |  |
| IA-2(5) | GROUP AUTHENTICATION | X | X | X | X | X | X |  |  |  |  |  |
| IA-2(6) | NETWORK ACCESS TO PRIVILEGED ACCOUNTS - SEPARATE DEVICE |  |  |  |  |  |  |  |  |  |  |  |
| IA-2(7) | NETWORK ACCESS TO NON- PRIVILEGED ACCOUNTS - SEPARATE DEVICE |  |  |  |  |  |  |  |  |  |  |  |
| IA-2(8) | NETWORK ACCESS TO PRIVILEGED ACCOUNTS - REPLAY RESISTANT | X | X | X | X | X | X |  |  |  |  |  |
| IA-2(9) | NETWORK ACCESS TO NON- PRIVILEGED ACCOUNTS - REPLAY RESISTANT |  | X | X |  | X | X |  |  |  |  |  |
| IA-2(10) | SINGLE SIGN-ON |  |  |  |  |  |  |  |  |  |  |  |
| IA-2(11) | REMOTE ACCESS - SEPARATE DEVICE | X | X | X | X | X | X |  |  |  |  |  |
| IA-2(12) | ACCEPTANCE OF PIV CREDENTIALS | X | X | X | X | X | X |  |  |  |  |  |
| IA-2(13) | OUT-OF-BAND AUTHENTICATION |  |  |  |  |  |  |  |  |  |  |  |
| IA-3 | Device Identification And Authentication | X | X | X | X | X | X |  |  |  |  |  |
| IA-3(1) | CRYPTOGRAPHIC BIDIRECTIONAL AUTHENTICATION |  | X | X |  | X | X |  |  |  |  |  |
| IA-3(2) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| IA-3(3) | DYNAMIC ADDRESS ALLOCATION |  |  |  |  |  |  |  |  |  |  | X |
| IA-3(4) | DEVICE ATTESTATION |  |  |  |  |  |  |  |  |  |  |  |
| IA-4 | Identifier Management | X | X | X | X | X | X |  |  |  |  | X |
| IA-4(1) | PROHIBIT ACCOUNT IDENTIFIERS AS PUBLIC IDENTIFIERS |  |  |  |  |  |  |  |  |  |  |  |
| IA-4(2) | SUPERVISOR AUTHORIZATION |  |  |  |  |  |  |  |  |  |  |  |
| IA-4(3) | MULTIPLE FORMS OF CERTIFICATION |  |  |  |  |  |  |  |  |  |  |  |
| IA-4(4) | IDENTIFY USER STATUS | X | X | X | X | X | X |  |  |  |  | X |
| IA-4(5) | DYNAMIC MANAGEMENT |  |  |  |  |  |  |  |  |  |  |  |
| IA-4(6) | CROSS-ORGANIZATION MANAGEMENT |  |  |  |  |  |  |  |  |  |  |  |
| IA-4(7) | IN-PERSON REGISTRATION |  |  |  |  |  |  |  |  |  |  |  |
| IA-5 | Authenticator Management | X | X | X | X | X | X |  |  |  |  | X |
| IA-5(1) | PASSWORD-BASED AUTHENTICATION | X | X | X | X | X | X |  |  |  |  |  |
| IA-5(2) | PKI-BASED AUTHENTICATION |  | X | X |  | X | X |  |  |  |  |  |
| IA-5(3) | IN-PERSON OR TRUSTED THIRD-PARTY REGISTRATION |  |  |  |  | X | X |  |  |  |  | X |
| IA-5(4) | AUTOMATED SUPPORT FOR PASSWORD STRENGTH DETERMINATION | X | X | X | X | X | X |  |  |  |  |  |
| IA-5(5) | CHANGE AUTHENTICATORS PRIOR TO DELIVERY |  |  |  |  |  |  |  |  |  |  |  |
| IA-5(6) | PROTECTION OF AUTHENTICATORS |  |  |  |  |  |  |  |  |  |  | X |
| IA-5(7) | NO EMBEDDED UNENCRYPTED STATIC AUTHENTICATORS | X | X | X |  |  |  |  |  |  |  |  |
| IA-5(8) | MULTIPLE INFORMATION SYSTEM ACCOUNTS | X | X | X | X | X | X |  |  |  |  | X |
| IA-5(9) | CROSS-ORGANIZATION CREDENTIAL MANAGEMENT |  |  |  |  |  |  |  |  |  |  |  |
| IA-5(10) | DYNAMIC CREDENTIAL ASSOCIATION |  |  |  |  |  |  |  |  |  |  |  |
| IA-5(11) | HARDWARE TOKEN-BASED AUTHENTICATION |  |  |  | X | X | X |  |  |  |  |  |
| IA-5(12) | BIOMETRIC AUTHENTICATION |  |  |  |  |  |  |  |  |  |  |  |
| IA-5(13) | EXPIRATION OF CACHED AUTHENTICATORS | X | X | X | X | X | X |  |  |  |  |  |
| IA-5(14) | MANAGING CONTENT OF PKI TRUST STORES | X | X | X | X | X | X |  |  |  |  | X |
| IA-5(15) | FICAM-APPROVED PRODUCTS AND SERVICES |  |  |  |  |  |  |  |  |  |  |  |
| IA-6 | Authenticator Feedback | X | X | X |  |  |  |  |  |  |  |  |
| IA-7 | Cryptographic Module Authentication | X | X | X | X | X | X |  |  |  |  |  |
| IA-8 | Identification And Authentication (Non-Organizational Users) | X | X | X | X | X | X |  |  |  |  |  |
| IA-8(1) | ACCEPTANCE OF PIV CREDENTIALS FROM OTHER AGENCIES | X | X | X | X | X | X |  |  |  |  |  |
| IA-8(2) | ACCEPTANCE OF THIRD-PARTY CREDENTIALS |  |  |  | X | X | X |  |  |  |  |  |
| IA-8(3) | USE OF FICAM-APPROVED PRODUCTS |  |  |  | X | X | X |  |  |  |  |  |
| IA-8(4) | USE OF FICAM-ISSUED PROFILES |  |  |  | X | X | X |  |  |  |  |  |
| IA-8(5) | ACCEPTANCE OF PIV-I CREDENTIALS |  |  |  |  |  |  |  |  |  |  |  |
| IA-9 | Service Identification and Authentication |  |  |  |  |  |  |  |  |  |  |  |
| IA-9(1) | INFORMATION EXCHANGE |  |  |  |  |  |  |  |  |  |  |  |
| IA-9(2) | TRANSMISSION OF DECISIONS |  |  |  |  |  |  |  |  |  |  |  |
| IA-10 | Adaptive Identification and Authentication |  |  | X |  |  | X |  |  |  |  |  |
| IA-11 | Re-authentication |  |  | X |  |  | X |  |  |  |  |  |
| IR-1 | Incident Response Policy And Procedures | X | X | X | X | X | X | X | X | X |  | X |
| IR-2 | Incident Response Training | X | X | X | X | X | X | X | X | X |  |  |
| IR-2(1) | SIMULATED EVENTS |  |  | X |  |  | X |  |  | X |  |  |
| IR-2(2) | AUTOMATED TRAINING ENVIRONMENTS |  |  |  |  |  | X |  |  | X |  |  |
| IR-3 | Incident Response Testing | X | X | X | X | X | X | X | X | X |  |  |
| IR-3(1) | AUTOMATED TESTING |  |  |  |  |  |  |  |  |  |  |  |
| IR-3(2) | COORDINATION WITH RELATED PLANS |  | X | X |  | X | X |  | X | X |  |  |
| IR-4 | Incident Handling | X | X | X | X | X | X | X | X | X |  | X |
| IR-4(1) | AUTOMATED INCIDENT HANDLING PROCESSES |  | X | X |  | X | X |  | X | X |  | X |
| IR-4(2) | DYNAMIC RECONFIGURATION |  |  |  |  |  |  |  |  |  |  |  |
| IR-4(3) | CONTINUITY OF OPERATIONS |  | X | X |  | X | X |  | X | X |  |  |
| IR-4(4) | INFORMATION CORRELATION | X | X | X | X | X | X | X | X | X |  | X |
| IR-4(5) | AUTOMATIC DISABLING OF INFORMATION SYSTEM |  |  |  |  |  |  |  |  |  |  |  |
| IR-4(6) | INSIDER THREATS - SPECIFIC CAPABILITIES | X | X | X | X | X | X | X | X | X |  |  |
| IR-4(7) | INSIDER THREATS - INTRA- ORGANIZATION COORDINATION | X | X | X | X | X | X | X | X | X |  |  |
| IR-4(8) | CORRELATION WITH EXTERNAL ORGANIZATIONS | X | X | X | X | X | X | X | X | X |  |  |
| IR-4(9) | DYNAMIC RESPONSE CAPABILITY |  |  |  |  |  |  |  |  |  |  |  |
| IR-4(10) | SUPPLY CHAIN COORDINATION |  |  |  |  |  |  |  |  |  |  |  |
| IR-5 | Incident Monitoring | X | X | X | X | X | X | X | X | X |  | X |
| IR-5(1) | AUTOMATED TRACKING / DATA COLLECTION / ANALYSIS |  |  | X |  |  | X |  |  | X |  | X |
| IR-6 | Incident Reporting | X | X | X | X | X | X | X | X | X |  | X |
| IR-6(1) | AUTOMATED REPORTING |  | X | X |  | X | X |  | X | X |  | X |
| IR-6(2) | VULNERABILITIES RELATED TO INCIDENTS | X | X | X | X | X | X | X | X | X |  | X |
| IR-6(3) | COORDINATION WITH SUPPLY CHAIN |  |  |  |  |  |  |  |  |  |  |  |
| IR-7 | Incident Response Assistance | X | X | X | X | X | X | X | X | X |  | X |
| IR-7(1) | AUTOMATION SUPPORT FOR AVAILABILITY OF INFORMATION / SUPPORT |  | X | X |  | X | X |  | X | X |  | X |
| IR-7(2) | COORDINATION WITH EXTERNAL PROVIDERS | X | X | X | X | X | X | X | X | X |  | X |
| IR-8 | Incident Response Plan | X | X | X | X | X | X | X | X | X |  | X |
| IR-9 | Information Spillage Response | X | X | X |  |  |  |  |  |  | + |  |
| IR-9(1) | RESPONSIBLE PERSONNEL | X | X | X |  |  |  |  |  |  | + |  |
| IR-9(2) | TRAINING | X | X | X |  |  |  |  |  |  | + |  |
| IR-9(3) | POST-SPILL OPERATIONS |  |  |  |  |  |  |  | X | X |  |  |
| IR-9(4) | EXPOSURE TO UNAUTHORIZED PERSONNEL | X | X | X |  |  |  |  |  |  | + |  |
| IR-10 | Integrated Information Security Cell |  | X | X |  | X | X |  | X | X |  |  |
| MA-1 | System Maintenance Policy And Procedures | X | X | X | X | X | X | X | X | X |  | X |
| MA-2 | Controlled Maintenance | X | X | X | X | X | X | X | X | X |  |  |
| MA-2(1) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| MA-2(2) | AUTOMATED MAINTENANCE ACTIVITIES |  |  | X |  |  | X |  |  | X |  |  |
| MA-3 | Maintenance Tools |  |  |  | X | X | X |  |  |  |  | X |
| MA-3(1) | INSPECT TOOLS |  |  |  |  | X | X |  |  |  |  | X |
| MA-3(2) | INSPECT MEDIA |  |  |  | X | X | X |  |  |  |  | X |
| MA-3(3) | PREVENT UNAUTHORIZED REMOVAL | X | X | X |  |  |  |  |  |  | + |  |
| MA-3(4) | RESTRICTED TOOL USE |  |  |  |  |  |  |  |  |  |  |  |
| MA-4 | Nonlocal Maintenance |  |  |  | X | X | X |  |  |  |  |  |
| MA-4(1) | AUDITING AND REVIEW |  |  |  |  | X | X |  |  |  |  | X |
| MA-4(2) | DOCUMENT NONLOCAL MAINTENANCE |  |  |  |  | X | X |  |  |  |  |  |
| MA-4(3) | COMPARABLE SECURITY / SANITIZATION | X | X | X | X | X | X |  |  |  |  |  |
| MA-4(4) | AUTHENTICATION / SEPARATION OF MAINTENANCE SESSIONS |  |  |  |  |  |  |  |  |  |  |  |
| MA-4(5) | APPROVALS AND NOTIFICATIONS |  |  |  |  |  |  |  |  |  |  | X |
| MA-4(6) | CRYPTOGRAPHIC PROTECTION | X | X | X | X | X | X |  |  |  |  |  |
| MA-4(7) | REMOTE DISCONNECT VERIFICATION |  |  |  | X | X | X |  |  |  |  |  |
| MA-5 | Maintenance Personnel | X | X | X | X | X | X | X | X | X |  |  |
| MA-5(1) | INDIVIDUALS WITHOUT APPROPRIATE ACCESS |  |  | X |  |  | X |  |  | X | + |  |
| MA-5(2) | SECURITY CLEARANCES FOR CLASSIFIED SYSTEMS |  |  |  |  |  |  |  |  |  |  | X |
| MA-5(3) | CITIZENSHIP REQUIREMENTS FOR CLASSIFIED SYSTEMS |  |  |  |  |  |  |  |  |  |  | X |
| MA-5(4) | FOREIGN NATIONALS |  |  |  |  |  |  |  |  |  |  |  |
| MA-5(5) | NONSYSTEM-RELATED MAINTENANCE |  |  |  |  |  |  |  |  |  |  |  |
| MA-6 | Timely Maintenance |  |  |  |  |  |  |  | X | X |  |  |
| MA-6(1) | PREVENTIVE MAINTENANCE |  |  |  |  |  |  |  |  |  |  |  |
| MA-6(2) | PREDICTIVE MAINTENANCE |  |  |  |  |  |  |  |  |  |  |  |
| MA-6(3) | AUTOMATED SUPPORT FOR PREDICTIVE MAINTENANCE |  |  |  |  |  |  |  |  |  |  |  |
| MP-1 | Media Protection Policy And Procedures | X | X | X | X | X | X |  |  |  | + | X |
| MP-2 | Media Access | X | X | X | X | X | X |  |  |  | + | X |
| MP-2(1) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| MP-2(2) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| MP-3 | Media Marking |  | X | X |  |  |  |  |  |  | + |  |
| MP-4 | Media Storage |  | X | X |  | X | X |  |  |  | + |  |
| MP-4(1) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| MP-4(2) | AUTOMATED RESTRICTED ACCESS |  |  |  |  |  |  |  |  |  |  |  |
| MP-5 | Media Transport |  | X | X |  | X | X |  |  |  | + | X |
| MP-5(1) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| MP-5(2) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| MP-5(3) | CUSTODIANS |  |  |  |  |  |  |  |  |  | + | X |
| MP-5(4) | CRYPTOGRAPHIC PROTECTION |  | X | X |  | X | X |  |  |  | + |  |
| MP-6 | Media Sanitization | X | X | X |  |  |  |  |  |  | + | X |
| MP-6(1) | REVIEW / APPROVE / TRACK / DOCUMENT / VERIFY |  |  | X |  |  |  |  |  |  | + | X |
| MP-6(2) | EQUIPMENT TESTING |  |  | X |  |  |  |  |  |  | + | X |
| MP-6(3) | NONDESTRUCTIVE TECHNIQUES |  |  | X |  |  |  |  |  |  | + |  |
| MP-6(4) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| MP-6(5) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| MP-6(6) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| MP-6(7) | DUAL AUTHORIZATION |  |  |  |  |  |  |  |  |  |  |  |
| MP-6(8) | REMOTE PURGING / WIPING OF INFORMATION |  |  |  |  |  |  |  |  |  |  |  |
| MP-7 | Media Use | X | X | X | X | X | X |  |  |  | + |  |
| MP-7(1) | PROHIBIT USE WITHOUT OWNER |  |  |  | X | X | X |  |  |  |  |  |
| MP-7(2) | PROHIBIT USE OF SANITIZATION-RESISTANT MEDIA |  |  |  |  |  |  |  |  |  |  |  |
| MP-8 | Media Downgrading |  |  |  |  |  |  |  |  |  | + |  |
| MP-8(1) | DOCUMENTATION OF PROCESS |  |  |  |  |  |  |  |  |  | + |  |
| MP-8(2) | EQUIPMENT TESTING |  |  |  |  |  |  |  |  |  | + |  |
| MP-8(3) | CONTROLLED UNCLASSIFIED INFORMATION |  |  |  |  |  |  |  |  |  |  |  |
| MP-8(4) | CLASSIFIED INFORMATION |  |  |  |  |  |  |  |  |  | + |  |
| PE-1 | Physical And Environmental Protection Policy And Procedures | X | X | X | X | X | X | X | X | X |  | X |
| PE-2 | Physical Access Authorizations | X | X | X | X | X | X | X | X | X |  | X |
| PE-2(1) | ACCESS BY POSITION / ROLE |  |  |  |  |  |  |  |  |  |  | X |
| PE-2(2) | TWO FORMS OF IDENTIFICATION |  |  |  |  |  |  |  |  |  |  |  |
| PE-2(3) | RESTRICT UNESCORTED ACCESS |  |  |  |  |  |  |  |  |  | + | X |
| PE-3 | Physical Access Control | X | X | X | X | X | X | X | X | X |  | X |
| PE-3(1) | INFORMATION SYSTEM ACCESS | X | X | X | X | X | X |  |  |  |  | X |
| PE-3(2) | FACILITY / INFORMATION SYSTEM BOUNDARIES |  |  |  |  |  |  |  |  |  | + | X |
| PE-3(3) | CONTINUOUS GUARDS / ALARMS / MONITORING |  |  |  |  |  |  |  |  |  | + | X |
| PE-3(4) | LOCKABLE CASINGS |  |  |  |  |  |  |  |  |  |  |  |
| PE-3(5) | TAMPER PROTECTION |  |  |  |  |  |  |  |  |  |  |  |
| PE-3(6) | FACILITY PENETRATION TESTING |  |  |  |  |  |  |  |  |  |  | X |
| PE-4 | Access Control For Transmission Medium |  | X | X |  | X | X |  |  |  | + | X |
| PE-5 | Access Control For Output Devices |  | X | X |  |  |  |  |  |  |  |  |
| PE-5(1) | ACCESS TO OUTPUT BY AUTHORIZED INDIVIDUALS |  |  |  |  |  |  |  |  |  |  |  |
| PE-5(2) | ACCESS TO OUTPUT BY INDIVIDUAL IDENTITY |  |  |  |  |  |  |  |  |  |  |  |
| PE-5(3) | MARKING OUTPUT DEVICES |  |  |  |  |  |  |  |  |  | + |  |
| PE-6 | Monitoring Physical Access | X | X | X | X | X | X | X | X | X |  |  |
| PE-6(1) | INTRUSION ALARMS / SURVEILLANCE EQUIPMENT |  | X | X |  | X | X |  | X | X |  |  |
| PE-6(2) | AUTOMATED INTRUSION RECOGNITION / RESPONSES |  |  |  |  |  |  |  |  |  |  |  |
| PE-6(3) | VIDEO SURVEILLANCE |  |  |  |  |  |  |  |  |  |  |  |
| PE-6(4) | MONITORING PHYSICAL ACCESS TO INFORMATION SYSTEMS |  |  | X |  |  | X |  |  | X |  |  |
| PE-7 | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| PE-7(1) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| PE-7(2) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| PE-8 | Visitor Access Records | X | X | X | X | X | X | X | X | X |  | X |
| PE-8(1) | AUTOMATED RECORDS MAINTENANCE / REVIEW |  |  | X |  |  | X |  |  |  |  |  |
| PE-8(2) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| PE-9 | Power Equipment And Cabling |  |  |  |  |  |  |  | X | X |  | X |
| PE-9(1) | REDUNDANT CABLING |  |  |  |  |  |  |  |  |  |  |  |
| PE-9(2) | AUTOMATIC VOLTAGE CONTROLS |  |  |  |  |  |  |  |  |  |  | X |
| PE-10 | Emergency Shutoff |  |  |  |  |  |  |  | X | X |  | X |
| PE-10(1) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| PE-11 | Emergency Power |  |  |  |  |  |  |  | X | X |  |  |
| PE-11(1) | LONG-TERM ALTERNATE POWER SUPPLY - MINIMAL OPERATIONAL CAPABILITY |  |  |  |  |  |  |  |  | X |  | X |
| PE-11(2) | LONG-TERM ALTERNATE POWER SUPPLY - SELF- CONTAINED |  |  |  |  |  |  |  |  |  |  | X |
| PE-12 | Emergency Lighting |  |  |  |  |  |  | X | X | X |  | X |
| PE-12(1) | ESSENTIAL MISSIONS / BUSINESS FUNCTIONS |  |  |  |  |  |  |  |  |  |  | X |
| PE-13 | Fire Protection |  |  |  |  |  |  | X | X | X |  | X |
| PE-13(1) | DETECTION DEVICES / SYSTEMS |  |  |  |  |  |  |  |  | X |  | X |
| PE-13(2) | SUPPRESSION DEVICES / SYSTEMS |  |  |  |  |  |  |  |  | X |  | X |
| PE-13(3) | AUTOMATIC FIRE SUPPRESSION |  |  |  |  |  |  |  | X | X |  | X |
| PE-13(4) | INSPECTIONS |  |  |  |  |  |  |  |  | X |  | X |
| PE-14 | Temperature And Humidity Controls |  |  |  |  |  |  | X | X | X |  | X |
| PE-14(1) | AUTOMATIC CONTROLS |  |  |  |  |  |  |  |  |  |  | X |
| PE-14(2) | MONITORING WITH ALARMS / NOTIFICATIONS |  |  |  |  |  |  |  |  |  |  | X |
| PE-15 | Water Damage Protection |  |  |  |  |  |  | X | X | X |  | X |
| PE-15(1) | AUTOMATION SUPPORT |  |  |  |  |  |  |  |  | X |  |  |
| PE-16 | Delivery And Removal | X | X | X | X | X | X | X | X | X |  | X |
| PE-17 | Alternate Work Site |  | X | X |  | X | X |  | X | X |  |  |
| PE-18 | Location Of Information System Components |  |  |  |  |  |  |  |  | X |  | X |
| PE-18(1) | FACILITY SITE |  |  |  |  |  |  |  |  |  |  | X |
| PE-19 | Information Leakage |  |  |  |  |  |  |  |  |  | + |  |
| PE-19(1) | NATIONAL EMISSIONS / TEMPEST POLICIES AND PROCEDURES |  |  |  |  |  |  |  |  |  | + |  |
| PE-20 | ASSET MONITORING AND TRACKING |  |  |  |  |  |  |  |  |  |  |  |
| PL-1 | Security Planning Policy And Procedures | X | X | X | X | X | X | X | X | X |  | X |
| PL-2 | System Security Plan | X | X | X | X | X | X | X | X | X |  |  |
| PL-2(1) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| PL-2(2) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| PL-2(3) | PLAN / COORDINATE WITH OTHER ORGANIZATIONAL ENTITIES |  | X | X |  | X | X |  | X | X |  |  |
| PL-3 | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| PL-4 | Rules Of Behavior | X | X | X | X | X | X | X | X | X |  |  |
| PL-4(1) | SOCIAL MEDIA AND NETWORKING RESTRICTIONS |  | X | X |  |  |  |  |  |  |  | X |
| PL-5 | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| PL-6 | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| PL-7 | Security Concept Of Operations |  |  |  |  |  |  |  |  |  |  |  |
| PL-8 | Information Security Architecture | X | X | X | X | X | X | X | X | X |  |  |
| PL-8(1) | DEFENSE-IN-DEPTH | X | X | X | X | X | X | X | X | X |  |  |
| PL-8(2) | SUPPLIER DIVERSITY | X | X | X | X | X | X | X | X | X |  |  |
| PL-9 | Central Management |  |  |  |  |  |  |  |  |  |  | X |
| PS-1 | Personnel Security Policy And Procedures | X | X | X | X | X | X | X | X | X |  | X |
| PS-2 | Position Risk Designation | X | X | X | X | X | X | X | X | X |  | X |
| PS-3 | Personnel Screening | X | X | X | X | X | X |  |  |  |  |  |
| PS-3(1) | CLASSIFIED INFORMATION |  |  |  |  |  |  |  |  |  | + |  |
| PS-3(2) | FORMAL INDOCTRINATION | S | S | S |  |  |  |  |  |  |  |  |
| PS-3(3) | INFORMATION WITH SPECIAL PROTECTION MEASURES |  |  |  |  |  |  |  |  |  |  |  |
| PS-4 | Personnel Termination | X | X | X |  | X | X | X | X | X | X |  |
| PS-4(1) | POST-EMPLOYMENT REQUIREMENTS | X | X | X |  |  |  |  |  |  |  |  |
| PS-4(2) | AUTOMATED NOTIFICATION |  |  | X |  |  |  | X |  |  | X |  |
| PS-5 | Personnel Transfer | X | X | X |  | X | X | X | X | X | X |  |
| PS-6 | Access Agreements | X | X | X |  | X | X | X |  |  |  | X |
| PS-6(1) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| PS-6(2) | CLASSIFIED INFORMATION REQUIRING SPECIAL PROTECTION |  |  |  |  |  |  |  |  |  |  | X |
| PS-6(3) | POST-EMPLOYMENT REQUIREMENTS | X | X | X |  |  |  |  |  |  |  |  |
| PS-7 | Third-Party Personnel Security | X | X | X |  | X | X | X |  |  |  | X |
| PS-8 | Personnel Sanctions | X | X | X |  | X | X | X | X | X | X | X |
| RA-1 | Risk Assessment Policy And Procedures | X | X | X |  | X | X | X | X | X | X | X |
| RA-2 | Security Categorization | X | X | X |  | X | X | X | X | X | X |  |
| RA-3 | Risk Assessment | X | X | X |  | X | X | X | X | X | X |  |
| RA-4 | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| RA-5 | Vulnerability Scanning | X | X | X |  | X | X | X | X | X | X |  |
| RA-5(1) | UPDATE TOOL CAPABILITY | X | X | X |  | X | X | X | X | X | X |  |
| RA-5(2) | UPDATE BY FREQUENCY / PRIOR TO NEW SCAN / WHEN IDENTIFIED | X | X | X |  | X | X | X | X | X | X |  |
| RA-5(3) | BREADTH / DEPTH OF COVERAGE |  |  |  |  |  |  |  |  |  |  | X |
| RA-5(4) | DISCOVERABLE INFORMATION | X | X | X |  | X | X | X | X | X | X |  |
| RA-5(5) | PRIVILEGED ACCESS | X | X | X |  | X | X | X | X | X | X |  |
| RA-5(6) | AUTOMATED TREND ANALYSES |  |  |  |  |  |  |  |  |  |  |  |
| RA-5(7) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| RA-5(8) | REVIEW HISTORIC AUDIT LOGS |  |  |  |  |  |  |  |  |  |  |  |
| RA-5(9) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| RA-5(10) | CORRELATE SCANNING INFORMATION |  |  | X |  |  |  | X |  |  | X |  |
| RA-6 | Technical Surveillance Countermeasures Survey |  |  |  |  |  |  |  |  |  |  |  |
| SA-1 | System And Services Acquisition Policy And Procedures | X | X | X |  | X | X | X | X | X | X | X |
| SA-2 | Allocation Of Resources | X | X | X |  | X | X | X | X | X | X |  |
| SA-3 | System Development Life Cycle | X | X | X |  | X | X | X | X | X | X |  |
| SA-4 | Acquisition Process | X | X | X |  | X | X | X | X | X | X |  |
| SA-4(1) | FUNCTIONAL PROPERTIES OF SECURITY CONTROLS |  | X | X |  | X | X |  | X | X |  | X |
| SA-4(2) | DESIGN / IMPLEMENTATION INFORMATION FOR SECURITY CONTROLS |  | X | X |  | X | X |  | X | X |  | X |
| SA-4(3) | DEVELOPMENT METHODS / TECHNIQUES / PRACTICES |  |  |  |  |  | X |  |  |  |  | X |
| SA-4(4) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SA-4(5) | SYSTEM / COMPONENT / SERVICE CONFIGURATIONS |  |  |  |  |  | X |  |  |  |  | X |
| SA-4(6) | USE OF INFORMATION ASSURANCE PRODUCTS |  |  |  |  |  |  |  |  |  | + | X |
| SA-4(7) | NIAP-APPROVED PROTECTION PROFILES |  |  |  | X | X | X |  |  |  |  |  |
| SA-4(8) | CONTINUOUS MONITORING PLAN |  |  |  |  |  |  |  |  |  |  |  |
| SA-4(9) | FUNCTIONS / PORTS / PROTOCOLS / SERVICES IN USE | X | X | X | X | X | X | X | X | X |  |  |
| SA-4(10) | USE OF APPROVED PIV PRODUCTS | X | X | X | X | X | X |  |  |  |  |  |
| SA-5 | Information System Documentation | X | X | X | X | X | X | X | X | X |  |  |
| SA-5(1) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SA-5(2) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SA-5(3) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SA-5(4) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SA-5(5) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SA-6 | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SA-6(1) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SA-7 | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SA-8 | Security Engineering Principles | X | X | X | X | X | X | X | X | X |  | X |
| SA-9 | External Information System Services | X | X | X | X | X | X | X | X | X |  |  |
| SA-9(1) | RISK ASSESSMENTS / ORGANIZATIONAL APPROVALS |  |  |  | X | X | X |  |  |  |  | X |
| SA-9(2) | IDENTIFICATION OF FUNCTIONS / PORTS / PROTOCOLS / SERVICES | X | X | X | X | X | X | X | X | X |  |  |
| SA-9(3) | ESTABLISH / MAINTAIN TRUST RELATIONSHIP WITH PROVIDERS |  |  |  |  |  |  |  |  |  |  |  |
| SA-9(4) | CONSISTENT INTERESTS OF CONSUMERS AND PROVIDERS |  |  |  |  |  |  |  |  |  |  |  |
| SA-9(5) | PROCESSING, STORAGE, AND SERVICE LOCATION |  |  |  |  |  |  |  |  |  |  |  |
| SA-10 | Developer Configuration Management |  |  |  | X | X | X |  |  |  |  |  |
| SA-10(1) | SOFTWARE / FIRMWARE INTEGRITY VERIFICATION |  |  |  | X | X | X |  |  |  |  |  |
| SA-10(2) | ALTERNATIVE CONFIGURATION MANAGEMENT PROCESSES |  |  |  |  |  |  |  |  |  |  |  |
| SA-10(3) | HARDWARE INTEGRITY VERIFICATION |  |  |  |  |  |  |  |  |  |  |  |
| SA-10(4) | TRUSTED GENERATION |  |  |  |  |  |  |  |  |  |  |  |
| SA-10(5) | MAPPING INTEGRITY FOR VERSION CONTROL |  |  |  |  |  |  |  |  |  |  |  |
| SA-10(6) | TRUSTED DISTRIBUTION |  |  |  |  |  |  |  |  |  |  |  |
| SA-11 | Developer Security Testing and Evaluation |  | X | X |  | X | X |  | X | X |  |  |
| SA-11(1) | STATIC CODE ANALYSIS |  |  |  |  |  |  |  |  |  |  |  |
| SA-11(2) | THREAT AND VULNERABILITY ANALYSES |  |  |  |  |  |  |  |  |  |  |  |
| SA-11(3) | INDEPENDENT VERIFICATION OF ASSESSMENT PLANS / EVIDENCE |  |  |  |  |  |  |  |  |  |  |  |
| SA-11(4) | MANUAL CODE REVIEWS |  |  |  |  |  |  |  |  |  |  |  |
| SA-11(5) | PENETRATION TESTING / ANALYSIS |  |  |  |  |  |  |  |  |  |  |  |
| SA-11(6) | ATTACK SURFACE REVIEWS |  |  |  |  |  |  |  |  |  |  |  |
| SA-11(7) | VERIFY SCOPE OF TESTING / EVALUATION |  |  |  |  |  |  |  |  |  |  |  |
| SA-11(8) | DYNAMIC CODE ANALYSIS |  |  |  |  |  |  |  |  |  |  |  |
| SA-12 | Supply Chain Protection | X | X | X | X | X | X | X | X | X |  | X |
| SA-12(1) | ACQUISITION STRATEGIES / TOOLS / METHODS |  |  | X |  |  | X |  |  | X |  |  |
| SA-12(2) | SUPPLIER REVIEWS |  |  |  |  |  |  |  |  |  |  | X |
| SA-12(3) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SA-12(4) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SA-12(5) | LIMITATION OF HARM |  |  | X |  |  | X |  |  | X |  |  |
| SA-12(6) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SA-12(7) | ASSESSMENTS PRIOR TO SELECTION / ACCEPTANCE / UPDATE |  |  |  |  |  |  |  |  |  |  |  |
| SA-12(8) | USE OF ALL-SOURCE INTELLIGENCE |  |  | X |  |  | X |  |  | X |  |  |
| SA-12(9) | OPERATIONS SECURITY |  |  | X |  |  | X |  |  | X |  |  |
| SA-12(10) | VALIDATE AS GENUINE AND NOT ALTERED |  |  |  |  |  |  |  |  |  |  |  |
| SA-12(11) | PENETRATION TESTING / ANALYSIS OF ELEMENTS, PROCESSES, AND ACTORS |  |  | X |  |  | X |  |  | X |  |  |
| SA-12(12) | INTER-ORGANIZATIONAL AGREEMENTS |  |  |  |  |  |  |  |  |  |  |  |
| SA-12(13) | CRITICAL INFORMATION SYSTEM COMPONENTS |  |  |  |  |  |  |  |  |  |  |  |
| SA-12(14) | IDENTITY AND TRACEABILITY |  |  |  |  |  |  |  |  |  |  |  |
| SA-12(15) | PROCESSES TO ADDRESS WEAKNESSES OR DEFICIENCIES |  |  |  |  |  |  |  |  |  |  |  |
| SA-13 | Trustworthiness |  |  |  |  |  |  |  |  |  |  |  |
| SA-14 | Criticality Analysis |  |  | X |  |  | X |  |  | X |  |  |
| SA-14(1) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SA-15 | Development Process, Standards, And Tools | X | X | X | X | X | X | X | X | X |  |  |
| SA-15(1) | QUALITY METRICS |  |  |  |  |  |  |  |  |  |  |  |
| SA-15(2) | SECURITY TRACKING TOOLS |  |  |  |  |  |  |  |  |  |  |  |
| SA-15(3) | CRITICALITY ANALYSIS |  |  | X |  |  | X |  |  | X |  |  |
| SA-15(4) | THREAT MODELING / VULNERABILITY ANALYSIS |  |  | X |  |  | X |  |  | X |  |  |
| SA-15(5) | ATTACK SURFACE REDUCTION |  |  |  |  |  |  |  |  |  |  |  |
| SA-15(6) | CONTINUOUS IMPROVEMENT |  |  |  |  |  |  |  |  |  |  |  |
| SA-15(7) | AUTOMATED VULNERABILITY ANALYSIS |  |  |  |  |  | X |  |  |  |  |  |
| SA-15(8) | REUSE OF THREAT / VULNERABILITY INFORMATION |  |  |  |  |  |  |  |  |  |  |  |
| SA-15(9) | USE OF LIVE DATA | X | X | X |  |  |  |  |  |  | + |  |
| SA-15(10) | INCIDENT RESPONSE PLAN |  |  |  |  |  |  |  |  |  |  |  |
| SA-15(11) | ARCHIVE INFORMATION SYSTEM / COMPONENT |  |  |  |  |  |  |  |  |  |  |  |
| SA-16 | Developer Provided Training |  |  | X |  |  | X |  |  | X |  |  |
| SA-17 | Developer Security Architecture And Design |  |  | X |  |  | X |  |  | X |  |  |
| SA-17(1) | FORMAL POLICY MODEL |  |  |  |  |  |  |  |  |  |  |  |
| SA-17(2) | SECURITY-RELEVANT COMPONENTS |  |  |  |  |  |  |  |  |  |  |  |
| SA-17(3) | FORMAL CORRESPONDENCE |  |  |  |  |  |  |  |  |  |  |  |
| SA-17(4) | INFORMAL CORRESPONDENCE |  |  |  |  |  |  |  |  |  |  |  |
| SA-17(5) | CONCEPTUALLY SIMPLE DESIGN |  |  |  |  |  |  |  |  |  |  |  |
| SA-17(6) | STRUCTURE FOR TESTING |  |  |  |  |  |  |  |  |  |  |  |
| SA-17(7) | STRUCTURE FOR LEAST PRIVILEGE |  |  |  |  |  |  |  |  |  |  |  |
| SA-18 | Tamper Resistance And Detection |  |  |  |  |  |  |  |  |  |  |  |
| SA-18(1) | MULTIPLE PHASES OF SDLC |  |  |  |  |  |  |  |  |  |  |  |
| SA-18(2) | INSPECTION OF INFORMATION SYSTEMS, COMPONENTS, OR DEVICES |  |  |  |  |  |  |  |  |  |  |  |
| SA-19 | Component Authenticity |  |  |  | X | X | X |  |  |  |  |  |
| SA-19(1) | ANTI-COUNTERFEIT TRAINING |  |  |  |  |  |  |  |  |  |  |  |
| SA-19(2) | CONFIGURATION CONTROL FOR COMPONENT SERVICE / REPAIR |  |  |  |  |  |  |  |  |  |  |  |
| SA-19(3) | COMPONENT DISPOSAL |  |  |  |  |  |  |  |  |  |  |  |
| SA-19(4) | ANTI-COUNTERFEIT TRAINING |  |  |  |  |  |  |  |  |  |  |  |
| SA-20 | Customized Development Of Critical Components |  |  |  |  |  |  |  |  |  |  |  |
| SA-21 | DEVELOPER SCREENING |  |  |  |  |  |  |  |  |  |  |  |
| SA-21(1) | VALIDATION OF SCREENING |  |  |  |  |  |  |  |  |  |  |  |
| SA-22 | Unsupported System Components | S | S | X | S | S | X | S | S | X |  |  |
| SA-22(1) | ALTERNATIVE SOURCES FOR CONTINUED SUPPORT |  |  |  |  |  |  |  |  |  |  |  |
| SC-1 | System And Communications Protection Policy And Procedures | X | X | X | X | X | X | X | X | X |  | X |
| SC-2 | Application Partitioning |  | X | X |  | X | X |  |  |  | + |  |
| SC-2(1) | INTERFACES FOR NON- PRIVILEGED USERS |  |  |  |  |  |  |  |  |  |  |  |
| SC-3 | Security Function Isolation |  |  | X |  |  | X |  |  |  | + | X |
| SC-3(1) | HARDWARE SEPARATION |  |  |  |  |  |  |  |  |  |  |  |
| SC-3(2) | ACCESS / FLOW CONTROL FUNCTIONS |  |  |  |  |  |  |  |  |  |  |  |
| SC-3(3) | MINIMIZE NONSECURITY FUNCTIONALITY |  |  |  |  |  |  |  |  |  |  |  |
| SC-3(4) | MODULE COUPLING AND COHESIVENESS |  |  |  |  |  |  |  |  |  |  |  |
| SC-3(5) | LAYERED STRUCTURES |  |  |  |  |  |  |  |  |  |  |  |
| SC-4 | Information In Shared Resources |  | X | X |  |  |  |  |  |  |  |  |
| SC-4(1) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SC-4(2) | PERIODS PROCESSING |  |  |  |  |  |  |  |  |  |  |  |
| SC-5 | Denial Of Service Protection |  |  |  |  |  |  | X | X | X |  |  |
| SC-5(1) | RESTRICT INTERNAL USERS |  |  |  |  |  |  | X | X | X |  |  |
| SC-5(2) | EXCESS CAPACITY / BANDWIDTH / REDUNDANCY |  |  |  |  |  |  |  | X | X |  |  |
| SC-5(3) | DETECTION / MONITORING |  |  |  |  |  |  |  | X | X |  |  |
| SC-6 | Resource Availability |  |  |  |  |  |  |  |  |  |  |  |
| SC-7 | Boundary Protection | X | X | X | X | X | X |  |  |  |  | X |
| SC-7(1) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SC-7(2) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SC-7(3) | ACCESS POINTS | X | X | X | X | X | X |  |  |  |  |  |
| SC-7(4) | EXTERNAL TELECOMMUNICATIONS SERVICES | X | X | X | X | X | X |  |  |  |  |  |
| SC-7(5) | DENY BY DEFAULT / ALLOW BY EXCEPTION | X | X | X | X | X | X |  |  |  |  |  |
| SC-7(6) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SC-7(7) | PREVENT SPLIT TUNNELING FOR REMOTE DEVICES | X | X | X | X | X | X |  |  |  |  |  |
| SC-7(8) | ROUTE TRAFFIC TO AUTHENTICATED PROXY SERVERS | X | X | X | X | X | X |  |  |  |  | X |
| SC-7(9) | RESTRICT THREATENING OUTGOING COMMUNICATIONS TRAFFIC |  |  |  | X | X | X |  |  |  |  |  |
| SC-7(10) | PREVENT UNAUTHORIZED EXFILTRATION | X | X | X |  |  |  |  |  |  |  |  |
| SC-7(11) | RESTRICT INCOMING COMMUNICATIONS TRAFFIC |  |  |  | X | X | X |  |  |  |  |  |
| SC-7(12) | HOST-BASED PROTECTION | X | X | X | X | X | X | X | X | X |  |  |
| SC-7(13) | ISOLATION OF SECURITY TOOLS / MECHANISMS / SUPPORT COMPONENTS | X | X | X | X | X | X |  |  |  |  | X |
| SC-7(14) | PROTECTS AGAINST UNAUTHORIZED PHYSICAL CONNECTIONS | X | X | X | X | X | X |  |  |  |  |  |
| SC-7(15) | ROUTE PRIVILEGED NETWORK ACCESSES |  |  |  |  |  |  |  |  |  |  |  |
| SC-7(16) | PREVENT DISCOVERY OF COMPONENTS / DEVICES |  |  |  |  |  |  |  |  |  |  |  |
| SC-7(17) | AUTOMATED ENFORCEMENT OF PROTOCOL FORMATS |  |  |  |  |  |  |  |  |  |  |  |
| SC-7(18) | FAIL SECURE |  |  | X |  |  | X |  |  | X |  |  |
| SC-7(19) | BLOCKS COMMUNICATION FROM NON- ORGANIZATIONALLY CONFIGURED HOSTS |  |  |  |  |  |  |  |  |  |  |  |
| SC-7(20) | DYNAMIC ISOLATION / SEGREGATION |  |  |  |  |  |  |  |  |  |  |  |
| SC-7(21) | ISOLATION OF INFORMATION SYSTEM COMPONENTS |  |  | X |  |  | X |  |  |  |  |  |
| SC-7(22) | SEPARATE SUBNETS FOR CONNECTING TO DIFFERENT SECURITY DOMAINS |  |  |  |  |  |  |  |  |  |  |  |
| SC-7(23) | DISABLE SENDER FEEDBACK ON PROTOCOL VALIDATION FAILURE |  |  |  |  |  |  |  |  |  |  |  |
| SC-8 | Transmission Confidentiality And Integrity | X | X | X | X | X | X |  |  |  | + |  |
| SC-8(1) | CRYPTOGRAPHIC OR ALTERNATE PHYSICAL PROTECTION | X | X | X | X | X | X |  |  |  | + |  |
| SC-8(2) | PRE / POST TRANSMISSION HANDLING |  | X | X |  | X | X |  |  |  |  |  |
| SC-8(3) | CRYPTOGRAPHIC PROTECTION FOR MESSAGE EXTERNALS |  |  |  |  |  |  |  |  |  | + |  |
| SC-8(4) | CONCEAL / RANDOMIZE COMMUNICATIONS |  |  |  |  |  |  |  |  |  | + |  |
| SC-9 | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SC-9(1) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SC-9(2) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SC-10 | Network Disconnect |  | X | X |  | X | X |  |  |  |  |  |
| SC-11 | Trusted Path |  |  |  |  |  |  |  |  |  |  |  |
| SC-11(1) | LOGICAL ISOLATION |  |  |  |  |  |  |  |  |  |  |  |
| SC-12 | Cryptographic Key Establishment And Management | X | X | X | X | X | X |  |  |  |  | X |
| SC-12(1) | AVAILABILITY |  |  |  |  |  |  | S | S | X |  |  |
| SC-12(2) | SYMMETRIC KEYS |  |  |  |  |  |  |  |  |  | + |  |
| SC-12(3) | ASYMMETRIC KEYS |  |  |  |  |  |  |  |  |  | + |  |
| SC-12(4) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SC-12(5) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SC-13 | Cryptographic Protection | X | X | X | X | X | X |  |  |  | + |  |
| SC-13(1) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SC-13(2) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SC-13(3) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SC-13(4) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SC-14 | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SC-15 | Collaborative Computing Devices | X | X | X |  |  |  |  |  |  |  |  |
| SC-15(1) | PHYSICAL DISCONNECT |  |  |  |  |  |  |  |  |  |  |  |
| SC-15(2) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SC-15(3) | DISABLING / REMOVAL IN SECURE WORK AREAS |  |  |  |  |  |  |  |  |  | + |  |
| SC-15(4) | EXPLICITLY INDICATE CURRENT PARTICIPANTS |  |  |  |  |  |  |  |  |  |  |  |
| SC-16 | Transmission Of Security Attributes |  |  |  |  |  |  |  |  |  |  |  |
| SC-16(1) | INTEGRITY VALIDATION |  |  |  |  |  |  |  |  |  |  |  |
| SC-17 | Public Key Infrastructure Certificates | X | X | X | X | X | X |  |  |  |  | X |
| SC-18 | Mobile Code |  |  |  | X | X | X |  |  |  |  | X |
| SC-18(1) | IDENTIFY UNACCEPTABLE CODE / TAKE CORRECTIVE ACTIONS |  |  |  | X | X | X |  |  |  |  | X |
| SC-18(2) | ACQUISITION / DEVELOPMENT / USE |  |  |  | X | X | X |  |  |  |  | X |
| SC-18(3) | PREVENT DOWNLOADING / EXECUTION |  |  |  | X | X | X |  |  |  |  |  |
| SC-18(4) | PREVENT AUTOMATIC EXECUTION |  |  |  | X | X | X |  |  |  |  |  |
| SC-18(5) | ALLOW EXECUTION ONLY IN CONFINED ENVIRONMENTS |  |  |  |  |  |  |  |  |  |  | X |
| SC-19 | Voice Over Internet Protocol | X | X | X | X | X | X | X | X | X |  | X |
| SC-20 | Secure Name / Address Resolution Service (Authoritative Source) |  |  |  | X | X | X |  |  |  |  |  |
| SC-20(1) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SC-20(2) | DATA ORIGIN / INTEGRITY |  |  |  |  |  |  |  |  |  |  |  |
| SC-21 | Secure Name / Address Resolution Service (Recursive Or Caching Resolver) |  |  |  | X | X | X |  |  |  |  |  |
| SC-21(1) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SC-22 | Architecture And Provisioning For Name / Address Resolution Service | X | X | X | X | X | X | X | X | X |  |  |
| SC-23 | Session Authenticity |  |  |  | X | X | X |  |  |  |  |  |
| SC-23(1) | INVALIDATE SESSION IDENTIFIERS AT LOGOUT |  |  |  | X | X | X |  |  |  |  |  |
| SC-23(2) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SC-23(3) | UNIQUE SESSION IDENTIFIERS WITH RANDOMIZATION |  |  |  | X | X | X |  |  |  |  |  |
| SC-23(4) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SC-23(5) | ALLOWED CERTIFICATE AUTHORITIES |  |  |  | X | X | X |  |  |  |  |  |
| SC-24 | Fail In Known State |  |  | X |  |  | X |  |  |  |  |  |
| SC-25 | Thin Nodes |  |  |  |  |  |  |  |  |  |  |  |
| SC-26 | Honeypots |  |  |  |  |  |  |  |  |  |  |  |
| SC-26(1) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SC-27 | Platform-Independent Applications |  |  |  |  |  |  |  |  |  |  |  |
| SC-28 | Protection Of Information At Rest | X | X | X | X | X | X |  |  |  | + |  |
| SC-28(1) | CRYPTOGRAPHIC PROTECTION | X | X | X | X | X | X |  |  |  | + |  |
| SC-28(2) | OFF-LINE STORAGE |  |  |  |  |  |  |  |  |  |  |  |
| SC-29 | Heterogeneity |  |  |  |  |  |  |  |  |  |  |  |
| SC-29(1) | VIRTUALIZATION TECHNIQUES |  |  |  |  |  |  |  |  |  |  |  |
| SC-30 | Concealment and Misdirection |  |  |  |  |  |  |  |  |  |  |  |
| SC-30(1) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SC-30(2) | RANDOMNESS |  |  |  |  |  |  |  |  |  |  |  |
| SC-30(3) | CHANGE PROCESSING / STORAGE LOCATIONS |  |  |  |  |  |  |  |  |  |  |  |
| SC-30(4) | MISLEADING INFORMATION |  |  |  |  |  |  |  |  |  |  |  |
| SC-30(5) | CONCEALMENT OF SYSTEM COMPONENTS |  |  |  |  |  |  |  |  |  |  |  |
| SC-31 | Covert Channel Analysis |  |  |  |  |  |  |  |  |  |  |  |
| SC-31(1) | TEST COVERT CHANNELS FOR EXPLOITABILITY |  |  |  |  |  |  |  |  |  |  |  |
| SC-31(2) | MAXIMUM BANDWIDTH |  |  |  |  |  |  |  |  |  |  |  |
| SC-31(3) | MEASURE BANDWIDTH IN OPERATIONAL ENVIRONMENTS |  |  |  |  |  |  |  |  |  |  |  |
| SC-32 | Information System Partitioning |  |  |  |  |  |  |  |  |  |  |  |
| SC-33 | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SC-34 | Non-Modifiable Executable Programs |  |  |  |  |  |  |  |  |  |  |  |
| SC-34(1) | NO WRITABLE STORAGE |  |  |  |  |  |  |  |  |  |  |  |
| SC-34(2) | INTEGRITY PROTECTION / READ-ONLY MEDIA |  |  |  |  |  |  |  |  |  |  |  |
| SC-34(3) | HARDWARE-BASED PROTECTION |  |  |  |  |  |  |  |  |  |  |  |
| SC-35 | Honeyclients |  |  |  |  |  |  |  |  |  |  |  |
| SC-36 | Distributed Processing And Storage |  |  |  |  |  |  |  |  |  |  |  |
| SC-36(1) | POLLING TECHNIQUES |  |  |  |  |  |  |  |  |  |  |  |
| SC-37 | Out-Of-Band Channels |  |  |  |  |  |  |  |  |  |  |  |
| SC-37(1) | ENSURE DELIVERY / TRANSMISSION |  |  |  |  |  |  |  |  |  |  |  |
| SC-38 | Operations Security | X | X | X | X | X | X | X | X | X |  |  |
| SC-39 | Process Isolation | X | X | X | X | X | X |  |  |  |  |  |
| SC-39(1) | HARDWARE SEPARATION |  |  |  |  |  |  |  |  |  |  |  |
| SC-39(2) | THREAD ISOLATION |  |  |  |  |  |  |  |  |  |  |  |
| SC-40 | Wireless Link Protection |  |  |  |  |  |  |  |  |  |  |  |
| SC-40(1) | ELECTROMAGNETIC INTERFERENCE |  |  |  |  |  |  |  |  |  |  |  |
| SC-40(2) | REDUCE DETECTION POTENTIAL |  |  |  |  |  |  |  |  |  |  |  |
| SC-40(3) | IMITATIVE OR MANIPULATIVE COMMUNICATIONS DECEPTION |  |  |  |  |  |  |  |  |  |  |  |
| SC-40(4) | SIGNAL PARAMETER IDENTIFICATION |  |  |  |  |  |  |  |  |  |  |  |
| SC-41 | Port And I/O Device Access |  |  |  |  |  |  |  |  |  |  |  |
| SC-42 | Sensor Capability And Data |  |  |  |  |  |  |  |  |  | + |  |
| SC-42(1) | REPORTING TO AUTHORIZED INDIVIDUALS OR ROLES |  |  |  |  |  |  |  |  |  |  |  |
| SC-42(2) | AUTHORIZED USE |  |  |  |  |  |  |  |  |  |  |  |
| SC-42(3) | PROHIBIT USE OF DEVICES |  |  |  |  |  |  |  |  |  | + |  |
| SC-43 | Usage Restrictions |  |  |  |  |  |  |  |  |  |  | X |
| SC-44 | Detonation Chambers |  |  |  |  |  |  |  |  |  |  |  |
| SI-1 | System And Information Integrity Policy And Procedures | X | X | X | X | X | X | X | X | X |  | X |
| SI-2 | Flaw Remediation |  |  |  | X | X | X |  |  |  |  | X |
| SI-2(1) | CENTRAL MANAGEMENT |  |  |  | X | X | X |  |  |  |  |  |
| SI-2(2) | AUTOMATED FLAW REMEDIATION STATUS |  |  |  | X | X | X |  |  |  |  |  |
| SI-2(3) | TIME TO REMEDIATE FLAWS / BENCHMARKS FOR CORRECTIVE ACTIONS |  |  |  | X | X | X |  |  |  |  | X |
| SI-2(4) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SI-2(5) | AUTOMATIC SOFTWARE / FIRMWARE UPDATES |  |  |  |  |  |  |  |  |  |  |  |
| SI-2(6) | REMOVAL OF PREVIOUS VERSIONS OF SOFTWARE / FIRMWARE |  |  |  | X | X | X |  |  |  |  |  |
| SI-3 | Malicious Code Protection |  |  |  | X | X | X |  |  |  |  | X |
| SI-3(1) | CENTRAL MANAGEMENT |  |  |  | X | X | X |  |  |  |  | X |
| SI-3(2) | AUTOMATIC UPDATES |  |  |  | X | X | X |  |  |  |  |  |
| SI-3(3) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SI-3(4) | UPDATES ONLY BY PRIVILEGED USERS |  |  |  |  |  |  |  |  |  |  |  |
| SI-3(5) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SI-3(6) | TESTING / VERIFICATION |  |  |  |  |  |  |  |  |  |  |  |
| SI-3(7) | NONSIGNATURE-BASED DETECTION |  |  |  |  |  |  |  |  |  |  |  |
| SI-3(8) | DETECT UNAUTHORIZED COMMANDS |  |  |  |  |  |  |  |  |  |  |  |
| SI-3(9) | AUTHENTICATE REMOTE COMMANDS |  |  |  |  |  |  |  |  |  |  |  |
| SI-3(10) | MALICIOUS CODE ANALYSIS |  |  |  | X | X | X |  |  |  |  |  |
| SI-4 | Information System Monitoring | X | X | X | X | X | X | X | X | X |  |  |
| SI-4(1) | SYSTEM-WIDE INTRUSION DETECTION SYSTEM | X | X | X | X | X | X | X | X | X |  |  |
| SI-4(2) | AUTOMATED TOOLS FOR REAL-TIME ANALYSIS |  | X | X |  | X | X |  | X | X |  |  |
| SI-4(3) | AUTOMATED TOOL INTEGRATION |  |  |  |  |  |  |  |  |  |  |  |
| SI-4(4) | INBOUND AND OUTBOUND COMMUNICATIONS TRAFFIC | X | X | X | X | X | X | X | X | X |  |  |
| SI-4(5) | SYSTEM-GENERATED ALERTS | X | X | X | X | X | X | X | X | X |  |  |
| SI-4(6) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SI-4(7) | AUTOMATED RESPONSE TO SUSPICIOUS EVENTS |  |  |  |  |  |  |  |  |  |  |  |
| SI-4(8) |  |  |  |  |  |  |  |  |  |  |  |  |
| SI-4(9) | TESTING OF MONITORING TOOLS |  |  |  |  |  |  |  |  |  |  |  |
| SI-4(10) | VISIBILITY OF ENCRYPTED COMMUNICATIONS |  | X | X |  | X | X |  | X | X |  | X |
| SI-4(11) | ANALYZE COMMUNICATIONS TRAFFIC ANOMALIES | X | X | X | X | X | X | X | X | X |  |  |
| SI-4(12) | AUTOMATED ALERTS | X | X | X | X | X | X | X | X | X |  |  |
| SI-4(13) | ANALYZE TRAFFIC / EVENT PATTERNS |  |  |  |  |  |  |  |  |  |  |  |
| SI-4(14) | WIRELESS INTRUSION DETECTION | X | X | X | X | X | X | X | X | X | + |  |
| SI-4(15) | WIRELESS TO WIRELINE COMMUNICATIONS | X | X | X | X | X | X | X | X | X |  |  |
| SI-4(16) | CORRELATE MONITORING INFORMATION | X | X | X | X | X | X | X | X | X |  |  |
| SI-4(17) | INTEGRATED SITUATIONAL AWARENESS |  |  |  |  |  |  |  |  |  |  | X |
| SI-4(18) | ANALYZE TRAFFIC / COVERT EXFILTRATION |  |  |  |  |  |  |  |  |  |  |  |
| SI-4(19) | INDIVIDUALS POSING GREATER RISK | X | X | X | X | X | X | X | X | X | + |  |
| SI-4(20) | PRIVILEGED USER | X | X | X | X | X | X | X | X | X |  |  |
| SI-4(21) | PROBATIONARY PERIODS |  |  |  |  |  |  |  |  |  | + |  |
| SI-4(22) | UNAUTHORIZED NETWORK SERVICES | X | X | X | X | X | X | X | X | X |  |  |
| SI-4(23) | HOST-BASED DEVICES | X | X | X | X | X | X | X | X | X |  |  |
| SI-4(24) | INDICATORS OF COMPROMISE |  |  |  |  |  |  |  |  |  |  |  |
| SI-5 | Security Alerts, Advisories, And Directives |  |  |  | X | X | X |  |  |  |  | X |
| SI-5(1) | AUTOMATED ALERTS AND ADVISORIES |  |  |  |  |  | X |  |  |  |  | X |
| SI-6 | Security Function Verification |  |  |  |  |  | X |  |  |  |  |  |
| SI-6(1) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SI-6(2) | AUTOMATION SUPPORT FOR DISTRIBUTED TESTING |  |  |  |  |  |  |  |  |  |  |  |
| SI-6(3) | REPORT VERIFICATION RESULTS |  |  |  |  |  | X |  |  |  |  | X |
| SI-7 | Software Firmware, And Information Integrity |  |  |  |  | X | X |  |  |  |  | X |
| SI-7(1) | INTEGRITY CHECKS |  |  |  |  | X | X |  |  |  |  |  |
| SI-7(2) | AUTOMATED NOTIFICATIONS OF INTEGRITY VIOLATIONS |  |  |  |  |  | X |  |  |  |  |  |
| SI-7(3) | CENTRALLY-MANAGED INTEGRITY TOOLS |  |  |  |  |  |  |  |  |  |  |  |
| SI-7(4) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SI-7(5) | AUTOMATED RESPONSE TO INTEGRITY VIOLATIONS |  |  |  |  |  | X |  |  |  |  |  |
| SI-7(6) | CRYPTOGRAPHIC PROTECTION |  |  |  |  |  |  |  |  |  |  |  |
| SI-7(7) | INTEGRATION OF DETECTION AND RESPONSE |  |  |  |  | X | X |  |  |  |  |  |
| SI-7(8) | AUDITING CAPABILITY FOR SIGNIFICANT EVENTS |  |  |  |  | X | X |  |  |  |  |  |
| SI-7(9) | VERIFY BOOT PROCESS |  |  |  |  |  |  |  |  |  |  |  |
| SI-7(10) | PROTECTION OF BOOT FIRMWARE |  |  |  |  |  |  |  |  |  |  |  |
| SI-7(11) | CONFINED ENVIRONMENTS WITH LIMITED PRIVILEGES |  |  |  |  |  |  |  |  |  |  |  |
| SI-7(12) | INTEGRITY VERIFICATION |  |  |  |  |  |  |  |  |  |  |  |
| SI-7(13) | CODE EXECUTION IN PROTECTED ENVIRONMENTS |  |  |  |  |  |  |  |  |  |  |  |
| SI-7(14) | BINARY OR MACHINE EXECUTABLE CODE |  |  |  | X | X | X |  |  |  |  |  |
| SI-7(15) | CODE AUTHENTICATION |  |  |  |  |  |  |  |  |  |  |  |
| SI-7(16) | TIME LIMIT ON PROCESS EXECUTION W/O SUPERVISION |  |  |  |  |  |  |  |  |  |  |  |
| SI-8 | Spam Protection |  |  |  |  | X | X |  | X | X |  | X |
| SI-8(1) | CENTRAL MANAGEMENT |  |  |  |  | X | X |  | X | X |  | X |
| SI-8(2) | AUTOMATIC UPDATES |  |  |  |  | X | X |  | X | X |  |  |
| SI-8(3) | CONTINUOUS LEARNING CAPABILITY |  |  |  |  |  |  |  |  |  |  |  |
| SI-9 | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SI-10 | Information Input Validation |  |  |  | X | X | X |  |  |  |  |  |
| SI-10(1) | MANUAL OVERRIDE CAPABILITY |  |  |  |  |  |  |  |  |  |  |  |
| SI-10(2) | REVIEW / RESOLUTION OF ERRORS |  |  |  |  |  |  |  |  |  |  |  |
| SI-10(3) | PREDICTABLE BEHAVIOR |  |  |  |  | X | X |  |  |  |  |  |
| SI-10(4) | REVIEW / TIMING INTERACTIONS |  |  |  |  |  |  |  |  |  |  |  |
| SI-10(5) | REVIEW/RESTRICT INPUTS TO TRUSTED SOURCES AND APPROVED FORMATS |  |  |  |  |  |  |  |  |  |  |  |
| SI-11 | Error Handling |  |  |  | X | X | X |  |  |  |  |  |
| SI-12 | Information Handling And Retention | X | X | X | X | X | X |  |  |  |  | X |
| SI-13 | Predictable Failure Prevention |  |  |  |  |  |  |  |  |  |  |  |
| SI-13(1) | TRANSFERRING COMPONENT RESPONSIBILITIES |  |  |  |  |  |  |  |  |  |  |  |
| SI-13(2) | *Withdrawn* |  |  |  |  |  |  |  |  |  |  |  |
| SI-13(3) | MANUAL TRANSFER BETWEEN COMPONENTS |  |  |  |  |  |  |  |  |  |  |  |
| SI-13(4) | STANDBY COMPONENT INSTALLATION / NOTIFICATION |  |  |  |  |  |  |  |  |  |  |  |
| SI-13(5) | FAILOVER CAPABILITY |  |  |  |  |  |  |  |  |  |  |  |
| SI-14 | Non-Persistence |  |  |  |  |  |  |  |  |  |  |  |
| SI-14(1) | REFRESH FROM TRUSTED SOURCES |  |  |  |  |  |  |  |  |  |  |  |
| SI-15 | Information Output Filtering |  |  |  |  |  |  |  |  |  |  |  |
| SI-16 | Memory Protection |  |  |  |  | X | X |  |  |  |  |  |
| SI-17 | Fail-Safe Procedures |  |  |  |  |  |  |  |  |  |  |  |
| PM-1 | Information Security Program Plan | X | X | X | X | X | X | X | X | X |  |  |
| PM-2 | Senior Information Security Officer | X | X | X | X | X | X | X | X | X |  |  |
| PM-3 | Information Security Resources | X | X | X | X | X | X | X | X | X |  |  |
| PM-4 | Plan of Action and Milestones Process | X | X | X | X | X | X | X | X | X |  |  |
| PM-5 | Information System Inventory | X | X | X | X | X | X | X | X | X |  |  |
| PM-6 | Information Security Measures of Performance | X | X | X | X | X | X | X | X | X |  |  |
| PM-7 | Enterprise Architecture | X | X | X | X | X | X | X | X | X |  |  |
| PM-8 | Critical Infrastructure Plan | X | X | X | X | X | X | X | X | X |  |  |
| PM-9 | Risk Management Strategy | X | X | X | X | X | X | X | X | X |  |  |
| PM-10 | Security Authorization Process | X | X | X | X | X | X | X | X | X |  |  |
| PM-11 | Mission/Business Process Definition | X | X | X | X | X | X | X | X | X |  |  |
| PM-12 | Insider Threat Program | X | X | X | X | X | X | X | X | X |  |  |
| PM-13 | Information Security Workforce | X | X | X | X | X | X | X | X | X |  |  |
| PM-14 | Testing, Training, and Monitoring | X | X | X | X | X | X | X | X | X |  |  |
| PM-15 | Contacts With Security Groups And Associations | X | X | X | X | X | X | X | X | X |  |  |
| PM-16 | Threat Awareness Program | X | X | X | X | X | X | X | X | X |  |  |
| AP-1 | Authority To Collect |  |  |  |  |  |  |  |  |  |  |  |
| AP-2 | Purpose Specification |  |  |  |  |  |  |  |  |  |  |  |
| AR-1 | Governance And Privacy Program |  |  |  |  |  |  |  |  |  |  |  |
| AR-2 | Privacy Impact And Risk Assessment Privacy Requirements For |  |  |  |  |  |  |  |  |  |  |  |
| AR-3 | Contractors And Service Providers |  |  |  |  |  |  |  |  |  |  |  |
| AR-4 | Privacy Monitoring And Auditing |  |  |  |  |  |  |  |  |  |  |  |
| AR-5 | Privacy Awareness And Training |  |  |  |  |  |  |  |  |  |  |  |
| AR-6 | Privacy Reporting Privacy-Enhanced System Design |  |  |  |  |  |  |  |  |  |  |  |
| AR-7 | And Development |  |  |  |  |  |  |  |  |  |  |  |
| AR-8 | Accounting Of Disclosures |  |  |  |  |  |  |  |  |  |  |  |
| DI-1 | Data Quality |  |  |  |  |  |  |  |  |  |  |  |
| DI-1(1) | VALIDATE PII |  |  |  |  |  |  |  |  |  |  |  |
| DI-1(2) | RE-VALIDATE PII Data Integrity And Data Integrity |  |  |  |  |  |  |  |  |  |  |  |
| DI-2 | Board PUBLISH AGREEMENTS ON |  |  |  |  |  |  |  |  |  |  |  |
| DI-2(1) | WEBSITE Minimization Of Personally |  |  |  |  |  |  |  |  |  |  |  |
| DM-1 | Identifiable Information LOCATE / REMOVE / REDACT / |  |  |  |  |  |  |  |  |  |  |  |
| DM-1(1) | ANONYMIZE PII |  |  |  |  |  |  |  |  |  |  |  |
| DM-2 | Data Retention And Disposal |  |  |  |  |  |  |  |  |  |  |  |
| DM-2(1) | SYSTEM CONFIGURATION Minimization Of PII Used In Testing, |  |  |  |  |  |  |  |  |  |  |  |
| DM-3 | Training, And Research RISK MINIMIZATION |  |  |  |  |  |  |  |  |  |  |  |
| DM-3(1) | TECHNIQUES |  |  |  |  |  |  |  |  |  |  |  |
| IP-1 | Consent MECHANISMS SUPPORTING |  |  |  |  |  |  |  |  |  |  |  |
| IP-1(1) | ITEMIZED OR TIERED CONSENT |  |  |  |  |  |  |  |  |  |  |  |
| IP-2 | Individual Access |  |  |  |  |  |  |  |  |  |  |  |
| IP-3 | Redress |  |  |  |  |  |  |  |  |  |  |  |
| IP-4 | Complaint Management |  |  |  |  |  |  |  |  |  |  |  |
| IP-4(1) | RESPONSE TIMES Inventory Of Personally Identifiable |  |  |  |  |  |  |  |  |  |  |  |
| SE-1 | Information |  |  |  |  |  |  |  |  |  |  |  |
| SE-2 | Privacy Incident Response |  |  |  |  |  |  |  |  |  |  |  |
| TR-1 | Privacy Notice REAL-TIME OR LAYERED |  |  |  |  |  |  |  |  |  |  |  |
| TR-1(1) | NOTICE System Of Records Notices And |  |  |  |  |  |  |  |  |  |  |  |
| TR-2 | Privacy Act Statements |  |  |  |  |  |  |  |  |  |  |  |
| TR-2(1) | PUBLIC WEBSITE PUBLICATION Dissemination Of Privacy Program |  |  |  |  |  |  |  |  |  |  |  |
| TR-3 | Information |  |  |  |  |  |  |  |  |  |  |  |
| UL-1 | Internal Use Information Sharing With Third |  |  |  |  |  |  |  |  |  |  |  |
| UL-2 | Parties |  |  |  |  |  |  |  |  |  |  |  |

## Footnotes (verbatim from source)

- * SI-7(14) - Consider tailoring out if not implementing the base control, SI-7
