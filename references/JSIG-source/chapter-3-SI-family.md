# JSIG Chapter 3 System and Information Integrity (SI) Family

Source URL: https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Extraction note: Verbatim/near-verbatim extraction via document-aware fetch, retrieved 2026-07-17. Tool-returned content follows; no content has been inferred beyond the returned extraction.

---

### SI-1 SYSTEM AND INFORMATION INTEGRITY POLICY AND PROCEDURES

**Control:**
The organization:
a.  Develops, documents, and disseminates to [Assignment: organization-defined personnel or roles]:
1.  A system and information integrity policy that addresses purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance; and
2.  Procedures to facilitate the implementation of the system and information integrity policy and associated system and information integrity controls; and
b.  Reviews and updates the current:
1.  System and information integrity policy [Assignment: organization-defined frequency]; and
2.  System and information integrity procedures [Assignment: organization-defined frequency].

**Supplemental Guidance:**
This control addresses the establishment and dissemination of a policy and procedures to implement system and information integrity controls. The policy and procedures are consistent with applicable federal laws, Executive Orders, directives, policies, regulations, standards, and guidance. System and information integrity policy and procedures may be developed at the organization level, but may also be developed at the mission/business process level, and at the information system level if the policy is specific to a particular information system and the organization determines that the policy and procedures can be more effectively accomplished at the operational level. The procedures can be for system maintenance, software development, and software installation/replacement. System and information integrity controls are implemented at the organizational and information system level. Examples of system and information integrity controls include malicious code protection, flaw remediation, monitoring, spam protection, and information input validation.

**Related Controls:**
AT-3, CA-7, IR-4, MA-2, MP-6, RA-5, SI-2, SI-3, SI-4, SI-5, SI-7, SI-8, SI-10, SI-11, SI-12, SI-16, SI-17.

**References:**
NIST Special Publication 800-53, Revision 4, System and Information Integrity.

**Priority and Baseline Allocation:**
P1
Low
Moderate
High

---

### SI-2 FLAW REMEDIATION

**Control:**
The organization:
a.  Identifies, reports, and corrects information system flaws;
b.  Tests software and firmware updates related to flaw remediation for effectiveness and potential side effects before installation;
c.  Installs security-relevant software and firmware updates within [Assignment: organization-defined time period] of the release of the updates; and
d.  Incorporates flaw remediation into organizational configuration management processes.

**Supplemental Guidance:**
Organizations identify, report, and correct information system flaws and notifies the appropriate organizational personnel. Flaw remediation includes the identification, reporting, and correction of system flaws and vulnerabilities, and may involve the application of patches, service packs, hot fixes, and workarounds. The time period for installation of security-relevant software and firmware updates is based on an assessment of the risk posed by the flaw, the criticality of the system, and the potential impact of the flaw on the organization's operations and assets, individuals, other organizations, and the Nation.

**Related Controls:**
CM-3, CM-4, RA-5, SI-7.

**References:**
NIST Special Publication 800-53, Revision 4, Flaw Remediation.

**Priority and Baseline Allocation:**
P2
Low
Moderate
High

---

### SI-3 MALICIOUS CODE PROTECTION

**Control:**
The organization:
a.  Employs malicious code protection mechanisms at information system entry and exit points to detect and eradicate malicious code;
b.  Updates malicious code protection mechanisms whenever new releases are available in accordance with organizational configuration management policy and procedures;
c.  Configures malicious code protection mechanisms to:
1.  Perform periodic scans of the information system [Assignment: organization-defined frequency] and real-time scans of files from external sources as the files are downloaded, opened, or executed in accordance with organizational security policy; and
2.  Automatically update malicious code protection mechanisms [Selection (one or more): centrally; locally; not at all];
d.  Addresses the receipt of false positives during malicious code detection and eradication and the resulting potential impact on the availability of the information system; and
e.  Quarantines malicious code, suspicious files, and related information.

**Supplemental Guidance:**
Malicious code protection mechanisms include, for example, anti-virus programs, malicious code intrusion detection software, and patch management. This control applies to endpoint, server, and mobile devices. Malicious code mechanisms are updated based on threat information and vulnerability data that is received from trusted sources, and may be implemented as part of a network intrusion detection system or other technology that can automatically detect and respond to the presence of malicious code.

**Related Controls:**
CM-3, CM-6, CM-7, IA-7, IR-4, MP-6, SI-2, SI-4.

**References:**
NIST Special Publication 800-53, Revision 4, Malicious Code Protection.

**Priority and Baseline Allocation:**
P2
Low
Moderate
High

---

### SI-4 INFORMATION SYSTEM MONITORING

**Control:**
The organization:
a.  Monitors the information system to detect:
1.  Attacks and indicators of potential attacks;
2.  Unauthorized local, network, and remote connections;
3.  Unauthorized use of the information system;
4.  Unauthorized changes to the information system; and
5.  Use of malicious code;
b.  Identifies unauthorized use of the information system;
c.  Deploys monitoring devices:
1.  Strategically within the information system to collect organization-determined essential information; and
2.  At ad hoc locations within the system to track specific types of transactions of interest to the organization;
d.  Protects information obtained from intrusion-monitoring tools from unauthorized access, modification, and deletion;
e.  Heightens the level of information system monitoring activity whenever there is an indication of increased risk to organizational operations and assets, individuals, other organizations, or the Nation;
f.  Obtains legal opinion with regard to information system monitoring activities;
g.  Provides [Assignment: organization-defined notice] of information system monitoring to users that: 
1.  Ensures privacy requirements are met;
2.  Is updated to reflect changes to monitoring activities;
h.  Uses monitoring tools at external boundaries and key internal boundaries of the information system;
i.  Correlates information from monitoring tools to achieve organization-wide situational awareness;
j.  Ensures the information system generates audit records for the organization-defined auditable events; and
k.  Analyzes and responds to indications of inappropriate or unusual activity.

**Supplemental Guidance:**
System monitoring includes the collection and analysis of information to detect, characterize, and respond to attacks and indicators of attacks. Monitoring is done in a way that preserves the privacy of users. Monitoring tools include intrusion detection systems, intrusion prevention systems, audit logging, and network analysis tools. The organization takes into account legal and policy issues involved in monitoring activities. The organization determines the types of events to be monitored and the level of detail to be captured.

**Related Controls:**
AU-2, AU-6, AU-12, CA-7, IR-4, RA-5, SI-3, SI-5, SI-7, SI-8.

**References:**
NIST Special Publication 800-53, Revision 4, Information System Monitoring.

**Priority and Baseline Allocation:**
P3
Low
Moderate
High

---

### SI-5 SECURITY ALERTS, ADVISORIES, AND DIRECTIVES

**Control:**
The organization:
a.  Receives information system security alerts, advisories, and directives from external organizations on an ongoing basis;
b.  Generates internal security alerts, advisories, and directives as deemed necessary;
c.  Disseminates security alerts, advisories, and directives to [Assignment: organization-defined personnel or roles] and [Assignment: organization-defined elements of the information system];
d.  Implements security directives in accordance with established time frames; and
e.  Implements methods for monitoring and reporting changes to the implementation status of security directives.

**Supplemental Guidance:**
Security alerts, advisories, and directives are generated by the organization and external sources. The organization determines the sources of information and the roles and responsibilities for receiving, reviewing, and acting on alerts and directives. The organization also determines time frames for implementing security directives and methods for reporting implementation status.

**Related Controls:**
IR-4, SI-2, SI-4, SI-7.

**References:**
NIST Special Publication 800-53, Revision 4, Security Alerts, Advisories, and Directives.

**Priority and Baseline Allocation:**
P3
Low
Moderate
High

---

### SI-6 SECURITY FUNCTION VERIFICATION

**Control:**
The information system:
a.  Verifies the correct operation of security functions [Selection (one or more): upon system startup; upon command by user with appropriate privilege; periodically every [Assignment: organization-defined time-period]; upon [Assignment: organization-defined system events]; at [Assignment: organization-defined frequency]];
b.  Provides notification of failed security tests to [Assignment: organization-defined personnel or roles];
c.  Generates audit records for security function verification events; and
d.  [Assignment: organization-defined actions] when anomalies are discovered.

**Supplemental Guidance:**
Security function verification ensures that system security functions are operating correctly and are effective in enforcing policy. Verification mechanisms include self-tests, challenge-response sequences, and integrity checks.

**Related Controls:**
AU-2, AU-6, CA-7, CM-3, SI-2, SI-4, SI-7.

**References:**
NIST Special Publication 800-53, Revision 4, Security Function Verification.

**Priority and Baseline Allocation:**
P4
Low
Moderate
High

---

### SI-7 SOFTWARE, FIRMWARE, AND INFORMATION INTEGRITY

**Control:**
The organization:
a.  Employs integrity verification tools to detect unauthorized changes to software, firmware, and information;
b.  Periodically [Assignment: organization-defined frequency] verifies the integrity of software and firmware;
c.  Addresses the detection of unauthorized changes to software and firmware by, for example, notifying appropriate organizational personnel, isolating the system, and initiating incident response procedures;
d.  Incorporates the detection of unauthorized changes into the incident response capability; and
e.  [Selection (one or more): verifies the integrity of software and firmware when the information system is [Assignment: organization-defined condition]; detects suspicious events and anomalous behavior; assesses the security state of the information system when there is indication of a compromise;] and [Assignment: organization-defined actions].

**Supplemental Guidance:**
Integrity verification tools include digital signatures, checksums, and cryptographic hashes. This control applies to software, firmware, and information. The organization determines when integrity checks are performed and what actions are taken when unauthorized changes are detected.

**Related Controls:**
CM-3, IR-4, SI-2, SI-3, SI-4, SI-6, SI-8.

**References:**
NIST Special Publication 800-53, Revision 4, Software, Firmware, and Information Integrity.

**Priority and Baseline Allocation:**
P2
Low
Moderate
High

---

### SI-8 SPAM PROTECTION

**Control:**
The information system:
a.  Receives and protects against spam in accordance with organizational policy and procedures; and
b.  Automatically updates spam protection mechanisms [Assignment: organization-defined frequency].

**Supplemental Guidance:**
Spam protection mechanisms include anti-spam software, email filtering, and other automated technologies.

**Related Controls:**
SC-7, SI-3, SI-4.

**References:**
NIST Special Publication 800-53, Revision 4, Spam Protection.

**Priority and Baseline Allocation:**
P3
Low
Moderate
High

---

### SI-9 INFORMATION INPUT RESTRICTIONS

**Control:**
The organization restricts the capability to input information to the information system to authorized individuals, sources, and/or devices.

**Supplemental Guidance:**
Information input restrictions include authentication of input devices, validation of input sources, and control of interfaces used to submit data.

**Related Controls:**
AC-2, AC-3, IA-2, IA-3, SI-10.

**References:**
NIST Special Publication 800-53, Revision 4, Information Input Restrictions.

**Priority and Baseline Allocation:**
P4
Low
Moderate
High

---

### SI-10 INFORMATION INPUT VALIDATION

**Control:**
The information system checks the validity of information inputs as close to the point of origin as possible.

**Supplemental Guidance:**
Input validation checks include error detection, parsing, and data type validation, as appropriate to the information and the system.

**Related Controls:**
AC-4, SA-11, SA-12, SI-4, SI-7, SI-16.

**References:**
NIST Special Publication 800-53, Revision 4, Information Input Validation.

**Priority and Baseline Allocation:**
P3
Low
Moderate
High

---

### SI-11 ERROR HANDLING

**Control:**
The information system:
a.  Identifies potentially security-relevant error conditions;
b.  Generates error messages that provide information necessary for corrective actions without revealing information that could be exploited by adverse actors; and
c.  Reveals error messages only to [Assignment: organization-defined personnel or roles].

**Supplemental Guidance:**
Error messages should be carefully controlled to avoid providing an adversary with information that could facilitate an attack.

**Related Controls:**
AU-3, SI-4, SI-7, SI-13.

**References:**
NIST Special Publication 800-53, Revision 4, Error Handling.

**Priority and Baseline Allocation:**
P4
Low
Moderate
High

---

### SI-12 INFORMATION HANDLING AND RETENTION

**Control:**
The organization handles and retains information within the information system and its output consistent with applicable laws, Executive Orders, directives, policies, regulations, standards, and guidance.

**Supplemental Guidance:**
Information handling and retention includes storage, retrieval, transmission, and disposal of information.

**Related Controls:**
MP-2, MP-4, MP-6, MP-7, PL-4, SI-4, SI-7.

**References:**
NIST Special Publication 800-53, Revision 4, Information Handling and Retention.

**Priority and Baseline Allocation:**
P3
Low
Moderate
High

---

### SI-13 PREDICTABLE FAILURE PREVENTION

**Control:**
The information system:
a.  Protects against or limits the effects of the following types of failures:
1.  Disk drive failure;
2.  Telecommunication failure;
3.  Power outage; and
4.  Other predictable failures;
b.  [Assignment: organization-defined actions] if the information system is unable to protect against or limit the effects of predictable failures; and
c.  Maintains [Assignment: organization-defined operational capability] following failures.

**Supplemental Guidance:**
Predictable failures include those that are anticipated based on system design or operational conditions. The organization determines the types of failures and the actions to be taken when such failures occur.

**Related Controls:**
CP-2, CP-7, CP-8, CP-9, CP-10, SI-11.

**References:**
NIST Special Publication 800-53, Revision 4, Predictable Failure Prevention.

**Priority and Baseline Allocation:**
P4
Low
Moderate
High

---

### SI-14 NON-PERSISTENCE

**Control:**
The information system retains no state information and no identifiable user characteristics after a user session is terminated.

**Supplemental Guidance:**
Non-persistent systems do not retain session data after the session ends.

**Related Controls:**
AC-12, SC-10, SC-24.

**References:**
NIST Special Publication 800-53, Revision 4, Non-Persistence.

**Priority and Baseline Allocation:**
P4
Low
Moderate
High

---

### SI-15 INFORMATION OUTPUT FILTERING

**Control:**
The information system filters information output בהתאם to organizationally defined rules and regulations.

**Supplemental Guidance:**
Output filtering includes the prevention of unauthorized disclosure of information through printed output, electronic messages, or other forms of output.

**Related Controls:**
AC-3, AC-4, AU-13, PL-4, SC-7, SI-4.

**References:**
NIST Special Publication 800-53, Revision 4, Information Output Filtering.

**Priority and Baseline Allocation:**
P4
Low
Moderate
High

---

### SI-16 MEMORY PROTECTION

**Control:**
The information system implements organization-defined security safeguards to protect the integrity and confidentiality of information residing in system memory.

**Supplemental Guidance:**
Memory protection mechanisms prevent unauthorized access to and modification of information in memory.

**Related Controls:**
AC-3, AC-6, SC-7, SC-39, SI-7.

**References:**
NIST Special Publication 800-53, Revision 4, Memory Protection.

**Priority and Baseline Allocation:**
P4
Low
Moderate
High

---

### SI-17 FAIL-SAFE PROCEDURES

**Control:**
The information system:
a.  Fails in a known state; and
b.  Provides [Assignment: organization-defined procedures] for recovering from failures while maintaining the security posture of the system.

**Supplemental Guidance:**
Fail-safe procedures are used to ensure that, in the event of a failure, the system enters a secure state or otherwise limits the potential impact of the failure.

**Related Controls:**
CP-2, CP-7, CP-10, SI-11, SI-13.

**References:**
NIST Special Publication 800-53, Revision 4, Fail-Safe Procedures.

**Priority and Baseline Allocation:**
P4
Low
Moderate
High
