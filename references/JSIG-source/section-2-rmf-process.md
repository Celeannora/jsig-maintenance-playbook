# JSIG Section 2 RMF Process

Source URL: https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf and alternate DCSA URL https://www.dcsa.mil/Portals/69/documents/io/rmf/JSIG_2016April11_Final_(53Rev4).pdf

Extraction note: Verbatim/near-verbatim extraction via document-aware fetch, retrieved 2026-07-17. Tool-returned content follows; no content has been inferred beyond the returned extraction. Primary URL returned Sections 2.1 and 2.2.1-2.2.2 ending mid-sentence; alternate DCSA URL returned Sections 2.3-2.3.6.

---

## 2 RISK MANAGEMENT FRAMEWORK (RMF)

### 2.1 Introduction to the RMF
NIST, in partnership with DoD, the Office of the Director of National Intelligence (ODNI), and CNSS, developed a common information security framework for the federal government and its contractors to improve information security, strengthen risk management processes, and encourage reciprocity among federal agencies.  NIST SP 800-37, developed by the Joint Task Force (JTF) Transformation Initiative Working Group, transforms the traditional C&A process into the six-step RMF.  The revised process emphasizes:
- Building information security capabilities into federal information systems through the application of community best practices for management, operational, and technical security controls;
- Maintaining awareness of the security state of information systems on an ongoing basis through enhanced monitoring processes; and
- Providing essential information to senior leaders to facilitate decisions regarding the acceptance of risk to organizational operations and assets, individuals, other organizations, and national security arising from the operation and use of information systems.

The six-step RMF is depicted in Figure 2-1.  The RMF steps include:
1. Categorize the IS and the information processed, stored, and transmitted by the system based on an analysis of the impact due to a loss of confidentiality, integrity, and availability.
2. Select an initial set of baseline security controls for the IS based on the security categorization; apply overlay(s), if applicable; then tailor the security control baseline as needed based on an organizational assessment of risk and local conditions.
3. Implement the security controls and describe how the controls are employed within the IS and its environment of operation.
4. Assess the security controls using appropriate assessment procedures to determine the extent to which the controls are implemented correctly, operating as intended, and producing the desired outcome with respect to meeting the security requirements for the system.
5. Authorize IS operation based on a determination of the risk to organizational operations and assets, individuals, other organizations, and national security resulting from the operation of the IS and the decision that this risk is acceptable.
6. Monitor the security controls in the IS on an ongoing basis to include assessing control effectiveness, documenting changes to the system or its environment of operation, conducting security impact analyses of the associated changes, and reporting the security state of the system to designated organizational officials.

Figure 2-1:  Risk Management Framework (RMF)

Each RMF step includes associated tasks to be carried out by the appropriate organization or individual.  These steps and the tasks associated with them, as they apply to the DoD SAP Community and to all IS under the purview of the cognizant SAP AO, are described briefly in Section 2.3.  For additional details regarding RMF, see NIST SP 800-37.

### 2.2 FUNDAMENTALS OF THE RMF

#### 2.2.1 Organization-Wide Risk Management
Managing information system-related security risks is a complex, multifaceted undertaking that requires the involvement of the entire organization—from senior leaders providing the strategic vision and top-level goals and objectives for the organization, to mid-level leaders planning and managing projects, to individuals on the front lines developing, implementing, and operating the systems supporting the organization’s core missions and business processes.  Risk management can be viewed as a holistic activity that is fully integrated into every aspect of the organization.  Figure 2-2 illustrates a three-tiered approach to risk management that addresses risk-related concerns at the organization level, the mission and business process level and the information system level.  Risk assessments, as described in NIST SP 800-30, provide critical details that guide and inform the security control selection process.

Figure 2-2:  Tiered Risk Management Approach

Tier 1 addresses risk from an organizational perspective with the development of a comprehensive governance structure and organization-wide risk management strategy.  For the DoD SAP Community, this includes governance provided by the DoD, DoD SAPCO and respective Service/Agency SAPCOs and includes the:
- Techniques and methodologies the organization plans to employ to assess information system-related security risks and other types of risk of concern to the organization;
- Methods and procedures the organization plans to use to evaluate the significance of the risks identified during the risk assessment;
- Types and extent of risk mitigation measures the organization plans to employ to address identified risks;
- Level of risk the organization is willing to accept (i.e., risk tolerance);
- Organization’s plans to monitor risk on an ongoing basis given the inevitable changes to organizational information systems and their environments of operation; and
- Degree and type of oversight the organization plans to use to ensure that the risk management strategy is being effectively carried out.

Tier 2 addresses risk from a mission and business process perspective and is guided by the risk decisions at Tier 1.  Tier 2 activities are closely associated with enterprise architecture, to include Wide Area Network (WAN) services (i.e., backbone communications), enterprise services (such as audit reduction tools, network monitoring tools, identity management systems), and services provided across a site/campus (e.g., physical and personnel security).  Because subordinate organizations responsible for carrying out derivative or related missions and business processes may have already invested in their own methods of assessing, evaluating, mitigating, accepting and monitoring risk, parent organizations may allow a greater degree of autonomy within parts of the organization or across the entire organization in order to minimize costs.  When a diversity of risk assessment methods is allowed, organizations may choose to employ, when feasible, some means of integration of the risk-related information to ensure that the output of the different risk assessment activities can be correlated in a meaningful manner.

Tier 3 addresses risk from an information system perspective and is guided by the risk decisions at Tiers 1 and 2.  Risk decisions at Tiers 1 and 2 impact the ultimate selection and deployment of needed safeguards and countermeasures (i.e., security controls) at the information system level.  Information security requirements are satisfied by the selection and successful implementation of appropriate management, operational, and technical security controls from NIST SP 800-53.  For all DoD SAP information systems under the purview of the cognizant SAP AO, security control selection is guided by the RMF process as directed by DoDM 5205.07, DoD SAP Security Manual, and described in the JSIG (i.e., this document) in Section 2.3 below.

#### 2.2.2 System Development Life Cycle (SDLC)
All federal information systems, including operational systems, systems under development, and systems undergoing modification or upgrade, are in some phase of a SDLC.  NIST identifies five phases of a general SDLC as Initiation, Acquisition/Development, Implementation/Assessment, Operations/Maintenance, and Disposition/Sunset.   Risk management tasks begin early in the SDLC and are important in shaping the security capabilities of the information system.  If these tasks are not adequately performed during the initiation, development, and acquisition phases of the SDLC, the tasks will, by necessity, be undertaken later in the life


2.3 RMF SIX-STEP PROCESS  
2.3.1 RMF Step 1, Categorize  
The first step in the RMF is to categorize the information system and the information processed, stored, and transmitted by the system based on an analysis of the impact due to a loss of confidentiality, integrity, and availability.  Categorization provides the foundation for the security control selection process.  Information system categorization is accomplished in accordance with CNSSI 1253 and FIPS 199.  For all SAP information systems, the confidentiality impact level must be determined using the Confidentiality Impact Level Flowchart in Appendix D.  The Categorize step includes the following tasks:  
• Categorize the system and information processed, stored, and transmitted by the system based on an analysis of the impact due to a loss of confidentiality, integrity, and availability.  
• Consider results from the security categorization of the system in light of the existing environment of operation, existing or planned common controls, and any privacy requirements associated with the information processed, stored, or transmitted by the system.  
• Ensure that the security categorization reflects the full range of potential adverse impacts to organizational operations and assets, individuals, other organizations, and national security.  
• Determine the security categorization of the information system and the information processed, stored, and transmitted by the system in accordance with CNSSI 1253 and FIPS 199.  
• Determine the confidentiality impact level using the Confidentiality Impact Level Flowchart in Appendix D.  
• Document the security categorization and confidentiality impact level in the SSP.  
• Review and approve the security categorization and confidentiality impact level.  
• Identify and document the security categorization and confidentiality impact level in the SAR.  
• Identify and document the security categorization and confidentiality impact level in the POA&M, if applicable.  
• Determine whether the system requires an ISSE.  In general, an ISSE is required for new information systems and significant upgrades or changes to existing information systems.  The ISSE may also be required for systems that have significant security requirements or where the system is being developed by a contractor.  
• Determine whether a CCP has been identified for the system.  
• Determine whether common controls will be inherited by the system.  
• Determine whether the system will be interconnected with other systems.  
• Determine whether the system will use external information systems.  
• Determine whether the system will process, store, or transmit privacy information.  
• Determine whether the system will require an initial or updated risk assessment.  
• Determine whether the system will require a security assessment plan.  
• Determine whether the system will require an authorization package.  
• Determine whether the system will require a reauthorization decision.  
• Determine whether the system will require a continuous monitoring strategy.  
• Determine whether the system will require any special considerations due to the mission or business process supported by the system.  
• Determine whether the system will require any special considerations due to external/shared services or partner arrangements.  
• Determine whether the system will require any special considerations due to mission, business, operational, counterintelligence, civil liberties, or privacy concerns.  
• Determine whether the system will require any special considerations due to acquisition, development, or operational status.  
• Determine whether the system will require any special considerations due to changes in the environment of operation.  
• Determine whether the system will require any special considerations due to changes in the system boundary.  

2.3.2 RMF Step 2, Select  
The second step in the RMF is to select an initial set of baseline security controls for the information system based on the security categorization; apply overlays, if applicable; and tailor the security control baseline as needed based on an organizational assessment of risk and local conditions.  Security control selection is accomplished in accordance with CNSSI 1253, FIPS 200, and NIST SP 800-53.  The Select step includes the following tasks:  
• Select the initial set of baseline security controls from the appropriate SAP security control baseline in Appendix C based on the security categorization of the system.  
• Apply any applicable overlays.  
• Tailor the security control baseline as needed based on organizational risk assessment and local conditions.  
• Document the selected controls, overlays, and tailoring decisions in the SSP.  
• Review and approve the security controls, overlays, and tailoring decisions.  
• Identify and document the security controls, overlays, and tailoring decisions in the SAR.  
• Identify and document the security controls, overlays, and tailoring decisions in the POA&M, if applicable.  
• Determine whether any controls are non-tailorable.  
• Determine whether any controls require implementation in a specific manner.  
• Determine whether any controls require approval by the component SAP senior authorizing official for waiver or modification.  
• Determine whether any controls require additional implementation guidance.  
• Determine whether the selected controls are affected by common controls inherited from other systems or organizations.  
• Determine whether the selected controls are affected by interconnections with other systems.  
• Determine whether the selected controls are affected by external information systems.  
• Determine whether the selected controls are affected by privacy requirements.  
• Determine whether the selected controls are affected by mission or business process requirements.  
• Determine whether the selected controls are affected by environment of operation requirements.  
• Determine whether the selected controls are affected by acquisition, development, or operational status.  
• Determine whether the selected controls are affected by changes in the system boundary.  
• Determine whether the selected controls are affected by changes in the system environment.  

Table 2-1:  Confidentiality Impact Level Adjustments  
No content available in the provided page text for Table 2-1.  

Table 2-2:  Overlay Applicability  
No content available in the provided page text for Table 2-2.  

2.3.3 RMF Step 3, Implement (Develop/Build)  
The third step in the RMF is to implement the security controls and describe how the controls are employed within the information system and its environment of operation.  Security control implementation includes the development and/or acquisition of common controls and system-specific controls.  The Implement step includes the following tasks:  
• Implement the security controls selected for the system.  
• Describe how the controls are employed within the system and its environment of operation.  
• Document the implementation of the controls in the SSP.  
• Review and approve the implementation of the controls.  
• Ensure the implementation of the controls satisfies the security requirements of the system.  
• Ensure the implementation of the controls is consistent with the system boundary.  
• Ensure the implementation of the controls is consistent with inherited common controls.  
• Ensure the implementation of the controls is consistent with interconnections to other systems.  
• Ensure the implementation of the controls is consistent with external information systems.  
• Ensure the implementation of the controls is consistent with privacy requirements.  
• Ensure the implementation of the controls is consistent with mission or business process requirements.  
• Ensure the implementation of the controls is consistent with the environment of operation.  
• Ensure the implementation of the controls is consistent with acquisition, development, or operational status.  
• Ensure the implementation of the controls is consistent with changes in the system boundary.  
• Ensure the implementation of the controls is consistent with changes in the system environment.  
• Ensure the implementation of the controls is consistent with any specific implementation guidance for the controls.  
• Ensure the implementation of non-tailorable controls is consistent with the JSIG.  
• Ensure the implementation of non-tailorable controls is not tailored out.  
• Ensure the implementation of any required waivers or modifications is approved by the component SAP senior authorizing official.  
• Ensure the implementation of the controls is supported by security documentation.  
• Ensure the implementation of the controls is supported by the Security Assessment Plan.  
• Ensure the implementation of the controls is supported by the Security Assessment Report.  
• Ensure the implementation of the controls is supported by the POA&M, if applicable.  

2.3.4 RMF Step 4, Assess (Test)  
The fourth step in the RMF is to assess the security controls using appropriate assessment procedures to determine the extent to which the controls are implemented correctly, operating as intended, and producing the desired outcome with respect to meeting the security requirements for the system.  Security control assessment is accomplished in accordance with NIST SP 800-53A.  The Assess step includes the following tasks:  
• Develop a Security Assessment Plan.  
• Review the SSP, security control baseline, and applicable overlays.  
• Review the security control implementation for the system.  
• Determine whether the security controls are implemented correctly.  
• Determine whether the security controls are operating as intended.  
• Determine whether the security controls are producing the desired outcome with respect to meeting the security requirements for the system.  
• Conduct security assessment activities using appropriate assessment procedures.  
• Document assessment results in the SAR.  
• Identify weaknesses or deficiencies discovered in the system and its environment of operation.  
• Recommend corrective actions to address identified vulnerabilities.  
• Ensure the security assessment covers the management, operational, and technical controls employed within or inherited by the system.  
• Ensure the security assessment considers common controls inherited by the system.  
• Ensure the security assessment considers interconnections with other systems.  
• Ensure the security assessment considers external information systems.  
• Ensure the security assessment considers privacy requirements.  
• Ensure the security assessment considers mission or business process requirements.  
• Ensure the security assessment considers the environment of operation.  
• Ensure the security assessment considers acquisition, development, or operational status.  
• Ensure the security assessment considers changes in the system boundary.  
• Ensure the security assessment considers changes in the system environment.  
• Ensure the security assessment considers any specific implementation guidance for the controls.  
• Ensure the security assessment considers non-tailorable controls.  
• Ensure the security assessment considers any approved waivers or modifications by the component SAP senior authorizing official.  
• Submit the final SAR to the AO.  
• Ensure the system POA&M reflects identified weaknesses and suspense dates.  

2.3.5 RMF Step 5, Authorize (Deploy/Operate)  
The fifth step in the RMF is to authorize information system operation based on a determination of the risk to organizational operations and assets, individuals, other organizations, and national security resulting from the operation of the information system and the decision that this risk is acceptable.  Authorization is accomplished by a senior official with the authority to formally accept the risk to organizational operations and assets, individuals, other organizations, and national security.  The Authorize step includes the following tasks:  
• Review the security authorization package.  
• Review the SSP.  
• Review the SAR.  
• Review the POA&M.  
• Review the risk assessment.  
• Review the security control implementation.  
• Review the security categorization.  
• Review the selected security controls, overlays, and tailoring decisions.  
• Review the results of the security assessment.  
• Determine whether the security authorization package is complete.  
• Determine whether the security requirements of the system have been satisfied.  
• Determine whether the residual risk is acceptable.  
• Determine whether the system can be authorized to operate.  
• Determine whether the system requires additional risk mitigation.  
• Determine whether the system requires a denial of authorization to operate.  
• Determine whether the system requires a halt to operations if unacceptable risks exist and the system is operational.  
• Issue and maintain the written security authorization decision.  
• Document the authorization decision in the security authorization package.  
• Document the authorization decision in the SSP, SAR, and POA&M, as applicable.  
• Coordinate the authorization decision with the REF, CIO, CISO, CCP, ISO, ISSM/ISSO, SCA, PSO, and other interested parties.  
• Determine whether any agreements are required among multiple authorizing officials.  
• Ensure any agreements among multiple authorizing officials are documented in the security plan.  
• Determine whether any reauthorization is required due to significant changes in the system or environment of operation.  
• Determine whether any waiver or modification of non-tailorable controls has been approved by the component SAP senior authorizing official.  
• Ensure the authorization decision is made in accordance with DoDM 5205.07-V1 and the JSIG.  

2.3.6 RMF Step 6, Monitor  
The sixth step in the RMF is to monitor the security controls in the information system on an ongoing basis to include assessing control effectiveness, documenting changes to the system or its environment of operation, conducting security impact analyses of the associated changes, and reporting the security state of the system to designated organizational officials.  Continuous monitoring is accomplished in accordance with NIST SP 800-37 and NIST SP 800-137.  The Monitor step includes the following tasks:  
• Continuously monitor security controls and the security state of the system.  
• Assess control effectiveness on an ongoing basis.  
• Document changes to the system or its environment of operation.  
• Conduct security impact analyses of associated changes.  
• Report the security state of the system to designated organizational officials.  
• Update the SSP as needed to reflect changes to the system, controls, or environment of operation.  
• Update the SAR as needed to reflect changes to the system, controls, or environment of operation.  
• Update the POA&M as needed to reflect changes to the system, controls, or environment of operation.  
• Update the risk assessment as needed.  
• Reassess security controls as needed.  
• Review audit records, vulnerabilities, and security alerts.  
• Track remediation of weaknesses and vulnerabilities.  
• Ensure changes that may affect the authorization are formally notified to the ISSM and AO/DAO.  
• Ensure the AO is informed of significant changes that may require reauthorization.  
• Ensure the continuous monitoring strategy is implemented.  
• Ensure ongoing monitoring considers common controls inherited by the system.  
• Ensure ongoing monitoring considers interconnections with other systems.  
• Ensure ongoing monitoring considers external information systems.  
• Ensure ongoing monitoring considers privacy requirements.  
• Ensure ongoing monitoring considers mission or business process requirements.  
• Ensure ongoing monitoring considers the environment of operation.  
• Ensure ongoing monitoring considers acquisition, development, or operational status.  
• Ensure ongoing monitoring considers changes in the system boundary.  
• Ensure ongoing monitoring considers changes in the system environment.  
• Ensure ongoing monitoring considers any approved waivers or modifications to non-tailorable controls.  
• Ensure ongoing monitoring considers specific implementation guidance for controls.  
• Ensure ongoing monitoring is reflected in the security authorization package.  

Figure 2-3:  Alignment of RMF and DoD System Acquisition Activities
