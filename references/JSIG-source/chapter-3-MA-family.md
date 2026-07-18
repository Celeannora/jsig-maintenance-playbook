# JSIG Chapter 3 Maintenance (MA) Family

Source URL: https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Archived source (used for extraction, direct URL returns HTTP 403): http://web.archive.org/web/20260405054539/https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Extraction note: Verbatim extraction via `pdftotext -layout` against the complete 378-page JSIG PDF (retrieved 2026-07-17 from the Wayback Machine snapshot below, since the direct DCSA URL returns HTTP 403). This supersedes any prior lower-fidelity extraction of this section. Running page headers/footers inserted by the PDF layout have been stripped; no wording has been added, summarized, or altered.

---

FAMILY: MAINTENANCE

MA-1      SYSTEM MAINTENANCE POLICY AND PROCEDURES

          Control: The organization:

          a.     Develops, documents, and disseminates to [Assignment: organization-defined personnel or roles]:
                 1.   A system maintenance policy that addresses purpose, scope, roles, responsibilities, management
                      commitment, coordination among organizational entities, and compliance; and
                 2.   Procedures to facilitate the implementation of the system maintenance policy and associated
                      system maintenance controls; and
          b.     Reviews and updates the current:
                 1.   System maintenance policy at least annually; and
                 2.   System maintenance procedures at least annually.
          Supplemental Guidance: This control addresses the establishment of policy and procedures for the effective
          implementation of selected security controls and control enhancements in the MA family. Policy and
          procedures reflect applicable federal laws, Executive Orders, directives, regulations, policies, standards,
          and guidance. Security program policies and procedures at the organization level may make the need for
          system-specific policies and procedures unnecessary. The policy can be included as part of the general
          information security policy for organizations or conversely, can be represented by multiple policies
          reflecting the complex nature of certain organizations. The procedures can be established for the security
          program in general and for particular information systems, if needed. The organizational risk management
          strategy is a key factor in establishing policy and procedures. Related control: PM-9.
               DoD SAP-specific policy and procedures related to system maintenance are defined in the
               remainder of this section.
          Control Enhancements: None.

          References: NIST Special Publications 800-12, 800-100.

MA-2      CONTROLLED MAINTENANCE

          Control: The organization:

          a.     Schedules, performs, documents, and reviews records of maintenance and repairs on information
                 system components in accordance with manufacturer or vendor specifications and/or organizational
                 requirements;
          b.     Approves and monitors all maintenance activities, whether performed on site or remotely and whether
                 the equipment is serviced on site or removed to another location;
          c.     Requires that [Assignment: organization-defined personnel or roles] explicitly approve the removal of
                 the information system or system components from organizational facilities for off-site maintenance or
                 repairs;
          d.     Sanitizes equipment to remove all information from associated media prior to removal from
                 organizational facilities for off-site maintenance or repairs;
          e.     Checks all potentially impacted security controls to verify that the controls are still functioning
                 properly following maintenance or repair actions; and
          f.     Includes date and time of maintenance, name of the individual performing the maintenance,
                 name of escort (if necessary), a description of the type of maintenance performed, and a list of
                 equipment removed or replaced (including identification numbers, if applicable) in organizational
                 maintenance records.

          Supplemental Guidance: This control addresses the information security aspects of the information system
          maintenance program and applies to all types of maintenance to any system component (including
          applications) conducted by any local or nonlocal entity (e.g., in-contract, warranty, in-house, software
          maintenance agreement). System maintenance also includes those components not directly associated with
          information processing and/or data/information retention such as scanners, copiers, and printers.
          Information necessary for creating effective maintenance records includes, for example: (i) date and time of
          maintenance; (ii) name of individuals or group performing the maintenance; (iii) name of escort, if
          necessary; (iv) a description of the maintenance performed; and (v) information system
          components/equipment removed or replaced (including identification numbers, if applicable). The level of
          detail included in maintenance records can be informed by the security categories of organizational
          information systems. Organizations consider supply chain issues associated with replacement components
          for information systems. Related controls: CM-3, CM-4, MA-4, MP-6, PE-16, SA-12, SI-2.
               IS are particularly vulnerable to security threats during maintenance activities. The level of
               risk is directly associated with the maintenance person’s clearance and access status. A
               maintenance person may be uncleared or may not be cleared to the level of classified
               information contained on the IS. Properly cleared personnel working in the area must
               maintain a high level of security awareness at all times during IS maintenance activities.
               Reference MA-5(1) for escort requirements.
               All maintenance activities should be performed on-site whenever possible. Removal of an IS
               or system components from a facility for maintenance or repairs requires approval
               coordination with the individual responsible for changes to the system, e.g., ISSM/ISSO and
               the individual who approves removal of equipment from the facility, e.g., PSO/GSSO/CPSO.
               [MA-2.c]
               Any maintenance changes that impact the security of the system shall receive a configuration
               management review and documentation update, as appropriate [MA-2.e]. See also [CM-3].

               Organizations shall record all information system repairs and maintenance activity in a
               maintenance log for the life of the IS and retain the log for a minimum of one (1) year after
               equipment decommissioning or disposal.
          Control Enhancements:
          (1)    CONTROLLED MAINTENANCE | RECORD CONTENT
                 [Withdrawn: Incorporated into MA-2].
          (2)    CONTROLLED MAINTENANCE | AUTOMATED MAINTENANCE ACTIVITIES
                 The organization:
                 (a)   Employs automated mechanisms to schedule, conduct, and document maintenance and repairs; and
                 (b) Produces up-to date, accurate, and complete records of all maintenance and repair actions requested,
                     scheduled, in process, and completed.
                 Supplemental Guidance: Related controls: CA-7, MA-3.

          References: None.

MA-3      MAINTENANCE TOOLS

          Control: The organization approves, controls, and monitors information system maintenance tools.

          Supplemental Guidance: This control addresses security-related issues associated with maintenance tools
          used specifically for diagnostic and repair actions on organizational information systems. Maintenance
          tools can include hardware, software, and firmware items. Maintenance tools are potential vehicles for
          transporting malicious code, either intentionally or unintentionally, into a facility and subsequently into
          organizational information systems. Maintenance tools can include, for example, hardware/software
          diagnostic test equipment and hardware/software packet sniffers. This control does not cover
          hardware/software components that may support information system maintenance, yet are a part of the

          system, for example, the software implementing “ping,” “ls,” “ipconfig,” or the hardware and software
          implementing the monitoring port of an Ethernet switch. Related controls: MA-2, MA-5, MP-6.
               Devices with transmit capability (e.g., IR, RF) shall remain outside the facility unless
               explicitly approved by the PSO and AO.
          Control Enhancements:
          (1)    MAINTENANCE TOOLS | INSPECT TOOLS
                 The organization inspects the maintenance tools carried into a facility by maintenance personnel for improper or
                 unauthorized modifications.
                 Supplemental Guidance: If, upon inspection of maintenance tools, organizations determine that the tools
                 have been modified in an improper/unauthorized manner or contain malicious code, the incident is
                 handled consistent with organizational policies and procedures for incident handling. Related control:
                 SI-7.
          (2)    MAINTENANCE TOOLS | INSPECT MEDIA
                 The organization checks media containing diagnostic and test programs for malicious code before the media are
                 used in the information system.
                 Supplemental Guidance: If, upon inspection of media containing maintenance diagnostic and test
                 programs, organizations determine that the media contain malicious code, the incident is handled
                 consistent with organizational incident handling policies and procedures. Related control: SI-3.
          (3)    MAINTENANCE TOOLS | PREVENT UNAUTHORIZED REMOVAL
                 The organization prevents the unauthorized removal of maintenance equipment containing organizational
                 information by:
                 (a)   Verifying that there is no organizational information contained on the equipment;
                 (b) Sanitizing or destroying the equipment;
                 (c)   Retaining the equipment within the facility; or
                 (d) Obtaining an exemption from PSO/GSSO/CPSO and ISSM/ISSO explicitly authorizing removal of the
                     equipment from the facility.
                 Supplemental Guidance: Organizational information includes all information specifically owned by
                 organizations and information provided to organizations in which organizations serve as information
                 stewards.
                   Media without write protection that is brought in for maintenance must remain within the
                   facility and must be stored and controlled at the classification level of the highest IS to
                   which the media was introduced. Prior to entering the facility, maintenance personnel
                   must be advised that they will not be allowed to remove media from the facility. If
                   deviation from this procedure is required under special circumstances, it must be
                   documented locally for review and approval by the PSO/GSSO/CPSO and ISSM/ISSO.
                   Each time the diagnostic test media is introduced into the facility it must undergo
                   stringent integrity checks (e.g., virus scanning, checksum) prior to being used on the IS,
                   and before leaving the facility, the media must be checked to assure that no classified
                   information has been written on it. See also MP-5.
          (4)    MAINTENANCE TOOLS | RESTRICTED TOOL USE
                 The information system restricts the use of maintenance tools to authorized personnel only.
                 Supplemental Guidance: This control enhancement applies to information systems that are used to carry
                 out maintenance functions. Related controls: AC-2, AC-3, AC-5, AC-6.
          References: NIST Special Publication 800-88.

MA-4      NONLOCAL MAINTENANCE

          Control: The organization:

          a.     Approves and monitors nonlocal maintenance and diagnostic activities;

          b.     Allows the use of nonlocal maintenance and diagnostic tools only as consistent with organizational
                 policy and documented in the security plan for the information system;
          c.     Employs strong authenticators in the establishment of nonlocal maintenance and diagnostic sessions;
          d.     Maintains records for nonlocal maintenance and diagnostic activities; and
          e.     Terminates session and network connections when nonlocal maintenance is completed.
          Supplemental Guidance: Nonlocal maintenance and diagnostic activities are those activities conducted by
          individuals communicating through a network, either an external network (e.g., the Internet) or an internal
          network. Local maintenance and diagnostic activities are those activities carried out by individuals
          physically present at the information system or information system component and not communicating
          across a network connection. Authentication techniques used in the establishment of nonlocal maintenance
          and diagnostic sessions reflect the network access requirements in IA-2. Typically, strong authentication
          requires authenticators that are resistant to replay attacks and employ multifactor authentication. Strong
          authenticators include, for example, PKI where certificates are stored on a token protected by a password,
          passphrase, or biometric. Enforcing requirements in MA-4 is accomplished in part by other controls.
          Related controls: AC-2, AC-3, AC-6, AC-17, AU-2, AU-3, IA-2, IA-4, IA-5, IA-8, MA-2, MA-5, MP-6,
          PL-2, SC-7, SC-10, SC-17.
               Non-local maintenance and diagnostic activities are those activities conducted by individuals
               communicating through a network outside of the system’s authorization boundary. Non-
               local includes devices shipped out for repair or online ‘remote’ maintenance.
               Access shall be limited to those components of the information system being serviced.
          Control Enhancements:
          (1)    NONLOCAL MAINTENANCE | AUDITING AND REVIEW
                 The organization:
                 (a)   Audits nonlocal maintenance and diagnostic sessions as defined in the organizations formal audit policy
                       (AU-1); and
                 (b)   Reviews the records of the maintenance and diagnostic sessions.

                 Supplemental Guidance: Related controls: AU-2, AU-6, AU-12.
          (2)    NONLOCAL MAINTENANCE | DOCUMENT NONLOCAL MAINTENANCE
                 The organization documents in the security plan for the information system, the policies and procedures for the
                 establishment and use of nonlocal maintenance and diagnostic connections.
          (3)    NONLOCAL MAINTENANCE | COMPARABLE SECURITY / SANITIZATION
                 The organization:
                 (a)   Requires that nonlocal maintenance and diagnostic services be performed from an information system that
                       implements a security capability comparable to the capability implemented on the system being serviced; or
                 (b)   Removes the component to be serviced from the information system and prior to nonlocal maintenance or
                       diagnostic services, sanitizes the component (with regard to organizational information) before removal from
                       organizational facilities, and after the service is performed, inspects and sanitizes the component (with regard to
                       potentially malicious software) before reconnecting the component to the information system.
                 Supplemental Guidance: Comparable security capability on information systems, diagnostic tools, and
                 equipment providing maintenance services implies that the implemented security controls on those
                 systems, tools, and equipment are at least as comprehensive as the controls on the information system
                 being serviced. Related controls: MA-3, SA-12, SI-3, SI-7.
                   If non-local maintenance is required from a service or organization that does not provide
                   the same level of security required for the IS being maintained, the system must be
                   sanitized (see the Media Protection (MP) section) and placed in a standalone
                   configuration prior to establishment of the remote connection. If the system cannot be
                   sanitized (e.g., due to a system crash), non-local maintenance is not permitted.
          (4)    NONLOCAL MAINTENANCE | AUTHENTICATION / SEPARATION OF MAINTENANCE SESSIONS
                 The organization protects nonlocal maintenance sessions by:

                (a)   Employing [Assignment: organization-defined authenticators that are replay resistant]; and
                (b) Separating the maintenance sessions from other network sessions with the information system by either:
                      (1)   Physically separated communications paths; or
                      (2)   Logically separated communications paths based upon encryption.

                Supplemental Guidance: Related control: SC-13.
          (5)   NONLOCAL MAINTENANCE | APPROVALS AND NOTIFICATIONS
                The organization:
                (a)   Requires the approval of each nonlocal maintenance session by [Assignment: organization-defined personnel
                      or roles]; and
                (b) Notifies [Assignment: organization-defined personnel or roles] of the date and time of planned nonlocal
                    maintenance.
                Supplemental Guidance: Notification may be performed by maintenance personnel. Approval of
                nonlocal maintenance sessions is accomplished by organizational personnel with sufficient information
                security and information system knowledge to determine the appropriateness of the proposed
                maintenance.
          (6)   NONLOCAL MAINTENANCE | CRYPTOGRAPHIC PROTECTION
                The information system implements cryptographic mechanisms to protect the integrity and confidentiality of nonlocal
                maintenance and diagnostic communications.
                Supplemental Guidance: Related controls: SC-8, SC-13.
          (7)   NONLOCAL MAINTENANCE | REMOTE DISCONNECT VERIFICATION
                The information system implements remote disconnect verification at the termination of nonlocal maintenance and
                diagnostic sessions.
                Supplemental Guidance: Remote disconnect verification ensures that remote connections from nonlocal
                maintenance sessions have been terminated and are no longer available for use. Related control: SC-
                13.
          References: FIPS Publications 140-2, 197, 201; NIST Special Publications 800-63, 800-88; CNSS Policy
          15.

MA-5      MAINTENANCE PERSONNEL

          Control: The organization:

          a.    Establishes a process for maintenance personnel authorization and maintains a list of authorized
                maintenance organizations or personnel;
          b.    Ensures that non-escorted personnel performing maintenance on the information system have required
                access authorizations; and
          c.    Designates organizational personnel with required access authorizations and technical competence to
                supervise the maintenance activities of personnel who do not possess the required access
                authorizations.
          Supplemental Guidance: This control applies to individuals performing hardware or software maintenance on
          organizational information systems, while PE-2 addresses physical access for individuals whose
          maintenance duties place them within the physical protection perimeter of the systems (e.g., custodial staff,
          physical plant maintenance personnel). Technical competence of supervising individuals relates to the
          maintenance performed on the information systems while having required access authorizations refers to
          maintenance on and near the systems. Individuals not previously identified as authorized maintenance
          personnel, such as information technology manufacturers, vendors, systems integrators, and consultants,
          may require privileged access to organizational information systems, for example, when required to
          conduct maintenance activities with little or no notice. Based on organizational assessments of risk,
          organizations may issue temporary credentials to these individuals. Temporary credentials may be for one-
          time use or for very limited time periods. Related controls: AC-2, IA-8, MP-2, PE-2, PE-3, PE-4, RA-3.
          Control Enhancements:

          (1)   MAINTENANCE PERSONNEL | INDIVIDUALS WITHOUT APPROPRIATE ACCESS
                The organization:
                (a)   Implements procedures for the use of maintenance personnel that lack appropriate security clearances or are
                      not U.S. citizens, that include the following requirements:
                      (1)   Maintenance personnel who do not have needed access authorizations, clearances, or formal access
                            approvals are escorted and supervised during the performance of maintenance and diagnostic activities on
                            the information system by approved organizational personnel who are fully cleared, have appropriate
                            access authorizations, and are technically qualified;
                      (2)   Prior to initiating maintenance or diagnostic activities by personnel who do not have needed access
                            authorizations, clearances or formal access approvals, all volatile information storage components within
                            the information system are sanitized and all nonvolatile storage media are removed or physically
                            disconnected from the system and secured; and
                (b) Develops and implements alternate security safeguards in the event an information system component cannot
                    be sanitized, removed, or disconnected from the system.
                Supplemental Guidance: This control enhancement denies individuals who lack appropriate security
                clearances (i.e., individuals who do not possess security clearances or possess security clearances at a
                lower level than required) or who are not U.S. citizens, visual and electronic access to any classified
                information, Controlled Unclassified Information (CUI), or any other sensitive information contained
                on organizational information systems. Procedures for the use of maintenance personnel can be
                documented in security plans for the information systems. Related controls: MP-6, PL-2.
                 If appropriately cleared personnel are unavailable to perform maintenance, an uncleared
                 or lower-cleared person may be employed provided a fully cleared, trained, and
                 technically qualified escort monitors and records their activities in a maintenance log.
          (2)   MAINTENANCE PERSONNEL | SECURITY CLEARANCES FOR CLASSIFIED SYSTEMS
                The organization ensures that personnel performing maintenance and diagnostic activities on an information system
                processing, storing, or transmitting classified information possess security clearances and formal access approvals
                for at least the highest classification level and for all compartments of information on the system.
                 Appropriately cleared personnel who perform maintenance or diagnostics on IS do not
                 require an escort. Organizations are responsible for ensuring maintenance personnel are
                 familiar with organizational security procedures to assure the proper security procedures
                 are being followed.
                Supplemental Guidance: Related control: PS-3.
          (3)   MAINTENANCE PERSONNEL | CITIZENSHIP REQUIREMENTS FOR CLASSIFIED SYSTEMS
                The organization ensures that personnel performing maintenance and diagnostic activities on an information system
                processing, storing, or transmitting classified information are U.S. citizens.
                Supplemental Guidance: Related control: PS-3.

                 Outside the U.S., where U.S. citizens are not available to perform maintenance, foreign
                 nationals may be utilized, but only with PSO and AO approval. [MA-5(3)]
          (4)   MAINTENANCE PERSONNEL | FOREIGN NATIONALS
                The organization ensures that:
                (a)   Cleared foreign nationals (i.e., foreign nationals with appropriate security clearances), are used to conduct
                      maintenance and diagnostic activities on classified information systems only when the systems are jointly
                      owned and operated by the United States and foreign allied governments, or owned and operated solely by
                      foreign allied governments; and
                (b) Approvals, consents, and detailed operational conditions regarding the use of foreign nationals to conduct
                    maintenance and diagnostic activities on classified information systems are fully documented within
                    Memoranda of Agreements.
                Supplemental Guidance: Related control: PS-3.
          (5)   MAINTENANCE PERSONNEL | NONSYSTEM-RELATED MAINTENANCE
                The organization ensures that non-escorted personnel performing maintenance activities not directly associated with
                the information system but in the physical proximity of the system, have required access authorizations.

                Supplemental Guidance: Personnel performing maintenance activities in other capacities not directly
                related to the information system include, for example, physical plant personnel and janitorial
                personnel.
          References: None.

MA-6      TIMELY MAINTENANCE

          Control: The organization obtains maintenance support and/or spare parts for [Assignment: organization-
          defined information system components] within [Assignment: organization-defined time period] of failure.
          Supplemental Guidance: Organizations specify the information system components that result in increased
          risk to organizational operations and assets, individuals, other organizations, or the Nation when the
          functionality provided by those components is not operational. Organizational actions to obtain
          maintenance support typically include having appropriate contracts in place. Related controls: CM-8, CP-2,
          CP-7, SA-14, SA-15.
          Control Enhancements:
          (1)   TIMELY MAINTENANCE | PREVENTIVE MAINTENANCE
                The organization performs preventive maintenance on [Assignment: organization-defined information system
                components] at [Assignment: organization-defined time intervals].
                Supplemental Guidance: Preventive maintenance includes proactive care and servicing of organizational
                information systems components for the purpose of maintaining equipment and facilities in satisfactory
                operating condition. Such maintenance provides for the systematic inspection, tests, measurements,
                adjustments, parts replacement, detection, and correction of incipient failures either before they occur
                or before they develop into major defects. The primary goal of preventive maintenance is to
                avoid/mitigate the consequences of equipment failures. Preventive maintenance is designed to preserve
                and restore equipment reliability by replacing worn components before they actually fail. Methods of
                determining what preventive (or other) failure management policies to apply include, for example,
                original equipment manufacturer (OEM) recommendations, statistical failure records, requirements of
                codes, legislation, or regulations within a jurisdiction, expert opinion, maintenance that has already
                been conducted on similar equipment, or measured values and performance indications.
          (2)   TIMELY MAINTENANCE | PREDICTIVE MAINTENANCE
                The organization performs predictive maintenance on [Assignment: organization-defined information system
                components] at [Assignment: organization-defined time intervals].
                Supplemental Guidance: Predictive maintenance, or condition-based maintenance, attempts to evaluate
                the condition of equipment by performing periodic or continuous (online) equipment condition
                monitoring. The goal of predictive maintenance is to perform maintenance at a scheduled point in time
                when the maintenance activity is most cost-effective and before the equipment loses performance
                within a threshold. The predictive component of predictive maintenance stems from the goal of
                predicting the future trend of the equipment's condition. This approach uses principles of statistical
                process control to determine at what point in the future maintenance activities will be appropriate.
                Most predictive maintenance inspections are performed while equipment is in service, thereby
                minimizing disruption of normal system operations. Predictive maintenance can result in substantial
                cost savings and higher system reliability. Predictive maintenance tends to include measurement of the
                item. To evaluate equipment condition, predictive maintenance utilizes nondestructive testing
                technologies such as infrared, acoustic (partial discharge and airborne ultrasonic), corona detection,
                vibration analysis, sound level measurements, oil analysis, and other specific online tests.
          (3)   TIMELY MAINTENANCE | AUTOMATED SUPPORT FOR PREDICTIVE MAINTENANCE
                The organization employs automated mechanisms to transfer predictive maintenance data to a computerized
                maintenance management system.
                Supplemental Guidance: A computerized maintenance management system maintains a computer
                database of information about the maintenance operations of organizations and automates processing
                equipment condition data in order to trigger maintenance planning, execution, and reporting.
          References: None.
