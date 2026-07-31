# JSIG Chapter 3 Configuration Management (CM) Family

Source URL: https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Archived source (used for extraction, direct URL returns HTTP 403): http://web.archive.org/web/20260405054539/https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Extraction note: Verbatim extraction via `pdftotext -layout` against the complete 378-page JSIG PDF (retrieved 2026-07-17 from the Wayback Machine snapshot below, since the direct DCSA URL returns HTTP 403). This supersedes any prior lower-fidelity extraction of this section. Running page headers/footers inserted by the PDF layout have been stripped; no wording has been added, summarized, or altered.

---

FAMILY: CONFIGURATION MANAGEMENT

CM-1      CONFIGURATION MANAGEMENT POLICY AND PROCEDURES

          Control: The organization:

          a.     Develops, documents, and disseminates to [Assignment: organization-defined personnel or roles]:
                 1.   A configuration management policy that addresses purpose, scope, roles, responsibilities,
                      management commitment, coordination among organizational entities, and compliance; and
                 2.   Procedures to facilitate the implementation of the configuration management policy and associated
                      configuration management controls; and
          b.     Reviews and updates the current:
                 1.   Configuration management policy at least annually; and
                 2.   Configuration management procedures at least annually.
          Supplemental Guidance: This control addresses the establishment of policy and procedures for the effective
          implementation of selected security controls and control enhancements in the CM family. Policy and
          procedures reflect applicable federal laws, Executive Orders, directives, regulations, policies, standards,
          and guidance. Security program policies and procedures at the organization level may make the need for
          system-specific policies and procedures unnecessary. The policy can be included as part of the general
          information security policy for organizations or conversely, can be represented by multiple policies
          reflecting the complex nature of certain organizations. The procedures can be established for the security
          program in general and for particular information systems, if needed. The organizational risk management
          strategy is a key factor in establishing policy and procedures. Related control: PM-9.
               DoD SAP-specific policy and procedures related to CM are defined in the remainder of this
               section.
          Control Enhancements: None.

          References: NIST Special Publications 800-12, 800-100.

CM-2      BASELINE CONFIGURATION

          Control: The organization develops, documents, and maintains under configuration control, a current
          baseline configuration of the information system.
          Supplemental Guidance: This control establishes baseline configurations for information systems and system
          components including communications and connectivity-related aspects of systems. Baseline
          configurations are documented, formally reviewed and agreed-upon sets of specifications for information
          systems or configuration items within those systems. Baseline configurations serve as a basis for future
          builds, releases, and/or changes to information systems. Baseline configurations include information about
          information system components (e.g., standard software packages installed on workstations, notebook
          computers, servers, network components, or mobile devices; current version numbers and patch
          information on operating systems and applications; and configuration settings/parameters), network
          topology, and the logical placement of those components within the system architecture. Maintaining
          baseline configurations requires creating new baselines as organizational information systems change over
          time. Baseline configurations of information systems reflect the current enterprise architecture. Related
          controls: CM-3, CM-6, CM-8, CM-9, SA-10, PM-5, PM-7.
               Baseline configuration includes the documentation required in CM-6 (including
               configuration settings and hardening applied to the system and software), CM-7 (including
               requirements for whitelisting software) and CM-8 (hardware inventory).
               Reference Supply Chain Protection [SA-12] and the AO’s recommended software approval
               process prior to acquisition of software. All non-US developed software requires AO
               approval prior to procurement.

               Foreign Ownership, Control, and Influence (FOCI) review must be accomplished for any
               hardware/software introduction, version change or upgrade not previously approved for use
               on SAP systems. Hardware/software procured through non-DoD channels, or which may
               have a foreign origin, may only be used with an appropriate justification and AO approval.

               A baseline configuration may represent different information computing environments such
               as development, test, and production. Organizations shall maintain a baseline configuration
               for development and test environments that is managed separately from the operational
               baseline configuration.
               ISOs must ensure that software included on an IS baseline is managed. Document means of
               system copyright and IP compliance mechanisms within CM-10.
          Control Enhancements:
          (1)    BASELINE CONFIGURATION | REVIEWS AND UPDATES
                 The organization reviews and updates the baseline configuration of the information system:
                 (a)   At least annually;
                 (b) When required due to significant or security relevant changes or security incidents occur; and
                 (c)   As an integral part of information system component installations and upgrades.
                 Supplemental Guidance: Related control: CM-5.
          (2)    BASELINE CONFIGURATION | AUTOMATION SUPPORT FOR ACCURACY / CURRENCY
                 The organization employs automated mechanisms to maintain an up-to-date, complete, accurate, and readily
                 available baseline configuration of the information system.
                 Supplemental Guidance: Automated mechanisms that help organizations maintain consistent baseline
                 configurations for information systems include, for example, hardware and software inventory tools,
                 configuration management tools, and network management tools. Such tools can be deployed and/or
                 allocated as common controls, at the information system level, or at the operating system or
                 component level (e.g., on workstations, servers, notebook computers, network components, or mobile
                 devices). Tools can be used, for example, to track version numbers on operating system applications,
                 types of software installed, and current patch levels. This control enhancement can be satisfied by the
                 implementation of CM-8 (2) for organizations that choose to combine information system component
                 inventory and baseline configuration activities. Related controls: CM-7, RA-5.
          (3)    BASELINE CONFIGURATION | RETENTION OF PREVIOUS CONFIGURATIONS
                 The organization retains at least two previous versions of baseline configurations of the information system to
                 support rollback.
                 Supplemental Guidance: Retaining previous versions of baseline configurations to support rollback may
                 include, for example, hardware, software, firmware, configuration files, and configuration records.
          (4)    BASELINE CONFIGURATION | UNAUTHORIZED SOFTWARE
                 [Withdrawn: Incorporated into CM-7].
          (5)    BASELINE CONFIGURATION | AUTHORIZED SOFTWARE
                 [Withdrawn: Incorporated into CM-7].
          (6)    BASELINE CONFIGURATION | DEVELOPMENT AND TEST ENVIRONMENTS
                 The organization maintains a baseline configuration for information system development and test environments that
                 is managed separately from the operational baseline configuration.
                 Supplemental Guidance: Establishing separate baseline configurations for development, testing, and
                 operational environments helps protect information systems from unplanned/unexpected events related
                 to development and testing activities. Separate baseline configurations allow organizations to apply the
                 configuration management that is most appropriate for each type of configuration. For example,
                 management of operational configurations typically emphasizes the need for stability, while
                 management of development/test configurations requires greater flexibility. Configurations in the test
                 environment mirror the configurations in the operational environment to the extent practicable so that
                 the results of the testing are representative of the proposed changes to the operational systems. This

                control enhancement requires separate configurations but not necessarily separate physical
                environments. Related controls: CM-4, SC-3, SC-7.
          (7)   BASELINE CONFIGURATION | CONFIGURE SYSTEMS, COMPONENTS, OR DEVICES FOR HIGH-RISK AREAS
                The organization:
                (a)   Issues [Assignment: organization-defined information systems, system components, or devices] with
                      [Assignment: organization-defined configurations] to individuals traveling to locations that the organization
                      deems to be of significant risk; and
                (b) Applies [Assignment: organization-defined security safeguards] to the devices when the individuals return.
                Supplemental Guidance: When it is known that information systems, system components, or devices
                (e.g., notebook computers, mobile devices) will be located in high-risk areas, additional security
                controls may be implemented to counter the greater threat in such areas coupled with the lack of
                physical security relative to organizational-controlled areas. For example, organizational policies and
                procedures for notebook computers used by individuals departing on and returning from travel include,
                for example, determining which locations are of concern, defining required configurations for the
                devices, ensuring that the devices are configured as intended before travel is initiated, and applying
                specific safeguards to the device after travel is completed. Specially configured notebook computers
                include, for example, computers with sanitized hard drives, limited applications, and additional
                hardening (e.g., more stringent configuration settings). Specified safeguards applied to mobile devices
                upon return from travel include, for example, examining the device for signs of physical tampering and
                purging/reimaging the hard disk drive. Protecting information residing on mobile devices is covered in
                the media protection family.
                 SAP Systems leaving the facility should ensure that integrity configuration settings are
                 applied. (Example: using Trusted Platform Module (TPM) or Secure Boot functions)
          References: NIST Special Publication 800-128.

CM-3      CONFIGURATION CHANGE CONTROL

          Control: The organization:

          a.    Determines the types of changes to the information system that are configuration-controlled;
          b.    Reviews proposed configuration-controlled changes to the information system and approves or
                disapproves such changes with explicit consideration for security impact analyses;
          c.    Documents configuration change decisions associated with the information system;
          d.    Implements approved configuration-controlled changes to the information system;
          e.    Retains records of configuration-controlled changes to the information system for one (1) year or one
                (1) security review cycle, whichever is longer;
          f.    Audits and reviews activities associated with configuration-controlled changes to the information
                system; and
          g.    Coordinates and provides oversight for configuration change control activities through [Assignment:
                organization-defined configuration change control element (e.g., committee, board)] that convenes
                [Selection (one or more): [Assignment: organization-defined frequency]; [Assignment: organization-
                defined configuration change conditions]].
          Supplemental Guidance: Configuration change controls for organizational information systems involve the
          systematic proposal, justification, implementation, testing, review, and disposition of changes to the
          systems, including system upgrades and modifications. Configuration change control includes changes to
          baseline configurations for components and configuration items of information systems, changes to
          configuration settings for information technology products (e.g., operating systems, applications, firewalls,
          routers, and mobile devices), unscheduled/unauthorized changes, and changes to remediate vulnerabilities.
          Typical processes for managing configuration changes to information systems include, for example,
          Configuration Control Boards that approve proposed changes to systems. For new development
          information systems or systems undergoing major upgrades, organizations consider including

          representatives from development organizations on the Configuration Control Boards. Auditing of changes
          includes activities before and after changes are made to organizational information systems and the
          auditing activities required to implement such changes. Related controls: CA-7, CM-2, CM-4, CM-5, CM-
          6, CM-9, SA-10, SI-2, SI-12.
               All hardware and software changes to DoD SAP IS must go through a configuration change
               control process. Configuration change control is the documented process for managing and
               controlling changes to the configuration of an IS.
               Security Relevant – any hardware or software that is “security enforcing,” “security
               supporting,” or “security non-interfering” which can affect an IS’s configuration,
               functionality, or users’ privileges, and has the potential to change the risk imposed on the IS.
               • Security Enforcing – Operating System (OS), access control applications, audit
                   applications, device control applications, second party applications that perform IA,
                   account management, anti-virus, firewall; capable of making changes to the security
                   substructure of the system: modifies a user’s account or changes permissions on objects
                   such as enforcing Discretionary access Control (DAC), Mandatory Access Control
                   (MAC), Network Access Control (NAC).
               • Security Supporting – Impacts a security process or procedures: e.g., software used to
                   perform technical review for AFT; software that is only used by privileged users of the
                   system in the performance of their duties; removing a backup server which may affect
                   availability; code or script that authenticates the user and determines authorization.
               • Security Non-Interfering – Does not enforce or support any aspect of the system
                   security policy, but due to its presence inside the security boundary, e.g., code running a
                   privileged hardware mode within the OS, risk is elevated.
               Significant security-relevant changes will require assessment and may require re-
               authorization of the information system. A concept of operations or revised SSP will be
               submitted to the AO for approval outlining the implementation and assessment process.

               Documented AO authorization is required prior to implementing a security-relevant change,
               examples (not all-inclusive) include:
                  • Changes that modify the security support structure.
                  • Operating system changes (e.g., Windows 7 to Windows 10).
                  • Security Relevant software version upgrades (e.g., Update to Microsoft Office
                      beyond AFT tool capabilities, firmware update for security appliances).
                  • Addition of security relevant software not previously approved for the systems.
                  • Addition of new server function.
                  • New hardware models
                  • Modification to system ports, protocols and services (PPS).
                  • Major vulnerabilities discovered after assessment and/or authorization.
                  • Changes to the confidentiality, integrity, or availability requirements (e.g., changing
                      from a moderate impact level to high impact level).
                  • Changes in system encryption methods.
                  • Changes to interconnections.
                  • Changes to operating environment (e.g., external information system introduces
                      media capability; introduction of Voice over Internet Protocol (IP) (VoIP) (classified
                      or unclassified); foreign nationals move in next door; system is relocated).
                  • Significant increased threat increasing the organization/site’s residual risk.

               Minor and non-security relevant hardware and software changes to information systems may

               require AO authorization. These upgrades require an administrative update to the SSP.
               Examples of non-security-relevant changes include:
                   • Non-security relevant software version updates and/or upgrades.
                   • Addition of identical workstation type with approved image to an authorized system.
                   • Replacement of failed servers/system components with identical spares.
                   • Replacement of hard drives/tape back-up.

               The addition of any server/workstation identified in the paragraph above requires the
               ISSM/ISSO to review the test results pre and post connection to ensure the information
               system has been configured in accordance with the approved artifacts. If in doubt on the
               significance of a change, the SCA shall be contacted to determine whether a change is
               significant.
               A Configuration Control Board (CCB) acts as a check and balance on configuration change
               activity, assuring that proposed changes are held to organizationally defined criteria (e.g.,
               scope, cost, impact on security) before being implemented. CM-3 g. organization-defined
               values should establish the element responsible for approving change. A CCB can be as big
               or small as it needs to be for the information system environment that it supports.
               Since the ISSM is responsible for halting practices dangerous to security, the ISSM shall
               have authority to veto any proposed change he/she believes to be detrimental to security. In
               cases of disagreement, the change shall be postponed while the ISO or ISSM contacts the
               AO’s office for resolution. Reference CA-6.
               Modifying, relocating, or reconfiguring the hardware of any computer system must be
               approved by the CCB for each site. Hardware will not be connected to any system/network
               without the express written consent of the ISSM/ISSO and the CCB.

               Modifying, installing, or downloading any software on any computer system may affect
               system authorization and must be evaluated and approved by the ISSM/ISSO with the local
               CCB.
          Control Enhancements:
          (1)    CONFIGURATION CHANGE CONTROL | AUTOMATED DOCUMENT / NOTIFICATION / PROHIBITION OF CHANGES
                 The organization employs automated mechanisms to:
                 (a) Document proposed changes to the information system;
                 (b) Notify [Assignment: organized-defined approval authorities] of proposed changes to the information system and
                     request change approval;
                 (c)   Highlight proposed changes to the information system that have not been approved or disapproved by
                       [Assignment: organization-defined time period];
                 (d) Prohibit changes to the information system until designated approvals are received;
                 (e)   Document all changes to the information system; and
                 (f)   Notify [Assignment: organization-defined personnel] when approved changes to the information system are
                       completed.
          (2)    CONFIGURATION CHANGE CONTROL | TEST / VALIDATE / DOCUMENT CHANGES
                 The organization tests, validates, and documents changes to the information system before implementing the
                 changes on the operational system.
                 Supplemental Guidance: Changes to information systems include modifications to hardware, software, or
                 firmware components and configuration settings defined in CM-6. Organizations ensure that testing
                 does not interfere with information system operations. Individuals/groups conducting tests understand
                 organizational security policies and procedures, information system security policies and procedures,
                 and the specific health, safety, and environmental risks associated with particular facilities/processes.
                 Operational systems may need to be taken off-line, or replicated to the extent feasible, before testing

                  can be conducted. If information systems must be taken off-line for testing, the tests are scheduled to
                  occur during planned system outages whenever possible. If testing cannot be conducted on operational
                  systems, organizations employ compensating controls (e.g., testing on replicated systems).
          (3)     CONFIGURATION CHANGE CONTROL | AUTOMATED CHANGE IMPLEMENTATION
                  The organization employs automated mechanisms to implement changes to the current information system baseline
                  and deploys the updated baseline across the installed base.
          (4)     CONFIGURATION CHANGE CONTROL | SECURITY REPRESENTATIVE
                  The organization requires an information security representative to be a member of the configuration change
                  control element defined in CM-3 g.
                  Supplemental Guidance: Information security representatives can include, for example, senior agency
                  information security officers, information system security officers, or information system security
                  managers. Representation by personnel with information security expertise is important because
                  changes to information system configurations can have unintended side effects, some of which may be
                  security-relevant. Detecting such changes early in the process can help avoid unintended, negative
                  consequences that could ultimately affect the security state of organizational information systems. The
                  configuration change control element in this control enhancement reflects the change control elements
                  defined by organizations in CM-3.
                   As indicated in JSIG, Section 1.5.14.q, ISSM responsibilities include serving as a
                   member of the CCB.
          (5)     CONFIGURATION CHANGE CONTROL | AUTOMATED SECURITY RESPONSE
                  The information system implements [Assignment: organization-defined security responses] automatically if baseline
                  configurations are changed in an unauthorized manner.
                  Supplemental Guidance: Security responses include, for example, halting information system processing,
                  halting selected system functions, or issuing alerts/notifications to organizational personnel when there
                  is an unauthorized modification of a configuration item.
          (6)     CONFIGURATION CHANGE CONTROL | CRYPTOGRAPHY MANAGEMENT
                  The organization ensures that cryptographic mechanisms used to provide safeguarding of classified information
                  from unauthorized access or modification are under configuration management.
                  Supplemental Guidance: Regardless of the cryptographic means employed (e.g., public key, private key,
                  shared secrets), organizations ensure that there are processes and procedures in place to effectively
                  manage those means. For example, if devices use certificates as a basis for identification and
                  authentication, there needs to be a process in place to address the expiration of those certificates.
                  Related control: SC-13.
          References: NIST Special Publication 800-128.

CM-4      SECURITY IMPACT ANALYSIS

          Control: The organization analyzes changes to the information system to determine potential security
          impacts prior to change implementation.
          Supplemental Guidance: Organizational personnel with information security responsibilities (e.g.,
          Information System Administrators, Information System Security Officers, Information System Security
          Managers, and Information System Security Engineers) conduct security impact analyses. Individuals
          conducting security impact analyses possess the necessary skills/technical expertise to analyze the changes
          to information systems and the associated security ramifications. Security impact analysis may include, for
          example, reviewing security plans to understand security control requirements and reviewing system design
          documentation to understand control implementation and how specific changes might affect the controls.
          Security impact analyses may also include assessments of risk to better understand the impact of the
          changes and to determine if additional security controls are required. Security impact analyses are scaled in
          accordance with the security categories of the information systems. Related controls: CA-2, CA-7, CM-3,
          CM-9, SA-4, SA-5, SA-10, SI-2.
               Security impact analysis is the deliberate consideration of the impact of a change on the
               security state of the information system. ISs are typically in a constant state of change, it is

               important to understand the impact of changes on the functionality of existing security
               controls. Security impact analysis must be incorporated into the documented configuration
               change control process. The ISSM/ISSO shall be involved in determining if a configuration
               change has a security impact. Factors considered in assessing software risk involve:
                 1. Importation of malicious content
                         This is essentially a supply chain issue. Although we perceive that US sources are
                         less likely to target the US, with multi-national firms and commercial open source,
                         software (like hardware) comes from everywhere. That said, most of the
                         repositories attempt to be malware free.
                 2. Importation of vulnerable content
                         This factor relates to code quality including software assurance that the libraries
                         used by applications are updated and that latent vulnerabilities in the executables
                         are addressed/mitigated/removed.
                 3. Remediation of functional or security deficiencies in operational software
                         This factor addresses effective sustainment to determine if the developer addresses
                         identified vulnerabilities in a timely manner. It’s not uncommon to have open
                         source firms have patches posted in a few days where the commercial firms may
                         lag for months. When developers and vendors abandon products (for various
                         reasons), it can leave the consumer with orphan or zombie software. It can take
                         deep pockets to pay for sustainment and delay an end-of-life deadline.
                 4. Legal compliance
                         Licensing, copyrights, and intellectual property rights vary dependent on the
                         software type, e.g., open source software, commercial off-the-shelf (COTS).
                 5. Costs of the four factors above
                         Cost is often linked to platform and applications. For example, open source
                         software is more common in the *nix environments (e.g., UNIX, LINIX), than in
                         Windows, where the greatest cost tends to be for sustainment and licensing.

               Hardware tends to follow a similar process with an additional focus on whether a device
               contains non-volatile memory and malicious content.
               SAP systems with moderate and high integrity are required to have a test environment.
               Integrity low systems should consider impact of the change to their operational environment
               and ensure the change is implemented in the least disruptive manner.
               If the security impact analysis results in significant security-relevant changes, documented
               approval is required from the AO in accordance with (IAW) CM-3. Reference CA-6.
          Control Enhancements:
          (1)    SECURITY IMPACT ANALYSIS | SEPARATE TEST ENVIRONMENTS
                 The organization analyzes changes to the information system in a separate test environment before implementation
                 in an operational environment, looking for security impacts due to flaws, weaknesses, incompatibility, or intentional
                 malice.
                 Supplemental Guidance: Separate test environment in this context means an environment that is
                 physically or logically isolated and distinct from the operational environment. The separation is
                 sufficient to ensure that activities in the test environment do not impact activities in the operational
                 environment, and information in the operational environment is not inadvertently transmitted to the test
                 environment. Separate environments can be achieved by physical or logical means. If physically
                 separate test environments are not used, organizations determine the strength of mechanism required
                 when implementing logical separation (e.g., separation achieved through virtual machines). Related
                 controls: SA-11, SC-3, SC-7.
          (2)    SECURITY IMPACT ANALYSIS | VERIFICATION OF SECURITY FUNCTIONS

                 The organization, after the information system is changed, checks the security functions to verify that the functions
                 are implemented correctly, operating as intended, and producing the desired outcome with regard to meeting the
                 security requirements for the system.
                 Supplemental Guidance: Implementation is this context refers to installing changed code in the
                 operational information system. Related control: SA-11.
          References: NIST Special Publication 800-128.

CM-5      ACCESS RESTRICTIONS FOR CHANGE

          Control: The organization defines, documents, approves, and enforces physical and logical access
          restrictions associated with changes to the information system.
          Supplemental Guidance: Any changes to the hardware, software, and/or firmware components of information
          systems can potentially have significant effects on the overall security of the systems. Therefore,
          organizations permit only qualified and authorized individuals to access information systems for purposes
          of initiating changes, including upgrades and modifications. Organizations maintain records of access to
          ensure that configuration change control is implemented and to support after-the-fact actions should
          organizations discover any unauthorized changes. Access restrictions for change also include software
          libraries. Access restrictions include, for example, physical and logical access controls (see AC-3 and PE-
          3), workflow automation, media libraries, abstract layers (e.g., changes implemented into third-party
          interfaces rather than directly into information systems), and change windows (e.g., changes occur only
          during specified times, making unauthorized changes easy to discover). Related controls: AC-3, AC-6, PE-
          3.
               Access restrictions for change represent the enforcement side of security configuration
               management. Configuration change control is a process for funneling changes to an IS
               through a managed process; however, without access restrictions, there is nothing preventing
               someone from implementing changes outside the process. Access restrictions are a
               mechanism to enforce configuration control processes by controlling who has access to the
               IS to make changes.
               Organizations are responsible for conducting scans or audits to validate configuration
               changes were implemented as intended and for supporting after-the-fact actions if
               unauthorized changes to the IS are detected.
          Control Enhancements:
          (1)    ACCESS RESTRICTIONS FOR CHANGE | AUTOMATED ACCESS ENFORCEMENT / AUDITING
                 The information system enforces access restrictions and supports auditing of the enforcement actions.
                 Supplemental Guidance: Related controls: AU-2, AU-12, AU-6, CM-3, CM-6.
          (2)    ACCESS RESTRICTIONS FOR CHANGE | REVIEW SYSTEM CHANGES
                 The organization reviews information system changes every 90 days or more frequently as the organization
                 defines for high integrity systems AND at least annually or more frequently as the organization defines for
                 low integrity and moderate integrity systems and when there is an incident or when planned changes have
                 been performed to determine whether unauthorized changes have occurred.
                 Supplemental Guidance: Indications that warrant review of information system changes and the specific
                 circumstances justifying such reviews may be obtained from activities carried out by organizations
                 during the configuration change process. Related controls: AU-6, AU-7, CM-3, CM-5, PE-6, PE-8.
          (3)    ACCESS RESTRICTIONS FOR CHANGE | SIGNED COMPONENTS
                 The information system prevents the installation of all digitally signed software and firmware products without
                 verification that the component has been digitally signed using a certificate that is recognized and approved by the
                 organization.
                 Supplemental Guidance: Software and firmware components prevented from installation unless signed
                 with recognized and approved certificates include, for example, software and firmware version
                 updates, patches, service packs, device drivers, and basic input output system (BIOS) updates.
                 Organizations can identify applicable software and firmware components by type, by specific items, or

                a combination of both. Digital signatures and organizational verification of such signatures, is a
                method of code authentication. Related controls: CM-7, SC-13, SI-7.
          (4)   ACCESS RESTRICTIONS FOR CHANGE | DUAL AUTHORIZATION
                The organization enforces dual authorization for implementing changes to [Assignment: organization-defined
                information system components and system-level information].
                Supplemental Guidance: Organizations employ dual authorization to ensure that any changes to selected
                information system components and information cannot occur unless two qualified individuals
                implement such changes. The two individuals possess sufficient skills/expertise to determine if the
                proposed changes are correct implementations of approved changes. Dual authorization may also be
                known as two-person control. Related controls: AC-5, CM-3.
          (5)   ACCESS RESTRICTIONS FOR CHANGE | LIMIT PRODUCTION / OPERATIONAL PRIVILEGES
                The organization:
                (a) Limits privileges to change information system components and system-related information within a production
                    or operational environment; and
                (b) Reviews and reevaluates privileges at least quarterly.
                Supplemental Guidance: In many organizations, information systems support multiple core
                missions/business functions. Limiting privileges to change information system components with
                respect to operational systems is necessary because changes to a particular information system
                component may have far-reaching effects on mission/business processes supported by the system
                where the component resides. The complex, many-to-many relationships between systems and
                mission/business processes are in some cases, unknown to developers. Related control: AC-2.
          (6)   ACCESS RESTRICTIONS FOR CHANGE | LIMIT LIBRARY PRIVILEGES
                The organization limits privileges to change software resident within software libraries.
                Supplemental Guidance: Software libraries include privileged programs. Related control: AC-2.
          (7)   ACCESS RESTRICTIONS FOR CHANGE | AUTOMATIC IMPLEMENTATION OF SECURITY SAFEGUARDS
                [Withdrawn: Incorporated into SI-7].

          References: None.

CM-6      CONFIGURATION SETTINGS

          Control: The organization:

          a.    Establishes and documents configuration settings for information technology products employed
                within the information system using organizationally approved guides such as DoD SRGs, STIGs,
                NIST Security Configuration Checklists, Service specific guidance or NSA SCGs; if such a
                reference document is not available, the following are acceptable in descending order as
                available: (1) Commercially accepted practices (e.g., SANS) (2) Independent testing results (e.g.,
                ICSA) or (3) Vendor literature that reflect the most restrictive mode consistent with operational
                requirements;
          b.    Implements the configuration settings;
          c.    Identifies, documents, and approves any deviations from established configuration settings for all
                configurable information system components based on [Assignment: organization-defined
                operational requirements]; and
          d.    Monitors and controls changes to the configuration settings in accordance with organizational policies
                and procedures.
          Supplemental Guidance: Configuration settings are the set of parameters that can be changed in hardware,
          software, or firmware components of the information system that affect the security posture and/or
          functionality of the system. Information technology products for which security-related configuration
          settings can be defined include, for example, mainframe computers, servers (e.g., database, electronic mail,
          authentication, web, proxy, file, domain name), workstations, input/output devices (e.g., scanners, copiers,
          and printers), network components (e.g., firewalls, routers, gateways, voice and data switches, wireless
          access points, network appliances, sensors), operating systems, middleware, and applications. Security-

          related parameters are those parameters impacting the security state of information systems including the
          parameters required to satisfy other security control requirements. Security-related parameters include, for
          example: (i) registry settings; (ii) account, file, directory permission settings; and (iii) settings for functions,
          ports, protocols, services, and remote connections. Organizations establish organization-wide configuration
          settings and subsequently derive specific settings for information systems. The established settings become
          part of the systems configuration baseline.
          Common secure configurations (also referred to as security configuration checklists, lockdown and
          hardening guides, security reference guides, security technical implementation guides) provide recognized,
          standardized, and established benchmarks that stipulate secure configuration settings for specific
          information technology platforms/products and instructions for configuring those information system
          components to meet operational requirements. Common secure configurations can be developed by a
          variety of organizations including, for example, information technology product developers, manufacturers,
          vendors, consortia, academia, industry, federal agencies, and other organizations in the public and private
          sectors. Common secure configurations include the United States Government Configuration Baseline
          (USGCB) which affects the implementation of CM-6 and other controls such as AC-19 and CM-7. The
          Security Content Automation Protocol (SCAP) and the defined standards within the protocol (e.g.,
          Common Configuration Enumeration) provide an effective method to uniquely identify, track, and control
          configuration settings. OMB establishes federal policy on configuration requirements for federal
          information systems. Related controls: AC-19, CM-2, CM-3, CM-7, SI-4.
               The information system must conform to security configuration guidance (i.e., security
               checklists), prior to being introduced into a production environment. Exceptions from the
               mandatory configuration settings for individual components within the IS based on explicit
               operational requirements require AO approval and should be revalidated by the organization
               IAW continuous monitoring plan.

               Organizations shall monitor and control changes to the configuration settings. Any detected
               unauthorized security-relevant configuration changes to an information system must be
               documented and reported as a possible incident. See also the Incident Response family.
          Control Enhancements:
          (1)    CONFIGURATION SETTINGS | AUTOMATED CENTRAL MANAGEMENT / APPLICATION / VERIFICATION
                 The organization employs automated mechanisms to centrally manage, apply, and verify configuration settings for
                 [Assignment: organization-defined information system components].
                 Supplemental Guidance: Related controls: CA-7, CM-4.
          (2)    CONFIGURATION SETTINGS | RESPOND TO UNAUTHORIZED CHANGES
                 The organization employs [Assignment: organization-defined security safeguards] to respond to unauthorized
                 changes to [Assignment: organization-defined configuration settings].
                 Supplemental Guidance: Responses to unauthorized changes to configuration settings can include, for
                 example, alerting designated organizational personnel, restoring established configuration settings, or
                 in extreme cases, halting affected information system processing. Related controls: IR-4, SI-7.
          (3)    CONFIGURATION SETTINGS | UNAUTHORIZED CHANGE DETECTION
                  [Withdrawn: Incorporated into SI-7].
          (4)    CONFIGURATION SETTINGS | CONFORMANCE DEMONSTRATION
                  [Withdrawn: Incorporated into CM-4].

          References: OMB Memoranda 07-11, 07-18, 08-22; NIST Special Publications 800-70, 800-128; Web:
          http://nvd.nist.gov, http://checklists.nist.gov, http://www.nsa.gov.
               Reference: DISA maintained Secure Host Baseline (SHB) repository
               https://disa.deps.mil/ext/cop/iase/dod-images/Pages/index.aspx (from a .mil domain)
               DISA STIGs: http://iase.disa.mil/stigs/Pages/index.aspx (CAC or PIV required)

CM-7      LEAST FUNCTIONALITY

          Control: The organization:

                 a.    Configures the information system to provide only essential capabilities; and
                 b.    Prohibits or restricts the use of the following functions, ports, protocols, and/or services:
                       [Assignment: organization-defined prohibited or restricted functions, ports, protocols, and/or
                       services].
          Supplemental Guidance: Information systems can provide a wide variety of functions and services. Some of
          the functions and services, provided by default, may not be necessary to support essential organizational
          operations (e.g., key missions, functions). Additionally, it is sometimes convenient to provide multiple
          services from single information system components, but doing so increases risk over limiting the services
          provided by any one component. Where feasible, organizations limit component functionality to a single
          function per device (e.g., email servers or web servers, but not both). Organizations review functions and
          services provided by information systems or individual components of information systems, to determine
          which functions and services are candidates for elimination (e.g., Voice Over Internet Protocol, Instant
          Messaging, auto-execute, and file sharing). Organizations consider disabling unused or unnecessary
          physical and logical ports/protocols (e.g., Universal Serial Bus, File Transfer Protocol, and Hyper Text
          Transfer Protocol) on information systems to prevent unauthorized connection of devices, unauthorized
          transfer of information, or unauthorized tunneling. Organizations can utilize network scanning tools,
          intrusion detection and prevention systems, and end-point protections such as firewalls and host-based
          intrusion detection systems to identify and prevent the use of prohibited functions, ports, protocols, and
          services. Related controls: AC-6, CM-2, RA-5, SA-5, SC-7.
               Least functionality helps to minimize the potential for introduction of security vulnerabilities
               and includes, but is not limited to, disabling or uninstalling unused/unnecessary operating
               system (OS) functionality, protocols, ports, and services, and limiting the software that can
               be installed and the functionality of that software.

               Organizations shall:
                   •    Configure information systems and components to provide only essential
                        capabilities. This includes allowing only the necessary ports, protocols, and services
                        in accordance with functional needs, as defined in DoDI 8551.1, Ports, Protocols,
                        and Services Management (PPSM) and DISA STIGs. This requirement must also
                        consider the risk tolerance of the organization.
                   •    Obtain and ensure compliance with the latest guidance regarding ports, protocols,
                        and services.
                   •    Configure information systems and components to disable the capability for
                        automatic execution of code (e.g., AutoRun, AutoPlay).

          Control Enhancements:
          (1)    LEAST FUNCTIONALITY | PERIODIC REVIEW
                 The organization:
                 (a)   Reviews the information system at least annually or as system changes or incidents occur to identify
                       unnecessary and/or nonsecure functions, ports, protocols, and services; and
                 (b) Disables all functions, ports, protocols, and services within the information system deemed to be
                     unnecessary and/or nonsecure.
                 Supplemental Guidance: The organization can either make a determination of the relative security of the
                 function, port, protocol, and/or service or base the security decision on the assessment of other entities.
                 Bluetooth, FTP, and peer-to-peer networking are examples of less than secure protocols. Related
                 controls: AC-18, CM-7, IA-2.

          (2)   LEAST FUNCTIONALITY | PREVENT PROGRAM EXECUTION
                The information system prevents program execution in accordance with [Selection (one or more): [Assignment:
                organization-defined policies regarding software program usage and restrictions]; rules authorizing the terms and
                conditions of software program usage].
                Supplemental Guidance: Related controls: CM-8, PM-5.

                 Systems prevent program execution from organizationally specific locations: (e.g.,
                 removable media, temporary directory, a shared network drive, etc.)
          (3)   LEAST FUNCTIONALITY | REGISTRATION COMPLIANCE
                The organization ensures compliance with [Assignment: organization-defined registration requirements for functions,
                ports, protocols, and services].
                Supplemental Guidance: Organizations use the registration process to manage, track, and provide
                oversight for information systems and implemented functions, ports, protocols, and services.
          (4)   LEAST FUNCTIONALITY | UNAUTHORIZED SOFTWARE / BLACKLISTING
                The organization:
                (a) Identifies [Assignment: organization-defined software programs not authorized to execute on the information
                    system];
                (b) Employs an allow-all, deny-by-exception policy to prohibit the execution of unauthorized software programs on
                    the information system; and
                (c)   Reviews and updates the list of unauthorized software programs at least annually.
                Supplemental Guidance: The process used to identify software programs that are not authorized to
                execute on organizational information systems is commonly referred to as blacklisting. Organizations
                can implement CM-7 (5) instead of this control enhancement if whitelisting (the stronger of the two
                policies) is the preferred approach for restricting software program execution. Related controls: CM-6,
                CM-8, PM-5.
          (5)   LEAST FUNCTIONALITY | AUTHORIZED SOFTWARE / WHITELISTING
                The organization:
                (a)   Identifies [Assignment: organization-defined software programs authorized to execute on the information
                      system];
                (b) Employs a deny-all, permit-by-exception policy to allow the execution of authorized software programs on the
                    information system; and
                (c)   Reviews and updates the list of authorized software programs at least annually.
                Supplemental Guidance: The process used to identify software programs that are authorized to execute
                on organizational information systems is commonly referred to as whitelisting. In addition to
                whitelisting, organizations consider verifying the integrity of white-listed software programs using, for
                example, cryptographic checksums, digital signatures, or hash functions. Verification of white-listed
                software can occur either prior to execution or at system startup. Related controls: CM-2, CM-6, CM-
                8, PM-5, SA-10, SC-34, SI-7.
                 The organization develops and maintains an approved software list, for a specific
                 information system. Change to this list is managed within CM-3.

                 Demonstration software is any software used for demonstrations, with the intent of
                 being returned to the vendor and must be processed on a computer that has never
                 processed or stored classified information.

                 Unauthorized software – All software must have a valid mission requirement. Types of
                 software that are not authorized and must be waived in writing by the AO prior to
                 introduction the SAP IS include:
                     • Games
                     • Public domain software or “shareware” which is obtained from unofficial
                         channels (as defined by CNSSI 4009), any software not protected by copyright
                         laws of any nation that may be freely used without permission of, or payment to

                            the creator, and that carries no warranties from, or liabilities to the creator.
                       •    All software applications which have been developed outside government-
                            approved facilities, such as those developed on personally owned computers at
                            home or software acquired via non-government ‘bulletin boards
                       •    Personally owned software or software purchased using employee funds (either
                            purchased or gratuitously acquired)
                       •    Software from unknown sources
                       •    Illegally copied software in violation of copyright rules
                       •    Software used for purposes other than allowed and specified in the End User
                            License Agreement (EULA).
                       •    Music and video or multimedia compact disks not procured through official
                            Government channels
                       •    Software used to conduct business outside of official government duties
          References: DoD Instruction 8551.01.

CM-8      INFORMATION SYSTEM COMPONENT INVENTORY

          Control: The organization:

          a.     Develops and documents an inventory of information system components that:
                 1.   Accurately reflects the current information system;
                 2.   Includes all components within the authorization boundary of the information system;
                 3.   Is at the level of granularity deemed necessary for tracking and reporting; and
                 4.   Includes minimally but not limited to: hardware specifications (manufacturer, type, model,
                      serial number, physical location), software and software license information, information
                      system/component owner, and for a networked component/device, the machine name; and
          b.     Reviews and updates the information system component inventory at least annually
          Supplemental Guidance: Organizations may choose to implement centralized information system component
          inventories that include components from all organizational information systems. In such situations,
          organizations ensure that the resulting inventories include system-specific information required for proper
          component accountability (e.g., information system association, information system owner). Information
          deemed necessary for effective accountability of information system components includes, for example,
          hardware inventory specifications, software license information, software version numbers, component
          owners, and for networked components or devices, machine names and network addresses. Inventory
          specifications include, for example, manufacturer, device type, model, serial number, and physical location.
          Related controls: CM-2, CM-6, PM-5.
               The IS component inventory is a list of the physically identifiable components within an IS.
               The inventory must be available for review and audit by designated organizational officials.
               Each IS component should be associated with only one IS and the authority over and
               responsibility for each IS component should be with only one ISO (i.e., every item in the IS
               component inventory should fall within the authorization boundary of a single IS).
          Control Enhancements:
          (1)    INFORMATION SYSTEM COMPONENT INVENTORY | UPDATES DURING INSTALLATIONS / REMOVALS
                 The organization updates the inventory of information system components as an integral part of component
                 installations, removals, and information system updates.
          (2)    INFORMATION SYSTEM COMPONENT INVENTORY | AUTOMATED MAINTENANCE
                 The organization employs automated mechanisms to help maintain an up-to-date, complete, accurate, and readily
                 available inventory of information system components.

                Supplemental Guidance: Organizations maintain information system inventories to the extent feasible.
                Virtual machines, for example, can be difficult to monitor because such machines are not visible to the
                network when not in use. In such cases, organizations maintain as up-to-date, complete, and accurate
                an inventory as is deemed reasonable. This control enhancement can be satisfied by the
                implementation of CM-2 (2) for organizations that choose to combine information system component
                inventory and baseline configuration activities. Related control: SI-7.
          (3)   INFORMATION SYSTEM COMPONENT INVENTORY | AUTOMATED UNAUTHORIZED COMPONENT DETECTION
                The organization:
                (a)   Employs automated mechanisms continuously to detect the presence of unauthorized hardware, software,
                      and firmware components within the information system; and
                (b) Takes the following actions when unauthorized components are detected: [Selection (one or more): disables
                    network access by such components; isolates the components; notifies [Assignment: organization-defined
                    personnel or roles]].
                Supplemental Guidance: This control enhancement is applied in addition to the monitoring for
                unauthorized remote connections and mobile devices. Monitoring for unauthorized system components
                may be accomplished on an ongoing basis or by the periodic scanning of systems for that purpose.
                Automated mechanisms can be implemented within information systems or in other separate devices.
                Isolation can be achieved, for example, by placing unauthorized information system components in
                separate domains or subnets or otherwise quarantining such components. This type of component
                isolation is commonly referred to as sandboxing. Related controls: AC-17, AC-18, AC-19, CA-7, SI-3,
                SI-4, SI-7, RA-5.
          (4)   INFORMATION SYSTEM COMPONENT INVENTORY | ACCOUNTABILITY INFORMATION
                The organization includes in the information system component inventory information, a means for identifying
                minimally by position or role, individuals responsible/accountable for administering those components.
                Supplemental Guidance: Identifying individuals who are both responsible and accountable for
                administering information system components helps to ensure that the assigned components are
                properly administered and organizations can contact those individuals if some action is required (e.g.,
                component is determined to be the source of a breach/compromise, component needs to be
                recalled/replaced, or component needs to be relocated).
          (5)   INFORMATION SYSTEM COMPONENT INVENTORY | NO DUPLICATE ACCOUNTING OF COMPONENTS
                The organization verifies that all components within the authorization boundary of the information system are not
                duplicated in other information system component inventories.
                Supplemental Guidance: This control enhancement addresses the potential problem of duplicate
                accounting of information system components in large or complex interconnected systems.
          (6)   INFORMATION SYSTEM COMPONENT INVENTORY | ASSESSED CONFIGURATIONS / APPROVED DEVIATIONS
                The organization includes assessed component configurations and any approved deviations to current deployed
                configurations in the information system component inventory.
                Supplemental Guidance: This control enhancement focuses on configuration settings established by
                organizations for information system components, the specific components that have been assessed to
                determine compliance with the required configuration settings, and any approved deviations from
                established configuration settings. Related controls: CM-2, CM-6.
          (7)   INFORMATION SYSTEM COMPONENT INVENTORY | CENTRALIZED REPOSITORY
                The organization provides a centralized repository for the inventory of information system components.
                Supplemental Guidance: Organizations may choose to implement centralized information system
                component inventories that include components from all organizational information systems.
                Centralized repositories of information system component inventories provide opportunities for
                efficiencies in accounting for organizational hardware, software, and firmware assets. Such
                repositories may also help organizations rapidly identify the location and responsible individuals of
                system components that have been compromised, breached, or are otherwise in need of mitigation
                actions. Organizations ensure that the resulting centralized inventories include system-specific
                information required for proper component accountability (e.g., information system association,
                information system owner).

          (8)    INFORMATION SYSTEM COMPONENT INVENTORY | AUTOMATED LOCATION TRACKING
                 The organization employs automated mechanisms to support tracking of information system components by
                 geographic location.
                 Supplemental Guidance: The use of automated mechanisms to track the location of information system
                 components can increase the accuracy of component inventories. Such capability may also help
                 organizations rapidly identify the location and responsible individuals of system components that have
                 been compromised, breached, or are otherwise in need of mitigation actions.
          (9)    INFORMATION SYSTEM COMPONENT INVENTORY | ASSIGNMENT OF COMPONENTS TO SYSTEMS
                 The organization:
                 (a)   Assigns all acquired information system components to an information system; and
                 (b) Receives an acknowledgement from the information system owner of this assignment.
                 Supplemental Guidance: Organizations determine the criteria for or types of information system
                 components (e.g., microprocessors, motherboards, software, programmable logic controllers, and
                 network devices) that are subject to this control enhancement. Related control: SA-4.
          References: NIST Special Publication 800-128.

CM-9      CONFIGURATION MANAGEMENT PLAN

          Control: The organization develops, documents, and implements a configuration management plan for the
          information system that:
          a.     Addresses roles, responsibilities, and configuration management processes and procedures;
          b.     Establishes a process for identifying configuration items throughout the system development life cycle
                 and for managing the configuration of the configuration items;
          c.     Defines the configuration items for the information system and places the configuration items under
                 configuration management; and
          d.     Protects the configuration management plan from unauthorized disclosure and modification.
          Supplemental Guidance: Configuration management plans satisfy the requirements in configuration
          management policies while being tailored to individual information systems. Such plans define detailed
          processes and procedures for how configuration management is used to support system development life
          cycle activities at the information system level. Configuration management plans are typically developed
          during the development/acquisition phase of the system development life cycle. The plans describe how to
          move changes through change management processes, how to update configuration settings and baselines,
          how to maintain information system component inventories, how to control development, test, and
          operational environments, and how to develop, release, and update key documents. Organizations can
          employ templates to help ensure consistent and timely development and implementation of configuration
          management plans. Such templates can represent a master configuration management plan for the
          organization at large with subsets of the plan implemented on a system by system basis. Configuration
          management approval processes include designation of key management stakeholders responsible for
          reviewing and approving proposed changes to information systems, and personnel that conduct security
          impact analyses prior to the implementation of changes to the systems. Configuration items are the
          information system items (hardware, software, firmware, and documentation) to be configuration-managed.
          As information systems continue through the system development life cycle, new configuration items may
          be identified and some existing configuration items may no longer need to be under configuration control.
          Related controls: CM-2, CM-3, CM-4, CM-5, CM-8, SA-10.
               A Configuration Management Plan (CM Plan) is a comprehensive description of the roles,
               responsibilities, policies, and procedures that apply when managing the configuration of
               products and systems. Organizations are responsible for developing a CM Plan for all
               information systems under their purview. The plan must define CM roles, responsibilities,
               processes and procedures. It must further define the configuration items for the IS and

               establish a process for managing the configuration of the configuration items throughout the
               system development life cycle. ISO responsibilities include:
                   • Documenting the CM process when new IS are under development, being procured,
                        or delivered for operation. An integral part of CM is the System Authorization
                        process. Therefore, it is imperative that AOs or designees be advised of CM
                        decisions. This will ensure systems are fielded or modified within acceptable risk
                        parameters and the latest security technology is being incorporated into system
                        designs. This participation is most important at the Preliminary Design Review
                        (PDR) and the Critical Design Review (CDR).
               ISSM responsibilities include:
                  • Ensuring development and implementation of procedures in accordance with CM
                      policies and procedures for authorizing the use of hardware/software on an IS.
                   •   Ensuring all additions, changes or modifications to hardware, software, or firmware
                       are documented and that security relevant changes are coordinated, via the SCA,
                       with the AO or appropriately delegated individual.
                   •   Serving as a voting member on the CCB.
               ISSO responsibilities include:
                  • Ensuring CM for IS software and hardware are maintained and documented.
                  • Following procedures developed by the ISSM, in accordance with CM policies and
                      procedures, for authorizing software use prior to its implementation on a system.
                      Any changes or modifications to hardware, software, or firmware of a system must
                      be coordinated with the ISSM.
          Control Enhancements:
          (1)    CONFIGURATION MANAGEMENT PLAN | ASSIGNMENT OF RESPONSIBILITY
                 The organization assigns responsibility for developing the configuration management process to organizational
                 personnel that are not directly involved in information system development.
                 Supplemental Guidance: In the absence of dedicated configuration management teams assigned within
                 organizations, system developers may be tasked to develop configuration management processes using
                 personnel who are not directly involved in system development or integration. This separation of
                 duties ensures that organizations establish and maintain a sufficient degree of independence between
                 the information system development and integration processes and configuration management
                 processes to facilitate quality control and more effective oversight.
          References: NIST Special Publication 800-128.

CM-10     SOFTWARE USAGE RESTRICTIONS

          Control: The organization:

          a.     Uses software and associated documentation in accordance with contract agreements and copyright
                 laws;
          b.     Tracks the use of software and associated documentation protected by quantity licenses to control
                 copying and distribution; and
          c.     Controls and documents the use of peer-to-peer file sharing technology to ensure that this capability is
                 not used for the unauthorized distribution, display, performance, or reproduction of copyrighted work.
          Supplemental Guidance: Software license tracking can be accomplished by manual methods (e.g., simple
          spreadsheets) or automated methods (e.g., specialized tracking applications) depending on organizational
          needs. Related controls: AC-17, CM-8, SC-7.
               Software use within a SAP environment can make licensing difficult, but system specific

               controls that are in place to ensure licensing is properly managed are required.
          Control Enhancements:
          (1)    SOFTWARE USAGE RESTRICTIONS | OPEN SOURCE SOFTWARE
                 The organization establishes the following restrictions on the use of open source software: [Assignment:
                 organization-defined restrictions].
                 Supplemental Guidance: Open source software refers to software that is available in source code form.
                 Certain software rights normally reserved for copyright holders are routinely provided under software
                 license agreements that permit individuals to study, change, and improve the software. From a security
                 perspective, the major advantage of open source software is that it provides organizations with the
                 ability to examine the source code. However, there are also various licensing issues associated with
                 open source software including, for example, the constraints on derivative use of such software.
          References: None.

CM-11     USER-INSTALLED SOFTWARE

          Control: The organization:

                 a.Establishes [Assignment: organization-defined policies] governing the installation of software by
                   users;
              b. Enforces software installation policies through [Assignment: organization-defined methods]; and
              c. Monitors policy compliance at continuous monitoring interval.
          Supplemental Guidance: If provided the necessary privileges, users have the ability to install software in
          organizational information systems. To maintain control over the types of software installed, organizations
          identify permitted and prohibited actions regarding software installation. Permitted software installations
          may include, for example, updates and security patches to existing software and downloading applications
          from organization-approved “app stores.” Prohibited software installations may include, for example,
          software with unknown or suspect pedigrees or software that organizations consider potentially malicious.
          The policies organizations select governing user-installed software may be organization-developed or
          provided by some external entity. Policy enforcement methods include procedural methods (e.g., periodic
          examination of user accounts), automated methods (e.g., configuration settings implemented on
          organizational information systems), or both. Related controls: AC-3, CM-2, CM-3, CM-5, CM-6, CM-7,
          PL-4.
               This control is not discussing the software approval process, only discussing who has
               installation privileges. Generally, system administrators install software; however, on
               systems where a user may be authorized to install identified approved software, e.g., from the
               system’s online ‘app store.’

               This control implementation is also related directly to the use of whitelisting of software that
               is documented in CM-7 (5). If additional discussion of permissions for installation is
               warranted for the system it can be documented here. Software approval procedures are
               outlined in CM-2.
          Control Enhancements:
          (1)    USER-INSTALLED SOFTWARE | ALERTS FOR UNAUTHORIZED INSTALLATIONS
                 The information system alerts [Assignment: organization-defined personnel or roles] when the unauthorized
                 installation of software is detected.
                 Supplemental Guidance: Related controls: CA-7, SI-4.
          (2)    USER-INSTALLED SOFTWARE | PROHIBIT INSTALLATION WITHOUT PRIVILEGED STATUS
                 The information system prohibits user installation of software without explicit privileged status.
                 Supplemental Guidance: Privileged status can be obtained, for example, by serving in the role of system
                 administrator. Related control: AC-6.
          References: None.
