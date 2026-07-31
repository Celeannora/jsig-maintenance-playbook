# JSIG Chapter 3 Incident Response (IR) Family

Source URL: https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Archived source (used for extraction, direct URL returns HTTP 403): http://web.archive.org/web/20260405054539/https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Extraction note: Verbatim extraction via `pdftotext -layout` against the complete 378-page JSIG PDF (retrieved 2026-07-17 from the Wayback Machine snapshot below, since the direct DCSA URL returns HTTP 403). This supersedes any prior lower-fidelity extraction of this section. Running page headers/footers inserted by the PDF layout have been stripped; no wording has been added, summarized, or altered.

---

FAMILY: INCIDENT RESPONSE

 This section comprises the incident response controls for the DoD SAP Community and for all
 information systems under the purview of the cognizant SAP AO. When establishing an incident
 response program, policy, plan, and procedures; consider starting with the most likely incident to
 occur on your system. For most sites, this is a data spill. Once the basic procedures for training,
 testing, handling, monitoring, and reporting for one type of incident (e.g., data spill) are documented,
 the process is more easily expanded to encompass other potential incidents. Addressing Incident
 Handling (IR-4) for different types of incidents will likely require the most updates/changes.
 Definitions commonly used in Incident Response include:
       •       Event - Any observable occurrence in a system and/or network. [CNSSI 4009]
       •       Incident - An occurrence that results in actual or potential jeopardy to the confidentially,
               integrity or availability of an information system or the information the system processes,
               stores, or transmits or that constitutes a violation or imminent threat of violation of security
               policies, security procedures or acceptable use policies. See cyber incident. See also event,
               security-relevant, and intrusion. [CNSSI 4009]
       •       Cyber incident – Actions taken through the use of an information system or network that
               result in an actual or potentially adverse effect on an information system, network, and/or the
               information residing therein. [CNSSI 4009]
       •       Data spill or Spillage - Security incident that results in the transfer of classified information
               onto an information system not authorized to store or process that information. [CNSSI
               4009] Also referred to as exfiltration – the unauthorized transfer of data from a system.
               [CNSSI 4009]

IR-1       INCIDENT RESPONSE POLICY AND PROCEDURES

           Control: The organization:

           a.    Develops, documents, and disseminates to [Assignment: organization-defined personnel or roles]:
                 1.   An incident response policy that addresses purpose, scope, roles, responsibilities, management
                      commitment, coordination among organizational entities, and compliance; and
                 2.   Procedures to facilitate the implementation of the incident response policy and associated incident
                      response controls; and
           b.    Reviews and updates the current:
                 1.   Incident response policy at least annually; and
                 2.   Incident response procedures at least annually.
           Supplemental Guidance: This control addresses the establishment of policy and procedures for the effective
           implementation of selected security controls and control enhancements in the IR family. Policy and
           procedures reflect applicable federal laws, Executive Orders, directives, regulations, policies, standards,
           and guidance. Security program policies and procedures at the organization level may make the need for
           system-specific policies and procedures unnecessary. The policy can be included as part of the general
           information security policy for organizations or conversely, can be represented by multiple policies
           reflecting the complex nature of certain organizations. The procedures can be established for the security
           program in general and for particular information systems, if needed. The organizational risk management
           strategy is a key factor in establishing policy and procedures. Related control: PM-9.
               DoD SAP specific policy and procedures related to incident response are defined in the
               remainder of this section. Background information as it applies to incident response is
               provided throughout this section.

           Control Enhancements: None.

           References: NIST Special Publications 800-12, 800-61, 800-83, 800-100.

IR-2       INCIDENT RESPONSE TRAINING

           Control: The organization provides incident response training to information system users consistent with
           assigned roles and responsibilities:
           a.    Within thirty (30) working days of assuming an incident response role or responsibility;
           b.    When required by information system changes; and
           c.    At least annually thereafter.
           Supplemental Guidance: Incident response training provided by organizations is linked to the assigned roles
           and responsibilities of organizational personnel to ensure the appropriate content and level of detail is
           included in such training. For example, regular users may only need to know who to call or how to
           recognize an incident on the information system; system administrators may require additional training on
           how to handle/remediate incidents; and incident responders may receive more specific training on
           forensics, reporting, system recovery, and restoration. Incident response training includes user training in
           the identification and reporting of suspicious activities, both from external and internal sources. Related
           controls: AT-3, CP-3, IR-8.
               Incident recognition and reporting training shall be included as part of both general and
               privileged user awareness training. See also Security Training [AT-3].
               General users must be trained on what constitutes suspicious activity as it applies to the
               system, other users, and unauthorized individuals internal and external to the organization.
               General users must also know to whom and when to report suspicious activity and to keep
               discussions about potential incidents within the incident response chain of command.
               Privileged users should be trained in preserving the scene, preserving the data (volatile and
               nonvolatile), chain of custody, and reporting requirements. Privileged users frequently move
               from the containment phase to eradication compromising data necessary in prosecuting a
               potentially criminal case. Privileged users must also know who to contact for assistance in
               responding to an incident, e.g., the organizations IA point of contact. Additional incident
               response related training may be required depending on the system, environment, and
               mission criticality.
           Control Enhancements:
           (1)   INCIDENT RESPONSE TRAINING | SIMULATED EVENTS
                 The organization incorporates simulated events into incident response training to facilitate effective response by
                 personnel in crisis situations.

                   Emphasis is on simulated, e.g., table top exercises, hot-wash, lessons learned. Use of
                   ‘live’ data (e.g., ‘controlled viruses’) must have prior approval by the AO.
           (2)   INCIDENT RESPONSE TRAINING | AUTOMATED TRAINING ENVIRONMENTS
                 The organization employs automated mechanisms to provide a more thorough and realistic incident response
                 training environment.

           References: NIST Special Publications 800-16, 800-50.

IR-3       INCIDENT RESPONSE TESTING

           Control: The organization tests the incident response capability for the information system [Assignment:
           organization-defined frequency] using [Assignment: organization-defined tests] to determine the incident
           response effectiveness and documents the results.

           Supplemental Guidance: Organizations test incident response capabilities to determine the overall
           effectiveness of the capabilities and to identify potential weaknesses or deficiencies. Incident response
           testing includes, for example, the use of checklists, walk-through or tabletop exercises, simulations
           (parallel/full interrupt), and comprehensive exercises. Incident response testing can also include a
           determination of the effects on organizational operations (e.g., reduction in mission capabilities),
           organizational assets, and individuals due to incident response. Related controls: CP-4, IR-8.
               Lessons learned should be documented and incorporated into future exercises. If there were
               no incidents during the past year, the incident response plan shall be tested using a simulated
               incident/event.
           Control Enhancements:
           (1)   INCIDENT RESPONSE TESTING | AUTOMATED TESTING
                 The organization employs automated mechanisms to more thoroughly and effectively test the incident response
                 capability.
                 Supplemental Guidance: Organizations use automated mechanisms to more thoroughly and effectively
                 test incident response capabilities, for example: (i) by providing more complete coverage of incident
                 response issues; (ii) by selecting more realistic test scenarios and test environments; and (iii) by
                 stressing the response capability. Related control: AT-2.
           (2)   INCIDENT RESPONSE TESTING | COORDINATION WITH RELATED PLANS
                 The organization coordinates incident response testing with organizational elements responsible for related plans.
                 Supplemental Guidance: Organizational plans related to incident response testing include, for example,
                 Business Continuity Plans, Contingency Plans, Disaster Recovery Plans, Continuity of Operations
                 Plans, Crisis Communications Plans, Critical Infrastructure Plans, and Occupant Emergency Plans.
           References: NIST Special Publications 800-84, 800-115.

IR-4       INCIDENT HANDLING

           Control: The organization:

           a.    Implements an incident handling capability for security incidents that includes preparation, detection
                 and analysis, containment, eradication, and recovery;
           b.    Coordinates incident handling activities with contingency planning activities; and
           c.    Incorporates lessons learned from ongoing incident handling activities into incident response
                 procedures, training, and testing/exercises, and implements the resulting changes accordingly.
           Supplemental Guidance: Organizations recognize that incident response capability is dependent on the
           capabilities of organizational information systems and the mission/business processes being supported by
           those systems. Therefore, organizations consider incident response as part of the definition, design, and
           development of mission/business processes and information systems. Incident-related information can be
           obtained from a variety of sources including, for example, audit monitoring, network monitoring, physical
           access monitoring, user/administrator reports, and reported supply chain events. Effective incident handling
           capability includes coordination among many organizational entities including, for example,
           mission/business owners, information system owners, authorizing officials, human resources offices,
           physical and personnel security offices, legal departments, operations personnel, procurement offices, and
           the risk executive (function). Related controls: AU-6, CM-6, CP-2, CP-4, IR-2, IR-3, IR-8, PE-6, SC-5,
           SC-7, SI-3, SI-4, SI-7.
               Individuals involved in incident response, reporting and handling will treat each incident as a
               potentially criminal case. IA professionals not trained in forensics and investigation should
               ensure preservation of the scene and contact their IA forensics point of contact (POC) prior
               to moving from the containment phase to the eradication phase to ensure preservation of data
               (both volatile and nonvolatile) required for criminal prosecution. The NIST version of the
               incident response lifecycle is depicted in Figure 3-1 below and described in NIST SP 800-61.

                                        Figure 3-1: Incident Response Life Cycle

               Incidents are identified using the categories below, as indicated in CJSCM 6510.01B, Cyber
               Incident handling Program, Table B-A-2.
               In addition to selecting the appropriate category, also indicate if the incident resulted in a
               data spill and/or unauthorized disclosure.

               Category                                      Description
                  1     Root Level Intrusion (Incident) - Unauthorized privileged access to an IS.
                        Privileged access, often referred to as administrative or root access, provides
                        unrestricted access to the IS. This category includes unauthorized access to
                        information or unauthorized access to account credentials that could be used to
                        perform administrative functions (e.g., domain administrator). If the IS
                        compromised with malicious code that provides remote interactive control, it
                        will be reported in this category.
                  2     User Level Intrusion (Incident) - Unauthorized non-privileged access to an IS.
                        Non-privileged access, often referred to as user-level access, provides restricted
                        access to the IS based on the privileges granted to the user. This includes
                        unauthorized access to information or unauthorized access to account credentials
                        that could be used to perform user functions such as accessing Web applications,
                        Web portals, or other similar information resources. If the IS is compromised
                        with malicious code that provides remote interactive control, it will be reported
                        in this category.
                  3     Unsuccessful Activity Attempt (Event) - Deliberate attempts to gain
                        unauthorized access to an IS that are defeated by normal defensive mechanisms.
                        Attacker fails to gain access to the IS (i.e., attacker attempts valid or potentially
                        valid username and password combinations) and the activity cannot be
                        characterized as exploratory scanning. Reporting of these events is critical for
                        the gathering of useful effects-based metrics for commanders.
                        Note the above CAT 3 explanation does not cover the “run-of-the-mill” virus
                        that is defeated/deleted by AV software. “Run-of-the-mill” viruses that are
                        defeated/deleted by AV software are not reportable events or incidents and
                        should not be not be annotated in JIMS.
                  4     Denial of Service (Incident) - Activity that denies, degrades or disrupts normal
                        functionality of an IS or DoD information network.
                  5     Non-Compliance Activity (Event) - Activity that potentially exposes IS to
                        increased risk as a result of the action or inaction of authorized users. This
                        includes administrative and user actions such as failure to apply security patches,
                        connections across security domains, installation of vulnerable applications, and
                        other breaches of existing DOD policy. Reporting of these events is critical for
                        the gathering of useful effects-based metrics for commanders.

                   6        Reconnaissance (Event) - Activity that seeks to gather information used to
                            characterize IS, applications, networks, and users that may be useful in
                            formulating an attack. This includes activity such as mapping DOD networks, IS
                            devices and applications, interconnectivity, and their users or reporting structure.
                            This activity does not directly result in a compromise.
                   7        Malicious Logic (Incident) - Installation of software designed and/or deployed
                            by adversaries with malicious intentions for the purpose of gaining access to
                            resources or information without the consent or knowledge of the user. This
                            only includes malicious code that does not provide remote interactive control of
                            the compromised IS. Malicious code that has allowed interactive access should
                            be categorized as Category 1 or Category 2 incidents, not Category 7.
                            Interactive active access may include automated tools that establish an open
                            channel of communications to and/or from an IS.
                   8        Investigating (Event) - Events that are potentially malicious or anomalous
                            activity deemed suspicious and warrant, or are undergoing, further review. No
                            event will be closed out as a Category 8. Category 8 will be re-categorized to
                            appropriate Category 1-7 or 9 prior to closure.
                   9        Explained Anomaly (Event) - Suspicious events that after further investigation
                            are determined to be non-malicious activity and do not fit the criteria for any
                            other categories. This includes events such as IS malfunctions and false alarms.
                            When reporting these events, the reason for which it cannot be otherwise
                            categorized must be clearly specified.
                                Table 3-3: Cyber Incident and Reportable Cyber Event Categories

               The terms used above aid in tracking trends. In rare instances when an incident may need to
               be reported (reference IR-6) outside of the DoD SAP Community, the CA SAPCO and AO
               will determine the appropriate category and channel for reporting. CA SAPCOs, for
               instance, may use a specific reporting process and terms to better address incidents in their
               community. An Incident or Reportable Event Category is a collection of events or incidents
               sharing a common underlying cause for which an incident or event is reported. Each event or
               incident is associated with one or more categories as part of the incident handling process.

               Event 5 Sub-categories:
               a. Unmarked IS Components - Unmarked IS components or media that place classified data
               at risk.
               b. Unattended IS Components - Discovery of unlocked active session without user present.
               c. Unauthorized Software (not malicious) - Software obtained through unofficial channels
               and installed without proper approval.
               d. Other ________

               Event 6 Sub-category:
               Unauthorized Monitoring - Any monitoring of an IS without written approval from legal or
               security authorities.
           Control Enhancements:
           (1)   INCIDENT HANDLING | AUTOMATED INCIDENT HANDLING PROCESSES
                 The organization employs automated mechanisms to support the incident handling process.
                 Supplemental Guidance: Automated mechanisms supporting incident handling processes include, for
                 example, online incident management systems.

           (2)   INCIDENT HANDLING | DYNAMIC RECONFIGURATION
                 The organization includes dynamic reconfiguration of [Assignment: organization-defined information system
                 components] as part of the incident response capability.
                 Supplemental Guidance: Dynamic reconfiguration includes, for example, changes to router rules, access
                 control lists, intrusion detection/prevention system parameters, and filter rules for firewalls and
                 gateways. Organizations perform dynamic reconfiguration of information systems, for example, to stop
                 attacks, to misdirect attackers, and to isolate components of systems, thus limiting the extent of the
                 damage from breaches or compromises. Organizations include time frames for achieving the
                 reconfiguration of information systems in the definition of the reconfiguration capability, considering
                 the potential need for rapid response in order to effectively address sophisticated cyber threats. Related
                 controls: AC-2, AC-4, AC-16, CM-2, CM-3, CM-4.
           (3)   INCIDENT HANDLING | CONTINUITY OF OPERATIONS
                 The organization identifies classes/categories as defined in CJCSM 6510.01B and [Assignment: organization-
                 defined actions to take in response to classes of incidents] to ensure continuation of organizational missions and
                 business functions.
                 Supplemental Guidance: Classes of incidents include, for example, malfunctions due to
                 design/implementation errors and omissions, targeted malicious attacks, and untargeted malicious
                 attacks. Appropriate incident response actions include, for example, graceful degradation, information
                 system shutdown, fall back to manual mode/alternative technology whereby the system operates
                 differently, employing deceptive measures, alternate information flows, or operating in a mode that is
                 reserved solely for when systems are under attack.
                  A database or spreadsheet may be used to capture information about each incident. This
                  method provides the opportunity to identify the class of each incident to ensure
                  appropriate actions are captured in the updated incident handling procedures.
           (4)   INCIDENT HANDLING | INFORMATION CORRELATION
                 The organization correlates incident information and individual incident responses to achieve an organization-wide
                 perspective on incident awareness and response.
                 Supplemental Guidance: Sometimes the nature of a threat event, for example, a hostile cyber attack, is
                 such that it can only be observed by bringing together information from different sources including
                 various reports and reporting procedures established by organizations.
                  Information correlation also provides an automated approach to track trends, i.e.,
                  individuals, specific systems, equipment resulting in updated overall training or
                  individual one-on-one recalibration, insight into system or equipment issues that call for
                  closer scrutiny. Including facility and room alarms in the database or spreadsheet can
                  also highlight recurring issues with an alarm on a particular facility or room. Larger
                  corporations should capture all incidents (system and environment) across campus to
                  better assess organization-wide trends, e.g., individuals, equipment. The sum total offers
                  an organization-wide awareness.
           (5)   INCIDENT HANDLING | AUTOMATIC DISABLING OF INFORMATION SYSTEM
                 The organization implements a configurable capability to automatically disable the information system if [Assignment:
                 organization-defined security violations] are detected.
           (6)   INCIDENT HANDLING | INSIDER THREATS - SPECIFIC CAPABILITIES
                 The organization implements incident handling capability for insider threats.
                 Supplemental Guidance: While many organizations address insider threat incidents as an inherent part of
                 their organizational incident response capability, this control enhancement provides additional
                 emphasis on this type of threat and the need for specific incident handling capabilities (as defined
                 within organizations) to provide appropriate and timely responses.
           (7)   INCIDENT HANDLING | INSIDER THREATS - INTRA-ORGANIZATION COORDINATION
                 The organization coordinates incident handling capability for insider threats across [Assignment: organization-
                 defined components or elements of the organization].
                 Supplemental Guidance: Incident handling for insider threat incidents (including preparation, detection
                 and analysis, containment, eradication, and recovery) requires close coordination among a variety of

                 organizational components or elements to be effective. These components or elements include, for
                 example, mission/business owners, information system owners, human resources offices, procurement
                 offices, personnel/physical security offices, operations personnel, and risk executive (function). In
                 addition, organizations may require external support from federal, state, and local law enforcement
                 agencies.
           (8)   INCIDENT HANDLING | CORRELATION WITH EXTERNAL ORGANIZATIONS
                 The organization coordinates with [Assignment: organization-defined external organizations] to correlate and share
                 [Assignment: organization-defined incident information] to achieve a cross-organization perspective on incident
                 awareness and more effective incident responses.
                 Supplemental Guidance: The coordination of incident information with external organizations including,
                 for example, mission/business partners, military/coalition partners, customers, and multitiered
                 developers, can provide significant benefits. Cross-organizational coordination with respect to incident
                 handling can serve as an important risk management capability. This capability allows organizations to
                 leverage critical information from a variety of sources to effectively respond to information security-
                 related incidents potentially affecting the organization’s operations, assets, and individuals.
                   Incidents on SAP systems stay within SAP channels up through the SAPCO for external
                   release. Incidents of SAP data spilled to non-SAP systems require PSO and AO
                   notification prior to notifications outside of SAP channels.
           (9)   INCIDENT HANDLING | DYNAMIC RESPONSE CAPABILITY
                 The organization employs [Assignment: organization-defined dynamic response capabilities] to effectively respond to
                 security incidents.
                 Supplemental Guidance: This control enhancement addresses the deployment of replacement or new
                 capabilities in a timely manner in response to security incidents (e.g., adversary actions during hostile
                 cyber attacks). This includes capabilities implemented at the mission/business process level (e.g.,
                 activating alternative mission/business processes) and at the information system level. Related control:
                 CP-10.
           (10) INCIDENT HANDLING | SUPPLY CHAIN COORDINATION
                 The organization coordinates incident handling activities involving supply chain events with other organizations
                 involved in the supply chain.
                 Supplemental Guidance: Organizations involved in supply chain activities include, for example,
                 system/product developers, integrators, manufacturers, packagers, assemblers, distributors, vendors,
                 and resellers. Supply chain incidents include, for example, compromises/breaches involving
                 information system components, information technology products, development processes or
                 personnel, and distribution processes or warehousing facilities.
           References: Executive Order 13587; NIST Special Publication 800-61.

IR-5       INCIDENT MONITORING

           Control: The organization tracks and documents information system security incidents.

           Supplemental Guidance: Documenting information system security incidents includes, for example,
           maintaining records about each incident, the status of the incident, and other pertinent information
           necessary for forensics, evaluating incident details, trends, and handling. Incident information can be
           obtained from a variety of sources including, for example, incident reports, incident response teams, audit
           monitoring, network monitoring, physical access monitoring, and user/administrator reports. Related
           controls: AU-6, IR-8, PE-6, SC-5, SC-7, SI-3, SI-4, SI-7.
               Collecting user statements of those involved in incidents with SAP information systems is
               also required in order to completely document the details of an incident.

               While it is not cost effective for most organizations to maintain an online incident
               management system, there are functions that can be automated to support the incident
               handling process. For instance mechanisms in support of identification or detection and
               analysis include:

                   •   System audit logs that capture unsuccessful attempts to log into the system, attempts
                       to gain access to unauthorized folders/files, attempts to introduce unauthorized
                       software or media.
                   •   Device audit logs.
                   •   IDS, content filtering applications, etc.
           Control Enhancements:
           (1)   INCIDENT MONITORING | AUTOMATED TRACKING / DATA COLLECTION / ANALYSIS
                 The organization employs automated mechanisms to assist in the tracking of security incidents and in the collection
                 and analysis of incident information.
                 Supplemental Guidance: Automated mechanisms for tracking security incidents and collecting/analyzing
                 incident information include, for example, the Einstein network monitoring device and monitoring
                 online Computer Incident Response Centers (CIRCs) or other electronic databases of incidents.
                 Related controls: AU-7, IR-4.
           References: NIST Special Publication 800-61.

IR-6       INCIDENT REPORTING

           Control: The organization:

           a.    Requires personnel to report suspected security incidents to the organizational incident response
                 capability within 24 hours if not otherwise defined in formal organizational policy; and
           b.    Reports security incident information to the appropriate SAP Agency CIRT/CERT (see IR-4(8)).
           Supplemental Guidance: The intent of this control is to address both specific incident reporting requirements
           within an organization and the formal incident reporting requirements for federal agencies and their
           subordinate organizations. Suspected security incidents include, for example, the receipt of suspicious
           email communications that can potentially contain malicious code. The types of security incidents reported,
           the content and timeliness of the reports, and the designated reporting authorities reflect applicable federal
           laws, Executive Orders, directives, regulations, policies, standards, and guidance. Current federal policy
           requires that all federal agencies (unless specifically exempted from such requirements) report security
           incidents to the United States Computer Emergency Readiness Team (US-CERT) within specified time
           frames designated in the US-CERT Concept of Operations for Federal Cyber Security Incident Handling.
           Related controls: IR-4, IR-5, IR-8.
               In the case of a suspected incident, containment procedures must begin immediately.
               However, PSO/GSSO/CPSO confirmation of the classification of the information spilled is
               required promptly so decisions concerning scale of containment and eradication efforts can
               be scoped, e.g., SAP data spilled onto another SAP system tends to be (although not always)
               less critical than SAP data spilled to an unclassified system.
               The ISSM/ISSO is responsible for reporting incidents to security as well as to the AO, e.g.,
               the ISSM/ISSO reports to the GSSO/CPSO, who in turn reports to the PSO and the PSO to
               the Director of Security and/or CA SAPCO. The ISSM/ISSO must also report the incident to
               the system DAO who in turn reports it to the AO and/or CA SAPCO. [IR-6.b] If an activity
               from another organization is involved, the PSO or Director of Security will provide proper
               notification to the organization.
               Incidents in progress are classified a minimum of UNCLASSIFIED//Handle via Special
               Access Channels Only (U//HVSACO). The PSO should be notified via secure
               communications as soon as an incident has occurred or is in progress. Initial/interim
               reporting should begin as soon as possible after knowledge of the incident and should
               continue until the incident is resolved.

               Organizations will continue to report until the incident is closed. The CA SAPCO, Director
               of Security, and AO will determine follow-on actions.
               Information system-related fraud, waste, and abuse issues should be reported to the PSO,
               ISO and/or ISSM/ISSO and dealt with by the organization’s chain of command. Individuals
               also have the right to call the Fraud, Waste and Abuse Center (FWAC) hotline.
           Control Enhancements:
           (1)   INCIDENT REPORTING | AUTOMATED REPORTING
                 The organization employs automated mechanisms to assist in the reporting of security incidents.
                 Supplemental Guidance: Related control: IR-7.

                   Differing types of automated mechanisms can meet the intent of IR-6(1) This mechanism
                   may be a web-based form that is populated by the ISSM/ISSO or SA alerting the
                   appropriate individuals, or an email process that includes a preset distribution group to
                   ensure all key individuals are alerted in the event of an incident, e.g., ISSM/ISSO,
                   GSSO/CPSO, PSO/Director of Security, Incident Response lead (e.g., SAPCO’s IA
                   POC), DAO, and AO. Where a web-based form or email distribution is used, the
                   responder should be cautious of the type of incident and the classification of information
                   in the incident description and the classification of the system being used.
           (2)   INCIDENT REPORTING | VULNERABILITIES RELATED TO INCIDENTS
                 The organization reports information system vulnerabilities associated with reported security incidents to
                 [Assignment: organization-defined personnel or roles].

                   Service/Agency SAPCOs should identify an entity to provide Computer Network
                   Defense (CND). PSOs and field reps would then report all incidents to the CND Service
                   Provider (CNDSP) for analysis and response determination, providing guidance to the
                   site as needed. This provides an organization-wide awareness of incidents, a broader
                   capability for identifying trends, and the potential to share information with other
                   organizations in the community.
           (3)   INCIDENT REPORTING | COORDINATION WITH SUPPLY CHAIN
                 The organization provides security incident information to other organizations involved in the supply chain for
                 information systems or information system components related to the incident.
                 Supplemental Guidance: Organizations involved in supply chain activities include, for example,
                 system/product developers, integrators, manufacturers, packagers, assemblers, distributors, vendors,
                 and resellers. Supply chain incidents include, for example, compromises/breaches involving
                 information system components, information technology products, development processes or
                 personnel, and distribution processes or warehousing facilities. Organizations determine the
                 appropriate information to share considering the value gained from support by external organizations
                 with the potential for harm due to sensitive information being released to outside organizations of
                 perhaps questionable trustworthiness.
           References: NIST Special Publication 800-61; Web: http://www.us-cert.gov.

IR-7       INCIDENT RESPONSE ASSISTANCE

           Control: The organization provides an incident response support resource, integral to the organizational
           incident response capability that offers advice and assistance to users of the information system for the
           handling and reporting of security incidents.
           Supplemental Guidance: Incident response support resources provided by organizations include, for example,
           help desks, assistance groups, and access to forensics services, when required. Related controls: AT-2, IR-
           4, IR-6, IR-8, SA-9.
               If the ISSM/ISSO or SA is not trained in incident response and investigation commensurate
               with the level of skill required for a system, the organization’s incident response plan and

               procedures must reflect reach-back to their CA SAPCO IA POC for forensics support.
           Control Enhancements:
           (1)   INCIDENT RESPONSE ASSISTANCE | AUTOMATION SUPPORT FOR AVAILABILITY OF INFORMATION / SUPPORT
                 The organization employs automated mechanisms to increase the availability of incident response-related
                 information and support.
                 Supplemental Guidance: Automated mechanisms can provide a push and/or pull capability for users to
                 obtain incident response assistance. For example, individuals might have access to a website to query
                 the assistance capability, or conversely, the assistance capability may have the ability to proactively
                 send information to users (general distribution or targeted) as part of increasing understanding of
                 current response capabilities and support.
                  Automated mechanisms for incident response related information and support may be
                  employed through a website, database, or other automated means.
           (2)   INCIDENT RESPONSE ASSISTANCE | COORDINATION WITH EXTERNAL PROVIDERS
                 The organization:
                 (a)   Establishes a direct, cooperative relationship between its incident response capability and external providers of
                       information system protection capability; and
                 (b) Identifies organizational incident response team members to the external providers.
                 Supplemental Guidance: External providers of information system protection capability include, for
                 example, the Computer Network Defense program within the U.S. Department of Defense. External
                 providers help to protect, monitor, analyze, detect, and respond to unauthorized activity within
                 organizational information systems and networks.
                  The external providers for information system protection are the CA SAPCO IA POCs.
                  ISSM/ISSOs will provide local incident response team POCs to their CA SAPCO IA
                  POC. The names and contact information may be provided in the SSP.
           References: None.

IR-8       INCIDENT RESPONSE PLAN

           Control: The organization:

           a.    Develops an incident response plan that:
                 1.    Provides the organization with a roadmap for implementing its incident response capability;
                 2.    Describes the structure and organization of the incident response capability;
                 3.    Provides a high-level approach for how the incident response capability fits into the overall
                       organization;
                 4.    Meets the unique requirements of the organization, which relate to mission, size, structure, and
                       functions;
                 5.    Defines reportable incidents;
                 6.    Provides metrics for measuring the incident response capability within the organization;
                 7.    Defines the resources and management support needed to effectively maintain and mature an
                       incident response capability; and
                 8.    Is reviewed and approved by AO;
           b.    Distributes copies of the incident response plan to all personnel with a role or responsibility for
                 implementing the incident response plan;
           c.    Reviews the incident response plan at least annually (incorporating lessons learned from past
                 incidents);

           d.    Updates the incident response plan to address system/organizational changes or problems encountered
                 during plan implementation, execution, or testing;
           e.    Communicates incident response plan changes to [Assignment: organization-defined incident
                 response personnel (identified by name and/or by role) and organizational elements]; and
           f.    Protects the incident response plan from unauthorized disclosure and modification.
           Supplemental Guidance: It is important that organizations develop and implement a coordinated approach to
           incident response. Organizational missions, business functions, strategies, goals, and objectives for incident
           response help to determine the structure of incident response capabilities. As part of a comprehensive
           incident response capability, organizations consider the coordination and sharing of information with
           external organizations, including, for example, external service providers and organizations involved in the
           supply chain for organizational information systems. Related controls: MP-2, MP-4, MP-5.
               Ensure there is PSO coordination, as appropriate, on the Incident Response Plan and that all
               incident response personnel who should receive a copy of the plan and any changes are
               identified by name and/or role.
           Control Enhancements: None.

           References: NIST Special Publication 800-61.

IR-9       INFORMATION SPILLAGE RESPONSE

           Control: The organization responds to information spills by:

           a.    Identifying the specific information involved in the information system contamination;
           b.    Alerting [Assignment: organization-defined personnel or roles] of the information spill using a method
                 of communication not associated with the spill;
           c.    Isolating the contaminated information system or system component;
           d.    Eradicating the information from the contaminated information system or component;
           e.    Identifying other information systems or system components that may have been subsequently
                 contaminated; and
           f.    Performing other [Assignment: organization-defined actions].
           Supplemental Guidance: Information spillage refers to instances where either classified or sensitive
           information is inadvertently placed on information systems that are not authorized to process such
           information. Such information spills often occur when information that is initially thought to be of lower
           sensitivity is transmitted to an information system and then is subsequently determined to be of higher
           sensitivity. At that point, corrective action is required. The nature of the organizational response is
           generally based upon the degree of sensitivity of the spilled information (e.g., security category or
           classification level), the security capabilities of the information system, the specific nature of contaminated
           storage media, and the access authorizations (e.g., security clearances) of individuals with authorized
           access to the contaminated system. The methods used to communicate information about the spill after the
           fact do not involve methods directly associated with the actual spill to minimize the risk of further
           spreading the contamination before such contamination is isolated and eradicated.
           Control Enhancements:
           (1)   INFORMATION SPILLAGE RESPONSE | RESPONSIBLE PERSONNEL
                 The organization assigns [Assignment: organization-defined personnel or roles] with responsibility for responding to
                 information spills.
           (2)   INFORMATION SPILLAGE RESPONSE | TRAINING
                 The organization provides information spillage response training annually.

           (3)   INFORMATION SPILLAGE RESPONSE | POST-SPILL OPERATIONS
                 The organization implements [Assignment: organization-defined procedures] to ensure that organizational personnel
                 impacted by information spills can continue to carry out assigned tasks while contaminated systems are undergoing
                 corrective actions.
                 Supplemental Guidance: Correction actions for information systems contaminated due to information
                 spillages may be very time-consuming. During those periods, personnel may not have access to the
                 contaminated systems, which may potentially affect their ability to conduct organizational business.
           (4)   INFORMATION SPILLAGE RESPONSE | EXPOSURE TO UNAUTHORIZED PERSONNEL
                 The organization employs [Assignment: organization-defined security safeguards] for personnel exposed to
                 information not within assigned access authorizations.
                 Supplemental Guidance: Security safeguards include, for example, making personnel exposed to spilled
                 information aware of the federal laws, directives, policies, and/or regulations regarding the information
                 and the restrictions imposed based on exposure to such information.
           References: None.

IR-10      INTEGRATED INFORMATION SECURITY ANALYSIS TEAM

           Control: The organization establishes an integrated team of forensic/malicious code analysts, tool
           developers, and real-time operations personnel.
           Supplemental Guidance: Having an integrated team for incident response facilitates information sharing.
           Such capability allows organizational personnel, including developers, implementers, and operators, to
           leverage the team knowledge of the threat in order to implement defensive measures that will enable
           organizations to deter intrusions more effectively. Moreover, it promotes the rapid detection of intrusions,
           development of appropriate mitigations, and the deployment of effective defensive measures. For example,
           when an intrusion is detected, the integrated security analysis team can rapidly develop an appropriate
           response for operators to implement, correlate the new incident with information on past intrusions, and
           augment ongoing intelligence development. This enables the team to identify adversary TTPs that are
           linked to the operations tempo or to specific missions/business functions, and to define responsive actions
           in a way that does not disrupt the mission/business operations. Ideally, information security analysis teams
           are distributed within organizations to make the capability more resilient.
           Control Enhancements: None.

           References: None.
