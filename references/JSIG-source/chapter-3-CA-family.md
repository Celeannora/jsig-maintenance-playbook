# JSIG Chapter 3 Security Assessment and Authorization (CA) Family

Source URL: https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Archived source (used for extraction, direct URL returns HTTP 403): http://web.archive.org/web/20260405054539/https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Extraction note: Verbatim extraction via `pdftotext -layout` against the complete 378-page JSIG PDF (retrieved 2026-07-17 from the Wayback Machine snapshot below, since the direct DCSA URL returns HTTP 403). This supersedes any prior lower-fidelity extraction of this section. Running page headers/footers inserted by the PDF layout have been stripped; no wording has been added, summarized, or altered.

---

FAMILY: SECURITY ASSESSMENT AND AUTHORIZATION

CA-1      SECURITY ASSESSMENT AND AUTHORIZATION POLICY AND PROCEDURES

          Control: The organization:

                 a.   Develops, documents, and disseminates to [Assignment: organization-defined personnel or roles]:
                      1.   A security assessment and authorization policy that addresses purpose, scope, roles,
                           responsibilities, management commitment, coordination among organizational entities, and
                           compliance; and
                      2.   Procedures to facilitate the implementation of the security assessment and authorization
                           policy and associated security assessment and authorization controls; and
                 b.   Reviews and updates the current:
                      1.   Security assessment and authorization policy at least annually; and
                      2.   Security assessment and authorization procedures at least annually.
          Supplemental Guidance: This control addresses the establishment of policy and procedures for the effective
          implementation of selected security controls and control enhancements in the CA family. Policy and
          procedures reflect applicable federal laws, Executive Orders, directives, regulations, policies, standards,
          and guidance. Security program policies and procedures at the organization level may make the need for
          system-specific policies and procedures unnecessary. The policy can be included as part of the general
          information security policy for organizations or conversely, can be represented by multiple policies
          reflecting the complex nature of certain organizations. The procedures can be established for the security
          program in general and for particular information systems, if needed. The organizational risk management
          strategy is a key factor in establishing policy and procedures. Related control: PM-9.
               DoD SAP-specific policy and procedures related to security assessment and authorization are
               defined in the remainder of this section.
          Control Enhancements: None.

          References: NIST Special Publications 800-12, 800-37, 800-53A, 800-100.

CA-2      SECURITY ASSESSMENTS

          Control: The organization:

          a.     Develops a security assessment plan that describes the scope of the assessment including:
                 1.   Security controls and control enhancements under assessment;
                 2.   Assessment procedures to be used to determine security control effectiveness; and
                 3.   Assessment environment, assessment team, and assessment roles and responsibilities;
          b.     Assesses the security controls in the information system and its environment of operation at least
                 annually, or as stipulated in the organization's continuous monitoring program to determine the
                 extent to which the controls are implemented correctly, operating as intended, and producing the
                 desired outcome with respect to meeting established security requirements;
          c.     Produces a security assessment report that documents the results of the assessment; and
          d.     Provides the results of the security control assessment to SCA at a minimum.
          Supplemental Guidance: Organizations assess security controls in organizational information systems and the
          environments in which those systems operate as part of: (i) initial and ongoing security authorizations; (ii)
          FISMA annual assessments; (iii) continuous monitoring; and (iv) system development life cycle activities.
          Security assessments: (i) ensure that information security is built into organizational information systems;
          (ii) identify weaknesses and deficiencies early in the development process; (iii) provide essential

          information needed to make risk-based decisions as part of security authorization processes; and (iv) ensure
          compliance to vulnerability mitigation procedures. Assessments are conducted on the implemented security
          controls from Appendix F (main catalog) and Appendix G (Program Management controls) as documented
          in System Security Plans and Information Security Program Plans. Organizations can use other types of
          assessment activities such as vulnerability scanning and system monitoring to maintain the security posture
          of information systems during the entire life cycle. Security assessment reports document assessment
          results in sufficient detail as deemed necessary by organizations, to determine the accuracy and
          completeness of the reports and whether the security controls are implemented correctly, operating as
          intended, and producing the desired outcome with respect to meeting security requirements. The FISMA
          requirement for assessing security controls at least annually does not require additional assessment
          activities to those activities already in place in organizational security authorization processes. Security
          assessment results are provided to the individuals or roles appropriate for the types of assessments being
          conducted. For example, assessments conducted in support of security authorization decisions are provided
          to authorizing officials or authorizing official designated representatives.
          To satisfy annual assessment requirements, organizations can use assessment results from the following
          sources: (i) initial or ongoing information system authorizations; (ii) continuous monitoring; or (iii)
          system development life cycle activities. Organizations ensure that security assessment results are current,
          relevant to the determination of security control effectiveness, and obtained with the appropriate level of
          assessor independence. Existing security control assessment results can be reused to the extent that the
          results are still valid and can also be supplemented with additional assessments as needed. Subsequent to
          initial authorizations and in accordance with OMB policy, organizations assess security controls during
          continuous monitoring. Organizations establish the frequency for ongoing security control assessments in
          accordance with organizational continuous monitoring strategies. Information Assurance Vulnerability
          Alerts provide useful examples of vulnerability mitigation procedures. External audits (e.g., audits by
          external entities such as regulatory agencies) are outside the scope of this control. Related controls: CA-5,
          CA-6, CA-7, PM-9, RA-5, SA-11, SA-12, SI-4.
               The initial security assessment, frequently conducted by the SCA, or other AO designee,
               determines the extent to which the security controls are implemented correctly, operating as
               intended, and producing the desired outcome with respect to meeting the security
               requirements. The AO determines the level of assessor impartiality required, based on the
               criticality and sensitivity of the information system, to ensure the assessment results
               produced are sound and can be used to make a credible, risk-based decision.
               A recurring security assessment is conducted as part of the continuous monitoring
               requirements to ensure the IS complies with the documented security requirements and that
               the security of the IS, as authorized, is maintained throughout its life cycle. Security
               assessments are routinely conducted by SCAs, ISOs, common control providers,
               ISSM/ISSOs, independent assessors, auditors, and IGs during the system life cycle to ensure
               that security controls are effective and continue to be effective in the operational
               environment where the system is deployed. After the initial authorization, the organization
               continues to assess the security controls on an ongoing basis. The assessments are based on
               the continuous monitoring plan developed by the ISO or CCP and approved by the AO.
               Types of assessments include self-assessments as well as independent assessments.

               As part of the security assessment process, a Security Assessment Plan must be developed
               either by the ISO, ISSM/ISSO, ISSE or the SCA. The Security Assessment Plan provides
               the objectives for the security assessment, the proposed method for verifying compliance
               with security controls, a proposed schedule for conducting the assessment, and assessment
               procedures. For the DoD SAP Community and for all IS under the purview of the SAP AO,
               the Security Assessment Plan is embodied in the information provided in the SSP, the
               SCTM, and the Security Control Assessment Procedures, all of which must be reviewed and
               approved by the SCA.

               The following steps will be considered when developing the Security Assessment Plan:
                   •   Determine which security controls/control enhancements are to be included in the
                       assessment based upon the contents of the SSP and the purpose/scope of the
                       assessment and whether this is a complete or partial assessment.
                   •   Select the appropriate assessment procedures to be used during the assessment based
                       on the security controls and control enhancements that are to be included in the
                       assessment. Refer to NIST SP 800-53A, Guide for Assessing the Security Controls
                       in Federal Information Systems and Organizations, Building Effective Security
                       Assessment Plans, Appendix F, for an assessment procedure for each security control
                       and control enhancement.
                   •   Tailor the selected assessment procedures to meet organizational needs
                       (e.g., select appropriate assessment methods and objectives).
                   •   Develop additional assessment procedures to address any security requirements or
                       controls that are not sufficiently covered by NIST SP 800-53A.
                           o The ISO may develop and implement additional security controls, and
                               therefore assessments, specific to the organization based on organizational
                               policies, mission or business function requirements, and the risk assessment.
                               See the Risk Assessment section for further details regarding assessment of
                               risk. The assessment procedures developed are subsequently integrated into
                               the Security Assessment Plan.
                   •    Optimize the assessment procedures to reduce duplication of effort (e.g., sequencing
                        and consolidating assessment procedures) to provide cost-effective assessment
                        solutions.
                            o The assessment of some security controls before others may provide
                                information that facilitates understanding and assessment of other controls.
               At the conclusion of the security assessment activity with a goal of receiving authorization or
               reauthorization to operate, a SAR shall be produced by the individual conducting the
               assessment, e.g., SCA. The SAR conveys the results of the security assessment to
               appropriate organizational officials. The SAR is included in the security authorization
               package that is reviewed by the SCA and provided to the AO with the information necessary
               to make a credible, risk-based decision on whether to place an information system into
               operation or continue its operation. The SAR details any shortcomings and/or vulnerabilities
               identified during the security assessment and a POA&M addressing the fixes, workarounds,
               etc. is developed.

               Security assessment activities and a resulting SAR are also conducted/produced by the
               ISO/ISSM/ISSO as part of continuous monitoring and other activities as outlined in the NIST
               Supplemental Guidance for this control.
               Information revealing specific vulnerabilities (other than the known vulnerabilities of widely
               available commercial products) and the compiled results of vulnerability analyses for all SAP
               systems shall be classified in accordance with the Program Security Classification Guide
               (SCG), usually at a minimum level of SECRET, and requires appropriate protection levels to
               control access to the information. When appropriate, the information will be marked Handle
               via Special Access Channels Only (HVSACO) to ensure a review by the Initial Denial
               Authority is required before the information is considered for release outside of SAP control
               channels.

               The information detailed in the SAR and POA&M (reference CA-5) is used by the AO when
               making the approval decision.
          Control Enhancements:
          (1)    SECURITY ASSESSMENTS | INDEPENDENT ASSESSORS
                 The organization employs assessors or assessment teams with AO determined level of impartiality based on the
                 risk assessment for the system to conduct security control assessments.
                 Supplemental Guidance: Independent assessors or assessment teams are individuals or groups who
                 conduct impartial assessments of organizational information systems. Impartiality implies that
                 assessors are free from any perceived or actual conflicts of interest with regard to the development,
                 operation, or management of the organizational information systems under assessment or to the
                 determination of security control effectiveness. To achieve impartiality, assessors should not: (i) create
                 a mutual or conflicting interest with the organizations where the assessments are being conducted; (ii)
                 assess their own work; (iii) act as management or employees of the organizations they are serving; or
                 (iv) place themselves in positions of advocacy for the organizations acquiring their services.
                 Independent assessments can be obtained from elements within organizations or can be contracted to
                 public or private sector entities outside of organizations. Authorizing officials determine the required
                 level of independence based on the security categories of information systems and/or the ultimate risk
                 to organizational operations, organizational assets, or individuals. Authorizing officials also determine
                 if the level of assessor independence provides sufficient assurance that the results are sound and can be
                 used to make credible, risk-based decisions. This includes determining whether contracted security
                 assessment services have sufficient independence, for example, when information system owners are
                 not directly involved in contracting processes or cannot unduly influence the impartiality of assessors
                 conducting assessments. In special situations, for example, when organizations that own the
                 information systems are small or organizational structures require that assessments are conducted by
                 individuals that are in the developmental, operational, or management chain of system owners,
                 independence in assessment processes can be achieved by ensuring that assessment results are
                 carefully reviewed and analyzed by independent teams of experts to validate the completeness,
                 accuracy, integrity, and reliability of the results. Organizations recognize that assessments performed
                 for purposes other than direct support to authorization decisions are, when performed by assessors with
                 sufficient independence, more likely to be useable for such decisions, thereby reducing the need to
                 repeat assessments.
          (2)    SECURITY ASSESSMENTS | SPECIALIZED ASSESSMENTS
                 The organization includes as part of security control assessments, [Assignment: organization-defined frequency],
                 [Selection: announced; unannounced], [Selection (one or more): in-depth monitoring; vulnerability scanning;
                 malicious user testing; insider threat assessment; performance/load testing; [Assignment: organization-defined other
                 forms of security assessment]].
                 Supplemental Guidance: Organizations can employ information system monitoring, insider threat
                 assessments, malicious user testing, and other forms of testing (e.g., verification and validation) to
                 improve readiness by exercising organizational capabilities and indicating current performance levels
                 as a means of focusing actions to improve security. Organizations conduct assessment activities in
                 accordance with applicable federal laws, Executive Orders, directives, policies, regulations, and
                 standards. Authorizing officials approve the assessment methods in coordination with the
                 organizational risk executive function. Organizations can incorporate vulnerabilities uncovered during
                 assessments into vulnerability remediation processes. Related controls: PE-3, SI-2.
          (3)    SECURITY ASSESSMENTS | EXTERNAL ORGANIZATIONS
                 The organization accepts the results of an assessment of [Assignment: organization-defined information system]
                 performed by [Assignment: organization-defined external organization] when the assessment meets [Assignment:
                 organization-defined requirements].
                 Supplemental Guidance: Organizations may often rely on assessments of specific information systems by
                 other (external) organizations. Utilizing such existing assessments (i.e., reusing existing assessment
                 evidence) can significantly decrease the time and resources required for organizational assessments by
                 limiting the amount of independent assessment activities that organizations need to perform. The
                 factors that organizations may consider in determining whether to accept assessment results from
                 external organizations can vary. Determinations for accepting assessment results can be based on, for
                 example, past assessment experiences one organization has had with another organization, the

                 reputation that organizations have with regard to assessments, the level of detail of supporting
                 assessment documentation provided, or mandates imposed upon organizations by federal legislation,
                 policies, or directives.
          References: Executive Order 13587; FIPS Publication 199; NIST Special Publications 800-37, 800-39, 800-
          53A, 800-115, 800-137.

CA-3      SYSTEM INTERCONNECTIONS

          Control: The organization:

          a.     Authorizes connections from the information system to other information systems through the use of
                 Interconnection Security Agreements;
          b.     Documents, for each interconnection, the interface characteristics, security requirements, and the
                 nature of the information communicated; and
          c.     Reviews and updates Interconnection Security Agreements at least annually.
          Supplemental Guidance: This control applies to dedicated connections between information systems (i.e.,
          system interconnections) and does not apply to transitory, user-controlled connections such as email and
          website browsing. Organizations carefully consider the risks that may be introduced when information
          systems are connected to other systems with different security requirements and security controls, both
          within organizations and external to organizations. Authorizing officials determine the risk associated with
          information system connections and the appropriate controls employed. If interconnecting systems have the
          same authorizing official, organizations do not need to develop Interconnection Security Agreements.
          Instead, organizations can describe the interface characteristics between those interconnecting systems in
          their respective security plans. If interconnecting systems have different authorizing officials within the
          same organization, organizations can either develop Interconnection Security Agreements or describe the
          interface characteristics between systems in the security plans for the respective systems. Organizations
          may also incorporate Interconnection Security Agreement information into formal contracts, especially for
          interconnections established between federal agencies and nonfederal (i.e., private sector) organizations.
          Risk considerations also include information systems sharing the same networks. For certain technologies
          (e.g., space, unmanned aerial vehicles, and medical devices), there may be specialized connections in place
          during preoperational testing. Such connections may require Interconnection Security Agreements and be
          subject to additional security controls. Related controls: AC-3, AC-4, AC-20, AU-2, AU-12, AU-16, CA-7,
          IA-3, SA-9, SC-7, SI-4.
               Organizations shall identify any connections of an information system to an external
               information system in the SSP and ensure connections from the information system to
               external information systems are authorized through the use of an ISA. An external
               information system is an information system or component that is outside the authorization
               boundary as defined in the SSP. (Reference AC-20.)

               Organizations typically have no direct control over the security controls or security control
               effectiveness for these external systems or components. Organizations shall monitor all
               information system connections on an ongoing basis to verify enforcement of the security
               requirements. If the interconnecting systems have the same AO, an ISA is not required,
               although one may still be beneficial.

               When a need arises to connect two different IS operating at different security classification
               levels, the connection is referred to as a cross domain connection. Any cross domain
               connection must be identified first to the Service or Agency Cross Domain Support Element
               (CDSE), e.g., CA SAPCO, AO. All cross domain connections shall comply with the security
               controls identified by the UCDSMO.
               The direct connection of any information system to an external network is prohibited. No

               direct connection means that an information system cannot connect to an external network
               without the use of an approved boundary protection device (e.g., firewall or cross domain
               device) that mediates the communication between the system and the network.
          Control Enhancements:
          (1)    SYSTEM INTERCONNECTIONS | UNCLASSIFIED NATIONAL SECURITY SYSTEM CONNECTIONS
                 The organization prohibits the direct connection of an all unclassified NSS to an external network without the use of
                 [Assignment: organization-defined boundary protection device].
                 Supplemental Guidance: Organizations typically do not have control over external networks (e.g., the
                 Internet). Approved boundary protection devices (e.g., routers, firewalls) mediate communications
                 (i.e., information flows) between unclassified national security systems and external networks. This
                 control enhancement is required for organizations processing, storing, or transmitting Controlled
                 Unclassified Information (CUI).
          (2)    SYSTEM INTERCONNECTIONS | CLASSIFIED NATIONAL SECURITY SYSTEM CONNECTIONS
                 The organization prohibits the direct connection of a classified, national security system to an external network
                 without the use of [Assignment: organization-defined boundary protection device].
                 Supplemental Guidance: Organizations typically do not have control over external networks (e.g., the
                 Internet). Approved boundary protection devices (e.g., routers, firewalls) mediate communications
                 (i.e., information flows) between classified national security systems and external networks. In
                 addition, approved boundary protection devices (typically managed interface/cross-domain systems)
                 provide information flow enforcement from information systems to external networks.
          (3)    SYSTEM INTERCONNECTIONS | UNCLASSIFIED NON-NATIONAL SECURITY SYSTEM CONNECTIONS
                 The organization prohibits the direct connection of an [Assignment: organization-defined unclassified, non-national
                 security system] to an external network without the use of [Assignment; organization-defined boundary protection
                 device].
                 Supplemental Guidance: Organizations typically do not have control over external networks (e.g., the
                 Internet). Approved boundary protection devices (e.g., routers, firewalls) mediate communications
                 (i.e., information flows) between unclassified non-national security systems and external networks.
                 This control enhancement is required for organizations processing, storing, or transmitting Controlled
                 Unclassified Information (CUI).
          (4)    SYSTEM INTERCONNECTIONS | CONNECTIONS TO PUBLIC NETWORKS
                 The organization prohibits the direct connection of an [Assignment: organization-defined information system] to a
                 public network.
                 Supplemental Guidance: A public network is any network accessible to the general public including, for
                 example, the Internet and organizational extranets with public access.
          (5)    SYSTEM INTERCONNECTIONS | RESTRICTIONS ON EXTERNAL SYSTEM CONNECTIONS
                 The organization employs deny-all, permit-by-exception policy for allowing all systems to connect to external
                 information systems.
          Supplemental Guidance: Organizations can constrain information system connectivity to external domains
          (e.g., websites) by employing one of two policies with regard to such connectivity: (i) allow-all, deny by
          exception, also known as blacklisting (the weaker of the two policies); or (ii) deny-all, allow by exception,
          also known as whitelisting (the stronger of the two policies). For either policy, organizations determine
          what exceptions, if any, are acceptable. Related control: CM-7.
          References: FIPS Publication 199; NIST Special Publication 800-47.

CA-4      SECURITY CERTIFICATION
          [Withdrawn: Incorporated into CA-2].

CA-5      PLAN OF ACTION AND MILESTONES

          Control: The organization:

           a.     Develops a plan of action and milestones for the information system to document the organization’s
                  planned remedial actions to correct weaknesses or deficiencies noted during the assessment of the
                  security controls and to reduce or eliminate known vulnerabilities in the system; and
           b.     Updates existing plan of action and milestones at least quarterly based on the findings from security
                  controls assessments, security impact analyses, and continuous monitoring activities.
          Supplemental Guidance: Plans of action and milestones are key documents in security authorization packages
          and are subject to federal reporting requirements established by OMB. Related controls: CA-2, CA-7, CM-
          4, PM-4.
               POA&Ms are the authoritative management tool used by the organization (including the AO,
               SCA, PSO) to detail specific program and system level security weaknesses, remediation
               needs, the resources required to implement the plan, and scheduled completion dates.
               The POA&M is initiated based on findings and recommendations from the SAR, or as a
               minimum, providing that information via the SAR to the ISO.
               The ISO shall describe the planned tasks for correcting weaknesses and addressing any
               residual findings. The POA&M shall identify:
                  •    Tasks to be accomplished with a recommendation for completion either before or
                       after information system implementation.
                  •    Resources required to accomplish the tasks.
                  •    Any milestones in meeting the tasks, to include percentage completed.
                  •    Scheduled completion dates for the milestones.
                   • Status of tasks (completed, ongoing, delayed, planned)
               The POA&M is used by the AO and SCA to monitor the progress in mitigating any findings.
               POA&M entries are required even when weaknesses or deficiencies are remediated during
               the assessment or prior to the submission of the authorization package to the AO. Once an
               authorization is issued with a POA&M, adjusting the approved milestones and scheduled
               completion dates is not allowed without coordination with AO.
          Control Enhancements:
          (1)    PLAN OF ACTION AND MILESTONES | AUTOMATION SUPPORT FOR ACCURACY / CURRENCY
                 The organization employs automated mechanisms to help ensure that the plan of action and milestones for the
                 information system is accurate, up to date, and readily available.

          References: OMB Memorandum 02-01; NIST Special Publication 800-37.

CA-6      SECURITY AUTHORIZATION

          Control: The organization:

          a.     Assigns a senior-level executive or manager as the authorizing official for the information system;
          b.     Ensures that the authorizing official authorizes the information system for processing before
                 commencing operations; and
          c.     Updates the security authorization if the organization and/or system is adequately covered by a
                 continuous monitoring program the Security Authorization may be continuously updated: If
                 not; at least every three (3) years, when significant security breaches occur, whenever there is a
                 significant change to the system, or to the environment in which the system operates.
          Supplemental Guidance: Security authorizations are official management decisions, conveyed through
          authorization decision documents, by senior organizational officials or executives (i.e., authorizing
          officials) to authorize operation of information systems and to explicitly accept the risk to organizational
          operations and assets, individuals, other organizations, and the Nation based on the implementation of

          agreed-upon security controls. Authorizing officials provide budgetary oversight for organizational
          information systems or assume responsibility for the mission/business operations supported by those
          systems. The security authorization process is an inherently federal responsibility and therefore, authorizing
          officials must be federal employees. Through the security authorization process, authorizing officials
          assume responsibility and are accountable for security risks associated with the operation and use of
          organizational information systems. Accordingly, authorizing officials are in positions with levels of
          authority commensurate with understanding and accepting such information security-related risks. OMB
          policy requires that organizations conduct ongoing authorizations of information systems by implementing
          continuous monitoring programs. Continuous monitoring programs can satisfy three-year reauthorization
          requirements, so separate reauthorization processes are not necessary. Through the employment of
          comprehensive continuous monitoring processes, critical information contained in authorization packages
          (i.e., security plans, security assessment reports, and plans of action and milestones) is updated on an
          ongoing basis, providing authorizing officials and information system owners with an up-to-date status of
          the security state of organizational information systems and environments of operation. To reduce the
          administrative cost of security reauthorization, authorizing officials use the results of continuous
          monitoring processes to the maximum extent possible as the basis for rendering reauthorization decisions.
          Related controls: CA-2, CA-7, PM-9, PM-10.
               The Cybersecurity enclosure to DoDM 5205.07-V1 provides policy for assigning the AO
               with authority to authorize systems to operate under their purview. [CA-6.a] The ISO and
               ISSM/ISSO must ensure the system is authorized for processing by the AO before
               commencing operations.
               Joint Authorization vs. Reciprocity
               Joint authorization (formerly joint accreditation) to operate differs from reciprocity in that
               ‘joint’ indicates that decisions about the system, how it will operate, which controls apply,
               who will assess the system as well as factors related to the actual authorization assessment
               are all decided up-front together, or jointly. In most cases, two or more organizations
               support the assessment and jointly determine authorization to operate.

               Reciprocity is defined as a “Mutual agreement among participating enterprises to accept each
               other’s security assessments in order to reuse information system resources and/or to accept
               each other’s assessed security posture in order to share information.” [CNSSI 4009]
               Reciprocity applies when an information system is currently authorized to operate by one AO
               and it is later determined that it would prove beneficial to one or both parties if the
               information systems are connected or authorized to share data across system, programs, or
               service boundaries.
               Reciprocity does not imply blind acceptance. Upon request, the body of evidence used for
               assessments of the subject system will be provided to the other AOs who have a vested
               interest in establishing a mutual agreement. The receiving party will review the assessment
               evidence (e.g., SSP, test plans, test procedures, test reports, exceptions) and determine if
               there are any deltas in the evidence, e.g., baseline/overlay controls that were tailored, a test
               item that was omitted and identify items that may require negotiations. Reciprocity means
               that the system(s) will not undergo another full assessment.

               Varying security domains (collateral, SAP, sensitive compartmented information (SCI))
               implement security measures based on their operating environment. A receiving
               organization reviews controls to ensure enhanced security measures pertinent to the receiving
               environment are appropriately addressed. The SSP/SCTM for a collateral system coming
               into a SAP environment should be reviewed and updated to reflect requirements for
               implementation in a SAP environment, e.g., media protection, personnel clearance and
               accesses, incident response and reporting, interconnections.

               Organizations have the right to refuse reciprocity due to an insufficient security authorization
               package or excessive risk to the enclave or site as determined by the AO.

               Ensure the CA SAPCO is aware of discussions concerning reciprocal agreements with
               entities outside of the organization, including reciprocity with the IC, other DoD SAPCOs, or
               the DoD Collateral Community.
               Site-Based Authorization (SBA)
               The AO may choose an alternate authorization approach that consolidates all systems at a
               location into a single management entity called a "Site." The size and bounds of each site are
               determined by the relationship of each system (component) to the infrastructure, command
               lines of authority, and the span of control of the site's ISSM. Site authorization begins with
               all systems at the site being assessed and authorized. The site is then authorized as a single
               entity and a single ATO is issued for systems falling under the Site Baseline. The ISSM may
               be delegated the authority to add ‘like’ systems or ‘like’ networks (i.e., for systems where not
               all users have a need to know), provided those systems do not extend beyond the site
               boundaries.
               A Site IA Security Concept of Operations (CONOPS) or IA SOP, a system baseline of all
               approved systems, and a Site Security Architecture are the minimum documents required to
               be considered for SBA. These shall contain a listing of all systems covered under the site
               based authorization, a description of how the site complies with the requirements of this
               manual (i.e., RMF controls), and a wiring diagram showing external connections. The AO
               will be provided periodic updates to the baseline, and the continued authorization as a Site
               under SBA will be assessed annually in conjunction with the Security Review process.
               Security Authorization Package
               The ISO is responsible for submitting the Security Authorization Package to the SCA, who,
               in turn, submits the security authorization package to the AO. For information systems
               inheriting common controls for specific security capabilities, the security authorization
               package for the common controls or a reference to such documentation must also be included
               in the authorization package. When security controls are provided to an organization by an
               external provider (e.g., through contracts, interagency agreements, lines of business
               arrangements, licensing agreements, and/or supply chain arrangements), the organization
               shall ensure the information needed by the AO to make a risk-based decision is made
               available by the control provider. The security authorization package will contain, at a
               minimum, the SSP (including the SCTM, ConMon Strategy or Plan, and RAR), SAR, and
               POA&M. In addition, the Security Assessment Plan may be required by the AO. The
               complexity of the RAR and ConMon Strategy vary by system and environment. Guidance
               on the level of detail required is provided by the AO/SCA. The AO may request additional
               documentation.
          Control Enhancements: None.

          References: OMB Circular A-130; OMB Memorandum 11-33; NIST Special Publications 800-37, 800-137.

CA-7      CONTINUOUS MONITORING

          Control: The organization develops a continuous monitoring strategy and implements a continuous
          monitoring program that includes:
           a.     Establishment of [Assignment: organization-defined metrics] to be monitored;

           b.     Establishment of [Assignment: organization-defined frequencies] for monitoring and [Assignment:
                  organization-defined frequencies] for assessments supporting such monitoring;
           c.     Ongoing security control assessments in accordance with the organizational continuous monitoring
                  strategy;
           d.     Ongoing security status monitoring of organization-defined metrics in accordance with the
                  organizational continuous monitoring strategy;
           e.     Correlation and analysis of security-related information generated by assessments and monitoring;
           f.     Response actions to address results of the analysis of security-related information; and
           g.     Reporting the security status of organization and the information system to [Assignment: organization-
                  defined personnel or roles] at least annually or when there is a significant change to the system,
                  or to the environment in which the system operates.
          Supplemental Guidance: Continuous monitoring programs facilitate ongoing awareness of threats,
          vulnerabilities, and information security to support organizational risk management decisions. The terms
          continuous and ongoing imply that organizations assess/analyze security controls and information security-
          related risks at a frequency sufficient to support organizational risk-based decisions. The results of
          continuous monitoring programs generate appropriate risk response actions by organizations. Continuous
          monitoring programs also allow organizations to maintain the security authorizations of information
          systems and common controls over time in highly dynamic environments of operation with changing
          mission/business needs, threats, vulnerabilities, and technologies. Having access to security-related
          information on a continuing basis through reports/dashboards gives organizational officials the capability to
          make more effective and timely risk management decisions, including ongoing security authorization
          decisions. Automation supports more frequent updates to security authorization packages,
          hardware/software/firmware inventories, and other system information. Effectiveness is further enhanced
          when continuous monitoring outputs are formatted to provide information that is specific, measurable,
          actionable, relevant, and timely. Continuous monitoring activities are scaled in accordance with the security
          categories of information systems. Related controls: CA-2, CA-5, CA-6, CM-3, CM-4, PM-6, PM-9, RA-5,
          SA-11, SA-12, SI-2, SI-4.
               This strategy will drive the development of organizational Information Security Continuous
               Monitoring (ISCM) or ConMon Plans. ConMon Plan allows an organization to maintain the
               security authorization of its information systems over time in a highly dynamic environment
               with changing threats, vulnerabilities, technologies, and missions/business processes.
               Continuous monitoring of security controls using automated support tools facilitates near
               real-time risk management and promotes organizational situational awareness with regard to
               the security state of the information system.
               The ultimate objective of continuous monitoring is to achieve a state of ongoing
               authorization where the AO maintains sufficient knowledge of the current security state of
               the information systems under their purview (including the effectiveness of the security
               controls employed within and inherited by the system). This information is used to
               determine whether continued operation maintains an acceptable level of risk in accordance
               with the AO. If a formal reauthorization action is required, the organization maximizes the
               use of security and risk-related information produced during the continuous monitoring and
               ongoing authorization processes.
               Continuous monitoring assists organizations with ongoing updates to SSPs and POA&Ms
               and minimizes the level of effort required for subsequent security assessment activities.
          Control Enhancements:
          (1)    CONTINUOUS MONITORING | INDEPENDENT ASSESSMENT
                 The organization employs assessors or assessment teams with [Assignment: organization-defined level of
                 independence] to monitor the security controls in the information system on an ongoing basis.

                Supplemental Guidance: Organizations can maximize the value of assessments of security controls
                during the continuous monitoring process by requiring that such assessments be conducted by
                assessors or assessment teams with appropriate levels of independence based on continuous monitoring
                strategies. Assessor independence provides a degree of impartiality to the monitoring process. To
                achieve such impartiality, assessors should not: (i) create a mutual or conflicting interest with the
                organizations where the assessments are being conducted; (ii) assess their own work; (iii) act as
                management or employees of the organizations they are serving; or (iv) place themselves in advocacy
                positions for the organizations acquiring their services.
          (2)   CONTINUOUS MONITORING | TYPES OF ASSESSMENTS
                [Withdrawn: Incorporated into CA-2.]
          (3)   CONTINUOUS MONITORING | TREND ANALYSES
                The organization employs trend analyses to determine if security control implementations, the frequency of
                continuous monitoring activities, and/or the types of activities used in the continuous monitoring process need to be
                modified based on empirical data.
                Supplemental Guidance: Trend analyses can include, for example, examining recent threat information
                regarding the types of threat events that have occurred within the organization or across the federal
                government, success rates of certain types of cyber attacks, emerging vulnerabilities in information
                technologies, evolving social engineering techniques, results from multiple security control
                assessments, the effectiveness of configuration settings, and findings from Inspectors General or
                auditors.
          References: OMB Memorandum 11-33; NIST Special Publications 800-37, 800-39, 800-53A, 800-115,
          800-137; US-CERT Technical Cyber Security Alerts; DoD Information Assurance Vulnerability Alerts.

CA-8      PENETRATION TESTING

          Control: The organization conducts penetration testing [Assignment: organization-defined frequency] on
          [Assignment: organization-defined information systems or system components].
          Supplemental Guidance: Penetration testing is a specialized type of assessment conducted on information
          systems or individual system components to identify vulnerabilities that could be exploited by adversaries.
          Such testing can be used to either validate vulnerabilities or determine the degree of resistance
          organizational information systems have to adversaries within a set of specified constraints (e.g., time,
          resources, and/or skills). Penetration testing attempts to duplicate the actions of adversaries in carrying out
          hostile cyber attacks against organizations and provides a more in-depth analysis of security-related
          weaknesses/deficiencies. Organizations can also use the results of vulnerability analyses to support
          penetration testing activities. Penetration testing can be conducted on the hardware, software, or firmware
          components of an information system and can exercise both physical and technical security controls. A
          standard method for penetration testing includes, for example: (i) pretest analysis based on full knowledge
          of the target system; (ii) pretest identification of potential vulnerabilities based on pretest analysis; and (iii)
          testing designed to determine exploitability of identified vulnerabilities. All parties agree to the rules of
          engagement before the commencement of penetration testing scenarios. Organizations correlate the
          penetration testing rules of engagement with the tools, techniques, and procedures that are anticipated to be
          employed by adversaries carrying out attacks. Organizational risk assessments guide decisions on the level
          of independence required for personnel conducting penetration testing. Related control: SA-12.
          Control Enhancements:
          (1)   PENETRATION TESTING | INDEPENDENT PENETRATION AGENT OR TEAM
                The organization employs an independent penetration agent or penetration team to perform penetration testing on
                the information system or system components.
                Supplemental Guidance: Independent penetration agents or teams are individuals or groups who conduct
                impartial penetration testing of organizational information systems. Impartiality implies that
                penetration agents or teams are free from any perceived or actual conflicts of interest with regard to the
                development, operation, or management of the information systems that are the targets of the
                penetration testing. Supplemental guidance for CA-2 (1) provides additional information regarding
                independent assessments that can be applied to penetration testing. Related control: CA-2.

          (2)   PENETRATION TESTING | RED TEAM EXERCISES
                The organization employs [Assignment: organization-defined red team exercises] to simulate attempts by
                adversaries to compromise organizational information systems in accordance with [Assignment: organization-defined
                rules of engagement].
                Supplemental Guidance: Red team exercises extend the objectives of penetration testing by examining
                the security posture of organizations and their ability to implement effective cyber defenses. As such,
                red team exercises reflect simulated adversarial attempts to compromise organizational
                mission/business functions and provide a comprehensive assessment of the security state of
                information systems and organizations. Simulated adversarial attempts to compromise organizational
                missions/business functions and the information systems that support those missions/functions may
                include technology-focused attacks (e.g., interactions with hardware, software, or firmware
                components and/or mission/business processes) and social engineering-based attacks (e.g., interactions
                via email, telephone, shoulder surfing, or personal conversations). While penetration testing may be
                largely laboratory-based testing, organizations use red team exercises to provide more comprehensive
                assessments that reflect real-world conditions. Red team exercises can be used to improve security
                awareness and training and to assess levels of security control effectiveness.
          References: None.

CA-9      INTERNAL SYSTEM CONNECTIONS

          Control: The organization:

          a.    Authorizes internal connections of [Assignment: organization-defined information system components
                or classes of components] to the information system; and
          b.    Documents, for each internal connection, the interface characteristics, security requirements, and the
                nature of the information communicated.
          Supplemental Guidance: This control applies to connections between organizational information systems and
          (separate) constituent system components (i.e., intra-system connections) including, for example, system
          connections with mobile devices, notebook/desktop computers, printers, copiers, facsimile machines,
          scanners, sensors, and servers. Instead of authorizing each individual internal connection, organizations can
          authorize internal connections for a class of components with common characteristics and/or
          configurations, for example, all digital printers, scanners, and copiers with a specified processing, storage,
          and transmission capability or all smart phones with a specific baseline configuration. Related controls:
          AC-3, AC-4, AC-18, AC-19, AU-2, AU-12, CA-7, CM-2, IA-3, SC-7, SI-4.
          Control Enhancements:
          (1)   INTERNAL SYSTEM CONNECTIONS | SECURITY COMPLIANCE CHECKS
                The information system performs security compliance checks on constituent system components prior to the
                establishment of the internal connection.
                Supplemental Guidance: Security compliance checks may include, for example, verification of the
                relevant baseline configuration. Related controls: CM-6.
          References: None.
