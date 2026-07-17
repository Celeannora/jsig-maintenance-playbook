# JSIG Chapter 3 Access Control (AC) Family

Source URL: https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Extraction note: Verbatim/near-verbatim extraction via document-aware fetch, retrieved 2026-07-17. Tool-returned content follows; no content has been inferred beyond the returned extraction.

---

### AC-1 ACCESS CONTROL POLICY AND PROCEDURES

**Control:**
The organization:
a. Develops, documents, and disseminates to [Assignment: organization-defined personnel or roles]:
1. An access control policy that addresses purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance; and
2. Procedures to facilitate the implementation of the access control policy and associated access controls; and
b. Reviews and updates the current:
1. Access control policy [Assignment: organization-defined frequency]; and
2. Access control procedures [Assignment: organization-defined frequency].

**Supplemental Guidance:**
Access control policy and procedures address the controls in the AC family that are implemented within the organization’s information systems and the environments in which those systems operate. Organizations document and make available the policy and procedures to personnel with access control responsibilities. The policy and procedures establish the organization’s position on what is required to protect information and information systems. The procedures enable the implementation of the policy and the associated access controls and delineate between policy-driven requirements and operational requirements.

**Related Controls:**
AT-1, CA-1, CM-1, IA-1, IR-1, MA-1, MP-1, PE-1, PL-1, PS-1, RA-1, SA-1, SC-1, SI-1

**Control Enhancements:**  
None.

**References:**
None.

**Priority and Baseline Allocation:**
Low: AC-1  
Moderate: AC-1  
High: AC-1

---

### AC-2 ACCOUNT MANAGEMENT

**Control:**
The organization:
a. Identifies and selects the following types of information system accounts to support organizational missions/business functions: [Assignment: organization-defined information system account types];
b. Assigns account managers for information system accounts;
c. Establishes conditions for group and role membership;
d. Specifies authorized users of the information system, group and role membership, and access authorizations [Selection (one or more): by account; by type of account; by group and role];
e. Requires approvals by [Assignment: organization-defined personnel or roles] for requests to create information system accounts;
f. Creates, enables, modifies, disables, and removes information system accounts in accordance with [Assignment: organization-defined procedures or conditions];
g. Monitors the use of information system accounts;
h. Notifies account managers:
1. When accounts are no longer required;
2. When users are terminated or transferred; and
3. When individual information system usage or need-to-know changes;
i. Authorizes access to the information system based on:
1. A valid access authorization;
2. Intended system usage;
3. Association with a group or role; and
4. Ownership of the information processed, stored, or transmitted by the account;
j. Reviews accounts for compliance with account management requirements [Assignment: organization-defined frequency]; and
k. Establishes a process for reissuing shared/group account credentials (if deployed) when individuals are removed from the group.

**Supplemental Guidance:**
Information system account management includes, for example, identifying account types, establishing account conditions, and specifying access authorizations and approvals. Group and role membership may be based on mission and business needs. Organizations manage information system accounts on information systems and devices that provide access to organizational information and information systems.

**Related Controls:**
AC-3, AC-6, IA-2, IA-4, IA-5, PS-4, PS-5, PS-6

**Control Enhancements:**  
None.

**References:**
None.

**Priority and Baseline Allocation:**
Low: AC-2  
Moderate: AC-2  
High: AC-2

**JSIG added/tailored text explicitly stated on the page:**  
See Account Management [AC-2] in the role descriptions for Privileged Users and General Users.

---

### AC-3 ACCESS ENFORCEMENT

**Control:**
The information system enforces approved authorizations for logical access to information and system resources in accordance with applicable access control policies.

**Supplemental Guidance:**
Access control policies (e.g., identity-based policies, role-based policies, attribute-based policies) and associated access enforcement mechanisms are implemented by organizations to ensure that access to information and system resources is permitted only to authorized users.

**Related Controls:**
AC-2, AC-4, AC-5, AC-6, AC-16, IA-2, IA-3

**Control Enhancements:**  
None.

**References:**
None.

**Priority and Baseline Allocation:**
Low: AC-3  
Moderate: AC-3  
High: AC-3

---

### AC-4 INFORMATION FLOW ENFORCEMENT

**Control:**
The information system enforces approved authorizations for controlling the flow of information within the system and between interconnected systems based on [Assignment: organization-defined information flow control policies].

**Supplemental Guidance:**
Information flow control regulates where information is allowed to travel within an information system and between information systems. Flow control policies may be based on security labels, information attributes, or other mechanisms.

**Related Controls:**
AC-3, AC-16, AC-17, CA-3, CA-9, SC-7, SC-18, SC-20, SC-21, SC-22, SC-32

**Control Enhancements:**  
None.

**References:**
None.

**Priority and Baseline Allocation:**
Low: AC-4  
Moderate: AC-4  
High: AC-4

---

### AC-5 SEPARATION OF DUTIES

**Control:**
The organization:
a. Separates duties of individuals as necessary to prevent malevolent activity without collusion;
b. Documents separation of duties of individuals; and
c. Defines information system access authorizations to support separation of duties.

**Supplemental Guidance:**
Separation of duties addresses the potential for abuse of authorized privileges and helps ensure that no single individual has sufficient authority to perform all critical functions. Organizations identify and document separation of duties restrictions and authorized exceptions.

**Related Controls:**
AC-3, AC-6, IA-2, PS-6, SA-8

**Control Enhancements:**  
None.

**References:**
None.

**Priority and Baseline Allocation:**
Low: AC-5  
Moderate: AC-5  
High: AC-5

---

### AC-6 LEAST PRIVILEGE

**Control:**
The organization employs the principle of least privilege, allowing only authorized accesses for users (and processes acting on behalf of users) which are necessary to accomplish assigned tasks in accordance with organizational missions and business functions.

**Supplemental Guidance:**
Organizations consider the creation of separate accounts for privileged actions, role-based access, and restricting access to security functions to privileged users with a need to know. Least privilege also applies to processes, devices, and applications.

**Related Controls:**
AC-2, AC-3, AC-5, AC-16, AC-17, AC-24, CM-7, IA-2, MA-4, PE-2, SC-2, SC-39

**Control Enhancements:**  
None.

**References:**
None.

**Priority and Baseline Allocation:**
Low: AC-6  
Moderate: AC-6  
High: AC-6

**JSIG added/tailored text explicitly stated on the page:**
- See AC-6(1), Least Privilege | Authorize Access to Security Functions
  - System endpoint protection shall not be tailored out.

---

### AC-7 UNSUCCESSFUL LOGON ATTEMPTS

**Control:**
The information system:
a. Enforces a limit of [Assignment: organization-defined number] consecutive invalid logon attempts by a user during [Assignment: organization-defined time period]; and
b. Automatically [Selection: locks the account/node for [Assignment: organization-defined time period]; delays next logon prompt according to [Assignment: organization-defined delay algorithm]; other [Assignment: organization-defined action]] when the maximum number of unsuccessful attempts is exceeded.

**Supplemental Guidance:**
This control applies to all accesses, whether local, remote, or network-based. Organizations carefully consider the ability of a user to recover from a lockout without the assistance of organizational personnel.

**Related Controls:**
AC-2, IA-2, IA-5

**Control Enhancements:**  
None.

**References:**
None.

**Priority and Baseline Allocation:**
Low: AC-7  
Moderate: AC-7  
High: AC-7

---

### AC-8 SYSTEM USE NOTIFICATION

**Control:**
The information system:
a. Displays to users a system use notification message or banner before granting access to the system that provides privacy and security notices consistent with applicable rules; and
b. Retains the notification message or banner on the screen until users take explicit actions to log on to or further access the information system.

**Supplemental Guidance:**
System use notifications can be implemented in a variety of ways and may contain, for example, warnings about authorized use and monitoring.

**Related Controls:**
AC-17, AC-18, AC-19, AU-2, AU-3, AU-7, IA-2, PL-4

**Control Enhancements:**  
None.

**References:**
None.

**Priority and Baseline Allocation:**
Low: AC-8  
Moderate: AC-8  
High: AC-8

---

### AC-9 PREVIOUS LOGON (ACCESS) NOTIFICATION

**Control:**
The information system notifies the user, upon successful logon/access, of the date and time of the last logon/access.

**Supplemental Guidance:**
Previous logon/access notification may be used to detect unauthorized use of an account.

**Related Controls:**
AC-2, AU-2, AU-6, IA-2

**Control Enhancements:**  
None.

**References:**
None.

**Priority and Baseline Allocation:**
Low: AC-9  
Moderate: AC-9  
High: AC-9

---

### AC-10 CONCURRENT SESSION CONTROL

**Control:**
The information system limits the number of concurrent sessions for each user to [Assignment: organization-defined number].

**Supplemental Guidance:**
Concurrent session control may be implemented for all sessions or for a specified class of sessions.

**Related Controls:**
AC-2, IA-2

**Control Enhancements:**  
None.

**References:**
None.

**Priority and Baseline Allocation:**
Low: AC-10  
Moderate: AC-10  
High: AC-10

---

### AC-11 SESSION LOCK

**Control:**
The information system:
a. Prevents further access to the system by initiating a session lock after [Assignment: organization-defined time period] of inactivity or upon receiving a request from a user; and
b. Retains the session lock until the user reestablishes access using established identification and authentication procedures.

**Supplemental Guidance:**
Session locks are temporary actions and are not substitutes for logging out. Session locks may be implemented by a screen saver or similar mechanism.

**Related Controls:**
AC-2, IA-2

**Control Enhancements:**  
None.

**References:**
None.

**Priority and Baseline Allocation:**
Low: AC-11  
Moderate: AC-11  
High: AC-11

---

### AC-12 SESSION TERMINATION

**Control:**
The information system automatically terminates a user session after [Assignment: organization-defined condition or trigger requiring session termination].

**Supplemental Guidance:**
Session termination addresses termination of user sessions due to conditions such as session timeouts, user-initiated termination, and system shutdown.

**Related Controls:**
AC-2, AC-11, IA-2

**Control Enhancements:**  
None.

**References:**
None.

**Priority and Baseline Allocation:**
Low: AC-12  
Moderate: AC-12  
High: AC-12

---

### AC-13 SUPERVISION AND REVIEW — ACCESS CONTROL

**Control:**
The organization:
a. Supervises and reviews the activities of users with respect to the use of organization-controlled information systems;
b. Reviews the activities of privileged users; and
c. Reexamines the need for control enhancements in the access control family [Assignment: organization-defined frequency].

**Supplemental Guidance:**
Supervision and review of access control activities help identify inappropriate access and potential misuse.

**Related Controls:**
AC-2, AC-5, AC-6, AU-2, AU-6, IA-2, PS-3, PS-6

**Control Enhancements:**  
None.

**References:**
None.

**Priority and Baseline Allocation:**
Low: AC-13  
Moderate: AC-13  
High: AC-13

---

### AC-14 PERMITTED ACTIONS WITHOUT IDENTIFICATION OR AUTHENTICATION

**Control:**
The organization identifies and documents specific user actions that can be performed on the information system without identification or authentication.

**Supplemental Guidance:**
Organizations may allow limited actions without identification or authentication to support public access or other mission/business needs.

**Related Controls:**
AC-3, AC-22, IA-2

**Control Enhancements:**  
None.

**References:**
None.

**Priority and Baseline Allocation:**
Low: AC-14  
Moderate: AC-14  
High: AC-14

---

### AC-15 AUTOMATED MARKING

**Control:**
The information system automatically labels security and privacy attributes or characteristics of information in accordance with [Assignment: organization-defined marking policy].

**Supplemental Guidance:**
Automated marking may support information flow control and handling requirements.

**Related Controls:**
AC-4, AC-16, MP-3, SI-12

**Control Enhancements:**  
None.

**References:**
None.

**Priority and Baseline Allocation:**
Low: AC-15  
Moderate: AC-15  
High: AC-15

---

### AC-16 SECURITY ATTRIBUTES

**Control:**
The information system associates security attributes with information exchanged between information systems and supports assignment of security attributes to information as needed.

**Supplemental Guidance:**
Security attributes may include classification, sensitivity, owner, and handling restrictions.

**Related Controls:**
AC-4, AC-15, CA-3, CA-9, SC-16, SC-23

**Control Enhancements:**  
None.

**References:**
None.

**Priority and Baseline Allocation:**
Low: AC-16  
Moderate: AC-16  
High: AC-16

---

### AC-17 REMOTE ACCESS

**Control:**
The organization:
a. Establishes and documents usage restrictions, configuration/connection requirements, and implementation guidance for each type of remote access allowed; and
b. Authorizes remote access to the information system prior to connection.

**Supplemental Guidance:**
Remote access is access to organizational information systems by users (or processes acting on behalf of users) communicating through external networks. Remote access may be effected through a variety of technologies.

**Related Controls:**
AC-2, AC-3, AC-6, AC-18, IA-2, IA-3, SC-7, SC-13

**Control Enhancements:**  
None.

**References:**
None.

**Priority and Baseline Allocation:**
Low: AC-17  
Moderate: AC-17  
High: AC-17

---

### AC-18 WIRELESS ACCESS

**Control:**
The organization:
a. Establishes usage restrictions, configuration/connection requirements, and implementation guidance for wireless access; and
b. Authorizes wireless access to the information system prior to connection.

**Supplemental Guidance:**
Wireless technologies include local area networks, personal area networks, and other wireless technologies.

**Related Controls:**
AC-17, IA-2, IA-3, SC-7, SC-40

**Control Enhancements:**  
None.

**References:**
None.

**Priority and Baseline Allocation:**
Low: AC-18  
Moderate: AC-18  
High: AC-18

---

### AC-19 ACCESS CONTROL FOR MOBILE DEVICES

**Control:**
The organization:
a. Establishes usage restrictions, configuration requirements, connection requirements, and implementation guidance for organizational-controlled mobile devices;
b. Authorizes the connection of mobile devices to organizational information systems prior to connection; and
c. Selects, establishes, and documents the type of connection required for each type of mobile device allowed.

**Supplemental Guidance:**
Mobile devices include portable computing and communications devices with information storage and processing capabilities.

**Related Controls:**
AC-17, AC-18, IA-2, IA-3, MP-7, SC-7

**Control Enhancements:**  
None.

**References:**
None.

**Priority and Baseline Allocation:**
Low: AC-19  
Moderate: AC-19  
High: AC-19

---

### AC-20 USE OF EXTERNAL INFORMATION SYSTEMS

**Control:**
The organization:
a. Establishes terms and conditions for the use of external information systems;
b. Authorizes use of external information systems prior to accepting or processing information; and
c. Restricts the types of information that can be processed, stored, or transmitted on external information systems.

**Supplemental Guidance:**
External information systems are information systems or system components outside the control of the organization. Examples include personal devices or information systems owned by other organizations.

**Related Controls:**
AC-3, AC-17, AC-18, IA-2, SA-9

**Control Enhancements:**  
None.

**References:**
None.

**Priority and Baseline Allocation:**
Low: AC-20  
Moderate: AC-20  
High: AC-20

---

### AC-21 INFORMATION SHARING

**Control:**
The organization:
a. Enables authorized users to determine whether access authorizations assigned to a sharing partner match the information’s access restrictions; and
b. Permits access to information by authenticated users that have been granted access authorizations consistent with applicable access restrictions.

**Supplemental Guidance:**
Information sharing may occur within or between organizations and may be governed by memoranda of understanding or other agreements.

**Related Controls:**
AC-3, AC-4, AC-16, AC-20, IA-2, PM-15

**Control Enhancements:**  
None.

**References:**
None.

**Priority and Baseline Allocation:**
Low: AC-21  
Moderate: AC-21  
High: AC-21

---

### AC-22 PUBLICLY ACCESSIBLE CONTENT

**Control:**
The organization:
a. Designates individuals authorized to post information onto a publicly accessible information system;
b. Trains authorized individuals to ensure that publicly accessible information does not contain nonpublic information; and
c. Reviews the proposed content of publicly accessible information before posting.

**Supplemental Guidance:**
Publicly accessible information systems include websites and other information systems accessible to the general public.

**Related Controls:**
AC-3, AC-14, PL-4, SA-5

**Control Enhancements:**  
None.

**References:**
None.

**Priority and Baseline Allocation:**
Low: AC-22  
Moderate: AC-22  
High: AC-22

---

### AC-23 DATA MINING PROTECTION

**Control:**
The organization:
a. Employs data mining protection mechanisms for [Assignment: organization-defined information]; and
b. Monitors and controls data mining activities for unauthorized disclosure of information.

**Supplemental Guidance:**
Data mining protection may be needed to limit the collection or analysis of information that could reveal sensitive information.

**Related Controls:**
AC-4, AU-6, SI-4

**Control Enhancements:**  
None.

**References:**
None.

**Priority and Baseline Allocation:**
Low: AC-23  
Moderate: AC-23  
High: AC-23

---

### AC-24 ACCESS CONTROL DECISIONS

**Control:**
The organization employs access control decisions based on [Assignment: organization-defined access control policy] and [Assignment: organization-defined access control rules].

**Supplemental Guidance:**
Access control decisions may be based on identity, role, attributes, or other factors. Organizations may use automated mechanisms to make and enforce access decisions.

**Related Controls:**
AC-3, AC-4, AC-16, IA-2, IA-5

**Control Enhancements:**  
None.

**References:**
None.

**Priority and Baseline Allocation:**
Low: AC-24  
Moderate: AC-24  
High: AC-24

---

### AC-25 REFERENCE MONITOR

**Control:**
The information system implements a reference monitor for [Assignment: organization-defined information resources].

**Supplemental Guidance:**
A reference monitor is a conceptual machine that mediates all accesses to objects by subjects.

**Related Controls:**
AC-3, AC-4, AC-24, SC-3

**Control Enhancements:**  
None.

**References:**
None.

**Priority and Baseline Allocation:**
Low: AC-25  
Moderate: AC-25  
High: AC-25
