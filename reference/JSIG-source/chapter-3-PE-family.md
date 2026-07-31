# JSIG Chapter 3 Physical and Environmental Protection (PE) Family

Source URL: https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Archived source (used for extraction, direct URL returns HTTP 403): http://web.archive.org/web/20260405054539/https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Extraction note: Verbatim extraction via `pdftotext -layout` against the complete 378-page JSIG PDF (retrieved 2026-07-17 from the Wayback Machine snapshot below, since the direct DCSA URL returns HTTP 403). This supersedes any prior lower-fidelity extraction of this section. Running page headers/footers inserted by the PDF layout have been stripped; no wording has been added, summarized, or altered.

---

FAMILY: PHYSICAL AND ENVIRONMENTAL PROTECTION

 This section comprises the physical and environmental protections for the DoD SAP Community and
 for all information systems under the purview of the CA SAPCOs as they relate to physical and
 environmental protection. Reference also DoDM 5205.07-V3, DoD SAP Security Manual: Physical
 Security Guidance for Special Access Program Facilities (SAPFs), April 23, 2015.
PE-1      PHYSICAL AND ENVIRONMENTAL PROTECTION POLICY AND PROCEDURES

          Control: The organization:

          a.     Develops, documents, and disseminates to all personnel:
                 1.   A physical and environmental protection policy that addresses purpose, scope, roles,
                      responsibilities, management commitment, coordination among organizational entities, and
                      compliance; and
                 2.   Procedures to facilitate the implementation of the physical and environmental protection policy
                      and associated physical and environmental protection controls; and
          b.     Reviews and updates the current:
                 1.   Physical and environmental protection policy at least annually; and
                 2.   Physical and environmental protection procedures at least annually.
          Supplemental Guidance: This control addresses the establishment of policy and procedures for the effective
          implementation of selected security controls and control enhancements in the PE family. Policy and
          procedures reflect applicable federal laws, Executive Orders, directives, regulations, policies, standards,
          and guidance. Security program policies and procedures at the organization level may make the need for
          system-specific policies and procedures unnecessary. The policy can be included as part of the general
          information security policy for organizations or conversely, can be represented by multiple policies
          reflecting the complex nature of certain organizations. The procedures can be established for the security
          program in general and for particular information systems, if needed. The organizational risk management
          strategy is a key factor in establishing policy and procedures. Related control: PM-9.
               DoD SAP-specific policy and procedures related to physical and environmental protection
               are defined in the remainder of this section. All SAPFs must be accredited (and TEMPEST
               certified as necessary) prior to receiving system authorization to operate.
               In facilities invoking OSD Memo: Approval for use of DoD SAPFs and Special Access
               Compartmented Areas (SAPCA) as Special Access Program Working Areas (SAPWA) for
               All DoD SAPs, dated December 10, 2015, security must ensure coordination with the
               ISSM/ISSO on situations where processing non-persistent information must be addressed.
               Address SCADA systems such as HVAC, fire suppression, lights and power distribution, the
               facility manager should work with the provider to mitigate risk to the SAP environment. Big
               voice systems (announcement systems) should be configured as unidirectional, i.e., not also a
               microphone. Ensure these systems are managed to mitigate risk associated with devices in
               use, e.g., disable wireless features and control access to the system/devices. Reference
               DoDM 5205.07-V3 and the appropriate technical specifications.

               Refer to DoDM 5205.07-V3 for additional information on facility accreditation and
               TEMPEST requirements.
          Control Enhancements: None.

          References: NIST Special Publications 800-12, 800-100; OSD SAPWA Memo, dtd 10 Dec 2015

PE-2      PHYSICAL ACCESS AUTHORIZATIONS

          Control: The organization:

          a.     Develops, approves, and maintains a list of individuals with authorized access to the facility where the
                 information system resides;
          b.     Issues authorization credentials for facility access;
          c.     Reviews the access list detailing authorized facility access by individuals at least annually; and
          d.     Removes individuals from the facility access list when access is no longer required.
          Supplemental Guidance: This control applies to organizational employees and visitors. Individuals (e.g.,
          employees, contractors, and others) with permanent physical access authorization credentials are not
          considered visitors. Authorization credentials include, for example, badges, identification cards, and smart
          cards. Organizations determine the strength of authorization credentials needed (including level of forge-
          proof badges, smart cards, or identification cards) consistent with federal standards, policies, and
          procedures. This control only applies to areas within facilities that have not been designated as publicly
          accessible. Related controls: PE-3, PE-4, PS-3.
               Ensure SAP Support Systems are controlled within a SAPF and managed by SAP cleared
               individuals. SAP Support Systems include card/badge creation systems, card reader systems,
               alarm systems, and music sound cover systems. These systems may be addressed in the
               Fixed Facility Checklist (FFC) or Facility SOP.
          Control Enhancements:
          (1)    PHYSICAL ACCESS AUTHORIZATIONS | ACCESS BY POSITION / ROLE
                 The organization authorizes physical access to the facility where the information system resides based on position or
                 role.
                 Supplemental Guidance: Related controls: AC-2, AC-3, AC-6.
          (2)    PHYSICAL ACCESS AUTHORIZATIONS | TWO FORMS OF IDENTIFICATION
                 The organization requires two forms of identification from [Assignment: organization-defined list of acceptable forms
                 of identification] for visitor access to the facility where the information system resides.
                 Supplemental Guidance: Acceptable forms of government photo identification include, for example,
                 passports, Personal Identity Verification (PIV) cards, and drivers’ licenses. In the case of gaining
                 access to facilities using automated mechanisms, organizations may use PIV cards, key cards, PINs,
                 and biometrics. Related controls: IA-2, IA-4, IA-5.
          (3)    PHYSICAL ACCESS AUTHORIZATIONS | RESTRICT UNESCORTED ACCESS
                 The organization restricts unescorted access to the facility where the information system resides to personnel with
                 security clearances and/or formal access approval as defined by the local security policy (i.e., Facility SOP).
                 Supplemental Guidance: Due to the highly sensitive nature of classified information stored within certain
                 facilities, it is important that individuals lacking sufficient security clearances, access approvals, or
                 need to know, be escorted by individuals with appropriate credentials to ensure that such information is
                 not exposed or otherwise compromised. Related controls: PS-2, PS-6.
                  Consider tailoring in PE-5 (2) for an environment where not everyone has formal access
                  to all information to restrict access to printer output. Also consider tailoring in PE-6(2)
                  for multi-system server rooms.
          References: None.

PE-3      PHYSICAL ACCESS CONTROL

          Control: The organization:

          a.     Enforces physical access authorizations at [Assignment: organization-defined entry/exit points to the
                 facility where the information system resides] by;
                 1.   Verifying individual access authorizations before granting access to the facility; and

                 2.   Controlling ingress/egress to the facility using [Selection (one or more): [Assignment:
                      organization-defined physical access control systems/devices]; guards];
          b.     Maintains physical access audit logs for [Assignment: organization-defined entry/exit points];
          c.     Provides [Assignment: organization-defined security safeguards] to control access to areas within the
                 facility officially designated as publicly accessible;
          d.     Escorts visitors and monitors visitor activity [Assignment: organization-defined circumstances
                 requiring visitor escorts and monitoring];
          e.     Secures keys, combinations, and other physical access devices;
          f.     Inventories [Assignment: organization-defined physical access devices] every [Assignment:
                 organization-defined frequency]; and
          g.     Changes combinations and keys when first installed or used and/or when keys are lost, combinations
                 are compromised, or individuals are transferred or terminated.
          Supplemental Guidance: This control applies to organizational employees and visitors. Individuals (e.g.,
          employees, contractors, and others) with permanent physical access authorization credentials are not
          considered visitors. Organizations determine the types of facility guards needed including, for example,
          professional physical security staff or other personnel such as administrative staff or information system
          users. Physical access devices include, for example, keys, locks, combinations, and card readers.
          Safeguards for publicly accessible areas within organizational facilities include, for example, cameras,
          monitoring by guards, and isolating selected information systems and/or system components in secured
          areas. Physical access control systems comply with applicable federal laws, Executive Orders, directives,
          policies, regulations, standards, and guidance. The Federal Identity, Credential, and Access Management
          Program provides implementation guidance for identity, credential, and access management capabilities for
          physical access control systems. Organizations have flexibility in the types of audit logs employed. Audit
          logs can be procedural (e.g., a written log of individuals accessing the facility and when such access
          occurred), automated (e.g., capturing ID provided by a PIV card), or some combination thereof. Physical
          access points can include facility access points, interior access points to information systems and/or
          components requiring supplemental access controls, or both. Components of organizational information
          systems (e.g., workstations, terminals) may be located in areas designated as publicly accessible with
          organizations safeguarding access to such devices. Related controls: AU-2, AU-6, MP-2, MP-4, PE-2, PE-
          4, PE-5, PS-3, RA-3.
               Physical casings include for example, locking computer racks to protect mission critical
               servers, network routers, etc. As an alternative, these devices may be secured in a room (e.g.,
               a server room) with access limited to privileged users.
          Control Enhancements:
          (1)    PHYSICAL ACCESS CONTROL | INFORMATION SYSTEM ACCESS
                 The organization enforces physical access authorizations to the information system in addition to the physical access
                 controls for the facility at [Assignment: organization-defined physical spaces containing one or more components of
                 the information system].
                 Supplemental Guidance: This control enhancement provides additional physical security for those areas
                 within facilities where there is a concentration of information system components (e.g., server rooms,
                 media storage areas, data and communications centers). Related control: PS-2.
          (2)    PHYSICAL ACCESS CONTROL | FACILITY / INFORMATION SYSTEM BOUNDARIES
                 The organization performs security checks [Assignment: organization-defined frequency] at the physical boundary of
                 the facility or information system for unauthorized exfiltration of information or removal of information system
                 components.
                 Supplemental Guidance: Organizations determine the extent, frequency, and/or randomness of security
                 checks to adequately mitigate risk associated with exfiltration. Related controls: AC-4, SC-7.
          (3)    PHYSICAL ACCESS CONTROL | CONTINUOUS GUARDS / ALARMS / MONITORING
                 The organization employs guards and/or alarms to monitor every physical access point to the facility where the
                 information system resides 24 hours per day, 7 days per week.

                 Supplemental Guidance: Related controls: CP-6, CP-7.
          (4)    PHYSICAL ACCESS CONTROL | LOCKABLE CASINGS
                 The organization uses lockable physical casings to protect [Assignment: organization-defined information system
                 components] from unauthorized physical access.
          (5)    PHYSICAL ACCESS CONTROL | TAMPER PROTECTION
                 The organization employs [Assignment: organization-defined security safeguards] to [Selection (one or more): detect;
                 prevent] physical tampering or alteration of [Assignment: organization-defined hardware components] within the
                 information system.
                 Supplemental Guidance: Organizations may implement tamper detection/prevention at selected hardware
                 components or tamper detection at some components and tamper prevention at other components.
                 Tamper detection/prevention activities can employ many types of anti-tamper technologies including,
                 for example, tamper-detection seals and anti-tamper coatings. Anti-tamper programs help to detect
                 hardware alterations through counterfeiting and other supply chain-related risks. Related control: SA-
                 12.
          (6)    PHYSICAL ACCESS CONTROL | FACILITY PENETRATION TESTING
                 The organization employs a penetration testing process that includes [Assignment: organization-defined frequency],
                 unannounced attempts to bypass or circumvent security controls associated with physical access points to the
                 facility.
                 Supplemental Guidance: Related controls: CA-2, CA-7.

          References: FIPS Publication 201; NIST Special Publications 800-73, 800-76, 800-78, 800-116; ICD 704,
          705; DoD Instruction 5200.39; Personal Identity Verification (PIV) in Enterprise Physical Access Control
          System (E-PACS); Web: http://idmanagement.gov, http://fips201ep.cio.gov.

PE-4      ACCESS CONTROL FOR TRANSMISSION MEDIUM

          Control: The organization controls physical access to [Assignment: organization-defined information system
          distribution and transmission lines] within organizational facilities using [Assignment: organization-
          defined security safeguards].
          Supplemental Guidance: Physical security safeguards applied to information system distribution and
          transmission lines help to prevent accidental damage, disruption, and physical tampering. In addition,
          physical safeguards may be necessary to help prevent eavesdropping or in transit modification of
          unencrypted transmissions. Security safeguards to control physical access to system distribution and
          transmission lines include, for example: (i) locked wiring closets; (ii) disconnected or locked spare jacks;
          and/or (iii) protection of cabling by conduit or cable trays. Related controls: MP-2, MP-4, PE-2, PE-3, PE-
          5, SC-7, SC-8.
          Control Enhancements: None.

          References: NSTISSI No. 7003.

PE-5      ACCESS CONTROL FOR OUTPUT DEVICES

          Control: The organization controls physical access to information system output devices to prevent
          unauthorized individuals from obtaining the output.
          Supplemental Guidance: Controlling physical access to output devices includes, for example, placing output
          devices in locked rooms or other secured areas and allowing access to authorized individuals only, and
          placing output devices in locations that can be monitored by organizational personnel. Monitors, printers,
          copiers, scanners, facsimile machines, and audio devices are examples of information system output
          devices. Related controls: PE-2, PE-3, PE-4, PE-18.
               Keyboard/Video/Mouse Switch Usage
               The application of multi-use or keyboard/video/mouse (KVM) switches provides substantial
               benefits, in cost reduction, space utilization, and operations enhancement when properly
               procured, installed, configured, and managed. The introduction and use of these devices in a

               SAP environment, however, presents a moderate degree of risk to classified or sensitive
               information and systems.
               To minimize the risk of inadvertently entering information onto the wrong network, the
               following requirements shall be satisfied when using KVM switches in SAPFs:
                 • KVM switches shall be authorized via approved configuration control processes and be
                   annotated in the appropriate system documentation.
                 • The AO shall approve the connection of any information system to a KVM switch.
                   When connecting a KVM switch to systems/networks with multiple AOs, each AO’s
                   approval shall be obtained prior to installation. Best practice dictates that a KVM
                   switch used across classifications or security boundaries should conform to the
                   National Information Assurance Partnership (NIAP) approved Protection Profiles (PP)
                   for peripheral sharing switches and be identified on the NIAP Product Compliant List
                   (PCL) or the NIAP Validated Products List (VPL). Products that have been moved to
                   the NIAP Archived Products List may continue to be used if already deployed within
                   an organization’s IT infrastructure.
                 • KVM switches shall be installed in facilities approved for operation of the highest
                   classification information system by authorized SAs or maintenance personnel.
                 • USB keyboard/mouse connections must only allow Human Interface Device (HID)
                   type (i.e., manual operation) connections. Systems using KVM switches shall not use
                   keyboards or mice with wireless technology.
                 • Positive and deliberate operator action is required to switch between connected
                   systems; switches that automatically scan and switch between systems are not
                   authorized; hot key switching capability is only authorized when all connected systems
                   operate at the same classification level and accesses. Note: A KVM switch between
                   components of the same system (e.g., between a file server and a mail server) need not
                   be certified unless otherwise indicated by the CTTA.
                 • Systems using KVM switches shall not employ “smart” or memory enhanced/data
                   retaining keyboards, monitors or mice. These types of interfaces provide memory
                   retention that creates a risk of data transfer between systems of different classifications.
                 • Systems joined by multi-position switches shall utilize desktop backgrounds or banner
                   software that display classification banners at the top and bottom. The classification
                   banner will state the overall classification and approved digraphs/trigraphs (or ‘SAR’)
                   for the system in large bold type, and the banner background will be in a solid color
                   that matches the classification (e.g., TS//SCI - yellow, Top Secret - orange, Secret -
                   red, Confidential - blue, Unclassified - green). When systems have a similar
                   classification level (e.g., SECRET and SECRET//NOFORN), but require separation for
                   accessibility, releasability or other constraints, use of unique colors for the different
                   systems is allowed.
                 • Screen lock applications shall display the maximum classification of the system
                   currently logged into and shall require the user to re-authenticate to unlock the screen.
                 • Data of a higher classification shall not be introduced into a system of a lower
                   classification.
                 • The use of switchboxes for print services between classification and compartment
                   levels is prohibited. Switchboxes may be used between the same classification and
                   compartment levels for print services.
                 • Users shall ensure different/unique passwords are used for each system connected

                       through a multi-position switch.
                 • ISSM/ISSO/Supervisors shall ensure user training and compliance to the requirements
                   associated with the introduction and use of multi-position switches.
               Keyboard/Video/Mouse Switch Configuration
               All KVM switch positions, cables, and connectors shall be clearly marked with the
               appropriate classification labels and corresponding color. Refer to Figure 3-2, SF 700 Series
               Labels.
               The ISSM/ISSO is responsible for ensuring consistent port order and identification of all
               KVM switches within the SAPF. Where possible, a blank port shall be used between
               unclassified and classified networks. In addition, if multiple ports are unused, blank ports
               shall be placed between classification levels whenever possible. There is no requirement to
               apply tamper-resistant tape or other physical mechanisms to KVM switches. The following
               order shall be used for all KVM switches within SAPFs:
                   • NIPRNet
                   • S//REL
                   • Secure Internet Protocol Router Network (SIPRNet)
                   • S//SAR
                   • TS Collateral
                   • Coalition SCI
           Control Enhancements:
          (1)    ACCESS CONTROL FOR OUTPUT DEVICES | ACCESS TO OUTPUT BY AUTHORIZED INDIVIDUALS
                 The organization:
                 (a)    Controls physical access to output from [Assignment: organization-defined output devices]; and
                 (b) Ensures that only authorized individuals receive output from the device.
                 Supplemental Guidance: Controlling physical access to selected output devices includes, for example,
                 placing printers, copiers, and facsimile machines in controlled areas with keypad access controls or
                 limiting access to individuals with certain types of badges.
          (2)     ACCESS CONTROL FOR OUTPUT DEVICES | ACCESS TO OUTPUT BY INDIVIDUAL IDENTITY
                 The information system:
                 (a)    Controls physical access to output from [Assignment: organization-defined output devices]; and
                 (b) Links individual identity to receipt of the output from the device.
                 Supplemental Guidance: Controlling physical access to selected output devices includes, for example,
                 installing security functionality on printers, copiers, and facsimile machines that allows organizations
                 to implement authentication (e.g., using a PIN or hardware token) on output devices prior to the release
                 of output to individuals.
                   Implementation of this control for printer outputs is appropriate for environments where
                   formal access of all users is not common.
          (3)    ACCESS CONTROL FOR OUTPUT DEVICES | MARKING OUTPUT DEVICES
                 The organization marks all output devices in facilities containing information systems that that store, process,
                 or transmit classified information indicating the appropriate security marking of the information permitted to be
                 output from the device.
                 Supplemental Guidance: Outputs devices include, for example, printers, monitors, facsimile machines,
                 scanners, copiers, and audio devices. This control enhancement is generally applicable to information
                 system output devices other than mobiles devices.
                   Output devices such as printers and fax machines of differing security classifications

                 should not be placed in close proximity to one another.
                 If Foreign Nationals are located in a SAPF, output devices of US-only systems must be
                 under constant observation by cleared US personnel.
          References: None.

PE-6      MONITORING PHYSICAL ACCESS

          Control: The organization:

          a.    Monitors physical access to the facility where the information system resides to detect and respond to
                physical security incidents;
          b.    Reviews physical access logs at least every 90 days and upon occurrence of [Assignment:
                organization-defined events or potential indications of events]; and
          c.    Coordinates results of reviews and investigations with the organizational incident response capability.
          Supplemental Guidance: Organizational incident response capabilities include investigations of and responses
          to detected physical security incidents. Security incidents include, for example, apparent security violations
          or suspicious physical access activities. Suspicious physical access activities include, for example: (i)
          accesses outside of normal work hours; (ii) repeated accesses to areas not normally accessed; (iii) accesses
          for unusual lengths of time; and (iv) out-of-sequence accesses. Related controls: CA-7, IR-4, IR-8.
          Control Enhancements:
          (1)   MONITORING PHYSICAL ACCESS | INTRUSION ALARMS / SURVEILLANCE EQUIPMENT
                The organization monitors physical intrusion alarms and surveillance equipment.
          (2)   MONITORING PHYSICAL ACCESS | AUTOMATED INTRUSION RECOGNITION / RESPONSES
                The organization employs automated mechanisms to recognize [Assignment: organization-defined classes/types of
                intrusions] and initiate [Assignment: organization-defined response actions].
                Supplemental Guidance: Related control: SI-4.
          (3)   MONITORING PHYSICAL ACCESS | VIDEO SURVEILLANCE
                The organization employs video surveillance of [Assignment: organization-defined operational areas] and retains
                video recordings for at least 90 days if not otherwise defined in formal organizational policy.
                Supplemental Guidance: This control enhancement focuses on recording surveillance video for
                purposes of subsequent review, if circumstances so warrant (e.g., a break-in detected by other means).
                It does not require monitoring surveillance video although organizations may choose to do so. Note
                that there may be legal considerations when performing and retaining video surveillance, especially if
                such surveillance is in a public location.
          (4)   MONITORING PHYSICAL ACCESS | MONITORING PHYSICAL ACCESS TO INFORMATION SYSTEMS
                The organization monitors physical access to the information system in addition to the physical access monitoring of
                the facility as [Assignment: organization-defined physical spaces containing one or more components of the
                information system].
                Supplemental Guidance: This control enhancement provides additional monitoring for those areas within
                facilities where there is a concentration of information system components (e.g., server rooms, media
                storage areas, communications centers). Related controls: PS-2, PS-3.
                 Implementation of this control may be appropriate for a multi-system server room
                 supported by different system or network administrators.
          References: None.

PE-7      VISITOR CONTROL
          [Withdrawn: Incorporated into PE-2 and PE-3].

PE-8      VISITOR ACCESS RECORDS

          Control: The organization:

          a.     Maintains visitor access records to the facility where the information system resides for at least two
                 (2) years; and
          b.     Reviews visitor access records at least every 90 days.
          Supplemental Guidance: Visitor access records include, for example, names and organizations of persons
          visiting, visitor signatures, forms of identification, dates of access, entry and departure times, purposes of
          visits, and names and organizations of persons visited. Visitor access records are not required for publicly
          accessible areas.
               SAPFs follow DoDM 5205.07-V1 guidance for visitor records and the IC Technical
               Specification for ICD/ICS 705 as referenced in DoDM 5205.07-V3, which require a
               minimum retention of two (2) years from date of last entry.
          Control Enhancements:
          (1)    VISITOR ACCESS RECORDS | AUTOMATED RECORDS MAINTENANCE / REVIEW
                 The organization employs automated mechanisms to facilitate the maintenance and review of visitor access records.
          (2)    VISITOR ACCESS RECORDS | PHYSICAL ACCESS RECORDS
                 [Withdrawn: Incorporated into PE-2].

          References: None.

PE-9      POWER EQUIPMENT AND CABLING

          Control: The organization protects power equipment and power cabling for the information system from
          damage and destruction.
          Supplemental Guidance: Organizations determine the types of protection necessary for power equipment and
          cabling employed at different locations both internal and external to organizational facilities and
          environments of operation. This includes, for example, generators and power cabling outside of buildings,
          internal cabling and uninterruptable power sources within an office or data center, and power sources for
          self-contained entities such as vehicles and satellites. Related control: PE-4.
          Control Enhancements:
          (1)    POWER EQUIPMENT AND CABLING | REDUNDANT CABLING
                 The organization employs redundant power cabling paths that are physically separated by [Assignment:
                 organization-defined distance].
                 Supplemental Guidance: Physically separate, redundant power cables help to ensure that power continues
                 to flow in the event one of the cables is cut or otherwise damaged.
          (2)    POWER EQUIPMENT AND CABLING | AUTOMATIC VOLTAGE CONTROLS
                 The organization employs automatic voltage controls for [Assignment: organization-defined critical information
                 system components].

          References: None.

PE-10     EMERGENCY SHUTOFF

          Control: The organization:

          a.     Provides the capability of shutting off power to the information system or individual system
                 components in emergency situations;
          b.     Places emergency shutoff switches or devices in [Assignment: organization-defined location by
                 information system or system component] to facilitate safe and easy access for personnel; and
          c.     Protects emergency power shutoff capability from unauthorized activation.

          Supplemental Guidance: This control applies primarily to facilities containing concentrations of information
          system resources including, for example, data centers, server rooms, and mainframe computer rooms.
          Related control: PE-15.
          Control Enhancements:
          (1)   EMERGENCY SHUTOFF | ACCIDENTAL / UNAUTHORIZED ACTIVATION
                [Withdrawn: Incorporated into PE-10].

          References: None.

PE-11     EMERGENCY POWER

          Control: The organization provides a short-term uninterruptible power supply to facilitate [Selection (one or
          more): an orderly shutdown of the information system; transition of the information system to long-term
          alternate power] in the event of a primary power source loss.
          Supplemental Guidance: Related controls: AT-3, CP-2, CP-7.
          Control Enhancements:
          (1)   EMERGENCY POWER | LONG-TERM ALTERNATE POWER SUPPLY - MINIMAL OPERATIONAL CAPABILITY
                The organization provides a long-term alternate power supply for the information system that is capable of
                maintaining minimally required operational capability in the event of an extended loss of the primary power source.
                Supplemental Guidance: This control enhancement can be satisfied, for example, by the use of a
                secondary commercial power supply or other external power supply. Long-term alternate power
                supplies for the information system can be either manually or automatically activated.
          (2)   EMERGENCY POWER | LONG-TERM ALTERNATE POWER SUPPLY - SELF-CONTAINED
                The organization provides a long-term alternate power supply for the information system that is:
                (a)   Self-contained;
                (b) Not reliant on external power generation; and
                (c)   Capable of maintaining [Selection: minimally required operational capability; full operational capability] in the
                      event of an extended loss of the primary power source.
                Supplemental Guidance: This control enhancement can be satisfied, for example, by the use of one or
                more generators with sufficient capacity to meet the needs of the organization. Long-term alternate
                power supplies for organizational information systems are either manually or automatically activated.
          References: None.

PE-12     EMERGENCY LIGHTING

          Control: The organization employs and maintains automatic emergency lighting for the information system
          that activates in the event of a power outage or disruption and that covers emergency exits and evacuation
          routes within the facility.
          Supplemental Guidance: This control applies primarily to facilities containing concentrations of information
          system resources including, for example, data centers, server rooms, and mainframe computer rooms.
          Related controls: CP-2, CP-7.
          Control Enhancements:
          (1)   EMERGENCY LIGHTING | ESSENTIAL MISSIONS / BUSINESS FUNCTIONS
                The organization provides emergency lighting for all areas within the facility supporting essential missions and
                business functions.

          References: None.

PE-13     FIRE PROTECTION

          Control: The organization employs and maintains fire suppression and detection devices/systems for the
          information system that are supported by an independent energy source.

          Supplemental Guidance: This control applies primarily to facilities containing concentrations of information
          system resources including, for example, data centers, server rooms, and mainframe computer rooms. Fire
          suppression and detection devices/systems include, for example, sprinkler systems, handheld fire
          extinguishers, fixed fire hoses, and smoke detectors.
               Fire detection systems shall not be tied into the facility’s IDS.
          Control Enhancements:
          (1)     FIRE PROTECTION | DETECTION DEVICES / SYSTEMS
                  The organization employs fire detection devices/systems for the information system that activate automatically and
                  notify [Assignment: organization-defined personnel or roles] and [Assignment: organization-defined emergency
                  responders] in the event of a fire.
                  Supplemental Guidance: Organizations can identify specific personnel, roles, and emergency responders
                  in the event that individuals on the notification list must have appropriate access authorizations and/or
                  clearances, for example, to obtain access to facilities where classified operations are taking place or
                  where there are information systems containing classified information.
          (2)     FIRE PROTECTION | SUPPRESSION DEVICES / SYSTEMS
                  The organization employs fire suppression devices/systems for the information system that provide automatic
                  notification of any activation to [Assignment: organization-defined personnel or roles] and [Assignment: organization-
                  defined emergency responders].
                  Supplemental Guidance: Organizations can identify specific personnel, roles, and emergency responders
                  in the event that individuals on the notification list must have appropriate access authorizations and/or
                  clearances, for example, to obtain access to facilities where classified operations are taking place or
                  where there are information systems containing classified information.
          (3)     FIRE PROTECTION | AUTOMATIC FIRE SUPPRESSION
                  The organization employs an automatic fire suppression capability for the information system when the facility is not
                  staffed on a continuous basis.
          (4)     FIRE PROTECTION | INSPECTIONS
                  The organization ensures that the facility undergoes at least annually inspections by authorized and qualified
                  inspectors and resolves identified deficiencies within 60 days.

          References: None.

PE-14     TEMPERATURE AND HUMIDITY CONTROLS

          Control: The organization:

          a.      Maintains temperature and humidity levels within the facility where the information system resides at
                  [Assignment: organization-defined acceptable levels]; and
          b.      Monitors temperature and humidity levels continuously.
          Supplemental Guidance: This control applies primarily to facilities containing concentrations of information
          system resources, for example, data centers, server rooms, and mainframe computer rooms. Related
          control: AT-3.
               Organizations shall ensure that temperature and humidity controls with remote maintenance
               and testing (RMAT) capability are properly configured for use in a SAPF by disabling
               automatic or remote connection capability. When remote connection capability is required
               for central management of the HVAC system, it shall be identified on the FFC and approved
               by the CSA.

          Control Enhancements:
          (1)     TEMPERATURE AND HUMIDITY CONTROLS | AUTOMATIC CONTROLS
                  The organization employs automatic temperature and humidity controls in the facility to prevent fluctuations
                  potentially harmful to the information system.

          (2)     TEMPERATURE AND HUMIDITY CONTROLS | MONITORING WITH ALARMS / NOTIFICATIONS
                  The organization employs temperature and humidity monitoring that provides an alarm or notification of changes
                  potentially harmful to personnel or equipment.

          References: None.

PE-15     WATER DAMAGE PROTECTION

          Control: The organization protects the information system from damage resulting from water leakage by
          providing master shutoff or isolation valves that are accessible, working properly, and known to key
          personnel.
          Supplemental Guidance: This control applies primarily to facilities containing concentrations of information
          system resources including, for example, data centers, server rooms, and mainframe computer rooms.
          Isolation valves can be employed in addition to or in lieu of master shutoff valves to shut off water supplies
          in specific areas of concern, without affecting entire organizations. Related control: AT-3.
          Control Enhancements:
          (1)     WATER DAMAGE PROTECTION | AUTOMATION SUPPORT
                  The organization employs automated mechanisms to detect the presence of water in the vicinity of the information
                  system and alerts [Assignment: organization-defined personnel or roles].
                  Supplemental Guidance: Automated mechanisms can include, for example, water detection sensors,
                  alarms, and notification systems.
          References: None.

PE-16     DELIVERY AND REMOVAL

          Control: The organization authorizes, monitors, and controls all information system components entering
          and exiting the facility and maintains records of those items.
          Supplemental Guidance: Effectively enforcing authorizations for entry and exit of information system
          components may require restricting access to delivery areas and possibly isolating the areas from the
          information system and media libraries. Related controls: CM-3, MA-2, MA-3, MP-5, SA-12.
          Control Enhancements: None.

          References: None.

PE-17     ALTERNATE WORK SITE

          Control: The organization:

          a.      Employs [Assignment: organization-defined security controls] at alternate work sites;
          b.      Assesses as feasible, the effectiveness of security controls at alternate work sites; and
          c.      Provides a means for employees to communicate with information security personnel in case of
                  security incidents or problems.
          Supplemental Guidance: Alternate work sites may include, for example, government facilities or private
          residences of employees. While commonly distinct from alternative processing sites, alternate work sites
          may provide readily available alternate locations as part of contingency operations. Organizations may
          define different sets of security controls for specific alternate work sites or types of sites depending on the
          work-related activities conducted at those sites. This control supports the contingency planning activities of
          organizations and the federal telework initiative. Related controls: AC-17, CP-7.
               This control is likely to be tailored out if the system availability impact level is low and
               alternate work sites are not required for the system.
          Control Enhancements: None.

          References: NIST Special Publication 800-46.

PE-18     LOCATION OF INFORMATION SYSTEM COMPONENTS

          Control: The organization positions information system components within the facility to minimize
          potential damage from [Assignment: organization-defined physical and environmental hazards] and to
          minimize the opportunity for unauthorized access.
          Supplemental Guidance: Physical and environmental hazards include, for example, flooding, fire, tornados,
          earthquakes, hurricanes, acts of terrorism, vandalism, electromagnetic pulse, electrical interference, and
          other forms of incoming electromagnetic radiation. In addition, organizations consider the location of
          physical entry points where unauthorized individuals, while not being granted access, might nonetheless be
          in close proximity to information systems and therefore increase the potential for unauthorized access to
          organizational communications (e.g., through the use of wireless sniffers or microphones). Related
          controls: CP-2, PE-19, RA-3.
               When non-US systems are collocated in a SAPF, special care shall be taken to minimize the
               possibility of inadvertent disclosure of information and TEMPEST vulnerabilities. A CTTA
               shall be contacted to conduct a TEMPEST Countermeasures Review (TCR) or a TEMPEST
               Requirements Questionnaire (TRQ) shall be submitted. Reference PE-19
          Control Enhancements:
          (1)    LOCATION OF INFORMATION SYSTEM COMPONENTS | FACILITY SITE
                 The organization plans the location or site of the facility where the information system resides with regard to physical
                 and environmental hazards and for existing facilities, considers the physical and environmental hazards in its risk
                 mitigation strategy.
                 Supplemental Guidance: Related control: PM-8.

          References: None.

PE-19     INFORMATION LEAKAGE

          Control: The organization protects the information system from information leakage due to electromagnetic
          signals emanations.
          Supplemental Guidance: Information leakage is the intentional or unintentional release of information to an
          untrusted environment from electromagnetic signals emanations. Security categories or classifications of
          information systems (with respect to confidentiality) and organizational security policies guide the
          selection of security controls employed to protect systems against information leakage due to
          electromagnetic signals emanations.

               Information systems, peripherals, associated data communications, and networks (planned or
               installed) that may be used to process national security or security-related information may
               need to meet certain national TEMPEST policies and procedures. TEMPEST is a short name
               (not an acronym) referring to investigations and studies of compromising emanations.
               Reference CNSSP 300, CNSSI 7000 and NSTISSI 7001.
               TEMPEST-relevant definitions include:
                   •   BLACK. Designation applied to information systems, and to associated areas,
                       circuits, components, and equipment, in which national security information is
                       encrypted or is not processed.
                   •   Certified TEMPEST Technical Authority (CTTA). An experienced, technically
                       qualified U.S. Government employee who has met established certification
                       requirements in accordance with CNSS approved criteria and has been appointed by
                       a U.S. Government department or agency to fulfill CTTA responsibilities.
                   •   Compromising Emanations. Unintentional signals that, if intercepted and analyzed,
                       would disclose the information transmitted, received, handled, or otherwise

                       processed by telecommunications or automated information systems equipment.
                   •   Inspectable Space. The three dimensional space surrounding equipment that
                       processes classified and/or sensitive information within which TEMPEST
                       exploitation is not considered practical, or where legal authority to identify and
                       remove a potential TEMPEST exploitation exists and is exercised. CTTAs have the
                       authority to define the inspectable space.
                   •   RED. Designation applied to an IS, and associated areas, circuits, components, and
                       equipment in which unencrypted national security information is being processed.
                   •   RED/BLACK Concept. Separation of electrical and electronic circuits, components,
                       equipment, and systems that handle national security information (RED), in
                       electrical form, from those that handle non-national security information (BLACK)
                       in the same form.
               TEMPEST Compliance
               The CTTA will determine if there is a TEMPEST requirement and will provide the
               recommended TEMPEST countermeasures to the PSO. TEMPEST countermeasures may
               include RED/BLACK installation, facility shielding, and or/the use of TEMPEST equipment.
               When compliance with TEMPEST standards is required, the PSO will issue specific
               guidance. PSOs may refer to CNSSI 7000, TEMPEST Countermeasures for Facilities, and
               NSTISSI 7001, NONSTOP Countermeasures, for the criteria to have a TEMPEST
               Countermeasures Review performed by a CTTA. It may also be necessary to contact a
               CTTA to obtain the threat environment.
               TEMPEST Accreditation
               When TEMPEST countermeasures are directed by the PSO, TEMPEST accreditation is
               based on verification of the countermeasures by inspection, test, and/or analysis. Refer to
               DoDM 5205.07-V3 for additional information on facility accreditation and TEMPEST
               requirements.
               TEMPEST Installation Requirements
               RED/BLACK separation in accordance with CNSSAM TEMPEST/1-13 is recommended for
               all SAPFs when it can be performed - within manageable cost parameters.
               When RED/BLACK installation is specified by the PSO for TEMPEST compliance, SAPFs
               will follow the installation requirements in CNSSAM TEMPEST/1-13. The TEMPEST/1-13
               requirements level and specific guidance is provided by the CTTA.
               Color coding or labeling that aids individuals in identifying the intended data carried by the
               cabling and validating its connections and proximity to emanations security concerns.
               Wireless, IR, and radio devices in SAPFs must be reviewed and approved by the CA SAPCO
               or PSO prior to introduction into the facility.

          Control Enhancements:
          (1)    INFORMATION LEAKAGE | NATIONAL EMISSIONS / TEMPEST POLICIES AND PROCEDURES
                 The organization ensures that information system components, associated data communications, and networks are
                 protected in accordance with national emissions and TEMPEST policies and procedures based on the security
                 category or classification of the information.

          References: FIPS Publication 199.

PE-20     ASSET MONITORING AND TRACKING

          Control: The organization:

          a.   Employs [Assignment: organization-defined asset location technologies] to track and monitor the
               location and movement of [Assignment: organization-defined assets] within [Assignment:
               organization-defined controlled areas]; and
          b.   Ensures that asset location technologies are employed in accordance with applicable federal laws,
               Executive Orders, directives, regulations, policies, standards, and guidance.
          Supplemental Guidance: Asset location technologies can help organizations ensure that critical assets such as
          vehicles or essential information system components remain in authorized locations. Organizations consult
          with the Office of the General Counsel and the Senior Agency Official for Privacy (SAOP)/Chief Privacy
          Officer (CPO) regarding the deployment and use of asset location technologies to address potential privacy
          concerns. Related control: CM-8.
          Control Enhancements: None.

          References: None.
