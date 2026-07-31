# JSIG Chapter 3 Identification and Authentication (IA) Family

Source URL: https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Archived source (used for extraction, direct URL returns HTTP 403): http://web.archive.org/web/20260405054539/https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Extraction note: Verbatim extraction via `pdftotext -layout` against the complete 378-page JSIG PDF (retrieved 2026-07-17 from the Wayback Machine snapshot below, since the direct DCSA URL returns HTTP 403). This supersedes any prior lower-fidelity extraction of this section. Running page headers/footers inserted by the PDF layout have been stripped; no wording has been added, summarized, or altered.

---

FAMILY: IDENTIFICATION AND AUTHENTICATION

IA-1       IDENTIFICATION AND AUTHENTICATION POLICY AND PROCEDURES

           Control: The organization:

           a.   Develops, documents, and disseminates to all personnel:
                1.    An identification and authentication policy that addresses purpose, scope, roles, responsibilities,
                      management commitment, coordination among organizational entities, and compliance; and
                2.    Procedures to facilitate the implementation of the identification and authentication policy and
                      associated identification and authentication controls; and
           b.   Reviews and updates the current:
                1.    Identification and authentication policy at least annually; and
                2.    Identification and authentication procedures at least annually.
           Supplemental Guidance:   This control addresses the establishment of policy and procedures for the effective
           implementation of selected security controls and control enhancements in the IA family. Policy and
           procedures reflect applicable federal laws, Executive Orders, directives, regulations, policies, standards,
           and guidance. Security program policies and procedures at the organization level may make the need for
           system-specific policies and procedures unnecessary. The policy can be included as part of the general
           information security policy for organizations or conversely, can be represented by multiple policies
           reflecting the complex nature of certain organizations. The procedures can be established for the security
           program in general and for particular information systems, if needed. The organizational risk management
           strategy is a key factor in establishing policy and procedures. Related control: PM-9.
           Control Enhancements: None.

           References: FIPS Publication 201; NIST Special Publications 800-12, 800-63, 800-73, 800-76, 800-78,
           800-100.

IA-2       IDENTIFICATION AND AUTHENTICATION (ORGANIZATIONAL USERS)

           Control: The information system uniquely identifies and authenticates organizational users (or processes
           acting on behalf of organizational users).
           Supplemental Guidance: Organizational users include employees or individuals that organizations deem to
           have equivalent status of employees (e.g., contractors, guest researchers). This control applies to all
           accesses other than: (i) accesses that are explicitly identified and documented in AC-14; and (ii) accesses
           that occur through authorized use of group authenticators without individual authentication. Organizations
           may require unique identification of individuals in group accounts (e.g., shared privilege accounts) or for
           detailed accountability of individual activity. Organizations employ passwords, tokens, or biometrics to
           authenticate user identities, or in the case multifactor authentication, or some combination thereof. Access
           to organizational information systems is defined as either local access or network access. Local access is
           any access to organizational information systems by users (or processes acting on behalf of users) where
           such access is obtained by direct connections without the use of networks. Network access is access to
           organizational information systems by users (or processes acting on behalf of users) where such access is
           obtained through network connections (i.e., nonlocal accesses). Remote access is a type of network access
           that involves communication through external networks (e.g., the Internet). Internal networks include local
           area networks and wide area networks. In addition, the use of encrypted virtual private networks (VPNs)
           for network connections between organization-controlled endpoints and non-organization controlled
           endpoints may be treated as internal networks from the perspective of protecting the confidentiality and
           integrity of information traversing the network.
           Organizations can satisfy the identification and authentication requirements in this control by complying
           with the requirements in Homeland Security Presidential Directive 12 consistent with the specific
           organizational implementation plans. Multifactor authentication requires the use of two or more different

           factors to achieve authentication. The factors are defined as: (i) something you know (e.g., password,
           personal identification number [PIN]); (ii) something you have (e.g., cryptographic identification device,
           token); or (iii) something you are (e.g., biometric). Multifactor solutions that require devices separate from
           information systems gaining access include, for example, hardware tokens providing time-based or
           challenge-response authenticators and smart cards such as the U.S. Government Personal Identity
           Verification card and the DoD common access card. In addition to identifying and authenticating users at
           the information system level (i.e., at logon), organizations also employ identification and authentication
           mechanisms at the application level, when necessary, to provide increased information security.
           Identification and authentication requirements for other than organizational users are described in IA-8.
           Related controls: AC-2, AC-3, AC-14, AC-17, AC-18, IA-4, IA-5, IA-8.
               Reference AC-2 Account Management for further guidance on the use of group accounts.
           Control Enhancements:
           (1)   IDENTIFICATION AND AUTHENTICATION | NETWORK ACCESS TO PRIVILEGED ACCOUNTS
                 The information system implements multifactor authentication for network access to privileged Accounts.
                 Supplemental Guidance: Related control: AC-6.

                  Reference CYBERCOM Communications Tasking Order (CTO) 15-0102
                  Implementation and Reporting of PKI. ISOs should request AO guidance on CTO
                  implementation prior to acquisition of products as some systems will require Public Key
                  Infrastructure (PKI) while multi-factor authentication for privileged users may be a more
                  appropriate solution for smaller systems.
           (2)   IDENTIFICATION AND AUTHENTICATION | NETWORK ACCESS TO NON-PRIVILEGED ACCOUNTS
                 The information system implements multifactor authentication for network access to non-privileged accounts.
           (3)   IDENTIFICATION AND AUTHENTICATION | LOCAL ACCESS TO PRIVILEGED ACCOUNTS
                 The information system implements multifactor authentication for local access to privileged accounts.
                 Supplemental Guidance: Related control: AC-6.
           (4)   IDENTIFICATION AND AUTHENTICATION | LOCAL ACCESS TO NON-PRIVILEGED ACCOUNTS
                 The information system implements multifactor authentication for local access to non-privileged accounts.
           (5)   IDENTIFICATION AND AUTHENTICATION | GROUP AUTHENTICATION
                 The organization requires individuals to be authenticated with an individual authenticator when a group authenticator
                 is employed.
                 Supplemental Guidance: Requiring individuals to use individual authenticators as a second level of
                 authentication helps organizations to mitigate the risk of using group authenticators.
           (6)   IDENTIFICATION AND AUTHENTICATION | NETWORK ACCESS TO PRIVILEGED ACCOUNTS - SEPARATE DEVICE
                 The information system implements multifactor authentication for network access to privileged accounts such that
                 one of the factors is provided by a device separate from the system gaining access and the device meets
                 [Assignment: organization-defined strength of mechanism requirements].
                 Supplemental Guidance: Related control: AC-6.
           (7)   IDENTIFICATION AND AUTHENTICATION | NETWORK ACCESS TO NON-PRIVILEGED ACCOUNTS - SEPARATE DEVICE
                 The information system implements multifactor authentication for network access to non-privileged accounts such
                 that one of the factors is provided by a device separate from the system gaining access and the device meets
                 [Assignment: organization-defined strength of mechanism requirements].
           (8)   IDENTIFICATION AND AUTHENTICATION | NETWORK ACCESS TO PRIVILEGED ACCOUNTS - REPLAY RESISTANT
                 The information system implements replay-resistant authentication mechanisms for network access to privileged
                 accounts.
                 Supplemental Guidance: Authentication processes resist replay attacks if it is impractical to achieve
                 successful authentications by replaying previous authentication messages. Replay-resistant techniques
                 include, for example, protocols that use nonces or challenges such as Transport Layer Security (TLS)
                 and time synchronous or challenge-response one-time authenticators.

           (9)   IDENTIFICATION AND AUTHENTICATION | NETWORK ACCESS TO NON-PRIVILEGED ACCOUNTS - REPLAY RESISTANT
                 The information system implements replay-resistant authentication mechanisms for network access to non-privileged
                 accounts.
                 Supplemental Guidance: Authentication processes resist replay attacks if it is impractical to achieve
                 successful authentications by recording/replaying previous authentication messages. Replay-resistant
                 techniques include, for example, protocols that use nonces or challenges such as Transport Layer
                 Security (TLS) and time synchronous or challenge-response one-time authenticators.
           (10) IDENTIFICATION AND AUTHENTICATION | SINGLE SIGN-ON
                 The information system provides a single sign-on capability for [Assignment: organization-defined list of information
                 system accounts and services].
                 Supplemental Guidance: Single sign-on enables users to log in once and gain access to multiple
                 information system resources. Organizations consider the operational efficiencies provided by single
                 sign-on capabilities with the increased risk from disclosures of single authenticators providing access
                 to multiple system resources.
           (11) IDENTIFICATION AND AUTHENTICATION | REMOTE ACCESS - SEPARATE DEVICE
                 The information system implements multifactor authentication for remote access to privileged and non-privileged
                 accounts such that one of the factors is provided by a device separate from the system gaining access and the
                 device meets [Assignment: organization-defined strength of mechanism requirements].
                 Supplemental Guidance: For remote access to privileged/non-privileged accounts, the purpose of
                 requiring a device that is separate from the information system gaining access for one of the factors
                 during multifactor authentication is to reduce the likelihood of compromising authentication
                 credentials stored on the system. For example, adversaries deploying malicious code on organizational
                 information systems can potentially compromise such credentials resident on the system and
                 subsequently impersonate authorized users. Related control: AC-6.
           (12) IDENTIFICATION AND AUTHENTICATION | ACCEPTANCE OF PIV CREDENTIALS
                 The information system accepts and electronically verifies Personal Identity Verification (PIV) credentials.
                 Supplemental Guidance: This control enhancement applies to organizations implementing logical access
                 control systems (LACS) and physical access control systems (PACS). Personal Identity Verification
                 (PIV) credentials are those credentials issued by federal agencies that conform to FIPS Publication 201
                 and supporting guidance documents. OMB Memorandum 11-11 requires federal agencies to continue
                 implementing the requirements specified in HSPD-12 to enable agency-wide use of PIV credentials.
                 Related controls: AU-2, PE-3, SA-4.
                  PIV example: The DoD endpoint CAC is DoD’s version of a PIV card.
           (13) IDENTIFICATION AND AUTHENTICATION | OUT-OF-BAND AUTHENTICATION
                 The information system implements [Assignment: organization-defined out-of-band authentication] under
                 [Assignment: organization-defined conditions].
                 Supplemental Guidance: Out-of-band authentication (OOBA) refers to the use of two separate
                 communication paths to identify and authenticate users or devices to an information system. The first
                 path (i.e., the in-band path), is used to identify and authenticate users or devices, and generally is the
                 path through which information flows. The second path (i.e., the out-of-band path) is used to
                 independently verify the authentication and/or requested action. For example, a user authenticates via a
                 notebook computer to a remote server to which the user desires access, and requests some action of the
                 server via that communication path. Subsequently, the server contacts the user via the user’s cell phone
                 to verify that the requested action originated from the user. The user may either confirm the intended
                 action to an individual on the telephone or provide an authentication code via the telephone. This type
                 of authentication can be employed by organizations to mitigate actual or suspected man-in the-middle
                 attacks. The conditions for activation can include, for example, suspicious activities, new threat
                 indicators or elevated threat levels, or the impact level or classification level of information in
                 requested transactions. Related controls: IA-10, IA-11, SC-37.
           References: HSPD-12; OMB Memoranda 04-04, 06-16, 11-11; FIPS Publication 201; NIST Special
           Publications 800-63, 800-73, 800-76, 800-78; FICAM Roadmap and Implementation Guidance; Web:
           http://idmanagement.gov.

IA-3       DEVICE IDENTIFICATION AND AUTHENTICATION

           Control: The information system uniquely identifies and authenticates all types of devices before
           establishing a network connection.
           Supplemental Guidance: Organizational devices requiring unique device-to-device identification and
           authentication may be defined by type, by device, or by a combination of type/device. Information systems
           typically use either shared known information (e.g., Media Access Control [MAC] or Transmission Control
           Protocol/Internet Protocol [TCP/IP] addresses) for device identification or organizational authentication
           solutions (e.g., IEEE 802.1x and Extensible Authentication Protocol [EAP], Radius server with EAP-
           Transport Layer Security [TLS] authentication, Kerberos) to identify/authenticate devices on local and/or
           wide area networks. Organizations determine the required strength of authentication mechanisms by the
           security categories of information systems. Because of the challenges of applying this control on large
           scale, organizations are encouraged to only apply the control to those limited number (and type) of devices
           that truly need to support this capability. Related controls: AC-17, AC-18, AC-19, CA-3, IA-4, IA-5.
               This includes, but is not limited to servers, workstations, multi-function machines, printers,
               routers, scanners, firewalls, VoIP telephones, video and VoIP (VVOIP), desktop video
               teleconference (VTC) devices, etc.
           Control Enhancements:
           (1)   DEVICE IDENTIFICATION AND AUTHENTICATION | CRYPTOGRAPHIC BIDIRECTIONAL AUTHENTICATION
                 The information system authenticates [Assignment: organization-defined specific devices and/or types of devices]
                 before establishing [Selection (one or more): local; remote; network] connection using bidirectional authentication
                 that is cryptographically based.
                 Supplemental Guidance: A local connection is any connection with a device communicating without the
                 use of a network. A network connection is any connection with a device that communicates through a
                 network (e.g., local area or wide area network, Internet). A remote connection is any connection with a
                 device communicating through an external network (e.g., the Internet). Bidirectional authentication
                 provides stronger safeguards to validate the identity of other devices for connections that are of greater
                 risk (e.g., remote connections). Related controls: SC-8, SC-12, SC-13.
                   NSA approved or FIPS 140-2 compliant. Reference SC-13.
           (2)   DEVICE IDENTIFICATION AND AUTHENTICATION | CRYPTOGRAPHIC BIDIRECTIONAL NETWORK AUTHENTICATION
                 [Withdrawn: Incorporated into IA-3 (1)].
           (3)   DEVICE IDENTIFICATION AND AUTHENTICATION | DYNAMIC ADDRESS ALLOCATION
                 The organization:
                 (a)   Standardizes dynamic address allocation lease information and the lease duration assigned to devices in
                       accordance with [Assignment: organization-defined lease information and lease duration]; and
                 (b) Audits lease information when assigned to a device.
                 Supplemental Guidance: DHCP-enabled clients obtaining leases for IP addresses from DHCP servers, is
                 a typical example of dynamic address allocation for devices. Related controls: AU-2, AU-3, AU-6,
                 AU-12.
           (4)   DEVICE IDENTIFICATION AND AUTHENTICATION | DEVICE ATTESTATION
                 The organization ensures that device identification and authentication based on attestation is handled by
                 [Assignment: organization-defined configuration management process].
                 Supplemental Guidance: Device attestation refers to the identification and authentication of a device
                 based on its configuration and known operating state. This might be determined via some
                 cryptographic hash of the device. If device attestation is the means of identification and authentication,
                 then it is important that patches and updates to the device are handled via a configuration management
                 process such that the those patches/updates are done securely and at the same time do not disrupt the
                 identification and authentication to other devices.
           References: None.

IA-4       IDENTIFIER MANAGEMENT

           Control: The organization manages information system identifiers by:

           a.    Receiving authorization from [Assignment: organization-defined personnel or roles] to assign an
                 individual, group, role, or device identifier;
           b.    Selecting an identifier that identifies an individual, group, role, or device;
           c.    Assigning the identifier to the intended individual, group, role, or device;
           d.    Preventing reuse of identifiers for [the life of the system for individuals, groups, roles]; and
           e.    Disabling the identifier after [a period not to exceed 90 days of inactivity for individuals, groups,
                 or roles; not appropriate to define for device identifiers (e.g., media access control (MAC),
                 Internet protocol (IP) addresses, or device-unique token identifiers)].
           Supplemental Guidance: Common device identifiers include, for example, media access control (MAC),
           Internet protocol (IP) addresses, or device-unique token identifiers. Management of individual identifiers is
           not applicable to shared information system accounts (e.g., guest and anonymous accounts). Typically,
           individual identifiers are the user names of the information system accounts assigned to those individuals.
           In such instances, the account management activities of AC-2 use account names provided by IA-4. This
           control also addresses individual identifiers not necessarily associated with information system accounts
           (e.g., identifiers used in physical security control databases accessed by badge reader systems for access to
           information systems). Preventing reuse of identifiers implies preventing the assignment of previously used
           individual, group, role, or device identifiers to different individuals, groups, roles, or devices. Related
           controls: AC-2, IA-2, IA-3, IA-5, IA-8, SC-37.
               Individual user identifiers (USERIDs) are used for identification of users on SAP
               information systems, which shall be standardized (e.g., last name first initial, first.lastname)
               for each system. IA-2 addresses the use of unique identifiers.
           Control Enhancements:
           (1)   IDENTIFIER MANAGEMENT | PROHIBIT ACCOUNT IDENTIFIERS AS PUBLIC IDENTIFIERS
                 The organization prohibits the use of information system account identifiers that are the same as public identifiers for
                 individual electronic mail accounts.
                 Supplemental Guidance: Prohibiting the use of information systems account identifiers that are the same
                 as some public identifier such as the individual identifier section of an electronic mail address, makes
                 it more difficult for adversaries to guess user identifiers on organizational information systems. Related
                 control: AT-2.
           (2)   IDENTIFIER MANAGEMENT | SUPERVISOR AUTHORIZATION
                 The organization requires that the registration process to receive an individual identifier includes supervisor
                 authorization.
           (3)   IDENTIFIER MANAGEMENT | MULTIPLE FORMS OF CERTIFICATION
                 The organization requires multiple forms of certification of individual identification such as documentary evidence or a
                 combination of documents and biometrics be presented to the registration authority.
                 Supplemental Guidance: Requiring multiple forms of identification reduces the likelihood of individuals
                 using fraudulent identification to establish an identity, or at least increases the work factor of potential
                 adversaries.
           (4)   IDENTIFIER MANAGEMENT | IDENTIFY USER STATUS
                 The organization manages individual identifiers by uniquely identifying each individual as a contractor, government
                 (civilian, military), and/or foreign nationality as appropriate.
                 Supplemental Guidance: Characteristics identifying the status of individuals include, for example,
                 contractors and foreign nationals. Identifying the status of individuals by specific characteristics
                 provides additional information about the people with whom organizational personnel are
                 communicating. For example, it might be useful for a government employee to know that one of the
                 individuals on an email message is a contractor. Related control: AT-2.
                   Examples: john.smith.ctr, john.smith.civ, john.smith.uk

           (5)   IDENTIFIER MANAGEMENT | DYNAMIC MANAGEMENT
                 The information system dynamically manages identifiers.
                 Supplemental Guidance: In contrast to conventional approaches to identification which presume static
                 accounts for preregistered users, many distributed information systems including, for example, service-
                 oriented architectures, rely on establishing identifiers at run time for entities that were previously
                 unknown. In these situations, organizations anticipate and provision for the dynamic establishment of
                 identifiers. Preestablished trust relationships and mechanisms with appropriate authorities to validate
                 identities and related credentials are essential. Related control: AC-16.
           (6)   IDENTIFIER MANAGEMENT | CROSS-ORGANIZATION MANAGEMENT
                 The organization coordinates with [Assignment: organization-defined external organizations] for cross-organization
                 management of identifiers.

                 Supplemental Guidance: Cross-organization identifier management provides the capability for
                 organizations to appropriately identify individuals, groups, roles, or devices when conducting cross-
                 organization activities involving the processing, storage, or transmission of information.
           (7)   IDENTIFIER MANAGEMENT | IN-PERSON REGISTRATION
                 The organization requires that the registration process to receive an individual identifier be conducted in person
                 before a designated registration authority.
                 Supplemental Guidance: In-person registration reduces the likelihood of fraudulent identifiers being
                 issued because it requires the physical presence of individuals and actual face-to-face interactions with
                 designated registration authorities.
           References: FIPS Publication 201; NIST Special Publications 800-73, 800-76, 800-78.

IA-5       AUTHENTICATOR MANAGEMENT

           Control: The organization manages information system authenticators by:

           a.    Verifying, as part of the initial authenticator distribution, the identity of the individual, group, role, or
                 device receiving the authenticator;
           b.    Establishing initial authenticator content for authenticators defined by the organization;
           c.    Ensuring that authenticators have sufficient strength of mechanism for their intended use;
           d.    Establishing and implementing administrative procedures for initial authenticator distribution, for
                 lost/compromised or damaged authenticators, and for revoking authenticators;
           e.    Changing default content of authenticators prior to information system installation;
           f.    Establishing minimum and maximum lifetime restrictions and reuse conditions for authenticators;
           g. Changing/refreshing authenticators within a time period not to exceed ninety (90) days for
                 passwords; system defined time period for other authenticator types;
           h.    Protecting authenticator content from unauthorized disclosure and modification;
           i.    Requiring individuals to take, and having devices implement, specific security safeguards to protect
                 authenticators; and
           j.    Changing authenticators for group/role accounts when membership to those accounts changes.
           Supplemental Guidance: Individual authenticators include, for example, passwords, tokens, biometrics, PKI
           certificates, and key cards. Initial authenticator content is the actual content (e.g., the initial password) as
           opposed to requirements about authenticator content (e.g., minimum password length). In many cases,
           developers ship information system components with factory default authentication credentials to allow for
           initial installation and configuration. Default authentication credentials are often well known, easily
           discoverable, and present a significant security risk. The requirement to protect individual authenticators
           may be implemented via control PL-4 or PS-6 for authenticators in the possession of individuals and by
           controls AC-3, AC-6, and SC-28 for authenticators stored within organizational information systems (e.g.,
           passwords stored in hashed or encrypted formats, files containing encrypted or hashed passwords

           accessible with administrator privileges). Information systems support individual authenticator
           management by organization-defined settings and restrictions for various authenticator characteristics
           including, for example, minimum password length, password composition, validation time window for time
           synchronous one-time tokens, and number of allowed rejections during the verification stage of biometric
           authentication. Specific actions that can be taken to safeguard authenticators include, for example,
           maintaining possession of individual authenticators, not loaning or sharing individual authenticators with
           others, and reporting lost, stolen, or compromised authenticators immediately. Authenticator management
           includes issuing and revoking, when no longer needed, authenticators for temporary access such as that
           required for remote maintenance. Device authenticators include, for example, certificates and passwords.
           Related controls: AC-2, AC-3, AC-6, CM-6, IA-2, IA-4, IA-8, PL-4, PS-5, PS-6, SC-12, SC-13, SC-17,
           SC-28.
               Passwords must meet standards for strong passwords. Examples of situations that may
               require tailoring include, but are not limited to:
                     •    The password mechanism does not support strong password requirements.
                     •    The password is one factor of an authorized, multifactor authentication means.
                     •    The password is used by a system process (as opposed to an interactive user session).
               Shared (Group) Password [IA-5.a and .j]
               An account password shared among a group of users (i.e., group account) shall be
               specifically documented in the SSP and authorized for use by the AO or designee. If
               specifically authorized, shared account passwords must not knowingly be the same for any
               other account and shall be changed if a user leaves the group.
           Control Enhancements:
           (1)   AUTHENTICATOR MANAGEMENT | PASSWORD-BASED AUTHENTICATION
                 The information system, for password-based authentication:
                 (a)     Enforces minimum password complexity of:
                 o       At least eight (8) characters in length for non-privileged accounts and twelve (12) characters in length
                         for privileged accounts; contains a string of characters that does not include the user’s account name
                         or full name; includes one or more characters from at least three (3) of the following four ( 4) character
                         classes:
                                 English uppercase characters (A through Z);
                                 English lowercase characters (a through z);
                                 Base l0 digits (0 through 9); and
                                 Special characters from the punctuation and extended character set (`~!@#$%^*&()_+-
                                  ={}|[]\”;<>?,./).
                 (b) Enforces at least the following number of changed characters when new passwords are created: a minimum
                     of four (4) changed characters;
                 (c)     Stores and transmits only cryptographically-protected passwords;
                 (d) Enforces password minimum and maximum lifetime restrictions of at least one (1) day lifetime minimum and
                     90 day lifetime maximum;

                 (e)     Prohibits password reuse for a minimum of twenty-four (24) passwords generations; and
                 (f)     Allows the use of a temporary password for system logons with an immediate change to a permanent
                         password.

                 Supplemental Guidance: This control enhancement applies to single-factor authentication of individuals
                 using passwords as individual or group authenticators, and in a similar manner, when passwords are
                 part of multifactor authenticators. This control enhancement does not apply when passwords are used
                 to unlock hardware authenticators (e.g., Personal Identity Verification cards). The implementation of
                 such password mechanisms may not meet all of the requirements in the enhancement.
                 Cryptographically-protected passwords include, for example, encrypted versions of passwords and
                 one-way cryptographic hashes of passwords. The number of changed characters refers to the number
                 of changes required with respect to the total number of positions in the current password. Password

                 lifetime restrictions do not apply to temporary passwords. To mitigate certain brute force attacks
                 against passwords, organizations may also consider salting passwords. Related control: IA-6.
                  These password requirements are for English display language. Other display languages
                  should use equivalent password strength requirements.
                  Passwords shall not be stored on an information system in clear text. An authorized,
                  non-reversible, encryption algorithm (e.g., hash algorithm) shall be used to transform a
                  password into a format that may be stored in a password file for use during subsequent
                  password-validation. Passwords and password files, when transmitted using electronic
                  means, shall be encrypted using an authorized algorithm.
                  An approved product vendor’s current password hashing algorithm is an authorized
                  algorithm when used on a protected network.
                  When possible, systems shall be configured to automatically notify the user of the
                  requirement to change their password at least fourteen (l4) days before its expiration.
                  The minimum age restriction does not apply to the initial change of a password, help
                  desk password reset, or when compromise of a password is known or suspected.
           (2)   AUTHENTICATOR MANAGEMENT | PKI-BASED AUTHENTICATION
                 The information system, for PKI-based authentication:
                 (a)   Validates certifications by constructing and verifying a certification path to an accepted trust anchor including
                       checking certificate status information;
                 (b)   Enforces authorized access to the corresponding private key;
                 (c)   Maps the authenticated identity to the account of the individual or group; and
                 (d)   Implements a local cache of revocation data to support path discovery and validation in case of inability to
                       access revocation information via the network.
                 Supplemental Guidance: Status information for certification paths includes, for example, certificate
                 revocation lists or certificate status protocol responses. For PIV cards, validation of certifications
                 involves the construction and verification of a certification path to the Common Policy Root trust
                 anchor including certificate policy processing. Related control: IA-6.
                  Organizations shall ensure that remote sessions for accessing information systems
                  employ PKI certificates issued by a government-approved registration authority and are
                  audited. If PKI is not feasible, security measures above and beyond standard bulk or
                  session layer encryption shall be implemented (e.g., Secure Shell or VPN with blocking
                  mode enabled) [AC-17(7)].
           (3)   AUTHENTICATOR MANAGEMENT | IN-PERSON OR TRUSTED THIRD-PARTY REGISTRATION
                 The organization requires that the registration process to receive UserIDs and passwords be conducted in person
                 or by a trusted third party before [Assignment: organization-defined registration authority] with authorization by
                 [Assignment: organization-defined personnel or roles].

                  The registration process to receive USERIDs and passwords should be carried out via
                  physical face-to-face or video and desktop teleconference, to the maximum extent
                  possible. The identity of a user receiving a password must be verified as part of initial
                  distribution of the password, using valid government identification (i.e., common access
                  card (CAC), driver’s license, or passport). Passwords issued shall be temporary and used
                  “one time,” expiring immediately upon log-in.

                  For situations where face-to-face distribution is not feasible, due to location of the user in
                  relation to the distribution agent, system access credentials may also be disseminated
                  using one of the following methods identified below:
                       •    Email to the user, via digitally signed and encrypted email using PKI, over a
                            network that meets or exceeds the classification level of the network to which
                            system access is being requested. Where PKI is not available, distribution via
                            email with a “read receipt” or acknowledgement of receipt of email from the
                            recipient is authorized as an acceptable alternative.
                       •    Email to the supervisor or co-worker (when the supervisor is not available) via
                            digitally signed and encrypted email using PKI, over a network that meets or
                            exceeds the classification level of the network to which system access is being
                            requested. Where PKI is not available, distribution via email with a “read
                            receipt” or acknowledgement of receipt of email from the recipient is authorized
                            as an acceptable alternative.
                       •    Secure telephone, after validating the employee’s personal information in the
                            appropriate database: name, USERID, date of birth and place of birth or other
                            agreed upon security questions. System access credentials disseminated via
                            secure telephone shall only be distributed over a network that meets or exceeds
                            the classification of the network to which system access is being requested.
                  The organization will define the process of how non-user entities are issued
                  authenticators as appropriate.
           (4)   AUTHENTICATOR MANAGEMENT | AUTOMATED SUPPORT FOR PASSWORD STRENGTH DETERMINATION
                 The organization employs automated tools to determine if password authenticators are sufficiently strong to satisfy
                 requirements as defined in IA-5 (1).
                 Supplemental Guidance: This control enhancement focuses on the creation of strong passwords and the
                 characteristics of such passwords (e.g., complexity) prior to use, the enforcement of which is carried
                 out by organizational information systems in IA-5 (1). Related controls: CA-2, CA-7, RA-5.
                  Passwords should be sufficiently strong to resist “password cracking” and other types of
                  attacks intended to discover users’ passwords. Information resources should use
                  automated password filters to verify that passwords are created consistent with this
                  document. Automated tools should be accessible to assist users with checking password
                  strengths and generating passwords. A password cracking method shall be used only
                  with written AO authorization providing explicit direction for use during vulnerability
                  testing. Only authorized personnel will have access to and use password cracking tools.
                  Reference IA-5(1)(a) and (b) for password requirements.
           (5)   AUTHENTICATOR MANAGEMENT | CHANGE AUTHENTICATORS PRIOR TO DELIVERY
                 The organization requires developers/installers of information system components to provide unique authenticators
                 or change default authenticators prior to delivery/installation.
                 Supplemental Guidance: This control enhancement extends the requirement for organizations to change
                 default authenticators upon information system installation, by requiring developers and/or installers to
                 provide unique authenticators or change default authenticators for system components prior to delivery
                 and/or installation. However, it typically does not apply to the developers of commercial off-the-shelve
                 information technology products. Requirements for unique authenticators can be included in
                 acquisition documents prepared by organizations when procuring information systems or system
                 components.
           (6)   AUTHENTICATOR MANAGEMENT | PROTECTION OF AUTHENTICATORS
                 The organization protects authenticators commensurate with the security category of the information to which use of
                 the authenticator permits access.

                 Supplemental Guidance: For information systems containing multiple security categories of information
                 without reliable physical or logical separation between categories, authenticators used to grant access
                 to the systems are protected commensurate with the highest security category of information on the
                 systems.
                  Protect all authenticators (e.g., passwords, smart card personal identification numbers
                  (PIN)/passwords, PKI private certificates) from disclosure to entities other than the user,
                  system authentication components, and the authorized authenticator distribution entities.
                  Single factor authenticators shall be protected commensurate with the information
                  sensitivity accessible by the associated entity. Organization procedures shall implement
                  this protection. Users must take precautions when entering passwords to ensure that no
                  unauthorized individual observes their password keystrokes. Examples for protecting
                  individual authenticators are provided in IA-5 Supplemental Guidance above; the
                  requirement is implemented using PL-4 and/or PS-6. [IA-5.h]
           (7)   AUTHENTICATOR MANAGEMENT | NO EMBEDDED UNENCRYPTED STATIC AUTHENTICATORS
                 The organization ensures that unencrypted static authenticators are not embedded in applications or access scripts
                 or stored on function keys.
                 Supplemental Guidance: Organizations exercise caution in determining whether embedded or stored
                 authenticators are in encrypted or unencrypted form. If authenticators are used in the manner stored,
                 then those representations are considered unencrypted authenticators. This is irrespective of whether
                 that representation is perhaps an encrypted version of something else (e.g., a password).
           (8)   AUTHENTICATOR MANAGEMENT | MULTIPLE INFORMATION SYSTEM ACCOUNTS
                 The organization implements precautions including advising users that they must not use the same password
                 for any of the following: Different systems with domains of differing classification levels; Access to different
                 systems within one classification level (e.g., internal agency network and Intelink).; Different accounts with
                 different privilege levels (e.g., user, administrator) to manage the risk of compromise due to individuals having
                 accounts on multiple information systems.
                 Supplemental Guidance: When individuals have accounts on multiple information systems, there is the
                 risk that the compromise of one account may lead to the compromise of other accounts if individuals
                 use the same authenticators. Possible alternatives include, for example: (i) having different
                 authenticators on all systems; (ii) employing some form of single sign-on mechanism; or (iii) including
                 some form of one-time passwords on all systems.
           (9)   AUTHENTICATOR MANAGEMENT | CROSS-ORGANIZATION CREDENTIAL MANAGEMENT
                 The organization coordinates with [Assignment: organization-defined external organizations] for cross-organization
                 management of credentials.
                 Supplemental Guidance: Cross-organization management of credentials provides the capability for
                 organizations to appropriately authenticate individuals, groups, roles, or devices when conducting
                 cross-organization activities involving the processing, storage, or transmission of information.
           (10) AUTHENTICATOR MANAGEMENT | DYNAMIC CREDENTIAL ASSOCIATION
                 The information system dynamically provisions identities.
                 Supplemental Guidance: Authentication requires some form of binding between an identity and the
                 authenticator used to confirm the identity. In conventional approaches, this binding is established by
                 pre-provisioning both the identity and the authenticator to the information system. For example, the
                 binding between a username (i.e., identity) and a password (i.e., authenticator) is accomplished by
                 provisioning the identity and authenticator as a pair in the information system. New authentication
                 techniques allow the binding between the identity and the authenticator to be implemented outside an
                 information system. For example, with smartcard credentials, the identity and the authenticator are
                 bound together on the card. Using these credentials, information systems can authenticate identities
                 that have not been pre-provisioned, dynamically provisioning the identity after authentication. In these
                 situations, organizations can anticipate the dynamic provisioning of identities. Preestablished trust
                 relationships and mechanisms with appropriate authorities to validate identities and related credentials
                 are essential.

           (11) AUTHENTICATOR MANAGEMENT | HARDWARE TOKEN-BASED AUTHENTICATION
               The information system, for hardware token-based authentication, employs mechanisms that satisfy [Assignment:
               organization-defined token quality requirements].
               Supplemental Guidance: Hardware token-based authentication typically refers to the use of PKI-based
               tokens, such as the U.S. Government Personal Identity Verification (PIV) card. Organizations define
               specific requirements for tokens, such as working with a particular PKI.
           (12) AUTHENTICATOR MANAGEMENT | BIOMETRIC AUTHENTICATION
               The information system, for biometric-based authentication, employs mechanisms that satisfy [Assignment:
               organization-defined biometric quality requirements].
               Supplemental Guidance: Unlike password-based authentication which provides exact matches of user-
               input passwords to stored passwords, biometric authentication does not provide such exact matches.
               Depending upon the type of biometric and the type of collection mechanism, there is likely to be some
               divergence from the presented biometric and stored biometric which serves as the basis of comparison.
               There will likely be both false positives and false negatives when making such comparisons. The rate
               at which the false accept and false reject rates are equal is known as the crossover rate. Biometric
               quality requirements include, for example, acceptable crossover rates, as that essentially reflects the
               accuracy of the biometric.
           (13) AUTHENTICATOR MANAGEMENT | EXPIRATION OF CACHED AUTHENTICATORS
               The information system prohibits the use of cached authenticators after one (1) hour.
           (14) AUTHENTICATOR MANAGEMENT | MANAGING CONTENT OF PKI TRUST STORES
               The organization, for PKI-based authentication, employs a deliberate organization-wide methodology for managing
               the content of PKI trust stores installed across all platforms including networks, operating systems, browsers, and
               applications.
           (15) AUTHENTICATOR MANAGEMENT | FICAM-APPROVED PRODUCTS AND SERVICES
               The organization uses only FICAM-approved path discovery and validation products and services.
               Supplemental Guidance: Federal Identity, Credential, and Access Management (FICAM)-approved path
               discovery and validation products and services are those products and services that have been approved
               through the FICAM conformance program, where applicable.
           References: OMB Memoranda 04-04, 11-11; FIPS Publication 201; NIST Special Publications 800-73,
           800-63, 800-76, 800-78; FICAM Roadmap and Implementation Guidance; Web: http://idmanagement.gov.

IA-6       AUTHENTICATOR FEEDBACK

           Control: The information system obscures feedback of authentication information during the authentication
           process to protect the information from possible exploitation/use by unauthorized individuals.
           Supplemental Guidance: The feedback from information systems does not provide information that would
           allow unauthorized individuals to compromise authentication mechanisms. For some types of information
           systems or system components, for example, desktops/notebooks with relatively large monitors, the threat
           (often referred to as shoulder surfing) may be significant. For other types of systems or components, for
           example, mobile devices with 2-4 inch screens, this threat may be less significant, and may need to be
           balanced against the increased likelihood of typographic input errors due to the small keyboards. Therefore,
           the means for obscuring the authenticator feedback is selected accordingly. Obscuring the feedback of
           authentication information includes, for example, displaying asterisks when users type passwords into input
           devices, or displaying feedback for a very limited time before fully obscuring it. Related control: PE-18.
           Control Enhancements: None.

           References: None.

IA-7       CRYPTOGRAPHIC MODULE AUTHENTICATION

           Control: The information system implements mechanisms for authentication to a cryptographic module that
           meet the requirements of applicable federal laws, Executive Orders, directives, policies, regulations,
           standards, and guidance for such authentication.

           Supplemental Guidance: Authentication mechanisms may be required within a cryptographic module to
           authenticate an operator accessing the module and to verify that the operator is authorized to assume the
           requested role and perform services within that role. Related controls: SC-12, SC-13.
               FIPS 140-2 validated cryptographic modules are often used to protect unclassified sensitive
               information in computer and telecommunication systems (including voice systems).
               Classified information systems use NSA-validated cryptographic modules.
           Control Enhancements: None.

           References: FIPS Publication 140; Web: http://csrc.nist.gov/groups/STM/cmvp/index.html.

IA-8       IDENTIFICATION AND AUTHENTICATION (NON-ORGANIZATIONAL USERS)

           Control: The information system uniquely identifies and authenticates non-organizational users (or
           processes acting on behalf of non-organizational users).
           Supplemental Guidance: Non-organizational users include information system users other than organizational
           users explicitly covered by IA-2. These individuals are uniquely identified and authenticated for accesses
           other than those accesses explicitly identified and documented in AC-14. In accordance with the E-
           Authentication E-Government initiative, authentication of non-organizational users accessing federal
           information systems may be required to protect federal, proprietary, or privacy-related information (with
           exceptions noted for national security systems). Organizations use risk assessments to determine
           authentication needs and consider scalability, practicality, and security in balancing the need to ensure ease
           of use for access to federal information and information systems with the need to protect and adequately
           mitigate risk. IA-2 addresses identification and authentication requirements for access to information
           systems by organizational users. Related controls: AC-2, AC-14, AC-17, AC-18, IA-2, IA-4, IA-5, MA-4,
           RA-3, SA-12, SC-8.
           Control Enhancements:
           (1)   IDENTIFICATION AND AUTHENTICATION | ACCEPTANCE OF PIV CREDENTIALS FROM OTHER AGENCIES
                 The information system accepts and electronically verifies Personal Identity Verification (PIV) credentials from other
                 federal agencies.
                 Supplemental Guidance: This control enhancement applies to logical access control systems (LACS) and
                 physical access control systems (PACS). Personal Identity Verification (PIV) credentials are those
                 credentials issued by federal agencies that conform to FIPS Publication 201 and supporting guidance
                 documents. OMB Memorandum 11-11 requires federal agencies to continue implementing the
                 requirements specified in HSPD-12 to enable agency-wide use of PIV credentials. Related controls:
                 AU-2, PE-3, SA-4.
           (2)   IDENTIFICATION AND AUTHENTICATION | ACCEPTANCE OF THIRD-PARTY CREDENTIALS
                 The information system accepts only FICAM-approved third-party credentials.
                 Supplemental Guidance: This control enhancement typically applies to organizational information
                 systems that are accessible to the general public, for example, public-facing websites. Third-party
                 credentials are those credentials issued by nonfederal government entities approved by the Federal
                 Identity, Credential, and Access Management (FICAM) Trust Framework Solutions initiative.
                 Approved third-party credentials meet or exceed the set of minimum federal government-wide
                 technical, security, privacy, and organizational maturity requirements. This allows federal government
                 relying parties to trust such credentials at their approved assurance levels. Related control: AU-2.
           (3)   IDENTIFICATION AND AUTHENTICATION | USE OF FICAM-APPROVED PRODUCTS
                 The organization employs only FICAM-approved information system components in [Assignment: organization-
                 defined information systems] to accept third-party credentials.
                 Supplemental Guidance: This control enhancement typically applies to information systems that are
                 accessible to the general public, for example, public-facing websites. FICAM-approved information
                 system components include, for example, information technology products and software libraries that
                 have been approved by the Federal Identity, Credential, and Access Management conformance
                 program. Related control: SA-4.

                  In lieu of FICAM-approved products, DoD SAPs shall use DoD-approved products.
           (4)   IDENTIFICATION AND AUTHENTICATION | USE OF FICAM-ISSUED PROFILES
                 The information system conforms to FICAM-issued profiles.
                 Supplemental Guidance: This control enhancement addresses open identity management standards. To
                 ensure that these standards are viable, robust, reliable, sustainable (e.g., available in commercial
                 information technology products), and interoperable as documented, the United States Government
                 assesses and scopes identity management standards and technology implementations against applicable
                 federal legislation, directives, policies, and requirements. The result is FICAM-issued implementation
                 profiles of approved protocols (e.g., FICAM authentication protocols such as SAML 2.0 and OpenID
                 2.0, as well as other protocols such as the FICAM Backend Attribute Exchange). Related control: SA-
                 4.
                  In lieu of FICAM-approved profiles, DoD SAPs shall use DoD-approved
                  implementations.
           (5)   IDENTIFICATION AND AUTHENTICATION | ACCEPTANCE OF PIV-I CREDENTIALS
                 The information system accepts and electronically verifies Personal Identity Verification-I (PIV-I) credentials.
                 Supplemental Guidance: This control enhancement: (i) applies to logical and physical access control
                 systems; and (ii) addresses Non-Federal Issuers (NFIs) of identity cards that desire to interoperate with
                 United States Government Personal Identity Verification (PIV) information systems and that can be
                 trusted by federal government-relying parties. The X.509 certificate policy for the Federal Bridge
                 Certification Authority (FBCA) addresses PIV-I requirements. The PIV-I card is suitable for
                 Assurance Level 4 as defined in OMB Memorandum 04-04 and NIST Special Publication 800-63, and
                 multifactor authentication as defined in NIST Special Publication 800-116. PIV-I credentials are those
                 credentials issued by a PIV-I provider whose PIV-I certificate policy maps to the Federal Bridge PIV-I
                 Certificate Policy. A PIV-I provider is cross-certified (directly or through another PKI bridge) with the
                 FBCA with policies that have been mapped and approved as meeting the requirements of the PIV-I
                 policies defined in the FBCA certificate policy. Related control: AU-2.
           References: OMB Memoranda 04-04, 11-11, 10-06-2011; FICAM Roadmap and Implementation Guidance;
           FIPS Publication 201; NIST Special Publications 800-63, 800-116; National Strategy for Trusted Identities
           in Cyberspace; Web: http://idmanagement.gov.

IA-9       SERVICE IDENTIFICATION AND AUTHENTICATION

           Control: The organization identifies and authenticates [Assignment: organization-defined information
           system services] using [Assignment: organization-defined security safeguards].
           Supplemental Guidance: This control supports service-oriented architectures and other distributed
           architectural approaches requiring the identification and authentication of information system services. In
           such architectures, external services often appear dynamically. Therefore, information systems should be
           able to determine in a dynamic manner, if external providers and associated services are authentic.
           Safeguards implemented by organizational information systems to validate provider and service
           authenticity include, for example, information or code signing, provenance graphs, and/or electronic
           signatures indicating or including the sources of services.
           Control Enhancements:
           (1)   SERVICE IDENTIFICATION AND AUTHENTICATION | INFORMATION EXCHANGE
                 The organization ensures that service providers receive, validate, and transmit identification and authentication
                 information.
           (2)   SERVICE IDENTIFICATION AND AUTHENTICATION | TRANSMISSION OF DECISIONS
                 The organization ensures that identification and authentication decisions are transmitted between [Assignment:
                 organization-defined services] consistent with organizational policies.
                 Supplemental Guidance: For distributed architectures (e.g., service-oriented architectures), the decisions
                 regarding the validation of identification and authentication claims may be made by services separate
                 from the services acting on those decisions. In such situations, it is necessary to provide the

               identification and authentication decisions (as opposed to the actual identifiers and authenticators) to
               the services that need to act on those decisions. Related control: SC-8.
           References: None.

IA-10      ADAPTIVE IDENTIFICATION AND AUTHENTICATION

           Control: The organization requires that individuals accessing the information system employ [Assignment:
           organization-defined supplemental authentication techniques or mechanisms] under specific [Assignment:
           organization-defined circumstances or situations].
           Supplemental Guidance: Adversaries may compromise individual authentication mechanisms and
           subsequently attempt to impersonate legitimate users. This situation can potentially occur with any
           authentication mechanisms employed by organizations. To address this threat, organizations may employ
           specific techniques/mechanisms and establish protocols to assess suspicious behavior (e.g., individuals
           accessing information that they do not typically access as part of their normal duties, roles, or
           responsibilities, accessing greater quantities of information than the individuals would routinely access, or
           attempting to access information from suspicious network addresses). In these situations when certain
           preestablished conditions or triggers occur, organizations can require selected individuals to provide
           additional authentication information. Another potential use for adaptive identification and authentication is
           to increase the strength of mechanism based on the number and/or types of records being accessed. Related
           controls: AU-6, SI-4.
           Control Enhancements: None.

           References: None.

IA-11      RE-AUTHENTICATION

           Control: The organization requires users and devices to re-authenticate when [Assignment: organization-
           defined circumstances or situations requiring re-authentication].
           Supplemental Guidance: In addition to the re-authentication requirements associated with session locks,
           organizations may require re-authentication of individuals and/or devices in other situations including, for
           example: (i) when authenticators change; (ii), when roles change; (iii) when security categories of
           information systems change; (iv), when the execution of privileged functions occurs; (v) after a fixed
           period of time; or (vi) periodically. Related control: AC-11.
           Control Enhancements: None.

           References: None.
