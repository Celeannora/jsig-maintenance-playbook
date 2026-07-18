# JSIG Appendix E - Definitions

Source URL: https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Archived source (used for extraction, direct URL returns HTTP 403): http://web.archive.org/web/20260405054539/https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Extraction note: Verbatim extraction via `pdftotext -layout` against the complete 378-page JSIG PDF (retrieved 2026-07-17 from the Wayback Machine snapshot below, since the direct DCSA URL returns HTTP 403). This supersedes any prior lower-fidelity extraction of this section. Running page headers/footers inserted by the PDF layout have been stripped; no wording has been added, summarized, or altered.

---

APPENDIX E:                Definitions
Application                        Software program that performs a specific function directly for a user
                                   and can be executed without access to system control, monitoring, or
                                   administrative privileges. [CNSSI 4009]
Clearing                           Clearing is the process of eradicating the data on media before reusing
                                   the media in an environment that provides an acceptable level of
                                   protection for the data that was on the media before clearing. In
                                   general, laboratory techniques allow the retrieval of information that
                                   has been cleared, but normal operations do not allow such retrieval.
Closed Source Software (CSS)       Also known as Proprietary software.
Commercial off-the-Shelf           Copyrighted or open source vendor software publicly available for
(COTS) Software                    purchase.
Controlled Interface (CI)          A boundary with a set of mechanisms that enforces the security
                                   policies and controls the flow of information between interconnected
                                   information systems. [CNSSI 4009]
Cross Domain Solution (CDS)        A form of controlled interface that provides the ability to manually
                                   and/or automatically access and/or transfer information between
                                   different security domains. [CNSSI 4009]
Data Spill or Classified           Classified data is spilled either onto an unclassified information system
Information Spillage               or to an information system with a lower [or different] level of
                                   classification [or access]. [CNSSI 4009] Also referred to as data
                                   exfiltration – the unauthorized transfer of data from a system.
Denial of Service (DoS) or         The prevention of authorized access to resources or the delaying of
Distributed Denial of Service      time-critical operations. DDoS is a technique that uses numerous hosts
(DDoS)                             to perform the attack. [CNSSI 4009]
Event                              Any observable occurrence in a system and/or network. Events
                                   sometimes provide indication that an incident is occurring. [CNSSI
                                   4009]
Freeware                           Copyrighted software given away for free by the author. Although it is
                                   available for free, the author retains the copyright and does not
                                   distribute source code, so other people cannot market the software as
                                   their own.
Government off-the-Shelf           Software developed with government funds for government use.
(GOTS) Software
Incident                           An assessed occurrence that actually or potentially jeopardizes the
                                   confidentially, integrity or availability of an information system; or the
                                   information the system processes, stores, or transmits; or that
                                   constitutes a violation or imminent threat of violation of security
                                   policies, security procedures or acceptable use policies.[CNSSI 4009]
Initial Denial Authority           An official granted authority by the head of a DoD Component to
                                   withhold records requested under the Freedom of Information Act.
Intellectual Property              Creations of the mind such as musical, literary, and artistic works;
                                   inventions; and symbols, names, images, and designs used in
                                   commerce, including copyrights, trademarks, patents, and related
                                   rights. Under intellectual property law, the holder of one of these
                                   abstract properties has certain exclusive rights to the creative work,
                                   commercial symbol, or invention by which it is covered.[CNSSI-4009]

Appendix E-Definitions                                                                            PAGE E-376
Local Area Network (LAN)     A group of computers and network devices connected together over a
                             relatively small geographic area. A LAN may be isolated – no
                             connections outside the system boundary or facility; or interconnected
                             to another system or LAN.
Mobile Device                Mobile devices include portable computing and communications
                             devices with information storage capability (e.g., notebook computers,
                             personal digital assistants, cellular telephones, digital cameras, and
                             audio recording devices). [NIST SP 800-53 Rev4] See also Portable
                             Electronic Device (PED).
Nonce                        A time-varying value that has at most a negligible chance of repeating,
                             for example, a random value that is generated anew for each use, a
                             timestamp, a sequence number, or some combination of these. [NIST
                             SP 800-102] [See also CNSSI 4009 definition]
Non-persistent Information   Any information not authorized to be stored within a facility, both
                             digital and non-digital. This includes ensuring that information
                             systems resident to a facility do not retain data locally after session
                             termination beyond what the facility is approved for. [See PE-1]
Open Source Software (OSS)   The 16 October 2009 memorandum from the DoD CIO, "Clarifying
                             Guidance Regarding Open Source Software (OSS)" defines OSS is
                             defined as “software for which the human-readable source code is
                             available for use, study, re-use, modification, enhancement, and
                             redistribution by the users of that software.” The program source code
                             is generally developed as a community in which programmers improve
                             upon the code and share the changes.
                             See http://dodcio.defense.gov/OpenSourceSoftwareFAQ.aspx for more
                             details.
Organization                 Within this document the entity identified as ‘organization’ varies. It
                             refers to that element (government unit or company) to which the ISO
                             belongs unless handled at a higher echelon.
Portable Electronic Device   Any non-stationary electronic apparatus with singular or multiple
(PED)                        capabilities of recording, storing, and/or transmitting data, voice,
                             video, or photo images. This includes but is not limited to laptops,
                             personal digital assistants, pocket personal computers, palmtops, MP3
                             players, cellular telephones, video cameras, and pagers.[CNSSI 4009]
Platform Information         Platform IT refers to computer resources, both hardware and software,
Technology (PIT)             that are physically part of, dedicated to, or essential in real time to the
                             mission performance of special purpose systems such as weapons,
                             training simulators, diagnostic test and maintenance equipment,
                             calibration equipment, equipment used in the research and
                             development of weapons systems, medical technologies, transport
                             vehicles, buildings, and utility distribution systems such as water and
                             electric. [DoD 8500.01E; DoDI 8580.1] Note: Do not choose this
                             definition unless your system is designated as a PIT.
Public Domain Software       Software not protected by copyright laws of any nation that may be
                             freely used without permission of, or payment to, the creator, and that
                             carries no warranties from, or liabilities to the creator. [CNSSI 4009]

Appendix E-Definitions                                                                      PAGE E-377
Security Enforcing         Operating System (OS), access control applications, audit applications,
                           device control applications, second party applications that perform IA,
                           account management, anti-virus, firewall; capable of making changes
                           to the security substructure of the system: modifies a user’s account or
                           changes permissions on objects such as enforcing Discretionary access
                           Control (DAC), Mandatory Access Control (MAC), Network Access
                           Control (NAC).
Security Non-interfering   Does not enforce or support any aspect of the system security policy,
                           but due to its presence inside the security boundary, e.g., code running
                           a privileged hardware mode within the OS, risk is elevated.
Security Supporting        Impacts a security process or procedures: e.g., software used to
                           perform technical review for Assured File Transfer (AFT); software
                           that is only used by privileged users of the system in the performance
                           of their duties; removing a backup server which may affect
                           availability; code or script that authenticates the user and determines
                           authorization.
Shareware                  Software distributed on the basis of an honor system. Most shareware
                           is delivered free of charge, but the author usually requests that the user
                           pay a small fee if they continue to use the program. By sending the
                           small fee, the user is registered with the producer who in turn provides
                           assistance and updates. Shareware is inexpensive because it is usually
                           produced by a single programmer and is offered directly to customers.
                           Thus, there is practically no packaging or advertising expenses. Note
                           that shareware differs from public-domain software in that shareware
                           is copyrighted and source code is not made available. This means that
                           the user cannot sell a shareware product as his/her own.
Standalone                 A standalone IS may include desktop, laptop, and notebook personal
                           computers, and any other hand-held electronic device containing
                           classified information. Standalone IS by definition are not connected
                           to any LAN or other type of network, i.e., peripherals allowed, but no
                           network interface card (NIC) in use, no protected distribution system
                           (PDS) in place, no additional computers connected.
State of the Practice      The highest level of development at a particular time (especially the
                           present time; e.g., current incident response tools/techniques; current
                           intrusion detection tools, techniques, procedures).
System Types               Examples include: LAN, WAN, standalone, CI, CDS, PIT, application
Unattended IS Components   Discovery of unlocked active session without user present.
Unattended Processing      Automated processes executed/running on a user’s behalf while no
                           users are physically present in the area/facility.
Unauthorized Access        Any access that violates the stated security policy. [CNSSI 4009]
Unauthorized Disclosure    An event involving the exposure of information to entities not
                           authorized access to the information. [CNSSI 4009]
Unauthorized Monitoring    Any monitoring of an IS without written approval from security
                           authorities.
Unauthorized Software      Software obtained through unofficial channels and installed without
                           proper approval.
Wide Area Network (WAN)    Computer network that spans a relatively large geographical area.

Appendix E-Definitions                                                                    PAGE E-378
