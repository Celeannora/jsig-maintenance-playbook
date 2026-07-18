# JSIG Chapter 3 Planning (PL) Family

Source URL: https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Archived source (used for extraction, direct URL returns HTTP 403): http://web.archive.org/web/20260405054539/https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Extraction note: Verbatim extraction via `pdftotext -layout` against the complete 378-page JSIG PDF (retrieved 2026-07-17 from the Wayback Machine snapshot below, since the direct DCSA URL returns HTTP 403). This supersedes any prior lower-fidelity extraction of this section. Running page headers/footers inserted by the PDF layout have been stripped; no wording has been added, summarized, or altered.

---

FAMILY: PLANNING

PL-1       SECURITY PLANNING POLICY AND PROCEDURES

           Control: The organization:

           a.    Develops, documents, and disseminates to all personnel:
                 1.   A security planning policy that addresses purpose, scope, roles, responsibilities, management
                      commitment, coordination among organizational entities, and compliance; and
                 2.   Procedures to facilitate the implementation of the security planning policy and associated security
                      planning controls; and
           b.    Reviews and updates the current:
                 1.   Security planning policy at least annually; and
                 2.   Security planning procedures at least annually.
           Supplemental Guidance: This control addresses the establishment of policy and procedures for the effective
           implementation of selected security controls and control enhancements in the PL family. Policy and
           procedures reflect applicable federal laws, Executive Orders, directives, regulations, policies, standards,
           and guidance. Security program policies and procedures at the organization level may make the need for
           system-specific policies and procedures unnecessary. The policy can be included as part of the general
           information security policy for organizations or conversely, can be represented by multiple policies
           reflecting the complex nature of certain organizations. The procedures can be established for the security
           program in general and for particular information systems, if needed. The organizational risk management
           strategy is a key factor in establishing policy and procedures. Related control: PM-9.
               DoD SAP-specific policy and procedures related to planning are defined in the remainder of
               this section.
           Control Enhancements: None.

           References: NIST Special Publications 800-12, 800-18, 800-100.

PL-2       SYSTEM SECURITY PLAN

           Control: The organization:

           a.    Develops a security plan for the information system that:
                 1.   Is consistent with the organization’s enterprise architecture;
                 2.   Explicitly defines the authorization boundary for the system;
                 3.   Describes the operational context of the information system in terms of missions and business
                      processes;
                 4.   Provides the security categorization of the information system including supporting rationale;
                 5.   Describes the operational environment for the information system and relationships with or
                      connections to other information systems;
                 6.   Provides an overview of the security requirements for the system;
                 7.   Identifies any relevant overlays, if applicable;
                 8.   Describes the security controls in place or planned for meeting those requirements including a
                      rationale for the tailoring decisions; and
                 9.   Is reviewed and approved by the authorizing official or designated representative prior to plan
                      implementation;

           b.    Distributes copies of the security plan and communicates subsequent changes to the plan to
                 [Assignment: organization-defined personnel or roles];
           c.    Reviews the security plan for the information system at least annually or when required due to
                 system changes or modifications;
           d.    Updates the plan to address changes to the information system/environment of operation or problems
                 identified during plan implementation or security control assessments; and
           e.    Protects the security plan from unauthorized disclosure and modification.
           Supplemental Guidance: Security plans relate security requirements to a set of security controls and control
           enhancements. Security plans also describe, at a high level, how the security controls and control
           enhancements meet those security requirements, but do not provide detailed, technical descriptions of the
           specific design or implementation of the controls/enhancements. Security plans contain sufficient
           information (including the specification of parameter values for assignment and selection statements either
           explicitly or by reference) to enable a design and implementation that is unambiguously compliant with the
           intent of the plans and subsequent determinations of risk to organizational operations and assets,
           individuals, other organizations, and the Nation if the plan is implemented as intended. Organizations can
           also apply tailoring guidance to the security control baselines in Appendix D and CNSS Instruction 1253 to
           develop overlays for community-wide use or to address specialized requirements, technologies, or
           missions/environments of operation (e.g., DoD-tactical, Federal Public Key Infrastructure, or Federal
           Identity, Credential, and Access Management, space operations). Appendix I provides guidance on
           developing overlays.
           Security plans need not be single documents; the plans can be a collection of various documents including
           documents that already exist. Effective security plans make extensive use of references to policies,
           procedures, and additional documents (e.g., design and implementation specifications) where more detailed
           information can be obtained. This reduces the documentation requirements associated with security
           programs and maintains security-related information in other established management/operational areas
           related to enterprise architecture, system development life cycle, systems engineering, and acquisition. For
           example, security plans do not contain detailed contingency plan or incident response plan information but
           instead provide explicitly or by reference, sufficient information to define what needs to be accomplished
           by those plans. Related controls: AC-2, AC-6, AC-14, AC-17, AC-20, CA-2, CA-3, CA-7, CM-9, CP-2,
           IR-8, MA-4, MA-5, MP-2, MP-4, MP-5, PL-7, PM-1, PM-7, PM-8, PM-9, PM-11, SA-5, SA-17.
               SAP organizations shall ensure an SSP is developed for each information system that:
                   •   Conforms to the service/agency-accepted SSP template for SAP IS.
                   •   Identifies the tailored controls (tailored in/out/modified) approved by the AO.
                   •   Identifies any exceptions, which denotes a control or part of a control that is not met
                       and is an accepted risk by the AO. Exceptions should also be captured on the
                       POA&M unless otherwise directed by the AO.
                   •   Is approved by the AO through coordination with the SCA prior to plan
                       implementation
               Information System Owner (ISO) Responsibilities
               As stated in 1.5.12, the ISO is responsible for ensuring development and maintenance of the
               documentation for a security authorization package, to include the SSP and SCTM.
               The ISO shall ensure the SSP is reviewed at least annually and updated to address changes to
               the information system/environment of operation as well as problems identified during plan
               implementation or security control assessments.
               Reference [CA-6] for examples of changes requiring SSP updates and Chapter 1 of this
               document for additional ISO responsibilities.

               SSP Content Classification
               Oftentimes the use of Unclassified Handle Via Special Access Channels Only (U//HVSACO)
               is used for SSPs to preclude the disclosure of general program-related information outside
               established SAP channels, minimize OPSEC indicators, and facilitate communication of
               information within SAPs. Consult your Service/Agency representatives for proper
               classification guidance based upon applicable SCGs or other requirements.
               Black IP addresses captured in an SSP for SAP systems are generally unclassified.
               Red IP addresses captured in an SSP for SAP systems shall be protected within SAP
               channels.
           Control Enhancements:
           (1)   SYSTEM SECURITY PLAN | CONCEPT OF OPERATIONS
                 [Withdrawn: Incorporated into PL-7].
           (2)   SYSTEM SECURITY PLAN | FUNCTIONAL ARCHITECTURE
                  [Withdrawn: Incorporated into PL-8].
           (3)   SYSTEM SECURITY PLAN | PLAN / COORDINATE WITH OTHER ORGANIZATIONAL ENTITIES
                 The organization plans and coordinates security-related activities affecting the information system with [Assignment:
                 organization-defined individuals or groups] before conducting such activities in order to reduce the impact on other
                 organizational entities.
                 Supplemental Guidance: Security-related activities include, for example, security assessments, audits,
                 hardware and software maintenance, patch management, and contingency plan testing. Advance
                 planning and coordination includes emergency and nonemergency (i.e., planned or nonurgent
                 unplanned) situations. The process defined by organizations to plan and coordinate security-related
                 activities can be included in security plans for information systems or other documents, as appropriate.
                 Related controls: CP-4, IR-4.
           References: NIST Special Publication 800-18.

PL-3       SYSTEM SECURITY PLAN UPDATE
           [Withdrawn: Incorporated into PL-2].

PL-4       RULES OF BEHAVIOR

           Control: The organization:

           a.    Establishes and makes readily available to individuals requiring access to the information system, the
                 rules that describe their responsibilities and expected behavior with regard to information and
                 information system usage;
           b.    Receives a signed acknowledgment from such individuals, indicating that they have read, understand,
                 and agree to abide by the rules of behavior, before authorizing access to information and the
                 information system;
           c.     Reviews and updates the rules of behavior At least annually; and
           d.    Requires individuals who have signed a previous version of the rules of behavior to read and resign
                 when the rules of behavior are revised/updated.
           Supplemental Guidance: This control enhancement applies to organizational users. Organizations consider
           rules of behavior based on individual user roles and responsibilities, differentiating, for example, between
           rules that apply to privileged users and rules that apply to general users. Establishing rules of behavior for
           some types of non-organizational users including, for example, individuals who simply receive
           data/information from federal information systems, is often not feasible given the large number of such
           users and the limited nature of their interactions with the systems. Rules of behavior for both organizational
           and non-organizational users can also be established in AC-8, System Use Notification. PL-4 b. (the signed

           acknowledgment portion of this control) may be satisfied by the security awareness training and role-based
           security training programs conducted by organizations if such training includes rules of behavior.
           Organizations can use electronic signatures for acknowledging rules of behavior. Related controls: AC-2,
           AC-6, AC-8, AC-9, AC-17, AC-18, AC-19, AC-20, AT-2, AT-3, CM-11, IA-2, IA-4, IA-5, MP-7, PS-6,
           PS-8, SA-5.
               Rules of Behavior are addressed as part of user security awareness and training [AT-3] as
               well as [PL-4]. Signed acknowledgement of the rules of behavior is covered via user access
               agreements. See User Agreements [PS-6].
               The responsibilities of a General user shall include:
                 • Reading and signing the Standard Mandatory Notice and Consent Provision for all
                   DoD Information System User Agreements.
                 • Use the system for official use only. Appropriate personal use of IS must be consistent
                   with organizational policy.
                 • Access only that data, system information, software, hardware, and firmware for which
                   they are authorized access and have a need-to-know, and assume only those roles and
                   privileges for which they are authorized.
                 • Observe rules and regulations governing the secure operation and authorized use of IS.
                 • Complete, at minimum, annual IA awareness training.
                 • DO NOT introduce malicious code into any IS or physically damage the system.
                 • DO NOT bypass, strain, or test security mechanisms. If security mechanisms must be
                   bypassed for any reason, users shall coordinate with the ISSO and receive written
                   permission from the ISSM to bypass security mechanisms.
                 • DO NOT introduce or use unauthorized software, firmware, or hardware on an IS.
                 • DO NOT relocate or change IS equipment or its network connectivity without proper
                   security authorization.
                 • Secure unattended IS by invoking screen lock or logging off. Screen lock shall be
                   employed for absences of a short duration. For any extended absence (more than six
                   hours) and at the end of each workday, users are required to logout of all systems.
                 • Safeguard and report any unexpected or unrecognizable output products to the
                   ISSO/SA as appropriate. This includes both displayed and printed products.
                 • Safeguard and report the receipt of any media received through any channel to the
                   appropriate ISSO/SA for subsequent virus inspection and inclusion into the media
                   control procedures. See also Media Access [MP-2].
                 • Protect IS and IS peripherals located in the user’s area from unauthorized access.
                 • Protect all authenticators (e.g., passwords, smart card personal identification numbers
                   (PIN)/passwords, PKI private certificates) from disclosure to entities other than the
                   user, system authentication components, and the authorized authenticator distribution
                   entities. Single factor authenticators shall be protected commensurate with the
                   information sensitivity accessible by the associated entity. Reference IA-5(6). Report
                   any compromise or suspected compromise of an authenticator to the appropriate ISSO.
                   Ensure all system media and output products are properly classified, marked,
                   controlled, stored, transported, and destroyed. See also the Media Protection (MP)
                   section.
                 • Immediately report all actual or suspected security incidents and potential threats and
                   vulnerabilities involving an IS and/or network to the appropriate ISSO/SA or ISSM via

                    secure means.
                 • DO NOT tamper with access doors, covers, plates and TEMPEST seals on IS.
                  • Inform the appropriate ISSO/SA when access to a particular IS is no longer required
                     (e.g., completion of project, transfer, retirement, resignation).
               In addition to the requirements for a general user, privileged users shall:
                 • Access only the specific data, control information, software, hardware, and firmware
                   for which they are authorized access and have a need-to-know, and assume only those
                   roles and privileges for which they are authorized.
                 • NOT use privileged user accounts to perform routine, non-administrative daily tasks
                   (such as web browsing or reading electronic mail) as these activities may
                   unintentionally damage or expose the system to attacks that are delivered via everyday
                   applications.
                 • NOT use their privileged user accesses to alter, change or destroy information (e.g.,
                   audit logs, security-related objects and directories) without approval from the
                   appropriate legal authority.
                 • Protect the “root” or “super user” authenticator at the highest level of data it secures.
                 • Use special accesses or permissions to perform only authorized tasks and functions.
                 • Take necessary precautions to protect the confidentiality of information encountered
                   while performing privileged duties.
                 • Do not use special accesses or permissions to perform general user functions.
                 • Report and document all system security configuration changes and detected/suspected
                   security-related IS problems that might adversely impact IS security to the ISSM.
               Password Misuse or Compromise
               Users shall take precautions to protect their passwords from misuse and compromise. A
               password shall be changed immediately if misuse or compromise of the password is known
               or suspected. Suspected misuse or compromise of a password shall be reported to the
               ISSM/ISSO. Discovery of unauthorized use, possession, or downloading of a password-
               cracking tool shall be immediately reported to the ISSM/ISSO. Organizations shall establish
               procedures for all users to change their passwords, for example, in response to an incident
               affecting an information system resource, should such a response be required.
           Control Enhancements:
           (1)   RULES OF BEHAVIOR | SOCIAL MEDIA AND NETWORKING RESTRICTIONS
                 The organization includes in the rules of behavior, explicit restrictions on the use of social media/networking sites
                 and posting organizational information on public websites.
                 Supplemental Guidance: This control enhancement addresses rules of behavior related to the use of
                 social media/networking sites: (i) when organizational personnel are using such sites for official duties
                 or in the conduct of official business; (ii) when organizational information is involved in social
                 media/networking transactions; and (iii) when personnel are accessing social media/networking sites
                 from organizational information systems. Organizations also address specific rules that prevent
                 unauthorized entities from obtaining and/or inferring non-public organizational information (e.g.,
                 system account information, personally identifiable information) from social media/networking sites.
           References: NIST Special Publication 800-18.

PL-5       PRIVACY IMPACT ASSESSMENT
           [Withdrawn: Incorporated into Appendix J, AR-2].

PL-6       SECURITY-RELATED ACTIVITY PLANNING
           [Withdrawn: Incorporated into PL-2].

PL-7       SECURITY CONCEPT OF OPERATIONS

           Control: The organization:

           a.    Develops a security Concept of Operations (CONOPS) for the information system containing at a
                 minimum, how the organization intends to operate the system from the perspective of information
                 security; and
           b.    Reviews and updates the CONOPS at least annually or when changes to the information system or
                 its environment warrant.
           Supplemental Guidance: The security CONOPS may be included in the security plan for the information
           system or in other system development life cycle-related documents, as appropriate. Changes to the
           CONOPS are reflected in ongoing updates to the security plan, the information security architecture, and
           other appropriate organizational documents (e.g., security specifications for procurements/acquisitions,
           system development life cycle documents, and systems/security engineering documents). Related control:
           PL-2.
               The CONOPS for the information system includes, at a minimum, the purpose of the system,
               description of the system architecture, and data flow.
           Control Enhancements: None.

           References: None.

PL-8       INFORMATION SECURITY ARCHITECTURE

           Control: The organization:

           a.    Develops an information security architecture for the information system that:
                 1.   Describes the overall philosophy, requirements, and approach to be taken with regard to protecting
                      the confidentiality, integrity, and availability of organizational information;
                 2.   Describes how the information security architecture is integrated into and supports the enterprise
                      architecture; and
                 3.   Describes any information security assumptions about, and dependencies on, external services;
           b.    Reviews and updates the information security architecture at least annually or when changes to the
                 information system or its environment warrant to reflect updates in the enterprise architecture; and
           c.    Ensures that planned information security architecture changes are reflected in the security plan, the
                 security Concept of Operations (CONOPS), and organizational procurements/acquisitions.
           Supplemental Guidance: This control addresses actions taken by organizations in the design and development
           of information systems. The information security architecture at the individual information system level is
           consistent with and complements the more global, organization-wide information security architecture
           described in PM-7 that is integral to and developed as part of the enterprise architecture. The information
           security architecture includes an architectural description, the placement/allocation of security functionality
           (including security controls), security-related information for external interfaces, information being
           exchanged across the interfaces, and the protection mechanisms associated with each interface. In addition,
           the security architecture can include other important security-related information, for example, user roles
           and access privileges assigned to each role, unique security requirements, the types of information
           processed, stored, and transmitted by the information system, restoration priorities of information and
           information system services, and any other specific protection needs.
           In today’s modern architecture, it is becoming less common for organizations to control all information
           resources. There are going to be key dependencies on external information services and service providers.

           Describing such dependencies in the information security architecture is important to developing a
           comprehensive mission/business protection strategy. Establishing, developing, documenting, and
           maintaining under configuration control, a baseline configuration for organizational information systems is
           critical to implementing and maintaining an effective information security architecture. The development of
           the information security architecture is coordinated with the Senior Agency Official for Privacy
           (SAOP)/Chief Privacy Officer (CPO) to ensure that security controls needed to support privacy
           requirements are identified and effectively implemented. PL-8 is primarily directed at organizations (i.e.,
           internally focused) to help ensure that organizations develop an information security architecture for the
           information system, and that the security architecture is integrated with or tightly coupled to the enterprise
           architecture through the organization-wide information security architecture. In contrast, SA-17 is primarily
           directed at external information technology product/system developers and integrators (although SA-17
           could be used internally within organizations for in-house system development). SA-17, which is
           complementary to PL-8, is selected when organizations outsource the development of information systems
           or information system components to external entities, and there is a need to demonstrate/show consistency
           with the organization’s enterprise architecture and information security architecture. Related controls: CM-
           2, CM-6, PL-2, PM-7, SA-5, SA-17, Appendix J.
               Thorough detailed descriptions in the SSP of the system overview, system environment,
               facility diagram, network architecture, system diagram, and system connectivity can meet
               this control. See NIST Supplemental Guidance above for general contents of Information
               Security Architecture.
           Control Enhancements:
           (1)   INFORMATION SECURITY ARCHITECTURE | DEFENSE-IN-DEPTH
                 The organization designs its security architecture using a defense-in-depth approach that:
                 (a)   Allocates [Assignment: organization-defined security safeguards] to [Assignment: organization-defined locations
                       and architectural layers]; and
                 (b) Ensures that the allocated security safeguards operate in a coordinated and mutually reinforcing manner.
                 Supplemental Guidance: Organizations strategically allocate security safeguards (procedural, technical,
                 or both) in the security architecture so that adversaries have to overcome multiple safeguards to
                 achieve their objective. Requiring adversaries to defeat multiple mechanisms makes it more difficult to
                 successfully attack critical information resources (i.e., increases adversary work factor) and also
                 increases the likelihood of detection. The coordination of allocated safeguards is essential to ensure
                 that an attack that involves one safeguard does not create adverse unintended consequences (e.g.,
                 lockout, cascading alarms) by interfering with another safeguard. Placement of security safeguards is a
                 key activity. Greater asset criticality or information value merits additional layering. Thus, an
                 organization may choose to place anti-virus software at organizational boundary layers, email/web
                 servers, notebook computers, and workstations to maximize the number of related safeguards
                 adversaries must penetrate before compromising the information and information systems. Related
                 controls: SC-29, SC-36.
           (2)   INFORMATION SECURITY ARCHITECTURE | SUPPLIER DIVERSITY
                 The organization requires that [Assignment: organization-defined security safeguards] allocated to [Assignment:
                 organization-defined locations and architectural layers] are obtained from different suppliers.
                 Supplemental Guidance: Different information technology products have different strengths and
                 weaknesses. Providing a broad spectrum of products complements the individual offerings. For
                 example, vendors offering malicious code protection typically update their products at different times,
                 often developing solutions for known viruses, Trojans, or worms according to their priorities and
                 development schedules. By having different products at different locations (e.g., server, boundary,
                 desktop) there is an increased likelihood that at least one will detect the malicious code. Related
                 control: SA-12.
           References: None.

PL-9       CENTRAL MANAGEMENT

           Control: The organization centrally manages [Assignment: organization-defined security controls and
           related processes].
           Supplemental Guidance: Central management refers to the organization-wide management and
           implementation of selected security controls and related processes. Central management includes planning,
           implementing, assessing, authorizing, and monitoring the organization-defined, centrally managed security
           controls and processes. As central management of security controls is generally associated with common
           controls, such management promotes and facilitates standardization of security control implementations
           and management and judicious use of organizational resources. Centrally-managed security controls and
           processes may also meet independence requirements for assessments in support of initial and ongoing
           authorizations to operate as part of organizational continuous monitoring. As part of the security control
           selection process, organizations determine which controls may be suitable for central management based on
           organizational resources and capabilities. Organizations consider that it may not always be possible to
           centrally manage every aspect of a security control. In such cases, the security control is treated as a hybrid
           control with the control managed and implemented either centrally or at the information system level.
           Controls and control enhancements that are candidates for full or partial central management include, but
           are not limited to: AC-2 (1) (2) (3) (4); AC-17 (1) (2) (3) (9); AC-18 (1) (3) (4) (5); AC-19 (4); AC-22;
           AC-23; AT-2 (1) (2); AT-3 (1) (2) (3); AT-4; AU-6 (1) (3) (5) (6) (9); AU-7 (1) (2); AU-11, AU-13, AU-
           16, CA-2 (1) (2) (3); CA-3 (1) (2) (3); CA-7 (1); CA-9; CM-2 (1) (2); CM-3 (1) (4); CM-4; CM-6 (1); CM-
           7 (4) (5); CM-8 (all); CM-9 (1); CM-10; CM-11; CP-7 (all); CP-8 (all); SC-43; SI-2; SI-3; SI-7; and SI-8.
           Control Enhancements: None.

           References: NIST Special Publication 800-37.
