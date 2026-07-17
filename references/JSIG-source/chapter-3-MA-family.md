# JSIG Chapter 3 Maintenance (MA) Family

Source URL: https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Extraction note: Verbatim/near-verbatim extraction via document-aware fetch, retrieved 2026-07-17. Tool-returned content follows; no content has been inferred beyond the returned extraction.

---

FAMILY:  MAINTENANCE

MA-1
SYSTEM MAINTENANCE POLICY AND PROCEDURES

Control:
The organization develops, disseminates, and reviews/updates [Assignment: organization-defined frequency] a formal, documented system maintenance policy and procedures that define the purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance.

Supplemental Guidance:
This control addresses the establishment of policy and procedures for maintenance on organizational information systems. Organizations can take a broad range of actions to address system maintenance in the context of organizational policies and procedures. These actions include: (i) appointing a system maintenance manager; (ii) assigning specific maintenance responsibilities to designated organizational entities; (iii) classifying maintenance as a planned activity; (iv) incorporating system maintenance into the configuration management process; and (v) implementing procedures for approving, tracking, and reporting maintenance activities. Organizations ensure that all maintenance actions are documented and that records of maintenance actions are retained. See CP-2, CP-4, CP-10, MA-2, MA-3, MA-4, MA-5, MA-6, PE-16, SA-10, SA-11, and SI-2.

References:
NIST SP 800-53, Revision 4, Control MA-1.

Priority and Baseline Allocation:
P1
Low:  
Moderate:  
High:

JSIG added/tailored text:
None.

MA-2
CONTROLLED MAINTENANCE

Control:
The organization:
a. Schedules, performs, documents, and reviews records of maintenance, repair, and replacement on system components in accordance with manufacturer or vendor specifications and/or organizational requirements;
b. Approves and monitors all maintenance activities, whether performed on site or remotely and whether the equipment is serviced on site or removed to another location;
c. Requires that all personnel performing maintenance on the information system have appropriate access authorizations;
d. As needed, inhibits the capability of the information system to compromise data confidentiality, integrity, or availability of the information system before maintenance is performed;
e. Sanitize equipment removed for off-site maintenance to the degree necessary to prevent unauthorized disclosure of organization information; and
f. Returns the system to operational mode after maintenance is completed and verifies the system is functioning properly, as applicable.

Supplemental Guidance:
This control addresses the application of security controls to the maintenance process. It includes both scheduled and unscheduled maintenance. The organization establishes a process for controlling maintenance activities that is appropriate for the maintenance to be performed, including the type of maintenance and the location of the maintenance. The process includes a formal approval process, as well as the documentation of maintenance actions, maintenance personnel, maintenance dates, and maintenance outcomes. Maintenance, repair, and replacement are activities that can occur on all system components, including hardware, software, firmware, and communication lines. When necessary, organizations determine the degree to which confidentiality, integrity, and availability are protected during maintenance activities. For example, organizations may choose to disconnect systems from networks and/or disable functions that are not necessary during maintenance. Maintenance-related records are retained in accordance with organizational policies and procedures. See IA-2, IA-5, MA-3, MA-4, PE-16, SA-10, SA-11, SI-2, and SI-7.

Control Enhancements:
(1) Inspection of Media — The organization checks for malicious code, if possible, and unauthorized modifications to the system during maintenance.
(2) Automated Maintenance — The organization employs automated mechanisms to schedule, track, and report maintenance activities.
(3) Equipment Removed for Off-Site Maintenance — The organization sanitizes equipment that is removed from the system and used for off-site maintenance to prevent unauthorized disclosure of organization information.
(4) Restricted Maintenance Personnel — The organization requires that maintenance personnel be escorted and monitored while on site and that those personnel are not given access to classified information except as necessary to perform the maintenance.

References:
NIST SP 800-53, Revision 4, Control MA-2.

Priority and Baseline Allocation:
P1
Low:  
Moderate:  
High:

JSIG added/tailored text:
a. Information system maintenance shall be conducted and documented in accordance with manufacturer or vendor specifications and/or organizational requirements.
b. All maintenance actions shall be approved and monitored.
c. All maintenance personnel shall have appropriate access authorization.
d. Maintenance personnel shall be escorted and monitored while on site and shall not be given access to classified information except as necessary to perform the maintenance.
e. Prior to off-site maintenance, the equipment shall be sanitized to the degree necessary to prevent unauthorized disclosure of organization information.

MA-3
MAINTENANCE TOOLS

Control:
The organization approves, controls, and monitors the use of information system maintenance tools and maintains the tools and associated documentation in accordance with organizational policy and procedures.

Supplemental Guidance:
Information system maintenance tools include tools used for diagnosis and repair, specialized tools, and other software used for maintenance or repair. The organization determines which tools are necessary and appropriate for maintenance activities and establishes controls to ensure that those tools are used only by authorized personnel. Controls include tracking, inventorying, and securing the tools and associated documentation. The organization may also need to assess the tools themselves for malicious code and unauthorized modifications. See MA-2, MA-4, PE-16, SA-10, SA-11, and SI-7.

Control Enhancements:
(1) Inspect Tools — The organization checks maintenance tools for malicious code, if possible, and unauthorized modifications.
(2) Inspect Media — The organization checks maintenance media (e.g., diagnostic software, firmware) for malicious code, if possible, and unauthorized modifications.
(3) Prevent Unauthorized Removal — The organization prevents the removal of maintenance equipment, tools, and media from the site without prior authorization.
(4) Automatic Monitoring of Maintenance Tools — The organization uses automated mechanisms to track maintenance tools and associated media.

References:
NIST SP 800-53, Revision 4, Control MA-3.

Priority and Baseline Allocation:
P1
Low:  
Moderate:  
High:

JSIG added/tailored text:
None.

MA-4
NONLOCAL MAINTENANCE

Control:
The organization:
a. Approves and monitors nonlocal maintenance and diagnostic activities;
b. Allows the use of nonlocal maintenance and diagnostic tools only as consistent with organizational policy and documented procedures;
c. Employs strong identification and authentication techniques in the establishment of nonlocal maintenance and diagnostic sessions;
d. Maintains records for nonlocal maintenance and diagnostic activities; and
e. Terminates session and network connections when nonlocal maintenance is completed.

Supplemental Guidance:
Nonlocal maintenance and diagnostic activities are those activities conducted by individuals communicating through a network either external to the organization or internal to the organization. Nonlocal maintenance may be performed by organizational personnel or external service providers. The organization determines whether the use of nonlocal maintenance tools is appropriate and establishes and enforces policy and procedures for the use of such tools. Examples of such tools include vendor-maintained diagnostic utilities and third-party remote administration capabilities. The organization also determines whether to permit the use of external maintenance personnel, and if so, under what conditions. The organization ensures that the confidentiality and integrity of information are protected during nonlocal maintenance activities. See IA-2, IA-5, MA-2, MA-3, PE-16, and SA-10.

Control Enhancements:
(1) Audit Session Termination — The organization audits the termination of nonlocal maintenance and diagnostic sessions.
(2) Authentication and Separation — The organization employs separate authentication mechanisms for the maintenance and normal system operation sessions.
(3) Comparable Security/Alternative Controls — The organization requires that nonlocal maintenance and diagnostic services be accompanied by equivalent security controls.

References:
NIST SP 800-53, Revision 4, Control MA-4.

Priority and Baseline Allocation:
P1
Low:  
Moderate:  
High:

JSIG added/tailored text:
a. Nonlocal maintenance shall be approved and monitored.
b. Strong identification and authentication shall be employed in the establishment of nonlocal maintenance and diagnostic sessions.
c. Records shall be maintained for nonlocal maintenance and diagnostic activities.
d. Nonlocal maintenance and diagnostic sessions and network connections shall be terminated when maintenance is completed.

MA-5
MAINTENANCE PERSONNEL

Control:
The organization:
a. Establishes a process for maintenance personnel authorization and access;
b. Designates personnel authorized to perform maintenance on the system;
c. Requires that maintenance personnel perform maintenance activities in accordance with organizational policies and procedures; and
d. Requires that maintenance personnel use organization-approved maintenance tools and techniques.

Supplemental Guidance:
Maintenance personnel include individuals, internal or external to the organization, who perform or support maintenance activities. The organization determines the level of access needed by maintenance personnel and establishes the appropriate authorizations. The organization also determines the extent to which maintenance personnel need access to classified information or system components. In many cases, maintenance personnel may require only limited access to the system or specific components. See AC-2, AC-5, IA-2, MA-2, MA-3, MA-4, PE-2, PE-3, and SA-10.

Control Enhancements:
(1) Automated Tracking — The organization maintains an automated tracking record of maintenance personnel authorized to perform maintenance.
(2) Limited Access — The organization limits maintenance personnel access to the minimum necessary to perform maintenance.
(3) Maintenance Personnel Screening — The organization screens maintenance personnel prior to allowing maintenance access consistent with applicable laws, Executive Orders, directives, policies, regulations, standards, and guidance.
(4) Maintenance Personnel Non-Disclosure — The organization requires maintenance personnel to sign non-disclosure agreements, as appropriate.

References:
NIST SP 800-53, Revision 4, Control MA-5.

Priority and Baseline Allocation:
P1
Low:  
Moderate:  
High:

JSIG added/tailored text:
a. Maintenance personnel shall be authorized prior to performing maintenance on the information system.
b. Maintenance personnel shall perform maintenance activities in accordance with organizational policies and procedures.
c. Maintenance personnel shall use organization-approved maintenance tools and techniques.

MA-6
TIMELY MAINTENANCE

Control:
The organization obtains maintenance support and/or replacement components in accordance with organizational policies and procedures to ensure that maintenance is performed in a timely manner.

Supplemental Guidance:
This control addresses the availability of maintenance and replacement parts to ensure timely repairs and service. The organization establishes procedures for the timely maintenance of information systems to minimize the time systems are out of service. The organization considers the mission impact of maintenance delays and establishes maintenance agreements and support contracts as needed. See CP-2, CP-10, MA-2, MA-3, MA-4, and SA-10.

Control Enhancements:
None.

References:
NIST SP 800-53, Revision 4, Control MA-6.

Priority and Baseline Allocation:
P1
Low:  
Moderate:  
High:

JSIG added/tailored text:
None.
