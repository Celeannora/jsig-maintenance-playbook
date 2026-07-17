# JSIG Chapter 3 Security Assessment and Authorization (CA) Family

Source URL: https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Extraction note: Verbatim/near-verbatim extraction via document-aware fetch, retrieved 2026-07-17. Tool-returned content follows; no content has been inferred beyond the returned extraction.

---

FAMILY:  SECURITY ASSESSMENT AND AUTHORIZATION

CA-1 SECURITY ASSESSMENT AND AUTHORIZATION POLICY AND PROCEDURES

Control:
The organization:
a. Develops, documents, and disseminates to [Assignment: organization-defined personnel or roles]:
1. A security assessment and authorization policy that addresses purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance; and
2. Procedures to facilitate the implementation of the security assessment and authorization policy and associated security assessment and authorization controls;
b. Reviews and updates the current:
1. Security assessment and authorization policy [Assignment: organization-defined frequency]; and
2. Security assessment and authorization procedures [Assignment: organization-defined frequency].

Supplemental Guidance:
This control is intended to facilitate the development and implementation of policies and procedures for the security assessment and authorization family. Security assessment and authorization policies and procedures at the organization level are developed in accordance with applicable laws, Executive Orders, directives, regulations, policies, standards, and guidance. Security assessment and authorization policies and procedures can be included as part of the general information security policy and/or procedure for the organization. Security assessment and authorization procedures describe how the organization implements the policies and associated security assessment and authorization controls. The policies and procedures are consistent with applicable Federal laws, Executive Orders, directives, policies, regulations, standards, and guidance. The documentation of policies and procedures facilitates security planning, implementation, and monitoring, and informs system development life cycle activities. Security assessment and authorization policy and procedures are coordinated with other organizational entities including, for example, personnel security, physical security, privacy, legal, and acquisition. The current security assessment and authorization policy and procedures are available to [Assignment: organization-defined personnel or roles].

Related Controls: PL-1, PM-9, PM-10, PS-1.

Control Enhancements: None.

References: CNSS Instruction 1253, NIST Special Publications 800-37, 800-53, 800-53A.

Priority and Baseline Allocation:
P1 L, M, H.

CA-2 SECURITY ASSESSMENTS

Control:
The organization:
a. Develops a security assessment plan that describes the scope of the assessment including:
1. Security controls and control enhancements under assessment;
2. Assessment procedures to be used to determine security control effectiveness; and
3. Assessment environment, assessment team, and assessment roles and responsibilities;
b. Assesses the security controls in the information system and its environment of operation [Assignment: organization-defined frequency] to determine the extent to which the controls are implemented correctly, operating as intended, and producing the desired outcome with respect to meeting established security requirements;
c. Produces a security assessment report that documents the results of the assessment; and
d. Provides the results of the security control assessment to [Assignment: organization-defined personnel or roles].

JSIG Tailoring:
In the DoD SAP Community, the security assessment plan is comprised of the system security plan (SSP), Security Control Traceability Matrix (SCTM), and Security Control Assessment Procedures. The security assessment report is the Security Assessment Report (SAR). The security assessment plan is reviewed and approved by the Security Control Assessor (SCA). The SCA conducts or oversees the security control assessment. Security assessment results are provided to the Authorizing Official (AO) and other designated officials as appropriate.

Supplemental Guidance:
The organization assesses security controls in organizational information systems and the environment in which those systems operate as part of:
1. A continuous monitoring strategy;
2. Formal authorizations;
3. The system development life cycle; and
4. Changes in the risk environment or operational environment.
Assessment procedures are developed consistent with applicable laws, Executive Orders, directives, policies, standards, and guidance. Security controls are assessed before the information system is authorized to operate and thereafter periodically in accordance with the organization’s continuous monitoring strategy. Assessments are conducted by qualified assessors with an appropriate level of independence. Security assessments are also used to support security authorization decisions and the ongoing monitoring of information systems. Security assessment reports contain the findings, recommendations, and results from the assessment of the security controls. Security assessment results are made available to appropriate organizational personnel, including, for example, senior leaders and authorizing officials.

Related Controls: CA-5, CA-6, CM-4, PM-9, PM-10, PM-14, SI-2.

Control Enhancements:
(1) INDEPENDENT ASSESSMENT | INDEPENDENT ASSESSORS
The organization employs independent assessors to assess the security controls in the information system and its environment of operation.

(2) SPECIALIZED ASSESSMENTS
The organization includes as part of security control assessments, [Assignment: organization-defined frequencies], assessments that are based upon methodologies, procedures, and techniques such as penetration testing, red team exercises, and other forms of adversarial testing.

(3) EXAMINATION OF ASSURANCE OBJECTIVES
The organization, in the security assessment plan and the security assessment report, defines and monitors the assurance objectives and assurance measures associated with the security controls.

References: CNSS Instruction 1253, NIST Special Publications 800-37, 800-53A.

Priority and Baseline Allocation:
P1 L, M, H.

CA-3 SYSTEM INTERCONNECTIONS

Control:
The organization:
a. Authorizes the connection of the information system to an external information system, based on an assessment of risk and in accordance with the organization’s information security architecture and requirements;
b. Documents, for each interconnection, the interface characteristics, security requirements, and the nature of the information communicated;
c. Reviews and updates the interconnections [Assignment: organization-defined frequency];
d. Employs [Assignment: organization-defined controls] to safeguard the interconnection; and
e. Disables, when no longer needed, the connection of the information system to the external information system or terminates the interconnection.

Supplemental Guidance:
The organization authorizes the connection of the information system to an external information system or a subsystem using a system interconnection security agreement, memorandum of agreement or understanding, or other formal agreement. The organization can use a number of methods to identify and verify the security controls employed on interconnecting systems, including, for example, system security plans, security assessment reports, or other equivalent documents. The organization ensures that the interconnection agreement addresses the minimum security requirements and controls that are to be implemented on the external information system. This control applies to all types of information systems, including, for example, operating systems, databases, and applications. The organization coordinates security requirements and controls with other organizations, including those that own or operate the connected systems, and includes the security requirements in the formal agreement. The agreement specifies, for example, security controls, connectivity details, roles and responsibilities, authority to disconnect, reporting requirements, and terms and conditions for the interconnection. The organization considers reciprocity for any controls already in place.

Related Controls: AC-4, CA-2, CA-7, IA-2, IA-3, SA-9.

Control Enhancements: None.

References: CNSS Instruction 1253, NIST Special Publications 800-37, 800-47, 800-53.

Priority and Baseline Allocation:
P1 L, M, H.

CA-4 SECURITY CERTIFICATION

Control:
The organization:
a. Develops, documents, and implements a security certification process for the information system;
b. Submits the security certification to the authorizing official for approval;
c. Updates the security certification [Assignment: organization-defined frequency]; and
d. Revises the security certification before making significant changes to the information system or its environment of operation.

Supplemental Guidance:
Security certification is a process used to support the authorization decision. The certification process includes the security control assessment and the determination of the completeness and adequacy of the security documentation. Security certification is not synonymous with authorization. Security certification can be used to support a variety of security management functions, including, for example, security authorizations, system development life cycle decisions, and security continuous monitoring. The certification process is conducted by an independent organization or individual, as appropriate.

Related Controls: CA-2, CA-5, CA-6, PM-10.

Control Enhancements: None.

References: CNSS Instruction 1253, NIST Special Publications 800-37, 800-53A.

Priority and Baseline Allocation:
P1 L, M, H.

CA-5 PLAN OF ACTION AND MILESTONES

Control:
The organization:
a. Develops a plan of action and milestones for the information system to document the organization’s planned, implemented, and remedial actions to correct deficiencies noted during the assessment of the security controls and to reduce or eliminate known vulnerabilities in the system;
b. Updates the existing plan of action and milestones [Assignment: organization-defined frequency] based on the findings from security assessments, security impact analyses, and continuous monitoring activities;
c. Establishes a remediation process for any security controls that are not implemented correctly, operating as intended, or producing the desired outcome with respect to meeting established security requirements;
d. Assigns responsibilities, resources, and completion dates for corrective actions; and
e. Tracks and reports progress in correcting deficiencies.

Supplemental Guidance:
Plans of action and milestones are a critical component of the security authorization package and the organization’s risk management process. POA&Ms are used to document and manage the remediation of vulnerabilities and weaknesses identified in the information system, in the environment of operation, or in inherited common controls. POA&Ms are maintained in accordance with organizational policy and applicable laws, Executive Orders, directives, policies, regulations, standards, and guidance. The plan of action and milestones may be used to document remedial actions to be taken in response to findings from security assessments, security impact analyses, or the continuous monitoring process. When a weakness is identified, the organization determines whether corrective actions are required and, if so, the actions to be taken, resources required, and the date by which the actions are expected to be completed. POA&M items are tracked to completion or until the risk is otherwise accepted by the authorizing official.

Related Controls: CA-2, CA-4, CA-6, CM-4, PM-4, PM-9, SI-2.

Control Enhancements: None.

References: CNSS Instruction 1253, NIST Special Publications 800-37, 800-53.

Priority and Baseline Allocation:
P1 L, M, H.

CA-6 SECURITY AUTHORIZATION

Control:
The organization:
a. Assigns a senior-level authorizing official to formally accept the risk associated with the operation of the information system;
b. Ensures that the authorizing official accepts the security authorization package, signs and approves a plan of action and milestones, and authorizes the information system to operate at an acceptable level of risk prior to operation; and
c. Updates the security authorization [Assignment: organization-defined frequency] and whenever there is a significant change to the information system or its environment of operation.

JSIG Tailoring:
In the DoD SAP Community, the Authorizing Official (AO) is the official responsible for authorization of the information system to operate. For SAP systems, the AO may delegate certain responsibilities to a Delegated Authorizing Official (DAO) as appropriate. For systems that require multiple authorizing officials, agreements are established among the authorizing officials and documented in the system security plan. The SAP Senior Authorizing Official is the waiver authority for non-tailorable controls and this authority cannot be delegated.

Supplemental Guidance:
The authorizing official is a senior organizational official or executive with the authority to formally assume responsibility for operating an information system at an acceptable level of risk to organizational operations and assets, individuals, other organizations, and national security. The authorizing official’s formal authorization represents an organizational decision to accept the risk and authorize the operation of the system. The authorization decision is based on the results of the security assessment and the effectiveness of the security controls. The authorizing official considers all relevant facts and circumstances regarding the security of the system. Authorization is supported by the security authorization package. Authorization decisions are documented and retained in accordance with organizational policy and applicable laws, Executive Orders, directives, policies, regulations, standards, and guidance.

Related Controls: CA-2, CA-4, CA-5, PM-10.

Control Enhancements:
(1) METRICS
The organization employs metrics to determine the frequency and effectiveness of the information system authorization process.

(2) AUTOMATED SUPPORT FOR MONITORING AND REAUTHORIZATION
The organization uses automated mechanisms to support the continuous monitoring of security controls and to assist in the reauthorization of the information system.

References: CNSS Instruction 1253, NIST Special Publications 800-37, 800-53.

Priority and Baseline Allocation:
P1 L, M, H.

CA-8 PENETRATION TESTING

Control:
The organization conducts penetration testing [Assignment: organization-defined frequency] on information systems and environments of operation.

Supplemental Guidance:
Penetration testing is a specialized assessment conducted to identify vulnerabilities in an information system and the environment in which it operates by simulating the actions of attackers. Penetration testing may include the use of automated tools and techniques to exploit vulnerabilities. Penetration testing is conducted by qualified assessors with appropriate skills and expertise and in a manner commensurate with the organization’s risk tolerance. Penetration testing is conducted in accordance with applicable laws, Executive Orders, directives, policies, standards, and guidance. The results of penetration testing are used to support risk management and security authorization decisions.

Related Controls: CA-2, RA-5, SA-11, SI-2, SI-4.

Control Enhancements:
(1) INDIVIDUALS WITHOUT PRIOR KNOWLEDGE OF THE INFORMATION SYSTEM DESIGN
The organization employs penetration testers who are independent of the information system development and operation teams and who have no prior knowledge of the information system design.

(2) TESTING TOWARD CERTAIN THREATS AND VULNERABILITIES
The organization includes in the penetration testing, [Assignment: organization-defined threats and vulnerabilities].

References: NIST Special Publications 800-37, 800-53A, 800-115.

Priority and Baseline Allocation:
P1 L, M, H.

CA-9 INTERNAL SYSTEM CONNECTIONS

Control:
The organization:
a. Authorizes internal connections of [Assignment: organization-defined information system components or classes of components] to the information system; and
b. Documents, for each internal connection, the interface characteristics, security requirements, and the nature of the information communicated.

Supplemental Guidance:
The organization manages internal connections between system components to prevent security issues, including, for example, allowing access to an information system from a system component that is not authorized or that does not meet the security requirements for the system. Internal connections are distinct from system interconnections with external systems. The organization documents the security requirements and controls that are applicable to the internal connections. The organization may use a number of methods to identify and verify the security controls employed on internal connections, including, for example, system security plans, security assessment reports, or other equivalent documents.

Related Controls: AC-4, CA-3, CM-8, SA-9.

Control Enhancements: None.

References: NIST Special Publications 800-37, 800-53.

Priority and Baseline Allocation:
P1 L, M, H.
