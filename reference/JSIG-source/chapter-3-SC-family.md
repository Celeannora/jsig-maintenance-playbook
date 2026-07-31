# JSIG Chapter 3 System and Communications Protection (SC) Family

Source URL: https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Archived source (used for extraction, direct URL returns HTTP 403): http://web.archive.org/web/20260405054539/https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Extraction note: Verbatim extraction via `pdftotext -layout` against the complete 378-page JSIG PDF (retrieved 2026-07-17 from the Wayback Machine snapshot below, since the direct DCSA URL returns HTTP 403). This supersedes any prior lower-fidelity extraction of this section. Running page headers/footers inserted by the PDF layout have been stripped; no wording has been added, summarized, or altered.

---

FAMILY: SYSTEM AND COMMUNICATIONS PROTECTION

SC-1      SYSTEM AND COMMUNICATIONS PROTECTION POLICY AND PROCEDURES

          Control: The organization:

          a.     Develops, documents, and disseminates to all personnel:
                 1.   A system and communications protection policy that addresses purpose, scope, roles,
                      responsibilities, management commitment, coordination among organizational entities, and
                      compliance; and
                 2.   Procedures to facilitate the implementation of the system and communications protection policy
                      and associated system and communications protection controls; and
          b.     Reviews and updates the current:
                 1.   System and communications protection policy at least annually if not otherwise defined in
                      formal organizational policy; and
                 2.   System and communications protection procedures at least annually if not otherwise defined in
                      formal organizational policy.
          Supplemental Guidance: This control addresses the establishment of policy and procedures for the effective
          implementation of selected security controls and control enhancements in the SC family. Policy and
          procedures reflect applicable federal laws, Executive Orders, directives, regulations, policies, standards,
          and guidance. Security program policies and procedures at the organization level may make the need for
          system-specific policies and procedures unnecessary. The policy can be included as part of the general
          information security policy for organizations or conversely, can be represented by multiple policies
          reflecting the complex nature of certain organizations. The procedures can be established for the security
          program in general and for particular information systems, if needed. The organizational risk management
          strategy is a key factor in establishing policy and procedures. Related control: PM-9.
               DoD SAP-specific policy and procedures related to system and communications protection
               are defined in the remainder of this section.
          Control Enhancements: None.

          References: NIST Special Publications 800-12, 800-100.
SC-2      APPLICATION PARTITIONING

          Control: The information system separates user functionality (including user interface services) from
          information system management functionality.
          Supplemental Guidance: Information system management functionality includes, for example, functions
          necessary to administer databases, network components, workstations, or servers, and typically requires
          privileged user access. The separation of user functionality from information system management
          functionality is either physical or logical. Organizations implement separation of system management-
          related functionality from user functionality by using different computers, different central processing
          units, different instances of operating systems, different network addresses, virtualization techniques, or
          combinations of these or other methods, as appropriate. This type of separation includes, for example, web
          administrative interfaces that use separate authentication methods for users of any other information system
          resources. Separation of system and user functionality may include isolating administrative interfaces on
          different domains and with additional access controls. Related controls: SA-4, SA-8, SC-3.
          Control Enhancements:
          (1)    APPLICATION PARTITIONING | INTERFACES FOR NON-PRIVILEGED USERS
                 The information system prevents the presentation of information system management-related functionality at an
                 interface for non-privileged users.
                 Supplemental Guidance: This control enhancement ensures that administration options (e.g.,
                 administrator privileges) are not available to general users (including prohibiting the use of the grey-

                 out option commonly used to eliminate accessibility to such information). Such restrictions include, for
                 example, not presenting administration options until users establish sessions with administrator
                 privileges. Related control: AC-3.
          References: None.

SC-3      SECURITY FUNCTION ISOLATION

          Control: The information system isolates security functions from nonsecurity functions.

          Supplemental Guidance: The information system isolates security functions from nonsecurity functions by
          means of an isolation boundary (implemented via partitions and domains). Such isolation controls access to
          and protects the integrity of the hardware, software, and firmware that perform those security functions.
          Information systems implement code separation (i.e., separation of security functions from nonsecurity
          functions) in a number of ways, including, for example, through the provision of security kernels via
          processor rings or processor modes. For non-kernel code, security function isolation is often achieved
          through file system protections that serve to protect the code on disk, and address space protections that
          protect executing code. Information systems restrict access to security functions through the use of access
          control mechanisms and by implementing least privilege capabilities. While the ideal is for all of the code
          within the security function isolation boundary to only contain security-relevant code, it is sometimes
          necessary to include nonsecurity functions within the isolation boundary as an exception. Related controls:
          AC-3, AC-6, SA-4, SA-5, SA-8, SA-13, SC-2, SC-7, SC-39.
               Security function isolation includes, but is not limited to, audit daemons, host-based
               firewalls, anti-virus or filtering functions, and account management.
          Control Enhancements:
          (1)    SECURITY FUNCTION ISOLATION | HARDWARE SEPARATION
                 The information system utilizes underlying hardware separation mechanisms to implement security function isolation.
                 Supplemental Guidance: Underlying hardware separation mechanisms include, for example, hardware
                 ring architectures, commonly implemented within microprocessors, and hardware-enforced address
                 segmentation used to support logically distinct storage objects with separate attributes (i.e., readable,
                 writeable).
          (2)    SECURITY FUNCTION ISOLATION | ACCESS / FLOW CONTROL FUNCTIONS
                 The information system isolates security functions enforcing access and information flow control from nonsecurity
                 functions and from other security functions.
                 Supplemental Guidance: Security function isolation occurs as a result of implementation; the functions
                 can still be scanned and monitored. Security functions that are potentially isolated from access and
                 flow control enforcement functions include, for example, auditing, intrusion detection, and anti-virus
                 functions.
          (3)    SECURITY FUNCTION ISOLATION | MINIMIZE NONSECURITY FUNCTIONALITY
                 The organization minimizes the number of nonsecurity functions included within the isolation boundary containing
                 security functions.
                 Supplemental Guidance: In those instances where it is not feasible to achieve strict isolation of
                 nonsecurity functions from security functions, it is necessary to take actions to minimize the
                 nonsecurity-relevant functions within the security function boundary. Nonsecurity functions contained
                 within the isolation boundary are considered security-relevant because errors or maliciousness in such
                 software, by virtue of being within the boundary, can impact the security functions of organizational
                 information systems. The design objective is that the specific portions of information systems
                 providing information security are of minimal size/complexity. Minimizing the number of nonsecurity
                 functions in the security-relevant components of information systems allows designers and
                 implementers to focus only on those functions which are necessary to provide the desired security
                 capability (typically access enforcement). By minimizing nonsecurity functions within the isolation
                 boundaries, the amount of code that must be trusted to enforce security policies is reduced, thus
                 contributing to understandability.

          (4)    SECURITY FUNCTION ISOLATION | MODULE COUPLING AND COHESIVENESS
                 The organization implements security functions as largely independent modules that maximize internal cohesiveness
                 within modules and minimize coupling between modules.
                 Supplemental Guidance: The reduction in inter-module interactions helps to constrain security functions
                 and to manage complexity. The concepts of coupling and cohesion are important with respect to
                 modularity in software design. Coupling refers to the dependencies that one module has on other
                 modules. Cohesion refers to the relationship between the different functions within a particular
                 module. Good software engineering practices rely on modular decomposition, layering, and
                 minimization to reduce and manage complexity, thus producing software modules that are highly
                 cohesive and loosely coupled.
          (5)    SECURITY FUNCTION ISOLATION | LAYERED STRUCTURES
                 The organization implements security functions as a layered structure minimizing interactions between layers of the
                 design and avoiding any dependence by lower layers on the functionality or correctness of higher layers.
                 Supplemental Guidance: The implementation of layered structures with minimized interactions among
                 security functions and non-looping layers (i.e., lower-layer functions do not depend on higher-layer
                 functions) further enables the isolation of security functions and management of complexity.
          References: None.

SC-4      INFORMATION IN SHARED RESOURCES

          Control: The information system prevents unauthorized and unintended information transfer via shared
          system resources.
          Supplemental Guidance: This control prevents information, including encrypted representations of
          information, produced by the actions of prior users/roles (or the actions of processes acting on behalf of
          prior users/roles) from being available to any current users/roles (or current processes) that obtain access to
          shared system resources (e.g., registers, main memory, hard disks) after those resources have been released
          back to information systems. The control of information in shared resources is also commonly referred to
          as object reuse and residual information protection. This control does not address: (i) information
          remanence which refers to residual representation of data that has been nominally erased or removed; (ii)
          covert channels (including storage and/or timing channels) where shared resources are manipulated to
          violate information flow restrictions; or (iii) components within information systems for which there are
          only single users/roles. Related controls: AC-3, AC-4, MP-6.
               See PE-5 for KVM guidance.
          Control Enhancements:
          (1)    INFORMATION IN SHARED RESOURCES | SECURITY LEVELS
                 [Withdrawn: Incorporated into SC-4].
          (2)    INFORMATION IN SHARED RESOURCES | PERIODS PROCESSING
                 The information system prevents unauthorized information transfer via shared resources in accordance with
                 [Assignment: organization-defined procedures] when system processing explicitly switches between different
                 information classification levels or security categories.
                 Supplemental Guidance: This control enhancement applies when there are explicit changes in
                 information processing levels during information system operations, for example, during multilevel
                 processing and periods processing with information at different classification levels or security
                 categories. Organization-defined procedures may include, for example, approved sanitization processes
                 for electronically stored information.
          References: None.

SC-5      DENIAL OF SERVICE PROTECTION

          Control: The information system protects against or limits the effects of the following types of denial of
          service attacks: [Assignment: organization-defined types of denial of service attacks or reference to source
          for such information] by employing [Assignment: organization-defined security safeguards].

          Supplemental Guidance: A variety of technologies exist to limit, or in some cases, eliminate the effects of
          denial of service attacks. For example, boundary protection devices can filter certain types of packets to
          protect information system components on internal organizational networks from being directly affected by
          denial of service attacks. Employing increased capacity and bandwidth combined with service redundancy
          may also reduce the susceptibility to denial of service attacks. Related controls: SC-6, SC-7.
          Control Enhancements:
          (1)   DENIAL OF SERVICE PROTECTION | RESTRICT INTERNAL USERS
                The information system restricts the ability of individuals to launch [Assignment: organization-defined denial of
                service attacks] against other information systems.
                Supplemental Guidance: Restricting the ability of individuals to launch denial of service attacks requires
                that the mechanisms used for such attacks are unavailable. Individuals of concern can include, for
                example, hostile insiders or external adversaries that have successfully breached the information
                system and are using the system as a platform to launch cyber attacks on third parties. Organizations
                can restrict the ability of individuals to connect and transmit arbitrary information on the transport
                medium (i.e., network, wireless spectrum). Organizations can also limit the ability of individuals to use
                excessive information system resources. Protection against individuals having the ability to launch
                denial of service attacks may be implemented on specific information systems or on boundary devices
                prohibiting egress to potential target systems.
          (2)   DENIAL OF SERVICE PROTECTION | EXCESS CAPACITY / BANDWIDTH / REDUNDANCY
                The information system manages excess capacity, bandwidth, or other redundancy to limit the effects of information
                flooding denial of service attacks.
                Supplemental Guidance: Managing excess capacity ensures that sufficient capacity is available to
                counter flooding attacks. Managing excess capacity may include, for example, establishing selected
                usage priorities, quotas, or partitioning.
          (3)   DENIAL OF SERVICE PROTECTION | DETECTION / MONITORING
                The organization:
                (a)   Employs [Assignment: organization-defined monitoring tools] to detect indicators of denial of service attacks
                      against the information system; and
                (b)   Monitors [Assignment: organization-defined information system resources] to determine if sufficient resources
                      exist to prevent effective denial of service attacks.
                Supplemental Guidance: Organizations consider utilization and capacity of information system resources
                when managing risk from denial of service due to malicious attacks. Denial of service attacks can
                originate from external or internal sources. Information system resources sensitive to denial of service
                include, for example, physical disk storage, memory, and CPU cycles. Common safeguards to prevent
                denial of service attacks related to storage utilization and capacity include, for example, instituting disk
                quotas, configuring information systems to automatically alert administrators when specific storage
                capacity thresholds are reached, using file compression technologies to maximize available storage
                space, and imposing separate partitions for system and user data. Related controls: CA-7, SI-4.
          References: None.

SC-6      RESOURCE AVAILABILITY

          Control: The information system protects the availability of resources by allocating [Assignment:
          organization-defined resources] by [Selection (one or more); priority; quota; [Assignment: organization-
          defined security safeguards]].
          Supplemental Guidance: Priority protection helps prevent lower-priority processes from delaying or
          interfering with the information system servicing any higher-priority processes. Quotas prevent users or
          processes from obtaining more than predetermined amounts of resources. This control does not apply to
          information system components for which there are only single users/roles.
          Control Enhancements: None.

          References: None.

SC-7      BOUNDARY PROTECTION

          Control: The information system:

          a.       Monitors and controls communications at the external boundary of the system and at key internal
                   boundaries within the system;
          b.       Implements subnetworks for publicly accessible system components that are [Selection: physically;
                   logically] separated from internal organizational networks; and
          c.       Connects to external networks or information systems only through managed interfaces consisting of
                   boundary protection devices arranged in accordance with an organizational security architecture.
          Supplemental Guidance: Managed interfaces include, for example, gateways, routers, firewalls, guards,
          network-based malicious code analysis and virtualization systems, or encrypted tunnels implemented
          within a security architecture (e.g., routers protecting firewalls or application gateways residing on
          protected subnetworks). Subnetworks that are physically or logically separated from internal networks are
          referred to as demilitarized zones or DMZs. Restricting or prohibiting interfaces within organizational
          information systems includes, for example, restricting external web traffic to designated web servers within
          managed interfaces and prohibiting external traffic that appears to be spoofing internal addresses.
          Organizations consider the shared nature of commercial telecommunications services in the implementation
          of security controls associated with the use of such services. Commercial telecommunications services are
          commonly based on network components and consolidated management systems shared by all attached
          commercial customers, and may also include third party-provided access lines and other service elements.
          Such transmission services may represent sources of increased risk despite contract security provisions.
          Related controls: AC-4, AC-17, CA-3, CM-7, CP-8, IR-4, RA-3, SC-5, SC-13.
               This requirement also applies to ports, protocols, and services.
               Information systems, in conjunction with the environment in which they are installed, shall:
               •    Provide for remote access only for an authorized, specific purpose (for example, to
                    provide email access for a guest agency’s employee via a VPN). The remote connection
                    must be restricted to approved purposes. Authorized remote access shall not enable the
                    user to communicate as an extension of the IS or to communicate with local resources
                    such as a printer or file server unless explicitly authorized by the AO.
               •    Route specific internal communications traffic through authenticated proxy servers
                    within the managed interfaces of boundary protection devices, (e.g., as defined in DoDI
                    8551.1, Ports, Protocols, and Services Management (PPSM), and DISA STIGs), to
                    external networks (i.e., networks outside the control of the organization). The list of
                    traffic to be routed through managed interfaces may be augmented with service/agency
                    or site-specific requirements and approved by the AO or designee.
               •    Use private/non-publicly routable IP addresses for isolated LANs.
               •    Host-based boundary protection mechanisms shall be employed on mobile devices, (e.g.,
                    notebook/laptop computers and other types of mobile devices) where boundary
                    protection mechanisms are available. This typically applies when your internal network
                    has classification or access levels that differ.
          Control Enhancements:
          (1)      BOUNDARY PROTECTION | PHYSICALLY SEPARATED SUBNETWORKS
                   [Withdrawn: Incorporated into SC-7].
          (2)      BOUNDARY PROTECTION | PUBLIC ACCESS
                   [Withdrawn: Incorporated into SC-7].
          (3)      BOUNDARY PROTECTION | ACCESS POINTS
                   The organization limits the number of external network connections to the information system.

                Supplemental Guidance: Limiting the number of external network connections facilitates more
                comprehensive monitoring of inbound and outbound communications traffic. The Trusted Internet
                Connection (TIC) initiative is an example of limiting the number of external network connections.
          (4)   BOUNDARY PROTECTION | EXTERNAL TELECOMMUNICATIONS SERVICES
                The organization:
                (a)   Implements a managed interface for each external telecommunication service;
                (b) Establishes a traffic flow policy for each managed interface;
                (c)   Protects the confidentiality and integrity of the information being transmitted across each interface;
                (d) Documents each exception to the traffic flow policy with a supporting mission/business need and duration of
                    that need; and
                (e)   Reviews exceptions to the traffic flow policy [Assignment: organization-defined frequency] and removes
                      exceptions that are no longer supported by an explicit mission/business need.

                Supplemental Guidance: Related control: SC-8.
          (5)   BOUNDARY PROTECTION | DENY BY DEFAULT / ALLOW BY EXCEPTION
                The information system at managed interfaces denies network communications traffic by default and allows network
                communications traffic by exception (i.e., deny all, permit by exception).
                Supplemental Guidance: This control enhancement applies to both inbound and outbound network
                communications traffic. A deny-all, permit-by-exception network communications traffic policy
                ensures that only those connections which are essential and approved are allowed.
          (6)   BOUNDARY PROTECTION | RESPONSE TO RECOGNIZED FAILURES
                [Withdrawn: Incorporated into SC-7 (18)].
          (7)   BOUNDARY PROTECTION | PREVENT SPLIT TUNNELING FOR REMOTE DEVICES
                The information system, in conjunction with a remote device, prevents the device from simultaneously establishing
                non-remote connections with the system and communicating via some other connection to resources in external
                networks.
                Supplemental Guidance: This control enhancement is implemented within remote devices (e.g., notebook
                computers) through configuration settings to disable split tunneling in those devices, and by preventing
                those configuration settings from being readily configurable by users. This control enhancement is
                implemented within the information system by the detection of split tunneling (or of configuration
                settings that allow split tunneling) in the remote device, and by prohibiting the connection if the remote
                device is using split tunneling. Split tunneling might be desirable by remote users to communicate with
                local information system resources such as printers/file servers. However, split tunneling would in
                effect allow unauthorized external connections, making the system more vulnerable to attack and to
                exfiltration of organizational information. The use of VPNs for remote connections, when adequately
                provisioned with appropriate security controls, may provide the organization with sufficient assurance
                that it can effectively treat such connections as non-remote connections from the confidentiality and
                integrity perspective. VPNs thus provide a means for allowing non-remote communications paths from
                remote devices. The use of an adequately provisioned VPN does not eliminate the need for preventing
                split tunneling.
          (8)   BOUNDARY PROTECTION | ROUTE TRAFFIC TO AUTHENTICATED PROXY SERVERS
                The information system routes [Assignment: organization-defined internal communications traffic] to [Assignment:
                organization-defined external networks] through authenticated proxy servers at managed interfaces.
                Supplemental Guidance: External networks are networks outside of organizational control. A proxy
                server is a server (i.e., information system or application) that acts as an intermediary for clients
                requesting information system resources (e.g., files, connections, web pages, or services) from other
                organizational servers. Client requests established through an initial connection to the proxy server are
                evaluated to manage complexity and to provide additional protection by limiting direct connectivity.
                Web content filtering devices are one of the most common proxy servers providing access to the
                Internet. Proxy servers support logging individual Transmission Control Protocol (TCP) sessions and
                blocking specific Uniform Resource Locators (URLs), domain names, and Internet Protocol (IP)
                addresses. Web proxies can be configured with organization-defined lists of authorized and
                unauthorized websites. Related controls: AC-3, AU-2.

          (9)   BOUNDARY PROTECTION | RESTRICT THREATENING OUTGOING COMMUNICATIONS TRAFFIC
                The information system:
                (a)   Detects and denies outgoing communications traffic posing a threat to external information systems; and
                (b) Audits the identity of internal users associated with denied communications.
                Supplemental Guidance: Detecting outgoing communications traffic from internal actions that may pose
                threats to external information systems is sometimes termed extrusion detection. Extrusion detection at
                information system boundaries as part of managed interfaces includes the analysis of incoming and
                outgoing communications traffic searching for indications of internal threats to the security of external
                systems. Such threats include, for example, traffic indicative of denial of service attacks and traffic
                containing malicious code. Related controls: AU-2, AU-6, SC-38, SC-44, SI-3, SI-4.
          (10) BOUNDARY PROTECTION | PREVENT UNAUTHORIZED EXFILTRATION
                The organization prevents the unauthorized exfiltration of information across managed interfaces.
                Supplemental Guidance: Safeguards implemented by organizations to prevent unauthorized exfiltration
                of information from information systems include, for example: (i) strict adherence to protocol formats;
                (ii) monitoring for beaconing from information systems; (iii) monitoring for steganography; (iv)
                disconnecting external network interfaces except when explicitly needed; (v) disassembling and
                reassembling packet headers; and (vi) employing traffic profile analysis to detect deviations from the
                volume/types of traffic expected within organizations or call backs to command and control centers.
                Devices enforcing strict adherence to protocol formats include, for example, deep packet inspection
                firewalls and XML gateways. These devices verify adherence to protocol formats and specification at
                the application layer and serve to identify vulnerabilities that cannot be detected by devices operating
                at the network or transport layers. This control enhancement is closely associated with cross-domain
                solutions and system guards enforcing information flow requirements. Related control: SI-3.
          (11) BOUNDARY PROTECTION | RESTRICT INCOMING COMMUNICATIONS TRAFFIC
                The information system only allows incoming communications from [Assignment: organization-defined authorized
                sources] routed to [Assignment: organization-defined authorized destinations].
                Supplemental Guidance: This control enhancement provides determinations that source and destination
                address pairs represent authorized/allowed communications. Such determinations can be based on
                several factors including, for example, the presence of source/destination address pairs in lists of
                authorized/allowed communications, the absence of address pairs in lists of unauthorized/disallowed
                pairs, or meeting more general rules for authorized/allowed source/destination pairs. Related control:
                AC-3.
          (12) BOUNDARY PROTECTION | HOST-BASED PROTECTION
                The organization implements [Assignment: organization-defined host-based boundary protection mechanisms] at
                [Assignment: organization-defined information system components].
                Supplemental Guidance: Host-based boundary protection mechanisms include, for example, host-based
                firewalls. Information system components employing host-based boundary protection mechanisms
                include, for example, servers, workstations, and mobile devices.
          (13) BOUNDARY PROTECTION | ISOLATION OF SECURITY TOOLS / MECHANISMS / SUPPORT COMPONENTS
                The organization isolates [at a minimum, vulnerability scanning tools, audit log servers, patch servers, and CND tools
                ] from other internal information system components by implementing physically separate subnetworks with
                managed interfaces to other components of the system.
                Supplemental Guidance: Physically separate subnetworks with managed interfaces are useful, for
                example, in isolating computer network defenses from critical operational processing networks to
                prevent adversaries from discovering the analysis and forensics techniques of organizations. Related
                controls: SA-8, SC-2, SC-3.
          (14) BOUNDARY PROTECTION | PROTECTS AGAINST UNAUTHORIZED PHYSICAL CONNECTIONS
                The organization protects against unauthorized physical connections at any managed interface that crosses
                security domains or connects to an external network; such as but not limited to: cross domain solutions, a
                network boundary with a WAN, a partner network, or the Internet.
                Supplemental Guidance: Information systems operating at different security categories or classification
                levels may share common physical and environmental controls, since the systems may share space
                within organizational facilities. In practice, it is possible that these separate information systems may

               share common equipment rooms, wiring closets, and cable distribution paths. Protection against
               unauthorized physical connections can be achieved, for example, by employing clearly identified and
               physically separated cable trays, connection frames, and patch panels for each side of managed
               interfaces with physical access controls enforcing limited authorized access to these items. Related
               controls: PE-4, PE-19.
                Reference also SC-8.
          (15) BOUNDARY PROTECTION | ROUTE PRIVILEGED NETWORK ACCESSES
               The information system routes all networked, privileged accesses through a dedicated, managed interface for
               purposes of access control and auditing.
               Supplemental Guidance: Related controls: AC-2, AC-3, AU-2, SI-4.
          (16) BOUNDARY PROTECTION | PREVENT DISCOVERY OF COMPONENTS / DEVICES
               The information system prevents discovery of specific system components composing a managed interface.
               Supplemental Guidance: This control enhancement protects network addresses of information system
               components that are part of managed interfaces from discovery through common tools and techniques
               used to identify devices on networks. Network addresses are not available for discovery (e.g., network
               address not published or entered in domain name systems), requiring prior knowledge for access.
               Another obfuscation technique is to periodically change network addresses.
          (17) BOUNDARY PROTECTION | AUTOMATED ENFORCEMENT OF PROTOCOL FORMATS
               The information system enforces adherence to protocol formats.
               Supplemental Guidance: Information system components that enforce protocol formats include, for
               example, deep packet inspection firewalls and XML gateways. Such system components verify
               adherence to protocol formats/specifications (e.g., IEEE) at the application layer and identify
               significant vulnerabilities that cannot be detected by devices operating at the network or transport
               layers. Related control: SC-4.
          (18) BOUNDARY PROTECTION | FAIL SECURE
               The information system fails securely in the event of an operational failure of a boundary protection device.
               Supplemental Guidance: Fail secure is a condition achieved by employing information system
               mechanisms to ensure that in the event of operational failures of boundary protection devices at
               managed interfaces (e.g., routers, firewalls, guards, and application gateways residing on protected
               subnetworks commonly referred to as demilitarized zones), information systems do not enter into
               unsecure states where intended security properties no longer hold. Failures of boundary protection
               devices cannot lead to, or cause information external to the devices to enter the devices, nor can
               failures permit unauthorized information releases. Related controls: CP-2, SC-24.
          (19) BOUNDARY PROTECTION | BLOCKS COMMUNICATION FROM NON-ORGANIZATIONALLY CONFIGURED HOSTS
               The information system blocks both inbound and outbound communications traffic between [Assignment:
               organization-defined communication clients] that are independently configured by end users and external service
               providers.
               Supplemental Guidance: Communication clients independently configured by end users and external
               service providers include, for example, instant messaging clients. Traffic blocking does not apply to
               communication clients that are configured by organizations to perform authorized functions.
          (20) BOUNDARY PROTECTION | DYNAMIC ISOLATION / SEGREGATION
               The information system provides the capability to dynamically isolate/segregate [Assignment: organization-defined
               information system components] from other components of the system.
               Supplemental Guidance: The capability to dynamically isolate or segregate certain internal components
               of organizational information systems is useful when it is necessary to partition or separate certain
               components of dubious origin from those components possessing greater trustworthiness. Component
               isolation reduces the attack surface of organizational information systems. Isolation of selected
               information system components is also a means of limiting the damage from successful cyber attacks
               when those attacks occur.
          (21) BOUNDARY PROTECTION | ISOLATION OF INFORMATION SYSTEM COMPONENTS
               The organization employs boundary protection mechanisms to separate [Assignment: organization-defined
               information system components] supporting [Assignment: organization-defined missions and/or business functions].

                 Supplemental Guidance: Organizations can isolate information system components performing different
                 missions and/or business functions. Such isolation limits unauthorized information flows among
                 system components and also provides the opportunity to deploy greater levels of protection for selected
                 components. Separating system components with boundary protection mechanisms provides the
                 capability for increased protection of individual components and to more effectively control
                 information flows between those components. This type of enhanced protection limits the potential
                 harm from cyber attacks and errors. The degree of separation provided varies depending upon the
                 mechanisms chosen. Boundary protection mechanisms include, for example, routers, gateways, and
                 firewalls separating system components into physically separate networks or subnetworks, cross-
                 domain devices separating subnetworks, virtualization techniques, and encrypting information flows
                 among system components using distinct encryption keys. Related controls: CA-9, SC-3.
          (22) BOUNDARY PROTECTION | SEPARATE SUBNETS FOR CONNECTING TO DIFFERENT SECURITY DOMAINS
                 The information system implements separate network addresses (i.e., different subnets) to connect to systems in
                 different security domains.
                 Supplemental Guidance: Decomposition of information systems into subnets helps to provide the
                 appropriate level of protection for network connections to different security domains containing
                 information with different security categories or classification levels.
          (23) BOUNDARY PROTECTION | DISABLE SENDER FEEDBACK ON PROTOCOL VALIDATION FAILURE
                 The information system disables feedback to senders on protocol format validation failure.
                 Supplemental Guidance: Disabling feedback to senders when there is a failure in protocol validation
                 format prevents adversaries from obtaining information which would otherwise be unavailable.
          References: FIPS Publication 199; NIST Special Publications 800-41, 800-77.

SC-8      TRANSMISSION CONFIDENTIALITY AND INTEGRITY

           Control: The information system protects the confidentiality and integrity of transmitted information.

          Supplemental Guidance: This control applies to both internal and external networks and all types of
          information system components from which information can be transmitted (e.g., servers, mobile devices,
          notebook computers, printers, copiers, scanners, facsimile machines). Communication paths outside the
          physical protection of a controlled boundary are exposed to the possibility of interception and modification.
          Protecting the confidentiality and/or integrity of organizational information can be accomplished by
          physical means (e.g., by employing protected distribution systems) or by logical means (e.g., employing
          encryption techniques). Organizations relying on commercial providers offering transmission services as
          commodity services rather than as fully dedicated services (i.e., services which can be highly specialized to
          individual customer needs), may find it difficult to obtain the necessary assurances regarding the
          implementation of needed security controls for transmission confidentiality/integrity. In such situations,
          organizations determine what types of confidentiality/integrity services are available in standard,
          commercial telecommunication service packages. If it is infeasible or impractical to obtain the necessary
          security controls and assurances of control effectiveness through appropriate contracting vehicles,
          organizations implement appropriate compensating security controls or explicitly accept the additional risk.
          Related controls: AC-17, PE-4.
               This control prevents information from being modified at data aggregation or protocol
               transformation points, compromising the integrity of the information.
               Data traversing a network at a lower classification level shall be protected using NSA Type-1
               encryption. See DoDI 8523.01, Communications Security (COMSEC), for additional
               information regarding the protection of information during transmission.

               When more than one computer network exists within a SAPF, a color coding scheme shall be
               developed to assist in the proper handling of classified information. Color coding of cables
               may be met by any of the following:

               •         Purchasing/making cables with the proper color.
               •         Placing colored tape every five feet along the cable length.
               •         Wrapping tape around the length of the cable run.
               Table 3-3 provides a standard color scheme for typical non-SAP networks and shall not be
               used for SAP networks without AO or PSO approval. Additionally, cables processing
               information at the same classification level shall be bundled together in an orderly manner.
               All cabling must meet TEMPEST requirements.
                           Classification/Compartment/                                         Color
                           Handling Caveat
                           TS//SCI                                                             Yellow
                           TS//US Only                                                         Orange
                           S//US Only                                                          Red
                           U//FOUO                                                             Green
                                              Table 3-4: Network Cable Color Coding Scheme

               When networks are present other than those listed in Table 3-3, a different color must be
               selected for the network cables to assist in minimizing the risk to classified information
               systems. This includes SAP networks, even though they are associated with a specific
               classification level. Colors chosen should be in sharp contrast to colors already in use to
               easily ascertain the associated network in low light areas/conditions. The following
               systems/networks are examples of such situations where a different color, other than those
               specified in Table 3-3, must be selected:
                     • TS//SCI//SAR
                     • TS//SAR
                     • S//SAR
                     • Coalition/Releasable networks
               Reference PE-19 for Information Leakage.
          Control Enhancements:
          (1)      TRANSMISSION CONFIDENTIALITY AND INTEGRITY | CRYPTOGRAPHIC OR ALTERNATE PHYSICAL PROTECTION
                   The information system implements cryptographic mechanisms to prevent unauthorized disclosure of, and detect
                   changes to, information during transmission unless otherwise protected by alternative physical safeguards such
                   as keeping transmission within physical areas rated IAW the sensitivity of the information or within a
                   Protected Distribution System (PDS) when traversing areas not approved for the sensitivity of the
                   information.
                   Supplemental Guidance: Encrypting information for transmission protects information from unauthorized
                   disclosure and modification. Cryptographic mechanisms implemented to protect information integrity
                   include, for example, cryptographic hash functions which have common application in digital
                   signatures, checksums, and message authentication codes. Alternative physical security safeguards
                   include, for example, protected distribution systems. Related control: SC-13.
                    Transmission confidentiality applies not only to classified information, but to sensitive
                    unclassified as well. This includes, but is not limited to, such information as PII,
                    HVSACO, CUI, and FOUO. A protected distribution system (PDS) provides physical
                    protection for communications lines and can also provide need-to-know isolation. A
                    PDS must be used to transmit unencrypted classified information through an area of
                    lesser classification or control. For additional information, and where NIST referenced

                 National Security Telecommunications and Information Systems Security Instruction
                 (NSTISSI) No. 7003, see CNSSI 7003, Protective Distribution Systems.
          (2)   TRANSMISSION CONFIDENTIALITY AND INTEGRITY | PRE / POST TRANSMISSION HANDLING
                The information system maintains the [Selection (one or more): confidentiality; integrity] of information during
                preparation for transmission and during reception.
                Supplemental Guidance: Information can be either unintentionally or maliciously disclosed or modified
                during preparation for transmission or during reception including, for example, during aggregation, at
                protocol transformation points, and during packing/unpacking. These unauthorized disclosures or
                modifications compromise the confidentiality or integrity of the information. Related control: AU-10.
          (3)   TRANSMISSION CONFIDENTIALITY AND INTEGRITY | CRYPTOGRAPHIC PROTECTION FOR MESSAGE EXTERNALS
                The information system implements cryptographic mechanisms to protect message externals unless otherwise
                protected by [Assignment: organization-defined alternative physical safeguards].
                Supplemental Guidance: This control enhancement addresses protection against unauthorized disclosure
                of information. Message externals include, for example, message headers/routing information. This
                control enhancement prevents the exploitation of message externals and applies to both internal and
                external networks or links that may be visible to individuals who are not authorized users.
                Header/routing information is sometimes transmitted unencrypted because the information is not
                properly identified by organizations as having significant value or because encrypting the information
                can result in lower network performance and/or higher costs. Alternative physical safeguards include,
                for example, protected distribution systems. Related controls: SC-12, SC-13.
          (4)   TRANSMISSION CONFIDENTIALITY AND INTEGRITY | CONCEAL / RANDOMIZE COMMUNICATIONS
                The information system implements cryptographic mechanisms to conceal or randomize communication patterns
                unless otherwise protected by [Assignment: organization-defined alternative physical safeguards].
                Supplemental Guidance: This control enhancement addresses protection against unauthorized disclosure
                of information. Communication patterns include, for example, frequency, periods, amount, and
                predictability. Changes to communications patterns can reveal information having intelligence value
                especially when combined with other available information related to missions/business functions
                supported by organizational information systems. This control enhancement prevents the derivation of
                intelligence based on communications patterns and applies to both internal and external networks or
                links that may be visible to individuals who are not authorized users. Encrypting the links and
                transmitting in continuous, fixed/random patterns prevents the derivation of intelligence from the
                system communications patterns. Alternative physical safeguards include, for example, protected
                distribution systems. Related controls: SC-12, SC-13.
          References: FIPS Publications 140-2, 197; NIST Special Publications 800-52, 800-77, 800-81, 800-113;
          CNSS Policy 15; NSTISSI No. 7003.
SC-9      TRANSMISSION CONFIDENTIALITY
          [Withdrawn: Incorporated into SC-8].

SC-10     NETWORK DISCONNECT

          Control: The information system terminates the network connection associated with a communications
          session at the end of the session or after no more than one (1) hour of inactivity.
          Supplemental Guidance: This control applies to both internal and external networks. Terminating network
          connections associated with communications sessions include, for example, de-allocating associated
          TCP/IP address/port pairs at the operating system level, or de-allocating networking assignments at the
          application level if multiple application sessions are using a single, operating system-level network
          connection. Time periods of inactivity may be established by organizations and include, for example, time
          periods by type of network access or for specific network accesses.
          Control Enhancements: None.

          References: None.

SC-11     TRUSTED PATH

          Control: The information system establishes a trusted communications path between the user and the
          following security functions of the system: [Assignment: organization-defined security functions to include
          at a minimum, information system authentication and re-authentication].
          Supplemental Guidance: Trusted paths are mechanisms by which users (through input devices) can
          communicate directly with security functions of information systems with the requisite assurance to support
          information security policies. The mechanisms can be activated only by users or the security functions of
          organizational information systems. User responses via trusted paths are protected from modifications by or
          disclosure to untrusted applications. Organizations employ trusted paths for high-assurance connections
          between security functions of information systems and users (e.g., during system logons). Enforcement of
          trusted communications paths is typically provided via an implementation that meets the reference monitor
          concept. Related controls: AC-16, AC-25.
          Control Enhancements:
          (1)    TRUSTED PATH | LOGICAL ISOLATION
                 The information system provides a trusted communications path that is logically isolated and distinguishable from
                 other paths.

          References: None.

SC-12     CRYPTOGRAPHIC KEY ESTABLISHMENT AND MANAGEMENT

          Control: The organization establishes and manages cryptographic keys for required cryptography employed
          within the information system in accordance with NSA-approved key management technology and
          processes.
          Supplemental Guidance: Cryptographic key management and establishment can be performed using manual
          procedures or automated mechanisms with supporting manual procedures. Organizations define key
          management requirements in accordance with applicable federal laws, Executive Orders, directives,
          regulations, policies, standards, and guidance, specifying appropriate options, levels, and parameters.
          Organizations manage trust stores to ensure that only approved trust anchors are in such trust stores. This
          includes certificates with visibility external to organizational information systems and certificates related to
          the internal operations of systems. Related controls: SC-13, SC-17.
               Cryptographic keys include, but are not limited to those associated with bulk encryptors (e.g.,
               NSA-provided cryptographic equipment), PKI, and FIPS 140-2 approved encryption
               modules, and may be implemented via either hardware or software. In addition,
               organizations shall maintain availability of information, via key escrow, in the event of the
               loss of cryptographic keys.
          Control Enhancements:
          (1)    CRYPTOGRAPHIC KEY ESTABLISHMENT AND MANAGEMENT | AVAILABILITY
                 The organization maintains availability of information in the event of the loss of cryptographic keys by users.
                 Supplemental Guidance: Escrowing of encryption keys is a common practice for ensuring availability in
                 the event of loss of keys (e.g., due to forgotten passphrase).
          (2)    CRYPTOGRAPHIC KEY ESTABLISHMENT AND MANAGEMENT | SYMMETRIC KEYS
                 The organization produces, controls, and distributes symmetric cryptographic keys using [Selection: NIST FIPS-
                 compliant; NSA-approved] key management technology and processes.
          (3)    CRYPTOGRAPHIC KEY ESTABLISHMENT AND MANAGEMENT | ASYMMETRIC KEYS
                 The organization produces, controls, and distributes asymmetric cryptographic keys using [Selection: NSA-approved
                 key management technology and processes; approved PKI Class 3 certificates or prepositioned keying material;
                 approved PKI Class 3 or Class 4 certificates and hardware security tokens that protect the user’s private key].
          (4)    CRYPTOGRAPHIC KEY ESTABLISHMENT AND MANAGEMENT | PKI CERTIFICATES
                 [Withdrawn: Incorporated into SC-12].
          (5)    CRYPTOGRAPHIC KEY ESTABLISHMENT AND MANAGEMENT | PKI CERTIFICATES / HARDWARE TOKENS
                 [Withdrawn: Incorporated into SC-12].

          References: NIST Special Publications 800-56, 800-57.

SC-13     CRYPTOGRAPHIC PROTECTION

          Control: The information system implements NSA-approved cryptography for protecting classified
          information from access by personnel who lack the necessary security clearance in accordance with
          applicable federal laws, Executive Orders, directives, policies, regulations, and standards.
          Supplemental Guidance: Cryptography can be employed to support a variety of security solutions including,
          for example, the protection of classified and Controlled Unclassified Information, the provision of digital
          signatures, and the enforcement of information separation when authorized individuals have the necessary
          clearances for such information but lack the necessary formal access approvals. Cryptography can also be
          used to support random number generation and hash generation. Generally applicable cryptographic
          standards include FIPS-validated cryptography and NSA-approved cryptography. This control does not
          impose any requirements on organizations to use cryptography. However, if cryptography is required based
          on the selection of other security controls, organizations define each type of cryptographic use and the type
          of cryptography required (e.g., protection of classified information: NSA-approved cryptography; provision
          of digital signatures: FIPS-validated cryptography). Related controls: AC-2, AC-3, AC-7, AC-17, AC-18,
          AU-9, AU-10, CM-11, CP-9, IA-3, IA-7, MA-4, MP-2, MP-4, MP-5, SA-4, SC-8, SC-12, SC-28, SI-7.
               NIST FIPS-compliant cryptography shall be used to protect controlled unclassified
               information (CUI). To protect classified information and U//HVSACO, see SC-8
               for transmission and SC-28 for information at rest.
               For information systems with an integrity impact level of moderate or high, FIPS-validated
               (e.g., FIPS 140-2) or NSA-approved cryptography shall be used, as appropriate, to
               implement digital signatures. This capability may be provided via either hardware or
               software.
          Control Enhancements: None.
          (1)    CRYPTOGRAPHIC PROTECTION | FIPS-VALIDATED CRYPTOGRAPHY
                 [Withdrawn: Incorporated into SC-13].
          (2)    CRYPTOGRAPHIC PROTECTION | NSA-APPROVED CRYPTOGRAPHY
                 [Withdrawn: Incorporated into SC-13].
          (3)    CRYPTOGRAPHIC PROTECTION | INDIVIDUALS WITHOUT FORMAL ACCESS APPROVALS
                 [Withdrawn: Incorporated into SC-13].
          (4)    CRYPTOGRAPHIC PROTECTION | DIGITAL SIGNATURES
                 [Withdrawn: Incorporated into SC-13].

          References: FIPS Publication 140; NIST Special Publication 800-171; Web: http://csrc.nist.gov/cryptval,
          http://www.cnss.gov.

SC-14     PUBLIC ACCESS PROTECTIONS
          [Withdrawn: Capability provided by AC-2, AC-3, AC-5, AC-6, SI-3, SI-4, SI-5, SI-7, SI-10].

SC-15     COLLABORATIVE COMPUTING DEVICES

          Control: The information system:

          a.     Prohibits remote activation of collaborative computing devices with the following exceptions:
                 [Assignment: organization-defined exceptions where remote activation is to be allowed]; and
          b.     Provides an explicit indication of use to users physically present at the devices.
          Supplemental Guidance: Collaborative computing devices include, for example, networked white boards,
          cameras, and microphones. Explicit indication of use includes, for example, signals to users when
          collaborative computing devices are activated. Related control: AC-21.

               Collaborative computing devices include, but are not limited to, VTC, VoIP telephones,
               VVoIP, networked white boards, video cameras, and microphones. All collaborative
               computing devices must be approved by the AO prior to purchase. In addition, all
               collaborative computing equipment, whether connected to SAP, collateral, or unclassified
               information systems or networks located in SAPFs must be approved by the PSO prior to
               introduction into the facility. Collaborative computing devices connecting to unclassified
               information systems within SAPFs are not recommended.
               Any multi-classification collaborative computing devices, VTC or like systems that have
               video and/or audio capability integrated into one system must be previously evaluated by the
               appropriate Service SAP CTTA.
               Collaborative Computing Device Use
               The following requirements apply to the use of all collaborative computing devices,
               regardless of whether they are used on SCI, SAP, collateral classified, or unclassified
               networks or systems.
                   •   Collaborative computing devices shall not be remotely activated –no exceptions, nor
                       may they invoke auto-answer capabilities that automatically activate the video and
                       audio recording/transmitting devices. [SC-15.a] Activation of collaborative
                       computing devices requires an explicit action by the user (e.g., in the case of a VTC,
                       the user is required to explicitly turn on the camera, speaker, and microphone) and an
                       explicit indication that the equipment is in use and active. [SC-15.b] Remote
                       activation of a camera or microphone is prohibited, i.e., the auto-answer feature shall
                       be disabled.
                   •   Collaborative computing devices that provide video and/or audio conference
                       capabilities shall provide a clearly visible indication that the video and audio
                       mechanisms are operating to alert personnel in the facility when a collaborative
                       computing session is in progress.
                   •   Camera lenses shall be covered with an opaque covering when the camera is not in
                       use. No systems, documents, or media of higher classification may be displayed or
                       in view of the camera.
                   •   Microphones must have a mute or hold capability (e.g., on/off switch) and should
                       have a push-to-talk button (implemented in hardware or software) when the
                       sensitivity of the collaborative session and environments can differ.
                   •   While conducting a collaborative computing session, users shall take all reasonable
                       measures to ensure that no unintended information is made audible or visible via the
                       collaborative computing device. Users shall advise all personnel in the immediate
                       area that the collaborative computing device will be operating and shall sanitize all
                       sensitive material/systems that may be in view of the collaborative computing
                       device.
                   •    Users shall not leave the collaborative computing device unattended while a session
                        is in progress. Once the collaborative session is completed, the user shall take
                        explicit action to disconnect/terminate the collaborative computing device.
               In addition to the above, the following additional requirements apply to all collaborative
               computing devices used on collateral classified or unclassified networks or systems:
                   •   Desktop level collaborative computing devices may use external loud
                       speakers/amplified sound only if they are installed within a closed room with walls

                      that meet the requirement of the PSO, otherwise a headset must be used.
                 •    Microphones must be used in such a way to ensure no unintended conversations are
                      picked up and transmitted outside the facility. This may be accomplished by using
                      microphones in enclosed offices, or by ensuring no other higher classified
                      discussions occur in the area when the microphone is in use.
                 •    Personnel within the facility shall be notified when a camera or microphone is in use.
          Control Enhancements:
          (1)   COLLABORATIVE COMPUTING DEVICES | PHYSICAL DISCONNECT
                The information system provides physical disconnect of collaborative computing devices in a manner that supports
                ease of use.
                Supplemental Guidance: Failing to physically disconnect from collaborative computing devices can
                result in subsequent compromises of organizational information. Providing easy methods to physically
                disconnect from such devices after a collaborative computing session helps to ensure that participants
                actually carry out the disconnect activity without having to go through complex and tedious
                procedures.
          (2)   COLLABORATIVE COMPUTING DEVICES | BLOCKING INBOUND / OUTBOUND COMMUNICATIONS TRAFFIC
                [Withdrawn: Incorporated into SC-7].
          (3)   COLLABORATIVE COMPUTING DEVICES | DISABLING / REMOVAL IN SECURE WORK AREAS
                The organization disables or removes collaborative computing devices from [Assignment: organization-defined
                information systems or information system components] in [Assignment: organization-defined secure work areas].
                Supplemental Guidance: Failing to disable or remove collaborative computing devices from information
                systems or information system components can result in subsequent compromises of organizational
                information including, for example, eavesdropping on conversations.
          (4)   COLLABORATIVE COMPUTING DEVICES | EXPLICITLY INDICATE CURRENT PARTICIPANTS
                The information system provides an explicit indication of current participants in [Assignment: organization-defined
                online meetings and teleconferences].
                Supplemental Guidance: This control enhancement helps to prevent unauthorized individuals from
                participating in collaborative computing sessions without the explicit knowledge of other participants.
          References: None.

SC-16     TRANSMISSION OF SECURITY ATTRIBUTES

          Control: The information system associates [Assignment: organization-defined security attributes] with
          information exchanged between information systems and between system components.
          Supplemental Guidance: Security attributes can be explicitly or implicitly associated with the information
          contained in organizational information systems or system components. Related controls: AC-3, AC-4, AC-
          16.
          Control Enhancements:
          (1)   TRANSMISSION OF SECURITY ATTRIBUTES | INTEGRITY VALIDATION
                The information system validates the integrity of transmitted security attributes.
                Supplemental Guidance: This control enhancement ensures that the verification of the integrity of
                transmitted information includes security attributes. Related controls: AU-10, SC-8.
          References: None.

SC-17     PUBLIC KEY INFRASTRUCTURE CERTIFICATES

          Control: The organization issues public key certificates under an [Assignment: organization-defined
          certificate policy] or obtains public key certificates from an approved service provider.
          Supplemental Guidance: For all certificates, organizations manage information system trust stores to ensure
          only approved trust anchors are in the trust stores. This control addresses both certificates with visibility

          external to organizational information systems and certificates related to the internal operations of systems,
          for example, application-specific time services. Related control: SC-12.
          Control Enhancements: None.

          References: OMB Memorandum 05-24; NIST Special Publications 800-32, 800-63.

SC-18     MOBILE CODE

          Control: The organization:

          a.     Defines acceptable and unacceptable mobile code and mobile code technologies;
          b.     Establishes usage restrictions and implementation guidance for acceptable mobile code and mobile
                 code technologies; and
          c.     Authorizes, monitors, and controls the use of mobile code within the information system.
          Supplemental Guidance: Decisions regarding the employment of mobile code within organizational
          information systems are based on the potential for the code to cause damage to the systems if used
          maliciously. Mobile code technologies include, for example, Java, JavaScript, ActiveX, Postscript, PDF,
          Shockwave movies, Flash animations, and VBScript. Usage restrictions and implementation guidance
          apply to both the selection and use of mobile code installed on servers and mobile code downloaded and
          executed on individual workstations and devices (e.g., smart phones). Mobile code policy and procedures
          address preventing the development, acquisition, or introduction of unacceptable mobile code within
          organizational information systems. Related controls: AU-2, AU-12, CM-2, CM-6, SI-3.
               Mobile code is software obtained from remote systems outside the system authorization
               boundary, transferred across a network, and then downloaded and executed on a local system
               (e.g., a computer with a web browser) without explicit installation or execution by the
               recipient. ‘Transferred across a network’ includes transfers via media, aka sneakernet.
               SC-18 is addressed at the highest level by indicating the use or prohibition of mobile code.
               Mobile code is frequently used even on isolated LANs by the software used to manage
               systems, e.g., ePolicy orchestrator (the HBSS management tool) uses JAVA for loading its
               management console; other software may use .Net Framework. sdf

               The risks to closed restricted networks and isolated LANs are vastly different than the Global
               Information Grid (GIG) therefore the mitigations required to address (b) and (c) statements
               of the control as well as the enhancements should be vastly easier to outline and enumerate.

               Potential options for indicating how this control is implemented may include one of the
               following examples:
                   • The following are the acceptable uses of mobile code within the system:
                       (List known web services on the system that utilize mobile code)
                       HBSS Management website: Java.
                   • The HBSS Management console is DAC’d to sysadmin/IA users only.
                   • Requests for new mobile code is restricted and must be approved IAW the software
                       approval process (Other than new development this is the most likely way to
                       introduce new mobile code to an isolated network. On systems where mobile code
                       or other software is being developed, typically there is a software approval process
                       that discusses how development is done on the system and how integrity of code and
                       subsequent code libraries is verified.)

               Mobile code technologies are software technologies that provide the mechanisms for the
               production and use of mobile code. Mobile code technologies include, but are not limited to,

               Java, JavaScript, ActiveX, PDF, .NET, Postscript, Shockwave movies, Flash animations, and
               VBScript. Usage restrictions and implementation guidance apply to both the selection and
               use of mobile code installed on organizational servers and mobile code downloaded and
               executed on individual workstations. Policy and procedures related to mobile code address
               preventing the development, acquisition, or introduction of unacceptable mobile code within
               the information system.
               DoD SAP policies define three risk categories for mobile code. Following a thorough risk
               assessment, each mobile code technology is assigned to one of three risk categories:
                   •   Category 1 (High Risk): These mobile code technologies provide broad
                       functionality, allowing unmediated access to workstation, host, and remote system
                       services and resources. Category 1 mobile code technologies have known security
                       vulnerabilities with few or no countermeasures once they begin executing. They
                       pose a severe threat to DoD SAP operations, and the high risk associated with their
                       use outweighs almost all possible benefits.
                   •   Category 2 (Medium Risk): These mobile code technologies have full
                       functionality, allowing mediated or controlled access to workstation, host, and
                       remote system services and resources. They also have known fine-grained, periodic,
                       or continuous countermeasures or safeguards against security exploits. Category 2
                       technologies pose a moderate threat to DoD SAP information systems; when
                       combined with prudent countermeasures against malicious code and exploitation,
                       their use can afford benefits that generally outweigh the risks.
                   •   Category 3 (Low Risk): These mobile code technologies provide limited
                       functionality with no capability for unmediated access to workstation, host, and
                       remote system resources and services, and they have fine-grained, periodic, or
                       continuous security safeguards against security exploits. Category 3 technologies are
                       of limited risk to DoD SAP systems. When combined with vigilance comparable to
                       that required to keep any software system configured to resist known exploits, the
                       use of Category 3 technologies affords benefits that generally outweigh the risks.
               Organizations shall comply with mobile code requirements, usage restrictions, and
               implementation guidance for acceptable mobile code and mobile code technologies as
               follows [SC-18.a and .b]:
                   •   Emerging mobile code technologies, that have not undergone a risk assessment and
                       been assigned to a Risk Category by the AO, shall not be used.
                   •   Category 1 mobile code shall be signed by a trusted Certificate Authority. Use of
                       unsigned Category 1 mobile code is prohibited. Use of Category 1 mobile code
                       technologies that cannot block or disable unsigned mobile code (e.g., Windows
                       Scripting Host) is prohibited.
                   •   Category 2 mobile code which executes in a constrained environment without access
                       to system resources (e.g., Windows registry, file system, system parameters, and
                       network connections to other than the originating host) may be used.
                   •   Category 2 mobile code which does not execute in a constrained environment may
                       be used when obtained from a trusted source over an assured channel (e.g., JWICS,
                       SIPRNet, SSL connection, S/MIME) or when signed with an approved certificate.
                   •   Category 3 mobile code may be used.

          Control Enhancements:
          (1)    MOBILE CODE | IDENTIFY UNACCEPTABLE CODE / TAKE CORRECTIVE ACTIONS
                 The information system identifies [Assignment: organization-defined unacceptable mobile code] and takes
                 [Assignment: organization-defined corrective actions].
                 Supplemental Guidance: Corrective actions when unacceptable mobile code is detected include, for
                 example, blocking, quarantine, or alerting administrators. Blocking includes, for example, preventing
                 transmission of word processing files with embedded macros when such macros have been defined to
                 be unacceptable mobile code.
          (2)    MOBILE CODE | ACQUISITION / DEVELOPMENT / USE
                 The organization ensures that the acquisition, development, and use of mobile code to be deployed in the
                 information system meets [Assignment: organization-defined mobile code requirements].
          (3)    MOBILE CODE | PREVENT DOWNLOADING / EXECUTION
                 The information system prevents the download and execution of [Assignment: organization-defined unacceptable
                 mobile code].
          (4)    MOBILE CODE | PREVENT AUTOMATIC EXECUTION
                 The information system prevents the automatic execution of mobile code in [Assignment: organization-defined
                 software applications] and enforces [Assignment: organization-defined actions] prior to executing the code.
                 Supplemental Guidance: Actions enforced before executing mobile code, include, for example,
                 prompting users prior to opening electronic mail attachments. Preventing automatic execution of
                 mobile code includes, for example, disabling auto execute features on information system components
                 employing portable storage devices such as Compact Disks (CDs), Digital Video Disks (DVDs), and
                 Universal Serial Bus (USB) devices.
          (5)    MOBILE CODE | ALLOW EXECUTION ONLY IN CONFINED ENVIRONMENTS
                 The organization allows execution of permitted mobile code only in confined virtual machine environments.

          References: NIST Special Publication 800-28; DoD Instruction 8552.01.

SC-19     VOICE OVER INTERNET PROTOCOL

          Control: The organization:

          a.     Establishes usage restrictions and implementation guidance for Voice over Internet Protocol (VoIP)
                 technologies based on the potential to cause damage to the information system if used maliciously; and
          b.     Authorizes, monitors, and controls the use of VoIP within the information system.
          Supplemental Guidance: Related controls: CM-6, SC-7, SC-15.

               Organizations shall ensure VoIP technologies are implemented with AO and PSO approval.
               Additional guidance is available in the DISA Voice and Video Over IP (VVoIP) STIG. In
               addition, the following shall apply:
                   • VoIP telephone instruments shall have a “Consent to Monitor” label (e.g., DD Form
                       2056) or banner and an appropriate classification label or banner. Example of
                       unclassified label below:

                                                   Figure 3-3: ‘Consent to Monitor’ Label

               VoIP telephone instruments must be used in such a way to ensure no unintended
               conversations are picked up and transmitted outside the facility. This may include use in an
               enclosed office, or ensuring no other higher classified discussions occur in the area when the
               VoIP telephone is in use.

          Control Enhancements: None.

          References: NIST Special Publication 800-58.

SC-20     SECURE NAME / ADDRESS RESOLUTION SERVICE (AUTHORITATIVE SOURCE)

          Control: The information system:

          a.     Provides additional data origin authentication and integrity verification artifacts along with the
                 authoritative name resolution data the system returns in response to external name/address resolution
                 queries; and
          b.     Provides the means to indicate the security status of child zones and (if the child supports secure
                 resolution services) to enable verification of a chain of trust among parent and child domains, when
                 operating as part of a distributed, hierarchical namespace.
          Supplemental Guidance: This control enables external clients including, for example, remote Internet clients,
          to obtain origin authentication and integrity verification assurances for the host/service name to network
          address resolution information obtained through the service. Information systems that provide name and
          address resolution services include, for example, domain name system (DNS) servers. Additional artifacts
          include, for example, DNS Security (DNSSEC) digital signatures and cryptographic keys. DNS resource
          records are examples of authoritative data. The means to indicate the security status of child zones includes,
          for example, the use of delegation signer resource records in the DNS. The DNS security controls reflect
          (and are referenced from) OMB Memorandum 08-23. Information systems that use technologies other than
          the DNS to map between host/service names and network addresses provide other means to assure the
          authenticity and integrity of response data. Related controls: AU-10, SC-8, SC-12, SC-13, SC-21, SC-22.
               A Domain Name System (DNS) server is an example of an information system that provides
               name/address resolution service.
               An example is indication of the security status of child subspaces through the use of
               delegation signer (DS) resource records in the DNS.
          Control Enhancements:
          (1)    SECURE NAME / ADDRESS RESOLUTION SERVICE (AUTHORITATIVE SOURCE) | CHILD SUBSPACES
                 [Withdrawn: Incorporated into SC-20].
          (2)    SECURE NAME / ADDRESS RESOLUTION SERVICE (AUTHORITATIVE SOURCE) | DATA ORIGIN / INTEGRITY
                 The information system provides data origin and integrity protection artifacts for internal name/address resolution
                 queries.

          References: OMB Memorandum 08-23; NIST Special Publication 800-81.

SC-21     SECURE NAME / ADDRESS RESOLUTION SERVICE (RECURSIVE OR CACHING RESOLVER)

          Control: The information system requests and performs data origin authentication and data integrity
          verification on the name/address resolution responses the system receives from authoritative sources.
          Supplemental Guidance: Each client of name resolution services either performs this validation on its own, or
          has authenticated channels to trusted validation providers. Information systems that provide name and
          address resolution services for local clients include, for example, recursive resolving or caching domain
          name system (DNS) servers. DNS client resolvers either perform validation of DNSSEC signatures, or
          clients use authenticated channels to recursive resolvers that perform such validations. Information systems
          that use technologies other than the DNS to map between host/service names and network addresses
          provide other means to enable clients to verify the authenticity and integrity of response data. Related
          controls: SC-20, SC-22.
          Control Enhancements: None.
          (1)    SECURE NAME / ADDRESS RESOLUTION SERVICE (RECURSIVE OR CACHING RESOLVER) | DATA ORIGIN / INTEGRITY
                 [Withdrawn: Incorporated into SC-21].

          References: NIST Special Publication 800-81.

SC-22     ARCHITECTURE AND PROVISIONING FOR NAME/ADDRESS RESOLUTION SERVICE

          Control: The information systems that collectively provide name/address resolution service for an
          organization are fault-tolerant and implement internal/external role separation.
          Supplemental Guidance: Information systems that provide name and address resolution services include, for
          example, domain name system (DNS) servers. To eliminate single points of failure and to enhance
          redundancy, organizations employ at least two authoritative domain name system servers, one configured
          as the primary server and the other configured as the secondary server. Additionally, organizations
          typically deploy the servers in two geographically separated network subnetworks (i.e., not located in the
          same physical facility). For role separation, DNS servers with internal roles only process name and address
          resolution requests from within organizations (i.e., from internal clients). DNS servers with external roles
          only process name and address resolution information requests from clients external to organizations (i.e.,
          on external networks including the Internet). Organizations specify clients that can access authoritative
          DNS servers in particular roles (e.g., by address ranges, explicit lists). Related controls: SC-2, SC-20, SC-
          21, SC-24.
          Control Enhancements: None.

          References: NIST Special Publication 800-81.

SC-23     SESSION AUTHENTICITY

          Control: The information system protects the authenticity of communications sessions.

          Supplemental Guidance: This control addresses communications protection at the session, versus packet level
          (e.g., sessions in service-oriented architectures providing web-based services) and establishes grounds for
          confidence at both ends of communications sessions in ongoing identities of other parties and in the
          validity of information transmitted. Authenticity protection includes, for example, protecting against man-
          in-the-middle attacks/session hijacking and the insertion of false information into sessions. Related
          controls: SC-8, SC-10, SC-11.
          Control Enhancements:
          (1)   SESSION AUTHENTICITY | INVALIDATE SESSION IDENTIFIERS AT LOGOUT
                The information system invalidates session identifiers upon user logout or other session termination.
                Supplemental Guidance: This control enhancement curtails the ability of adversaries from capturing and
                continuing to employ previously valid session IDs.
          (2)   SESSION AUTHENTICITY | USER-INITIATED LOGOUTS / MESSAGE DISPLAYS
                [Withdrawn: Incorporated into AC-12 (1)].
          (3)   SESSION AUTHENTICITY | UNIQUE SESSION IDENTIFIERS WITH RANDOMIZATION
                The information system generates a unique session identifier for each session with [Assignment: no readily
                reproducible or ‘spoofable’ session identifiers] and recognizes only session identifiers that are system-generated.
                Supplemental Guidance: This control enhancement curtails the ability of adversaries from reusing
                previously valid session IDs. Employing the concept of randomness in the generation of unique session
                identifiers helps to protect against brute-force attacks to determine future session identifiers. Related
                control: SC-13.
          (4)   SESSION AUTHENTICITY | UNIQUE SESSION IDENTIFIERS WITH RANDOMIZATION
                [Withdrawn: Incorporated into SC-23 (3)].
          (5)   SESSION AUTHENTICITY | ALLOWED CERTIFICATE AUTHORITIES
                The information system only allows the use of [Assignment: organization-defined certificate authorities] for
                verification of the establishment of protected sessions.
                Supplemental Guidance: Reliance on certificate authorities (CAs) for the establishment of secure
                sessions includes, for example, the use of Secure Socket Layer (SSL) and/or Transport Layer Security
                (TLS) certificates. These certificates, after verification by the respective certificate authorities,

                facilitate the establishment of protected sessions between web clients and web servers. Related control:
                SC-13.
          References: NIST Special Publications 800-52, 800-77, 800-95.

SC-24     FAIL IN KNOWN STATE

          Control: The information system fails to a [Assignment: organization-defined known-state] for
          [Assignment: organization-defined types of failures] preserving [Assignment: organization-defined system
          state information] in failure.
          Supplemental Guidance: Failure in a known state addresses security concerns in accordance with the
          mission/business needs of organizations. Failure in a known secure state helps to prevent the loss of
          confidentiality, integrity, or availability of information in the event of failures of organizational information
          systems or system components. Failure in a known safe state helps to prevent systems from failing to a
          state that may cause injury to individuals or destruction to property. Preserving information system state
          information facilitates system restart and return to the operational mode of organizations with less
          disruption of mission/business processes. Related controls: CP-2, CP-10, CP-12, SC-7, SC-22.
          Control Enhancements: None.

          References: None.

SC-25     THIN NODES

          Control: The organization employs [Assignment: organization-defined information system components] with
          minimal functionality and information storage.
          Supplemental Guidance: The deployment of information system components with reduced/minimal
          functionality (e.g., diskless nodes and thin client technologies) reduces the need to secure every user
          endpoint, and may reduce the exposure of information, information systems, and services to cyber attacks.
          Related control: SC-30.
          Control Enhancements: None.

          References: None.

SC-26     HONEYPOTS

          Control: The information system includes components specifically designed to be the target of malicious
          attacks for the purpose of detecting, deflecting, and analyzing such attacks.
          Supplemental Guidance: A honeypot is set up as a decoy to attract adversaries and to deflect their attacks
          away from the operational systems supporting organizational missions/business function. Depending upon
          the specific usage of the honeypot, consultation with the Office of the General Counsel before deployment
          may be needed. Related controls: SC-30, SC-44, SI-3, SI-4.
          Control Enhancements: None.
          (1)   HONEYPOTS | DETECTION OF MALICIOUS CODE
                [Withdrawn: Incorporated into SC-35].

          References: None.

SC-27     PLATFORM-INDEPENDENT APPLICATIONS

          Control: The information system includes: [Assignment: organization-defined platform-independent
          applications].
          Supplemental Guidance: Platforms are combinations of hardware and software used to run software
          applications. Platforms include: (i) operating systems; (ii) the underlying computer architectures, or (iii)
          both. Platform-independent applications are applications that run on multiple platforms. Such applications

          promote portability and reconstitution on different platforms, increasing the availability of critical functions
          within organizations while information systems with specific operating systems are under attack. Related
          control: SC-29.
          Control Enhancements: None.

          References: None.

SC-28     PROTECTION OF INFORMATION AT REST

          Control: The information system protects the confidentiality and integrity of all SAP information at rest.

          Supplemental Guidance: This control addresses the confidentiality and integrity of information at rest and
          covers user information and system information. Information at rest refers to the state of information when
          it is located on storage devices as specific components of information systems. System-related information
          requiring protection includes, for example, configurations or rule sets for firewalls, gateways, intrusion
          detection/prevention systems, filtering routers, and authenticator content. Organizations may employ
          different mechanisms to achieve confidentiality and integrity protections, including the use of
          cryptographic mechanisms and file share scanning. Integrity protection can be achieved, for example, by
          implementing Write-Once-Read-Many (WORM) technologies. Organizations may also employ other
          security controls including, for example, secure off-line storage in lieu of online storage when adequate
          protection of information at rest cannot otherwise be achieved and/or continuous monitoring to identify
          malicious code at rest. Related controls: AC-3, AC-6, CA-7, CM-3, CM-5, CM-6, PE-3, SC-8, SC-13, SI-3,
          SI-7.
               Encryption shall be implemented to complement protection of information at rest, using
               approved cryptographic methods identified in SC-13. Reference [MP-5] for data encryption
               as well as media transport requirements, i.e., mobile devices and removable media.
               Information at rest refers to the state of information when it is located on a non-volatile
               device (e.g., hard drive, tapes, optical discs, flash drives). This also includes workstations,
               servers, and off-line storage.
               This control is non-tailorable for all SAP systems.

          Control Enhancements:
          (1)    PROTECTION OF INFORMATION AT REST | CRYPTOGRAPHIC PROTECTION
                 The information system implements cryptographic mechanisms to prevent unauthorized disclosure and modification
                 of [Assignment: organization-defined information] on [Assignment: organization-defined information system
                 components].
                 Supplemental Guidance: Selection of cryptographic mechanisms is based on the need to protect the
                 confidentiality and integrity of organizational information. The strength of mechanism is
                 commensurate with the security category and/or classification of the information. This control
                 enhancement applies to significant concentrations of digital media in organizational areas designated
                 for media storage and also to limited quantities of media generally associated with information system
                 components in operational environments (e.g., portable storage devices, mobile devices).
                 Organizations have the flexibility to either encrypt all information on storage devices (i.e., full disk
                 encryption) or encrypt specific data structures (e.g., files, records, or fields). Organizations employing
                 cryptographic mechanisms to protect information at rest also consider cryptographic key management
                 solutions. Related controls: AC-19, SC-12.
                   In addition, all portable media originating from an IS which has a high or moderate
                   confidentiality rating shall be encrypted using either NSA approved, or FIPS 140-2
                   compliant products, see [MP-5(4)].
          (2)    PROTECTION OF INFORMATION AT REST | OFF-LINE STORAGE
                 The organization removes from online storage and stores off-line in a secure location [Assignment: organization-
                 defined information].

                Supplemental Guidance: Removing organizational information from online information system storage
                to off-line storage eliminates the possibility of individuals gaining unauthorized access to the
                information through a network. Therefore, organizations may choose to move information to off-line
                storage in lieu of protecting such information in online storage.
          References: NIST Special Publications 800-56, 800-57, 800-111.

SC-29     HETEROGENEITY

          Control: The organization employs a diverse set of information technologies for [Assignment: organization-
          defined information system components] in the implementation of the information system.
          Supplemental Guidance: Increasing the diversity of information technologies within organizational
          information systems reduces the impact of potential exploitations of specific technologies and also defends
          against common mode failures, including those failures induced by supply chain attacks. Diversity in
          information technologies also reduces the likelihood that the means adversaries use to compromise one
          information system component will be equally effective against other system components, thus further
          increasing the adversary work factor to successfully complete planned cyber attacks. An increase in
          diversity may add complexity and management overhead which could ultimately lead to mistakes and
          unauthorized configurations. Related controls: SA-12, SA-14, SC-27.
          Control Enhancements:
          (1)   HETEROGENEITY | VIRTUALIZATION TECHNIQUES
                The organization employs virtualization techniques to support the deployment of a diversity of operating systems and
                applications that are changed [Assignment: organization-defined frequency].
                Supplemental Guidance: While frequent changes to operating systems and applications pose
                configuration management challenges, the changes can result in an increased work factor for
                adversaries in order to carry out successful cyber attacks. Changing virtual operating systems or
                applications, as opposed to changing actual operating systems/applications, provide virtual changes
                that impede attacker success while reducing configuration management efforts. In addition,
                virtualization techniques can assist organizations in isolating untrustworthy software and/or software
                of dubious provenance into confined execution environments.
          References: None.

SC-30     CONCEALMENT AND MISDIRECTION

          Control: The organization employs [Assignment: organization-defined concealment and misdirection
          techniques] for [Assignment: organization-defined information systems] at [Assignment: organization-
          defined time periods] to confuse and mislead adversaries.
          Supplemental Guidance: Concealment and misdirection techniques can significantly reduce the targeting
          capability of adversaries (i.e., window of opportunity and available attack surface) to initiate and complete
          cyber attacks. For example, virtualization techniques provide organizations with the ability to disguise
          information systems, potentially reducing the likelihood of successful attacks without the cost of having
          multiple platforms. Increased use of concealment/misdirection techniques including, for example,
          randomness, uncertainty, and virtualization, may sufficiently confuse and mislead adversaries and
          subsequently increase the risk of discovery and/or exposing tradecraft. Concealment/misdirection
          techniques may also provide organizations additional time to successfully perform core missions and
          business functions. Because of the time and effort required to support concealment/misdirection techniques,
          it is anticipated that such techniques would be used by organizations on a very limited basis. Related
          controls: SC-26, SC-29, SI-14.
          Control Enhancements:
          (1)   CONCEALMENT AND MISDIRECTION | VIRTUALIZATION TECHNIQUES
                [Withdrawn: Incorporated into SC-29 (1)].

          (2)   CONCEALMENT AND MISDIRECTION | RANDOMNESS
                The organization employs [Assignment: organization-defined techniques] to introduce randomness into
                organizational operations and assets.
                Supplemental Guidance: Randomness introduces increased levels of uncertainty for adversaries
                regarding the actions organizations take in defending against cyber attacks. Such actions may impede
                the ability of adversaries to correctly target information resources of organizations supporting critical
                missions/business functions. Uncertainty may also cause adversaries to hesitate before initiating or
                continuing attacks. Misdirection techniques involving randomness include, for example, performing
                certain routine actions at different times of day, employing different information technologies (e.g.,
                browsers, search engines), using different suppliers, and rotating roles and responsibilities of
                organizational personnel.
          (3)   CONCEALMENT AND MISDIRECTION | CHANGE PROCESSING / STORAGE LOCATIONS
                The organization changes the location of [Assignment: organization-defined processing and/or storage] [Selection:
                [Assignment: organization-defined time frequency]; at random time intervals]].
                Supplemental Guidance: Adversaries target critical organizational missions/business functions and the
                information resources supporting those missions and functions while at the same time, trying to
                minimize exposure of their existence and tradecraft. The static, homogeneous, and deterministic nature
                of organizational information systems targeted by adversaries, make such systems more susceptible to
                cyber attacks with less adversary cost and effort to be successful. Changing organizational processing
                and storage locations (sometimes referred to as moving target defense) addresses the advanced
                persistent threat (APT) using techniques such as virtualization, distributed processing, and replication.
                This enables organizations to relocate the information resources (i.e., processing and/or storage)
                supporting critical missions and business functions. Changing locations of processing activities and/or
                storage sites introduces uncertainty into the targeting activities by adversaries. This uncertainty
                increases the work factor of adversaries making compromises or breaches to organizational
                information systems much more difficult and time-consuming, and increases the chances that
                adversaries may inadvertently disclose aspects of tradecraft while attempting to locate critical
                organizational resources.
          (4)   CONCEALMENT AND MISDIRECTION | MISLEADING INFORMATION
                The organization employs realistic, but misleading information in [Assignment: organization-defined information
                system components] with regard to its security state or posture.
                Supplemental Guidance: This control enhancement misleads potential adversaries regarding the nature
                and extent of security safeguards deployed by organizations. As a result, adversaries may employ
                incorrect (and as a result ineffective) attack techniques. One way of misleading adversaries is for
                organizations to place misleading information regarding the specific security controls deployed in
                external information systems that are known to be accessed or targeted by adversaries. Another
                technique is the use of deception nets (e.g., honeynets, virtualized environments) that mimic actual
                aspects of organizational information systems but use, for example, out-of-date software
                configurations.
          (5)   CONCEALMENT AND MISDIRECTION | CONCEALMENT OF SYSTEM COMPONENTS
                The organization employs [Assignment: organization-defined techniques] to hide or conceal [Assignment:
                organization-defined information system components].
                Supplemental Guidance: By hiding, disguising, or otherwise concealing critical information system
                components, organizations may be able to decrease the probability that adversaries target and
                successfully compromise those assets. Potential means for organizations to hide and/or conceal
                information system components include, for example, configuration of routers or the use of honeynets
                or virtualization techniques.
          References: None.

SC-31     COVERT CHANNEL ANALYSIS

          Control: The organization:

          a.    Performs a covert channel analysis to identify those aspects of communications within the information
                system that are potential avenues for covert [Selection (one or more): storage; timing] channels; and

          b.    Estimates the maximum bandwidth of those channels.
          Supplemental Guidance: Developers are in the best position to identify potential areas within systems that
          might lead to covert channels. Covert channel analysis is a meaningful activity when there is the potential
          for unauthorized information flows across security domains, for example, in the case of information
          systems containing export-controlled information and having connections to external networks (i.e.,
          networks not controlled by organizations). Covert channel analysis is also meaningful for multilevel secure
          (MLS) information systems, multiple security level (MSL) systems, and cross-domain systems. Related
          controls: AC-3, AC-4, PL-2.
          Control Enhancements:
          (1)   COVERT CHANNEL ANALYSIS | TEST COVERT CHANNELS FOR EXPLOITABILITY
                The organization tests a subset of the identified covert channels to determine which channels are exploitable.
          (2)   COVERT CHANNEL ANALYSIS | MAXIMUM BANDWIDTH
                The organization reduces the maximum bandwidth for identified covert [Selection (one or more); storage; timing]
                channels to [Assignment: organization-defined values].
                Supplemental Guidance: Information system developers are in the best position to reduce the maximum
                bandwidth for identified covert storage and timing channels.
          (3)   COVERT CHANNEL ANALYSIS | MEASURE BANDWIDTH IN OPERATIONAL ENVIRONMENTS
                The organization measures the bandwidth of [Assignment: organization-defined subset of identified covert channels]
                in the operational environment of the information system.
                Supplemental Guidance: This control enhancement addresses covert channel bandwidth in operational
                environments versus developmental environments. Measuring covert channel bandwidth in operational
                environments helps organizations to determine how much information can be covertly leaked before
                such leakage adversely affects organizational missions/business functions. Covert channel bandwidth
                may be significantly different when measured in those settings that are independent of the particular
                environments of operation (e.g., laboratories or development environments).
          References: None.

SC-32     INFORMATION SYSTEM PARTITIONING

          Control: The organization partitions the information system into [Assignment: organization-defined
          information system components] residing in separate physical domains or environments based on
          [Assignment: organization-defined circumstances for physical separation of components].
          Supplemental Guidance: Information system partitioning is a part of a defense-in-depth protection strategy.
          Organizations determine the degree of physical separation of system components from physically distinct
          components in separate racks in the same room, to components in separate rooms for the more critical
          components, to more significant geographical separation of the most critical components. Security
          categorization can guide the selection of appropriate candidates for domain partitioning. Managed
          interfaces restrict or prohibit network access and information flow among partitioned information system
          components. Related controls: AC-4, SA-8, SC-2, SC-3, SC-7.
          Control Enhancements: None.

          References: FIPS Publication 199.

SC-33     TRANSMISSION PREPARATION INTEGRITY
          [Withdrawn: Incorporated into SC-8].

SC-34     NON-MODIFIABLE EXECUTABLE PROGRAMS

          Control: The information system at [Assignment: organization-defined information system components]:

           a.   Loads and executes the operating environment from hardware-enforced, read-only media; and

           b.   Loads and executes [Assignment: organization-defined applications] from hardware-enforced, read-
                only media.
          Supplemental Guidance:    The term operating environment is defined as the specific code that hosts
          applications, for example, operating systems, executives, or monitors including virtual machine monitors
          (i.e., hypervisors). It can also include certain applications running directly on hardware platforms.
          Hardware-enforced, read-only media include, for example, Compact Disk-Recordable (CD-R)/Digital
          Video Disk-Recordable (DVD-R) disk drives and one-time programmable read-only memory. The use of
          non-modifiable storage ensures the integrity of software from the point of creation of the read-only image.
          The use of reprogrammable read-only memory can be accepted as read-only media provided: (i) integrity
          can be adequately protected from the point of initial writing to the insertion of the memory into the
          information system; and (ii) there are reliable hardware protections against reprogramming the memory
          while installed in organizational information systems. Related controls: AC-3, SI-7.
          Control Enhancements:
          (1)   NON-MODIFIABLE EXECUTABLE PROGRAMS | NO WRITABLE STORAGE
                The organization employs [Assignment: organization-defined information system components] with no writeable
                storage that is persistent across component restart or power on/off.
                Supplemental Guidance: This control enhancement: (i) eliminates the possibility of malicious code
                insertion via persistent, writeable storage within the designated information system components; and
                (ii) applies to both fixed and removable storage, with the latter being addressed directly or as specific
                restrictions imposed through access controls for mobile devices. Related controls: AC-19, MP-7.
          (2)   NON-MODIFIABLE EXECUTABLE PROGRAMS | INTEGRITY PROTECTION / READ-ONLY MEDIA
                The organization protects the integrity of information prior to storage on read-only media and controls the media after
                such information has been recorded onto the media.
                Supplemental Guidance: Security safeguards prevent the substitution of media into information systems
                or the reprogramming of programmable read-only media prior to installation into the systems. Security
                safeguards include, for example, a combination of prevention, detection, and response. Related
                controls: AC-5, CM-3, CM-5, CM-9, MP-2, MP-4, MP-5, SA-12, SC-28, SI-3.
          (3)   NON-MODIFIABLE EXECUTABLE PROGRAMS | HARDWARE-BASED PROTECTION
                The organization:
                (a)   Employs hardware-based, write-protect for [Assignment: organization-defined information system firmware
                      components]; and
                (b) Implements specific procedures for [Assignment: organization-defined authorized individuals] to manually
                    disable hardware write-protect for firmware modifications and re-enable the write-protect prior to returning to
                    operational mode.

          References: None.

SC-35     HONEYCLIENTS

          Control: The information system includes components that proactively seek to identify malicious websites
          and/or web-based malicious code.
          Supplemental Guidance: Honeyclients differ from honeypots in that the components actively probe the
          Internet in search of malicious code (e.g., worms) contained on external websites. As with honeypots,
          honeyclients require some supporting isolation measures (e.g., virtualization) to ensure that any malicious
          code discovered during the search and subsequently executed does not infect organizational information
          systems. Related controls: SC-26, SC-44, SI-3, SI-4.
          Control Enhancements: None.

          References: None.

SC-36     DISTRIBUTED PROCESSING AND STORAGE

          Control: The organization distributes [Assignment: organization-defined processing and storage] across
          multiple physical locations.

          Supplemental Guidance: Distributing processing and storage across multiple physical locations provides
          some degree of redundancy or overlap for organizations, and therefore increases the work factor of
          adversaries to adversely impact organizational operations, assets, and individuals. This control does not
          assume a single primary processing or storage location, and thus allows for parallel processing and storage.
          Related controls: CP-6, CP-7.
          Control Enhancements:
          (1)   DISTRIBUTED PROCESSING AND STORAGE | POLLING TECHNIQUES
                The organization employs polling techniques to identify potential faults, errors, or compromises to [Assignment:
                organization-defined distributed processing and storage components].
                Supplemental Guidance: Distributed processing and/or storage may be employed to reduce opportunities
                for adversaries to successfully compromise the confidentiality, integrity, or availability of information
                and information systems. However, distribution of processing and/or storage components does not
                prevent adversaries from compromising one (or more) of the distributed components. Polling compares
                the processing results and/or storage content from the various distributed components and subsequently
                voting on the outcomes. Polling identifies potential faults, errors, or compromises in distributed
                processing and/or storage components. Related control: SI-4.
          References: None.

SC-37     OUT-OF-BAND CHANNELS

          Control: The organization employs [Assignment: organization-defined out-of-band channels] for the
          physical delivery or electronic transmission of [Assignment: organization-defined information, information
          system components, or devices] to [Assignment: organization-defined individuals or information systems].
          Supplemental Guidance: Out-of-band channels include, for example, local (nonnetwork) accesses to
          information systems, network paths physically separate from network paths used for operational traffic, or
          nonelectronic paths such as the US Postal Service. This is in contrast with using the same channels (i.e., in-
          band channels) that carry routine operational traffic. Out-of-band channels do not have the same
          vulnerability/exposure as in-band channels, and hence the confidentiality, integrity, or availability
          compromises of in-band channels will not compromise the out-of-band channels. Organizations may
          employ out-of-band channels in the delivery or transmission of many organizational items including, for
          example, identifiers/authenticators, configuration management changes for hardware, firmware, or
          software, cryptographic key management information, security updates, system/data backups, maintenance
          information, and malicious code protection updates. Related controls: AC-2, CM-3, CM-5, CM-7, IA-4,
          IA-5, MA-4, SC-12, SI-3, SI-4, SI-7.
          Control Enhancements:
          (1)   OUT-OF-BAND CHANNELS | ENSURE DELIVERY / TRANSMISSION
                The organization employs [Assignment: organization-defined security safeguards] to ensure that only [Assignment:
                organization-defined individuals or information systems] receive the [Assignment: organization-defined information,
                information system components, or devices].
                Supplemental Guidance: Techniques and/or methods employed by organizations to ensure that only
                designated information systems or individuals receive particular information, system components, or
                devices include, for example, sending authenticators via courier service but requiring recipients to
                show some form of government-issued photographic identification as a condition of receipt.
          References: None.

SC-38     OPERATIONS SECURITY

          Control: The organization employs [Assignment: organization-defined operations security safeguards] to
          protect key organizational information throughout the system development life cycle.
          Supplemental Guidance: Operations security (OPSEC) is a systematic process by which potential adversaries
          can be denied information about the capabilities and intentions of organizations by identifying, controlling,
          and protecting generally unclassified information that specifically relates to the planning and execution of
          sensitive organizational activities. The OPSEC process involves five steps: (i) identification of critical

          information (e.g., the security categorization process); (ii) analysis of threats; (iii) analysis of
          vulnerabilities; (iv) assessment of risks; and (v) the application of appropriate countermeasures. OPSEC
          safeguards are applied to both organizational information systems and the environments in which those
          systems operate. OPSEC safeguards help to protect the confidentiality of key information including, for
          example, limiting the sharing of information with suppliers and potential suppliers of information system
          components, information technology products and services, and with other non-organizational elements and
          individuals. Information critical to mission/business success includes, for example, user identities, element
          uses, suppliers, supply chain processes, functional and security requirements, system design specifications,
          testing protocols, and security control implementation details. Related controls: RA-2, RA-5, SA-12.
          Control Enhancements: None.

          References: None.

SC-39     PROCESS ISOLATION

          Control: The information system maintains a separate execution domain for each executing process.

          Supplemental Guidance: Information systems can maintain separate execution domains for each executing
          process by assigning each process a separate address space. Each information system process has a distinct
          address space so that communication between processes is performed in a manner controlled through the
          security functions, and one process cannot modify the executing code of another process. Maintaining
          separate execution domains for executing processes can be achieved, for example, by implementing
          separate address spaces. This capability is available in most commercial operating systems that employ
          multi-state processor technologies. Related controls: AC-3, AC-4, AC-6, SA-4, SA-5, SA-8, SC-2, SC-3.
               Use of a modern operating system meets this control for most systems.
          Control Enhancements:
          (1)    PROCESS ISOLATION | HARDWARE SEPARATION
                 The information system implements underlying hardware separation mechanisms to facilitate process separation.
                 Supplemental Guidance: Hardware-based separation of information system processes is generally less
                 susceptible to compromise than software-based separation, thus providing greater assurance that the
                 separation will be enforced. Underlying hardware separation mechanisms include, for example,
                 hardware memory management.
          (2)    PROCESS ISOLATION | THREAD ISOLATION
                 The information system maintains a separate execution domain for each thread in [Assignment: organization-defined
                 multi-threaded processing].

          References: None.

SC-40     WIRELESS LINK PROTECTION

          Control: The information system protects external and internal [Assignment: organization-defined wireless
          links] from [Assignment: organization-defined types of signal parameter attacks or references to sources
          for such attacks].
          Supplemental Guidance: This control applies to internal and external wireless communication links that may
          be visible to individuals who are not authorized information system users. Adversaries can exploit the
          signal parameters of wireless links if such links are not adequately protected. There are many ways to
          exploit the signal parameters of wireless links to gain intelligence, deny service, or to spoof users of
          organizational information systems. This control reduces the impact of attacks that are unique to wireless
          systems. If organizations rely on commercial service providers for transmission services as commodity
          items rather than as fully dedicated services, it may not be possible to implement this control. Related
          controls: AC-18, SC-5.

          Control Enhancements:
          (1)   WIRELESS LINK PROTECTION | ELECTROMAGNETIC INTERFERENCE
                The information system implements cryptographic mechanisms that achieve [Assignment: organization-defined level
                of protection] against the effects of intentional electromagnetic interference.
                Supplemental Guidance: This control enhancement protects against intentional jamming that might deny
                or impair communications by ensuring that wireless spread spectrum waveforms used to provide anti-
                jam protection are not predictable by unauthorized individuals. The control enhancement may also
                coincidentally help to mitigate the effects of unintentional jamming due to interference from legitimate
                transmitters sharing the same spectrum. Mission requirements, projected threats, concept of operations,
                and applicable legislation, directives, regulations, policies, standards, and guidelines determine levels
                of wireless link availability and performance/cryptography needed. Related controls: SC-12, SC-13.
          (2)   WIRELESS LINK PROTECTION | REDUCE DETECTION POTENTIAL
                The information system implements cryptographic mechanisms to reduce the detection potential of wireless links to
                [Assignment: organization-defined level of reduction].
                Supplemental Guidance: This control enhancement is needed for covert communications and protecting
                wireless transmitters from being geo-located by their transmissions. The control enhancement ensures
                that spread spectrum waveforms used to achieve low probability of detection are not predictable by
                unauthorized individuals. Mission requirements, projected threats, concept of operations, and
                applicable legislation, directives, regulations, policies, standards, and guidelines determine the levels to
                which wireless links should be undetectable. Related controls: SC-12, SC-13.
          (3)   WIRELESS LINK PROTECTION | IMITATIVE OR MANIPULATIVE COMMUNICATIONS DECEPTION
                The information system implements cryptographic mechanisms to identify and reject wireless transmissions that are
                deliberate attempts to achieve imitative or manipulative communications deception based on signal parameters.
                Supplemental Guidance: This control enhancement ensures that the signal parameters of wireless
                transmissions are not predictable by unauthorized individuals. Such unpredictability reduces the
                probability of imitative or manipulative communications deception based upon signal parameters
                alone. Related controls: SC-12, SC-13.
          (4)   WIRELESS LINK PROTECTION | SIGNAL PARAMETER IDENTIFICATION
                The information system implements cryptographic mechanisms to prevent the identification of [Assignment:
                organization-defined wireless transmitters] by using the transmitter signal parameters.
                Supplemental Guidance: Radio fingerprinting techniques identify the unique signal parameters of
                transmitters to fingerprint such transmitters for purposes of tracking and mission/user identification.
                This control enhancement protects against the unique identification of wireless transmitters for
                purposes of intelligence exploitation by ensuring that anti-fingerprinting alterations to signal
                parameters are not predictable by unauthorized individuals. This control enhancement helps assure
                mission success when anonymity is required. Related controls: SC-12, SC-13.
          References: None.

SC-41     PORT AND I/O DEVICE ACCESS

          Control: The organization physically disables or removes [Assignment: organization-defined connection
          ports or input/output devices] on [Assignment: organization-defined information systems or information
          system components].
          Supplemental Guidance: Connection ports include, for example, Universal Serial Bus (USB) and Firewire
          (IEEE 1394). Input/output (I/O) devices include, for example, Compact Disk (CD) and Digital Video Disk
          (DVD) drives. Physically disabling or removing such connection ports and I/O devices helps prevent
          exfiltration of information from information systems and the introduction of malicious code into systems
          from those ports/devices.
          Control Enhancements: None.

          References: None.

SC-42     SENSOR CAPABILITY AND DATA

          Control: The information system:

           a.   Prohibits the remote activation of environmental sensing capabilities with the following exceptions:
                [Assignment: organization-defined exceptions where remote activation of sensors is allowed]; and
           b.   Provides an explicit indication of sensor use to [Assignment: organization-defined class of users].
          Supplemental Guidance: This control often applies to types of information systems or system components
          characterized as mobile devices, for example, smart phones, tablets, and E-readers. These systems often
          include sensors that can collect and record data regarding the environment where the system is in use.
          Sensors that are embedded within mobile devices include, for example, cameras, microphones, Global
          Positioning System (GPS) mechanisms, and accelerometers. While the sensors on mobiles devices provide
          an important function, if activated covertly, such devices can potentially provide a means for adversaries to
          learn valuable information about individuals and organizations. For example, remotely activating the GPS
          function on a mobile device could provide an adversary with the ability to track the specific movements of
          an individual.
          Control Enhancements:
          (1)   SENSOR CAPABILITY AND DATA | REPORTING TO AUTHORIZED INDIVIDUALS OR ROLES
                The organization ensures that the information system is configured so that data or information collected by
                the [Assignment: organization-defined sensors] is only reported to authorized individuals or roles.
                Supplemental Guidance: In situations where sensors are activated by authorized individuals (e.g., end
                users), it is still possible that the data/information collected by the sensors will be sent to unauthorized
                entities.
          (2)   SENSOR CAPABILITY AND DATA | AUTHORIZED USE
                The organization employs the following measures: [Assignment: organization-defined measures], so that data or
                information collected by [Assignment: organization-defined sensors] is only used for authorized purposes.
                Supplemental Guidance: Information collected by sensors for a specific authorized purpose potentially
                could be misused for some unauthorized purpose. For example, GPS sensors that are used to support
                traffic navigation could be misused to track movements of individuals. Measures to mitigate such
                activities include, for example, additional training to ensure that authorized parties do not abuse their
                authority, or (in the case where sensor data/information is maintained by external parties) contractual
                restrictions on the use of the data/information.
          (3)   SENSOR CAPABILITY AND DATA | PROHIBIT USE OF DEVICES
                The organization prohibits the use of devices possessing [Assignment: organization-defined environmental sensing
                capabilities] in [Assignment: organization-defined facilities, areas, or systems].
                Supplemental Guidance: For example, organizations may prohibit individuals from bringing cell phones
                or digital cameras into certain facilities or specific controlled areas within facilities where classified
                information is stored or sensitive conversations are taking place.
          References: None.

SC-43     USAGE RESTRICTIONS

          Control: The organization:

          a.    Establishes usage restrictions and implementation guidance for [Assignment: organization-defined
                information system components] based on the potential to cause damage to the information system if
                used maliciously; and
          b.    Authorizes, monitors, and controls the use of such components within the information system.
          Supplemental Guidance: Information system components include hardware, software, or firmware
          components (e.g., Voice Over Internet Protocol, mobile code, digital copiers, printers, scanners, optical
          devices, wireless technologies, mobile devices). Related controls: CM-6, SC-7.

          Control Enhancements: None.

          References: None.

SC-44     DETONATION CHAMBERS

          Control: The organization employs a detonation chamber capability within [Assignment: organization-
          defined information system, system component, or location].
          Supplemental Guidance: Detonation chambers, also known as dynamic execution environments, allow
          organizations to open email attachments, execute untrusted or suspicious applications, and execute
          Universal Resource Locator (URL) requests in the safety of an isolated environment or virtualized sandbox.
          These protected and isolated execution environments provide a means of determining whether the
          associated attachments/applications contain malicious code. While related to the concept of deception nets,
          the control is not intended to maintain a long-term environment in which adversaries can operate and their
          actions can be observed. Rather, it is intended to quickly identify malicious code and reduce the likelihood
          that the code is propagated to user environments of operation (or prevent such propagation completely).
          Related controls: SC-7, SC-25, SC-26, SC-30.
          Control Enhancements: None.

          References: None.
