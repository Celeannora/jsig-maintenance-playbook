# FedRAMP SSP Appendix A — High Baseline Security Controls (Excerpt)

- **Source URL:** https://www.fedramp.gov/resources/templates/SSP-Appendix-A-High-FedRAMP-Security-Controls.docx
- **Retrieved:** 2026-07-17
- **Why included:** Provides the stricter High-baseline cadence variants cited in the research: MA-3 (annual tool review), CM-2/CM-7/CM-8 (annual/monthly/quarterly), AU-6/AU-11 (weekly review, retention), RA-5/SI-2/SI-3 (monthly scanning, 30/90/180-day remediation), CA-2/CA-5/CA-7/CA-8 (annual assessment, monthly POA&M, annual pen test), CP-2/CP-4/CP-9 (annual CP testing, daily incremental/weekly full backups, **monthly** backup testing), IR-2/IR-3 (**every 6 months** IR testing including annual functional test), PE-2/PE-3/PE-6/PE-8 (**every 90 days** facility access list review, monthly log review), and AC-2/IA-4/IA-5/IA-11 (**monthly** privileged/**six-month** non-privileged account review, stricter session/reauthentication timers).

> **NOTE — THIS IS AN EXCERPT, NOT THE COMPLETE DOCUMENT.** The original is a ~3.4MB Microsoft Word (.docx) System Security Plan Appendix A template covering all FedRAMP High-baseline controls with full control statement text, parameter assignments, and blank SSP response tables (implementation status, responsible role, control origination checkboxes, etc.). Only the control statement text and FedRAMP-assigned frequency/timing parameters for the control families cited in the JSIG cadence research (AC, AU, CA, CM, CP, IA, IR, MA, PE, RA, SI) are reproduced below, with SSP response-table boilerplate stripped out. For the complete document, including every control family, control enhancement, and blank customer-response worksheet, download the full .docx from the source URL above.

---

===== AC-2 =====
AC-2 Account Management (L)(M)(H)
a. Define and document the types of accounts allowed and specifically
prohibited for use within the system;
b. Assign account managers;
c. Require [Assignment: organization-defined prerequisites and criteria]
for group and role membership;
d. Specify:
1. Authorized users of the system;
2. Group and role membership; and
3. Access authorizations (i.e., privileges) and [Assignment:
organization-defined attributes (as required)] for each account;
e. Require approvals by [Assignment: organization-defined personnel or
roles] for requests to create accounts;
f. Create, enable, modify, disable, and remove accounts in accordance
with [Assignment: organization-defined policy, procedures,
prerequisites, and criteria];
g. Monitor the use of accounts;
h. Notify account managers and [Assignment: organization-defined
personnel or roles] within:
1. [FedRAMP Assignment: twenty-four (24) hours] when accounts are no
longer required;
2. [FedRAMP Assignment: eight (8) hours] when users are terminated or
transferred; and
3. [FedRAMP Assignment: eight (8) hours] when system usage or
need-to-know changes for an individual;
i. Authorize access to the system based on:
1. A valid access authorization;
2. Intended system usage; and
3. [Assignment: organization-defined attributes (as required)];
j. Review accounts for compliance with account management requirements
[FedRAMP Assignment: monthly for privileged accessed, every six (6)
months for non-privileged access];
k. Establish and implement a process for changing shared or group
account authenticators (if deployed) when individuals are removed from
the group; and
l. Align account management processes with personnel termination and
transfer processes.
  -----------------------------------------------------------------------
===== AU-2 =====
AU-2 Event Logging (L)(M)(H)
a. Identify the types of events that the system is capable of logging in
support of the audit function: [FedRAMP Assignment: successful and
unsuccessful account logon events, account management events, object
access, policy change, privilege functions, process tracking, and system
events. For Web applications: all administrator activity, authentication
checks, authorization checks, data deletions, data access, data changes,
and permission changes];
b. Coordinate the event logging function with other organizational
entities requiring audit-related information to guide and inform the
selection criteria for events to be logged;
c. Specify the following event types for logging within the system:
[FedRAMP Assignment: organization-defined subset of the auditable events
defined in AU-2a to be audited continually for each identified event.];
d. Provide a rationale for why the event types selected for logging are
deemed to be adequate to support after-the-fact investigations of
incidents; and
e. Review and update the event types selected for logging [FedRAMP
Assignment: annually and whenever there is a change in the threat
environment].
  -----------------------------------------------------------------------
===== AU-6 =====
AU-6 Audit Record Review, Analysis, and Reporting (L)(M)(H)
a. Review and analyze system audit records [FedRAMP Assignment: at least
weekly] for indications of [Assignment: organization-defined
inappropriate or unusual activity] and the potential impact of the
inappropriate or unusual activity;
b. Report findings to [Assignment: organization-defined personnel or
roles]; and
c. Adjust the level of audit record review, analysis, and reporting
within the system when there is a change in risk based on law
enforcement information, intelligence information, or other credible
sources of information.
===== AU-11 =====
AU-11 Audit Record Retention (L)(M)(H)
  Retain audit records for [FedRAMP Assignment: a time period in
  compliance with M-21-31] to provide support for after-the-fact
  investigations of incidents and to meet regulatory and organizational
  information retention requirements.
===== CA-2 =====
CA-2 Control Assessments (L)(M)(H)
a. Select the appropriate assessor or assessment team for the type of
assessment to be conducted;
b. Develop a control assessment plan that describes the scope of the
assessment including:
1. Controls and control enhancements under assessment;
2. Assessment procedures to be used to determine control effectiveness;
and
3. Assessment environment, assessment team, and assessment roles and
responsibilities;
c. Ensure the control assessment plan is reviewed and approved by the
authorizing official or designated representative prior to conducting
the assessment;
d. Assess the controls in the system and its environment of operation
[FedRAMP Assignment: at least annually] to determine the extent to which
the controls are implemented correctly, operating as intended, and
producing the desired outcome with respect to meeting established
security and privacy
e. Produce a control assessment report that document the results of the
assessment; and
f. Provide the results of the control assessment to [FedRAMP Assignment:
individuals or roles to include FedRAMP PMO].
===== CA-5 =====
CA-5 Plan of Action and Milestones (L)(M)(H)
a. Develop a plan of action and milestones for the system to document
the planned remediation actions of the organization to correct
weaknesses or deficiencies noted during the assessment of the controls
and to reduce or eliminate known vulnerabilities in the system; and
b. Update existing plan of action and milestones [FedRAMP Assignment: at
least monthly] based on the findings from control assessments,
independent audits or reviews, and continuous monitoring activities.
===== CA-7 =====
CA-7 Continuous Monitoring (L)(M)(H)
Develop a system-level continuous monitoring strategy and implement
continuous monitoring in accordance with the organization-level
continuous monitoring strategy that includes:
a. Establishing the following system-level metrics to be monitored:
[Assignment: organization-defined system-level metrics];
b. Establishing [Assignment: organization-defined frequencies] for
monitoring and [Assignment: organization-defined frequencies] for
assessment of control effectiveness;
c. Ongoing control assessments in accordance with the continuous
monitoring strategy;
d. Ongoing monitoring of system and organization-defined metrics in
accordance with the continuous monitoring strategy;
e. Correlation and analysis of information generated by control
assessments and monitoring;
f. Response actions to address results of the analysis of control
assessment and monitoring information; and
g. Reporting the security and privacy status of the system to
[Assignment: Organization-defined personnel or role] [Assignment:
organization-defined frequency].
===== CA-8 =====
CA-8 Penetration Testing (L)(M)(H)
Conduct penetration testing [FedRAMP Assignment: at least annually] on
[Assignment: organization-defined systems or system components].
===== CM-2 =====
CM-2 Baseline Configuration (L)(M)(H)
a. Develop, document, and maintain under configuration control, a
current baseline configuration of the system; and
b. Review and update the baseline configuration of the system:
1. [FedRAMP Assignment: at least annually and when a significant change
occurs];
2. When required due to [Assignment: organization-defined
circumstances]; and
3. When system components are installed or upgraded.
===== CM-5 =====
CM-5 Access Restrictions for Change (L)(M)(H)
Define, document, approve, and enforce physical and logical access
restrictions associated with changes to the system.
  -----------------------------------------------------------------------
===== CM-7 =====
CM-7 Least Functionality (L)(M)(H)
a. Configure the system to provide only [Assignment:
organization-defined mission essential capabilities]; and
b. Prohibit or restrict the use of the following functions, ports,
protocols, software, and/or services: [Assignment: organization-defined
prohibited or restricted functions, system ports, protocols, software,
and/or services].
===== CM-8 =====
CM-8 System Component Inventory (L)(M)(H)
a. Develop and document an inventory of system components that:
1. Accurately reflects the system;
2. Includes all components within the system;
3. Does not include duplicate accounting of components or components
assigned to any other system;
4. Is at the level of granularity deemed necessary for tracking and
reporting; and
5. Includes the following information to achieve system component
accountability: [Assignment: organization-defined information deemed
necessary to achieve effective system component accountability]; and
b. Review and update the system component inventory [FedRAMP Assignment:
at least monthly].
===== CP-2 =====
CP-2 Contingency Plan (L)(M)(H)
a. Develop a contingency plan for the system that:
1. Identifies essential mission and business functions and associated
contingency requirements;
2. Provides recovery objectives, restoration priorities, and metrics;
3. Addresses contingency roles, responsibilities, assigned individuals
with contact information;
4. Addresses maintaining essential mission and business functions
despite a system disruption, compromise, or failure;
5. Addresses eventual, full system restoration without deterioration of
the controls originally planned and implemented;
6. Addresses the sharing of contingency information; and
7. Is reviewed and approved by [Assignment: organization-defined
personnel or roles];
b. Distribute copies of the contingency plan to [Assignment:
organization-defined key contingency personnel (identified by name
and/or by role) and organizational elements];
c. Coordinate contingency planning activities with incident handling
activities;
d. Review the contingency plan for the system [FedRAMP Assignment: at
least annually];
e. Update the contingency plan to address changes to the organization,
system, or environment of operation and problems encountered during
contingency plan implementation, execution, or testing;
f. Communicate contingency plan changes to [Assignment:
organization-defined key contingency personnel (identified by name
and/or by role) and organizational elements];
g. Incorporate lessons learned from contingency plan testing, training,
or actual contingency activities into contingency testing and training;
and
h. Protect the contingency plan from unauthorized disclosure and
modification.
===== CP-3 =====
CP-3 Contingency Training (L)(M)(H)
a. Provide contingency training to system users consistent with assigned
roles and responsibilities:
1. Within [FedRAMP Assignment: *See Additional Requirements] of assuming
a contingency role or responsibility;
2. When required by system changes; and
3. [FedRAMP Assignment: at least annually] thereafter; and
b. Review and update contingency training content [FedRAMP Assignment:
at least annually] and following [Assignment: organization-defined
events].
===== CP-4 =====
CP-4 Contingency Plan Testing (L)(M)(H)
a. Test the contingency plan for the system [FedRAMP Assignment: at
least annually] using the following tests to determine the effectiveness
of the plan and the readiness to execute the plan: [FedRAMP Assignment:
functional exercises].
b. Review the contingency plan test results; and
c. Initiate corrective actions, if needed.
===== CP-9 =====
CP-9 System Backup (L)(M)(H)
a. Conduct backups of user-level information contained in [Assignment:
organization-defined system components]; [FedRAMP Assignment: daily
incremental; weekly full]
b. Conduct backups of system-level information contained in the system
[FedRAMP Assignment: daily incremental; weekly full];
c. Conduct backups of system documentation, including security- and
privacy-related documentation [FedRAMP Assignment: daily incremental;
weekly full]; and
d. Protect the confidentiality, integrity, and availability of backup
information.
===== IA-4 =====
IA-4 Identifier Management (L)(M)(H)
Manage system identifiers by:
a. Receiving authorization from [FedRAMP Assignment: at a minimum, the
ISSO (or similar role within the organization)] to assign an individual,
group, role, service, or device identifier;
b. Selecting an identifier that identifies an individual, group, role,
service, or device;
c. Assigning the identifier to the intended individual, group, role,
service, or device; and
d. Preventing reuse of identifiers for [FedRAMP Assignment: at least two
(2) years].
  -----------------------------------------------------------------------
===== IA-5 =====
IA-5 Authenticator Management (L)(M)(H)
Manage system authenticators by:
a. Verifying, as part of the initial authenticator distribution, the
identity of the individual, group, role, service, or device receiving
the authenticator;
b. Establishing initial authenticator content for any authenticators
issued by the organization;
c. Ensuring that authenticators have sufficient strength of mechanism
for their intended use;
d. Establishing and implementing administrative procedures for initial
authenticator distribution, for lost or compromised or damaged
authenticators, and for revoking authenticators;
e. Changing default authenticators prior to first use;
f. Changing or refreshing authenticators [Assignment:
organization-defined time period by authenticator type] or when
[Assignment: organization-defined events] occur;
g. Protecting authenticator content from unauthorized disclosure and
modification;
h. Requiring individuals to take, and having devices implement, specific
controls to protect authenticators; and
i. Changing authenticators for group or role accounts when membership to
those accounts changes.
===== IA-11 =====
IA-11 Re-authentication (L)(M)(H)
Require users to re-authenticate when [Assignment: organization-defined
circumstances or situations requiring re-authentication].
===== IR-2 =====
IR-2 Incident Response Training (L)(M)(H)
a. Provide incident response training to system users consistent with
assigned roles and responsibilities:
1. Within [FedRAMP Assignment: ten (10) days for privileged users,
thirty (30) days for Incident Response roles] of assuming an incident
response role or responsibility or acquiring system access;
2. When required by system changes; and
3. [FedRAMP Assignment: at least annually] thereafter; and
b. Review and update incident response training content [FedRAMP
Assignment: at least annually] and following [Assignment:
organization-defined events].
  -----------------------------------------------------------------------
===== IR-3 =====
IR-3 Incident Response Testing (M)(H)
  Test the effectiveness of the incident response capability for the
  system [FedRAMP Assignment: at least every six (6) months, including
  functional at least annually] using the following tests: [Assignment:
  organization-defined tests].
  IR-3-2 Additional FedRAMP Requirements and Guidance:
  Requirement: The service provider defines tests and/or exercises in
  accordance with NIST Special Publication 800-61 (as amended).
  Functional testing must occur prior to testing for initial
  authorization. Annual functional testing may be concurrent with
  required penetration tests (see CA-8).
  -----------------------------------------------------------------------
===== MA-3 =====
MA-3 Maintenance Tools (M)(H)
a. Approve, control, and monitor the use of system maintenance tools;
and
b. Review previously approved system maintenance tools [FedRAMP
Assignment: at least annually].
  -----------------------------------------------------------------------
===== MA-4 =====
MA-4 Nonlocal Maintenance (L)(M)(H)
a. Approve and monitor nonlocal maintenance and diagnostic activities;
b. Allow the use of nonlocal maintenance and diagnostic tools only as
consistent with organizational policy and documented in the security
plan for the system;
c. Employ strong authentication in the establishment of nonlocal
maintenance and diagnostic sessions;
d. Maintain records for nonlocal maintenance and diagnostic activities;
and
e. Terminate session and network connections when nonlocal maintenance
is completed.
  -----------------------------------------------------------------------
===== PE-2 =====
PE-2 Physical Access Authorizations (L)(M)(H)
a. Develop, approve, and maintain a list of individuals with authorized
access to the facility where the system resides;
b. Issue authorization credentials for facility access;
c. Review the access list detailing authorized facility access by
individuals [FedRAMP Assignment: at least every ninety (90) days]; and
d. Remove individuals from the facility access list when access is no
longer required.
  -----------------------------------------------------------------------
===== PE-3 =====
PE-3 Physical Access Control (L)(M)(H)
a. Enforce physical access authorizations at [Assignment:
organization-defined entry and exit points to the facility where the
system resides] by:
1. Verifying individual access authorizations before granting access to
the facility; and
2. Controlling ingress and egress to the facility using [FedRAMP
Assignment: CSP defined physical access control systems/devices AND
guards];
b. Maintain physical access audit logs for [Assignment:
organization-defined entry or exit points];
c. Control access to areas within the facility designated as publicly
accessible by implementing the following controls: [Assignment:
organization-defined physical access controls];
d. Escort visitors and control visitor activity [FedRAMP Assignment: in
all circumstances within restricted access area where the information
system resides];
e. Secure keys, combinations, and other physical access devices;
f. Inventory [Assignment: organization-defined physical access devices]
every [FedRAMP Assignment: at least annually]; and
g. Change combinations and keys [FedRAMP Assignment: at least annually
or earlier as required by a security relevant event.] and/or when keys
are lost, combinations are compromised, or when individuals possessing
the keys or combinations are transferred or terminated.
  -----------------------------------------------------------------------
===== PE-6 =====
PE-6 Monitoring Physical Access (L)(M)(H)
a. Monitor physical access to the facility where the system resides to
detect and respond to physical security incidents;
b. Review physical access logs [FedRAMP Assignment: at least monthly]
and upon occurrence of [Assignment: organization-defined events or
potential indications of events]; and
c. Coordinate results of reviews and investigations with the
organizational incident response capability.
  -----------------------------------------------------------------------
===== PE-8 =====
PE-8 Visitor Access Records (L)(M)(H)
a. Maintain visitor access records to the facility where the system
resides for [FedRAMP Assignment: for a minimum of one (1) year];
b. Review visitor access records [FedRAMP Assignment: at least monthly];
and
c. Report anomalies in visitor access records to [Assignment:
organization-defined personnel].
  -----------------------------------------------------------------------
===== RA-5 =====
RA-5 Vulnerability Monitoring and Scanning (L)(M)(H)
a. Monitor and scan for vulnerabilities in the system and hosted
applications [FedRAMP Assignment: monthly operating
system/infrastructure; monthly web applications (including APIs) and
databases] and when new vulnerabilities potentially affecting the system
are identified and reported;
b. Employ vulnerability monitoring tools and techniques that facilitate
interoperability among tools and automate parts of the vulnerability
management process by using standards for:
1. Enumerating platforms, software flaws, and improper configurations;
2. Formatting checklists and test procedures; and
3. Measuring vulnerability impact;
c. Analyze vulnerability scan reports and results from vulnerability
monitoring;
d. Remediate legitimate vulnerabilities [FedRAMP Assignment: high-risk
vulnerabilities mitigated within thirty (30) days from date of
discovery; moderate-risk vulnerabilities mitigated within ninety (90)
days from date of discovery; low risk vulnerabilities mitigated within
one hundred and eighty (180) days from date of discovery] in accordance
with an organizational assessment of risk;
e. Share information obtained from the vulnerability monitoring process
and control assessments with [Assignment: organization-defined personnel
or roles] to help eliminate similar vulnerabilities in other systems;
and
f. Employ vulnerability monitoring tools that include the capability to
readily update the vulnerabilities to be scanned.
===== SI-2 =====
SI-2(3) Time to Remediate Flaws and Benchmarks for Corrective Actions
(M)(H) 545
===== SI-3 =====
SI-3 Malicious Code Protection (L)(M)(H)
a. Implement [FedRAMP Assignment: signature based and non-signature
based] malicious code protection mechanisms at system entry and exit
points to detect and eradicate malicious code;
b. Automatically update malicious code protection mechanisms as new
releases are available in accordance with organizational configuration
management policy and procedures;
c. Configure malicious code protection mechanisms to:
1. Perform periodic scans of the system [FedRAMP Assignment: at least
weekly] and real-time scans of files from external sources at [FedRAMP
Assignment: to include endpoints and network entry and exit points] as
the files are downloaded, opened, or executed in accordance with
organizational policy; and
2. [FedRAMP Assignment: [to include blocking and quarantining malicious
code]; and send alert to [FedRAMP Assignment: [administrator or defined
security personnel near-real time] in response to malicious code
detection; and
d. Address the receipt of false positives during malicious code
detection and eradication and the resulting potential impact on the
availability of the system.
  -----------------------------------------------------------------------
---

*End of excerpt. Full source: https://www.fedramp.gov/resources/templates/SSP-Appendix-A-High-FedRAMP-Security-Controls.docx*
