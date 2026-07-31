# NIST SP 800-53 Revision 4 — Security and Privacy Controls for Federal Information Systems and Organizations (Excerpt + Full XML Catalog)

- **Source URL (PDF):** https://nvlpubs.nist.gov/nistpubs/specialpublications/nist.sp.800-53r4.pdf
- **Source URL (XML control catalog, cited in `reference/JSIG/README.md`):** https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml
- **Retrieved:** 2026-07-17
- **Why included:** This is the foundational control catalog underlying the entire JSIG scaffold (JSIG 2016 is explicitly built on 800-53 Rev. 4 — see the DCSA JSIG PDF title: "JSIG_2016April11_Final_(53Rev4)"). It supports every control-family cadence claim in the research file by providing the baseline organization-defined-frequency parameter language for AC-2, AU-2/AU-6/AU-11, CA-2/CA-5/CA-7/CA-8, CM-2/CM-7/CM-8, CP-2/CP-3/CP-4/CP-9, IA-4/IA-5/IA-11, IR-2/IR-3, MA-3/MA-4, PE-2/PE-3/PE-6/PE-8, RA-5, and SI-2/SI-3.

> **NOTE ON SCOPE.** The full machine-readable SCAP XML control catalog (all 256 base controls plus enhancements, ~1.3 MB) has been copied in full alongside this file as **`nist-800-53-rev4-controls.xml`** in this same directory — this is a complete, unmodified copy of the file cited in `reference/JSIG/README.md`, sufficient for fully offline use of that citation. The narrative PDF (`nist.sp.800-53r4.pdf`) is several hundred pages and is **not** reproduced in full; only the control statement text for the 29 controls cited in the cadence research file are excerpted below (extracted from the XML catalog for accuracy and consistency with the full file). For the complete narrative guidance, supplemental guidance discussion, and control-selection/tailoring methodology, download the PDF from the source URL above.

---

## Control Statement Excerpts (cited controls only)

Baselines shown (LOW / MODERATE / HIGH) indicate which FedRAMP/FISMA impact levels the base control (or an enhancement) applies to per the Rev. 4 catalog.

=== AC-2: ACCOUNT MANAGEMENT ===
Family: ACCESS CONTROL | Priority: P1 | Baselines: LOW, MODERATE, HIGH
The organization:
AC-2a.
Identifies and selects the following types of information system accounts to support organizational missions/business functions: [Assignment: organization-defined information system account types];
AC-2b.
Assigns account managers for information system accounts;
AC-2c.
Establishes conditions for group and role membership;
AC-2d.
Specifies authorized users of the information system, group and role membership, and access authorizations (i.e., privileges) and other attributes (as required) for each account;
AC-2e.
Requires approvals by [Assignment: organization-defined personnel or roles] for requests to create information system accounts;
AC-2f.
Creates, enables, modifies, disables, and removes information system accounts in accordance with [Assignment: organization-defined procedures or conditions];
AC-2g.
Monitors the use of information system accounts;
AC-2h.
Notifies account managers:
AC-2h.1.
When accounts are no longer required;
AC-2h.2.
When users are terminated or transferred; and
AC-2h.3.
When individual information system usage or need-to-know changes;
AC-2i.
Authorizes access to the information system based on:
AC-2i.1.
A valid access authorization;
AC-2i.2.
Intended system usage; and
AC-2i.3.
Other attributes as required by the organization or associated missions/business functions;
AC-2j.
Reviews accounts for compliance with account management requirements [Assignment: organization-defined frequency]; and
AC-2k.
Establishes a process for reissuing shared/group account credentials (if deployed) when individuals are removed from the group.

=== AU-2: AUDIT EVENTS ===
Family: AUDIT AND ACCOUNTABILITY | Priority: P1 | Baselines: LOW, MODERATE, HIGH
The organization:
AU-2a.
Determines that the information system is capable of auditing the following events: [Assignment: organization-defined auditable events];
AU-2b.
Coordinates the security audit function with other organizational entities requiring audit-related information to enhance mutual support and to help guide the selection of auditable events;
AU-2c.
Provides a rationale for why the auditable events are deemed to be adequate to support after-the-fact investigations of security incidents; and
AU-2d.
Determines that the following events are to be audited within the information system: [Assignment: organization-defined audited events (the subset of the auditable events defined in AU-2 a.) along with the frequency of (or situation requiring) auditing for each identified event].

=== AU-6: AUDIT REVIEW, ANALYSIS, AND REPORTING ===
Family: AUDIT AND ACCOUNTABILITY | Priority: P1 | Baselines: LOW, MODERATE, HIGH
The organization:
AU-6a.
Reviews and analyzes information system audit records [Assignment: organization-defined frequency] for indications of [Assignment: organization-defined inappropriate or unusual activity]; and
AU-6b.
Reports findings to [Assignment: organization-defined personnel or roles].

=== AU-11: AUDIT RECORD RETENTION ===
Family: AUDIT AND ACCOUNTABILITY | Priority: P3 | Baselines: LOW, MODERATE, HIGH
The organization retains audit records for [Assignment: organization-defined time period consistent with records retention policy] to provide support for after-the-fact investigations of security incidents and to meet regulatory and organizational information retention requirements.

=== CA-2: SECURITY ASSESSMENTS ===
Family: SECURITY ASSESSMENT AND AUTHORIZATION | Priority: P2 | Baselines: LOW, MODERATE, HIGH
The organization:
CA-2a.
Develops a security assessment plan that describes the scope of the assessment including:
CA-2a.1.
Security controls and control enhancements under assessment;
CA-2a.2.
Assessment procedures to be used to determine security control effectiveness; and
CA-2a.3.
Assessment environment, assessment team, and assessment roles and responsibilities;
CA-2b.
Assesses the security controls in the information system and its environment of operation [Assignment: organization-defined frequency] to determine the extent to which the controls are implemented correctly, operating as intended, and producing the desired outcome with respect to meeting established security requirements;
CA-2c.
Produces a security assessment report that documents the results of the assessment; and
CA-2d.
Provides the results of the security control assessment to [Assignment: organization-defined individuals or roles].

=== CA-5: PLAN OF ACTION AND MILESTONES ===
Family: SECURITY ASSESSMENT AND AUTHORIZATION | Priority: P3 | Baselines: LOW, MODERATE, HIGH
The organization:
CA-5a.
Develops a plan of action and milestones for the information system to document the organization's planned remedial actions to correct weaknesses or deficiencies noted during the assessment of the security controls and to reduce or eliminate known vulnerabilities in the system; and
CA-5b.
Updates existing plan of action and milestones [Assignment: organization-defined frequency] based on the findings from security controls assessments, security impact analyses, and continuous monitoring activities.

=== CA-7: CONTINUOUS MONITORING ===
Family: SECURITY ASSESSMENT AND AUTHORIZATION | Priority: P2 | Baselines: LOW, MODERATE, HIGH
The organization develops a continuous monitoring strategy and implements a continuous monitoring program that includes:
CA-7a.
Establishment of [Assignment: organization-defined metrics] to be monitored;
CA-7b.
Establishment of [Assignment: organization-defined frequencies] for monitoring and [Assignment: organization-defined frequencies] for assessments supporting such monitoring;
CA-7c.
Ongoing security control assessments in accordance with the organizational continuous monitoring strategy;
CA-7d.
Ongoing security status monitoring of organization-defined metrics in accordance with the organizational continuous monitoring strategy;
CA-7e.
Correlation and analysis of security-related information generated by assessments and monitoring;
CA-7f.
Response actions to address results of the analysis of security-related information; and
CA-7g.
Reporting the security status of organization and the information system to [Assignment: organization-defined personnel or roles] [Assignment: organization-defined frequency].

=== CA-8: PENETRATION TESTING ===
Family: SECURITY ASSESSMENT AND AUTHORIZATION | Priority: P2 | Baselines: HIGH
The organization conducts penetration testing [Assignment: organization-defined frequency] on [Assignment: organization-defined information systems or system components].

=== CM-2: BASELINE CONFIGURATION ===
Family: CONFIGURATION MANAGEMENT | Priority: P1 | Baselines: LOW, MODERATE, HIGH
The organization develops, documents, and maintains under configuration control, a current baseline configuration of the information system.

=== CM-7: LEAST FUNCTIONALITY ===
Family: CONFIGURATION MANAGEMENT | Priority: P1 | Baselines: LOW, MODERATE, HIGH
The organization:
CM-7a.
Configures the information system to provide only essential capabilities; and
CM-7b.
Prohibits or restricts the use of the following functions, ports, protocols, and/or services: [Assignment: organization-defined prohibited or restricted functions, ports, protocols, and/or services].

=== CM-8: INFORMATION SYSTEM COMPONENT INVENTORY ===
Family: CONFIGURATION MANAGEMENT | Priority: P1 | Baselines: LOW, MODERATE, HIGH
The organization:
CM-8a.
Develops and documents an inventory of information system components that:
CM-8a.1.
Accurately reflects the current information system;
CM-8a.2.
Includes all components within the authorization boundary of the information system;
CM-8a.3.
Is at the level of granularity deemed necessary for tracking and reporting; and
CM-8a.4.
Includes [Assignment: organization-defined information deemed necessary to achieve effective information system component accountability]; and
CM-8b.
Reviews and updates the information system component inventory [Assignment: organization-defined frequency].

=== CP-2: CONTINGENCY PLAN ===
Family: CONTINGENCY PLANNING | Priority: P1 | Baselines: LOW, MODERATE, HIGH
The organization:
CP-2a.
Develops a contingency plan for the information system that:
CP-2a.1.
Identifies essential missions and business functions and associated contingency requirements;
CP-2a.2.
Provides recovery objectives, restoration priorities, and metrics;
CP-2a.3.
Addresses contingency roles, responsibilities, assigned individuals with contact information;
CP-2a.4.
Addresses maintaining essential missions and business functions despite an information system disruption, compromise, or failure;
CP-2a.5.
Addresses eventual, full information system restoration without deterioration of the security safeguards originally planned and implemented; and
CP-2a.6.
Is reviewed and approved by [Assignment: organization-defined personnel or roles];
CP-2b.
Distributes copies of the contingency plan to [Assignment: organization-defined key contingency personnel (identified by name and/or by role) and organizational elements];
CP-2c.
Coordinates contingency planning activities with incident handling activities;
CP-2d.
Reviews the contingency plan for the information system [Assignment: organization-defined frequency];
CP-2e.
Updates the contingency plan to address changes to the organization, information system, or environment of operation and problems encountered during contingency plan implementation, execution, or testing;
CP-2f.
Communicates contingency plan changes to [Assignment: organization-defined key contingency personnel (identified by name and/or by role) and organizational elements]; and
CP-2g.
Protects the contingency plan from unauthorized disclosure and modification.

=== CP-3: CONTINGENCY TRAINING ===
Family: CONTINGENCY PLANNING | Priority: P2 | Baselines: LOW, MODERATE, HIGH
The organization provides contingency training to information system users consistent with assigned roles and responsibilities:
CP-3a.
Within [Assignment: organization-defined time period] of assuming a contingency role or responsibility;
CP-3b.
When required by information system changes; and
CP-3c.
[Assignment: organization-defined frequency] thereafter.

=== CP-4: CONTINGENCY PLAN TESTING ===
Family: CONTINGENCY PLANNING | Priority: P2 | Baselines: LOW, MODERATE, HIGH
The organization:
CP-4a.
Tests the contingency plan for the information system [Assignment: organization-defined frequency] using [Assignment: organization-defined tests] to determine the effectiveness of the plan and the organizational readiness to execute the plan;
CP-4b.
Reviews the contingency plan test results; and
CP-4c.
Initiates corrective actions, if needed.

=== CP-9: INFORMATION SYSTEM BACKUP ===
Family: CONTINGENCY PLANNING | Priority: P1 | Baselines: LOW, MODERATE, HIGH
The organization:
CP-9a.
Conducts backups of user-level information contained in the information system [Assignment: organization-defined frequency consistent with recovery time and recovery point objectives];
CP-9b.
Conducts backups of system-level information contained in the information system [Assignment: organization-defined frequency consistent with recovery time and recovery point objectives];
CP-9c.
Conducts backups of information system documentation including security-related documentation [Assignment: organization-defined frequency consistent with recovery time and recovery point objectives]; and
CP-9d.
Protects the confidentiality, integrity, and availability of backup information at storage locations.

=== IA-4: IDENTIFIER MANAGEMENT ===
Family: IDENTIFICATION AND AUTHENTICATION | Priority: P1 | Baselines: LOW, MODERATE, HIGH
The organization manages information system identifiers by:
IA-4a.
Receiving authorization from [Assignment: organization-defined personnel or roles] to assign an individual, group, role, or device identifier;
IA-4b.
Selecting an identifier that identifies an individual, group, role, or device;
IA-4c.
Assigning the identifier to the intended individual, group, role, or device;
IA-4d.
Preventing reuse of identifiers for [Assignment: organization-defined time period]; and
IA-4e.
Disabling the identifier after [Assignment: organization-defined time period of inactivity].

=== IA-5: AUTHENTICATOR MANAGEMENT ===
Family: IDENTIFICATION AND AUTHENTICATION | Priority: P1 | Baselines: LOW, MODERATE, HIGH
The organization manages information system authenticators by:
IA-5a.
Verifying, as part of the initial authenticator distribution, the identity of the individual, group, role, or device receiving the authenticator;
IA-5b.
Establishing initial authenticator content for authenticators defined by the organization;
IA-5c.
Ensuring that authenticators have sufficient strength of mechanism for their intended use;
IA-5d.
Establishing and implementing administrative procedures for initial authenticator distribution, for lost/compromised or damaged authenticators, and for revoking authenticators;
IA-5e.
Changing default content of authenticators prior to information system installation;
IA-5f.
Establishing minimum and maximum lifetime restrictions and reuse conditions for authenticators;
IA-5g.
Changing/refreshing authenticators [Assignment: organization-defined time period by authenticator type];
IA-5h.
Protecting authenticator content from unauthorized disclosure and modification;
IA-5i.
Requiring individuals to take, and having devices implement, specific security safeguards to protect authenticators; and
IA-5j.
Changing authenticators for group/role accounts when membership to those accounts changes.

=== IA-11: RE-AUTHENTICATION ===
Family: IDENTIFICATION AND AUTHENTICATION | Priority: P0 | Baselines: 
The organization requires users and devices to re-authenticate when [Assignment: organization-defined circumstances or situations requiring re-authentication].

=== IR-2: INCIDENT RESPONSE TRAINING ===
Family: INCIDENT RESPONSE | Priority: P2 | Baselines: LOW, MODERATE, HIGH
The organization provides incident response training to information system users consistent with assigned roles and responsibilities:
IR-2a.
Within [Assignment: organization-defined time period] of assuming an incident response role or responsibility;
IR-2b.
When required by information system changes; and
IR-2c.
[Assignment: organization-defined frequency] thereafter.

=== IR-3: INCIDENT RESPONSE TESTING ===
Family: INCIDENT RESPONSE | Priority: P2 | Baselines: MODERATE, HIGH
The organization tests the incident response capability for the information system [Assignment: organization-defined frequency] using [Assignment: organization-defined tests] to determine the incident response effectiveness and documents the results.

=== MA-3: MAINTENANCE TOOLS ===
Family: MAINTENANCE | Priority: P3 | Baselines: MODERATE, HIGH
The organization approves, controls, and monitors information system maintenance tools.

=== MA-4: NONLOCAL MAINTENANCE ===
Family: MAINTENANCE | Priority: P2 | Baselines: LOW, MODERATE, HIGH
The organization:
MA-4a.
Approves and monitors nonlocal maintenance and diagnostic activities;
MA-4b.
Allows the use of nonlocal maintenance and diagnostic tools only as consistent with organizational policy and documented in the security plan for the information system;
MA-4c.
Employs strong authenticators in the establishment of nonlocal maintenance and diagnostic sessions;
MA-4d.
Maintains records for nonlocal maintenance and diagnostic activities; and
MA-4e.
Terminates session and network connections when nonlocal maintenance is completed.

=== PE-2: PHYSICAL ACCESS AUTHORIZATIONS ===
Family: PHYSICAL AND ENVIRONMENTAL PROTECTION | Priority: P1 | Baselines: LOW, MODERATE, HIGH
The organization:
PE-2a.
Develops, approves, and maintains a list of individuals with authorized access to the facility where the information system resides;
PE-2b.
Issues authorization credentials for facility access;
PE-2c.
Reviews the access list detailing authorized facility access by individuals [Assignment: organization-defined frequency]; and
PE-2d.
Removes individuals from the facility access list when access is no longer required.

=== PE-3: PHYSICAL ACCESS CONTROL ===
Family: PHYSICAL AND ENVIRONMENTAL PROTECTION | Priority: P1 | Baselines: LOW, MODERATE, HIGH
The organization:
PE-3a.
Enforces physical access authorizations at [Assignment: organization-defined entry/exit points to the facility where the information system resides] by;
PE-3a.1.
Verifying individual access authorizations before granting access to the facility; and
PE-3a.2.
Controlling ingress/egress to the facility using [Selection (one or more): [Assignment: organization-defined physical access control systems/devices]; guards];
PE-3b.
Maintains physical access audit logs for [Assignment: organization-defined entry/exit points];
PE-3c.
Provides [Assignment: organization-defined security safeguards] to control access to areas within the facility officially designated as publicly accessible;
PE-3d.
Escorts visitors and monitors visitor activity [Assignment: organization-defined circumstances requiring visitor escorts and monitoring];
PE-3e.
Secures keys, combinations, and other physical access devices;
PE-3f.
Inventories [Assignment: organization-defined physical access devices] every [Assignment: organization-defined frequency]; and
PE-3g.
Changes combinations and keys [Assignment: organization-defined frequency] and/or when keys are lost, combinations are compromised, or individuals are transferred or terminated.

=== PE-6: MONITORING PHYSICAL ACCESS ===
Family: PHYSICAL AND ENVIRONMENTAL PROTECTION | Priority: P1 | Baselines: LOW, MODERATE, HIGH
The organization:
PE-6a.
Monitors physical access to the facility where the information system resides to detect and respond to physical security incidents;
PE-6b.
Reviews physical access logs [Assignment: organization-defined frequency] and upon occurrence of [Assignment: organization-defined events or potential indications of events]; and
PE-6c.
Coordinates results of reviews and investigations with the organizational incident response capability.

=== PE-8: VISITOR ACCESS RECORDS ===
Family: PHYSICAL AND ENVIRONMENTAL PROTECTION | Priority: P3 | Baselines: LOW, MODERATE, HIGH
The organization:
PE-8a.
Maintains visitor access records to the facility where the information system resides for [Assignment: organization-defined time period]; and
PE-8b.
Reviews visitor access records [Assignment: organization-defined frequency].

=== RA-5: VULNERABILITY SCANNING ===
Family: RISK ASSESSMENT | Priority: P1 | Baselines: LOW, MODERATE, HIGH
The organization:
RA-5a.
Scans for vulnerabilities in the information system and hosted applications [Assignment: organization-defined frequency and/or randomly in accordance with organization-defined process] and when new vulnerabilities potentially affecting the system/applications are identified and reported;
RA-5b.
Employs vulnerability scanning tools and techniques that facilitate interoperability among tools and automate parts of the vulnerability management process by using standards for:
RA-5b.1.
Enumerating platforms, software flaws, and improper configurations;
RA-5b.2.
Formatting checklists and test procedures; and
RA-5b.3.
Measuring vulnerability impact;
RA-5c.
Analyzes vulnerability scan reports and results from security control assessments;
RA-5d.
Remediates legitimate vulnerabilities [Assignment: organization-defined response times] in accordance with an organizational assessment of risk; and
RA-5e.
Shares information obtained from the vulnerability scanning process and security control assessments with [Assignment: organization-defined personnel or roles] to help eliminate similar vulnerabilities in other information systems (i.e., systemic weaknesses or deficiencies).

=== SI-2: FLAW REMEDIATION ===
Family: SYSTEM AND INFORMATION INTEGRITY | Priority: P1 | Baselines: LOW, MODERATE, HIGH
The organization:
SI-2a.
Identifies, reports, and corrects information system flaws;
SI-2b.
Tests software and firmware updates related to flaw remediation for effectiveness and potential side effects before installation;
SI-2c.
Installs security-relevant software and firmware updates within [Assignment: organization-defined time period] of the release of the updates; and
SI-2d.
Incorporates flaw remediation into the organizational configuration management process.

=== SI-3: MALICIOUS CODE PROTECTION ===
Family: SYSTEM AND INFORMATION INTEGRITY | Priority: P1 | Baselines: LOW, MODERATE, HIGH
The organization:
SI-3a.
Employs malicious code protection mechanisms at information system entry and exit points to detect and eradicate malicious code;
SI-3b.
Updates malicious code protection mechanisms whenever new releases are available in accordance with organizational configuration management policy and procedures;
SI-3c.
Configures malicious code protection mechanisms to:
SI-3c.1.
Perform periodic scans of the information system [Assignment: organization-defined frequency] and real-time scans of files from external sources at [Selection (one or more); endpoint; network entry/exit points] as the files are downloaded, opened, or executed in accordance with organizational security policy; and
SI-3c.2.
[Selection (one or more): block malicious code; quarantine malicious code;  send alert to administrator; [Assignment: organization-defined action]] in response to malicious code detection; and
SI-3d.
Addresses the receipt of false positives during malicious code detection and eradication and the resulting potential impact on the availability of the information system.


---

*End of excerpt. Full narrative PDF source: https://nvlpubs.nist.gov/nistpubs/specialpublications/nist.sp.800-53r4.pdf — Full machine-readable XML catalog: see `nist-800-53-rev4-controls.xml` in this directory (copied in full from https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml).*
