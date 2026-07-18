# JSIG Chapter 3 Audit and Accountability (AU) Family

Source URL: https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Archived source (used for extraction, direct URL returns HTTP 403): http://web.archive.org/web/20260405054539/https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Extraction note: Verbatim extraction via `pdftotext -layout` against the complete 378-page JSIG PDF (retrieved 2026-07-17 from the Wayback Machine snapshot below, since the direct DCSA URL returns HTTP 403). This supersedes any prior lower-fidelity extraction of this section. Running page headers/footers inserted by the PDF layout have been stripped; no wording has been added, summarized, or altered.

---

FAMILY: AUDIT AND ACCOUNTABILITY

AU-1      AUDIT AND ACCOUNTABILITY POLICY AND PROCEDURES

          Control: The organization:

          a.      Develops, documents, and disseminates to [Assignment: organization-defined personnel or roles]:
                  1.   An audit and accountability policy that addresses purpose, scope, roles, responsibilities,
                       management commitment, coordination among organizational entities, and compliance; and
                  2.   Procedures to facilitate the implementation of the audit and accountability policy and associated
                       audit and accountability controls; and
          b.      Reviews and updates the current:
                  1.   Audit and accountability policy at least annually; and
                  2.   Audit and accountability procedures at least annually.
          Supplemental Guidance: This control addresses the establishment of policy and procedures for the effective
          implementation of selected security controls and control enhancements in the AU family. Policy and
          procedures reflect applicable federal laws, Executive Orders, directives, regulations, policies, standards,
          and guidance. Security program policies and procedures at the organization level may make the need for
          system-specific policies and procedures unnecessary. The policy can be included as part of the general
          information security policy for organizations or conversely, can be represented by multiple policies
          reflecting the complex nature of certain organizations. The procedures can be established for the security
          program in general and for particular information systems, if needed. The organizational risk management
          strategy is a key factor in establishing policy and procedures. Related control: PM-9.
               DoD SAP-specific policy and procedures related to audit and accountability are defined in
               the remainder of this section.

               An audit trail is a record of events. Audit trails may be limited to specific events, or they
               may encompass all activities on a system. A computer system might have several audit
               trails, each focused on a particular type of activity, such as detecting security violations,
               performance problems, and design and programming flaws in applications. Periodic reviews
               of audit logs may be useful for:

                   •    Detecting unauthorized access to information
                   •    Establishing a culture of responsibility and accountability
                   •    Reducing the risk associated with inappropriate accesses (behavior may be altered
                        when individuals know they are being monitored)
                   •    Providing forensic evidence during investigations of suspected and known security
                        incidents and breaches to privacy, especially if sanctions against a workforce
                        member, business associate, or other contracted agent will be applied
                   •    Tracking disclosures of sensitive and/or classified information
                   •    Responding to concerns regarding unauthorized access
                   •    Evaluating the overall effectiveness of policy and user education regarding
                        appropriate access and use of information (comparing actual activity to expected
                        activity and discovering where additional training or education may be necessary to
                        reduce errors)
                   •    Detecting new threats and intrusion attempts
                   •    Identifying potential problems
                   •    Addressing compliance with regulatory requirements

               An audit trail enables a security practitioner to trace the history of activities on an

               information system. The audit trail provides information about additions, deletions, or
               modifications to data within a system. Audit trails enable the enforcement of individual
               accountability by allowing a reconstruction of events. Like monitoring, one purpose of an
               audit trail is to assist in problem identification and resolution. Any unusual activity or
               variation from the established procedures should be identified and investigated. Audit can
               assist in:
                   •    Accountability – Log data can identify what accounts are associated with certain
                        events. This information then can be used to highlight where training and/or
                        disciplinary actions are needed. Accountability is the system’s capability to
                        determine the actions and behaviors of a single individual within a system and to
                        identify that particular individual. Audit trails and logs support accountability.
                   •    Reconstruction – Log data can be reviewed chronologically to determine what was
                        happening both before and during an event. For this to happen, the accuracy and
                        coordination of system clocks are critical. To accurately trace activity, clocks need
                        to be regularly synchronized to a central source to ensure that the date/time stamps
                        are in synch.
                   •    Intrusion Detection – Unusual or unauthorized events can be detected through the
                        review of log data, assuming that the correct data is being logged and reviewed. The
                        definition of what constitutes unusual activity varies, but can include failed login
                        attempts, login attempts outside of designated schedules, locked accounts, port
                        sweeps, network activity levels, memory utilization, key file/data access, etc.
                   •    Problem Detection – In the same way that log data can be used to identify security
                        events, it can be used to identify problems that need to be addressed. For example,
                        investigating causal factors of failed jobs, resource utilization, trending and so on.
               The audit capability should be automated, and provide adequate on-line or off-line storage of
               audit information separate from data files. If automated audit collection is not supported, use
               of manual audits must be documented in the SSP. The AO’s approval to operate must
               specify approval to implement manual audits.
          Control Enhancements: None.

          References: NIST Special Publications 800-12, 800-100.

AU-2      AUDIT EVENTS

          Control: The organization:

          a.     Determines that the information system is capable of auditing the following events:
                 1. Authentication events:
                       (1) Logons (Success/Failure)
                       (2) Logoffs (Success)
                 2. Security Relevant File and Objects events:
                       (1) Create (Success/Failure)
                       (2) Access (Success/Failure)
                       (3) Delete (Success/Failure)
                       (4) Modify (Success/Failure)
                       (5) Permission Modification (Success/Failure)
                       (6) Ownership Modification (Success/Failure)

                 3. Export/Writes/downloads to devices/digital media (e.g., CD/DVD, USB, SD) (Success/Failure)
                 4. Import/Uploads from devices/digital media (e.g., CD/DVD, USB, SD) (Success/Failure)
                 5. User and Group Management events:
                      (1) User add, delete, modify, disable, lock (Success/Failure)
                      (2) Group/Role add, delete, modify (Success/Failure)
                 6. Use of Privileged/Special Rights events:
                      (1) Security or audit policy changes (Success/Failure)
                      (2) Configuration changes (Success/Failure)
                 7. Admin or root-level access (Success/Failure)
                 8. Privilege/Role escalation (Success/Failure)
                 9. Audit and security relevant log data accesses (Success/Failure)
                 10. System reboot, restart and shutdown (Success/Failure)
                 11. Print to a device (Success/Failure)
                 12. Print to a file (e.g., pdf format) (Success/Failure)
                 13. Application (e.g., Adobe, Firefox, MS Office Suite) initialization (Success/Failure);
          b.     Coordinates the security audit function with other organizational entities requiring audit-related
                 information to enhance mutual support and to help guide the selection of auditable events;
          c.     Provides a rationale for why the auditable events are deemed to be adequate to support after-the-fact
                 investigations of security incidents; and
          d.     Determines that the following events are to be audited within the information system: same as ‘a’
                 above, during all periods of system operation.
          Supplemental Guidance: An event is any observable occurrence in an organizational information system.
          Organizations identify audit events as those events which are significant and relevant to the security of
          information systems and the environments in which those systems operate in order to meet specific and
          ongoing audit needs. Audit events can include, for example, password changes, failed logons, or failed
          accesses related to information systems, administrative privilege usage, PIV credential usage, or third-party
          credential usage. In determining the set of auditable events, organizations consider the auditing appropriate
          for each of the security controls to be implemented. To balance auditing requirements with other
          information system needs, this control also requires identifying that subset of auditable events that are
          audited at a given point in time. For example, organizations may determine that information systems must
          have the capability to log every file access both successful and unsuccessful, but not activate that capability
          except for specific circumstances due to the potential burden on system performance. Auditing
          requirements, including the need for auditable events, may be referenced in other security controls and
          control enhancements. Organizations also include auditable events that are required by applicable federal
          laws, Executive Orders, directives, policies, regulations, and standards. Audit records can be generated at
          various levels of abstraction, including at the packet level as information traverses the network. Selecting
          the appropriate level of abstraction is a critical aspect of an audit capability and can facilitate the
          identification of root causes to problems. Organizations consider in the definition of auditable events, the
          auditing necessary to cover related events such as the steps in distributed, transaction-based processes (e.g.,
          processes that are distributed across multiple organizations) and actions that occur in service-oriented
          architectures. Related controls: AC-6, AC-17, AU-3, AU-12, MA-4, MP-2, MP-4, SI-4.
               Determine, based on current threat information and on-going assessment of risk, which
               events are to be audited within the information system.
               Ensure system console activities are audited as well as access to pertinent objects other than

               security-relevant, e.g., mission, program.
               Be aware that [AU-2.a] bullet 13, Application, may generate more audits than deemed
               necessary. Tailoring audit collection requirements related to specific applications is
               recommended.
          Control Enhancements:
          (1)    AUDIT EVENTS | COMPILATION OF AUDIT RECORDS FROM MULTIPLE SOURCES
                 [Withdrawn: Incorporated into AU-12].
          (2)    AUDIT EVENTS | SELECTION OF AUDIT EVENTS BY COMPONENT
                 [Withdrawn: Incorporated into AU-12].
          (3)    AUDIT EVENTS | REVIEWS AND UPDATES
                 The organization reviews and updates the audited events at least annually.
                 Supplemental Guidance: Over time, the events that organizations believe should be audited may change.
                 Reviewing and updating the set of audited events periodically is necessary to ensure that the current set
                 is still necessary and sufficient.
                   The review shall include coordination with other organizational entities requiring audit-
                   related information (e.g., Incident Response, Counterintelligence) to enhance mutual
                   support and to help guide the selection of auditable events.
          (4)    AUDIT EVENTS | PRIVILEGED FUNCTIONS
                 [Withdrawn: Incorporated into AC-6 (9)].

          References: NIST Special Publication 800-92; Web: http://idmanagement.gov.

AU-3      CONTENT OF AUDIT RECORDS

          Control: The information system generates audit records containing information that establishes what type
          of event occurred, when the event occurred, where the event occurred, the source of the event, the outcome
          of the event, and the identity of any individuals or subjects associated with the event.
          Supplemental Guidance: Audit record content that may be necessary to satisfy the requirement of this control,
          includes, for example, time stamps, source and destination addresses, user/process identifiers, event
          descriptions, success/fail indications, filenames involved, and access control or flow control rules invoked.
          Event outcomes can include indicators of event success or failure and event-specific results (e.g., the
          security state of the information system after the event occurred). Related controls: AU-2, AU-8, AU-12,
          SI-11.
               Specifically, audit records shall contain, at a minimum, the following content:
                   •   USERID
                   •   Type of event/action
                   •   Success or failure of event/action
                   •   Date
                   •   Time
                   •   Terminal or workstation ID
                   •   Entity that initiated event/action
                   •   Entity that completed event/action
                   • Remote Access
               If manual audit collection is approved by the AO, the audit records shall contain, at a
               minimum, the following content:

                   •   Date
                   •   Identification of the user
                   •   Time the user logs on and off the system
                   •   Function(s) performed
                   • Terminal or Workstation ID
               Manual audit logs may be used to record the transmission of any data over a fax connected to
               a secure voice line (e.g., Secure Terminal Equipment (STE)). Reference DoDM 5205.07-V1,
               Enclosure 5, para 2.b. These logs will be maintained for one year and must include the
               following information:
                   • Sender’s name, organization and telephone number
                   •   Date and time of fax transmission
                   •   Classification level of the information
                   •   Recipient’s name, organization and telephone number
          Control Enhancements:
          (1)    CONTENT OF AUDIT RECORDS | ADDITIONAL AUDIT INFORMATION
                 The information system generates audit records containing the following additional information: [Assignment:
                 organization-defined additional, more detailed information].
                 Supplemental Guidance: Detailed information that organizations may consider in audit records includes,
                 for example, full text recording of privileged commands or the individual identities of group account
                 users. Organizations consider limiting the additional audit information to only that information
                 explicitly needed for specific audit requirements. This facilitates the use of audit trails and audit logs
                 by not including information that could potentially be misleading or could make it more difficult to
                 locate information of interest.
          (2)    CONTENT OF AUDIT RECORDS | CENTRALIZED MANAGEMENT OF PLANNED AUDIT RECORD CONTENT
                 The information system provides centralized management and configuration of the content to be captured in audit
                 records generated by [Assignment: organization-defined information system components].
                 Supplemental Guidance: This control enhancement requires that the content to be captured in audit
                 records be configured from a central location (necessitating automation). Organizations coordinate the
                 selection of required audit content to support the centralized management and configuration capability
                 provided by the information system. Related controls: AU-6, AU-7.
          References: None.

AU-4      AUDIT STORAGE CAPACITY

          Control:The organization allocates audit record storage capacity in accordance with community best
          practice and configures auditing to reduce the likelihood of such capacity being exceeded.
          Supplemental Guidance: Organizations consider the types of auditing to be performed and the audit
          processing requirements when allocating audit storage capacity. Allocating sufficient audit storage capacity
          reduces the likelihood of such capacity being exceeded and resulting in the potential loss or reduction of
          auditing capability. Related controls: AU-2, AU-5, AU-6, AU-7, AU-11, SI-4.
               Proper audit storage capacity is crucial to ensuring the ongoing logging of critical events.
               The information system must be configured to allocate sufficient log record storage capacity
               so that it will not become exhausted. See also AU-5(1).
          Control Enhancements:
          (1)    AUDIT STORAGE CAPACITY | TRANSFER TO ALTERNATE STORAGE
                 The information system off-loads audit records [Assignment: organization-defined frequency] onto a different system
                 or media than the system being audited.

                 Supplemental Guidance: Off-loading is a process designed to preserve the confidentiality and integrity of
                 audit records by moving the records from the primary information system to a secondary or alternate
                 system. It is a common process in information systems with limited audit storage capacity; the audit
                 storage is used only in a transitory fashion until the system can communicate with the secondary or
                 alternate system designated for storing the audit records, at which point the information is transferred.
                   Organizations should assign a frequency or threshold capacity when audit records are
                   off-loaded. Related control: AU-9(2)
          References: None.

AU-5      RESPONSE TO AUDIT PROCESSING FAILURES

          Control: The information system:

          a.     Alerts [[Assignment: organization-defined personnel or roles] ] in the event of an audit processing
                 failure; and
          b.     Takes the following additional actions: [Assignment: organization-defined actions to be taken (e.g.,
                 shut down information system, overwrite oldest audit records, stop generating audit records)].
          Supplemental Guidance: Audit processing failures include, for example, software/hardware errors, failures in
          the audit capturing mechanisms, and audit storage capacity being reached or exceeded. Organizations may
          choose to define additional actions for different audit processing failures (e.g., by type, by location, by
          severity, or a combination of such factors). This control applies to each audit data storage repository (i.e.,
          distinct information system component where audit records are stored), the total audit storage capacity of
          organizations (i.e., all audit data storage repositories combined), or both. Related controls: AU-4, SI-12.
               At a minimum, record any audit processing failure in the audit log.
               System should alert a system administrator and/or ISSM/ISSO.
               For IS that are not capable of providing a warning, procedures for a manual method must be
               documented.
               Tactical/deployable information systems may be developed without all the features and
               security controls of standard information systems. Audit requirements for these systems
               should be reviewed for mission impact. For example, failure of the audit process should not
               interfere with continued normal operation of a mission critical system.
          Control Enhancements:
          (1)    RESPONSE TO AUDIT PROCESSING FAILURES | AUDIT STORAGE CAPACITY
                 The information system provides a warning to [Assignment: organization-defined personnel, roles, and/or locations]
                 within [Assignment: organization-defined time period] when allocated audit record storage volume reaches
                 maximum of 75 percent maximum audit record storage capacity of repository maximum audit record storage
                 capacity.
                 Supplemental Guidance: Organizations may have multiple audit data storage repositories distributed
                 across multiple information system components, with each repository having different storage volume
                 capacities.
          (2)    RESPONSE TO AUDIT PROCESSING FAILURES | REAL-TIME ALERTS
                 The information system provides an alert in [Assignment: organization-defined real-time period] to [Assignment:
                 organization-defined personnel, roles, and/or locations] when the following audit failure events occur: minimally but
                 not limited to: auditing software/hardware errors, failures in the audit capturing mechanisms, and audit
                 storage capacity being reached or exceeded.

                 Supplemental Guidance: Alerts provide organizations with urgent messages. Real-time alerts provide
                 these messages at information technology speed (i.e., the time from event detection to alert occurs in
                 seconds or less).
          (3)    RESPONSE TO AUDIT PROCESSING FAILURES | CONFIGURABLE TRAFFIC VOLUME THRESHOLDS

                 The information system enforces configurable network communications traffic volume thresholds reflecting limits on
                 auditing capacity and [Selection: rejects; delays] network traffic above those thresholds.
                 Supplemental Guidance: Organizations have the capability to reject or delay the processing of network
                 communications traffic if auditing such traffic is determined to exceed the storage capacity of the
                 information system audit function. The rejection or delay response is triggered by the established
                 organizational traffic volume thresholds which can be adjusted based on changes to audit storage
                 capacity.
          (4)    RESPONSE TO AUDIT PROCESSING FAILURES | SHUTDOWN ON FAILURE
                 The information system invokes a [Selection: full system shutdown; partial system shutdown; degraded operational
                 mode with limited mission/business functionality available] in the event of [Assignment: organization-defined audit
                 failures], unless an alternate audit capability exists.
                 Supplemental Guidance: Organizations determine the types of audit failures that can trigger automatic
                 information system shutdowns or degraded operations. Because of the importance of ensuring
                 mission/business continuity, organizations may determine that the nature of the audit failure is not so
                 severe that it warrants a complete shutdown of the information system supporting the core
                 organizational missions/business operations. In those instances, partial information system shutdowns
                 or operating in a degraded mode with reduced capability may be viable alternatives. Related control:
                 AU-15.
          References: None.

AU-6      AUDIT REVIEW, ANALYSIS, AND REPORTING

          Control: The organization:

          a.     Reviews and analyzes information system audit records at least weekly for indications of any
                 inappropriate or unusual activity; and
          b.     Reports findings to [Assignment: organization-defined personnel or roles].
          Supplemental Guidance: Audit review, analysis, and reporting covers information security-related auditing
          performed by organizations including, for example, auditing that results from monitoring of account usage,
          remote access, wireless connectivity, mobile device connection, configuration settings, system component
          inventory, use of maintenance tools and nonlocal maintenance, physical access, temperature and humidity,
          equipment delivery and removal, communications at the information system boundaries, use of mobile
          code, and use of VoIP. Findings can be reported to organizational entities that include, for example,
          incident response team, help desk, information security group/department. If organizations are prohibited
          from reviewing and analyzing audit information or unable to conduct such activities (e.g., in certain
          national security applications or systems), the review/analysis may be carried out by other organizations
          granted such authority. Related controls: AC-2, AC-3, AC-6, AC-17, AT-3, AU-7, AU-16, CA-7, CM-5,
          CM-10, CM-11, IA-3, IA-5, IR-5, IR-6, MA-4, MP-4, PE-3, PE-6, PE-14, PE-16, RA-5, SC-7, SC-18, SC-
          19, SI-3, SI-4, SI-7.
               The purpose of this review is to verify all pertinent activity is properly recorded and
               appropriate action has been taken to correct and report any identified problems. These
               reviews shall be documented in either an electronic or manual log. Organizationally defined
               personnel or roles may include ISO, ISSM and/or PSO.
          Control Enhancements:
          (1)    AUDIT REVIEW , ANALYSIS, AND REPORTING | PROCESS INTEGRATION
                 The organization employs automated mechanisms to integrate audit review, analysis, and reporting processes to
                 support organizational processes for investigation and response to suspicious activities.
                 Supplemental Guidance: Organizational processes benefiting from integrated audit review, analysis, and
                 reporting include, for example, incident response, continuous monitoring, contingency planning, and
                 Inspector General audits. Related controls: AU-12, PM-7.
          (2)    AUDIT REVIEW , ANALYSIS, AND REPORTING | AUTOMATED SECURITY ALERTS
                 [Withdrawn: Incorporated into SI-4].

          (3)   AUDIT REVIEW , ANALYSIS, AND REPORTING | CORRELATE AUDIT REPOSITORIES
                The organization analyzes and correlates audit records across different repositories to gain organization-wide
                situational awareness.
                Supplemental Guidance: Organization-wide situational awareness includes awareness across all three
                tiers of risk management (i.e., organizational, mission/business process, and information system) and
                supports cross-organization awareness. Related controls: AU-12, IR-4.
          (4)   AUDIT REVIEW , ANALYSIS, AND REPORTING | CENTRAL REVIEW AND ANALYSIS
                The information system provides the capability to centrally review and analyze audit records from multiple
                components within the system.
                Supplemental Guidance: Automated mechanisms for centralized reviews and analyses include, for
                example, Security Information Management products. Related controls: AU-2, AU-12.
          (5)   AUDIT REVIEW , ANALYSIS, AND REPORTING | INTEGRATION / SCANNING AND MONITORING CAPABILITIES
                The organization integrates analysis of audit records with analysis of [Selection (one or more): vulnerability scanning
                information; performance data; information system monitoring information; [Assignment: organization-defined
                data/information collected from other sources]] to further enhance the ability to identify inappropriate or unusual
                activity.
                Supplemental Guidance: This control enhancement does not require vulnerability scanning, the
                generation of performance data, or information system monitoring. Rather, the enhancement requires
                that the analysis of information being otherwise produced in these areas is integrated with the analysis
                of audit information. Security Event and Information Management System tools can facilitate audit
                record aggregation/consolidation from multiple information system components as well as audit record
                correlation and analysis. The use of standardized audit record analysis scripts developed by
                organizations (with localized script adjustments, as necessary) provides more cost-effective approaches
                for analyzing audit record information collected. The correlation of audit record information with
                vulnerability scanning information is important in determining the veracity of vulnerability scans and
                correlating attack detection events with scanning results. Correlation with performance data can help
                uncover denial of service attacks or cyber attacks resulting in unauthorized use of resources.
                Correlation with system monitoring information can assist in uncovering attacks and in better relating
                audit information to operational situations. Related controls: AU-12, IR-4, RA-5.
          (6)   AUDIT REVIEW , ANALYSIS, AND REPORTING | CORRELATION WITH PHYSICAL MONITORING
                The organization correlates information from audit records with information obtained from monitoring physical access
                to further enhance the ability to identify suspicious, inappropriate, unusual, or malevolent activity.
                Supplemental Guidance: The correlation of physical audit information and audit logs from information
                systems may assist organizations in identifying examples of suspicious behavior or supporting
                evidence of such behavior. For example, the correlation of an individual’s identity for logical access to
                certain information systems with the additional physical security information that the individual was
                actually present at the facility when the logical access occurred, may prove to be useful in
                investigations.
          (7)   AUDIT REVIEW , ANALYSIS, AND REPORTING | PERMITTED ACTIONS
                The organization specifies the permitted actions for each [Selection (one or more): information system process; role;
                user] associated with the review, analysis, and reporting of audit information.
                Supplemental Guidance: Organizations specify permitted actions for information system processes, roles,
                and/or users associated with the review, analysis, and reporting of audit records through account
                management techniques. Specifying permitted actions on audit information is a way to enforce the
                principle of least privilege. Permitted actions are enforced by the information system and include, for
                example, read, write, execute, append, and delete.
          (8)   AUDIT REVIEW , ANALYSIS, AND REPORTING | FULL TEXT ANALYSIS OF PRIVILEGED COMMANDS
                The organization performs a full text analysis of audited privileged commands in a physically distinct component or
                subsystem of the information system, or other information system that is dedicated to that analysis.
                Supplemental Guidance: This control enhancement requires a distinct environment for the dedicated
                analysis of audit information related to privileged users without compromising such information on the
                information system where the users have elevated privileges including the capability to execute
                privileged commands. Full text analysis refers to analysis that considers the full text of privileged
                commands (i.e., commands and all parameters) as opposed to analysis that considers only the name of

                the command. Full text analysis includes, for example, the use of pattern matching and heuristics.
                Related controls: AU-3, AU-9, AU-11, AU-12.
          (9)   AUDIT REVIEW , ANALYSIS, AND REPORTING | CORRELATION WITH INFORMATION FROM NONTECHNICAL SOURCES
                The organization correlates information from nontechnical sources with audit information to enhance organization-
                wide situational awareness.
                Supplemental Guidance: Nontechnical sources include, for example, human resources records
                documenting organizational policy violations (e.g., sexual harassment incidents, improper use of
                organizational information assets). Such information can lead organizations to a more directed
                analytical effort to detect potential malicious insider activity. Due to the sensitive nature of the
                information available from nontechnical sources, organizations limit access to such information to
                minimize the potential for the inadvertent release of privacy-related information to individuals that do
                not have a need to know. Thus, correlation of information from nontechnical sources with audit
                information generally occurs only when individuals are suspected of being involved in a security
                incident. Organizations obtain legal advice prior to initiating such actions. Related control: AT-2.
          (10) AUDIT REVIEW , ANALYSIS, AND REPORTING | AUDIT LEVEL ADJUSTMENT
                The organization adjusts the level of audit review, analysis, and reporting within the information system when there is
                a change in risk based on law enforcement information, intelligence information, or other credible sources of
                information.
                Supplemental Guidance: The frequency, scope, and/or depth of the audit review, analysis, and reporting
                may be adjusted to meet organizational needs based on new information received.
          References: None.

AU-7      AUDIT REDUCTION AND REPORT GENERATION

          Control: The information system provides an audit reduction and report generation capability that:

          a.    Supports on-demand audit review, analysis, and reporting requirements and after-the-fact
                investigations of security incidents; and
          b.    Does not alter the original content or time ordering of audit records.
          Supplemental Guidance: Audit reduction is a process that manipulates collected audit information and
          organizes such information in a summary format that is more meaningful to analysts. Audit reduction and
          report generation capabilities do not always emanate from the same information system or from the same
          organizational entities conducting auditing activities. Audit reduction capability can include, for example,
          modern data mining techniques with advanced data filters to identify anomalous behavior in audit records.
          The report generation capability provided by the information system can generate customizable reports.
          Time ordering of audit records can be a significant issue if the granularity of the timestamp in the record is
          insufficient. Related control: AU-6.
          Control Enhancements:
          (1)   AUDIT REDUCTION AND REPORT GENERATION | AUTOMATIC PROCESSING
                The information system provides the capability to process audit records for events of interest based on [Assignment:
                organization-defined audit fields within audit records].
                Supplemental Guidance: Events of interest can be identified by the content of specific audit record fields
                including, for example, identities of individuals, event types, event locations, event times, event dates,
                system resources involved, IP addresses involved, or information objects accessed. Organizations may
                define audit event criteria to any degree of granularity required, for example, locations selectable by
                general networking location (e.g., by network or subnetwork) or selectable by specific information
                system component. Related controls: AU-2, AU-12.
          (2)   AUDIT REDUCTION AND REPORT GENERATION | AUTOMATIC SORT AND SEARCH
                The information system provides the capability to sort and search audit records for events of interest based on the
                content of [Assignment: organization-defined audit fields within audit records].
                Supplemental Guidance: Sorting and searching of audit records may be based upon the contents of audit
                record fields, for example: (i) date/time of events; (ii) user identifiers; (iii) Internet Protocol (IP)
                addresses involved in the event; (iv) type of event; or (v) event success/failure.

          References: None.

AU-8      TIME STAMPS

          Control: The information system:

          a.     Uses internal system clocks to generate time stamps for audit records; and
          b.     Records time stamps for audit records that can be mapped to Coordinated Universal Time (UTC) or
                 Greenwich Mean Time (GMT) and meets organization-defined granularity of time measurement of
                 a minimum of one (1) minute.
          Supplemental Guidance: Time stamps generated by the information system include date and time. Time is
          commonly expressed in Coordinated Universal Time (UTC), a modern continuation of Greenwich Mean
          Time (GMT), or local time with an offset from UTC. Granularity of time measurements refers to the degree
          of synchronization between information system clocks and reference clocks, for example, clocks
          synchronizing within hundreds of milliseconds or within tens of milliseconds. Organizations may define
          different time granularities for different system components. Time service can also be critical to other
          security capabilities such as access control and identification and authentication, depending on the nature of
          the mechanisms used to support those capabilities. Related controls: AU-3, AU-12.
          Control Enhancements:
          (1)    TIME STAMPS | SYNCHRONIZATION WITH AUTHORITATIVE TIME SOURCE
                 The information system:
                 (a) Compares the internal information system clocks at least every 24 hours with an organization-defined
                      authoritative time source e.g., Domain Controller, US Naval Observatory time server; and
                 (b) Synchronizes the internal system clocks to the authoritative time source when the time difference is greater
                     than the organizationally defined granularity in AU-8.
                 Supplemental Guidance: This control enhancement provides uniformity of time stamps for information
                 systems with multiple system clocks and systems connected over a network.
          (2)    TIME STAMPS | SECONDARY AUTHORITATIVE TIME SOURCE
                 The information system identifies a secondary authoritative time source that is located in a different geographic
                 region than the primary authoritative time source.

                   For example, every 24 hours verify internal information system clocks are in sync
                   against an internal source, e.g., domain controller, NTP server. Then, once a month sync
                   up the source clock (e.g., domain controller) with an external source, e.g., USNO.
          References: None.

AU-9      PROTECTION OF AUDIT INFORMATION

          Control: The information system protects audit information and audit tools from unauthorized access,
          modification, and deletion.
          Supplemental Guidance: Audit information includes all information (e.g., audit records, audit settings, and
          audit reports) needed to successfully audit information system activity. This control focuses on technical
          protection of audit information. Physical protection of audit information is addressed by media protection
          controls and physical and environmental protection controls. Related controls: AC-3, AC-6, MP-2, MP-4,
          PE-2, PE-3, PE-6.
               Audit information shall be handled and protected at the same security level of the
               information system from which it originated until reviewed and a determination is made of
               the actual classification.
          Control Enhancements:
          (1)    PROTECTION OF AUDIT INFORMATION | HARDWARE WRITE-ONCE MEDIA
                 The information system writes audit trails to hardware-enforced, write-once media.

                Supplemental Guidance: This control enhancement applies to the initial generation of audit trails (i.e., the
                collection of audit records that represents the audit information to be used for detection, analysis, and
                reporting purposes) and to the backup of those audit trails. The enhancement does not apply to the
                initial generation of audit records prior to being written to an audit trail. Write-once, read-many
                (WORM) media includes, for example, Compact Disk-Recordable (CD-R) and Digital Video Disk-
                Recordable (DVD-R). In contrast, the use of switchable write-protection media such as on tape
                cartridges or Universal Serial Bus (USB) drives results in write-protected, but not write-once, media.
                Related controls: AU-4, AU-5.
          (2)   PROTECTION OF AUDIT INFORMATION | AUDIT BACKUP ON SEPARATE PHYSICAL SYSTEMS / COMPONENTS
                The information system backs up audit records at least weekly onto a physically different system or system
                component than the system or component being audited.
                Supplemental Guidance: This control enhancement helps to ensure that a compromise of the information
                system being audited does not also result in a compromise of the audit records. Related controls: AU-4,
                AU-5, AU-11.
          (3)   PROTECTION OF AUDIT INFORMATION | CRYPTOGRAPHIC PROTECTION
                The information system implements cryptographic mechanisms to protect the integrity of audit information and audit
                tools.
                Supplemental Guidance: Cryptographic mechanisms used for protecting the integrity of audit
                information include, for example, signed hash functions using asymmetric cryptography enabling
                distribution of the public key to verify the hash information while maintaining the confidentiality of
                the secret key used to generate the hash. Related controls: AU-10, SC-12, SC-13.
          (4)   PROTECTION OF AUDIT INFORMATION | ACCESS BY SUBSET OF PRIVILEGED USERS
                The organization authorizes access to management of audit functionality to only [Assignment: organization-defined
                subset of privileged users Assignment: organization-defined subset of privileged users].
                Supplemental Guidance: Individuals with privileged access to an information system and who are also
                the subject of an audit by that system, may affect the reliability of audit information by inhibiting audit
                activities or modifying audit records. This control enhancement requires that privileged access be
                further defined between audit-related privileges and other privileges, thus limiting the users with audit-
                related privileges. Related control: AC-5.
                 Limit access to the audit role. Computer security managers and system administrators or
                 managers should have access for review purposes; however, security and/or
                 administration personnel who maintain logical access functions may have no need for
                 access to audit logs.
                 The AO may tailor in AU-9(6) to allow read only for a system administrator requiring
                 access to audits for troubleshooting/diagnostics purposes.
          (5)   PROTECTION OF AUDIT INFORMATION | DUAL AUTHORIZATION
                The organization enforces dual authorization for [Selection (one or more): movement; deletion] of any security
                related audit information.
                Supplemental Guidance: Organizations may choose different selection options for different types of audit
                information. Dual authorization mechanisms require the approval of two authorized individuals in
                order to execute. Dual authorization may also be known as two-person control. Related controls: AC-3,
                MP-2.
          (6)   PROTECTION OF AUDIT INFORMATION | READ ONLY ACCESS
                The organization authorizes read-only access to audit information to [Assignment: organization-defined subset of
                privileged users.
                Supplemental Guidance: Restricting privileged user authorizations to read-only helps to limit the
                potential damage to organizations that could be initiated by such users (e.g., deleting audit records to
                cover up malicious activity).
                References: None.

AU-10     NON-REPUDIATION

          Control:The information system protects against an individual (or process acting on behalf of an
          individual) falsely denying having performed [Assignment: organization-defined actions to be covered by
          non-repudiation].
          Supplemental Guidance: Types of individual actions covered by non-repudiation include, for example,
          creating information, sending and receiving messages, approving information (e.g., indicating concurrence
          or signing a contract). Non-repudiation protects individuals against later claims by: (i) authors of not
          having authored particular documents; (ii) senders of not having transmitted messages; (iii) receivers of not
          having received messages; or (iv) signatories of not having signed documents. Non-repudiation services
          can be used to determine if information originated from a particular individual, or if an individual took
          specific actions (e.g., sending an email, signing a contract, approving a procurement request) or received
          specific information. Organizations obtain non-repudiation services by employing various techniques or
          mechanisms (e.g., digital signatures, digital message receipts). Related controls: SC-12, SC-8, SC-13, SC-
          16, SC-17, SC-23.
               Non-repudiation services are obtained by employing various techniques or mechanisms (e.g.,
               digital signatures, digital message receipts). Digital signatures, if implemented, shall employ
               Federal Information Processing Standards (FIPS)-validated or National Security Agency
               (NSA)-approved cryptography, as appropriate for the classification of the information
               system.

               Tactical/deployable information systems may be developed without all the features and
               security controls of standard information systems. Non-repudiation requirements for these
               systems should be reviewed for mission impact.
          Control Enhancements:
          (1)    NON-REPUDIATION | ASSOCIATION OF IDENTITIES
                 The information system:
                 (a)   Binds the identity of the information producer with the information to [Assignment: organization-defined strength
                       of binding]; and
                 (b) Provides the means for authorized individuals to determine the identity of the producer of the information.
                 Supplemental Guidance: This control enhancement supports audit requirements that provide
                 organizational personnel with the means to identify who produced specific information in the event of
                 an information transfer. Organizations determine and approve the strength of the binding between the
                 information producer and the information based on the security category of the information and
                 relevant risk factors. Related controls: AC-4, AC-16.
          (2)    NON-REPUDIATION | VALIDATE BINDING OF INFORMATION PRODUCER IDENTITY
                 The information system:
                 (a)   Validates the binding of the information producer identity to the information at [Assignment: organization-defined
                       frequency]; and
                 (b) Performs [Assignment: organization-defined actions] in the event of a validation error.
                 Supplemental Guidance: This control enhancement prevents the modification of information between
                 production and review. The validation of bindings can be achieved, for example, by the use of
                 cryptographic checksums. Organizations determine if validations are in response to user requests or
                 generated automatically. Related controls: AC-3, AC-4, AC-16.
          (3)    NON-REPUDIATION | CHAIN OF CUSTODY
                 The information system maintains reviewer/releaser identity and credentials within the established chain of custody
                 for all information reviewed or released.
                 Supplemental Guidance: Chain of custody is a process that tracks the movement of evidence through its
                 collection, safeguarding, and analysis life cycle by documenting each person who handled the
                 evidence, the date and time it was collected or transferred, and the purpose for the transfer. If the
                 reviewer is a human or if the review function is automated but separate from the release/transfer
                 function, the information system associates the identity of the reviewer of the information to be

                 released with the information and the information label. In the case of human reviews, this control
                 enhancement provides organizational officials the means to identify who reviewed and released the
                 information. In the case of automated reviews, this control enhancement ensures that only approved
                 review functions are employed. Related controls: AC-4, AC-16.
          (4)    NON-REPUDIATION | VALIDATE BINDING OF INFORMATION REVIEWER IDENTITY
                 The information system:
                 (a)   Validates the binding of the information reviewer identity to the information at the transfer or release points prior
                       to release/transfer between [Assignment: organization-defined security domains]; and
                 (b) Performs [Assignment: organization-defined actions] in the event of a validation error.
                 Supplemental Guidance: This control enhancement prevents the modification of information between
                 review and transfer/release. The validation of bindings can be achieved, for example, by the use of
                 cryptographic checksums. Organizations determine validations are in response to user requests or
                 generated automatically. Related controls: AC-4, AC-16.
          (5)    NON-REPUDIATION | DIGITAL SIGNATURES
                 [Withdrawn: Incorporated into SI-7].

          References: None.

AU-11     AUDIT RECORD RETENTION

          Control: The organization retains audit records for a minimum of 5 years for SAP data, Sensitive
          Compartmented Information and Sources And Methods Intelligence information AND A minimum
          of 1 year for all other information (Unclassified through Collateral Top Secret) to provide support for
          after-the-fact investigations of security incidents and to meet regulatory and organizational information
          retention requirements.
          Supplemental Guidance: Organizations retain audit records until it is determined that they are no longer
          needed for administrative, legal, audit, or other operational purposes. This includes, for example, retention
          and availability of audit records relative to Freedom of Information Act (FOIA) requests, subpoenas, and
          law enforcement actions. Organizations develop standard categories of audit records relative to such types
          of actions and standard response processes for each type of action. The National Archives and Records
          Administration (NARA) General Records Schedules provide federal policy on record retention. Related
          controls: AU-4, AU-5, AU-9, MP-6.
               The purpose of audit retention is to provide support for after-the-fact investigations of
               security incidents and to meet regulatory and organization information retention
               requirements. Although most requests for audit information from law enforcement (LE) or
               inspectors general (IG) are within the one (1) year mark, audit records going back five (5)
               years provide historic information that is frequently used in espionage cases for damage
               assessment purposes to determine what the (alleged) perpetrator may have accessed.
               The AO has the authority to scale back the number of years retained depending upon the
               mission supported by the system, e.g., a short-lived research and development (R&D) or
               science and technology (S&T) effort, tactical or fleet capability, platform IT (PIT)
               designation.
          Control Enhancements:
          (1)    AUDIT RECORD RETENTION | LONG-TERM RETRIEVAL CAPABILITY
                 The organization employs a retention of technology to access audit records for the duration of the required
                 retention period to ensure that long-term audit records generated by the information system can be retrieved.
                 Supplemental Guidance: Measures employed by organizations to help facilitate the retrieval of audit
                 records include, for example, converting records to newer formats, retaining equipment capable of
                 reading the records, and retaining necessary documentation to help organizational personnel
                 understand how to interpret the records.
          References: None.

AU-12     AUDIT GENERATION

          Control:   The information system:
          a.    Provides audit record generation capability for the auditable events defined in AU-2 a. at all
                information systems and network components;
          b.    Allows [Assignment: organization-defined personnel or roles] to select which auditable events are to
                be audited by specific components of the information system; and
          c.    Generates audit records for the events defined in AU-2 d. with the content defined in AU-3.
          Supplemental Guidance: Audit records can be generated from many different information system
          components. The list of audited events is the set of events for which audits are to be generated. These
          events are typically a subset of all events for which the information system is capable of generating audit
          records. Related controls: AC-3, AU-2, AU-3, AU-6, AU-7.
          Control Enhancements:
          (1)   AUDIT GENERATION | SYSTEM-WIDE / TIME-CORRELATED AUDIT TRAIL
                The information system compiles audit records from [Assignment: organization-defined information system
                components] into a system-wide (logical or physical) audit trail that is time-correlated to within the tolerance defined
                in AU-8.
                Supplemental Guidance: Audit trails are time-correlated if the time stamps in the individual audit records
                can be reliably related to the time stamps in other audit records to achieve a time ordering of the
                records within organizational tolerances. Related controls: AU-8, AU-12.
                 The AU-12 (1) organization-defined IS components is a subset of the organization-
                 defined components in AU-12 focused on correlated and centralizing specific audits.
          (2)   AUDIT GENERATION | STANDARDIZED FORMATS
                The information system produces a system-wide (logical or physical) audit trail composed of audit records in a
                standardized format.
                Supplemental Guidance: Audit information that is normalized to common standards promotes
                interoperability and exchange of such information between dissimilar devices and information systems.
                This facilitates production of event information that can be more readily analyzed and correlated.
                Standard formats for audit records include, for example, system log records and audit records
                compliant with Common Event Expressions (CEE). If logging mechanisms within information systems
                do not conform to standardized formats, systems may convert individual audit records into
                standardized formats when compiling system-wide audit trails.
          (3)   AUDIT GENERATION | CHANGES BY AUTHORIZED INDIVIDUALS
                The information system provides the capability for [Assignment: organization-defined individuals or roles] to change
                the auditing to be performed on [Assignment: organization-defined information system components] based on
                [Assignment: organization-defined selectable event criteria] within [Assignment: organization-defined time
                thresholds].
                Supplemental Guidance: This control enhancement enables organizations to extend or limit auditing as
                necessary to meet organizational requirements. Auditing that is limited to conserve information system
                resources may be extended to address certain threat situations. In addition, auditing may be limited to a
                specific set of events to facilitate audit reduction, analysis, and reporting. Organizations can establish
                time thresholds in which audit actions are changed, for example, near real-time, within minutes, or
                within hours. Related control: AU-7.
          References: None.

AU-13     MONITORING FOR INFORMATION DISCLOSURE

          Control:The organization monitors [Assignment: organization-defined open source information and/or
          information sites] [Assignment: organization-defined frequency] for evidence of unauthorized disclosure of
          organizational information.

          Supplemental Guidance: Open source information includes, for example, social networking sites. Related
          controls: PE-3, SC-7.
          Control Enhancements:
          (1)    MONITORING FOR INFORMATION DISCLOSURE | USE OF AUTOMATED TOOLS
                 The organization employs automated mechanisms to determine if organizational information has been disclosed in
                 an unauthorized manner.
                 Supplemental Guidance: Automated mechanisms can include, for example, automated scripts to monitor
                 new posts on selected websites, and commercial services providing notifications and alerts to
                 organizations.
          (2)    MONITORING FOR INFORMATION DISCLOSURE | REVIEW OF MONITORED SITES
                 The organization reviews the open source information sites being monitored [Assignment: organization-defined
                 frequency].

          References: None.

AU-14     SESSION AUDIT

          Control: The information system provides the capability for authorized users to select a user session to
          capture/record or view/hear.
          Supplemental Guidance: Session audits include, for example, monitoring keystrokes, tracking websites
          visited, and recording information and/or file transfers. Session auditing activities are developed,
          integrated, and used in consultation with legal counsel in accordance with applicable federal laws,
          Executive Orders, directives, policies, regulations, or standards. Related controls: AC-3, AU-4, AU-5, AU-
          9, AU-11.
               Verify system is capable of performing session audits, but do not initiate without legal
               counsel and AO involvement. This control may be used to audit file transfers of DTAs.
          Control Enhancements:
          (1)    SESSION AUDIT | SYSTEM START-UP
                 The information system initiates session audits at system start-up.
          (2)    SESSION AUDIT | CAPTURE/RECORD AND LOG CONTENT
                 The information system provides the capability for authorized users to capture/record and log content related to a
                 user session.
          (3)    SESSION AUDIT | REMOTE VIEWING / LISTENING
                 The information system provides the capability for authorized users to remotely view/hear all content related to an
                 established user session in real time.

          References: None.

AU-15     ALTERNATE AUDIT CAPABILITY

          Control: The organization provides an alternate audit capability in the event of a failure in primary audit
          capability that provides [Assignment: organization-defined alternate audit functionality].
          Supplemental Guidance:   Since an alternate audit capability may be a short-term protection employed until
          the failure in the primary auditing capability is corrected, organizations may determine that the alternate
          audit capability need only provide a subset of the primary audit functionality that is impacted by the failure.
          Related control: AU-5.
          Control Enhancements: None.

          References: None.

AU-16     CROSS-ORGANIZATIONAL AUDITING

          Control: The organization employs [Assignment: organization-defined methods] for coordinating
          [Assignment: organization-defined audit information] among external organizations when audit
          information is transmitted across organizational boundaries.
          Supplemental Guidance: When organizations use information systems and/or services of external
          organizations, the auditing capability necessitates a coordinated approach across organizations. For
          example, maintaining the identity of individuals that requested particular services across organizational
          boundaries may often be very difficult, and doing so may prove to have significant performance
          ramifications. Therefore, it is often the case that cross-organizational auditing (e.g., the type of auditing
          capability provided by service-oriented architectures) simply captures the identity of individuals issuing
          requests at the initial information system, and subsequent systems record that the requests emanated from
          authorized individuals. Related control: AU-6.
               This control may be met through use of an ISA, SLA, or MOA.
          Control Enhancements:
          (1)    CROSS-ORGANIZATIONAL AUDITING | IDENTITY PRESERVATION
                 The organization requires that the identity of individuals be preserved in cross-organizational audit trails.
                 Supplemental Guidance: This control enhancement applies when there is a need to be able to trace
                 actions that are performed across organizational boundaries to a specific individual.
          (2)    CROSS-ORGANIZATIONAL AUDITING | SHARING OF AUDIT INFORMATION
                 The organization provides cross-organizational audit information to [Assignment: organization-defined organizations]
                 based on [Assignment: organization-defined cross-organizational sharing agreements].
                 Supplemental Guidance: Because of the distributed nature of the audit information, cross-organization
                 sharing of audit information may be essential for effective analysis of the auditing being performed.
                 For example, the audit records of one organization may not provide sufficient information to determine
                 the appropriate or inappropriate use of organizational information resources by individuals in other
                 organizations. In some instances, only the home organizations of individuals have the appropriate
                 knowledge to make such determinations, thus requiring the sharing of audit information among
                 organizations.
          References: None.
