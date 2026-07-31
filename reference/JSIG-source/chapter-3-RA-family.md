# JSIG Chapter 3 Risk Assessment (RA) Family

Source URL: https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Archived source (used for extraction, direct URL returns HTTP 403): http://web.archive.org/web/20260405054539/https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Extraction note: Verbatim extraction via `pdftotext -layout` against the complete 378-page JSIG PDF (retrieved 2026-07-17 from the Wayback Machine snapshot below, since the direct DCSA URL returns HTTP 403). This supersedes any prior lower-fidelity extraction of this section. Running page headers/footers inserted by the PDF layout have been stripped; no wording has been added, summarized, or altered.

---

FAMILY: RISK ASSESSMENT

RA-1      RISK ASSESSMENT POLICY AND PROCEDURES

          Control: The organization:

          a.     Develops, documents, and disseminates to all personnel:
                 1.   A risk assessment policy that addresses purpose, scope, roles, responsibilities, management
                      commitment, coordination among organizational entities, and compliance; and
                 2.   Procedures to facilitate the implementation of the risk assessment policy and associated risk
                      assessment controls; and
          b.     Reviews and updates the current:
                 1.   Risk assessment policy at least annually; and
                 2.   Risk assessment procedures at least annually.
          Supplemental Guidance: This control addresses the establishment of policy and procedures for the effective
          implementation of selected security controls and control enhancements in the RA family. Policy and
          procedures reflect applicable federal laws, Executive Orders, directives, regulations, policies, standards,
          and guidance. Security program policies and procedures at the organization level may make the need for
          system-specific policies and procedures unnecessary. The policy can be included as part of the general
          information security policy for organizations or conversely, can be represented by multiple policies
          reflecting the complex nature of certain organizations. The procedures can be established for the security
          program in general and for particular information systems, if needed. The organizational risk management
          strategy is a key factor in establishing policy and procedures. Related control: PM-9.
               DoD SAP-specific policy and procedures related to risk assessment are defined in the
               remainder of this section.
          Control Enhancements: None.

          References: NIST Special Publications 800-12, 800-30, 800-100.

RA-2      SECURITY CATEGORIZATION

          Control: The organization:

          a.     Categorizes information and the information system in accordance with applicable federal laws,
                 Executive Orders, directives, policies, regulations, standards, and guidance;
          b.     Documents the security categorization results (including supporting rationale) in the security plan for
                 the information system; and
          c.     Ensures that the security categorization decision is reviewed and approved by the authorizing official
                 or authorizing official designated representative.
          Supplemental Guidance: Clearly defined authorization boundaries are a prerequisite for effective security
          categorization decisions. Security categories describe the potential adverse impacts to organizational
          operations, organizational assets, and individuals if organizational information and information systems are
          comprised through a loss of confidentiality, integrity, or availability. Organizations conduct the security
          categorization process as an organization-wide activity with the involvement of chief information officers,
          senior information security officers, information system owners, mission/business owners, and information
          owners/stewards. Organizations also consider the potential adverse impacts to other organizations and, in
          accordance with the USA PATRIOT Act of 2001 and Homeland Security Presidential Directives, potential
          national-level adverse impacts. Security categorization processes carried out by organizations facilitate the
          development of inventories of information assets, and along with CM-8, mappings to specific information
          system components where information is processed, stored, or transmitted. Related controls: CM-8, MP-4,
          RA-3, SC-7.

               Reference 2.3.1 for guidance on determining the overall security categorization, use of
               overlays, applicable documents, and documenting results in the SSP.
               Monitoring changes to the SSP [PL-2] relates to this control.
          Control Enhancements: None.

          References: FIPS Publication 199; NIST Special Publications 800-30, 800-39, 800-60.

RA-3      RISK ASSESSMENT

          Control: The organization:

          a.     Conducts an assessment of risk, including the likelihood and magnitude of harm, from the
                 unauthorized access, use, disclosure, disruption, modification, or destruction of the information system
                 and the information it processes, stores, or transmits;
          b.     Documents risk assessment results in [Selection: security plan; risk assessment report; [Assignment:
                 organization-defined document]];
          c.     Reviews risk assessment results at least annually;
          d.     Disseminates risk assessment results to [Assignment: organization-defined personnel or roles]; and
          e.     Updates the risk assessment at least annually or whenever there are significant changes to the
                 information system or environment of operation (including the identification of new threats and
                 vulnerabilities), or other conditions that may impact the security state of the system.
          Supplemental Guidance: Clearly defined authorization boundaries are a prerequisite for effective risk
          assessments. Risk assessments take into account threats, vulnerabilities, likelihood, and impact to
          organizational operations and assets, individuals, other organizations, and the Nation based on the
          operation and use of information systems. Risk assessments also take into account risk from external
          parties (e.g., service providers, contractors operating information systems on behalf of the organization,
          individuals accessing organizational information systems, outsourcing entities). In accordance with OMB
          policy and related E-authentication initiatives, authentication of public users accessing federal information
          systems may also be required to protect nonpublic or privacy-related information. As such, organizational
          assessments of risk also address public access to federal information systems.
          Risk assessments (either formal or informal) can be conducted at all three tiers in the risk management
          hierarchy (i.e., organization level, mission/business process level, or information system level) and at any
          phase in the system development life cycle. Risk assessments can also be conducted at various steps in the
          Risk Management Framework, including categorization, security control selection, security control
          implementation, security control assessment, information system authorization, and security control
          monitoring. RA-3 is noteworthy in that the control must be partially implemented prior to the
          implementation of other controls in order to complete the first two steps in the Risk Management
          Framework. Risk assessments can play an important role in security control selection processes,
          particularly during the application of tailoring guidance, which includes security control supplementation.
          Related controls: RA-2, PM-9.
               Organizations shall conduct a risk assessment for each system under their purview. The risk
               assessment shall address the likelihood and magnitude of harm resulting from the
               unauthorized disclosure, modification or denial of availability of the system and the
               information it processes, stores, or transmits. The risk assessment shall take into account
               vulnerabilities, threat sources, and security controls planned or in place to determine the level
               of residual risk posed to organizational operations and assets, individuals, other
               organizations, and national security based on the operation of the system. The risk
               assessment shall also take into account risk to organizational operations, organizational
               assets, or individuals from external parties (e.g., service providers, contractors’ operating
               systems on behalf of the organization, individuals accessing organizational systems,
               outsourcing entities). A clearly defined authorization boundary is a prerequisite for an

               effective risk assessment. See Section 2.2.3 for a discussion of information
               system/authorization boundaries.
               Risk assessments (either formal or informal) can be conducted by organizations at various
               steps in the RMF including: IS categorization; security control selection; security control
               implementation; security control assessment; IS authorization; and security control
               monitoring. Risk assessments help senior management make decisions on policy, procedural,
               budget, and system operational and management changes.
               Risk assessments shall be initiated by ISOs during Step 1 of the RMF, Security
               Categorization. The initial risk assessment will evaluate anticipated security vulnerabilities
               affecting confidentiality, integrity, and availability of the system in the context of the planned
               operational environment. The initial risk assessment will conclude with recommendations
               for appropriate security safeguards, permitting management to make knowledge-based
               decisions about the security controls necessary to properly secure the system based on its
               categorization and threat environment.
               Results from the initial risk assessment shall be documented in a separate RAR or in the SSP.
               The RAR shall include the vulnerabilities, threats, threat sources, other conditions that may
               affect the security of the system, and any residual risk incurred by operating the system as
               identified in the SSP.
               The RAR shall be updated during later stages in the RMF and is an important part of the
               security authorization package. The risk assessment process is revisited, as necessary,
               throughout the RMF to provide the AO with an updated risk picture reflecting the actual
               (versus planned) state of affairs with regard to system implementation, security control
               effectiveness, and the operational environment. The RAR for the as-built or as-deployed
               system shall include a description of the known vulnerabilities in the system, an assessment
               of the risk posed by each identified vulnerability, and corrective actions that can be taken to
               mitigate the risks. It shall also include an assessment of the overall risk to the organization
               and the information contained in the system by operating the system as evaluated.
               The SCA is responsible for reviewing the RAR and providing feedback to the ISO regarding
               the completeness of the risk assessment and appropriateness of planned safeguards.
               The risk assessment and associated RAR must be reviewed and updated at least annually or
               whenever there are significant changes to the IS or environment of operation (including the
               identification of new threats and vulnerabilities), or other conditions that may impact the
               security state of the system.
          Control Enhancements: None.

          References: OMB Memorandum 04-04; NIST Special Publications 800-30, 800-39; Web:
          http://idmanagement.gov.

RA-4      RISK ASSESSMENT UPDATE

          [Withdrawn: Incorporated into RA-3].

RA-5      VULNERABILITY SCANNING

          Control: The organization:

          a.     Scans for vulnerabilities in the information system and hosted applications at least quarterly and
                 when new vulnerabilities potentially affecting the system/applications are identified and reported;

          b.     Employs vulnerability scanning tools and techniques that facilitate interoperability among tools and
                 automate parts of the vulnerability management process by using standards for:
                 1.   Enumerating platforms, software flaws, and improper configurations;
                 2.   Formatting checklists and test procedures; and
                 3.   Measuring vulnerability impact;
          c.     Analyzes vulnerability scan reports and results from security control assessments;
          d.     Remediates legitimate vulnerabilities [Assignment: organization-defined response times] in accordance
                 with an organizational assessment of risk; and
          e.     Shares information obtained from the vulnerability scanning process and security control assessments
                 with [Assignment: organization-defined personnel or roles] to help eliminate similar vulnerabilities in
                 other information systems (i.e., systemic weaknesses or deficiencies).
          Supplemental Guidance: Security categorization of information systems guides the frequency and
          comprehensiveness of vulnerability scans. Organizations determine the required vulnerability scanning for
          all information system components, ensuring that potential sources of vulnerabilities such as networked
          printers, scanners, and copiers are not overlooked. Vulnerability analyses for custom software applications
          may require additional approaches such as static analysis, dynamic analysis, binary analysis, or a hybrid of
          the three approaches. Organizations can employ these analysis approaches in a variety of tools (e.g., web-
          based application scanners, static analysis tools, binary analyzers) and in source code reviews.
          Vulnerability scanning includes, for example: (i) scanning for patch levels; (ii) scanning for functions,
          ports, protocols, and services that should not be accessible to users or devices; and (iii) scanning for
          improperly configured or incorrectly operating information flow control mechanisms. Organizations
          consider using tools that express vulnerabilities in the Common Vulnerabilities and Exposures (CVE)
          naming convention and that use the Open Vulnerability Assessment Language (OVAL) to determine/test
          for the presence of vulnerabilities. Suggested sources for vulnerability information include the Common
          Weakness Enumeration (CWE) listing and the National Vulnerability Database (NVD). In addition,
          security control assessments such as red team exercises provide other sources of potential vulnerabilities
          for which to scan. Organizations also consider using tools that express vulnerability impact by the Common
          Vulnerability Scoring System (CVSS). Related controls: CA-2, CA-7, CM-4, CM-6, RA-2, RA-3, SA-11,
          SI-2.
               Organizations shall use AO-approved vulnerability assessment tools and procedures on all
               systems to include weapon systems, satellite systems, networks, information systems and
               system applications, as appropriate. Vulnerability assessment tools shall have the capability
               to readily update the list of system vulnerabilities scanned.
               Security Classification Guides should address the protection of information revealing
               specific vulnerabilities (other than the known vulnerabilities of widely available commercial
               products) and the compiled results of vulnerability analyses for any DoD SAP systems. This
               information’s confidentiality requires protection and access to this information must be
               controlled IAW Program SCG.
               The ISSM/ISSO will ensure analysis of all vulnerability scan reports to determine whether
               reported vulnerabilities apply to the system. Some of the potential vulnerabilities reported by
               automated scanning tools may not represent real vulnerabilities in the context of the system
               environment. For example, some of the “vulnerabilities” flagged by the automated scanning
               software may not be applicable for a particular site (i.e., they may be false positives).
               Organizations shall attempt to discern what information about the system is discoverable by
               adversaries, document the information and determine potential risk.
               The ISO is responsible for ensuring all vulnerabilities are remediated based on guidance
               provided by the IAVM Program or AO. The ISO shall develop and maintain POA&Ms to

               address all vulnerabilities identified by scanning.
               Reference Incident Monitoring [IR-5] for more information on IAVM.
          Control Enhancements:
          (1)    VULNERABILITY SCANNING | UPDATE TOOL CAPABILITY
                 The organization employs vulnerability scanning tools that include the capability to readily update the information
                 system vulnerabilities to be scanned.
                 Supplemental Guidance: The vulnerabilities to be scanned need to be readily updated as new
                 vulnerabilities are discovered, announced, and scanning methods developed. This updating process
                 helps to ensure that potential vulnerabilities in the information system are identified and addressed as
                 quickly as possible. Related controls: SI-3, SI-7.
          (2)    VULNERABILITY SCANNING | UPDATE BY FREQUENCY / PRIOR TO NEW SCAN / WHEN IDENTIFIED
                 The organization updates the information system vulnerabilities scanned [Selection (one or more): within 30 days
                 prior to running scans, prior to a new scan; when new vulnerabilities are identified and reported].
                 Supplemental Guidance: Related controls: SI-3, SI-5.
          (3)    VULNERABILITY SCANNING | BREADTH / DEPTH OF COVERAGE
                 The organization employs vulnerability scanning procedures that can identify the breadth and depth of coverage (i.e.,
                 information system components scanned and vulnerabilities checked).
          (4)    VULNERABILITY SCANNING | DISCOVERABLE INFORMATION
                 The organization determines what information about the information system is discoverable by adversaries and
                 subsequently takes [Assignment: organization-defined corrective actions].
                 Supplemental Guidance: Discoverable information includes information that adversaries could obtain
                 without directly compromising or breaching the information system, for example, by collecting
                 information the system is exposing or by conducting extensive searches of the web. Corrective actions
                 can include, for example, notifying appropriate organizational personnel, removing designated
                 information, or changing the information system to make designated information less relevant or
                 attractive to adversaries. Related control: AU-13.
          (5)    VULNERABILITY SCANNING | PRIVILEGED ACCESS
                 The information system implements privileged access authorization to [Assignment: organization-identified
                 information system components] for selected [Assignment: organization-defined vulnerability scanning activities].
                 Supplemental Guidance: In certain situations, the nature of the vulnerability scanning may be more
                 intrusive or the information system component that is the subject of the scanning may contain highly
                 sensitive information. Privileged access authorization to selected system components facilitates more
                 thorough vulnerability scanning and also protects the sensitive nature of such scanning.
          (6)    VULNERABILITY SCANNING | AUTOMATED TREND ANALYSES
                 The organization employs automated mechanisms to compare the results of vulnerability scans over time to
                 determine trends in information system vulnerabilities.
                 Supplemental Guidance: Related controls: IR-4, IR-5, SI-4.
          (7)    VULNERABILITY SCANNING | AUTOMATED DETECTION AND NOTIFICATION OF UNAUTHORIZED COMPONENTS
                 [Withdrawn: Incorporated into CM-8].
          (8)    VULNERABILITY SCANNING | REVIEW HISTORIC AUDIT LOGS
                 The organization reviews historic audit logs to determine if a vulnerability identified in the information system has
                 been previously exploited.
                 Supplemental Guidance: Related control: AU-6.
          (9)    VULNERABILITY SCANNING | PENETRATION TESTING AND ANALYSES
                 [Withdrawn: Incorporated into CA-8].
          (10) VULNERABILITY SCANNING | CORRELATE SCANNING INFORMATION
                 The organization correlates the output from vulnerability scanning tools to determine the presence of multi-
                 vulnerability/multi-hop attack vectors.

          References: NIST Special Publications 800-40, 800-70, 800-115; Web: http://cwe.mitre.org,
          http://nvd.nist.gov.

RA-6      TECHNICAL SURVEILLANCE COUNTERMEASURES SURVEY

          Control: The organization employs a technical surveillance countermeasures survey at [Assignment:
          organization-defined locations] [Selection (one or more): [Assignment: organization-defined frequency];
          [Assignment: organization-defined events or indicators occur]].
          Supplemental Guidance:  Technical surveillance countermeasures surveys are performed by qualified
          personnel to detect the presence of technical surveillance devices/hazards and to identify technical security
          weaknesses that could aid in the conduct of technical penetrations of surveyed facilities. Such surveys
          provide evaluations of the technical security postures of organizations and facilities and typically include
          thorough visual, electronic, and physical examinations in and about surveyed facilities. The surveys also
          provide useful input into risk assessments and organizational exposure to potential adversaries.
          Control Enhancements: None.

          References: None.
