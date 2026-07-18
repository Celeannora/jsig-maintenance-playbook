# JSIG Chapter 3 Contingency Planning (CP) Family

Source URL: https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Archived source (used for extraction, direct URL returns HTTP 403): http://web.archive.org/web/20260405054539/https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Extraction note: Verbatim extraction via `pdftotext -layout` against the complete 378-page JSIG PDF (retrieved 2026-07-17 from the Wayback Machine snapshot below, since the direct DCSA URL returns HTTP 403). This supersedes any prior lower-fidelity extraction of this section. Running page headers/footers inserted by the PDF layout have been stripped; no wording has been added, summarized, or altered.

---

FAMILY: CONTINGENCY PLANNING

 Information system contingency planning refers to a coordinated strategy involving plans,
 procedures, and technical measures that enable the recovery of information systems, operations, and
 data after a disruption. Contingency planning generally includes one or more of the following
 approaches to restore disrupted services:
      •        Restoring information systems using alternate equipment.
      •        Performing some or all of the affected business processes using alternate processing
               (manual) means (typically acceptable for only short-term disruptions).
      •        Recovering information systems operations at an alternate location (typically acceptable for
               only long–term disruptions or those physically impacting the facility).
       •  Implementing appropriate contingency planning controls based on the information system’s
          security impact level.
 Information system contingency planning represents a broad scope of activities designed to sustain
 and recover critical system services following an emergency event. Information system contingency
 planning fits into a much broader security and emergency management effort that includes
 organizational and business process continuity, disaster recovery planning, and incident management.
 Ultimately, organizations use a suite of plans to properly prepare response, recovery, and continuity
 activities for disruptions affecting the organization’s information systems, mission/business
 functions, personnel, and the facility. Because there is an inherent relationship between an
 information system and the mission/business process it supports, there must be coordination between
 each plan during development and updates to ensure that recovery strategies and supporting resources
 neither negate each other nor duplicate efforts.
 Continuity and contingency planning are critical components of emergency management and
 organizational resilience but are often confused in their use. Continuity planning normally applies to
 the mission/business itself; it concerns the ability to continue critical functions and processes during
 and after an emergency event. Contingency planning normally applies to information systems, and
 provides the steps needed to recover the operation of all or part of designated information systems at
 an existing or new location in an emergency. Cyber Incident Response Planning is a type of plan that
 normally focuses on detection, response, and recovery to a computer security incident or event.
 In general, universally accepted definitions for information system contingency planning and the
 related planning areas have not been available. Occasionally, this leads to confusion regarding the
 actual scope and purpose of various types of plans. To provide a common basis of understanding
 regarding information system contingency planning, this section identifies several other types of
 plans and describes their purpose and scope relative to information system contingency planning.
 Because of the lack of standard definitions for these types of plans, the scope of actual plans
 developed by organizations may vary from the descriptions below. This guide applies the
 descriptions and references in controls below to security and emergency management-related plans.
 The plans listed are in alphabetical order, and do not imply any order of importance.
 The focus of this Contingency Planning (CP) section is information system contingency planning.

     Plan Type              Purpose                      Scope                   Plan Relationship
Business           Provides procedures for       Addresses mission/         Mission/business process
Continuity Plan    sustaining mission/           business functions at a    focused plan that may be
(BCP)              business operations while     lower or expanded          activated in coordination with
                   recovering from a             level from Continuity      a COOP plan to sustain non-
                   significant disruption.       of Operations (COOP)       mission- essential functions.
                                                 mission-essential
                                                 functions.
Continuity of      Provides procedures and       Addresses mission-         Mission-essential functions
Operations         guidance to sustain an        essential functions at a   focused plan that may also
(COOP) Plan        organization’s mission        facility; information      activate several business unit-
                   essential functions at an     systems are addressed      level BCPs, Information
                   alternate site for up to 30   based only on their        System Contingency Plans
                   days; mandated by             support of the             (ISCPs), or Disaster
                   federal directives.           mission- essential         Recovery Plans (DRPs), as
                                                 functions.                 appropriate.
Crisis             Provides procedures for       Addresses                  Incident-based plan often
Communications     disseminating internal        communications with        activated with a COOP or
Plan               and external                  personnel and the          BCP, but may be used alone
                   communications; means         public; not                during a public exposure
                   to provide critical status    information system-        event.
                   information and control       focused.
                   rumors.
Critical           Provides policies and         Addresses critical         Risk management plan that
Infrastructure     procedures for protection     infrastructure             supports COOP plans for
Protection (CIP)   of national critical          components that are        organizations with critical
Plan               infrastructure                supported or operated      infrastructure and key
                   components, as defined in     by an agency or            resource assets.
                   the National                  organization.
                   Infrastructure Protection
                   Plan.
Cyber Incident     Provides procedures for       Addresses mitigation       Information system- focused
Response Plan      mitigating and correcting     and isolation of           plan that may activate an
                   a cyber attack, such as       affected systems,          ISCP or DRP, depending on
                   Denial of Service (DoS),      cleanup, and               the extent of the attack.
                   Distributed Denial of         minimizing loss of
                   Service (DDoS),               information.
                   exfiltration, etc., which
                   may be executed by a
                   virus, worm, Trojan
                   horse, or other malicious
                   software (malware).
Disaster           Provides procedures for       Activated after major      Information system- focused
Recovery Plan      relocating information        system disruptions         plan that activates one or
(DRP)              systems operations to an      with long-term effects.    more ISCPs for recovery of
                   alternate location.                                      individual systems.

       Plan Type                    Purpose                         Scope                     Plan Relationship
Information               Provides procedures and         Addresses single               Information system- focused
System                    capabilities for                information system             plan that may be activated
Contingency Plan          recovering an information       recovery at the current        independent from other plans
(ISCP)                    system.                         or, if appropriate,            or as part of a larger recovery
                                                          alternate location.            effort coordinated with a
                                                                                         DRP, COOP, and/or BCP.
Occupant                  Provides coordinated            Focuses on personnel           Incident-based plan that is
Emergency Plan            procedures for                  and property particular        initiated immediately after an
(OEP)                     minimizing loss of life or      to the specific facility;      event, preceding a COOP or
                          injury and protecting           not mission/business           DRP activation.
                          property from damage in         process or information
                          response to a physical          system-based.
                          threat.
                                           Table 3-2: Types of Contingency Plans

CP-1      CONTINGENCY PLANNING POLICY AND PROCEDURES

          Control: The organization:

          a.   Develops, documents, and disseminates to [Assignment: organization-defined personnel or roles]:
               1.   A contingency planning policy that addresses purpose, scope, roles, responsibilities, management
                    commitment, coordination among organizational entities, and compliance; and
               2.   Procedures to facilitate the implementation of the contingency planning policy and associated
                    contingency planning controls; and
          b.   Reviews and updates the current:
               1.   Contingency planning policy at least annually; and
               2.   Contingency planning procedures at least annually.
          Supplemental Guidance: This control addresses the establishment of policy and procedures for the effective
          implementation of selected security controls and control enhancements in the CP family. Policy and
          procedures reflect applicable federal laws, Executive Orders, directives, regulations, policies, standards,
          and guidance. Security program policies and procedures at the organization level may make the need for
          system-specific policies and procedures unnecessary. The policy can be included as part of the general
          information security policy for organizations or conversely, can be represented by multiple policies
          reflecting the complex nature of certain organizations. The procedures can be established for the security
          program in general and for particular information systems, if needed. The organizational risk management
          strategy is a key factor in establishing policy and procedures. Related control: PM-9.
          Control Enhancements: None.

          References: Federal Continuity Directive 1; NIST Special Publications 800-12, 800-34, 800-100.

CP-2      CONTINGENCY PLAN

          Control: The organization:

          a.   Develops a contingency plan for the information system that:
               1.   Identifies essential missions and business functions and associated contingency requirements;
               2.   Provides recovery objectives, restoration priorities, and metrics;

                 3.   Addresses contingency roles, responsibilities, assigned individuals with contact information;
                 4.   Addresses maintaining essential missions and business functions despite an information system
                      disruption, compromise, or failure;
                 5.   Addresses eventual, full information system restoration without deterioration of the security
                      safeguards originally planned and implemented; and
                 6.   Is reviewed and approved by [Assignment: organization-defined personnel or roles];
          b.     Distributes copies of the contingency plan to key personnel or roles and organizational elements
                 identified in the contingency plan;
          c.     Coordinates contingency planning activities with incident handling activities;
          d.     Reviews the contingency plan for the information system at least annually;
          e.     Updates the contingency plan to address changes to the organization, information system, or
                 environment of operation and problems encountered during contingency plan implementation,
                 execution, or testing;
          f.     Communicates contingency plan changes to key personnel and organizational elements identified
                 in the contingency plan; and
          g.     Protects the contingency plan from unauthorized disclosure and modification.
          Supplemental Guidance: Contingency planning for information systems is part of an overall organizational
          program for achieving continuity of operations for mission/business functions. Contingency planning
          addresses both information system restoration and implementation of alternative mission/business
          processes when systems are compromised. The effectiveness of contingency planning is maximized by
          considering such planning throughout the phases of the system development life cycle. Performing
          contingency planning on hardware, software, and firmware development can be an effective means of
          achieving information system resiliency. Contingency plans reflect the degree of restoration required for
          organizational information systems since not all systems may need to fully recover to achieve the level of
          continuity of operations desired. Information system recovery objectives reflect applicable laws, Executive
          Orders, directives, policies, standards, regulations, and guidelines. In addition to information system
          availability, contingency plans also address other security-related events resulting in a reduction in mission
          and/or business effectiveness, such as malicious attacks compromising the confidentiality or integrity of
          information systems. Actions addressed in contingency plans include, for example, orderly/graceful
          degradation, information system shutdown, fallback to a manual mode, alternate information flows, and
          operating in modes reserved for when systems are under attack. By closely coordinating contingency
          planning with incident handling activities, organizations can ensure that the necessary contingency
          planning activities are in place and activated in the event of a security incident. Related controls: AC-14,
          CP-6, CP-7, CP-8, CP-9, CP-10, IR-4, IR-8, MP-2, MP-4, MP-5, PM-8, PM-11.
               The availability impact level drives the level of contingency required for the system. The
               Information System Contingency Plan (ISCP) may be either a separate document specific to
               the IS, included in the SSP, or may be incorporated into a broader site contingency plan, such
               as the Business Continuity Plan (BCP) or Continuity of Operations Plan (COOP). ISCP
               development is the responsibility of the ISO.
               A key step in developing an ISCP is to conduct a Business Impact Analysis (BIA). The BIA
               enables the organization to characterize the system components, supported mission/business
               functions, and interdependencies. The BIA purpose is to correlate the system with the
               critical mission/business processes and services provided, and based on that information,
               characterize the consequences of a disruption. The organization can use the BIA results to
               determine contingency planning requirements and priorities. Results from the BIA can also
               be incorporated into the analysis and strategy development efforts for the organization’s
               COOP, BCPs, and DRP. The depth of planning and degree of detail in an ISCP is dependent
               on the mission criticality of each system should the system become unavailable. A simple

               statement as to how long a system can remain unavailable before it impacts the mission is the
               basic foundation of a BIA. The mission owner or ISO determine to what lengths the
               ISSM/ISSO should go to ensure a contingency plan is in place, e.g., relocation of
               users/team/crew, hot backup, warm backup, backup media stored offsite, no additional
               measures beyond backing up the data.
               The plan must define and describe specific responsibilities of designated staff or positions to
               facilitate the recovery and/or continuity of essential system functions. The ISCP consists of a
               comprehensive description of all actions to be taken before, during, and after a disaster or
               emergency condition along with documented and tested procedures. The ISCP helps to
               ensure critical resources are available and facilitates the continuity of operations in an
               emergency situation.
          Control Enhancements:
          (1)    CONTINGENCY PLAN | COORDINATE WITH RELATED PLANS
                 The organization coordinates contingency plan development with organizational elements responsible for related
                 plans.
                 Supplemental Guidance: Plans related to contingency plans for organizational information systems
                 include, for example, Business Continuity Plans, Disaster Recovery Plans, Continuity of Operations
                 Plans, Crisis Communications Plans, Critical Infrastructure Plans, Cyber Incident Response Plans,
                 Insider Threat Implementation Plan, and Occupant Emergency Plans.
          (2)    CONTINGENCY PLAN | CAPACITY PLANNING
                 The organization conducts capacity planning so that necessary capacity for information processing,
                 telecommunications, and environmental support exists during contingency operations.
                 Supplemental Guidance: Capacity planning is needed because different types of threats (e.g., natural
                 disasters, targeted cyber attacks) can result in a reduction of the available processing,
                 telecommunications, and support services originally intended to support the organizational
                 missions/business functions. Organizations may need to anticipate degraded operations during
                 contingency operations and factor such degradation into capacity planning.
          (3)    CONTINGENCY PLAN | RESUME ESSENTIAL MISSIONS / BUSINESS FUNCTIONS
                 The organization plans for the resumption of essential missions and business functions within a time period as
                 defined in the contingency plan of contingency plan activation.
                 Supplemental Guidance: Organizations may choose to carry out the contingency planning activities in
                 this control enhancement as part of organizational business continuity planning including, for example,
                 as part of business impact analyses. The time period for resumption of essential missions/business
                 functions may be dependent on the severity/extent of disruptions to the information system and its
                 supporting infrastructure. Related control: PE-12.
          (4)    CONTINGENCY PLAN | RESUME ALL MISSIONS / BUSINESS FUNCTIONS
                 The organization plans for the resumption of all missions and business functions within a time period as defined in
                 the contingency plan of contingency plan activation.
                 Supplemental Guidance: Organizations may choose to carry out the contingency planning activities in
                 this control enhancement as part of organizational business continuity planning including, for example,
                 as part of business impact analyses. The time period for resumption of all missions/business functions
                 may be dependent on the severity/extent of disruptions to the information system and its supporting
                 infrastructure. Related control: PE-12.
          (5)    CONTINGENCY PLAN | CONTINUE ESSENTIAL MISSIONS / BUSINESS FUNCTIONS
                 The organization plans for the continuance of essential missions and business functions with little or no loss of
                 operational continuity and sustains that continuity until full information system restoration at primary processing
                 and/or storage sites.
                 Supplemental Guidance: Organizations may choose to carry out the contingency planning activities in
                 this control enhancement as part of organizational business continuity planning including, for example,
                 as part of business impact analyses. Primary processing and/or storage sites defined by organizations
                 as part of contingency planning may change depending on the circumstances associated with the
                 contingency (e.g., backup sites may become primary sites). Related control: PE-12.

          (6)   CONTINGENCY PLAN | ALTERNATE PROCESSING / STORAGE SITE
                The organization plans for the transfer of essential missions and business functions to alternate processing and/or
                storage sites with little or no loss of operational continuity and sustains that continuity through information system
                restoration to primary processing and/or storage sites.
                Supplemental Guidance: Organizations may choose to carry out the contingency planning activities in
                this control enhancement as part of organizational business continuity planning including, for example,
                as part of business impact analyses. Primary processing and/or storage sites defined by organizations
                as part of contingency planning may change depending on the circumstances associated with the
                contingency (e.g., backup sites may become primary sites). Related control: PE-12.
          (7)   CONTINGENCY PLAN | COORDINATE WITH EXTERNAL SERVICE PROVIDERS
                The organization coordinates its contingency plan with the contingency plans of external service providers to ensure
                that contingency requirements can be satisfied.
                Supplemental Guidance: When the capability of an organization to successfully carry out its core
                missions/business functions is dependent on external service providers, developing a timely and
                comprehensive contingency plan may become more challenging. In this situation, organizations
                coordinate contingency planning activities with the external entities to ensure that the individual plans
                reflect the overall contingency needs of the organization. Related control: SA-9.
          (8)   CONTINGENCY PLAN | IDENTIFY CRITICAL ASSETS
                The organization identifies critical information system assets supporting essential missions and business functions.
                Supplemental Guidance: Organizations may choose to carry out the contingency planning activities in
                this control enhancement as part of organizational business continuity planning including, for example,
                as part of business impact analyses. Organizations identify critical information system assets so that
                additional safeguards and countermeasures can be employed (above and beyond those safeguards and
                countermeasures routinely implemented) to help ensure that organizational missions/business functions
                can continue to be conducted during contingency operations. In addition, the identification of critical
                information assets facilitates the prioritization of organizational resources. Critical information system
                assets include technical and operational aspects. Technical aspects include, for example, information
                technology services, information system components, information technology products, and
                mechanisms. Operational aspects include, for example, procedures (manually executed operations) and
                personnel (individuals operating technical safeguards and/or executing manual procedures).
                Organizational program protection plans can provide assistance in identifying critical assets. Related
                controls: SA-14, SA-15.
          References: Federal Continuity Directive 1; NIST Special Publication 800-34.

CP-3      CONTINGENCY TRAINING

          Control: The organization provides contingency training to information system users consistent with
          assigned roles and responsibilities:
          a.    Within ten (10) working days of assuming a contingency role or responsibility;
          b.    When required by information system changes; and
          c.    Annually or as defined in the contingency plan thereafter.
          Supplemental Guidance: Contingency training provided by organizations is linked to the assigned roles and
          responsibilities of organizational personnel to ensure that the appropriate content and level of detail is
          included in such training. For example, regular users may only need to know when and where to report for
          duty during contingency operations and if normal duties are affected; system administrators may
          require additional training on how to set up information systems at alternate processing and storage sites;
          and managers/senior leaders may receive more specific training on how to conduct mission-essential
          functions in designated off-site locations and how to establish communications with other governmental
          entities for purposes of coordination on contingency-related activities. Training for contingency
          roles/responsibilities reflects the specific continuity requirements in the contingency plan. Related controls:
          AT-2, AT-3, CP-2, IR-2.

          Simulated events should be incorporated in the training. For example, training might include
          a scenario where a Category 3 hurricane (or similar natural/man-made potential disaster) is
          bearing down on your location. This would be a simulated event which would provide a more
          realistic training scenario.
          Control Enhancements:
          (1)    CONTINGENCY TRAINING | SIMULATED EVENTS
                 The organization incorporates simulated events into contingency training to facilitate effective response by personnel
                 in crisis situations.
          (2)    CONTINGENCY TRAINING | AUTOMATED TRAINING ENVIRONMENTS
                 The organization employs automated mechanisms to provide a more thorough and realistic contingency training
                 environment.

          References: Federal Continuity Directive 1; NIST Special Publications 800-16, 800-50.

CP-4      CONTINGENCY PLAN TESTING

          Control: The organization:

          a.     Tests the contingency plan for the information system annually using documented tests as defined in
                 the contingency plan to determine the effectiveness of the plan and the organizational readiness to
                 execute the plan;
          b.     Reviews the contingency plan test results; and
          c.     Initiates corrective actions, if needed.
          Supplemental Guidance: Methods for testing contingency plans to determine the effectiveness of the plans
          and to identify potential weaknesses in the plans include, for example, walk-through and tabletop exercises,
          checklists, simulations (parallel, full interrupt), and comprehensive exercises. Organizations conduct testing
          based on the continuity requirements in contingency plans and include a determination of the effects on
          organizational operations, assets, and individuals arising due to contingency operations. Organizations have
          flexibility and discretion in the breadth, depth, and timelines of corrective actions. Related controls: CP-2,
          CP-3, IR-3.
               Results of documented tests should be retained for previous two years and after action
               reports should be maintained for the life of the system.
          Control Enhancements:
          (1)    CONTINGENCY PLAN TESTING | COORDINATE WITH RELATED PLANS
                 The organization coordinates contingency plan testing with organizational elements responsible for related plans.
                 Supplemental Guidance: Plans related to contingency plans for organizational information systems
                 include, for example, Business Continuity Plans, Disaster Recovery Plans, Continuity of Operations
                 Plans, Crisis Communications Plans, Critical Infrastructure Plans, Cyber Incident Response Plans, and
                 Occupant Emergency Plans. This control enhancement does not require organizations to create
                 organizational elements to handle related plans or to align such elements with specific plans. It does
                 require, however, that if such organizational elements are responsible for related plans, organizations
                 should coordinate with those elements. Related controls: IR-8, PM-8.
          (2)    CONTINGENCY PLAN TESTING | ALTERNATE PROCESSING SITE
                 The organization tests the contingency plan at the alternate processing site:
                 (a)   To familiarize contingency personnel with the facility and available resources; and
                 (b) To evaluate the capabilities of the alternate processing site to support contingency operations.
                 Supplemental Guidance: Related control: CP-7.
          (3)    CONTINGENCY PLAN TESTING | AUTOMATED TESTING
                 The organization employs automated mechanisms to more thoroughly and effectively test the contingency plan.

                Supplemental Guidance: Automated mechanisms provide more thorough and effective testing of
                contingency plans, for example: (i) by providing more complete coverage of contingency issues; (ii) by
                selecting more realistic test scenarios and environments; and (iii) by effectively stressing the
                information system and supported missions.
          (4)   CONTINGENCY PLAN TESTING | FULL RECOVERY / RECONSTITUTION
                The organization includes a full recovery and reconstitution of the information system to a known state as part of
                contingency plan testing.
                Supplemental Guidance: Related controls: CP-10, SC-24.

          References: Federal Continuity Directive 1; FIPS Publication 199; NIST Special Publications 800-34, 800-
          84.

CP-5      CONTINGENCY PLAN UPDATE
          [Withdrawn: Incorporated into CP-2].

CP-6      ALTERNATE STORAGE SITE

          Control: The organization:

          a.    Establishes an alternate storage site including necessary agreements to permit the storage and retrieval
                of information system backup information; and
          b.    Ensures that the alternate storage site provides information security safeguards equivalent to that of the
                primary site.
          Supplemental Guidance: Alternate storage sites are sites that are geographically distinct from primary storage
          sites. An alternate storage site maintains duplicate copies of information and data in the event that the
          primary storage site is not available. Items covered by alternate storage site agreements include, for
          example, environmental conditions at alternate sites, access rules, physical and environmental protection
          requirements, and coordination of delivery/retrieval of backup media. Alternate storage sites reflect the
          requirements in contingency plans so that organizations can maintain essential missions/business functions
          despite disruption, compromise, or failure in organizational information systems. Related controls: CP-2,
          CP-7, CP-9, CP-10, MP-4.
          Control Enhancements:
          (1)   ALTERNATE STORAGE SITE | SEPARATION FROM PRIMARY SITE
                The organization identifies an alternate storage site that is separated from the primary storage site to reduce
                susceptibility to the same threats.
                Supplemental Guidance: Threats that affect alternate storage sites are typically defined in organizational
                assessments of risk and include, for example, natural disasters, structural failures, hostile cyber attacks,
                and errors of omission/commission. Organizations determine what is considered a sufficient degree of
                separation between primary and alternate storage sites based on the types of threats that are of concern.
                For one particular type of threat (i.e., hostile cyber attack), the degree of separation between sites is
                less relevant. Related control: RA-3.
          (2)   ALTERNATE STORAGE SITE | RECOVERY TIME / POINT OBJECTIVES
                The organization configures the alternate storage site to facilitate recovery operations in accordance with recovery
                time and recovery point objectives.
          (3)   ALTERNATE STORAGE SITE | ACCESSIBILITY
                The organization identifies potential accessibility problems to the alternate storage site in the event of an area-wide
                disruption or disaster and outlines explicit mitigation actions.
                Supplemental Guidance: Area-wide disruptions refer to those types of disruptions that are broad in
                geographic scope (e.g., hurricane, regional power outage) with such determinations made by
                organizations based on organizational assessments of risk. Explicit mitigation actions include, for
                example: (i) duplicating backup information at other alternate storage sites if access problems occur at
                originally designated alternate sites; or (ii) planning for physical access to retrieve backup information
                if electronic accessibility to the alternate site is disrupted. Related control: RA-3.

          References: NIST Special Publication 800-34.

CP-7      ALTERNATE PROCESSING SITE

          Control: The organization:

          a.      Establishes an alternate processing site including necessary agreements to permit the transfer and
                  resumption of information system operations as defined in the contingency plan for essential
                  missions/business functions within a time period as defined in the contingency plan when the
                  primary processing capabilities are unavailable;
          b.      Ensures that equipment and supplies required to transfer and resume operations are available at the
                  alternate processing site or contracts are in place to support delivery to the site within the organization-
                  defined time period for transfer/resumption; and
          c.      Ensures that the alternate processing site provides information security safeguards equivalent to that of
                  the primary site.
          Supplemental Guidance: Alternate processing sites are sites that are geographically distinct from primary
          processing sites. An alternate processing site provides processing capability in the event that the primary
          processing site is not available. Items covered by alternate processing site agreements include, for example,
          environmental conditions at alternate sites, access rules, physical and environmental protection
          requirements, and coordination for the transfer/assignment of personnel. Requirements are specifically
          allocated to alternate processing sites that reflect the requirements in contingency plans to maintain
          essential missions/business functions despite disruption, compromise, or failure in organizational
          information systems. Related controls: CP-2, CP-6, CP-8, CP-9, CP-10, MA-6.
               This control is likely to be tailored out if the system availability impact level is low.
          Control Enhancements:
          (1)     ALTERNATE PROCESSING SITE | SEPARATION FROM PRIMARY SITE
                  The organization identifies an alternate processing site that is separated from the primary processing site to reduce
                  susceptibility to the same threats.
                  Supplemental Guidance: Threats that affect alternate processing sites are typically defined in
                  organizational assessments of risk and include, for example, natural disasters, structural failures,
                  hostile cyber attacks, and errors of omission/commission. Organizations determine what is considered
                  a sufficient degree of separation between primary and alternate processing sites based on the types of
                  threats that are of concern. For one particular type of threat (i.e., hostile cyber attack), the degree of
                  separation between sites is less relevant. Related control: RA-3.
          (2)     ALTERNATE PROCESSING SITE | ACCESSIBILITY
                  The organization identifies potential accessibility problems to the alternate processing site in the event of an area-
                  wide disruption or disaster and outlines explicit mitigation actions.
                  Supplemental Guidance: Area-wide disruptions refer to those types of disruptions that are broad in
                  geographic scope (e.g., hurricane, regional power outage) with such determinations made by
                  organizations based on organizational assessments of risk. Related control: RA-3.
          (3)     ALTERNATE PROCESSING SITE | PRIORITY OF SERVICE
                  The organization develops alternate processing site agreements that contain priority-of-service provisions in
                  accordance with organizational availability requirements (including recovery time objectives).
                  Supplemental Guidance: Priority-of-service agreements refer to negotiated agreements with service
                  providers that ensure that organizations receive priority treatment consistent with their availability
                  requirements and the availability of information resources at the alternate processing site.
          (4)     ALTERNATE PROCESSING SITE | PREPARATION FOR USE
                  The organization prepares the alternate processing site so that the site is ready to be used as the operational site
                  supporting essential missions and business functions.
                  Supplemental Guidance: Site preparation includes, for example, establishing configuration settings for
                  information system components at the alternate processing site consistent with the requirements for

                such settings at the primary site and ensuring that essential supplies and other logistical considerations
                are in place. Related controls: CM-2, CM-6.
          (5)   ALTERNATE PROCESSING SITE | EQUIVALENT INFORMATION SECURITY SAFEGUARDS
                [Withdrawn: Incorporated into CP-7].
          (6)   ALTERNATE PROCESSING SITE | INABILITY TO RETURN TO PRIMARY SITE
                The organization plans and prepares for circumstances that preclude returning to the primary processing site.

          References: NIST Special Publication 800-34.

CP-8      TELECOMMUNICATIONS SERVICES

          Control: The organization establishes alternate telecommunications services including necessary agreements
          to permit the resumption of information system operations as defined in the contingency plan] for
          essential missions and business functions within a time period as defined in the contingency plan when
          the primary telecommunications capabilities are unavailable at either the primary or alternate processing or
          storage sites.
          Supplemental Guidance: This control applies to telecommunications services (data and voice) for primary
          and alternate processing and storage sites. Alternate telecommunications services reflect the continuity
          requirements in contingency plans to maintain essential missions/business functions despite the loss of
          primary telecommunications services. Organizations may specify different time periods for
          primary/alternate sites. Alternate telecommunications services include, for example, additional
          organizational or commercial ground-based circuits/lines or satellites in lieu of ground-based
          communications. Organizations consider factors such as availability, quality of service, and access when
          entering into alternate telecommunications agreements. Related controls: CP-2, CP-6, CP-7.
          Control Enhancements:
          (1)   TELECOMMUNICATIONS SERVICES | PRIORITY OF SERVICE PROVISIONS
                The organization:
                (a)   Develops primary and alternate telecommunications service agreements that contain priority-of-service
                      provisions in accordance with organizational availability requirements (including recovery time objectives); and
                (b) Requests Telecommunications Service Priority for all telecommunications services used for national security
                    emergency preparedness in the event that the primary and/or alternate telecommunications services are
                    provided by a common carrier.
                Supplemental Guidance: Organizations consider the potential mission/business impact in situations
                where telecommunications service providers are servicing other organizations with similar priority-of-
                service provisions.
          (2)   TELECOMMUNICATIONS SERVICES | SINGLE POINTS OF FAILURE
                The organization obtains alternate telecommunications services to reduce the likelihood of sharing a single point of
                failure with primary telecommunications services.
          (3)   TELECOMMUNICATIONS SERVICES | SEPARATION OF PRIMARY / ALTERNATE PROVIDERS
                The organization obtains alternate telecommunications services from providers that are separated from primary
                service providers to reduce susceptibility to the same threats.
                Supplemental Guidance: Threats that affect telecommunications services are typically defined in
                organizational assessments of risk and include, for example, natural disasters, structural failures,
                hostile cyber/physical attacks, and errors of omission/commission. Organizations seek to reduce
                common susceptibilities by, for example, minimizing shared infrastructure among telecommunications
                service providers and achieving sufficient geographic separation between services. Organizations may
                consider using a single service provider in situations where the service provider can provide alternate
                telecommunications services meeting the separation needs addressed in the risk assessment.
          (4)   TELECOMMUNICATIONS SERVICES | PROVIDER CONTINGENCY PLAN
                The organization:
                (a)   Requires primary and alternate telecommunications service providers to have contingency plans;
                (b) Reviews provider contingency plans to ensure that the plans meet organizational contingency requirements;
                    and

                 (c)   Obtains evidence of contingency testing/training by providers [Assignment: organization-defined frequency].
                 Supplemental Guidance: Reviews of provider contingency plans consider the proprietary nature of such
                 plans. In some situations, a summary of provider contingency plans may be sufficient evidence for
                 organizations to satisfy the review requirement. Telecommunications service providers may also
                 participate in ongoing disaster recovery exercises in coordination with the Department of Homeland
                 Security, state, and local governments. Organizations may use these types of activities to satisfy
                 evidentiary requirements related to service provider contingency plan reviews, testing, and training.
          (5)    TELECOMMUNICATIONS SERVICES | ALTERNATE TELECOMMUNICATION SERVICE TESTING
                 The organization tests alternate telecommunication services [Assignment: organization-defined frequency].

          References: NIST Special Publication 800-34; National Communications Systems Directive 3-10; Web:
          http://www.dhs.gov/telecommunications-service-priority-tsp.

CP-9      INFORMATION SYSTEM BACKUP

          Control: The organization:

          a.     Conducts backups of user-level information contained in the information system at least weekly or as
                 defined in the contingency plan;
          b.     Conducts backups of system-level information contained in the information system at least weekly or
                 as defined in the contingency plan;
          c.     Conducts backups of information system documentation including security-related documentation
                 when created, received, updated, or as defined in the contingency plan or at least annually; and
          d.     Protects the confidentiality, integrity, and availability of backup information at storage locations.
          Supplemental Guidance: System-level information includes, for example, system-state information, operating
          system and application software, and licenses. User-level information includes any information other than
          system-level information. Mechanisms employed by organizations to protect the integrity of information
          system backups include, for example, digital signatures and cryptographic hashes. Protection of system
          backup information while in transit is beyond the scope of this control. Information system backups reflect
          the requirements in contingency plans as well as other organizational requirements for backing up
          information. Related controls: CP-2, CP-6, MP-4, MP-5, SC-13.
               Besides preventing data loss, backups of information for archiving purposes allow for proper
               on-line storage management.
               The ISO shall develop backup plans for all information systems. Backup plans must be
               coordinated with the ISSM/ISSO and included in the ISCP. Backup plans should consider
               data-production rates and data-loss risks. The areas of risk that should be identified and
               planned for include, but are not limited to: Loss of power.
                   •    Loss of network connectivity.
                   •    Loss or corruption of data.
                   •    Facility disruptions, such as loss of air conditioning, fire, flooding, etc.

               Backup procedures should reflect the risk from media loss. If a hard disk were damaged, lost
               or contaminated in some way, the disk backups, coupled with periodic incremental backups
               between full backups, would allow for the restoration of the data. “Active backups” should
               be maintained for disks that contain often-used applications.
               Backup information must be protected to ensure its confidentiality and integrity. Digital
               signatures and cryptographic hashes can be employed to protect the integrity of information
               system backups. Reference SC-13, Cryptographic Protection. An organizational assessment
               of risk guides the use of encryption for protecting backup information. Reference SC-28,
               Protection of Data at Rest.

          Control Enhancements:
          (1)   INFORMATION SYSTEM BACKUP | TESTING FOR RELIABILITY / INTEGRITY
                The organization tests backup information at least monthly or as defined in the contingency plan to verify media
                reliability and information integrity.
                Supplemental Guidance: Related control: CP-4.
          (2)   INFORMATION SYSTEM BACKUP | TEST RESTORATION USING SAMPLING
                The organization uses a sample of backup information in the restoration of selected information system functions as
                part of contingency plan testing.
                Supplemental Guidance: Related control: CP-4.
          (3)   INFORMATION SYSTEM BACKUP | SEPARATE STORAGE FOR CRITICAL INFORMATION
                The organization stores backup copies of [Assignment: organization-defined critical information system software and
                other security-related information] in a separate facility or in a fire-rated container that is not collocated with the
                operational system.
                Supplemental Guidance: Critical information system software includes, for example, operating systems,
                cryptographic key management systems, and intrusion detection/prevention systems. Security-related
                information includes, for example, organizational inventories of hardware, software, and firmware
                components. Alternate storage sites typically serve as separate storage facilities for organizations.
                Related controls: CM-2, CM-8.
          (4)   INFORMATION SYSTEM BACKUP | PROTECTION FROM UNAUTHORIZED MODIFICATION
                [Withdrawn: Incorporated into CP-9].
          (5)   INFORMATION SYSTEM BACKUP | TRANSFER TO ALTERNATE STORAGE SITE
                The organization transfers information system backup information to the alternate storage site [Assignment:
                organization-defined time period and transfer rate consistent with the recovery time and recovery point objectives].
                Supplemental Guidance: Information system backup information can be transferred to alternate storage
                sites either electronically or by physical shipment of storage media.
          (6)   INFORMATION SYSTEM BACKUP | REDUNDANT SECONDARY SYSTEM
                The organization accomplishes information system backup by maintaining a redundant secondary system that is not
                collocated with the primary system and that can be activated without loss of information or disruption to operations.
                Supplemental Guidance: Related controls: CP-7, CP-10.
          (7)   INFORMATION SYSTEM BACKUP | DUAL AUTHORIZATION
                The organization enforces dual authorization for the deletion or destruction of [Assignment: organization-defined
                backup information].
                Supplemental Guidance: Dual authorization ensures that the deletion or destruction of backup
                information cannot occur unless two qualified individuals carry out the task. Individuals
                deleting/destroying backup information possess sufficient skills/expertise to determine if the proposed
                deletion/destruction of backup information reflects organizational policies and procedures. Dual
                authorization may also be known as two-person control. Related controls: AC-3, MP-2.
          References: NIST Special Publication 800-34.

CP-10     INFORMATION SYSTEM RECOVERY AND RECONSTITUTION

          Control: The organization provides for the recovery and reconstitution of the information system to a known
          state after a disruption, compromise, or failure.
          Supplemental Guidance: Recovery is executing information system contingency plan activities to restore
          organizational missions/business functions. Reconstitution takes place following recovery and includes
          activities for returning organizational information systems to fully operational states. Recovery and
          reconstitution operations reflect mission and business priorities, recovery point/time and reconstitution
          objectives, and established organizational metrics consistent with contingency plan requirements.
          Reconstitution includes the deactivation of any interim information system capabilities that may have been
          needed during recovery operations. Reconstitution also includes assessments of fully restored information
          system capabilities, reestablishment of continuous monitoring activities, potential information system
          reauthorizations, and activities to prepare the systems against future disruptions, compromises, or failures.

          Recovery/reconstitution capabilities employed by organizations can include both automated mechanisms
          and manual procedures. Related controls: CA-2, CA-6, CA-7, CP-2, CP-6, CP-7, CP-9, SC-24.
          Control Enhancements:
          (1)   INFORMATION SYSTEM RECOVERY AND RECONSTITUTION | CONTINGENCY PLAN TESTING
                [Withdrawn: Incorporated into CP-4].
          (2)   INFORMATION SYSTEM RECOVERY AND RECONSTITUTION | TRANSACTION RECOVERY
                The information system implements transaction recovery for systems that are transaction-based.
                Supplemental Guidance: Transaction-based information systems include, for example, database
                management systems and transaction processing systems. Mechanisms supporting transaction recovery
                include, for example, transaction rollback and transaction journaling.
          (3)   INFORMATION SYSTEM RECOVERY AND RECONSTITUTION | COMPENSATING SECURITY CONTROLS
                [Withdrawn: Addressed through tailoring procedures].
          (4)   INFORMATION SYSTEM RECOVERY AND RECONSTITUTION | RESTORE WITHIN TIME PERIOD
                The organization provides the capability to restore information system components within [Assignment: organization-
                defined restoration time-periods] from configuration-controlled and integrity-protected information representing a
                known, operational state for the components.
                Supplemental Guidance: Restoration of information system components includes, for example,
                reimaging which restores components to known, operational states. Related control: CM-2.
          (5)   INFORMATION SYSTEM RECOVERY AND RECONSTITUTION | FAILOVER CAPABILITY
                [Withdrawn: Incorporated into SI-13].
          (6)   INFORMATION SYSTEM RECOVERY AND RECONSTITUTION | COMPONENT PROTECTION
                The organization protects backup and restoration hardware, firmware, and software.
                Supplemental Guidance: Protection of backup and restoration hardware, firmware, and software
                components includes both physical and technical safeguards. Backup and restoration software
                includes, for example, router tables, compilers, and other security-relevant system software. Related
                controls: AC-3, AC-6, PE-3.
          References: Federal Continuity Directive 1; NIST Special Publication 800-34.

CP-11     ALTERNATE COMMUNICATIONS PROTOCOLS

          Control: The information system provides the capability to employ alternate communications protocols as
          defined in the contingency plan in support of maintaining continuity of operations.
          Supplemental Guidance: Contingency plans and the associated training and testing for those plans,
          incorporate an alternate communications protocol capability as part of increasing the resilience of
          organizational information systems. Alternate communications protocols include, for example, switching
          from Transmission Control Protocol/Internet Protocol (TCP/IP) Version 4 to TCP/IP Version 6. Switching
          communications protocols may affect software applications and therefore, the potential side effects of
          introducing alternate communications protocols are analyzed prior to implementation.
          Control Enhancements: None.

          References: None.

CP-12     SAFE MODE

          Control: The information system, when [Assignment: organization-defined conditions] are detected, enters a
          safe mode of operation with [Assignment: organization-defined restrictions of safe mode of operation].
          Supplemental Guidance: For information systems supporting critical missions/business functions including,
          for example, military operations and weapons systems, civilian space operations, nuclear power plant
          operations, and air traffic control operations (especially real-time operational environments), organizations
          may choose to identify certain conditions under which those systems revert to a predefined safe mode of
          operation. The safe mode of operation, which can be activated automatically or manually, restricts the types

          of activities or operations information systems could execute when those conditions are encountered.
          Restriction includes, for example, allowing only certain functions that could be carried out under limited
          power or with reduced communications bandwidth.
          Control Enhancements: None.

          References: None.

CP-13     ALTERNATIVE SECURITY MECHANISMS

          Control: The organization employs [Assignment: organization-defined alternative or supplemental security
          mechanisms] for satisfying [Assignment: organization-defined security functions] when the primary means
          of implementing the security function is unavailable or compromised.
          Supplemental Guidance: This control supports information system resiliency and contingency
          planning/continuity of operations. To ensure mission/business continuity, organizations can implement
          alternative or supplemental security mechanisms. These mechanisms may be less effective than the primary
          mechanisms (e.g., not as easy to use, not as scalable, or not as secure). However, having the capability to
          readily employ these alternative/supplemental mechanisms enhances overall mission/business continuity
          that might otherwise be adversely impacted if organizational operations had to be curtailed until the
          primary means of implementing the functions was restored. Given the cost and level of effort required to
          provide such alternative capabilities, this control would typically be applied only to critical security
          capabilities provided by information systems, system components, or information system services. For
          example, an organization may issue to senior executives and system administrators one-time pads in case
          multifactor tokens, the organization’s standard means for secure remote authentication, is compromised.
          Related control: CP-2.
          Control Enhancements: None.

          References: None.
