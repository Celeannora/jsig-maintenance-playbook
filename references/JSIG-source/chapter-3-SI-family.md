# JSIG Chapter 3 System and Information Integrity (SI) Family

Source URL: https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Archived source (used for extraction, direct URL returns HTTP 403): http://web.archive.org/web/20260405054539/https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Extraction note: Verbatim extraction via `pdftotext -layout` against the complete 378-page JSIG PDF (retrieved 2026-07-17 from the Wayback Machine snapshot below, since the direct DCSA URL returns HTTP 403). This supersedes any prior lower-fidelity extraction of this section. Running page headers/footers inserted by the PDF layout have been stripped; no wording has been added, summarized, or altered.

---

FAMILY: SYSTEM AND INFORMATION INTEGRITY

SI-1       SYSTEM AND INFORMATION INTEGRITY POLICY AND PROCEDURES

           Control: The organization:

           a.    Develops, documents, and disseminates to all personnel:
                 1.   A system and information integrity policy that addresses purpose, scope, roles, responsibilities,
                      management commitment, coordination among organizational entities, and compliance; and
                 2.   Procedures to facilitate the implementation of the system and information integrity policy and
                      associated system and information integrity controls; and
           b.    Reviews and updates the current:
                 1.   System and information integrity policy at least annually; and
                 2.   System and information integrity procedures at least annually.
           Supplemental Guidance: This control addresses the establishment of policy and procedures for the effective
           implementation of selected security controls and control enhancements in the SI family. Policy and
           procedures reflect applicable federal laws, Executive Orders, directives, regulations, policies, standards,
           and guidance. Security program policies and procedures at the organization level may make the need for
           system-specific policies and procedures unnecessary. The policy can be included as part of the general
           information security policy for organizations or conversely, can be represented by multiple policies
           reflecting the complex nature of certain organizations. The procedures can be established for the security
           program in general and for particular information systems, if needed. The organizational risk management
           strategy is a key factor in establishing policy and procedures. Related control: PM-9.
               DoD SAP-policy and procedures related to system and information integrity are defined in
               the remainder of this section.
           Control Enhancements: None.

           References: NIST Special Publications 800-12, 800-100.

SI-2       FLAW REMEDIATION

           Control: The organization:

           a.    Identifies, reports, and corrects information system flaws;
           b.    Tests software and firmware updates related to flaw remediation for effectiveness and potential side
                 effects before installation;
           c.    Installs security-relevant software and firmware updates within thirty (30) days of the release of the
                 updates; and
           d.    Incorporates flaw remediation into the organizational configuration management process.
           Supplemental Guidance: Organizations identify information systems affected by announced software flaws
           including potential vulnerabilities resulting from those flaws, and report this information to designated
           organizational personnel with information security responsibilities. Security-relevant software updates
           include, for example, patches, service packs, hot fixes, and anti-virus signatures. Organizations also address
           flaws discovered during security assessments, continuous monitoring, incident response activities, and
           system error handling. Organizations take advantage of available resources such as the Common Weakness
           Enumeration (CWE) or Common Vulnerabilities and Exposures (CVE) databases in remediating flaws
           discovered in organizational information systems. By incorporating flaw remediation into ongoing
           configuration management processes, required/anticipated remediation actions can be tracked and verified.
           Flaw remediation actions that can be tracked and verified include, for example, determining whether
           organizations follow US-CERT guidance and Information Assurance Vulnerability Alerts. Organization-
           defined time periods for updating security-relevant software and firmware may vary based on a variety of

           factors including, for example, the security category of the information system or the criticality of the
           update (i.e., severity of the vulnerability related to the discovered flaw). Some types of flaw remediation
           may require more testing than other types. Organizations determine the degree and type of testing needed
           for the specific type of flaw remediation activity under consideration and also the types of changes that are
           to be configuration-managed. In some situations, organizations may determine that the testing of software
           and/or firmware updates is not necessary or practical, for example, when implementing simple anti-virus
           signature updates. Organizations may also consider in testing decisions, whether security-relevant software
           or firmware updates are obtained from authorized sources with appropriate digital signatures. Related
           controls: CA-2, CA-7, CM-3, CM-5, CM-8, MA-2, IR-4, RA-5, SA-10, SA-11, SI-11.
               Flaw remediation refers to software patch management. Patch management is the systematic
               notification, identification, deployment, installation, and verification of operating system and
               application software code revisions.
               Organizations shall:
                   •    Ensure system/network administrators routinely review vendor sites, bulletins, and
                        notifications and proactively update information systems with fixes, patches,
                        definitions, service packs, or implementation of vulnerability mitigation strategies
                        with ISSM approval.
                   •    Employ automated patch management tools on all components to the maximum
                        extent supported by available tools to facilitate flaw remediation.
               PM-14 is another related control.
           Control Enhancements:
           (1)   FLAW REMEDIATION | CENTRAL MANAGEMENT
                 The organization centrally manages the flaw remediation process.
                 Supplemental Guidance: Central management is the organization-wide management and implementation
                 of flaw remediation processes. Central management includes planning, implementing, assessing,
                 authorizing, and monitoring the organization-defined, centrally managed flaw remediation security
                 controls.
           (2)    FLAW REMEDIATION | AUTOMATED FLAW REMEDIATION STATUS
                 The organization employs automated mechanisms at least once a quarter to determine the state of information
                 system components with regard to flaw remediation.
                 Supplemental Guidance: Related controls: CM-6, SI-4.
           (3)    FLAW REMEDIATION | TIME TO REMEDIATE FLAWS / BENCHMARKS FOR CORRECTIVE ACTIONS
                 The organization:
                 (a)   Measures the time between flaw identification and flaw remediation; and
                 (b) Establishes [Assignment: organization-defined benchmarks] for taking corrective actions.
                 Supplemental Guidance: This control enhancement requires organizations to determine the current time
                 it takes on the average to correct information system flaws after such flaws have been identified, and
                 subsequently establish organizational benchmarks (i.e., time frames) for taking corrective actions.
                 Benchmarks can be established by type of flaw and/or severity of the potential vulnerability if the flaw
                 can be exploited.
                   Historical benchmarks, if available, can be used as a reference point for comparison.
           (4)   FLAW REMEDIATION | AUTOMATED PATCH MANAGEMENT TOOLS
                 [Withdrawn: Incorporated into SI-2].
           (5)   FLAW REMEDIATION | AUTOMATIC SOFTWARE / FIRMWARE UPDATES
                 The organization installs [Assignment: organization-defined security-relevant software and firmware updates]
                 automatically to [Assignment: organization-defined information system components].
                 Supplemental Guidance: Due to information system integrity and availability concerns, organizations
                 give careful consideration to the methodology used to carry out automatic updates. Organizations must

                 balance the need to ensure that the updates are installed as soon as possible with the need to maintain
                 configuration management and with any mission or operational impacts that automatic updates might
                 impose.
           (6)    FLAW REMEDIATION | REMOVAL OF PREVIOUS VERSIONS OF SOFTWARE / FIRMWARE
                 The organization removes [Assignment: organization-defined software and firmware components] after updated
                 versions have been installed.
                 Supplemental Guidance: Previous versions of software and/or firmware components that are not
                 removed from the information system after updates have been installed may be exploited by
                 adversaries. Some information technology products may remove older versions of software and/or
                 firmware automatically from the information system.
           References: NIST Special Publications 800-40, 800-128.

SI-3       MALICIOUS CODE PROTECTION

           Control: The organization:

           a.    Employs malicious code protection mechanisms at information system entry and exit points to detect
                 and eradicate malicious code;
           b.    Updates malicious code protection mechanisms whenever new releases are available in accordance
                 with organizational configuration management policy and procedures;
           c.    Configures malicious code protection mechanisms to:
                 1.   Perform periodic scans of the information system at least weekly and real-time scans of files from
                      external sources at endpoints and network entry/exit points as the files are downloaded, opened,
                      or executed in accordance with organizational security policy; and
                 2.   Block and quarantine malicious code then send an alert to the system administrator;
                      [Assignment: organization-defined action]] in response to malicious code detection; and
           d.    Addresses the receipt of false positives during malicious code detection and eradication and the
                 resulting potential impact on the availability of the information system.
           Supplemental Guidance: Information system entry and exit points include, for example, firewalls, electronic
           mail servers, web servers, proxy servers, remote-access servers, workstations, notebook computers, and
           mobile devices. Malicious code includes, for example, viruses, worms, Trojan horses, and spyware.
           Malicious code can also be encoded in various formats (e.g., UUENCODE, Unicode), contained within
           compressed or hidden files, or hidden in files using steganography. Malicious code can be transported by
           different means including, for example, web accesses, electronic mail, electronic mail attachments, and
           portable storage devices. Malicious code insertions occur through the exploitation of information system
           vulnerabilities. Malicious code protection mechanisms include, for example, anti-virus signature definitions
           and reputation-based technologies. A variety of technologies and methods exist to limit or eliminate the
           effects of malicious code. Pervasive configuration management and comprehensive software integrity
           controls may be effective in preventing execution of unauthorized code. In addition to commercial off-the-
           shelf software, malicious code may also be present in custom-built software. This could include, for
           example, logic bombs, back doors, and other types of cyber attacks that could affect organizational
           missions/business functions. Traditional malicious code protection mechanisms cannot always detect such
           code. In these situations, organizations rely instead on other safeguards including, for example, secure
           coding practices, configuration management and control, trusted procurement processes, and monitoring
           practices to help ensure that software does not perform functions other than the functions intended.
           Organizations may determine that in response to the detection of malicious code, different actions may be
           warranted. For example, organizations can define actions in response to malicious code detection during
           periodic scans, actions in response to detection of malicious downloads, and/or actions in response to
           detection of maliciousness when attempting to open or execute files. Related controls: CM-3, MP-2, SA-4,
           SA-8, SA-12, SA-13, SC-7, SC-26, SC-44, SI-2, SI-4, SI-7.
               In reference to SI-3.b, malicious code protection mechanisms shall be updated, at a
               minimum, every 30 days.

           Control Enhancements:
           (1)   MALICIOUS CODE PROTECTION | CENTRAL MANAGEMENT
                 The organization centrally manages malicious code protection mechanisms.
                 Supplemental Guidance: Central management is the organization-wide management and implementation
                 of malicious code protection mechanisms. Central management includes planning, implementing,
                 assessing, authorizing, and monitoring the organization-defined, centrally managed flaw malicious
                 code protection security controls. Related controls: AU-2, SI-8.
                  Central management of malicious code protection includes client/server antivirus model,
                  records of malicious code protection updates; information system configuration settings
                  and associated documentation.
           (2)   MALICIOUS CODE PROTECTION | AUTOMATIC UPDATES
                 The information system automatically updates malicious code protection mechanisms.
                 Supplemental Guidance: Malicious code protection mechanisms include, for example, signature
                 definitions. Due to information system integrity and availability concerns, organizations give careful
                 consideration to the methodology used to carry out automatic updates. Related control: SI-8.
                  Information systems shall automatically update malicious code protection mechanisms
                  (including signature definitions), i.e., after updates are installed to the server.
           (3)   MALICIOUS CODE PROTECTION | NON-PRIVILEGED USERS
                 [Withdrawn: Incorporated into AC-6 (10)].
           (4)   MALICIOUS CODE PROTECTION | UPDATES ONLY BY PRIVILEGED USERS
                 The information system updates malicious code protection mechanisms only when directed by a privileged user.
                 Supplemental Guidance: This control enhancement may be appropriate for situations where for reasons
                 of security or operational continuity, updates are only applied when selected/approved by designated
                 organizational personnel. Related controls: AC-6, CM-5.
           (5)   MALICIOUS CODE PROTECTION | PORTABLE STORAGE DEVICES
                 [Withdrawn: Incorporated into MP-7].
           (6)   MALICIOUS CODE PROTECTION | TESTING / VERIFICATION
                 The organization:
                 (a)   Tests malicious code protection mechanisms [Assignment: organization-defined frequency] by introducing a
                       known benign, non-spreading test case into the information system; and
                 (b) Verifies that both detection of the test case and associated incident reporting occur.
                 Supplemental Guidance: Related controls: CA-2, CA-7, RA-5.
           (7)   MALICIOUS CODE PROTECTION | NONSIGNATURE-BASED DETECTION
                 The information system implements nonsignature-based malicious code detection mechanisms.
                 Supplemental Guidance: Nonsignature-based detection mechanisms include, for example, the use of
                 heuristics to detect, analyze, and describe the characteristics or behavior of malicious code and to
                 provide safeguards against malicious code for which signatures do not yet exist or for which existing
                 signatures may not be effective. This includes polymorphic malicious code (i.e., code that changes
                 signatures when it replicates). This control enhancement does not preclude the use of signature-based
                 detection mechanisms.
           (8)   MALICIOUS CODE PROTECTION | DETECT UNAUTHORIZED COMMANDS
                 The information system detects [Assignment: organization-defined unauthorized operating system commands]
                 through the kernel application programming interface at [Assignment: organization-defined information system
                 hardware components] and audits the command execution and prevents the execution of the command.
                 Supplemental Guidance: This control enhancement can also be applied to critical interfaces other than
                 kernel-based interfaces, including for example, interfaces with virtual machines and privileged
                 applications. Unauthorized operating system commands include, for example, commands for kernel
                 functions from information system processes that are not trusted to initiate such commands, or
                 commands for kernel functions that are suspicious even though commands of that type are reasonable
                 for processes to initiate. Organizations can define the malicious commands to be detected by a

                 combination of command types, command classes, or specific instances of commands. Organizations
                 can define hardware components by specific component, component type, location in the network, or
                 combination therein. Organizations may select different actions for different types/classes/specific
                 instances of potentially malicious commands. Related control: AU-6.
           (9)   MALICIOUS CODE PROTECTION | AUTHENTICATE REMOTE COMMANDS
                 The information system implements [Assignment: organization-defined security safeguards] to authenticate
                 [Assignment: organization-defined remote commands].
                 Supplemental Guidance: This control enhancement protects against unauthorized commands and replay
                 of authorized commands. This capability is important for those remote information systems whose
                 loss, malfunction, misdirection, or exploitation would have immediate and/or serious consequences
                 (e.g., injury or death, property damage, loss of high-valued assets or sensitive information, or failure of
                 important missions/business functions). Authentication safeguards for remote commands help to
                 ensure that information systems accept and execute in the order intended, only authorized commands,
                 and that unauthorized commands are rejected. Cryptographic mechanisms can be employed, for
                 example, to authenticate remote commands. Related controls: SC-12, SC-13, SC-23.
           (10) MALICIOUS CODE PROTECTION | MALICIOUS CODE ANALYSIS
                 The organization:
                 (a)   Employs [Assignment: organization-defined tools and techniques] to analyze the characteristics and behavior of
                       malicious code; and
                 (b) Incorporates the results from malicious code analysis into organizational incident response and flaw
                     remediation processes.
                 Supplemental Guidance: The application of selected malicious code analysis tools and techniques
                 provides organizations with a more in-depth understanding of adversary tradecraft (i.e., tactics,
                 techniques, and procedures) and the functionality and purpose of specific instances of malicious code.
                 Understanding the characteristics of malicious code facilitates more effective organizational responses
                 to current and future threats. Organizations can conduct malicious code analyses by using reverse
                 engineering techniques or by monitoring the behavior of executing code.
                  Malicious code analysis is frequently conducted by a trained forensics team.
           References: NIST Special Publication 800-83.

SI-4       INFORMATION SYSTEM MONITORING

           Control: The organization:

           a.    Monitors the information system to detect:
                 1.    Attacks and indicators of potential attacks in accordance with [Assignment: organization-defined
                       monitoring objectives]; and
                 2.    Unauthorized local, network, and remote connections;
           b.    Identifies unauthorized use of the information system through [Assignment: organization-defined
                 techniques and methods];
           c.    Deploys monitoring devices: (i) strategically within the information system to collect organization-
                 determined essential information; and (ii) at ad hoc locations within the system to track specific types
                 of transactions of interest to the organization;
           d.    Protects information obtained from intrusion-monitoring tools from unauthorized access, modification,
                 and deletion;
           e.    Heightens the level of information system monitoring activity whenever there is an indication of
                 increased risk to organizational operations and assets, individuals, other organizations, or the Nation
                 based on law enforcement information, intelligence information, or other credible sources of
                 information;

           f.    Obtains legal opinion with regard to information system monitoring activities in accordance with
                 applicable federal laws, Executive Orders, directives, policies, or regulations; and
           g.    Provides [Assignment: organization-defined information system monitoring information] to
                 [Assignment: organization-defined personnel or roles] [Selection (one or more): as needed;
                 [Assignment: organization-defined frequency]].
           Supplemental Guidance: Information system monitoring includes external and internal monitoring. External
           monitoring includes the observation of events occurring at the information system boundary (i.e., part of
           perimeter defense and boundary protection). Internal monitoring includes the observation of events
           occurring within the information system. Organizations can monitor information systems, for example, by
           observing audit activities in real time or by observing other system aspects such as access patterns,
           characteristics of access, and other actions. The monitoring objectives may guide determination of the
           events. Information system monitoring capability is achieved through a variety of tools and techniques
           (e.g., intrusion detection systems, intrusion prevention systems, malicious code protection software,
           scanning tools, audit record monitoring software, network monitoring software). Strategic locations for
           monitoring devices include, for example, selected perimeter locations and near server farms supporting
           critical applications, with such devices typically being employed at the managed interfaces associated with
           controls SC-7 and AC-17. Einstein network monitoring devices from the Department of Homeland Security
           can also be included as monitoring devices. The granularity of monitoring information collected is based on
           organizational monitoring objectives and the capability of information systems to support such objectives.
           Specific types of transactions of interest include, for example, Hyper Text Transfer Protocol (HTTP) traffic
           that bypasses HTTP proxies. Information system monitoring is an integral part of organizational continuous
           monitoring and incident response programs. Output from system monitoring serves as input to continuous
           monitoring and incident response programs. A network connection is any connection with a device that
           communicates through a network (e.g., local area network, Internet). A remote connection is any
           connection with a device communicating through an external network (e.g., the Internet). Local, network,
           and remote connections can be either wired or wireless. Related controls: AC-3, AC-4, AC-8, AC-17, AU-
           2, AU-6, AU-7, AU-9, AU-12, CA-7, IR-4, PE-3, RA-5, SC-7, SC-26, SC-35, SI-3, SI-7.
           Control Enhancements:
           (1)   INFORMATION SYSTEM MONITORING | SYSTEM-WIDE INTRUSION DETECTION SYSTEM
                 The organization connects and configures individual intrusion detection tools into an information system-wide
                 intrusion detection system.
           (2)   INFORMATION SYSTEM MONITORING | AUTOMATED TOOLS FOR REAL-TIME ANALYSIS
                 The organization employs automated tools to support near real-time analysis of events.
                 Supplemental Guidance: Automated tools include, for example, host-based, network-based, transport-
                 based, or storage-based event monitoring tools or Security Information and Event Management
                 (SIEM) technologies that provide real time analysis of alerts and/or notifications generated by
                 organizational information systems.
           (3)   INFORMATION SYSTEM MONITORING | AUTOMATED TOOL INTEGRATION
                 The organization employs automated tools to integrate intrusion detection tools into access control and flow control
                 mechanisms for rapid response to attacks by enabling reconfiguration of these mechanisms in support of attack
                 isolation and elimination.
           (4)   INFORMATION SYSTEM MONITORING | INBOUND AND OUTBOUND COMMUNICATIONS TRAFFIC
                 The information system monitors inbound and outbound communications traffic continuously for unusual or
                 unauthorized activities or conditions.
                 Supplemental Guidance: Unusual/unauthorized activities or conditions related to information system
                 inbound and outbound communications traffic include, for example, internal traffic that indicates the
                 presence of malicious code within organizational information systems or propagating among system
                 components, the unauthorized exporting of information, or signaling to external information systems.
                 Evidence of malicious code is used to identify potentially compromised information systems or
                 information system components.
           (5)   INFORMATION SYSTEM MONITORING | SYSTEM-GENERATED ALERTS
                 The information system alerts Assignment: organization-defined personnel or roles] when the following indications of
                 compromise or potential compromise occur: [Assignment: organization-defined compromise indicators].

                 Supplemental Guidance: Alerts may be generated from a variety of sources, including, for example, audit
                 records or inputs from malicious code protection mechanisms, intrusion detection or prevention
                 mechanisms, or boundary protection devices such as firewalls, gateways, and routers. Alerts can be
                 transmitted, for example, telephonically, by electronic mail messages, or by text messaging.
                 Organizational personnel on the notification list can include, for example, system administrators,
                 mission/business owners, system owners, or information system security officers. Related controls:
                 AU-5, PE-6.
                  System alerts may be sent to the system administrator, ISSO, ISSM for indicators related
                  to audit records, alerts from malicious code detection mechanisms, intrusion detection or
                  prevention mechanisms, boundary protection mechanisms such as firewalls, gateways,
                  and routers.
           (6)   INFORMATION SYSTEM MONITORING | RESTRICT NON-PRIVILEGED USERS
                 [Withdrawn: Incorporated into AC-6 (10)].
           (7)   INFORMATION SYSTEM MONITORING | AUTOMATED RESPONSE TO SUSPICIOUS EVENTS
                 The information system notifies [Assignment: organization-defined incident response personnel (identified by name
                 and/or by role)] of detected suspicious events and takes [Assignment: organization-defined least-disruptive actions to
                 terminate suspicious events].
                 Supplemental Guidance: Least-disruptive actions may include, for example, initiating requests for human
                 responses.
                  The least disruptive action is appropriately determined for each individual system.
                  Notification may equate to an email notification to a system administrator, who must
                  then contact incident response personnel within their command chain.
           (8)   INFORMATION SYSTEM MONITORING | PROTECTION OF MONITORING INFORMATION
                 [Withdrawn: Incorporated into SI-4].
           (9)   INFORMATION SYSTEM MONITORING | TESTING OF MONITORING TOOLS
                 The organization tests intrusion-monitoring tools at least monthly.
                 Supplemental Guidance: Testing intrusion-monitoring tools is necessary to ensure that the tools are
                 operating correctly and continue to meet the monitoring objectives of organizations. The frequency of
                 testing depends on the types of tools used by organizations and methods of deployment. Related
                 control: CP-9.
           (10) INFORMATION SYSTEM MONITORING | VISIBILITY OF ENCRYPTED COMMUNICATIONS
                 The organization makes provisions so that [Assignment: organization-defined encrypted communications traffic] is
                 visible to [Assignment: organization-defined information system monitoring tools].
                 Supplemental Guidance: Organizations balance the potentially conflicting needs for encrypting
                 communications traffic and for having insight into such traffic from a monitoring perspective. For
                 some organizations, the need to ensure the confidentiality of communications traffic is paramount; for
                 others, mission-assurance is of greater concern. Organizations determine whether the visibility
                 requirement applies to internal encrypted traffic, encrypted traffic intended for external destinations, or
                 a subset of the traffic types.
           (11) INFORMATION SYSTEM MONITORING | ANALYZE COMMUNICATIONS TRAFFIC ANOMALIES
                 The organization analyzes outbound communications traffic at the external boundary of the information system and
                 selected [Assignment: organization-defined interior points within the system (e.g., subnetworks, subsystems)] to
                 discover anomalies.
                 Supplemental Guidance: Anomalies within organizational information systems include, for example,
                 large file transfers, long-time persistent connections, unusual protocols and ports in use, and attempted
                 communications with suspected malicious external addresses.
           (12) INFORMATION SYSTEM MONITORING | AUTOMATED ALERTS
                 The organization employs automated mechanisms to alert security personnel of the following inappropriate or
                 unusual activities with security implications: at a minimum including unauthorized access attempts,
                 unauthorized system usage.

               Supplemental Guidance: This control enhancement focuses on the security alerts generated by
               organizations and transmitted using automated means. In contrast to the alerts generated by
               information systems in SI-4 (5), which tend to focus on information sources internal to the systems
               (e.g., audit records), the sources of information for this enhancement can include other entities as well
               (e.g., suspicious activity reports, reports on potential insider threats). Related controls: AC-18, IA-3.
                 Organizations will list alerts that their monitoring software is configured to provide. E-
                 mail or security dashboard alerts meet the intent of this control and can be set up to
                 summarize user unauthorized access attempts to files or authentication failures.
           (13) INFORMATION SYSTEM MONITORING | ANALYZE TRAFFIC / EVENT PATTERNS
               The organization:
               (a)   Analyzes communications traffic/event patterns for the information system;
               (b) Develops profiles representing common traffic patterns and/or events; and
               (c)   Uses the traffic/event profiles in tuning system-monitoring devices to reduce the number of false positives and
                     the number of false negatives.
           (14) INFORMATION SYSTEM MONITORING | WIRELESS INTRUSION DETECTION
               The organization employs a wireless intrusion detection system to identify rogue wireless devices and to detect
               attack attempts and potential compromises/breaches to the information system.
               Supplemental Guidance: Wireless signals may radiate beyond the confines of organization-controlled
               facilities. Organizations proactively search for unauthorized wireless connections including the
               conduct of thorough scans for unauthorized wireless access points. Scans are not limited to those areas
               within facilities containing information systems, but also include areas outside of facilities as needed,
               to verify that unauthorized wireless access points are not connected to the systems. Related controls:
               AC-18, IA-3.
                 Organizations should proactively monitor for unauthorized wireless connections,
                 including scanning for unauthorized wireless access points at least quarterly.
                 Unauthorized wireless devices require reporting and response in accordance with the
                 organization / system incident response plan.
           (15) INFORMATION SYSTEM MONITORING | WIRELESS TO WIRELINE COMMUNICATIONS
               The organization employs an intrusion detection system to monitor wireless communications traffic as the traffic
               passes from wireless to wireline networks.
               Supplemental Guidance: Related control: AC-18.
           (16) INFORMATION SYSTEM MONITORING | CORRELATE MONITORING INFORMATION
               The organization correlates information from monitoring tools employed throughout the information system.
               Supplemental Guidance: Correlating information from different monitoring tools can provide a more
               comprehensive view of information system activity. The correlation of monitoring tools that usually
               work in isolation (e.g., host monitoring, network monitoring, anti-virus software) can provide an
               organization-wide view and in so doing, may reveal otherwise unseen attack patterns. Understanding
               the capabilities/limitations of diverse monitoring tools and how to maximize the utility of information
               generated by those tools can help organizations to build, operate, and maintain effective monitoring
               programs. Related control: AU-6.
           (17) INFORMATION SYSTEM MONITORING | INTEGRATED SITUATIONAL AWARENESS
               The organization correlates information from monitoring physical, cyber, and supply chain activities to achieve
               integrated, organization-wide situational awareness.
               Supplemental Guidance: This control enhancement correlates monitoring information from a more
               diverse set of information sources to achieve integrated situational awareness. Integrated situational
               awareness from a combination of physical, cyber, and supply chain monitoring activities enhances the
               capability of organizations to more quickly detect sophisticated cyber attacks and investigate the
               methods and techniques employed to carry out such attacks. In contrast to SI-4 (16) which correlates
               the various cyber monitoring information, this control enhancement correlates monitoring beyond just
               the cyber domain. Such monitoring may help reveal attacks on organizations that are operating across
               multiple attack vectors. Related control: SA-12.

           (18) INFORMATION SYSTEM MONITORING | ANALYZE TRAFFIC / COVERT EXFILTRATION
               The organization analyzes outbound communications traffic at the external boundary of the information system (i.e.,
               system perimeter) and at [Assignment: organization-defined interior points within the system (e.g., subsystems,
               subnetworks)] to detect covert exfiltration of information.
               Supplemental Guidance: Covert means that can be used for the unauthorized exfiltration of
               organizational information include, for example, steganography.
           (19) INFORMATION SYSTEM MONITORING | INDIVIDUALS POSING GREATER RISK
               The organization implements [Assignment: organization-defined additional monitoring] of individuals who have been
               identified by [Assignment: organization-defined sources] as posing an increased level of risk.
               Supplemental Guidance: Indications of increased risk from individuals can be obtained from a variety of
               sources including, for example, human resource records, intelligence agencies, law enforcement
               organizations, and/or other credible sources. The monitoring of individuals is closely coordinated with
               management, legal, security, and human resources officials within organizations conducting such
               monitoring and complies with federal legislation, Executive Orders, policies, directives, regulations,
               and standards.
           (20) INFORMATION SYSTEM MONITORING | PRIVILEGED USER
               The organization implements [Assignment: organization-defined additional monitoring] of privileged users.

                 Implementation of AU-2 controls may address this security control. Identify additional
                 monitoring activities required by the AO.
           (21) INFORMATION SYSTEM MONITORING | PROBATIONARY PERIODS
               The organization implements [Assignment: organization-defined additional monitoring] of individuals during
               [Assignment: organization-defined probationary period].

                 Additional monitoring may be instituted as part of a new-user policy, upon notice of
                 personnel termination (e.g., user gives two weeks’ notice), or the result of incident
                 response. This control may be implemented and defined at the time of incident.
                 Example: Following an incident related to incorrect marking, the PSO/GSSO/CPSO
                 institutes probationary period of 30 days during which time a designated security person
                 reviews all documents produced by the individual.
           (22) INFORMATION SYSTEM MONITORING | UNAUTHORIZED NETWORK SERVICES
               The information system detects network services that have not been authorized or approved by [Assignment:
               organization-defined authorization or approval processes] and [Selection (one or more): audits; alerts [Assignment:
               organization-defined personnel or roles]].
               Supplemental Guidance: Unauthorized or unapproved network services include, for example, services in
               service-oriented architectures that lack organizational verification or validation and therefore may be
               unreliable or serve as malicious rogues for valid services. Related controls: AC-6, CM-7, SA-5, SA-9.
           (23) INFORMATION SYSTEM MONITORING | HOST-BASED DEVICES
               The organization implements [Assignment: organization-defined host-based monitoring mechanisms] at [Assignment:
               organization-defined information system components].
               Supplemental Guidance: Information system components where host-based monitoring can be
               implemented include, for example, servers, workstations, and mobile devices. Organizations consider
               employing host-based monitoring mechanisms from multiple information technology product
               developers.
                 This includes monitoring, for example, I/O and endpoint services, reference [AC-6(1)].
           (24) INFORMATION SYSTEM MONITORING | INDICATORS OF COMPROMISE
               The information system discovers, collects, distributes, and uses indicators of compromise.
               Supplemental Guidance: Indicators of compromise (IOC) are forensic artifacts from intrusions that are
               identified on organizational information systems (at the host or network level). IOCs provide
               organizations with valuable information on objects or information systems that have been
               compromised. IOCs for the discovery of compromised hosts can include for example, the creation of
               registry key values. IOCs for network traffic include, for example, Universal Resource Locator (URL)
               or protocol elements that indicate malware command and control servers. The rapid distribution and

                 adoption of IOCs can improve information security by reducing the time that information systems and
                 organizations are vulnerable to the same exploit or attack.
           References: NIST Special Publications 800-61, 800-83, 800-92, 800-94, 800-137.

SI-5       SECURITY ALERTS, ADVISORIES, AND DIRECTIVES

           Control: The organization:

           a.    Receives information system security alerts, advisories, and directives from includes, but is not
                 limited to, DHS US-CERT, SANS Internet Storm Center (ISC) and USCYBERCOM on an
                 ongoing basis;
           b.    Generates internal security alerts, advisories, and directives as deemed necessary;
           c.    Disseminates security alerts, advisories, and directives to: ISOs, ISSM/ISSOs, system
                 administrators, and security personnel, as appropriate; [Assignment: organization-defined
                 elements within the organization]; [Assignment: organization-defined external organizations]]; and
           d.    Implements security directives in accordance with established time frames, or notifies the issuing
                 organization of the degree of noncompliance.
           Supplemental Guidance: The United States Computer Emergency Readiness Team (US-CERT) generates
           security alerts and advisories to maintain situational awareness across the federal government. Security
           directives are issued by OMB or other designated organizations with the responsibility and authority to
           issue such directives. Compliance to security directives is essential due to the critical nature of many of
           these directives and the potential immediate adverse effects on organizational operations and assets,
           individuals, other organizations, and the Nation should the directives not be implemented in a timely
           manner. External organizations include, for example, external mission/business partners, supply chain
           partners, external service providers, and other peer/supporting organizations. Related control: SI-2.
               A variety of sites are available that provide warnings of system vulnerabilities or ongoing
               attacks. The DoD Information Assurance Vulnerability (IAV) Management (IAVM) process
               was created to develop and disseminate mitigating actions for critical software vulnerabilities
               to DoD Components. US Cyber Command (USCYBERCOM) and DISA jointly manage the
               IAVM and Computer Network Directives, and both identify and publish vulnerabilities or
               directives. IAVM notices have three levels of criticality:
                   • IAV Alert (IAVA) – most critical – a vulnerability posing an immediate and
                       potentially sever threat to DoD systems.
                   • IAV Bulletin (IAVB) – less critical than IAVA, but pose a threat to DoD systems.
                   • IAV Technical Advisory (IAVT) – less critical than IAVB.
               IAVAs and IAVBs are maintained by USCYBERCOM and DISA.

               Additional sources of alerts and advisories which may be monitored include:
                  • Department of Homeland Security (DHS) US Computer Emergency Readiness Team
                      (US-CERT).
                  • Military service computer security incident response teams (CSIRT) (i.e., Air Force
                      Network Operations and Security Center Network Security Division (AFNOSC
                      NSD), Army CERT – Computer Network Operations (ACERT-CNO), Navy Cyber
                      Defense Operations Command (NCDOC), and Marine Corps Network Operations
                      and Security Command (MCNOSC)).
                  • Advisories from the IC Security Coordination Center (IC-SCC) such as Intelligence
                      Community Vulnerability Alerts (ICVA) and Intelligence Community Vulnerability
                      Management (ICVM) releases.
                  • IAVAs and IAVBs maintained by USCYBERCOM and DISA.

           Control Enhancements:
           (1)   SECURITY ALERTS, ADVISORIES, AND DIRECTIVES | AUTOMATED ALERTS AND ADVISORIES

                 The organization employs automated mechanisms to make security alert and advisory information available
                 throughout the organization.
                 Supplemental Guidance: The significant number of changes to organizational information systems and
                 the environments in which those systems operate requires the dissemination of security-related
                 information to a variety of organizational entities that have a direct interest in the success of
                 organizational missions and business functions. Based on the information provided by the security
                 alerts and advisories, changes may be required at one or more of the three tiers related to the
                 management of information security risk including the governance level, mission/business
                 process/enterprise architecture level, and the information system level.
           References: NIST Special Publication 800-40.

SI-6       SECURITY FUNCTION VERIFICATION

           Control: The information system:

           a.    Verifies the correct operation of [Assignment: organization-defined security functions];
           b.    Performs this verification [Assignment: organization-defined system transitional states];
           c.    Notifies [Assignment: organization-defined personnel or roles] of failed security verification tests; and
           d.    [Selection (one or more): shuts the information system down; restarts the information system;
                 [Assignment: organization-defined alternative action(s)]] when anomalies are discovered.
           Supplemental Guidance: Transitional states for information systems include, for example, system startup,
           restart, shutdown, and abort. Notifications provided by information systems include, for example,
           electronic alerts to system administrators, messages to local computer consoles, and/or hardware
           indications such as lights. Related controls: CA-7, CM-6.
           Control Enhancements:
           (1)   SECURITY FUNCTION VERIFICATION | NOTIFICATION OF FAILED SECURITY TESTS
                 [Withdrawn: Incorporated into SI-6].
           (2)   SECURITY FUNCTION VERIFICATION | AUTOMATION SUPPORT FOR DISTRIBUTED TESTING
                 The information system implements automated mechanisms to support for the management of distributed security
                 testing.
                 Supplemental Guidance: Related control: SI-2.
           (3)   SECURITY FUNCTION VERIFICATION | REPORT VERIFICATION RESULTS
                 The organization reports the results of security function verification to responsible security personnel (e.g., PSO,
                 AO, CISO, ISSM/ISSO).
                 Supplemental Guidance: Organizational personnel with potential interest in security function verification
                 results include, for example, senior information security officers, information system security
                 managers, and information systems security officers. Related controls: SA-12, SI-4, SI-5.
           References: None.

SI-7       SOFTWARE, FIRMWARE, AND INFORMATION INTEGRITY

           Control: The organization employs integrity verification tools to detect unauthorized changes to
           [Assignment: organization-defined software, firmware, and information].
           Supplemental Guidance: Unauthorized changes to software, firmware, and information can occur due to
           errors or malicious activity (e.g., tampering). Software includes, for example, operating systems (with key
           internal components such as kernels, drivers), middleware, and applications. Firmware includes, for
           example, the Basic Input Output System (BIOS). Information includes metadata such as security attributes
           associated with information. State-of-the-practice integrity-checking mechanisms (e.g., parity checks,

           cyclical redundancy checks, cryptographic hashes) and associated tools can automatically monitor the
           integrity of information systems and hosted applications. Related controls: SA-12, SC-8, SC-13, SI-3.
               Integrity verification applications shall be employed on information systems to look for
               evidence of information tampering, errors, and omissions. Good software engineering
               practices shall be employed with regard to COTS integrity mechanisms (e.g., parity checks,
               cyclical redundancy checks, cryptographic hashes).
               Organizations shall employ tracking systems software and associated documentation
               protected by quantity licenses to control copying and distribution. For smaller systems, a
               tracking system may be a simple spreadsheet. For more complex systems an automated
               capability may be required.
               Installation of software by users, including privileged users, is prohibited within the DoD
               SAP Community unless done IAW with the process specifically approved by the AO.
               Reference approved process outlined in CM-2, CM-2(4), and CM-2(5) and SI-4.
           Control Enhancements:
           (1)   SOFTWARE, FIRMWARE, AND INFORMATION INTEGRITY | INTEGRITY CHECKS
                 The information system performs an integrity check of [Assignment: organization-defined software, firmware, and
                 information] [Selection (one or more): at startup; at [Assignment: organization-defined transitional states or security-
                 relevant events]; [Assignment: organization-defined frequency].
                 Supplemental Guidance: Security-relevant events include, for example, the identification of a new threat
                 to which organizational information systems are susceptible, and the installation of new hardware,
                 software, or firmware. Transitional states include, for example, system startup, restart, shutdown, and
                 abort.
           (2)   SOFTWARE, FIRMWARE, AND INFORMATION INTEGRITY | AUTOMATED NOTIFICATIONS OF INTEGRITY VIOLATIONS
                 The organization employs automated tools that provide notification to [Assignment: organization-defined personnel
                 or roles] upon discovering discrepancies during integrity verification.
                 Supplemental Guidance: The use of automated tools to report integrity violations and to notify
                 organizational personnel in a timely matter is an essential precursor to effective risk response.
                 Personnel having an interest in integrity violations include, for example, mission/business owners,
                 information system owners, systems administrators, software developers, systems integrators, and
                 information security officers.
           (3)   SOFTWARE, FIRMWARE, AND INFORMATION INTEGRITY | CENTRALLY-MANAGED INTEGRITY TOOLS
                 The organization employs centrally managed integrity verification tools.
                 Supplemental Guidance: Related controls: AU-3, SI-2, SI-8.
           (4)   SOFTWARE, FIRMWARE, AND INFORMATION INTEGRITY | TAMPER-EVIDENT PACKAGING
                 [Withdrawn: Incorporated into SA-12].
           (5)   SOFTWARE, FIRMWARE, AND INFORMATION INTEGRITY | AUTOMATED RESPONSE TO INTEGRITY VIOLATIONS
                 The information system automatically [Selection (one or more): shuts the information system down; restarts the
                 information system; implements [Assignment: organization-defined security safeguards]] when integrity violations are
                 discovered.

                 Supplemental Guidance: Organizations may define different integrity checking and anomaly responses:
                 (i) by type of information (e.g., firmware, software, user data); (ii) by specific information (e.g., boot
                 firmware, boot firmware for a specific types of machines); or (iii) a combination of both. Automatic
                 implementation of specific safeguards within organizational information systems includes, for
                 example, reversing the changes, halting the information system, or triggering audit alerts when
                 unauthorized modifications to critical security files occur.
           (6)   SOFTWARE, FIRMWARE, AND INFORMATION INTEGRITY | CRYPTOGRAPHIC PROTECTION
                 The information system implements cryptographic mechanisms to detect unauthorized changes to software,
                 firmware, and information.
                 Supplemental Guidance: Cryptographic mechanisms used for the protection of integrity include, for
                 example, digital signatures and the computation and application of signed hashes using asymmetric

                 cryptography, protecting the confidentiality of the key used to generate the hash, and using the public
                 key to verify the hash information. Related control: SC-13.
           (7)   SOFTWARE, FIRMWARE, AND INFORMATION INTEGRITY | INTEGRATION OF DETECTION AND RESPONSE
                 The organization incorporates the detection of unauthorized [Assignment: organization-defined security-relevant
                 changes to the information system] into the organizational incident response capability.
                 Supplemental Guidance: This control enhancement helps to ensure that detected events are tracked,
                 monitored, corrected, and available for historical purposes. Maintaining historical records is important
                 both for being able to identify and discern adversary actions over an extended period of time and for
                 possible legal actions. Security-relevant changes include, for example, unauthorized changes to
                 established configuration settings or unauthorized elevation of information system privileges. Related
                 controls: IR-4, IR-5, SI-4.
           (8)   SOFTWARE, FIRMWARE, AND INFORMATION INTEGRITY | AUDITING CAPABILITY FOR SIGNIFICANT EVENTS
                 The information system, upon detection of a potential integrity violation, provides the capability to audit the event and
                 initiates the following actions: [Selection (one or more): generates an audit record; alerts current user; alerts
                 [Assignment: organization-defined personnel or roles]; [Assignment: organization-defined other actions]].
                 Supplemental Guidance: Organizations select response actions based on types of software, specific
                 software, or information for which there are potential integrity violations. Related controls: AU-2, AU-
                 6, AU-12.
           (9)   SOFTWARE, FIRMWARE, AND INFORMATION INTEGRITY | VERIFY BOOT PROCESS
                 The information system verifies the integrity of the boot process of all devices capable of verification of the boot
                 process.
                 Supplemental Guidance: Ensuring the integrity of boot processes is critical to starting devices in
                 known/trustworthy states. Integrity verification mechanisms provide organizational personnel with
                 assurance that only trusted code is executed during boot processes.
           (10) SOFTWARE, FIRMWARE, AND INFORMATION INTEGRITY | PROTECTION OF BOOT FIRMWARE
                 The information system implements [Assignment: organization-defined security safeguards] to protect the integrity of
                 boot firmware in [Assignment: organization-defined devices].
                 Supplemental Guidance: Unauthorized modifications to boot firmware may be indicative of a
                 sophisticated, targeted cyber attack. These types of cyber attacks can result in a permanent denial of
                 service (e.g., if the firmware is corrupted) or a persistent malicious code presence (e.g., if code is
                 embedded within the firmware). Devices can protect the integrity of the boot firmware in
                 organizational information systems by: (i) verifying the integrity and authenticity of all updates to the
                 boot firmware prior to applying changes to the boot devices; and (ii) preventing unauthorized
                 processes from modifying the boot firmware.
           (11) SOFTWARE, FIRMWARE, AND INFORMATION INTEGRITY | CONFINED ENVIRONMENTS WITH LIMITED PRIVILEGES
                 The organization requires that [Assignment: organization-defined user-installed software] execute in a confined
                 physical or virtual machine environment with limited privileges.
                 Supplemental Guidance: Organizations identify software that may be of greater concern with regard to
                 origin or potential for containing malicious code. For this type of software, user installations occur in
                 confined environments of operation to limit or contain damage from malicious code that may be
                 executed.
           (12) SOFTWARE, FIRMWARE, AND INFORMATION INTEGRITY | INTEGRITY VERIFICATION
                 The organization requires that the integrity of [Assignment: organization-defined user-installed software] be verified
                 prior to execution.
                 Supplemental Guidance: Organizations verify the integrity of user-installed software prior to execution
                 to reduce the likelihood of executing malicious code or code that contains errors from unauthorized
                 modifications. Organizations consider the practicality of approaches to verifying software integrity
                 including, for example, availability of checksums of adequate trustworthiness from software
                 developers or vendors.
           (13) SOFTWARE, FIRMWARE, AND INFORMATION INTEGRITY | CODE EXECUTION IN PROTECTED ENVIRONMENTS
                 The organization allows execution of binary or machine-executable code obtained from sources with limited or no
                 warranty and without the provision of source code only in confined physical or virtual machine environments and with
                 the explicit approval of the Authorizing Official (AO).

                 Supplemental Guidance: This control enhancement applies to all sources of binary or machine-
                 executable code including, for example, commercial software/firmware and open source software.
           (14) SOFTWARE, FIRMWARE, AND INFORMATION INTEGRITY | BINARY OR MACHINE EXECUTABLE CODE
                 The organization:
                 (a)   Prohibits the use of binary or machine-executable code from sources with limited or no warranty and without the
                       provision of source code; and
                 (b) Provides exceptions to the source code requirement only for compelling mission/operational requirements and
                     with the approval of the authorizing official.
                 Supplemental Guidance: This control enhancement applies to all sources of binary or machine-
                 executable code including, for example, commercial software/firmware and open source software.
                 Organizations assess software products without accompanying source code from sources with limited
                 or no warranty for potential security impacts. The assessments address the fact that these types of
                 software products may be very difficult to review, repair, or extend, given that organizations, in most
                 cases, do not have access to the original source code, and there may be no owners who could make
                 such repairs on behalf of organizations. Related control: SA-5.

                  Consider tailoring out if base control (SI-7) is not implemented.
           (15) SOFTWARE, FIRMWARE, AND INFORMATION INTEGRITY | CODE AUTHENTICATION
                 The information system implements cryptographic mechanisms to authenticate all software and firmware from
                 vendors/sources that provide cryptographic mechanisms to enable the validation of code authenticity and
                 integrity prior to installation.
                 Supplemental Guidance: Cryptographic authentication includes, for example, verifying that software or
                 firmware components have been digitally signed using certificates recognized and approved by
                 organizations. Code signing is an effective method to protect against malicious code.
           (16) SOFTWARE, FIRMWARE, AND INFORMATION INTEGRITY | TIME LIMIT ON PROCESS EXECUTION W/O SUPERVISION
                 The organization does not allow processes to execute without supervision for more than [Assignment: organization-
                 defined time period].
                 Supplemental Guidance: This control enhancement addresses processes for which normal execution
                 periods can be determined and situations in which organizations exceed such periods. Supervision
                 includes, for example, operating system timers, automated responses, or manual oversight and
                 response when information system process anomalies occur.
           References: NIST Special Publications 800-147, 800-155.

SI-8       SPAM PROTECTION

           Control: The organization:

           a.    Employs spam protection mechanisms at information system entry and exit points to detect and take
                 action on unsolicited messages; and
           b.    Updates spam protection mechanisms when new releases are available in accordance with
                 organizational configuration management policy and procedures.
           Supplemental Guidance: Information system entry and exit points include, for example, firewalls, electronic
           mail servers, web servers, proxy servers, remote-access servers, workstations, mobile devices, and
           notebook/laptop computers. Spam can be transported by different means including, for example, electronic
           mail, electronic mail attachments, and web accesses. Spam protection mechanisms include, for example,
           signature definitions. Related controls: AT-2, AT-3, SC-5, SC-7, SI-3.
           Control Enhancements:
           (1)   SPAM PROTECTION | CENTRAL MANAGEMENT
                 The organization centrally manages spam protection mechanisms.
                 Supplemental Guidance: Central management is the organization-wide management and implementation
                 of spam protection mechanisms. Central management includes planning, implementing, assessing,

                 authorizing, and monitoring the organization-defined, centrally managed spam protection security
                 controls. Related controls: AU-3, SI-2, SI-7.
           (2)   SPAM PROTECTION | AUTOMATIC UPDATES
                 The information system automatically updates spam protection mechanisms.
           (3)   SPAM PROTECTION | CONTINUOUS LEARNING CAPABILITY
                 The information system implements spam protection mechanisms with a learning capability to more effectively
                 identify legitimate communications traffic.
                 Supplemental Guidance: Learning mechanisms include, for example, Bayesian filters that respond to
                 user inputs identifying specific traffic as spam or legitimate by updating algorithm parameters and
                 thereby more accurately separating types of traffic.
           References: NIST Special Publication 800-45.

SI-9       INFORMATION INPUT RESTRICTIONS
           [Withdrawn: Incorporated into AC-2, AC-3, AC-5, AC-6].

SI-10      INFORMATION INPUT VALIDATION

           Control: The information system checks the validity of all inputs to web/application servers, database
           servers, and any system or application input that might receive a crafted exploit toward executing
           some code or buffer overflow.
           Supplemental Guidance: Checking the valid syntax and semantics of information system inputs (e.g.,
           character set, length, numerical range, and acceptable values) verifies that inputs match specified
           definitions for format and content. Software applications typically follow well-defined protocols that use
           structured messages (i.e., commands or queries) to communicate between software modules or system
           components. Structured messages can contain raw or unstructured data interspersed with metadata or
           control information. If software applications use attacker-supplied inputs to construct structured messages
           without properly encoding such messages, then the attacker could insert malicious commands or special
           characters that can cause the data to be interpreted as control information or metadata. Consequently, the
           module or component that receives the tainted output will perform the wrong operations or otherwise
           interpret the data incorrectly. Prescreening inputs prior to passing to interpreters prevents the content from
           being unintentionally interpreted as commands. Input validation helps to ensure accurate and correct inputs
           and prevent attacks such as cross-site scripting and a variety of injection attacks.
               Not all operating systems / applications provide input validation. The system configuration
               documentation will address what inputs are checked and what input format and content is
               acceptable.
           Control Enhancements:
           (1)   INFORMATION INPUT VALIDATION | MANUAL OVERRIDE CAPABILITY
                 The information system:
                 (a)   Provides a manual override capability for input validation of [Assignment: organization-defined inputs];
                 (b) Restricts the use of the manual override capability to only [Assignment: organization-defined authorized
                     individuals]; and
                 (c)   Audits the use of the manual override capability.
                 Supplemental Guidance: Related controls: CM-3, CM-5.
           (2)   INFORMATION INPUT VALIDATION | REVIEW / RESOLUTION OF ERRORS
                 The organization ensures that input validation errors are reviewed and resolved within [Assignment: organization-
                 defined time period].
                 Supplemental Guidance: Resolution of input validation errors includes, for example, correcting systemic
                 causes of errors and resubmitting transactions with corrected input.

           (3)   INFORMATION INPUT VALIDATION | PREDICTABLE BEHAVIOR
                 The information system behaves in a predictable and documented manner that reflects organizational and system
                 objectives when invalid inputs are received.
                 Supplemental Guidance: A common vulnerability in organizational information systems is unpredictable
                 behavior when invalid inputs are received. This control enhancement ensures that there is predictable
                 behavior in the face of invalid inputs by specifying information system responses that facilitate
                 transitioning the system to known states without adverse, unintended side effects.
           (4)   INFORMATION INPUT VALIDATION | REVIEW / TIMING INTERACTIONS
                 The organization accounts for timing interactions among information system components in determining appropriate
                 responses for invalid inputs.
                 Supplemental Guidance: In addressing invalid information system inputs received across protocol
                 interfaces, timing interfaces become relevant, where one protocol needs to consider the impact of the
                 error response on other protocols within the protocol stack. For example, 802.11 standard wireless
                 network protocols do not interact well with Transmission Control Protocols (TCP) when packets are
                 dropped (which could be due to invalid packet input). TCP assumes packet losses are due to
                 congestion, while packets lost over 802.11 links are typically dropped due to collisions or noise on the
                 link. If TCP makes a congestion response, it takes precisely the wrong action in response to a collision
                 event. Adversaries may be able to use apparently acceptable individual behaviors of the protocols in
                 concert to achieve adverse effects through suitable construction of invalid input.
           (5)   INFORMATION INPUT VALIDATION | RESTRICT INPUTS TO TRUSTED SOURCES AND APPROVED FORMATS
                 The organization restricts the use of information inputs to [Assignment: organization-defined trusted sources] and/or
                 [Assignment: organization-defined formats].
                 Supplemental Guidance: This control enhancement applies the concept of whitelisting to information
                 inputs. Specifying known trusted sources for information inputs and acceptable formats for such inputs
                 can reduce the probability of malicious activity.
           References: None.

SI-11      ERROR HANDLING

           Control: The information system:

           a.    Generates error messages that provide information necessary for corrective actions without revealing
                 information that could be exploited by adversaries; and
           b.    Reveals error messages only to [Assignment: organization-defined personnel or roles].
           Supplemental Guidance: Organizations carefully consider the structure/content of error messages. The extent
           to which information systems are able to identify and handle error conditions is guided by organizational
           policy and operational requirements. Information that could be exploited by adversaries includes, for
           example, erroneous logon attempts with passwords entered by mistake as the username, mission/business
           information that can be derived from (if not stated explicitly by) information recorded, and personal
           information such as account numbers, social security numbers, and credit card numbers. In addition, error
           messages may provide a covert channel for transmitting information. Related controls: AU-2, AU-3, SC-
           31.
               Systems should be configured to reduce access to system errors and logs that could reveal
               sensitive or security related information to adversaries to those personnel identified as
               privileged users with a requirement to access such information.
           Control Enhancements: None.

           References: None.

SI-12      INFORMATION HANDLING AND RETENTION

           Control: The organization handles and retains information within the information system and information
           output from the system in accordance with applicable federal laws, Executive Orders, directives, policies,
           regulations, standards, and operational requirements.
           Supplemental Guidance: Information handling and retention requirements cover the full life cycle of
           information, in some cases extending beyond the disposal of information systems. The National Archives
           and Records Administration provides guidance on records retention. Related controls: AC-16, AU-5, AU-
           11, MP-2, MP-4.
               In the absence of AO specific guidance, National Archives and Records Administration
               (NARA) provide guidance on records retention.
           Control Enhancements: None.

           References: None.

SI-13      PREDICTABLE FAILURE PREVENTION

           Control: The organization:

           a.    Determines mean time to failure (MTTF) for [Assignment: organization-defined information system
                 components] in specific environments of operation; and
           b.    Provides substitute information system components and a means to exchange active and standby
                 components at [Assignment: organization-defined MTTF substitution criteria].
           Supplemental Guidance: While MTTF is primarily a reliability issue, this control addresses potential failures
           of specific information system components that provide security capability. Failure rates reflect
           installation-specific consideration, not industry-average. Organizations define criteria for substitution of
           information system components based on MTTF value with consideration for resulting potential harm from
           component failures. Transfer of responsibilities between active and standby components does not
           compromise safety, operational readiness, or security capability (e.g., preservation of state variables).
           Standby components remain available at all times except for maintenance issues or recovery failures in
           progress. Related controls: CP-2, CP-10, MA-6.
               The standby component shall mirror the primary system.
               The organization develops this list of system components in support of availability
               requirements that have been identified from the Business Impact Analysis or local policy.
           Control Enhancements:
           (1)   PREDICTABLE FAILURE PREVENTION | TRANSFERRING COMPONENT RESPONSIBILITIES
                 The organization takes information system components out of service by transferring component responsibilities to
                 substitute components no later than [Assignment: organization-defined fraction or percentage] of mean time to
                 failure.
           (2)   PREDICTABLE FAILURE PREVENTION | TIME LIMIT ON PROCESS EXECUTION WITHOUT SUPERVISION
                 [Withdrawn: Incorporated into SI-7 (16)].
           (3)   PREDICTABLE FAILURE PREVENTION | MANUAL TRANSFER BETWEEN COMPONENTS
                 The organization manually initiates transfers between active and standby information system components
                 [Assignment: organization-defined frequency] if the mean time to failure exceeds [Assignment: organization-defined
                 time period].
           (4)   PREDICTABLE FAILURE PREVENTION | STANDBY COMPONENT INSTALLATION / NOTIFICATION
                 The organization, if information system component failures are detected:
                 (a)   Ensures that the standby components are successfully and transparently installed within [Assignment:
                       organization-defined time period]; and
                 (b) [Selection (one or more): activates [Assignment: organization-defined alarm]; automatically shuts down the
                     information system].

                 Supplemental Guidance: Automatic or manual transfer of components from standby to active mode can
                 occur, for example, upon detection of component failures.
           (5)   PREDICTABLE FAILURE PREVENTION | FAILOVER CAPABILITY
                 The organization provides [Selection: real-time; near real-time] [Assignment: organization-defined failover capability]
                 for the information system.
                 Supplemental Guidance: Failover refers to the automatic switchover to an alternate information system
                 upon the failure of the primary information system. Failover capability includes, for example,
                 incorporating mirrored information system operations at alternate processing sites or periodic data
                 mirroring at regular intervals defined by recovery time periods of organizations.
           References: None.

SI-14      NON-PERSISTENCE

           Control: The organization implements non-persistent [Assignment: organization-defined information system
           components and services] that are initiated in a known state and terminated [Selection (one or more): upon
           end of session of use; periodically at [Assignment: organization-defined frequency]].
           Supplemental Guidance: This control mitigates risk from advanced persistent threats (APTs) by significantly
           reducing the targeting capability of adversaries (i.e., window of opportunity and available attack surface) to
           initiate and complete cyber attacks. By implementing the concept of non-persistence for selected
           information system components, organizations can provide a known state computing resource for a specific
           period of time that does not give adversaries sufficient time on target to exploit vulnerabilities in
           organizational information systems and the environments in which those systems operate. Since the
           advanced persistent threat is a high-end threat with regard to capability, intent, and targeting, organizations
           assume that over an extended period of time, a percentage of cyber attacks will be successful. Non-
           persistent information system components and services are activated as required using protected
           information and terminated periodically or upon the end of sessions. Non-persistence increases the work
           factor of adversaries in attempting to compromise or breach organizational information systems.
           Non-persistent system components can be implemented, for example, by periodically re-imaging
           components or by using a variety of common virtualization techniques. Non-persistent services can be
           implemented using virtualization techniques as part of virtual machines or as new instances of processes on
           physical machines (either persistent or non-persistent).The benefit of periodic refreshes of information
           system components/services is that it does not require organizations to first determine whether
           compromises of components or services have occurred (something that may often be difficult for
           organizations to determine). The refresh of selected information system components and services occurs
           with sufficient frequency to prevent the spread or intended impact of attacks, but not with such frequency
           that it makes the information system unstable. In some instances, refreshes of critical components and
           services may be done periodically in order to hinder the ability of adversaries to exploit optimum windows
           of vulnerabilities. Related controls: SC-30, SC-34.
           Control Enhancements:
           (1)   NON-PERSISTENCE | REFRESH FROM TRUSTED SOURCES
                 The organization ensures that software and data employed during information system component and service
                 refreshes are obtained from [Assignment: organization-defined trusted sources].
                 Supplemental Guidance: Trusted sources include, for example, software/data from write-once, read-only
                 media or from selected off-line secure storage facilities.
           References: None.

SI-15      INFORMATION OUTPUT FILTERING

           Control: The information system validates information output from [Assignment: organization-defined
           software programs and/or applications] to ensure that the information is consistent with the expected
           content.

           Supplemental Guidance: Certain types of cyber attacks (e.g., SQL injections) produce output results that are
           unexpected or inconsistent with the output results that would normally be expected from software programs
           or applications. This control enhancement focuses on detecting extraneous content, preventing such
           extraneous content from being displayed, and alerting monitoring tools that anomalous behavior has been
           discovered. Related controls: SI-3, SI-4.
           Control Enhancements: None.

           References: None.

SI-16      MEMORY PROTECTION

           Control: The information system implements [Assignment: organization-defined security safeguards] to
           protect its memory from unauthorized code execution.
           Supplemental Guidance: Some adversaries launch attacks with the intent of executing code in non-executable
           regions of memory or in memory locations that are prohibited. Security safeguards employed to protect
           memory include, for example, data execution prevention and address space layout randomization. Data
           execution prevention safeguards can either be hardware-enforced or software-enforced with hardware
           providing the greater strength of mechanism. Related controls: AC-25, SC-3.
           Control Enhancements: None.

           References: None.

SI-17      FAIL-SAFE PROCEDURES

           Control: The information system implements [Assignment: organization-defined fail-safe procedures] when
           [Assignment: organization-defined failure conditions occur].
           Supplemental Guidance: Failure conditions include, for example, loss of communications among critical
           system components or between system components and operational facilities. Fail-safe procedures include,
           for example, alerting operator personnel and providing specific instructions on subsequent steps to take
           (e.g., do nothing, reestablish system settings, shut down processes, restart the system, or contact designated
           organizational personnel). Related controls: CP-12, CP-13, SC-24, SI-13.
           Control Enhancements: None.

           References: None.
