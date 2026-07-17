# JSIG Chapter 3 Audit and Accountability (AU) Family

Source URL: https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Extraction note: Verbatim/near-verbatim extraction via document-aware fetch, retrieved 2026-07-17. Tool-returned content follows; no content has been inferred beyond the returned extraction. A later targeted prompt for AU tailoring/baseline lines returned only a failure notice, so this file preserves the successful family-body extraction returned earlier.

---

AU-1  
AUDIT AND ACCOUNTABILITY POLICY AND PROCEDURES

Control:  The organization:
a.  Develops, documents, and disseminates to [Assignment: organization-defined personnel or roles]:
1.  An audit and accountability policy that addresses purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance; and
2.  Procedures to facilitate the implementation of the audit and accountability policy and associated audit and accountability controls;
b.  Reviews and updates the current:
1.  Audit and accountability policy [Assignment: organization-defined frequency]; and
2.  Audit and accountability procedures [Assignment: organization-defined frequency].

Supplemental Guidance:  Auditing and accountability involve the creation, protection, and retention of information associated with actions that take place on an information system.  Audit and accountability policy and procedures address requirements for auditing mechanisms, audit content, coverage, retention, review, and reporting.  Organizations can choose to define audit and accountability policy and procedures as separate documents or as a single document.  Audit and accountability policy can include user responsibilities and expected behavior for a system.  Audit and accountability procedures can focus on the implementation details associated with each control.  Organizations develop and document audit and accountability procedures in accordance with federal laws, Executive Orders, directives, policies, regulations, standards, and guidelines.  The audit and accountability policy and procedures are consistent with applicable laws, Executive Orders, directives, regulations, standards, and guidance.

Related Controls:  AU-2, AU-3, AU-4, AU-5, AU-6, AU-7, AU-8, AU-9, AU-10, AU-11, AU-12, AU-13, AU-14, AU-15, AU-16.

AU-2  
AUDIT EVENTS

Control:  The organization:
a.  Determines that the information system is capable of auditing [Assignment: organization-defined auditable events];
b.  Coordinates the security audit function with other organizational entities requiring audit-related information to enhance mutual support and to help guide the selection of auditable events; and
c.  Provides rationale for why the auditable events listed in AU-2(1) are or are not subject to review and analysis.

Supplemental Guidance:  Auditable events are the activities that can be tracked and logged by the information system.  To determine the auditable events, the organization considers specific auditable events that are of significance to the organization and produce the best auditability in accordance with the organization's mission/business, security, privacy, and risk management strategies.  In determining the auditable events, the organization considers, at a minimum, the events defined in AU-2(1) through AU-2(3).  The organization also considers events specific to the system's mission and business functions.  Auditable events can be grouped to avoid redundancy or unnecessary detail.  The organization can specify the frequency of the review and analysis of auditable events.  Organizations can be more prescriptive regarding auditable events in mission critical systems, in systems containing personally identifiable information, or in systems where it is important to detect and analyze incidents and attacks.  The list of auditable events is used by the organization to determine the information system audit record content.  The list of auditable events can be reviewed and updated periodically as part of continuous monitoring.  Audit records are periodically reviewed and analyzed to detect indications of inappropriate or unusual activity and to help ensure the ongoing effectiveness of organizational policies, procedures, and controls.

Related Controls:  AC-2, AC-3, AC-6, AC-17, AU-3, AU-12, CM-3, IA-2, IA-3, IA-5, IA-8, MA-4, PE-3, PL-2, SC-7, SI-4.

Control Enhancements:
(1)  ORGANIZATIONALLY DEFINED AUDIT EVENTS | LIST OF AUDITABLE EVENTS
The organization defines auditable events that need to be audited for each information system.  At a minimum, the organization audits the following events:
(a)  Successful and unsuccessful attempts to:
1.  Access system security functions;
2.  Establish, activate, modify, disable, or delete accounts;
3.  Change mandatory and discretionary access controls;
4.  Change information flow control rules;
5.  Change configuration settings;
6.  Change security posture;
7.  Change security roles;
8.  Execute privileged functions;
9.  Access or change system time;
10.  Start and stop system services;
11.  Establish, activate, modify, disable, or delete sessions;
12.  Import or export information;
13.  Add or remove components or devices;
14.  Create, delete, or modify objects;
15.  Modify labels; and
16.  Access security-relevant information.
(b)  Privileged functions.
(c)  As per the contingency plan, activation of contingency operations.
(d)  As per the incident response plan, activation of incident response procedures.
(e)  [Selection: successful and unsuccessful] access to [Assignment: organization-defined data repositories].
(f)  [Selection: successful and unsuccessful] access to [Assignment: organization-defined system resources].
(g)  [Selection: successful and unsuccessful] access to [Assignment: organization-defined commands].
(h)  [Selection: successful and unsuccessful] access to [Assignment: organization-defined information].
(i)  [Selection: successful and unsuccessful] use of [Assignment: organization-defined external information system services].
(j)  [Selection: successful and unsuccessful] [Assignment: organization-defined organization-defined events].

AU-3  
CONTENT OF AUDIT RECORDS

Control:  The information system generates audit records containing information that establishes what type of event occurred, when the event occurred, where the event occurred, the source of the event, the outcome of the event, and the identity of any individuals or subjects associated with the event.

Supplemental Guidance:  Audit record content that may be necessary to support traceability, accountability, and forensic analysis includes event source, type, location, subject identity, success or failure indication, date and time, process ID, session ID, port number, file name, and the nature of the event.  Organizations define the content of audit records based on the organization-defined auditable events and the objectives for auditing.

Related Controls:  AU-2, AU-4, AU-5, AU-6, AU-8, AU-9, AU-12, SI-4.

Control Enhancements:
(1)  ADDITIONAL AUDIT INFORMATION
The information system generates audit records containing [Assignment: organization-defined additional, more detailed information].

(2)  CENTRALIZED MANAGEMENT OF AUDIT RECORD CONTENT
The organization centrally manages the content of audit records generated by its information systems.

AU-4  
AUDIT STORAGE CAPACITY

Control:  The organization allocates audit record storage capacity to retain audit records for [Assignment: organization-defined time period] sufficient to perform trending, analysis, investigation, and reporting of audit records from all information systems requiring audit records.

Supplemental Guidance:  Organizations consider audit storage capacity and bandwidth limitations in their allocation of audit storage capacity.  Audit storage capacity reflects both the capacity of the audit storage mechanism and the audit storage requirements of the organization.  Organizations consider additional storage capacity as the volume of audit records generated by the information system increases.  When allocable storage capacity is not sufficient to store all audit records, the organization may consider implementing a sampling mechanism to selectively record events.  Audit record storage capacity may be provided by a centralized audit record storage capability.

Related Controls:  AU-2, AU-3, AU-5, AU-6, AU-11, SI-4.

AU-5  
RESPONSE TO AUDIT PROCESSING FAILURES

Control:  The information system:
a.  Alerts [Assignment: organization-defined personnel or roles] in the event of an audit processing failure; and
b.  Takes [Assignment: organization-defined actions] in the event of an audit processing failure.

Supplemental Guidance:  Audit processing failures include software/hardware errors, failures in the audit capturing mechanisms, and audit storage capacity being reached or exceeded.  Responses to audit processing failures are consistent with the risks associated with the loss of audit capability.  For systems where audit capability is paramount, the organization can consider actions that will not result in the loss of traceability for auditable events.  Audit processing failures may result in a partial or total loss of audit capability.  The organization may choose to alert the appropriate personnel, generate a failure notification, shut down the information system, or other organization-defined actions.  Organizations may need to provide additional compensating controls when audit processing failures occur.

Related Controls:  AU-2, AU-3, AU-4, AU-6, SI-4.

AU-6  
AUDIT REVIEW, ANALYSIS, AND REPORTING

Control:  The organization:
a.  Reviews and analyzes information system audit records [Assignment: organization-defined frequency] for indications of [Assignment: organization-defined inappropriate or unusual activities]; and
b.  Reports findings to [Assignment: organization-defined personnel or roles].

Supplemental Guidance:  Audit review, analysis, and reporting covers the exchange of information between audit review personnel and appropriate organizational officials to identify suspicious activity or support incident investigations.  Audit review, analysis, and reporting is an integral part of continuous monitoring.  The frequency and/or circumstances for audit review, analysis, and reporting are organization-defined.  The scope and depth of audit review and analysis is organization-defined and can be adjusted as needed to account for other organizational priorities.  The organization considers whether review and analysis is performed automatically, manually, or by a combination of both.  The organization establishes the frequency of review and analysis of audit records based on the criticality of the system, the threat environment, the significance of the auditable events, the number of records generated, and the resources needed to analyze the records.  Organizations may define procedures for responding to identified suspicious activity, including incident reporting requirements.

Related Controls:  AU-2, AU-3, AU-5, AU-12, IR-5, IR-6, SI-4.

Control Enhancements:
(1)  AUTOMATED PROCESSING OF AUDIT REVIEW
The information system employs automated mechanisms to integrate audit review, analysis, and reporting processes to support near-real-time response to audit findings.

(2)  AUTOMATED DISSEMINATION OF AUDIT REVIEW AND ANALYSIS
The organization employs automated mechanisms to assist in the dissemination of audit review, analysis, and reporting information to [Assignment: organization-defined personnel or roles].

(3)  CORRELATION WITH PHYSICAL MONITORING
The organization correlates information from audit records with information obtained from monitoring physical access to further support audit review, analysis, and reporting.

(4)  CROSS-ORGANIZATIONAL CORRELATION
The organization correlates audit information from information systems with audit information from other organizations when deemed appropriate.

AU-7  
AUDIT REDUCTION AND REPORT GENERATION

Control:  The information system provides an audit reduction and report generation capability that supports on-demand audit review, analysis, and reporting requirements and after-the-fact investigations of security incidents.  The audit reduction capability:
a.  Supports on-demand audit review, analysis, and reporting requirements;
b.  Can process audit records in a format suitable for audit review and analysis; and
c.  Can produce output that is understandable to organizational officials.

Supplemental Guidance:  Audit reduction is the process of selecting, aggregating, and presenting audit records to facilitate review and analysis.  Report generation includes the ability to specify search criteria and render reports.  The organization may employ automated mechanisms for audit reduction and report generation.  Audit reduction and report generation capabilities can be implemented within the information system or as separate, external tools.

Related Controls:  AU-2, AU-3, AU-6, AU-8, AU-11.

AU-8  
TIME STAMPS

Control:  The information system:
a.  Uses internal system clocks to generate time stamps for audit records; and
b.  Records time stamps for audit records that are associated with [Assignment: organization-defined criticality].

Supplemental Guidance:  Time stamps generated by information systems reflect the local time, time zone, and UTC as appropriate.  Time synchronization can be critical to audit record correctness, especially in distributed systems.  Organizations determine the degree to which time stamps are synchronized and standardized.

Related Controls:  AU-3, AU-12, SC-45.

AU-9  
PROTECTION OF AUDIT INFORMATION

Control:  The information system protects audit information and audit tools from unauthorized access, modification, and deletion.

Supplemental Guidance:  Audit information includes all audit records, audit report files, and audit reduction tools.  The protection of audit information is critical to ensure the integrity and confidentiality of the audit process.  Protection mechanisms include access control, cryptography, and physical protection.  Audit tools are protected from unauthorized modification to prevent the corruption of audit data.

Related Controls:  AC-3, AC-6, MP-2, MP-4, PE-3, SC-12, SC-28.

AU-10  
NON-REPUDIATION

Control:  The information system protects against an individual falsely denying having performed [Assignment: organization-defined actions] by providing the capability to determine, through use of a [Selection: digital signature, physical signature, other organization-defined means], the identity of the individual.

Supplemental Guidance:  Non-repudiation protects against false denial of having performed an action.  The organization defines the actions for which non-repudiation is required.  Non-repudiation services are implemented using cryptographic methods or other means that provide the required assurance.

Related Controls:  IA-2, IA-5, IA-8, SC-12, SC-13, SC-23.

AU-11  
AUDIT RECORD RETENTION

Control:  The organization retains audit records for [Assignment: organization-defined time period] to provide support for after-the-fact investigations of incidents and to meet regulatory and organizational information retention requirements.

Supplemental Guidance:  Audit records are retained based on organizational policy and legal, statutory, regulatory, and operational requirements.  The retention period for audit records may be extended for specific investigations or litigation holds.

Related Controls:  AU-4, AU-7, AU-9, MP-4.

AU-12  
AUDIT GENERATION

Control:  The information system:
a.  Provides audit record generation capability for the auditable events defined in AU-2 a. with the content defined in AU-3; and
b.  Allows [Assignment: organization-defined personnel or roles] to select the auditable events to be audited.

Supplemental Guidance:  Audit generation enables the creation of audit records for auditable events.  The organization considers audit record generation requirements and the allocation of audit record generation responsibilities.

Related Controls:  AU-2, AU-3, AU-6, SI-4.

AU-13  
MONITORING FOR INFORMATION DISCLOSURE

Control:  The organization monitors for [Assignment: organization-defined information disclosure indicators] in:
a.  Organizational systems; and
b.  [Assignment: organization-defined external systems].

Supplemental Guidance:  Monitoring for information disclosure includes monitoring for unauthorized, accidental, or unintended disclosure of information.  The organization determines the indicators of information disclosure to be monitored based on risk and mission/business needs.

Related Controls:  AU-2, SI-4.

AU-14  
SESSION AUDIT

Control:  The information system provides the capability for [Selection: organization-defined user, group, role] to include [Assignment: organization-defined audit content] in audit records of user sessions.

Supplemental Guidance:  Session audit enables organizations to capture audit information at the user-session level.  Organizations determine the type of audit content to include for sessions based on mission and security requirements.

Related Controls:  AU-3, AU-6, AU-12.

AU-15  
ALTERNATE AUDIT CAPABILITY

Control:  The information system provides an alternate audit capability in the event of a failure in primary audit capability.

Supplemental Guidance:  Alternate audit capability may be provided by a redundant information system, a different component, or an independent audit function.  The alternate capability is implemented to ensure audit records continue to be generated, protected, and retained when the primary capability fails.

Related Controls:  AU-4, AU-5, AU-6.

AU-16  
CROSS-ORGANIZATIONAL AUDITING

Control:  The organization employs cross-organizational auditing capabilities for audit records generated by information systems when the information system is shared with or accessible by, another organization.

Supplemental Guidance:  Cross-organizational auditing supports the sharing of audit information between organizations to enhance accountability and security.  Organizations determine the terms and conditions for cross-organizational auditing.

Related Controls:  AU-6, AU-13.
