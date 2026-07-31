# JSIG Chapter 3 Access Control (AC) Family

Source URL: https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Archived source (used for extraction, direct URL returns HTTP 403): http://web.archive.org/web/20260405054539/https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Extraction note: Verbatim extraction via `pdftotext -layout` against the complete 378-page JSIG PDF (retrieved 2026-07-17 from the Wayback Machine snapshot below, since the direct DCSA URL returns HTTP 403). This supersedes any prior lower-fidelity extraction of this section. Running page headers/footers inserted by the PDF layout have been stripped; no wording has been added, summarized, or altered.

---

FAMILY: ACCESS CONTROL

AC-1      ACCESS CONTROL POLICY AND PROCEDURES

          Control: The organization:

          a.     Develops, documents, and disseminates to [Assignment: organization-defined personnel or roles]:
                 1.   An access control policy that addresses purpose, scope, roles, responsibilities, management
                      commitment, coordination among organizational entities, and compliance; and
                 2.   Procedures to facilitate the implementation of the access control policy and associated access
                      controls; and
          b.     Reviews and updates the current:
                 1.   Access control policy annually or as policy and procedures dictate changes are required; and
                 2.   Access control procedures annually or as policy and procedures dictate changes are required.
          Supplemental Guidance: This control addresses the establishment of policy and procedures for the effective
          implementation of selected security controls and control enhancements in the AC family. Policy and
          procedures reflect applicable federal laws, Executive Orders, directives, regulations, policies, standards,
          and guidance. Security program policies and procedures at the organization level may make the need for
          system-specific policies and procedures unnecessary. The policy can be included as part of the general
          information security policy for organizations or conversely, can be represented by multiple policies
          reflecting the complex nature of certain organizations. The procedures can be established for the security
          program in general and for particular information systems, if needed. The organizational risk management
          strategy is a key factor in establishing policy and procedures. Related control: PM-9.
               DoD SAP-specific policy and procedures related to access control are defined in the
               remainder of this control family.
          Control Enhancements: None.

          References: NIST Special Publications 800-12, 800-100.

AC-2      ACCOUNT MANAGEMENT

          Control: The organization:

          a.     Identifies and selects the following types of information system accounts to support organizational
                 missions/business functions: as defined by the service or program;
          b.     Assigns account managers for information system accounts;
          c.     Establishes conditions for group and role membership;
          d.     Specifies authorized users of the information system, group and role membership, and access
                 authorizations (i.e., privileges) and other attributes (as required) for each account;

          e.     Requires approvals by ISO or designee for requests to create information system accounts;
          f.     Creates, enables, modifies, disables, and removes information system accounts in accordance with the
                 service or program policy;
          g.     Monitors the use of information system accounts;
          h.     Notifies account managers:
                 1.   When accounts are no longer required;
                 2.   When users are terminated or transferred; and
                 3.   When individual information system usage or need-to-know changes;
          i.     Authorizes access to the information system based on:
                 1.   A valid access authorization;
                 2.   Intended system usage; and
                 3.   Other attributes as required by the organization or associated missions/business functions;
          j.     Reviews accounts for compliance with account management requirements at least annually; and
          k.     Establishes a process for reissuing shared/group account credentials (if deployed) when individuals are
                 removed from the group.
          Supplemental Guidance: Information system account types include, for example, individual, shared, group,
          system, guest/anonymous, emergency, developer/manufacturer/vendor, temporary, and service. Some of
          the account management requirements listed above can be implemented by organizational information
          systems. The identification of authorized users of the information system and the specification of access
          privileges reflects the requirements in other security controls in the security plan. Users requiring
          administrative privileges on information system accounts receive additional scrutiny by appropriate
          organizational personnel (e.g., system owner, mission/business owner, or chief information security officer)
          responsible for approving such accounts and privileged access. Organizations may choose to define access
          privileges or other attributes by account, by type of account, or a combination of both. Other attributes
          required for authorizing access include, for example, restrictions on time-of-day, day-of-week, and point-
          of-origin. In defining other account attributes, organizations consider system-related requirements (e.g.,
          scheduled maintenance, system upgrades) and mission/business requirements, (e.g., time zone differences,
          customer requirements, remote access to support travel requirements). Failure to consider these factors
          could affect information system availability. Temporary and emergency accounts are accounts intended for
          short-term use. Organizations establish temporary accounts as a part of normal account activation
          procedures when there is a need for short-term accounts without the demand for immediacy in account
          activation. Organizations establish emergency accounts in response to crisis situations and with the need for
          rapid account activation. Therefore, emergency account activation may bypass normal account
          authorization processes. Emergency and temporary accounts are not to be confused with infrequently used
          accounts (e.g., local logon accounts used for special tasks defined by organizations or when network
          resources are unavailable). Such accounts remain available and are not subject to automatic disabling or
          removal dates. Conditions for disabling or deactivating accounts include, for example: (i) when
          shared/group, emergency, or temporary accounts are no longer required; or (ii) when individuals are
          transferred or terminated. Some types of information system accounts may require specialized training.
          Related controls: AC-3, AC-4, AC-5, AC-6, AC-10, AC-17, AC-19, AC-20, AU-9, IA-2, IA-4, IA-5, IA-8,
          CM-5, CM-6, CM-11, MA-3, MA-4, MA-5, PL-4, SC-13.
               Types of Accounts
               System/Service Accounts
               System accounts are internal accounts that are used by the operating system and by services
               that run under the control of the operating system. There are many services and processes
               within the operating system that need the capability to log on internally utilizing a service
               account. System/service accounts shall not be added to any general user groups and shall not

               have general user rights assigned to them.
               Temporary/Emergency Accounts
               Temporary and emergency accounts are accounts that are established for individuals not
               previously identified in the information system, such as inspectors, assessment team
               members, vendor personnel or consultants, who may require access to the system, for
               example, to conduct assessment, maintenance or diagnostic activities with little or no notice.
               Based on a prior assessment of risk, organizations may establish temporary or emergency
               accounts for these individuals. The ISO or designee must approve the creation of temporary
               or emergency accounts. Temporary and emergency accounts may be for one-time use or for
               a very limited time period. The ISSM/ISSO/SA must be notified when temporary or
               emergency accounts are no longer needed, see [AC-2(2)]. See PL-4 for Rules of Behavior
               for users.
               General User Accounts
               A general user account is provided to an individual who can receive information from, input
               information to, or modify information on a system.
               Privileged User Accounts
               A privileged user account is provided to an individual who is authorized to perform security-
               relevant functions, such as system control, monitoring, data transfer, or administration
               functions that general users are not authorized to perform.
               Account Creation
               The ISO or designee identifies the individual(s) authorized to assign the user account
               identifier and authenticator(s) to system users. The supervisor must ensure all individual
               access requests are valid and access is work/mission-related.
               Prior to granting access to any information system, the individual responsible for account
               creation and/or changes to access permissions shall verify that the user to whom access is
               being granted is appropriately cleared and indoctrinated to all levels of information that will
               be accessible, and that the user is in compliance with personnel security requirements. This
               verification shall be done via the local SAP Security or Program Manager (PM) as
               applicable. In addition, the ISSM/ISSO or SA responsible for account creation shall ensure
               that only accesses and privileges validated by the requestor’s supervisor are granted, [AC-
               2.c] [AC-2.d] [AC-2.i]. See also Identifier Management [IA-4] and Authenticator
               Management [IA-5].
               User Account Disabling/Deletion [AC-2.f]
               All user accounts must be disabled, generally within 24 hours, when information system
               users are terminated, transferred, or no longer require access to the information resource in
               the performance of their assigned duties. When a user’s security clearance is revoked due to
               an incident or violation, the user’s account must be disabled immediately. Disabled accounts
               shall be removed within 12 months or one review cycle, whichever is longer. Organizations
               must ensure that information deemed to be of value is retained before a user’s account is
               deleted.
               Group Accounts [AC-2.k; AC-2(9); AC-2(10)]
               In general, group accounts are prohibited. The use of group accounts/authenticators
               precludes the association of a particular act with the individual who initiated that act, i.e.,
               individual accountability. Situations should be avoided in which the group
               account/authenticator is effectively the sole access control mechanism for the system.
               However, use of group accounts/authenticators for broader access after the use of a unique
               authenticator for initial identification and authentication carries much less risk. The use of

               group accounts/authenticators shall be explicitly authorized by the AO or designated
               representative.
               Exceptions to this policy may include the use of group accounts in tactical/deployed
               environments. Use of group accounts in a tactical/watch standing environment allows rapid
               interchange between users whose primary focus is quick access to the system without
               interruption of functions or capabilities. This also avoids the potential for errors on startup as
               the system is shut down and restarted for a different user to logon. A list shall be used for
               watch stander rotations or battle station assignments, which must be retained and used to
               augment activity logs to correlate user identities to actions as recorded on audit logs. An
               alternative involves the development of a simple pop-up “change USERID” Graphical User
               Interface (GUI) which does not cause the system to shut down or change operations. This
               alternative simply changes accountability via the new USERID/password for continuing
               processes under another individual member of a common functional group. Reference IA-2
               and IA-2(5).

          Control Enhancements:
          (1)     ACCOUNT MANAGEMENT | AUTOMATED SYSTEM ACCOUNT MANAGEMENT
                  The organization employs automated mechanisms to support the management of information system accounts.
                  Supplemental Guidance: The use of automated mechanisms can include, for example: using email or text
                  messaging to automatically notify account managers when users are terminated or transferred; using
                  the information system to monitor account usage; and using telephonic notification to report atypical
                  system account usage.
          (2)     ACCOUNT MANAGEMENT | REMOVAL OF TEMPORARY / EMERGENCY ACCOUNTS

                  The information system automatically disables temporary and emergency accounts after not to exceed 72 hours.
                  Supplemental Guidance: This control enhancement requires the removal of both temporary and
                  emergency accounts automatically after a predefined period of time has elapsed, rather than at the
                  convenience of the systems administrator.
          (3)     ACCOUNT MANAGEMENT | DISABLE INACTIVE ACCOUNTS
                  The information system automatically disables inactive accounts after not to exceed ninety (90) days.
          (4)     ACCOUNT MANAGEMENT | AUTOMATED AUDIT ACTIONS
                  The information system automatically audits account creation, modification, enabling, disabling, and removal actions,
                  and notifies [Assignment: organization-defined personnel or roles].
                  Supplemental Guidance: Related controls: AU-2, AU-12.
          (5)     ACCOUNT MANAGEMENT | INACTIVITY LOGOUT
                  The organization requires that users log out when user’s work day has ended or there is an extended absence
                  (more than six (6) hours).
                  Supplemental Guidance: Related control: SC-23.
          (6)     ACCOUNT MANAGEMENT | DYNAMIC PRIVILEGE MANAGEMENT
                  The information system implements the following dynamic privilege management capabilities: [Assignment:
                  organization-defined list of dynamic privilege management capabilities].
                  Supplemental Guidance: In contrast to conventional access control approaches which employ static
                  information system accounts and predefined sets of user privileges, dynamic access control approaches
                  (e.g., service-oriented architectures) rely on run time access control decisions facilitated by dynamic
                  privilege management. While user identities may remain relatively constant over time, user privileges
                  may change more frequently based on ongoing mission/business requirements and operational needs of
                  organizations. Dynamic privilege management can include, for example, the immediate revocation of
                  privileges from users, as opposed to requiring that users terminate and restart their sessions to reflect
                  any changes in privileges. Dynamic privilege management can also refer to mechanisms that change
                  the privileges of users based on dynamic rules as opposed to editing specific user profiles. This type of
                  privilege management includes, for example, automatic adjustments of privileges if users are operating
                  out of their normal work times, or if information systems are under duress or in emergency

                maintenance situations. This control enhancement also includes the ancillary effects of privilege
                changes, for example, the potential changes to encryption keys used for communications. Dynamic
                privilege management can support requirements for information system resiliency. Related control:
                AC-16.
          (7)   ACCOUNT MANAGEMENT | ROLE-BASED SCHEMES
                The organization:
                (a)   Establishes and administers privileged user accounts in accordance with a role-based access scheme that
                      organizes allowed information system access and privileges into roles;
                (b) Monitors privileged role assignments; and
                (c)   Takes the following action: Disables (or revokes) privileged user accounts when privileged role
                      assignments are no longer appropriate.
                Supplemental Guidance: Privileged roles are organization-defined roles assigned to individuals that
                allow those individuals to perform certain security-relevant functions that ordinary users are not
                authorized to perform. These privileged roles include, for example, key management, account
                management, network and system administration, database administration, and web administration.
                 Organizations shall establish and administer privileged user accounts in accordance with
                 a role-based access scheme that organizes information system and network privileges
                 into roles; and tracks and monitors privileged role assignments. [AC-2(7)(a)], [AC-
                 2(7)(b)] Privileged roles also include auditor and data transfer agent (DTA).
          (8)   ACCOUNT MANAGEMENT | DYNAMIC ACCOUNT CREATION
                The information system creates [Assignment: organization-defined information system accounts]
                dynamically.
                Supplemental Guidance: Dynamic approaches for creating information system accounts (e.g., as
                implemented within service-oriented architectures) rely on establishing accounts (identities) at run
                time for entities that were previously unknown. Organizations plan for dynamic creation of
                information system accounts by establishing trust relationships and mechanisms with the appropriate
                authorities to validate related authorizations and privileges. Related control: AC-16.
          (9)   ACCOUNT MANAGEMENT | RESTRICTIONS ON USE OF SHARED GROUPS / ACCOUNTS
                The organization only permits the use of shared/group accounts that meet [Assignment: organization-defined
                conditions for establishing shared/group accounts].

                 See also supplemental guidance for AC-2.k.
          (10) ACCOUNT MANAGEMENT | SHARED / GROUP ACCOUNT CREDENTIAL TERMINATION
                The information system terminates shared/group account credentials when members leave the group.

                 See also supplemental guidance for AC-2.k.
          (11) ACCOUNT MANAGEMENT | USAGE CONDITIONS
                The information system enforces [Assignment: organization-defined circumstances and/or usage conditions] for
                [Assignment: organization-defined information system accounts].
                Supplemental Guidance: Organizations can describe the specific conditions or circumstances under
                which information system accounts can be used, for example, by restricting usage to certain days of the
                week, time of day, or specific durations of time.
          (12) ACCOUNT MANAGEMENT | ACCOUNT MONITORING / ATYPICAL USAGE
                The organization:
                a.    Monitors information system accounts for [Assignment: organization-defined atypical use]; and
                b.    Reports atypical usage of information system accounts to [Assignment: organization-defined personnel or
                      roles].
                Supplemental Guidance: Atypical usage includes, for example, accessing information systems at certain
                times of the day and from locations that are not consistent with the normal usage patterns of
                individuals working in organizations. Related control: CA-7.
          (13) ACCOUNT MANAGEMENT | DISABLE ACCOUNTS FOR HIGH-RISK INDIVIDUALS
                The organization disables accounts of users posing a significant risk within 30 minutes of discovery of the risk.

                 Supplemental Guidance: Users posing a significant risk to organizations include individuals for whom
                 reliable evidence or intelligence indicates either the intention to use authorized access to information
                 systems to cause harm or through whom adversaries will cause harm. Harm includes potential adverse
                 impacts to organizational operations and assets, individuals, other organizations, or the Nation. Close
                 coordination between authorizing officials, information system administrators, and human resource
                 managers is essential in order for timely execution of this control enhancement. Related control: PS-4.
                  See also AU-6.
          References: None.

AC-3      ACCESS ENFORCEMENT

          Control: The information system enforces approved authorizations for logical access to information
          and system resources in accordance with applicable access control policies.
          Supplemental Guidance: Access control policies (e.g., identity-based policies, role-based policies, control
          matrices, cryptography) control access between active entities or subjects (i.e., users or processes acting on
          behalf of users) and passive entities or objects (e.g., devices, files, records, domains) in information
          systems. In addition to enforcing authorized access at the information system level and recognizing that
          information systems can host many applications and services in support of organizational missions and
          business operations, access enforcement mechanisms can also be employed at the application and service
          level to provide increased information security. Related controls: AC-2, AC-4, AC-5, AC-6, AC-16, AC-
          17, AC-18, AC-19, AC-20, AC-21, AC-22, AU-9, CM-5, CM-6, CM-11, MA-3, MA-4, MA-5, PE-3.
               All information systems shall, at a minimum, enforce a discretionary access control (DAC)
               policy that covers the requirements of AC-3(4).
               For periods processing, consider tailoring in [SC-4(2)].
               Additional access enforcement controls apply to mobile computing devices, certain
               compartmentalized data as defined by the Data Owner, and CDS. See also Protection of
               Information at Rest [SC-28], Access Control for Mobile Devices [AC-19], and CDS in
               Information Flow Enforcement [AC-4].
               Access by Foreign Nationals - DoD SAP information is not releasable to foreign nationals
               except as authorized by the respective service/agency SAPCO.
          Control Enhancements:
          (1)    ACCESS ENFORCEMENT | RESTRICTED ACCESS TO PRIVILEGED FUNCTIONS
                 [Withdrawn: Incorporated into AC-6].
          (2)    ACCESS ENFORCEMENT | DUAL AUTHORIZATION
                 The information system enforces dual authorization for all transfers of data from a classified computer network
                 to removable media.

                 Supplemental Guidance: Dual authorization mechanisms require the approval of two authorized
                 individuals in order to execute. Organizations do not require dual authorization mechanisms when
                 immediate responses are necessary to ensure public and environmental safety. Dual authorization may
                 also be known as two-person control. Related controls: CP-9, MP-6.
                  Data transfer authorization enforcement can be performed by the organization, but
                  should have technical separation of roles to support the organization’s implemented dual
                  authorization process. Example of implementation meeting the spirit of AC-3(2): The
                  organization policy states that appropriately trained Data Transfer Agents (DTAs) are the
                  only individuals authorized to transfer data from a classified system to removable media.
                  Only System Administrators are authorized to enable permissions to transfer removable
                  media.
                  Media Custodians are not authorized to be DTAs.

          (3)   ACCESS ENFORCEMENT | MANDATORY ACCESS CONTROL
                The information system enforces [Assignment: organization-defined mandatory access control policies] over all
                subjects and objects where the policy specifies that:
                (a)   The policy is uniformly enforced across all subjects and objects within the boundary of the information system;
                (b) A subject that has been granted access to information is constrained from doing any of the following;
                      (1)   Passing the information to unauthorized subjects or objects;
                      (2)   Granting its privileges to other subjects;
                      (3)   Changing one or more security attributes on subjects, objects, the information system, or information
                            system components;
                      (4)   Choosing the security attributes and attribute values to be associated with newly created or modified
                            objects; or
                      (5)   Changing the rules governing access control; and
                (c)   [Assignment: Organized-defined subjects] may explicitly be granted [Assignment: organization-defined
                      privileges (i.e., they are trusted subjects)] such that they are not limited by some or all of the above constraints.

                Supplemental Guidance: Mandatory access control as defined in this control enhancement is
                synonymous with nondiscretionary access control, and is not constrained only to certain historical uses
                (e.g., implementations using the Bell-LaPadula Model). The above class of mandatory access control
                policies constrains what actions subjects can take with information obtained from data objects for
                which they have already been granted access, thus preventing the subjects from passing the
                information to unauthorized subjects and objects. This class of mandatory access control policies also
                constrains what actions subjects can take with respect to the propagation of access control privileges;
                that is, a subject with a privilege cannot pass that privilege to other subjects. The policy is uniformly
                enforced over all subjects and objects to which the information system has control. Otherwise, the
                access control policy can be circumvented. This enforcement typically is provided via an
                implementation that meets the reference monitor concept (see AC-25). The policy is bounded by the
                information system boundary (i.e., once the information is passed outside of the control of the system,
                additional means may be required to ensure that the constraints on the information remain in effect).
                The trusted subjects described above are granted privileges consistent with the concept of least
                privilege (see AC-6). Trusted subjects are only given the minimum privileges relative to the above
                policy necessary for satisfying organizational mission/business needs. The control is most applicable
                when there is some policy mandate (e.g., law, Executive Order, directive, or regulation) that
                establishes a policy regarding access to sensitive/classified information and some users of the
                information system are not authorized access to all sensitive/classified information resident in the
                information system. This control can operate in conjunction with AC-3 (4). A subject that is
                constrained in its operation by policies governed by this control is still able to operate under the less
                rigorous constraints of AC-3 (4), but policies governed by this control take precedence over the less
                rigorous constraints of AC-3 (4). For example, while a mandatory access control policy imposes a
                constraint preventing a subject from passing information to another subject operating at a different
                sensitivity label, AC-3 (4) permits the subject to pass the information to any subject with the same
                sensitivity label as the subject. Related controls: AC-25, SC-11.
          (4)   ACCESS ENFORCEMENT | DISCRETIONARY ACCESS CONTROL
                The information system enforces [Assignment: organization-defined discretionary access control policies] over
                defined subjects and objects where the policy specifies that a subject that has been granted access to information
                can do one or more of the following:
                (a)   Pass the information to any other subjects or objects;
                (b) Grant its privileges to other subjects;
                (c)   Change security attributes on subjects, objects, the information system, or the information system’s
                      components;
                (d) Choose the security attributes to be associated with newly created or revised objects; or
                (e)   Change the rules governing access control.

                Supplemental Guidance: When discretionary access control policies are implemented, subjects are not
                constrained with regard to what actions they can take with information for which they have already

                been granted access. Thus, subjects that have been granted access to information are not prevented
                from passing (i.e., the subjects have the discretion to pass) the information to other subjects or objects.
                This control enhancement can operate in conjunction with AC-3 (3). A subject that is constrained in its
                operation by policies governed by AC-3 (3) is still able to operate under the less rigorous constraints of
                this control enhancement. Thus, while AC-3 (3) imposes constraints preventing a subject from passing
                information to another subject operating at a different sensitivity level, AC-3 (4) permits the subject to
                pass the information to any subject at the same sensitivity level. The policy is bounded by the
                information system boundary. Once the information is passed outside of the control of the information
                system, additional means may be required to ensure that the constraints remain in effect. While the
                older, more traditional definitions of discretionary access control require identity-based access control,
                that limitation is not required for this use of discretionary access control.
                 The policy shall address at a minimum:
                    • Allows users to specify and control sharing by named individuals or groups of
                         individuals, or by both[AC-3(4)(a)];
                    • Limits propagation of access rights [AC-3(4)(b)]; and
                    • Includes or excludes access to the granularity of a single user. [AC-3(4)(c)]
          (5)   ACCESS ENFORCEMENT | SECURITY-RELEVANT INFORMATION
                The information system prevents access to [Assignment: organization-defined security-relevant information] except
                during secure, non-operable system states.
                Supplemental Guidance: Security-relevant information is any information within information systems
                that can potentially impact the operation of security functions or the provision of security services in a
                manner that could result in failure to enforce system security policies or maintain the isolation of code
                and data. Security-relevant information includes, for example, filtering rules for routers/firewalls,
                cryptographic key management information, configuration parameters for security services, and access
                control lists. Secure, non-operable system states include the times in which information systems are not
                performing mission/business-related processing (e.g., the system is off-line for maintenance,
                troubleshooting, boot-up, shut down). Related control: CM-3.
          (6)   ACCESS ENFORCEMENT | PROTECTION OF USER AND SYSTEM INFORMATION
                [Withdrawn: Incorporated into MP-4 and SC-28].
          (7)   ACCESS ENFORCEMENT | ROLE-BASED ACCESS CONTROL
                The information system enforces a role-based access control policy over defined subjects and objects and controls
                access based upon [Assignment: organization-defined roles and users authorized to assume such roles].
                Supplemental Guidance: Role-based access control (RBAC) is an access control policy that restricts
                information system access to authorized users. Organizations can create specific roles based on job
                functions and the authorizations (i.e., privileges) to perform needed operations on organizational
                information systems associated with the organization-defined roles. When users are assigned to the
                organizational roles, they inherit the authorizations or privileges defined for those roles. RBAC
                simplifies privilege administration for organizations because privileges are not assigned directly to
                every user (which can be a significant number of individuals for mid- to large-size organizations) but
                are instead acquired through role assignments. RBAC can be implemented either as a mandatory or
                discretionary form of access control. For organizations implementing RBAC with mandatory access
                controls, the requirements in AC-3 (3) define the scope of the subjects and objects covered by the
                policy.
          (8)   ACCESS ENFORCEMENT | REVOCATION OF ACCESS AUTHORIZATIONS
                The information system enforces the revocation of access authorizations resulting from changes to the security
                attributes of subjects and objects based on [Assignment: organization-defined rules governing the timing of
                revocations of access authorizations].
                Supplemental Guidance:   Revocation of access rules may differ based on the types of access revoked. For
                example, if a subject (i.e., user or process) is removed from a group, access may not be revoked until
                the next time the object (e.g., file) is opened or until the next time the subject attempts a new access to
                the object. Revocation based on changes to security labels may take effect immediately. Organizations

                can provide alternative approaches on how to make revocations immediate if information systems
                cannot provide such capability and immediate revocation is necessary.
          (9)   ACCESS ENFORCEMENT | CONTROLLED RELEASE
                The information system does not release information outside of the established system boundary unless:
                (a)   The receiving [Assignment: organization-defined information system or system component] provides
                      [Assignment: organization-defined security safeguards]; and
                (b) [Assignment: organization-defined security safeguards] are used to validate the appropriateness of the
                    information designated for release.
                Supplemental Guidance: Information systems can only protect organizational information within the
                confines of established system boundaries. Additional security safeguards may be needed to ensure
                that such information is adequately protected once it is passed beyond the established information
                system boundaries. Examples of information leaving the system boundary include transmitting
                information to an external information system or printing the information on one of its printers. In
                cases where the information system is unable to make a determination of the adequacy of the
                protections provided by entities outside its boundary, as a mitigating control, organizations determine
                procedurally whether the external information systems are providing adequate security. The means
                used to determine the adequacy of the security provided by external information systems include, for
                example, conducting inspections or periodic testing, establishing agreements between the organization
                and its counterpart organizations, or some other process. The means used by external entities to protect
                the information received need not be the same as those used by the organization, but the means
                employed are sufficient to provide consistent adjudication of the security policy to protect the
                information. This control enhancement requires information systems to employ technical or procedural
                means to validate the information prior to releasing it to external systems. For example, if the
                information system passes information to another system controlled by another organization, technical
                means are employed to validate that the security attributes associated with the exported information are
                appropriate for the receiving system. Alternatively, if the information system passes information to a
                printer in organization-controlled space, procedural means can be employed to ensure that only
                appropriately authorized individuals gain access to the printer. This control enhancement is most
                applicable when there is some policy mandate (e.g., law, Executive Order, directive, or regulation) that
                establishes policy regarding access to the information, and that policy applies beyond the realm of a
                particular information system or organization.
          (10) ACCESS ENFORCEMENT | AUDITED OVERRIDE OF ACCESS CONTROL MECHANISMS
                The organization employs an audited override of automated access control mechanisms under [Assignment:
                organization-defined conditions].
                Supplemental Guidance: Related controls: AU-2, AU-6.

          References: None.

AC-4      INFORMATION FLOW ENFORCEMENT

          Control: The information system enforces approved authorizations for controlling the flow of information
          within the system and between interconnected systems based on [Assignment: organization-defined
          information flow control policies].
          Supplemental Guidance: Information flow control regulates where information is allowed to travel within an
          information system and between information systems (as opposed to who is allowed to access the
          information) and without explicit regard to subsequent accesses to that information. Flow control
          restrictions include, for example, keeping export-controlled information from being transmitted in the clear
          to the Internet, blocking outside traffic that claims to be from within the organization, restricting web
          requests to the Internet that are not from the internal web proxy server, and limiting information transfers
          between organizations based on data structures and content. Transferring information between information
          systems representing different security domains with different security policies introduces risk that such
          transfers violate one or more domain security policies. In such situations, information owners/stewards
          provide guidance at designated policy enforcement points between interconnected systems. Organizations
          consider mandating specific architectural solutions when required to enforce specific security policies.
          Enforcement includes, for example: (i) prohibiting information transfers between interconnected systems

          (i.e., allowing access only); (ii) employing hardware mechanisms to enforce one-way information flows;
          and (iii) implementing trustworthy regrading mechanisms to reassign security attributes and security labels.
          Organizations commonly employ information flow control policies and enforcement mechanisms to control
          the flow of information between designated sources and destinations (e.g., networks, individuals, and
          devices) within information systems and between interconnected systems. Flow control is based on the
          characteristics of the information and/or the information path. Enforcement occurs, for example, in
          boundary protection devices (e.g., gateways, routers, guards, encrypted tunnels, firewalls) that employ rule
          sets or establish configuration settings that restrict information system services, provide a packet-filtering
          capability based on header information, or message-filtering capability based on message content (e.g.,
          implementing key word searches or using document characteristics). Organizations also consider the
          trustworthiness of filtering/inspection mechanisms (i.e., hardware, firmware, and software components)
          that are critical to information flow enforcement. Control enhancements 3 through 22 primarily address
          cross-domain solution needs which focus on more advanced filtering techniques, in-depth analysis, and
          stronger flow enforcement mechanisms implemented in cross-domain products, for example, high-
          assurance guards. Such capabilities are generally not available in commercial off-the-shelf information
          technology products. Related controls: AC-3, AC-17, AC-19, AC-21, CM-6, CM-7, SA-8, SC-2, SC-5, SC-
          7, SC-18.
               Information flow enforcement is addressed through the use of controlled interfaces (CI),
               including CDS, and assured file transfers (AFT). AFTs require data tracking logs for all
               transfers and a trained DTA.
               Controlled Interface (CI)
               A CI is a mechanism that facilitates adjudicating the security policies of different
               interconnected information systems (e.g., controlling the flow of information into or out of
               an interconnected system; often referred to as a guard). [CNSSI 4009]
               Controlling the flow of information into an interconnected system helps preserve the
               integrity of the system, and the integrity and confidentiality of the information maintained
               and processed by the system. Controlling the flow of information out of the system helps
               preserve the confidentiality of the information leaving the system, and may protect the
               integrity of the receiving system.
               Controlled interfaces that control the flow of information out of an IS are often employed to
               facilitate push technology, where the goal is to push information to an indirect user residing
               outside of the system perimeter (equipment responsibility demarcation), but within the
               system boundary (users).
               The adjudication of integrity and confidentiality policies may be handled in a variety of
               ways. For example, a single CI may perform all of the confidentiality and integrity
               adjudication; or one CI may be employed for adjudicating confidentiality policies while
               another adjudicates integrity policies; or the adjudication of confidentiality and integrity
               policies may be distributed across a set of CI where each performs some subset of
               confidentiality and integrity policy adjudication.
               While a CI is often implemented as a mechanism (or a set of mechanisms) separate from the
               systems it is intended to protect, this need not be the case. A CI can be constructed so that
               some of its functionality resides in the systems themselves. The term CI includes CDS,
               routers, firewalls, etc. The classification of the domains, to include the criteria to release
               data, is an indicator of what type of CI is required. See AC-4(20)

               Cross Domain Solution (CDS)
               A CDS is a form of controlled interface, utilizing a trusted operating system and
               enforcing a security policy to provide access to and/or transfer data between different
               security domains. A CDS requires a higher level of assurance, both from a hardware and
               software perspective.
               In the most simplistic terms a CDS is a set of mechanisms that implement the capabilities to
               access or transfer information (manually or automatically) between two or more security
               domains and enforce their security policies. This means the end points of the cross domain
               interconnections operate under different security policies with regard to classification, access
               or releasability of information. For example, when two information systems and/or networks
               of different security domains are connected together enabling access and/or data-flow
               between them, a CDS is mandatory and placed between the two domains.
               A well-designed CDS prevents untrusted and potentially malicious data from entering the
               network of the higher classification and prevents data of a higher classification from leaking
               into the network of a lower classification.
               The creation, validation (assessment and authorization), and life cycle support of a CDS can
               be time consuming and resource intensive. In 2006 as a result of urgent operational demands
               to share information more effectively across security domains throughout the federal
               government, the DoD and the IC CIOs established an interagency office – the Unified Cross
               Domain Services Management Office (UCDSMO), which focuses on delivering modern
               cross domain capabilities to the field.
               The primary function of the UCDSMO is to provide centralized coordination and oversight
               of all cross domain activities and ensure a common approach for the implementation of cross
               domain capabilities within the DoD and the IC. This means the UCDSMO will provide and
               maintain a list of supported CDS which are certified and fully documented (body of
               evidence) and a sunset list of CDS that are at the end of their life cycle. The UCDSMO-
               supported CDS still require authorization on a case-by-case basis by your respective AO.
               Contact the AO during initial CDS discussions, i.e., during the Pre-acquisition phase, and
               prior to engaging the UCDSMO. See AC-4(20)
               CDS Types
               To help determine what type of CDS is required, the UCDSMO-supported CDS are divided
               into three functional types:
                   • Data Transfer Solutions: Used to interconnect networks or information systems that
                        operate in different security domains and transfer information between them.
                   • Access Solutions: Used to provide simultaneous visualization of information from
                        multiple security domains via a single workstation without any data transfer between
                        the various domains.
                   • Multi-Level Solutions: Used to store data in multiple security domains at varied
                        security levels and allow users to access the data at an appropriate security level.
               A requirement to share information between different security domains requires AO
               coordination for selection, authorization, and connection approval.
               Assured File Transfers (AFT)
               There are two types of data transfers: Low-to-High and High-to-Low. Documented and AO
               approved data transfer procedures are required for both types.

               Low-to-High is defined as a transfer from a lower classification system to a higher
               classification system and also includes data transferred between two like security domains,
               e.g., S//SAR-A/SAR-B/SAR-C to S//SAR-A/SAR-B/SAR-C.
               High-to-Low is defined as a transfer from a higher classification system to a lower
               classification system. It also includes a transfer between systems of the same classification
               with a differing set of programs, i.e., different security domains, for example, between
               TS//SAR-A/SAR-B/SAR-C and TS//SAR-A/SAR-B/SAR-J.
               Conducting manual data transfers between security domains can be a time consuming, labor
               intensive process and must be done methodically and accurately to assure integrity of the
               source information, assure that only the data identified for transfer is transferred, prevent
               introduction of malicious software, and to prevent data spills. Careless methods, shortcuts,
               and untrained users have compromised sensitive and classified information vital to national
               security, mission success, and operational processes. AFT procedures are established to
               mitigate the risks associated with all aspects of this activity and are conducted by individuals
               trained in the risks associated with transferring data between disparate security domains. The
               DTA is responsible for understanding the risks involved in data transfers and following the
               AFT procedures to ensure any potential risk is managed during the download and transfer
               process. (Reference AT-3 for AFT/DTA training.) The subject matter expert (SME) is an
               individual knowledgeable of the program and the classification of information associated
               with it and is responsible for ensuring the file is reviewed and sanitized of all program-
               related data.
               All new and reused media must be virus scanned prior to starting an AFT.
               Data Transfer Tracking
               All data transfers (e.g., low to high, high to low) must be tracked to include date, originator
               making request, filename, file format, classification level, source and destination systems,
               and approver.
               A Low to High transfer requires:
                  • Log for transfers from a lower classified system (Secret or Top Secret) to a higher
                     classified system, e.g., Secret to Top Secret or S//SAR-A/SAR-B to S//SAR-A/SAR-
                     B/SAR-C. Data transferred from an unclassified system must be logged, e.g., vendor
                     software updates or antivirus definition files from Non-secure Internet Protocol
                     Router Network (NIPRNet).
                  • Two (2) virus/malware scans. The first scan is performed once the file(s) is
                     downloaded to the media on the originating system; the second scan is performed on
                     the media on the target system prior to uploading the file to the system. When
                     possible, use virus/malware scanning products from different vendors.
                  • Testing of the write protect mechanism. Once media is introduced on the High side,
                     the capability to write to the media must be tested to ensure the media cannot be
                     written to. If the test fails and the media is written to on the High side, then the
                     media must be classified at the higher classification level.
               A separate standalone system for scanning may be used if documented in the approved data
               transfer procedures.
               High to Low transfer requires:
                  • A log documenting date, originator making request, filename and format type (e.g.,
                      .doc, .xls, .pdf), classification level, DTA who performed transfer, SME who
                      performed review, originating system, target system, and approver.

                   •   Documented mission justification.
                   •   As a community best practice, use of an automated review tool in lieu of a manual
                       transfer process (e.g., checklist).
                   •   AO approval for use of automated tools or a manual transfer process/checklist.
                   •   A PSO approved key word list.
               AFT tools should not be confused with forensic tools. Forensic tools are ‘discovery’ tools
               designed for investigation and recovery (e.g., hard drive data), while keeping the files
               forensically sound and unchanged. An AFT tool performs a deep file inspection into the
               many complex layers and, in the case of Microsoft Office, the nearly 100 areas where MS
               Office products store data within a file, also known as metadata. The tool then provides the
               SME with a ‘what you see is what you get’ or WYSIWYG view. In addition, the AFT tools
               address cropped, resized, and hidden images and graphics through a
               cleansing/flattening/resolution process. AFT tools identify the exact location (page/
               paragraph) of keyword hits and cropped/resized graphics. Forensic tools find images and
               graphics as well as keywords, but do not identify their location, nor do they indicate if an
               image/graphic was cropped, resized, or hidden.

          Control Enhancements:
          (1)    INFORMATION FLOW ENFORCEMENT | OBJECT SECURITY ATTRIBUTES
                 The information system uses [Assignment: organization-defined security attributes] associated with [Assignment:
                 organization-defined information, source, and destination objects] to enforce [Assignment: organization-defined
                 information flow control policies] as a basis for flow control decisions.
                 Supplemental Guidance: Information flow enforcement mechanisms compare security attributes
                 associated with information (data content and data structure) and source/destination objects, and
                 respond appropriately (e.g., block, quarantine, alert administrator) when the mechanisms encounter
                 information flows not explicitly allowed by information flow policies. For example, an information
                 object labeled Secret would be allowed to flow to a destination object labeled Secret, but an
                 information object labeled Top Secret would not be allowed to flow to a destination object labeled
                 Secret. Security attributes can also include, for example, source and destination addresses employed in
                 traffic filter firewalls. Flow enforcement using explicit security attributes can be used, for example, to
                 control the release of certain types of information. Related control: AC-16.
          (2)    INFORMATION FLOW ENFORCEMENT | PROCESSING DOMAINS
                 The information system uses protected processing domains to enforce [Assignment: organization-defined information
                 flow control policies] as a basis for flow control decisions.
                 Supplemental Guidance: Within information systems, protected processing domains are processing
                 spaces that have controlled interactions with other processing spaces, thus enabling control of
                 information flows between these spaces and to/from data/information objects. A protected processing
                 domain can be provided, for example, by implementing domain and type enforcement. In domain and
                 type enforcement, information system processes are assigned to domains; information is identified by
                 types; and information flows are controlled based on allowed information accesses (determined by
                 domain and type), allowed signaling among domains, and allowed process transitions to other
                 domains.
          (3)    INFORMATION FLOW ENFORCEMENT | DYNAMIC INFORMATION FLOW CONTROL
                 The information system enforces dynamic information flow control based on [Assignment: organization-defined
                 policies].
                 Supplemental Guidance: Organizational policies regarding dynamic information flow control include, for
                 example, allowing or disallowing information flows based on changing conditions or
                 mission/operational considerations. Changing conditions include, for example, changes in
                 organizational risk tolerance due to changes in the immediacy of mission/business needs, changes in
                 the threat environment, and detection of potentially harmful or adverse events. Related control: SI-4.

          (4)   INFORMATION FLOW ENFORCEMENT | CONTENT CHECK ENCRYPTED INFORMATION
                The information system prevents encrypted information from bypassing content-checking mechanisms by [Selection
                (one or more): decrypting the information; blocking the flow of the encrypted information; terminating communications
                sessions attempting to pass encrypted information; [Assignment: organization-defined procedure or method]].
                Supplemental Guidance: Related control: SI-4.
          (5)   INFORMATION FLOW ENFORCEMENT | EMBEDDED DATA TYPES
                The information system enforces [Assignment: organization-defined limitations] on embedding data types within
                other data types.
                Supplemental Guidance: Embedding data types within other data types may result in reduced flow
                control effectiveness. Data type embedding includes, for example, inserting executable files as objects
                within word processing files, inserting references or descriptive information into a media file, and
                compressed or archived data types that may include multiple embedded data types. Limitations on data
                type embedding consider the levels of embedding and prohibit levels of data type embedding that are
                beyond the capability of the inspection tools.
          (6)   INFORMATION FLOW ENFORCEMENT | METADATA
                The information system enforces information flow control based on [Assignment: organization-defined metadata].
                Supplemental Guidance: Metadata is information used to describe the characteristics of data. Metadata
                can include structural metadata describing data structures (e.g., data format, syntax, and semantics) or
                descriptive metadata describing data contents (e.g., age, location, telephone number). Enforcing
                allowed information flows based on metadata enables simpler and more effective flow control.
                Organizations consider the trustworthiness of metadata with regard to data accuracy (i.e., knowledge
                that the metadata values are correct with respect to the data), data integrity (i.e., protecting against
                unauthorized changes to metadata tags), and the binding of metadata to the data payload (i.e., ensuring
                sufficiently strong binding techniques with appropriate levels of assurance). Related controls: AC-16,
                SI-7.
          (7)   INFORMATION FLOW ENFORCEMENT | ONE-WAY FLOW MECHANISMS
                The information system enforces [Assignment: organization-defined one-way flows] using hardware mechanisms.
          (8)   INFORMATION FLOW ENFORCEMENT | SECURITY POLICY FILTERS
                The information system enforces information flow control using [Assignment: organization-defined security policy
                filters] as a basis for flow control decisions for [Assignment: organization-defined information flows].
                Supplemental Guidance: Organization-defined security policy filters can address data structures and
                content. For example, security policy filters for data structures can check for maximum file lengths,
                maximum field sizes, and data/file types (for structured and unstructured data). Security policy filters
                for data content can check for specific words (e.g., dirty/clean word filters), enumerated values or data
                value ranges, and hidden content. Structured data permits the interpretation of data content by
                applications. Unstructured data typically refers to digital information without a particular data structure
                or with a data structure that does not facilitate the development of rule sets to address the particular
                sensitivity of the information conveyed by the data or the associated flow enforcement decisions.
                Unstructured data consists of: (i) bitmap objects that are inherently non language-based (i.e., image,
                video, or audio files); and (ii) textual objects that are based on written or printed languages (e.g.,
                commercial off-the-shelf word processing documents, spreadsheets, or emails). Organizations can
                implement more than one security policy filter to meet information flow control objectives (e.g.,
                employing clean word lists in conjunction with dirty word lists may help to reduce false positives).
          (9)   INFORMATION FLOW ENFORCEMENT | HUMAN REVIEWS
                The information system enforces the use of human reviews for [Assignment: organization-defined information flows]
                under the following conditions: [Assignment: organization-defined conditions].
                Supplemental Guidance: Organizations define security policy filters for all situations where automated
                flow control decisions are possible. When a fully automated flow control decision is not possible, then
                a human review may be employed in lieu of, or as a complement to, automated security policy
                filtering. Human reviews may also be employed as deemed necessary by organizations.
          (10) INFORMATION FLOW ENFORCEMENT | ENABLE / DISABLE SECURITY POLICY FILTERS
                The information system provides the capability for privileged administrators to enable/disable [Assignment:
                organization-defined security policy filters] under the following conditions: [Assignment: organization-defined
                conditions].

               Supplemental Guidance: For example, as allowed by the information system authorization,
               administrators can enable security policy filters to accommodate approved data types.
          (11) INFORMATION FLOW ENFORCEMENT | CONFIGURATION OF SECURITY POLICY FILTERS
               The information system provides the capability for privileged administrators to configure [Assignment: organization-
               defined security policy filters] to support different security policies.
               Supplemental Guidance: For example, to reflect changes in security policies, administrators can change
               the list of “dirty words” that security policy mechanisms check in accordance with the definitions
               provided by organizations.
          (12) INFORMATION FLOW ENFORCEMENT | DATA TYPE IDENTIFIERS
               The information system, when transferring information between different security domains, uses [Assignment:
               organization-defined data type identifiers] to validate data essential for information flow decisions.
               Supplemental Guidance: Data type identifiers include, for example, filenames, file types, file
               signatures/tokens, and multiple internal file signatures/tokens. Information systems may allow transfer
               of data only if compliant with data type format specifications.
          (13) INFORMATION FLOW ENFORCEMENT | DECOMPOSITION INTO POLICY-RELEVANT SUBCOMPONENTS
               The information system, when transferring information between different security domains, decomposes information
               into [Assignment: organization-defined policy-relevant subcomponents] for submission to policy enforcement
               mechanisms.
               Supplemental Guidance: Policy enforcement mechanisms apply filtering, inspection, and/or sanitization
               rules to the policy-relevant subcomponents of information to facilitate flow enforcement prior to
               transferring such information to different security domains. Parsing transfer files facilitates policy
               decisions on source, destination, certificates, classification, attachments, and other security-related
               component differentiators.
          (14) INFORMATION FLOW ENFORCEMENT | SECURITY POLICY FILTER CONSTRAINTS
               The information system, when transferring information between different security domains, implements [Assignment:
               organization-defined security policy filters] requiring fully enumerated formats that restrict data structure and content.
               Supplemental Guidance: Data structure and content restrictions reduce the range of potential malicious
               and/or unsanctioned content in cross-domain transactions. Security policy filters that restrict data
               structures include, for example, restricting file sizes and field lengths. Data content policy filters
               include, for example: (i) encoding formats for character sets (e.g., Universal Character Set
               Transformation Formats, American Standard Code for Information Interchange); (ii) restricting
               character data fields to only contain alpha-numeric characters; (iii) prohibiting special characters; and
               (iv) validating schema structures.
          (15) INFORMATION FLOW ENFORCEMENT | DETECTION OF UNSANCTIONED INFORMATION
               The information system, when transferring information between different security domains, examines the information
               for the presence of [Assignment: organized-defined unsanctioned information] and prohibits the transfer of such
               information in accordance with the [Assignment: organization-defined security policy].
               Supplemental Guidance: Detection of unsanctioned information includes, for example, checking all
               information to be transferred for malicious code and dirty words. Related control: SI-3.
          (16) INFORMATION FLOW ENFORCEMENT | INFORMATION TRANSFERS ON INTERCONNECTED SYSTEMS
               [Withdrawn: Incorporated into AC-4].
          (17) INFORMATION FLOW ENFORCEMENT | DOMAIN AUTHENTICATION
               The information system uniquely identifies and authenticates source and destination points by [Selection (one or
               more): organization, system, application, individual] for information transfer.
               Supplemental Guidance: Attribution is a critical component of a security concept of operations. The
               ability to identify source and destination points for information flowing in information systems, allows
               the forensic reconstruction of events when required, and encourages policy compliance by attributing
               policy violations to specific organizations/individuals. Successful domain authentication requires that
               information system labels distinguish among systems, organizations, and individuals involved in
               preparing, sending, receiving, or disseminating information. Related controls: IA-2, IA-3, IA-4, IA-5.
          (18) INFORMATION FLOW ENFORCEMENT | SECURITY ATTRIBUTE BINDING
               The information system binds security attributes to information using [Assignment: organization-defined binding
               techniques] to facilitate information flow policy enforcement.

               Supplemental Guidance: Binding techniques implemented by information systems affect the strength of
               security attribute binding to information. Binding strength and the assurance associated with binding
               techniques play an important part in the trust organizations have in the information flow enforcement
               process. The binding techniques affect the number and degree of additional reviews required by
               organizations. Related controls: AC-16, SC-16.
          (19) INFORMATION FLOW ENFORCEMENT | VALIDATION OF METADATA
               The information system, when transferring information between different security domains, applies the same security
               policy filtering to metadata as it applies to data payloads.
               Supplemental Guidance: This control enhancement requires the validation of metadata and the data to
               which the metadata applies. Some organizations distinguish between metadata and data payloads (i.e.,
               only the data to which the metadata is bound). Other organizations do not make such distinctions,
               considering metadata and the data to which the metadata applies as part of the payload. All information
               (including metadata and the data to which the metadata applies) is subject to filtering and inspection.
          (20) INFORMATION FLOW ENFORCEMENT | APPROVED SOLUTIONS
               The organization employs [Assignment: organization-defined solutions in approved configurations] to control the flow
               of [Assignment: organization-defined information] across security domains.
               Supplemental Guidance: Organizations define approved solutions and configurations in cross-domain
               policies and guidance in accordance with the types of information flows across classification
               boundaries. The Unified Cross Domain Management Office (UCDMO) provides a baseline listing of
               approved cross-domain solutions.
                UCDMO is now Unified Cross Domain Services Management Office (UCDSMO).
          (21) INFORMATION FLOW ENFORCEMENT | PHYSICAL / LOGICAL SEPARATION OF INFORMATION FLOWS
               The information system separates information flows logically or physically using [Assignment: organization-defined
               mechanisms and/or techniques] to accomplish [Assignment: organization-defined required separations by types of
               information].
               Supplemental Guidance: Enforcing the separation of information flows by type can enhance protection
               by ensuring that information is not commingled while in transit and by enabling flow control by
               transmission paths perhaps not otherwise achievable. Types of separable information include, for
               example, inbound and outbound communications traffic, service requests and responses, and
               information of differing security categories.
          (22) INFORMATION FLOW ENFORCEMENT | ACCESS ONLY
               The information system provides access from a single device to computing platforms, applications, or data residing
               on multiple different security domains, while preventing any information flow between the different security domains.
               Supplemental Guidance: The information system, for example, provides a desktop for users to access
               each connected security domain without providing any mechanisms to allow transfer of information
               between the different security domains.
          References: None.

AC-5      SEPARATION OF DUTIES

          Control: The organization:

          a.   Separates at a minimum, duties of system administrators from audit administration functions;
               and duties of DTAs from media custodians;
          b.   Documents separation of duties of individuals; and
          c.   Defines information system access authorizations to support separation of duties.
          Supplemental Guidance: Separation of duties addresses the potential for abuse of authorized privileges and
          helps to reduce the risk of malevolent activity without collusion. Separation of duties includes, for
          example: (i) dividing mission functions and information system support functions among different
          individuals and/or roles; (ii) conducting information system support functions with different individuals
          (e.g., system management, programming, configuration management, quality assurance and testing, and
          network security); and (iii) ensuring security personnel administering access control functions do not also
          administer audit functions. Related controls: AC-3, AC-6, PE-3, PE-4, PS-2.

               Different privileged accounts should be assigned for different roles. Organizations should
               separate roles for network or database administration from other sensitive functions, such as
               cryptographic key management, hardware management, removable media data transfer,
               system security management, or access to particularly sensitive information.
          Control Enhancements: None.

          References: None.

AC-6      LEAST PRIVILEGE

          Control: The organization employs the principle of least privilege, allowing only authorized accesses for
          users (or processes acting on behalf of users) which are necessary to accomplish assigned tasks in
          accordance with organizational missions and business functions.
          Supplemental Guidance: Organizations employ least privilege for specific duties and information systems.
          The principle of least privilege is also applied to information system processes, ensuring that the processes
          operate at privilege levels no higher than necessary to accomplish required organizational
          missions/business functions. Organizations consider the creation of additional processes, roles, and
          information system accounts as necessary, to achieve least privilege. Organizations also apply least
          privilege to the development, implementation, and operation of organizational information systems.
          Related controls: AC-2, AC-3, AC-5, CM-6, CM-7, PL-2.
               For example, system administrators, security administrators, and database administrators
               perform functions that do not require use of their fully privileged account. They shall,
               therefore, use a separate general user account and are required to use that account when not
               performing privileged functions. [AC-6(2)] Individual email accounts should not be used
               when logged in as a privileged user.
               Other examples of least privilege include restricting access to audit logs to security auditors,
               preventing general users from installing software, and/or limiting access to media drives to
               DTAs that have been formally trained.
           Control Enhancements:
          (1)    LEAST PRIVILEGE | AUTHORIZE ACCESS TO SECURITY FUNCTIONS
                 The organization explicitly authorizes access to [Assignment: organization-defined security functions (deployed in
                 hardware, software, and firmware) and security-relevant information]).
                 Supplemental Guidance: Security functions include, for example, establishing system accounts,
                 configuring access authorizations (i.e., permissions, privileges), setting events to be audited, and
                 setting intrusion detection parameters. Security-relevant information includes, for example, filtering
                 rules for routers/firewalls, cryptographic key management information, configuration parameters for
                 security services, and access control lists. Explicitly authorized personnel include, for example,
                 security administrators, system and network administrators, system security officers, system
                 maintenance personnel, system programmers, and other privileged users. Related controls: AC-17,
                 AC-18, AC-19.
                   One example of this is authorizing access to specific system endpoints, such as access to
                   USB ports, CD/DVD drives, microphones, and cameras as well as least privilege on
                   ability to make changes to port security implemented on switches. Additional roles on the
                   network must also be considered.
                   All classified information systems must technically enforce restrictions on the ability to
                   write to removable media. By default, all write functionality must be disabled. Whenever
                   access to writable removable media is necessary, the write functionality may be enabled,
                   but this must be logged. After the write functions are completed, the write functionality
                   must again be disabled and logged.
                   Ensure media access is audited as indicated in AU-2.a.

                 This control is non-tailorable for all SAP systems.
          (2)   LEAST PRIVILEGE | NON-PRIVILEGED ACCESS FOR NONSECURITY FUNCTIONS
                The organization requires that users of information system accounts, or roles, with access to privileged functions
                (except the DTA role), use non-privileged accounts or roles, when accessing nonsecurity functions.
                Supplemental Guidance: This control enhancement limits exposure when operating from within
                privileged accounts or roles. The inclusion of roles addresses situations where organizations implement
                access control policies such as role-based access control and where a change of role provides the same
                degree of assurance in the change of access authorizations for both the user and all processes acting on
                behalf of the user as would be provided by a change between a privileged and non-privileged account.
                Related control: PL-4.
          (3)   LEAST PRIVILEGE | NETWORK ACCESS TO PRIVILEGED COMMANDS
                The organization authorizes network access to [Assignment: organization-defined privileged commands] only for
                [Assignment: organization-defined compelling operational needs] and documents the rationale for such access in the
                security plan for the information system.
                Supplemental Guidance: Network access is any access across a network connection in lieu of local
                access (i.e., user being physically present at the device). Related control: AC-17.
          (4)   LEAST PRIVILEGE | SEPARATE PROCESSING DOMAINS
                The information system provides separate processing domains to enable finer-grained allocation of user privileges.
                Supplemental Guidance:   Providing separate processing domains for finer-grained allocation of user
                privileges includes, for example: (i) using virtualization techniques to allow additional privileges
                within a virtual machine while restricting privileges to other virtual machines or to the underlying
                actual machine; (ii) employing hardware and/or software domain separation mechanisms; and (iii)
                implementing separate physical domains. Related controls: AC-4, SC-3, SC-30, SC-32.
          (5)   LEAST PRIVILEGE | PRIVILEGED ACCOUNTS
                The organization restricts privileged accounts on the information system to absolute minimum number of
                privileged users needed to manage the system.
                Supplemental Guidance: Privileged accounts, including super user accounts, are typically described as
                system administrator for various types of commercial off-the-shelf operating systems. Restricting
                privileged accounts to specific personnel or roles prevents day-to-day users from having access to
                privileged information/functions. Organizations may differentiate in the application of this control
                enhancement between allowed privileges for local accounts and for domain accounts provided
                organizations retain the ability to control information system configurations for key security
                parameters and as otherwise necessary to sufficiently mitigate risk. Related control: CM-6.
                 In addition, super-user/root privileges shall be limited to the maximum extent possible.
                 For example, not all privileged users will be granted full super-user/root access.
          (6)   LEAST PRIVILEGE | PRIVILEGED ACCESS BY NON-ORGANIZATIONAL USERS
                The organization prohibits privileged access to the information system by non-organizational users.
                Supplemental Guidance: Related control: IA-8.

                 Reference IA-2 for definition of organizational user.
          (7)   LEAST PRIVILEGE | REVIEW OF USER PRIVILEGES
                The organization:
                (a)   Reviews at least annually the privileges assigned to privileged user accounts including DTA role to validate
                      the need for such privileges; and
                (b) Reassigns or removes privileges, if necessary, to correctly reflect organizational mission/business needs.
                Supplemental Guidance: The need for certain assigned user privileges may change over time reflecting
                changes in organizational missions/business function, environments of operation, technologies, or
                threat. Periodic review of assigned user privileges is necessary to determine if the rationale for
                assigning such privileges remains valid. If the need cannot be revalidated, organizations take
                appropriate corrective actions. Related control: CA-7.
                 The Presidential Memo, National Insider Threat Policy and Minimum Standards for
                 Insider Threat Programs, November 21, 2012, and DoDD 5205.16, The DoD Insider

                 Threat Program, 30 Sep 2014, require that organizations develop insider threat programs
                 to include reporting the status of privileged users (e.g., total number, additions, deletions)
                 on a quarterly basis.
          (8)   LEAST PRIVILEGE | PRIVILEGE LEVELS FOR CODE EXECUTION
                The information system prevents software applications/programs from executing at higher privilege levels than
                users executing the software.
                Supplemental Guidance: In certain situations, software applications/programs need to execute with
                elevated privileges to perform required functions. However, if the privileges required for execution are
                at a higher level than the privileges assigned to organizational users invoking such
                applications/programs, those users are indirectly provided with greater privileges than assigned by
                organizations.
                 The context of this enhancement is in the basic control where it states "or processes
                 acting on behalf of users." This enhancement typically overlaps with and enables AC-
                 6(1). Both Windows and Linux distinguish between normal user level privilege and
                 privileged user privilege (admin and root).
                 Example: To maintain system integrity most systems restrict the ability of an application
                 to install other software (including reinstalling itself). Windows users (from Vista on)
                 are familiar with User Account Control (UAC) popup or the need to right click and "Run
                 as Administrator" in order to install an application. Linux users are familiar with an "su"
                 or "sudo" to root privilege to install applications.
                 Another example is the Windows registry editor that runs for all users, but only allows
                 editing of the registry values authorized for each user.
                 Even for privileged users, it is not uncommon to find that the audit management and
                 backup applications only execute for users in the assigned groups.
                 Some software requires privileged escalation by design, such as the Unix password
                 program; ensure AC-6(8) is tailored to document those programs, as applicable.
          (9)   LEAST PRIVILEGE | AUDITING USE OF PRIVILEGED FUNCTIONS
                The information system audits the execution of privileged functions.
                Supplemental Guidance: Misuse of privileged functions, either intentionally or unintentionally by
                authorized users, or by unauthorized external entities that have compromised information system
                accounts, is a serious and ongoing concern and can have significant adverse impacts on organizations.
                Auditing the use of privileged functions is one way to detect such misuse, and in doing so, help
                mitigate the risk from insider threats and the advanced persistent threat (APT). Related control: AU-2.
          (10) LEAST PRIVILEGE | PROHIBIT NON-PRIVILEGED USERS FROM EXECUTING PRIVILEGED FUNCTIONS
                The information system prevents non-privileged users from executing privileged functions to include disabling,
                circumventing, or altering implemented security safeguards/countermeasures.
                Supplemental Guidance: Privileged functions include, for example, establishing information system
                accounts, performing system integrity checks, or administering cryptographic key management
                activities. Non-privileged users are individuals that do not possess appropriate authorizations.
                Circumventing intrusion detection and prevention mechanisms or malicious code protection
                mechanisms are examples of privileged functions that require protection from non-privileged users.
          References: None.

AC-7      UNSUCCESSFUL LOGON ATTEMPTS

          Control: The information system:

          a.    Enforces a limit of maximum of three (3) consecutive invalid logon attempts by a user during a
                fifteen (15) minute time period; and

          b.     Automatically locks the account/node until released by an administrator when the maximum
                 number of unsuccessful attempts is exceeded.
          Supplemental Guidance: This control applies regardless of whether the logon occurs via a local or network
          connection. Due to the potential for denial of service, automatic lockouts initiated by information systems
          are usually temporary and automatically release after a predetermined time period established by
          organizations. If a delay algorithm is selected, organizations may choose to employ different algorithms for
          different information system components based on the capabilities of those components. Responses to
          unsuccessful logon attempts may be implemented at both the operating system and the application levels.
          Related controls: AC-2, AC-9, AC-14, IA-5.
               If (b) is not supported locally, then the account/node shall be automatically locked for a
               minimum of 15 minutes.
          Control Enhancements:
          (1)    UNSUCCESSFUL LOGON ATTEMPTS | AUTOMATIC ACCOUNT LOCK
                 [Withdrawn: Incorporated into AC-7].
          (2)    UNSUCCESSFUL LOGON ATTEMPTS | PURGE / WIPE MOBILE DEVICE
                 The information system purges/wipes information from [Assignment: organization-defined mobile devices] based on
                 [Assignment: organization-defined purging/wiping requirements/techniques] after 10 consecutive, unsuccessful
                 device logon attempts.
                 Supplemental Guidance: This control enhancement applies only to mobile devices for which a logon
                 occurs (e.g., personal digital assistants, smart phones, tablets). The logon is to the mobile device, not to
                 any one account on the device. Therefore, successful logons to any accounts on mobile devices reset
                 the unsuccessful logon count to zero. Organizations define information to be purged/wiped carefully in
                 order to avoid over purging/wiping which may result in devices becoming unusable. Purging/wiping
                 may be unnecessary if the information on the device is protected with sufficiently strong encryption
                 mechanisms. Related controls: AC-19, MP-5, MP-6, SC-13.
          References: None.

AC-8      SYSTEM USE NOTIFICATION

          Control: The information system:
          a.     Displays to users DoD Information Systems Standard Consent Banner before granting access to the system that
                 provides privacy and security notices consistent with applicable federal laws, Executive Orders, directives, policies,
                 regulations, standards, and guidance and states that:

                 1.   Users are accessing a U.S. Government information system;
                 2.   Information system usage may be monitored, recorded, and subject to audit;
                 3.   Unauthorized use of the information system is prohibited and subject to criminal and civil
                      penalties; and
                 4.   Use of the information system indicates consent to monitoring and recording;
          b.     Retains the notification message or banner on the screen until users acknowledge the usage conditions
                 and take explicit actions to log on to or further access the information system; and
          c.     For publicly accessible systems:
                 1.   Displays system use information [Assignment: organization-defined conditions], before granting
                      further access;
                 2.   Displays references, if any, to monitoring, recording, or auditing that are consistent with privacy
                      accommodations for such systems that generally prohibit those activities; and
                 3.   Includes a description of the authorized uses of the system.
          Supplemental Guidance: System use notifications can be implemented using messages or warning banners
          displayed before individuals log in to information systems. System use notifications are used only for

          access via logon interfaces with human users and are not required when such human interfaces do not exist.
          Organizations consider system use notification messages/banners displayed in multiple languages based on
          specific organizational needs and the demographics of information system users. Organizations also consult
          with the Office of the General Counsel for legal review and approval of warning banner content.
          Control Enhancements: None.

               In accordance with DoDI 8500.01, Cybersecurity, March 14, 2014, Enclosure 3, paragraph
               9(1)(d), Notice and Consent Banners: “Standard mandatory notice and consent banners must
               be displayed at logon to all ISs and standard mandatory consent notice and consent
               provisions will be included in all DoD IS user agreements in accordance with applicable
               security controls and DoD implementation procedures.” The required text for the banner and
               user agreements is posted to DISA’s Information Assurance Support Environment (IASE)
               website under “DoD Consent Banner” at http://iase.disa.mil.
          References: None.

AC-9      PREVIOUS LOGON (ACCESS) NOTIFICATION

          Control: The information system notifies the user, upon successful logon (access) to the system, of the date
          and time of the last logon (access).
          Supplemental Guidance: This control is applicable to logons to information systems via human user
          interfaces and logons to systems that occur in other types of architectures (e.g., service-oriented
          architectures). Related controls: AC-7, PL-4.
          Control Enhancements:
          (1)    PREVIOUS LOGON NOTIFICATION | UNSUCCESSFUL LOGONS
                 The information system notifies the user, upon successful logon/access, of the number of unsuccessful logon/access
                 attempts since the last successful logon/access.
          (2)    PREVIOUS LOGON NOTIFICATION | SUCCESSFUL / UNSUCCESSFUL LOGONS
                 The information system notifies the user of the number of successful logons/accesses; unsuccessful
                 logon/access attempts during the period since last successful logon.
          (3)    PREVIOUS LOGON NOTIFICATION | NOTIFICATION OF ACCOUNT CHANGES
                 The information system notifies the user of changes to [Assignment: organization-defined security-related
                 characteristics/parameters of the user’s account] during the period since last successful logon
          (4)    PREVIOUS LOGON NOTIFICATION | ADDITIONAL LOGON INFORMATION
                 The information system notifies the user, upon successful logon (access), of the following additional information:
                 [Assignment: organization-defined information to be included in addition to the date and time of the last logon
                 (access)].
                 Supplemental Guidance: This control enhancement permits organizations to specify additional
                 information to be provided to users upon logon including, for example, the location of last logon. User
                 location is defined as that information which can be determined by information systems, for example,
                 IP addresses from which network logons occurred, device identifiers, or notifications of local logons.
          References: None.

AC-10     CONCURRENT SESSION CONTROL

          Control: The information system limits the number of concurrent sessions for each non-privileged and
          privileged to maximum of three (3) sessions.
          Supplemental Guidance: Organizations may define the maximum number of concurrent sessions for
          information system accounts globally, by account type (e.g., privileged user, non-privileged user, domain,
          specific application), by account, or a combination. For example, organizations may limit the number of
          concurrent sessions for system administrators or individuals working in particularly sensitive domains or
          mission-critical applications. This control addresses concurrent sessions for information system accounts
          and does not address concurrent sessions by single users via multiple system accounts.

               This control may require third party software or development of a script.
          Control Enhancements: None.

          References: None.

AC-11     SESSION LOCK

          Control: The information system:

          a.     Prevents further access to the system by initiating a session lock after not to exceed fifteen (15)
                 minutes of inactivity or upon receiving a request from a user; and
          b.     Retains the session lock until the user reestablishes access using established identification and
                 authentication procedures.
          Supplemental Guidance: Session locks are temporary actions taken when users stop work and move away
          from the immediate vicinity of information systems but do not want to log out because of the temporary
          nature of their absences. Session locks are implemented where session activities can be determined. This is
          typically at the operating system level, but can also be at the application level. Session locks are not an
          acceptable substitute for logging out of information systems, for example, if organizations require users to
          log out at the end of workdays. Related control: AC-7.
               Session locks (aka screen locks) shall be configured to require authentication for reentry into
               the system. Systems supporting token-based authentication shall lock when the token is
               removed. All users are required to logout of all systems at the end of each workday and for
               any extended absence (6 hours). Operational considerations may require exceptions to this
               requirement, e.g., operational testing of weapons systems or watch standing environments.
               Unattended Processing
               Unattended processing is defined as automated processes executed/running on a user’s behalf
               while no users are physically present in the area/facility. Unattended processes generally run
               after hours during the week or on weekends. Automated processes may include IT
               administrative functions (e.g., backups, scans) as well as mission-related tasks requiring
               additional network resources, e.g., executing complex algorithms. Open storage is approved
               by the PSO based on physical accreditation with regard to media, mission need, and risk.
               Unattended processing is approved by the AO based on system, mission justification, and
               environment. Unattended processing must be captured in the SSP/SCTM identifying the
               specific IT administrative functions and/or mission-related tasks that run as unattended
               processes. If possible, implement screen lock or appropriate prominently displayed signage.
          Control Enhancements:
          (1)    SESSION LOCK | PATTERN-HIDING DISPLAYS
                 The information system conceals, via the session lock, information previously visible on the display with a publicly
                 viewable image.
                 Supplemental Guidance: Publicly viewable images can include static or dynamic images, for example,
                 patterns used with screen savers, photographic images, solid colors, clock, battery life indicator, or a
                 blank screen, with the additional caveat that none of the images convey sensitive information.
                   Ensure an unclassified image is displayed on the monitor to prevent unauthorized
                   disclosure of classified information.
          References:     OMB Memorandum 06-16.

AC-12     SESSION TERMINATION

          Control: The information system automatically terminates a user session after [Assignment: organization-
          defined conditions or trigger events requiring session disconnect].

          Supplemental Guidance: This control addresses the termination of user-initiated logical sessions in contrast to
          SC-10 which addresses the termination of network connections that are associated with communications
          sessions (i.e., network disconnect). A logical session (for local, network, and remote access) is initiated
          whenever a user (or process acting on behalf of a user) accesses an organizational information system. Such
          user sessions can be terminated (and thus terminate user access) without terminating network sessions.
          Session termination terminates all processes associated with a user’s logical session except those processes
          that are specifically created by the user (i.e., session owner) to continue after the session is terminated.
          Conditions or trigger events requiring automatic session termination can include, for example,
          organization-defined periods of user inactivity, targeted responses to certain types of incidents, time-of-day
          restrictions on information system use. Related controls: SC-10, SC-23.
          Control Enhancements:
          (1)    SESSION TERMINATION | USER-INITIATED LOGOUTS / MESSAGE DISPLAYS
                 The information system:
                 (a)   Provides a logout capability for user-initiated communications sessions whenever authentication is used to gain
                       access to all information resources and
                 (b) Displays an explicit logout message to users indicating the reliable termination of authenticated communications
                     sessions.
                 Supplemental Guidance: Information resources to which users gain access via authentication includes,
                 for example, local workstations, databases, and password-protected websites/web-based services.
                 Logout messages for web page access, for example, can be displayed after authenticated sessions have
                 been terminated. However, for some types of interactive sessions including, for example, file transfer
                 protocol (FTP) sessions, information systems typically send logout messages as final messages prior to
                 terminating sessions.
          References: None.

AC-13     SUPERVISION AND REVIEW — ACCESS CONTROL
          [Withdrawn: Incorporated into AC-2 and AU-6].

AC-14     PERMITTED ACTIONS WITHOUT IDENTIFICATION OR AUTHENTICATION

          Control: The organization:

          a.     Identifies that no user actions can be performed on the information system without identification or
                 authentication consistent with organizational missions/business functions; and
          b.     Documents and provides supporting rationale in the security plan for the information system, user
                 actions not requiring identification or authentication.
          Supplemental Guidance: This control addresses situations in which organizations determine that no
          identification or authentication is required in organizational information systems. Organizations may allow
          a limited number of user actions without identification or authentication including, for example, when
          individuals access public websites or other publicly accessible federal information systems, when
          individuals use mobile phones to receive calls, or when facsimiles are received. Organizations also identify
          actions that normally require identification or authentication but may under certain circumstances (e.g.,
          emergencies), allow identification or authentication mechanisms to be bypassed. Such bypasses may occur,
          for example, via a software-readable physical switch that commands bypass of the logon functionality and
          is protected from accidental or unmonitored use. This control does not apply to situations where
          identification and authentication have already occurred and are not repeated, but rather to situations where
          identification and authentication have not yet occurred. Organizations may decide that there are no user
          actions that can be performed on organizational information systems without identification and
          authentication and thus, the values for assignment statements can be none. Related controls: CP-2, IA-2.
               Reference AU-3 overprint for guidance on audits for fax machines.
          Control Enhancements: None.

          (1)   PERMITTED ACTIONS WITHOUT IDENTIFICATION OR AUTHENTICATION | NECESSARY USES
                [Withdrawn: Incorporated into AC-14].

          References: None.

AC-15     AUTOMATED MARKING
                [Withdrawn: Incorporated into MP-3].

          References: None.

AC-16     SECURITY ATTRIBUTES

          Control: The organization:

          a.    Provides the means to associate [Assignment: organization-defined types of security attributes] having
                [Assignment: organization-defined security attribute values] with information in storage, in process,
                and/or in transmission;
          b.    Ensures that the security attribute associations are made and retained with the information;
          c.    Establishes the permitted [Assignment: organization-defined security attributes] for [Assignment:
                organization-defined information systems]; and
          d.    Determines the permitted [Assignment: organization-defined values or ranges] for each of the
                established security attributes.
          Supplemental Guidance: Information is represented internally within information systems using abstractions
          known as data structures. Internal data structures can represent different types of entities, both active and
          passive. Active entities, also known as subjects, are typically associated with individuals, devices, or
          processes acting on behalf of individuals. Passive entities, also known as objects, are typically associated
          with data structures such as records, buffers, tables, files, inter-process pipes, and communications ports.
          Security attributes, a form of metadata, are abstractions representing the basic properties or characteristics
          of active and passive entities with respect to safeguarding information. These attributes may be associated
          with active entities (i.e., subjects) that have the potential to send or receive information, to cause
          information to flow among objects, or to change the information system state. These attributes may also be
          associated with passive entities (i.e., objects) that contain or receive information. The association of
          security attributes to subjects and objects is referred to as binding and is typically inclusive of setting the
          attribute value and the attribute type. Security attributes when bound to data/information, enables the
          enforcement of information security policies for access control and information flow control, either through
          organizational processes or information system functions or mechanisms. The content or assigned values of
          security attributes can directly affect the ability of individuals to access organizational information.
          Organizations can define the types of attributes needed for selected information systems to support
          missions/business functions. There is potentially a wide range of values that can be assigned to any given
          security attribute. Release markings could include, for example, US only, NATO, or NOFORN (not
          releasable to foreign nationals). By specifying permitted attribute ranges and values, organizations can
          ensure that the security attribute values are meaningful and relevant. The term security labeling refers to the
          association of security attributes with subjects and objects represented by internal data structures within
          organizational information systems, to enable information system-based enforcement of information
          security policies. Security labels include, for example, access authorizations, data life cycle protection (i.e.,
          encryption and data expiration), nationality, affiliation as contractor, and classification of information in
          accordance with legal and compliance requirements. The term security marking refers to the association of
          security attributes with objects in a human-readable form, to enable organizational process-based
          enforcement of information security policies. The AC-16 base control represents the requirement for user-
          based attribute association (marking). The enhancements to AC-16 represent additional requirements
          including information system-based attribute association (labeling). Types of attributes include, for
          example, classification level for objects and clearance (access authorization) level for subjects. An example
          of a value for both of these attribute types is Top Secret. Related controls: AC-3, AC-4, AC-6, AC-21, AU-
          2, AU-10, SC-16, MP-3.

               For example, the organization:
               a. Provides the means to associate [Classification level; accesses; and handling caveat]
               having [Unclassified, Confidential, Secret, Top Secret; Apples, Oranges; HVSACO,
               FOUO, NOFORN, etc.] with information in storage, in process, and/or in transmission;
               b. Ensures that the security attribute associations are made and retained with the information;
               c. Establishes the permitted [Classification level; accesses; and handling caveat] for [e.g.,
               Apples Network, FMDR LAN]; and
               d. Determines the permitted [e.g., user cannot select Apples if user selected Unclassified]
               for each of the established security attributes.
               For bullets (c) and (d) above, reference DoDM 5200.01 Volume 3, DoD Information Security
               Program: Protection of Classified Information, Enclosure 7, Section 17.
               Example implementation for a system where all users are formally accessed to all
               information: a) attributes (clearance, access, PII, etc.) are identified in the headers/footers,
               paragraph markings, or in the filename; b) files are saved with these attributes; c) and d) see
               organization-defined values in example (c and d) above.
          Control Enhancements:
          (1)    SECURITY ATTRIBUTES | DYNAMIC ATTRIBUTE ASSOCIATION
                 The information system dynamically associates security attributes with [Assignment: organization-defined subjects
                 and objects] in accordance with [Assignment: organization-defined security policies] as information is created and
                 combined.
                 Supplemental Guidance: Dynamic association of security attributes is appropriate whenever the security
                 characteristics of information changes over time. Security attributes may change, for example, due to
                 information aggregation issues (i.e., the security characteristics of individual information elements are
                 different from the combined elements), changes in individual access authorizations (i.e., privileges),
                 and changes in the security category of information. Related control: AC-4.
          (2)    SECURITY ATTRIBUTES | ATTRIBUTE VALUE CHANGES BY AUTHORIZED INDIVIDUALS
                 The information system provides authorized individuals (or processes acting on behalf of individuals) the capability to
                 define or change the value of associated security attributes.
                 Supplemental Guidance: The content or assigned values of security attributes can directly affect the
                 ability of individuals to access organizational information. Therefore, it is important for information
                 systems to be able to limit the ability to create or modify security attributes to authorized individuals.
                 Related controls: AC-6, AU-2.
          (3)    SECURITY ATTRIBUTES | MAINTENANCE OF ATTRIBUTE ASSOCIATIONS BY INFORMATION SYSTEM
                 The information system maintains the association and integrity of [Assignment: organization-defined security
                 attributes] to [Assignment: organization-defined subjects and objects].
                 Supplemental Guidance: Maintaining the association and integrity of security attributes to subjects and
                 objects with sufficient assurance helps to ensure that the attribute associations can be used as the basis
                 of automated policy actions. Automated policy actions include, for example, access control decisions
                 or information flow control decisions.
          (4)    SECURITY ATTRIBUTES | ASSOCIATION OF ATTRIBUTES BY AUTHORIZED INDIVIDUALS
                 The information system supports the association of [Assignment: organization-defined security attributes] with
                 [Assignment: organization-defined subjects and objects] by authorized individuals (or processes acting on behalf of
                 individuals).
                 Supplemental Guidance: The support provided by information systems can vary to include: (i) prompting
                 users to select specific security attributes to be associated with specific information objects; (ii)
                 employing automated mechanisms for categorizing information with appropriate attributes based on
                 defined policies; or (iii) ensuring that the combination of selected security attributes selected is valid.

                Organizations consider the creation, deletion, or modification of security attributes when defining
                auditable events.
          (5)   SECURITY ATTRIBUTES | ATTRIBUTE DISPLAYS FOR OUTPUT DEVICES
                The information system displays security attributes in human-readable form on each object that the system transmits
                to output devices to identify [Assignment: organization-identified special dissemination, handling, or distribution
                instructions] using [Assignment: organization-identified human-readable, standard naming conventions].
                Supplemental Guidance: Information system outputs include, for example, pages, screens, or equivalent.
                Information system output devices include, for example, printers and video displays on computer
                workstations, notebook computers, and personal digital assistants.
          (6)   SECURITY ATTRIBUTES | MAINTENANCE OF ATTRIBUTE ASSOCIATION BY ORGANIZATION
                The organization allows personnel to associate, and maintain the association of [Assignment: organization-defined
                security attributes] with [Assignment: organization-defined subjects and objects] in accordance with [Assignment:
                organization-defined security policies].
                Supplemental Guidance: This control enhancement requires individual users (as opposed to the
                information system) to maintain associations of security attributes with subjects and objects.
                 For example, The organization allows the user to select and manage the appropriate
                 classification, access, handling caveats for files (e.g., document, email, image, folder)
                 they create in accordance with SCG or locally defined security policies.

          (7)   SECURITY ATTRIBUTES | CONSISTENT ATTRIBUTE INTERPRETATION
                The organization provides a consistent interpretation of security attributes transmitted between distributed
                information system components.
                Supplemental Guidance: In order to enforce security policies across multiple components in distributed
                information systems (e.g., distributed database management systems, cloud-based systems, and
                service-oriented architectures), organizations provide a consistent interpretation of security attributes
                that are used in access enforcement and flow enforcement decisions. Organizations establish
                agreements and processes to ensure that all distributed information system components implement
                security attributes with consistent interpretations in automated access/flow enforcement actions.
          (8)   SECURITY ATTRIBUTES | ASSOCIATION TECHNIQUES / TECHNOLOGIES
                The information system implements [Assignment: organization-defined techniques or technologies] with [Assignment:
                organization-defined level of assurance] in associating security attributes to information.
                Supplemental Guidance: The association (i.e., binding) of security attributes to information within
                information systems is of significant importance with regard to conducting automated access
                enforcement and flow enforcement actions. The association of such security attributes can be
                accomplished with technologies/techniques providing different levels of assurance. For example,
                information systems can cryptographically bind security attributes to information using digital
                signatures with the supporting cryptographic keys protected by hardware devices (sometimes known as
                hardware roots of trust).
          (9)   SECURITY ATTRIBUTES | ATTRIBUTE REASSIGNMENT
                The organization ensures that security attributes associated with information are reassigned only via re-grading
                mechanisms validated using [Assignment: organization-defined techniques or procedures].
                Supplemental Guidance: Validated re-grading mechanisms are employed by organizations to provide the
                requisite levels of assurance for security attribute reassignment activities. The validation is facilitated
                by ensuring that re-grading mechanisms are single purpose and of limited function. Since security
                attribute reassignments can affect security policy enforcement actions (e.g., access/flow enforcement
                decisions), using trustworthy re-grading mechanisms is necessary to ensure that such mechanisms
                perform in a consistent/correct mode of operation.
          (10) SECURITY ATTRIBUTES | ATTRIBUTE CONFIGURATION BY AUTHORIZED INDIVIDUALS
                The information system provides authorized individuals the capability to define or change the type and value of
                security attributes available for association with subjects and objects.
                Supplemental Guidance: The content or assigned values of security attributes can directly affect the
                ability of individuals to access organizational information. Therefore, it is important for information

                 systems to be able to limit the ability to create or modify security attributes to authorized individuals
                 only.
          References: None.

AC-17     REMOTE ACCESS

          Control: The organization:

          a.     Establishes and documents usage restrictions, configuration/connection requirements, and
                 implementation guidance for each type of remote access allowed; and
          b.     Authorizes remote access to the information system prior to allowing such connections.
          Supplemental Guidance: Remote access is access to organizational information systems by users (or
          processes acting on behalf of users) communicating through external networks (e.g., the Internet). Remote
          access methods include, for example, dial-up, broadband, and wireless. Organizations often employ
          encrypted virtual private networks (VPNs) to enhance confidentiality and integrity over remote
          connections. The use of encrypted VPNs does not make the access non-remote; however, the use of VPNs,
          when adequately provisioned with appropriate security controls (e.g., employing appropriate encryption
          techniques for confidentiality and integrity protection) may provide sufficient assurance to the organization
          that it can effectively treat such connections as internal networks. Still, VPN connections traverse external
          networks, and the encrypted VPN does not enhance the availability of remote connections. Also, VPNs
          with encrypted tunnels can affect the organizational capability to adequately monitor network
          communications traffic for malicious code. Remote access controls apply to information systems other than
          public web servers or systems designed for public access. This control addresses authorization prior to
          allowing remote access without specifying the formats for such authorization. While organizations may use
          interconnection security agreements to authorize remote access connections, such agreements are not
          required by this control. Enforcing access restrictions for remote connections is addressed in AC-3. Related
          controls: AC-2, AC-3, AC-18, AC-19, AC-20, CA-3, CA-7, CM-8, IA-2, IA-3, IA-8, MA-4, PE-17, PL-4,
          SC-10, SI-4.
               In most cases within the SAP Community, access to an extension of an information system at
               an external location is not considered remote access. For the purpose of this control,
               system/network administration within the authorization boundary of the system, regardless of
               physical location, is not considered remote access.
          Control Enhancements:
          (1)    REMOTE ACCESS | AUTOMATED MONITORING / CONTROL
                 The information system monitors and controls remote access methods.
                 Supplemental Guidance: Automated monitoring and control of remote access sessions allows
                 organizations to detect cyber attacks and also ensure ongoing compliance with remote access policies
                 by auditing connection activities of remote users on a variety of information system components (e.g.,
                 servers, workstations, notebook computers, smart phones, and tablets). Related controls: AU-2, AU-12.
                   Additional related control: SI-4.
          (2)    REMOTE ACCESS | PROTECTION OF CONFIDENTIALITY / INTEGRITY USING ENCRYPTION
                 The information system implements cryptographic mechanisms to protect the confidentiality and integrity of remote
                 access sessions.
                 Supplemental Guidance: The encryption strength of mechanism is selected based on the security
                 categorization of the information. Related controls: SC-8, SC-12, SC-13.
          (3)    REMOTE ACCESS | MANAGED ACCESS CONTROL POINTS
                 The information system routes all remote accesses through [Assignment: organization-defined number] managed
                 network access control points.
                 Supplemental Guidance: Limiting the number of access control points for remote accesses reduces the
                 attack surface for organizations. Organizations consider the Trusted Internet Connections (TIC)
                 initiative requirements for external network connections. Related control: SC-7.

          (4)     REMOTE ACCESS | PRIVILEGED COMMANDS / ACCESS
                  The organization:
                  a.   Authorizes the execution of privileged commands and access to security-relevant information via remote access
                       only for [Assignment: organization-defined needs]; and
                  b.   Documents the rationale for such access in the security plan for the information system.
                  Supplemental Guidance: Related control: AC-6.
          (5)     REMOTE ACCESS | MONITORING FOR UNAUTHORIZED CONNECTIONS
                  [Withdrawn: Incorporated into SI-4].
          (6)     REMOTE ACCESS | PROTECTION OF INFORMATION
                  The organization ensures that users protect information about remote access mechanisms from unauthorized use
                  and disclosure.
                  Supplemental Guidance: Related controls: AT-2, AT-3, PS-6.
          (7)     REMOTE ACCESS | ADDITIONAL PROTECTION FOR SECURITY FUNCTION ACCESS
                  [Withdrawn: Incorporated into AC-3 (10)].
          (8)     REMOTE ACCESS | DISABLE NONSECURE NETWORK PROTOCOLS
                  [Withdrawn: Incorporated into CM-7].
          (9)     REMOTE ACCESS | DISCONNECT / DISABLE ACCESS
                  The organization provides the capability to expeditiously disconnect or disable remote access to the information
                  system within 30 minutes of identification of an event or inactivity for low confidentiality or integrity impact;
                  20 minutes for moderate confidentiality or integrity impact; or 10 minutes for high confidentiality or integrity
                  impact.
                  Supplemental Guidance: This control enhancement requires organizations to have the capability to
                  rapidly disconnect current users remotely accessing the information system and/or disable further
                  remote access. The speed of disconnect or disablement varies based on the criticality of
                  missions/business functions and the need to eliminate immediate or future remote access to
                  organizational information systems.
                   Termination of the session or connection shall be verified.
          References: NIST Special Publications 800-46, 800-77, 800-113, 800-114, 800-121.

AC-18     WIRELESS ACCESS

          Control: The organization:

          a.      Establishes usage restrictions, configuration/connection requirements, and implementation guidance
                  for wireless access; and
          b.      Authorizes wireless access to the information system prior to allowing such connections.
          Supplemental Guidance: Wireless technologies include, for example, microwave, packet radio (UHF/VHF),
          802.11x, and Bluetooth. Wireless networks use authentication protocols (e.g., EAP/TLS, PEAP), which
          provide credential protection and mutual authentication. Related controls: AC-2, AC-3, AC-17, AC-19,
          CA-3, CA-7, CM-8, IA-2, IA-3, IA-8, PL-4, SI-4.
               If no wireless is authorized in the facility, this control still applies. For example: wireless is
               prohibited and implementation guidance should include that users are instructed/reminded
               during initial and annual refresher training that wireless access and wireless devices are
               prohibited [AC-18.a].
               In certain situations, wireless signals may radiate beyond the confines and control of
               organization-controlled facilities. As a result, wireless technologies are generally prohibited
               from use in SAP facilities. Exceptions may include wireless devices without memory that
               convey no meaningful data (e.g., personal wearable devices, remote control devices for
               audio/visual presentations and IR and Bluetooth mice). Any exceptions shall be documented
               and approved by the AO and cognizant PSO [AC-18.b] to include limiting wireless

               capabilities within the facility boundary. Such exceptions could also warrant Certified
               TEMPEST Technical Authority (CTTA) evaluation. CTTA involvement will be at the
               discretion of the AO.
               The risks associated with personally-owned wireless technologies used in medical devices
               must also be assessed. The ISSM/ISSO will work in concert with the PSO/GSSO/CPSO, as
               appropriate, to allow necessary medical devices to the greatest extent possible, yet within the
               acceptable risk envelope as determined by the AO in coordination with the Information
               System Owner. Legal Counsel must be contacted prior to non-approval of any medical
               device. See organizational/component PED policy for additional detail.
          Control Enhancements:
          (1)    WIRELESS ACCESS | AUTHENTICATION AND ENCRYPTION
                 The information system protects wireless access to the system using authentication of both users and devices as
                 appropriate; e.g., devices to wireless networks (e.g., Wi-Fi) and users to enterprise services and encryption.
                 Supplemental Guidance: Related controls: SC-8, SC-13.
          (2)    WIRELESS ACCESS | MONITORING UNAUTHORIZED CONNECTIONS
                 [Withdrawn: Incorporated into SI-4].
          (3)    WIRELESS ACCESS | DISABLE WIRELESS NETWORKING
                 The organization disables, when not intended for use, wireless networking capabilities internally embedded within
                 information system components prior to issuance and deployment.
                   Document and ensure wireless is disabled or removed from devices entering the facility,
                   e.g., televisions, portable electronic devices, printers.
                 Supplemental Guidance: Related control: AC-19.
          (4)    WIRELESS ACCESS | RESTRICT CONFIGURATIONS BY USERS
                 The organization identifies and explicitly authorizes users allowed to independently configure wireless networking
                 capabilities.
                 Supplemental Guidance: Organizational authorizations to allow selected users to configure wireless
                 networking capability are enforced in part, by the access enforcement mechanisms employed within
                 organizational information systems. Related controls: AC-3, SC-15.
          (5)    WIRELESS ACCESS | ANTENNAS / TRANSMISSION POWER LEVELS
                 The organization selects radio antennas and calibrates transmission power levels to reduce the probability that
                 usable signals can be received outside of organization-controlled boundaries.
                 Supplemental Guidance: Actions that may be taken by organizations to limit unauthorized use of
                 wireless communications outside of organization-controlled boundaries include, for example: (i)
                 reducing the power of wireless transmissions so that the transmissions are less likely to emit a signal
                 that can be used by adversaries outside of the physical perimeters of organizations; (ii) employing
                 measures such as TEMPEST to control wireless emanations; and (iii) using directional/beam forming
                 antennas that reduce the likelihood that unintended receivers will be able to intercept signals. Prior to
                 taking such actions, organizations can conduct periodic wireless surveys to understand the radio
                 frequency profile of organizational information systems as well as other systems that may be operating
                 in the area. Related control: PE-19.
          References: NIST Special Publications 800-48, 800-94, 800-97.

AC-19     ACCESS CONTROL FOR MOBILE DEVICES

          Control: The organization:

          a.     Establishes usage restrictions, configuration requirements, connection requirements, and
                 implementation guidance for organization-controlled mobile devices; and
          b.     Authorizes the connection of mobile devices to organizational information systems.

          Supplemental Guidance: A mobile device is a computing device that: (i) has a small form factor such that it
          can easily be carried by a single individual; (ii) is designed to operate without a physical connection (e.g.,
          wirelessly transmit or receive information); (iii) possesses local, non-removable or removable data storage;
          and (iv) includes a self-contained power source. Mobile devices may also include voice communication
          capabilities, on-board sensors that allow the device to capture information, and/or built-in features for
          synchronizing local data with remote locations. Examples include smart phones, E-readers, and tablets.
          Mobile devices are typically associated with a single individual and the device is usually in close proximity
          to the individual; however, the degree of proximity can vary depending upon on the form factor and size of
          the device. The processing, storage, and transmission capability of the mobile device may be comparable to
          or merely a subset of desktop systems, depending upon the nature and intended purpose of the device. Due
          to the large variety of mobile devices with different technical characteristics and capabilities, organizational
          restrictions may vary for the different classes/types of such devices. Usage restrictions and specific
          implementation guidance for mobile devices include, for example, configuration management, device
          identification and authentication, implementation of mandatory protective software (e.g., malicious code
          detection, firewall), scanning devices for malicious code, updating virus protection software, scanning for
          critical software updates and patches, conducting primary operating system (and possibly other resident
          software) integrity checks, and disabling unnecessary hardware (e.g., wireless, infrared). Organizations are
          cautioned that the need to provide adequate security for mobile devices goes beyond the requirements in
          this control. Many safeguards and countermeasures for mobile devices are reflected in other security
          controls in the catalog allocated in the initial control baselines as starting points for the development of
          security plans and overlays using the tailoring process. There may also be some degree of overlap in the
          requirements articulated by the security controls within the different families of controls. AC-20 addresses
          mobile devices that are not organization-controlled. Related controls: AC-3, AC-7, AC-18, AC-20, CA-9,
          CM-2, IA-2, IA-3, MP-2, MP-4, MP-5, PL-4, SC-7, SC-43, SI-3, SI-4.
               Mobile devices include portable computing and communications devices with information
               storage capability (e.g., notebook computers, personal digital assistants, cellular telephones,
               digital cameras, and audio recording devices, also referred to as PEDs. A PED is any easily
               transportable, personally-owned or government/contractor-issued, electronic device that has
               the capability to record, copy, store, and/or transmit data, digital images, video, and/or audio.
               Examples of a PED include, but are not limited to, pagers, laptop computers, cellular
               telephones, radios (amplitude modulation (AM)/frequency modulation (FM), satellite),
               compact discs players, cassette players and recorders, PDA (e.g., palmtops, BlackBerrys,
               iPads), digital audio devices (e.g., MP3 players, iPods), cameras, camcorders, calculators,
               electronic book readers (e.g., Kindles, Nooks, Neos), digital picture frames, and electronic
               watches with input capability and/or reminder recorders. See also [MP-4] and [MP-5]
               Policy and procedures related to PEDs are detailed in DoDM 5205.07-V3, Enclosure 3,
               Section 11, to include a list of authorized PEDs, requirement for PSO and AO (or designee)
               approval, as required, prior to introduction into a SAPF, and guidance for control of PEDs.
               See the Media Protection (MP) section, for policy and procedures related to removable
               storage media.
               Reference the MP section for media control including PED removable media.
               Purchase of government PEDs shall conform to the same policies and procedures as all other
               IT equipment. See the System and Services Acquisition (SA) section for additional
               information on mobile devices.
               PEDs for Classified Use
               PEDs authorized for classified use represent a special class of government-owned mobile
               devices authorized with mission justification for its use. The PSO assigns responsibilities for
               the use of these PEDs with SAP information - and establishes procedures to control their use
               and accountability to ensure SAP information is protected from unauthorized disclosure.

          Control Enhancements:
          (1)   ACCESS CONTROL FOR MOBILE DEVICES | USE OF WRITABLE / PORTABLE STORAGE DEVICES
                [Withdrawn: Incorporated into MP-7].
          (2)   ACCESS CONTROL FOR MOBILE DEVICES | USE OF PERSONALLY OWNED PORTABLE STORAGE DEVICES
                [Withdrawn: Incorporated into MP-7].
          (3)   ACCESS CONTROL FOR MOBILE DEVICES | USE OF PORTABLE STORAGE DEVICES WITH NO IDENTIFIABLE OWNER
                [Withdrawn: Incorporated into MP-7].
          (4)   ACCESS CONTROL FOR MOBILE DEVICES | RESTRICTIONS FOR CLASSIFIED INFORMATION
                The organization:
                (a)   Prohibits the use of unclassified mobile devices in facilities containing information systems processing, storing,
                      or transmitting classified information unless specifically permitted by the authorizing official; and
                (b) Enforces the following restrictions on individuals permitted by the authorizing official to use unclassified mobile
                    devices in facilities containing information systems processing, storing, or transmitting classified information:
                      (1)   Connection of unclassified mobile devices to classified information systems is prohibited;
                      (2)   Connection of unclassified mobile devices to unclassified information systems requires approval from the
                            authorizing official;
                      (3)   Use of internal or external modems or wireless interfaces within the unclassified mobile devices is
                            prohibited; and
                      (4)   Unclassified mobile devices and the information stored on those devices are subject to random reviews
                            and inspections by ISSM / PSO, and if classified information is found, the incident handling policy is
                            followed.
                (c)   Restricts the connection of classified mobile devices to classified information systems in accordance with
                      [Assignment: organization-defined security policies].
                Supplemental Guidance: Related controls: CA-6, IR-4.
          (5)   ACCESS CONTROL FOR MOBILE DEVICES | FULL DEVICE / CONTAINER-BASED ENCRYPTION
                The organization employs [Selection: full-device encryption; container encryption] to protect the confidentiality and
                integrity of information on all mobile devices.
                Supplemental Guidance: Container-based encryption provides a more fine-grained approach to the
                encryption of data/information on mobile devices, including for example, encrypting selected data
                structures such as files, records, or fields. Related controls: MP-5, SC-13, SC-28.
                 PEDs that contain classified or controlled unclassified information (CUI) information
                 must be encrypted with a National Security Agency (NSA) or DoD-approved encryption
                 standard.
          References: OMB Memorandum 06-16; NIST Special Publications 800-114, 800-124, 800-164.

AC-20     USE OF EXTERNAL INFORMATION SYSTEMS

          Control: The organization establishes terms and conditions, consistent with any trust relationships
          established with other organizations owning, operating, and/or maintaining external information systems,
          allowing authorized individuals to:
          a.    Access the information system from external information systems; and
          b.    Process, store, or transmit organization-controlled information using external information systems.
          Supplemental Guidance: External information systems are information systems or components of information
          systems that are outside of the authorization boundary established by organizations and for which
          organizations typically have no direct supervision and authority over the application of required security
          controls or the assessment of control effectiveness. External information systems include, for example: (i)
          personally owned information systems/devices (e.g., notebook computers, smart phones, tablets, personal
          digital assistants); (ii) privately owned computing and communications devices resident in commercial or
          public facilities (e.g., hotels, train stations, convention centers, shopping malls, or airports); (iii)
          information systems owned or controlled by nonfederal governmental organizations; and (iv) federal

          information systems that are not owned by, operated by, or under the direct supervision and authority of
          organizations. This control also addresses the use of external information systems for the processing,
          storage, or transmission of organizational information, including, for example, accessing cloud services
          (e.g., infrastructure as a service, platform as a service, or software as a service) from organizational
          information systems.
          For some external information systems (i.e., information systems operated by other federal agencies,
          including organizations subordinate to those agencies), the trust relationships that have been established
          between those organizations and the originating organization may be such, that no explicit terms and
          conditions are required. Information systems within these organizations would not be considered external.
          These situations occur when, for example, there are pre-existing sharing/trust agreements (either implicit or
          explicit) established between federal agencies or organizations subordinate to those agencies, or when such
          trust agreements are specified by applicable laws, Executive Orders, directives, or policies. Authorized
          individuals include, for example, organizational personnel, contractors, or other individuals with authorized
          access to organizational information systems and over which organizations have the authority to impose
          rules of behavior with regard to system access. Restrictions that organizations impose on authorized
          individuals need not be uniform, as those restrictions may vary depending upon the trust relationships
          between organizations. Therefore, organizations may choose to impose different security restrictions on
          contractors than on state, local, or tribal governments.
          This control does not apply to the use of external information systems to access public interfaces to
          organizational information systems (e.g., individuals accessing federal information through www.usa.gov).
          Organizations establish terms and conditions for the use of external information systems in accordance with
          organizational security policies and procedures. Terms and conditions address as a minimum: types of
          applications that can be accessed on organizational information systems from external information systems;
          and the highest security category of information that can be processed, stored, or transmitted on external
          information systems. If terms and conditions with the owners of external information systems cannot be
          established, organizations may impose restrictions on organizational personnel using those external
          systems. Related controls: AC-3, AC-17, AC-19, CA-3, PL-4, SA-9.
               An external information system may be a standalone or an interconnected system/service.
               Providers of external information systems should provide the PSO/ISSM with an external
               information system memorandum of understanding (MOU) (e.g., no exchange of resources),
               or memorandum of agreement (e.g., exchange of resources such as personnel, services,
               funds), as well as SOP and ATO or approval letter. An external information system
               MOU/MOA includes information such as the ATO date if applicable, technical concerns
               (e.g., wireless (Bluetooth, etc.), cameras are turned off, microphones are disabled), resources
               required (e.g., personnel), and additional system information as required (e.g., classified vs.
               corporate system). Ensure a co-utilization agreement (CUA) is in place for the facility, if
               applicable.
               In those cases where the external system connects to the SAP system, ensure an approved
               connection agreement is in place with the organization hosting the external information
               system. This may be accomplished via the establishment of an approved ISA or MOA. [AC-
               20(1)(a)]
               For SAP Support Systems (e.g., card readers, alarm systems) reference PE-2 guidance.
               Prior to allowing corporate unclassified systems in the SAPF, the CPSO and ISSM/ISSO in
               coordination with corporate IT ensures endpoint security is appropriately
               hardened/configured, e.g., wireless and microphones are disabled prior to the PSO approving
               entry to the SAPF.
          Control Enhancements:
          (1)    USE OF EXTERNAL INFORMATION SYSTEMS | LIMITS ON AUTHORIZED USE
                 The organization permits authorized individuals to use an external information system to access the information
                 system or to process, store, or transmit organization-controlled information only when the organization:

                (a)   Verifies the implementation of required security controls on the external system as specified in the
                      organization’s information security policy and security plan; or
                (b) Retains approved information system connection or processing agreements with the organizational entity
                    hosting the external information system.
                Supplemental Guidance: This control enhancement recognizes that there are circumstances where
                individuals using external information systems (e.g., contractors, coalition partners) need to access
                organizational information systems. In those situations, organizations need confidence that the external
                information systems contain the necessary security safeguards (i.e., security controls), so as not to
                compromise, damage, or otherwise harm organizational information systems. Verification that the
                required security controls have been implemented can be achieved, for example, by third-party,
                independent assessments, attestations, or other means, depending on the confidence level required by
                organizations. Related control: CA-2.
          (2)   USE OF EXTERNAL INFORMATION SYSTEMS | PORTABLE STORAGE DEVICES
                The organization [Selection: restricts; prohibits] the use of organization-controlled portable storage devices by
                authorized individuals on external information systems.
                Supplemental Guidance: Limits on the use of organization-controlled portable storage devices in external
                information systems include, for example, complete prohibition of the use of such devices or
                restrictions on how the devices may be used and under what conditions the devices may be used.
          (3)   USE OF EXTERNAL INFORMATION SYSTEMS | NON-ORGANIZATIONALLY OWNED SYSTEMS / COMPONENTS / DEVICES
                The organization [Selection: restricts; prohibits] the use of non-organizationally owned information systems, system
                components, or devices to process, store, or transmit organizational information.
                Supplemental Guidance: Non-organizationally owned devices include devices owned by other
                organizations (e.g., federal/state agencies, contractors) and personally owned devices. There are risks
                to using non-organizationally owned devices. In some cases, the risk is sufficiently high as to prohibit
                such use. In other cases, it may be such that the use of non-organizationally owned devices is allowed
                but restricted in some way. Restrictions include, for example: (i) requiring the implementation of
                organization-approved security controls prior to authorizing such connections; (ii) limiting access to
                certain types of information, services, or applications; (iii) using virtualization techniques to limit
                processing and storage activities to servers or other system components provisioned by the
                organization; and (iv) agreeing to terms and conditions for usage. For personally owned devices,
                organizations consult with the Office of the General Counsel regarding legal issues associated with
                using such devices in operational environments, including, for example, requirements for conducting
                forensic analyses during investigations after an incident.
          (4)   USE OF EXTERNAL INFORMATION SYSTEMS | NETWORK ACCESSIBLE STORAGE DEVICES
                The organization prohibits the use of [Assignment: organization-defined network accessible storage devices] in
                external information systems.
                Supplemental Guidance: Network accessible storage devices in external information systems include, for
                example, online storage devices in public, hybrid, or community cloud-based systems.
          References: FIPS Publication 199.

AC-21     INFORMATION SHARING

          Control: The organization:

          a.    Facilitates information sharing by enabling authorized users to determine whether access
                authorizations assigned to the sharing partner match the access restrictions on the information for
                [Assignment: organization-defined information sharing circumstances where user discretion is
                required]; and
          b.    Employs [Assignment: organization-defined automated mechanisms or manual processes] to assist
                users in making information sharing/collaboration decisions.
          Supplemental Guidance: This control applies to information that may be restricted in some manner (e.g.,
          privileged medical information, contract-sensitive information, proprietary information, personally
          identifiable information, classified information related to special access programs or compartments) based
          on some formal or administrative determination. Depending on the particular information-sharing

          circumstances, sharing partners may be defined at the individual, group, or organizational level.
          Information may be defined by content, type, security category, or special access program/compartment.
          Related control: AC-3.
               AC-21 is related to AC-3; additional detail may be provided in AC-21 that addresses
               assisting users in meeting AC-16 requirements, e.g., Access Look-up tool.
               A sharing partner may be an individual or group on the IS, or external to the IS, e.g., sharing
               is being done in a circumstance where the IS cannot enforce appropriate sharing controls,
               e.g., VTCs, phone conversations, and fax transmittals. The organization will use a PSO-
               approved mechanism to ensure informed security decisions are made, preventing inadvertent
               disclosures. For example, the organization provides either a tool (e.g., Access Look-up, Joint
               Access Database Environment (JADE)) or appropriate guidance on a manual process (e.g.,
               contact PSO, HR) to assist the user in making an informed decision prior to sharing
               information.
          Control Enhancements:
          (1)    INFORMATION SHARING | AUTOMATED DECISION SUPPORT
                 The information system enforces information-sharing decisions by authorized users based on access authorizations
                 of sharing partners and access restrictions on information to be shared.
          (2)    INFORMATION SHARING | INFORMATION SEARCH AND RETRIEVAL
                 The information system implements information search and retrieval services that enforce [Assignment: organization-
                 defined information sharing restrictions].

          References: None.

AC-22     PUBLICLY ACCESSIBLE CONTENT

          Control:   The organization:
          a.     Designates individuals authorized to post information onto a publicly accessible information system;
          b.     Trains authorized individuals to ensure that publicly accessible information does not contain nonpublic
                 information;
          c.     Reviews the proposed content of information prior to posting onto the publicly accessible information
                 system to ensure that nonpublic information is not included; and
          d.     Reviews the content on the publicly accessible information system for nonpublic information at least
                 quarterly or as new information is posted and removes such information, if discovered.
          Supplemental Guidance: In accordance with federal laws, Executive Orders, directives, policies, regulations,
          standards, and/or guidance, the general public is not authorized access to nonpublic information (e.g.,
          information protected under the Privacy Act and proprietary information). This control addresses
          information systems that are controlled by the organization and accessible to the general public, typically
          without identification or authentication. The posting of information on non-organization information
          systems is covered by organizational policy. Related controls: AC-3, AC-4, AT-2, AT-3, AU-13.
               From an organizational perspective this is a common control. Typically, this control is
               addressed by a Public Affairs Office or similar entity.
               Information protected under the Privacy Act and vendor proprietary information are
               examples of nonpublic information, as is classified information. The information to be
               posted must be reviewed by the appropriate organizational element (e.g., Special Security
               Office (SSO), Foreign Disclosure Office (FDO), Legal, Public Affairs) prior to being posted
               on the organization’s information system. [AC-22.c] [AC-22.d] Unauthorized information, if
               discovered, shall be removed immediately from the publicly accessible information system
               and reported to the PSO and information owner. Reference IR-6.

          Control Enhancements: None.

          References: None.

AC-23     DATA MINING PROTECTION

          Control: The organization employs [Assignment: organization-defined data mining prevention and
          detection techniques] for [Assignment: organization-defined data storage objects] to adequately detect and
          protect against data mining.
          Supplemental Guidance: Data storage objects include, for example, databases, database records, and database
          fields. Data mining prevention and detection techniques include, for example: (i) limiting the types of
          responses provided to database queries; (ii) limiting the number/frequency of database queries to increase
          the work factor needed to determine the contents of such databases; and (iii) notifying organizational
          personnel when atypical database queries or accesses occur. This control focuses on the protection of
          organizational information from data mining while such information resides in organizational data stores.
          In contrast, AU-13 focuses on monitoring for organizational information that may have been mined or
          otherwise obtained from data stores and is now available as open source information residing on external
          sites, for example, through social networking or social media websites.
          Control Enhancements: None.

          References: None.

AC-24     ACCESS CONTROL DECISIONS

          Control: The organization establishes procedures to ensure [Assignment: organization-defined access
          control decisions] are applied to each access request prior to access enforcement.
          Supplemental Guidance: Access control decisions (also known as authorization decisions) occur when
          authorization information is applied to specific accesses. In contrast, access enforcement occurs when
          information systems enforce access control decisions. While it is very common to have access control
          decisions and access enforcement implemented by the same entity, it is not required and it is not always an
          optimal implementation choice. For some architectures and distributed information systems, different
          entities may perform access control decisions and access enforcement.
          Control Enhancements:
          (1)   ACCESS CONTROL DECISIONS | TRANSMIT ACCESS AUTHORIZATION INFORMATION
                The information system transmits [Assignment: organization-defined access authorization information] using
                [Assignment: organization-defined security safeguards] to [Assignment: organization-defined information systems]
                that enforce access control decisions.
                Supplemental Guidance: In distributed information systems, authorization processes and access control
                decisions may occur in separate parts of the systems. In such instances, authorization information is
                transmitted securely so timely access control decisions can be enforced at the appropriate locations. To
                support the access control decisions, it may be necessary to transmit as part of the access authorization
                information, supporting security attributes. This is due to the fact that in distributed information
                systems, there are various access control decisions that need to be made and different entities (e.g.,
                services) make these decisions in a serial fashion, each requiring some security attributes to make the
                decisions. Protecting access authorization information (i.e., access control decisions) ensures that such
                information cannot be altered, spoofed, or otherwise compromised during transmission.
          (2)   ACCESS CONTROL DECISIONS | NO USER OR PROCESS IDENTITY
                The information system enforces access control decisions based on [Assignment: organization-defined security
                attributes] that do not include the identity of the user or process acting on behalf of the user.
                Supplemental Guidance: In certain situations, it is important that access control decisions can be made
                without information regarding the identity of the users issuing the requests. These are generally
                instances where preserving individual privacy is of paramount importance. In other situations, user
                identification information is simply not needed for access control decisions and, especially in the case

               of distributed information systems, transmitting such information with the needed degree of assurance
               may be very expensive or difficult to accomplish.
          References: None.

AC-25     REFERENCE MONITOR

          Control: The information system implements a reference monitor for [Assignment: organization-defined
          access control policies] that is tamperproof, always invoked, and small enough to be subject to analysis and
          testing, the completeness of which can be assured.
          Supplemental Guidance:   Information is represented internally within information systems using abstractions
          known as data structures. Internal data structures can represent different types of entities, both active and
          passive. Active entities, also known as subjects, are typically associated with individuals, devices, or
          processes acting on behalf of individuals. Passive entities, also known as objects, are typically associated
          with data structures such as records, buffers, tables, files, inter-process pipes, and communications ports.
          Reference monitors typically enforce mandatory access control policies—a type of access control that
          restricts access to objects based on the identity of subjects or groups to which the subjects belong. The
          access controls are mandatory because subjects with certain privileges (i.e., access permissions) are
          restricted from passing those privileges on to any other subjects, either directly or indirectly—that is, the
          information system strictly enforces the access control policy based on the rule set established by the
          policy. The tamperproof property of the reference monitor prevents adversaries from compromising the
          functioning of the mechanism. The always invoked property prevents adversaries from bypassing the
          mechanism and hence violating the security policy. The smallness property helps to ensure the
          completeness in the analysis and testing of the mechanism to detect weaknesses or deficiencies (i.e., latent
          flaws) that would prevent the enforcement of the security policy. Related controls: AC-3, AC-16, SC-3,
          SC-39.
          Control Enhancements: None.

          References: None.
