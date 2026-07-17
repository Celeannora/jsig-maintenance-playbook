# JSIG Chapter 3 Configuration Management (CM) Family

Source URL: https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Extraction note: Verbatim/near-verbatim extraction via document-aware fetch, retrieved 2026-07-17. Tool-returned content follows; no content has been inferred beyond the returned extraction.

---

CM-1 CONFIGURATION MANAGEMENT POLICY AND PROCEDURES

Control:
The organization:

a. 
Develops, documents, and disseminates to [Assignment: organization-defined personnel or roles]:

1. 
A configuration management policy that addresses purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance; and

2. 
Procedures to facilitate the implementation of the configuration management policy and associated configuration management controls; and

b. 
Reviews and updates the current:

1. 
Configuration management policy [Assignment: organization-defined frequency]; and

2. 
Configuration management procedures [Assignment: organization-defined frequency].

Supplemental Guidance:
Configuration management relates to establishing and maintaining consistency of the information system, including system hardware, software, firmware, and documentation, throughout the system development life cycle. Configuration management involves the development, implementation, and monitoring of policies, principles, and practices for controlling changes to the configuration items in the information system.

Configuration management means that the organization documents, approves, controls, and audits changes to the information system and maintains an inventory of all configuration items and the associated configuration settings. Configuration management is used to control and track changes to the information system and its components to help ensure the system operates correctly and securely. It includes changes to hardware, software, firmware, documentation, test, and validation activities. Configuration management of the information system includes the management of patches, service packs, upgrades, and software/hardware replacements.

Configuration management also includes the assignment of configuration item ownership and the maintenance of configuration item status accounting and configuration auditing. Configuration management policy and procedures are consistent with applicable federal laws, Executive Orders, directives, policies, regulations, standards, and guidance.

Related Controls: CA-7, CM-2, CM-3, CM-4, CM-5, CM-6, CM-7, CM-8, CM-9, CM-10, CM-11, SA-4, SA-8, SA-10, SA-11, SA-12, SA-15, SA-16, SA-17, SA-18, SA-19, SA-20, SA-21, SA-22, SI-2, SI-4, SI-7.

CM-2 BASELINE CONFIGURATION

Control:
The organization develops, documents, and maintains under configuration control, a current baseline configuration of the information system.

Supplemental Guidance:
Baseline configurations for information systems and system components include communications links, mission and/or business applications, physical and logical controls, cryptographic key management, and all software and firmware installed on those systems and components. Baseline configurations provide information about information system components and the details of how they are configured.

The baseline configuration is used as a starting point for future builds, releases, and changes to the information system. Baseline configurations include the operational configuration and the authorized software versions.

The organization reviews and updates the baseline configuration of the information system [Assignment: organization-defined frequency].

Related Controls: CM-3, CM-6, CM-8, CM-9, CM-10, CM-11, SA-10, SA-15, SA-17, SA-18, SA-19, SA-22, SI-2, SI-4, SI-7.

CM-3 CONFIGURATION CHANGE CONTROL

Control:
The organization:

a. 
Determines the types of changes to the information system that are configuration-controlled;

b. 
Approves configuration-controlled changes to the information system with explicit consideration for security impact analyses;

c. 
Documents approved configuration-controlled changes to the information system;

d. 
Retains records of configuration-controlled changes to the information system for [Assignment: organization-defined time period];

e. 
Audits and reviews configuration-controlled changes to the information system [Assignment: organization-defined frequency]; and

f. 
Coordinates and provides oversight for configuration change control activities through [Assignment: organization-defined configuration change control board].

Supplemental Guidance:
Configuration change control includes changes to hardware, software, firmware, documentation, and test and validation activities. The organization determines the type of changes to the information system that are configuration-controlled. Configuration change control is intended to prevent unauthorized changes to information systems and to ensure that changes are approved and tested prior to implementation. The configuration change control process is formally established and implemented to ensure that all changes to the information system, and the associated documentation, are appropriately reviewed, approved, documented, and tested prior to implementation.

Configuration change control also includes the use of emergency change procedures, when needed, to expedite changes that are necessary to correct a critical problem or to address a security concern.

Related Controls: AC-3, CM-2, CM-4, CM-5, CM-6, CM-8, CM-10, CM-11, SA-4, SA-8, SA-10, SA-11, SA-15, SA-16, SA-17, SA-18, SA-19, SA-20, SA-21, SA-22, SI-2, SI-4, SI-7.

CM-4 SECURITY IMPACT ANALYSIS

Control:
The organization analyzes changes to the information system to determine potential security impacts prior to change implementation.

Supplemental Guidance:
Security impact analysis is part of the configuration change control process. Security impact analyses are conducted on all changes, including those made for emergency maintenance, repairs, and upgrades. Security impact analysis considers the effects of changes on the security state of the information system. The analysis includes an assessment of the types of changes being made, the potential effects on the security controls, and the potential impacts on the confidentiality, integrity, and availability of information.

Related Controls: CM-3, CM-5, CM-6, CM-7, CM-8, CM-10, CM-11, SA-4, SA-8, SA-10, SA-11, SA-15, SA-16, SA-17, SA-18, SA-19, SA-20, SA-21, SA-22, SI-2, SI-4, SI-7.

CM-5 ACCESS RESTRICTIONS FOR CHANGE

Control:
The organization defines, documents, approves, and enforces physical and logical access restrictions associated with changes to the information system.

Supplemental Guidance:
Access restrictions for change are enforced using access control mechanisms and procedures. The organization limits access to information system components to authorized individuals and enforces change access restrictions. The organization restricts the ability to introduce, change, or remove information system components based on a need-to-know, least privilege, and separation of duties.

Related Controls: AC-2, AC-3, AC-5, CM-3, CM-4, CM-6, CM-8, CM-10, CM-11, SA-4, SA-8, SA-10, SA-11, SA-15, SA-16, SA-17, SA-18, SA-19, SA-20, SA-21, SA-22, SI-2, SI-4, SI-7.

CM-6 CONFIGURATION SETTINGS

Control:
The organization:

a. 
Establishes and documents configuration settings for information technology products employed within the information system that reflect the most restrictive mode consistent with operational requirements using [Assignment: organization-defined common secure configuration settings];

b. 
Implements the configuration settings;

c. 
Identifies, documents, and approves any deviations from established configuration settings for [Assignment: organization-defined information system components] based on [Assignment: organization-defined operational requirements]; and

d. 
Monitors and controls changes to the configuration settings in accordance with organizational policies and procedures.

Supplemental Guidance:
Configuration settings are the set of parameters that can be changed in hardware, software, or firmware affecting the security posture and functionality of the system. Examples include the settings in network devices, operating systems, and applications. The organization establishes, documents, and implements configuration settings for information technology products employed within the information system. Configuration settings include those settings necessary to implement least functionality and least privilege.

Configuration settings are approved by an authorized individual and are reviewed and updated as necessary. Configuration settings are maintained in a configuration management database or equivalent.

Related Controls: CM-2, CM-3, CM-4, CM-5, CM-7, CM-8, CM-10, CM-11, SA-4, SA-8, SA-10, SA-11, SA-15, SA-16, SA-17, SA-18, SA-19, SA-20, SA-21, SA-22, SI-2, SI-4, SI-7.

CM-7 LEAST FUNCTIONALITY

Control:
The organization:

a. 
Configures the information system to provide only essential capabilities; and

b. 
Prohibits or restricts the use of functions, ports, protocols, and/or services as defined in the security plan.

Supplemental Guidance:
The organization takes advantage of multiple types of system functionality as appropriate to the situation and the risk. Least functionality is a security principle that reduces the opportunity for attack by removing or limiting functions, ports, protocols, and services not explicitly required.

The organization identifies, documents, and justifies the need for functions, ports, protocols, and services that are to be allowed. The organization reviews the list of functions, ports, protocols, and services for appropriateness [Assignment: organization-defined frequency].

Related Controls: AC-3, AC-6, CM-2, CM-3, CM-4, CM-5, CM-6, CM-8, CM-10, CM-11, SA-4, SA-8, SA-10, SA-11, SA-15, SA-16, SA-17, SA-18, SA-19, SA-20, SA-21, SA-22, SI-2, SI-4, SI-7.

CM-8 INFORMATION SYSTEM COMPONENT INVENTORY

Control:
The organization develops and documents an inventory of information system components that:

a. 
Accurately reflects the current information system;

b. 
Includes all components within the authorization boundary of the information system;

c. 
Is at the level of granularity deemed necessary for tracking and reporting; and

d. 
Is updated [Assignment: organization-defined frequency].

Supplemental Guidance:
Information system components that need to be inventoried include hardware, software, and firmware. The inventory of information system components is used to support configuration management, accountability, and incident response. The organization maintains the inventory in a database, spreadsheet, or other repository.

Related Controls: CM-2, CM-3, CM-4, CM-5, CM-6, CM-7, CM-10, CM-11, SA-4, SA-8, SA-10, SA-11, SA-12, SA-15, SA-16, SA-17, SA-18, SA-19, SA-20, SA-21, SA-22, SI-2, SI-4, SI-7.

CM-9 CONFIGURATION MANAGEMENT PLAN

Control:
The organization develops, documents, and implements a configuration management plan for the information system that:

a. 
Addresses roles, responsibilities, and configuration management activities and procedures;

b. 
Establishes and documents a process for managing changes to the information system baseline;

c. 
Addresses configuration settings, inventory, and any deviations from established configuration settings; and

d. 
Is reviewed and updated [Assignment: organization-defined frequency].

Supplemental Guidance:
Configuration management plans are consistent with the organization’s configuration management policy and procedures. Configuration management plans describe the configuration management process and are incorporated into the system security plan or in a standalone plan.

Related Controls: CM-1, CM-2, CM-3, CM-4, CM-5, CM-6, CM-7, CM-8, CM-10, CM-11, SA-4, SA-8, SA-10, SA-11, SA-15, SA-16, SA-17, SA-18, SA-19, SA-20, SA-21, SA-22, SI-2, SI-4, SI-7.

CM-10 SOFTWARE USAGE RESTRICTIONS

Control:
The organization:

a. 
Uses software and associated documentation in accordance with contract agreements and copyright laws;

b. 
Documents software and associated documentation usage restrictions; and

c. 
Enforces software and associated documentation usage restrictions.

Supplemental Guidance:
Software usage restrictions may include rules governing the use of software installed on information systems. The organization ensures that software and associated documentation are used in accordance with license agreements and copyright laws.

Related Controls: CM-3, CM-5, CM-6, CM-7, CM-8, CM-11, SA-4, SA-8, SA-10, SA-11, SA-15, SA-16, SA-17, SA-18, SA-19, SA-20, SA-21, SA-22, SI-2, SI-4, SI-7.

CM-11 USER-INSTALLED SOFTWARE

Control:
The organization:

a. 
Establishes policies governing the use of user-installed software;

b. 
Enforces software installation restrictions; and

c. 
Monitors the information system for unauthorized software installation.

Supplemental Guidance:
User-installed software is software executed from user-writable locations or installed by users on the information system. The organization limits the installation of software by users to those instances that are approved and controlled. The organization monitors the system for unauthorized software installations.

Related Controls: CM-2, CM-3, CM-4, CM-5, CM-6, CM-7, CM-8, CM-10, SA-4, SA-8, SA-10, SA-11, SA-15, SA-16, SA-17, SA-18, SA-19, SA-20, SA-21, SA-22, SI-2, SI-4, SI-7.
