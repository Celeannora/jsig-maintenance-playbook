# JSIG Chapter 3 Media Protection (MP) Family

Source URL: https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Archived source (used for extraction, direct URL returns HTTP 403): http://web.archive.org/web/20260405054539/https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf

Extraction note: Verbatim extraction via `pdftotext -layout` against the complete 378-page JSIG PDF (retrieved 2026-07-17 from the Wayback Machine snapshot below, since the direct DCSA URL returns HTTP 403). This supersedes any prior lower-fidelity extraction of this section. Running page headers/footers inserted by the PDF layout have been stripped; no wording has been added, summarized, or altered.

---

FAMILY: MEDIA PROTECTION

MP-1      MEDIA PROTECTION POLICY AND PROCEDURES

          Control: The organization:

          a.     Develops, documents, and disseminates to all personnel:
                 1.   A media protection policy that addresses purpose, scope, roles, responsibilities, management
                      commitment, coordination among organizational entities, and compliance; and
                 2.   Procedures to facilitate the implementation of the media protection policy and associated media
                      protection controls; and
          b.     Reviews and updates the current:
                 1.   Media protection policy at least annually; and
                 2.   Media protection procedures at least annually.
          Supplemental Guidance: This control addresses the establishment of policy and procedures for the effective
          implementation of selected security controls and control enhancements in the MP family. Policy and
          procedures reflect applicable federal laws, Executive Orders, directives, regulations, policies, standards,
          and guidance. Security program policies and procedures at the organization level may make the need for
          system-specific policies and procedures unnecessary. The policy can be included as part of the general
          information security policy for organizations or conversely, can be represented by multiple policies
          reflecting the complex nature of certain organizations. The procedures can be established for the security
          program in general and for particular information systems, if needed. The organizational risk management
          strategy is a key factor in establishing policy and procedures. Related control: PM-9.
               DoD SAP-specific policy and procedures related to media protection are defined in the
               remainder of this section. Reference [SI-3] for scanning media for malicious code.
               Government issued media may only be used in the performance of assigned duties; personal
               use of government issued removable media is prohibited. Personally owned media are
               prohibited on all information systems.
               Media which is not write-protected and is placed into an IS must be protected at the highest
               level of information on the system until reviewed and validated.

               Reference CNSSP 26, National Policy on Reducing the Risk of Removable Media for
               National Security Systems.
          Control Enhancements: None.

          References: NIST Special Publications 800-12, 800-100.

MP-2      MEDIA ACCESS

          Control: The organization restricts access to all types of digital and/or non-digital media to [Assignment:
          organization-defined personnel or roles].
          Supplemental Guidance:   Information system media includes both digital and non-digital media. Digital
          media includes, for example, diskettes, magnetic tapes, external/removable hard disk drives, flash drives,
          compact disks, and digital video disks. Non-digital media includes, for example, paper and microfilm.
          Restricting non-digital media access includes, for example, denying access to patient medical records in a
          community hospital unless the individuals seeking access to such records are authorized healthcare
          providers. Restricting access to digital media includes, for example, limiting access to design specifications
          stored on compact disks in the media library to the project leader and the individuals on the development
          team. Related controls: AC-3, IA-2, MP-4, PE-2, PE-3, PL-2.

               The PSO/GSSO/CPSO provides security control measures for both digital and non-digital
               media. However, the term media throughout the rest of this media protection section refers to
               digital media as opposed to non-digital media (e.g., microfilm, paper).
               All digital media, and the use of such media, must be authorized by the PSO, or designee,
               prior to being introduced into the SAPF. Organizations are required to ensure the local
               facility SOP defines personnel/roles and security measures used to control access to media
               (i.e. centralized safe, media sign-out logs, media accountability logs, entry/exit procedures,
               etc.). Maintain a list of authorized users and their respective authorized use privileges.
               Personally-owned thumb drives, CDs, and DVDs are prohibited from entering SAP-
               accredited facilities without PSO approval.
          Control Enhancements:
          (1)    MEDIA ACCESS | AUTOMATED RESTRICTED ACCESS

                 [Withdrawn: Incorporated into MP-4 (2)].
          (2)    MEDIA ACCESS | CRYPTOGRAPHIC PROTECTION
                 [Withdrawn: Incorporated into SC-28 (1)].

          References: FIPS Publication 199; NIST Special Publication 800-111.

MP-3      MEDIA MARKING

          Control: The organization:

          a.     Marks information system media indicating the distribution limitations, handling caveats, and
                 applicable security markings (if any) of the information; and
          b.     Exempts new, unused, factory-sealed media from marking as long as the media remain within
                 [Assignment: organization-defined controlled areas].
          Supplemental Guidance: The term security marking refers to the application/use of human-readable security
          attributes. The term security labeling refers to the application/use of security attributes with regard to
          internal data structures within information systems (see AC-16). Information system media includes both
          digital and non-digital media. Digital media includes, for example, diskettes, magnetic tapes,
          external/removable hard disk drives, flash drives, compact disks, and digital video disks. Non-digital media
          includes, for example, paper and microfilm. Security marking is generally not required for media
          containing information determined by organizations to be in the public domain or to be publicly releasable.
          However, some organizations may require markings for public information indicating that the information
          is publicly releasable. Marking of information system media reflects applicable federal laws, Executive
          Orders, directives, policies, regulations, standards, and guidance. Related controls: AC-16, PL-2, RA-3.
               Note that NIST makes a distinction between ‘security marking’ and ‘security labeling’ as
               indicated in the supplemental guidance above.

               All media will be marked in accordance with the current DoD SAPCO or Service’s specific
               guidance. Reference DoDM 5205.07-V4, Enclosure 6, Marking IS Storage Media
               Containing SAP Information.

               All information storage media must be appropriately marked and protected to prevent the
               loss of information through poor security procedures. Likewise, to prevent security
               compromises, all output products (to include printed material) must be appropriately marked
               and protected. Each user is ultimately responsible for the marking, handling, and storage of
               media and paper products within their assigned area of responsibility.
               In addition, security markings will be displayed on all servers, server cabinets,
               desktops/laptops, removable/external hard drives, monitors and printers. Thin clients must

               also be marked. In the case of multi-level devices the security marking shall reflect the
               highest classification level authorized to be processed.
               All IS storage media shall have external security markings clearly indicating the
               classification and category (e.g., TS//SAR) of the information. All information storage
               media will be marked with one Standard Form (SF) 700-series classification label or
               approved substitute and one data descriptor label or approved substitute (e.g., spreadsheet
               with media serial numbers and associated programs or equivalent information based on the
               size of the media). [MP-3(a)]
               An exception to the media marking requirement is new, unused, factory-sealed media. [MP-
               3(b)]
               Media marking labels are depicted below:

                                                                    SF 706, TOP SECRET COLLATERAL
                           SF 712, SCI (Yellow)                                    (Orange)
                  Includes ALL classification levels of SCI             Collateral Information ONLY

                                                                  SF 708, CONFIDENTIAL COLLATERAL
                  SF 707, SECRET COLLATERAL (Red)                                   (Blue)
                       Collateral Information ONLY                      Collateral Information ONLY

                      SF 710, UNCLASSIFIED (Green)                        SF 711, Data Descriptor Label
                       Unclassified Information ONLY
                                                 Figure 3-2: SF 700 Series Labels

               Data Descriptor Label
               The SF 711, Data Descriptor Label, identifies the content of a specific piece of media. A SF
               711 is not required if the media labeling contains all of the information included in the SF
               711.
               Media Label Placement
               Labels will be affixed to all media in a manner that does not adversely affect operation of the
               equipment in which the media is used. Labels may be trimmed to fit the media, or created
               specifically for this purpose so long as the colors and usage are as specified for SF 700 series

               labels. Additionally, media labels shall not cover the serial number of the device or account
               control numbers. Labels made specifically for CD/DVDs may be applied directly to
               CD/DVDs. All required information may also be written on the media with a paint-pen,
               media label maker or permanent marker.
          Control Enhancements: None.

          References: FIPS Publication 199.

MP-4      MEDIA STORAGE

          Control: The organization:

          a.     Physically controls and securely stores all digital media regardless of classification and/or non-
                 digital media containing classified information within an area and/or container approved for
                 processing and storing media based on the classification of the information contained within the
                 media; and
          b.     Protects information system media until the media are destroyed or sanitized using approved
                 equipment, techniques, and procedures.
          Supplemental Guidance: Information system media includes both digital and non-digital media. Digital media
          includes, for example, diskettes, magnetic tapes, external/removable hard disk drives, flash drives, compact
          disks, and digital video disks. Non-digital media includes, for example, paper and microfilm. Physically
          controlling information system media includes, for example, conducting inventories, ensuring procedures
          are in place to allow individuals to check out and return media to the media library, and maintaining
          accountability for all stored media. Secure storage includes, for example, a locked drawer, desk, or cabinet,
          or a controlled media library. The type of media storage is commensurate with the security category and/or
          classification of the information residing on the media. Controlled areas are areas for which organizations
          provide sufficient physical and procedural safeguards to meet the requirements established for protecting
          information and/or information systems. For media containing information determined by organizations to
          be in the public domain, to be publicly releasable, or to have limited or no adverse impact on organizations
          or individuals if accessed by other than authorized personnel, fewer safeguards may be needed. In these
          situations, physical access controls provide adequate protection. Related controls: CP-6, CP-9, MP-2, MP-
          7, PE-3.
               All TS//SAR media shall be accounted for under the direct management of the Top Secret
               Control Officer (TSCO). For information systems with a confidentiality impact level of
               high, organizations shall encrypt or store off-line in a secure location information deemed to
               be mission-critical program hard drives and/or backup media located within a closed storage
               facility IAW local procedures. Program media and/or backup media located within closed
               storage facilities shall be protected in accordance with local procedures. [AC-3(6)] If
               encryption of stored information is employed as an access enforcement mechanism, the
               cryptography used shall be Federal Information Processing Standards Publication (FIPS Pub
               or FIPS) 140-2, Security Requirements for Cryptographic Modules (as amended), compliant.
               The use of encryption by the organization reduces the probability of unauthorized disclosure
               of information and can also detect unauthorized changes to information. Removing
               information from online storage to offline storage eliminates the possibility of individuals
               gaining unauthorized access via a network. See also SC-28.
               Protection of Digital Media
               As stated at the beginning of this section, CNSSI 4009 defines media as physical devices or
               writing surfaces including magnetic, optical, memory chips, and printouts. This section
               details the protection requirements for digital media which excludes paper and explains the
               protection afforded digital media of varying classification levels.
                   (a) Accountability Systems. When securing classified digital media, a differentiation is

                       made between digital media that requires accountability, and that media which
                       requires control. Accountability is very costly to the government, and is typically
                       applied only to TS//SAR information, although on rare occasions, the Cognizant
                       Security Authority may mandate similar procedures for S//SAR programs within the
                       program’s SCG. An appointed TSCO tracks media under this category as part of the
                       facility Top Secret Control Account (TSCA). Accountability controls include very
                       stringent tracking mechanisms and logs, tracking sheets which may require
                       signatures of those who handle the media, transmission, disposition and destruction
                       records, as well as annual inventories and account audits by a disinterested party.
                       Reference DoDM 5205.07-V1, Enclosure 5.
                   (b) Control Systems. S//SAR and below digital media does not require the same
                       stringent controls that are applied to accountability systems for TS although the
                       concern for its protection and usage within the SAP facility are just as important.
                       Unlike accountability, control systems and procedures require a tracking mechanism.
                       Reference DoDM 5205.07-V1, Enclosure 5.
                   (c) Commercial Software Protection. Commercial software maintained within the
                       facility by IT personnel and used to update systems or maintain proof of license or
                       purchase may be handled separately from the facility tracking log or system. This
                       media must be locked away in a separate container or cabinet and treated as
                       unclassified provided the write protection or verification of closed session was
                       verified by IT personnel once it was used in a classified computer system.
                       Commercial media still in shrink-wrap may remain this way and be secured in the
                       same cabinet as other commercial media.
                   (d) Factory Fresh Media. Factory-sealed media does not need to be controlled until
                       opened. Once opened, this media must be brought under control and stored within
                       the SAPF in a locked cabinet under the control of the Media Custodian. At no time
                       will any other users be permitted to have free access to blank media.
               Removable Media Accountability
               ISSM/ISSO shall:
                   •   Determine which authorized use privileges a user may have for removable media
                       based on the user’s assigned duties.
                   •    Ensure procedures are in place to address reporting a loss of removable media and
                        mitigating risk associated with the loss.
               Each organization will audit information storage media accountability records for accuracy at
               least annually or as specified by the AO. The results of these audits shall be documented in
               an internal report to remain on file within the organization for at least one (1) year or one
               review cycle whichever is longer. Organizations must be able to demonstrate positive
               control and accounting of information storage media when reviewed by inspection
               authorities. Discrepancies shall be reported to the ISSM/ISSO for further reporting to the
               AO or designee, as required.
          Control Enhancements:
          (1)    MEDIA STORAGE | CRYPTOGRAPHIC PROTECTION
                 [Withdrawn: Incorporated into SC-28 (1)].
          (2)    MEDIA STORAGE | AUTOMATED RESTRICTED ACCESS
                 The organization employs automated mechanisms to restrict access to media storage areas and to audit access
                 attempts and access granted.
                 Supplemental Guidance: Automated mechanisms can include, for example, keypads on the external
                 entries to media storage areas. Related controls: AU-2, AU-9, AU-6, AU-12.

          References: FIPS Publication 199; NIST Special Publications 800-56, 800-57, 800-111.

MP-5      MEDIA TRANSPORT

          Control: The organization:

          a.     Protects and controls all types of digital and non-digital media during transport outside of controlled
                 areas using AO and PSO-approved security measures, to include courier and digital media
                 encryption;
          b.     Maintains accountability for information system media during transport outside of controlled areas;
          c.     Documents activities associated with the transport of information system media; and
          d.     Restricts the activities associated with the transport of information system media to authorized
                 personnel.
          Supplemental Guidance: Information system media includes both digital and non-digital media. Digital media
          includes, for example, diskettes, magnetic tapes, external/removable hard disk drives, flash drives, compact
          disks, and digital video disks. Non-digital media includes, for example, paper and microfilm. This control
          also applies to mobile devices with information storage capability (e.g., smart phones, tablets, E-readers),
          that are transported outside of controlled areas. Controlled areas are areas or spaces for which organizations
          provide sufficient physical and/or procedural safeguards to meet the requirements established for protecting
          information and/or information systems.
          Physical and technical safeguards for media are commensurate with the security category or classification
          of the information residing on the media. Safeguards to protect media during transport include, for
          example, locked containers and cryptography. Cryptographic mechanisms can provide confidentiality and
          integrity protections depending upon the mechanisms used. Activities associated with transport include the
          actual transport as well as those activities such as releasing media for transport and ensuring that media
          enters the appropriate transport processes. For the actual transport, authorized transport and courier
          personnel may include individuals from outside the organization (e.g., U.S. Postal Service or a commercial
          transport or delivery service). Maintaining accountability of media during transport includes, for example,
          restricting transport activities to authorized personnel, and tracking and/or obtaining explicit records of
          transport activities as the media moves through the transportation system to prevent and detect loss,
          destruction, or tampering. Organizations establish documentation requirements for activities associated
          with the transport of information system media in accordance with organizational assessments of risk to
          include the flexibility to define different record-keeping methods for the different types of media transport
          as part of an overall system of transport-related records. Related controls: AC-19, CP-9, MP-3, MP-4, RA-
          3, SC-8, SC-13, SC-28.
               PSO approved procedures shall be implemented to address mobile devices traveling to and
               returning from a location that the organization deems to be of significant risk.
               Information should be transmitted electronically whenever possible. When electronic
               transmission is not possible, movement of all media shall be coordinated through the
               appropriate personnel (ISSM/ISSO/GSSO/CPSO, etc.) following approved procedures. [MP-
               5(a)]. All digital media storing data at rest shall be encrypted. [SC-28]
               Activities associated with the transport of media shall be documented by the organization.
               Appropriate entries in the organization’s media accounting system shall be made. [MP-5(b)]
          Control Enhancements:
          (1)    MEDIA TRANSPORT | PROTECTION OUTSIDE OF CONTROLLED AREAS
                 [Withdrawn: Incorporated into MP-5].
          (2)    MEDIA TRANSPORT | DOCUMENTATION OF ACTIVITIES
                 [Withdrawn: Incorporated into MP-5].

          (3)    MEDIA TRANSPORT | CUSTODIANS
                 The organization employs an identified custodian during transport of information system media outside of controlled
                 areas.
                 Supplemental Guidance: Identified custodians provide organizations with specific points of contact
                 during the media transport process and facilitate individual accountability. Custodial responsibilities
                 can be transferred from one individual to another as long as an unambiguous custodian is identified at
                 all times.
                   Transport of media shall be restricted to an authorized custodian by means of a courier
                   card/letter.
          (4)    MEDIA TRANSPORT | CRYPTOGRAPHIC PROTECTION
                 The information system implements cryptographic mechanisms to protect the confidentiality and integrity of
                 information stored on digital media during transport outside of controlled areas.
                 Supplemental Guidance: This control enhancement applies to both portable storage devices (e.g., USB
                 memory sticks, compact disks, digital video disks, external/removable hard disk drives) and mobile
                 devices with storage capability (e.g., smart phones, tablets, E-readers). Related control: MP-2.
                   Cryptographic mechanisms during transport outside of controlled areas shall be either
                   NSA approved or FIPS 140-2 compliant.
          References: FIPS Publication 199; NIST Special Publication 800-60.

MP-6      MEDIA SANITIZATION

          Control: The organization:

          a.     Sanitizes all digital and non-digital media prior to disposal, release out of organizational control, or
                 release for reuse using IAW NSA/CSS PM 9-12 in accordance with applicable federal and
                 organizational standards and policies; and
          b.     Employs sanitization mechanisms with the strength and integrity commensurate with the security
                 category or classification of the information.
          Supplemental Guidance:   This control applies to all information system media, both digital and non-digital,
          subject to disposal or reuse, whether or not the media is considered removable. Examples include media
          found in scanners, copiers, printers, notebook computers, workstations, network components, and mobile
          devices. The sanitization process removes information from the media such that the information cannot be
          retrieved or reconstructed. Sanitization techniques, including clearing, purging, cryptographic erase, and
          destruction, prevent the disclosure of information to unauthorized individuals when such media is reused or
          released for disposal. Organizations determine the appropriate sanitization methods recognizing that
          destruction is sometimes necessary when other methods cannot be applied to media requiring sanitization.
          Organizations use discretion on the employment of approved sanitization techniques and procedures for
          media containing information deemed to be in the public domain or publicly releasable, or deemed to have
          no adverse impact on organizations or individuals if released for reuse or disposal. Sanitization of non-
          digital media includes, for example, removing a classified appendix from an otherwise unclassified
          document, or redacting selected sections or words from a document by obscuring the redacted
          sections/words in a manner equivalent in effectiveness to removing them from the document. NSA
          standards and policies control the sanitization process for media containing classified information. Related
          controls: MA-2, MA-4, RA-3, SC-4.
               In addition to NSA/CSS Policy Manual 9-12, Storage Device Sanitization Manual (SDDM),
               also reference the most current NSA/CSS Degausser Evaluated Products List (EPL) and
               other NSA references located on NSA’s Media Destruction Guidance website:
               https://www.nsa.gov/ia/mitigation_guidance/media_destruction_guidance/index.shtml.
               Before storage media is released out of organizational control, becomes obsolete, or is no
               longer usable or required for an information system, it is a requirement to ensure that residual
               magnetic, optical, electrical, or other representations of data which have been deleted are not

               recoverable.
                   •   Sanitization is the process of removing information from storage devices or
                       equipment such that data recovery using any known technique or analysis is
                       prevented. Sanitization includes the removal of data from the storage device, as well
                       as the removal of all labels, markings, and activity logs.
                   •    Destruction is the process of physically damaging media so that it is not usable and
                        there is no known method of retrieving the data. This may include degaussing,
                        incineration, shredding, grinding, embossing, chemical immersion, etc.
               All sanitization and destruction procedures require AO approval, and must be in accordance
               with the current version of the NSA/CSS Policy Manual 9-12. Organizations may also
               institute additional media sanitization policies and procedures as needed.
               Responsibilities
               Organizations are responsible for ensuring adequate resources and equipment are available to
               support media sanitization activities.
               The GSSO/CPSO/ISSM is responsible for the security of all media assigned to the
               organization and under his/her purview. To protect these assets, he/she must ensure the
               security measures and policies contained within this section are followed. The GSSO/CPSO
               shall develop media sanitization and removal procedures for PSO/AO approval. PSO/AO
               reviews and approves media sanitization procedures and equipment (NSA approved) prior to
               release/disposal or reuse of media.
               Ensure appropriate safeguards are in place so removable media that contain classified,
               sensitive, or controlled unclassified information are properly sanitized, destroyed, and/or
               disposed of in accordance with an approved method when no longer needed.
               Sanitization of Media
               Prior to media disposal or release out of SAP control, organizations shall sanitize all media
               using sanitization mechanisms with strength and integrity commensurate with the
               classification or sensitivity of the information.
               All media, regardless of classification, shall be sanitized in accordance with Policy Manual
               9-12 prior to release or disposal. Media may be reused within channels at the same level or
               higher with an approved clearing process in place.
               Degaussing Magnetic Media
               Degaussers are ineffective in erasing optical and solid state storage devices.
               Degaussing (i.e., demagnetizing) is a method of sanitization. Degaussing is a procedure that
               reduces the magnetic flux on media virtually to zero by applying a reverse magnetizing field.
               Properly applied, degaussing renders any previously stored data on magnetic media
               unreadable and may be used in the sanitization process. Degaussing is not an approved
               method for sanitizing optical media.
               It is highly recommended that after degaussing, but prior to disposal, all media is physically
               damaged to prevent data recovery attempts.
               Refer to NSA’s website for media destruction guidance including the current Evaluated
               Products List – Degausser. This Evaluated Products List (EPL) specifies the model
               identification of current equipment units that were evaluated against and found to satisfy the

               requirements for erasure of magnetic storage devices that retain sensitive or classified data.
               Sanitizing Optical Media (Destruction)
               Optical storage devices include CDs and DVDs. Optical storage devices cannot be sanitized,
               only destroyed. Refer to Policy Manual 9-12 for detailed procedures related to the
               sanitization of optical media. Equipment approved for use in the destruction of optical media
               can be found in the NSA/CSS Evaluated Products List for Optical Media Destruction
               Devices.
               Sanitizing Solid State Storage Devices (Destruction)
               Solid state storage devices include Random Access Memory (RAM), Read Only Memory
               (ROM), Field Programmable Gate Array (FPGA), smart cards, and flash memory. Refer to
               Policy Manual 9-12 for detailed procedures related to the destruction (e.g., smelting) of solid
               state storage devices.
               Release of Systems and Components
               The ISSM/ISSO, in conjunction with the organization’s equipment custodian shall develop
               equipment removal procedures for systems and components as approved by the AO. When
               such equipment is no longer needed, it can be released if:
                   •   It is inspected by the ISSM/ISSO. This inspection will assure that all media,
                       including all internal disks and nonvolatile memory components and boards, have
                       been removed or sanitized.
                   •   A record is created of the equipment release indicating the procedure used for
                       sanitization and date of release to the equipment custodian. The record of release
                       shall be retained by the ISSM/ISSO for a period of two (2) years.
               Release of Memory Components and Boards
               A memory component is considered to be the Lowest Replaceable Unit (LRU) in a hardware
               device. Memory components reside on boards, modules, and subassemblies. A board can be
               a module, or may consist of several modules and subassemblies. Memory components are
               specifically handled as either volatile or nonvolatile, as described below.
               Volatile Memory Components
               Memory components that do not retain data after removal of all electrical power sources, and
               when reinserted into a similarly configured system, are considered volatile memory
               components. Volatile components that have contained extremely sensitive or classified
               information may be released only in accordance with Policy Manual 9-12.
               Nonvolatile Memory Components
               Components that do retain data when all power sources are discontinued are nonvolatile
               memory components. Some nonvolatile memory components (e.g., ROM, Programmable
               ROM (PROM), or Erasable PROM (EPROM)) and their variants that have been programmed
               at the vendor’s commercial manufacturing facility and are considered to be unalterable in the
               field may be released. When in doubt, assume the component can be altered. All other
               nonvolatile components (e.g., removable/non-removable hard disks) may be released after
               successful completion of the sanitization procedures as defined in Policy Manual 9-12.
               Other Nonvolatile Media
               The following nonvolatile media could possibly retain data when all power sources are

               discontinued.
               •   Visual Displays. There are many types of video display technologies in use. These
                   technologies are susceptible, to differing degrees, to a phenomenon called “burn-in”.
                   Burn-in occurs when the normally volatile components of the display mechanism
                   becomes worn or damaged and retain evidence of the data they were displaying. A
                   visual display may be considered sanitized if no sensitive or classified information is
                   remains in the visual display. If this information is visible on any part of the visual
                   display face, the display shall be sanitized before it is released from control.
                   The display technology in common use is liquid crystal display (LCD). When powered
                   for a long period in the rotated position a liquid crystal may retain some of its twist and
                   will not relax to its normal orientation. This is referred to as burn-in even though it is
                   physically twist-in. This burn-in is not typically a problem for LCD displays that do not
                   display an image for days on end. If LCD burn-in is suspected, the ISSO/SA shall
                   uniformly illuminate each pixel of the display then visually search for contrasting areas
                   that reveal information. Vary the intensity across the range of off to saturation for each
                   color (red, green, and blue).
                   LCDs with compromising burn-in areas identified during assessment can normally be
                   sanitized by leaving the device off for a few days in a warm (<140oF) environment until
                   the liquid crystals relax. If this insufficient then the display should be alternated between
                   long periods of full white and full black until the liquid crystals relax. If all this is
                   insufficient or the display is strongly suspect, then the liquid crystal medium in the
                   offending area of the display between the front and rear LCD plates must be disturbed or
                   removed. The liquid crystal medium is non-toxic but messy.
                   Actual burn-in can occur in legacy cathode ray tube (CRT), plasma, and laser phosphor
                   displays. Where bright images are displayed for long period of time in the same
                   location, the screen phosphors overheats and the image is permanently burned-in. The
                   ISSO/SA shall inspect the face of the visual display without power applied. If sensitive
                   information is visible (typically as a dark spot), the visual display shall be sanitized
                   before releasing it from control. If nothing is visible, the ISSO/SA shall apply power to
                   the visual display; then vary the intensity from low to high.
                   In accordance with NSA/CSS Policy Manual 9-12, CRT, plasma, and laser phosphor
                   displays visual displays exhibiting burn-in shall be sanitized by destroying the display
                   surface of the monitor into pieces no larger than five (5) centimeters square. Be aware
                   of the hazards associated with physical destruction of monitors.
                   LED displays (not LCDs with LED illumination) use an LED per pixel color and may
                   have burn-in when LEDs overheat and fail. LED displays are typically used in signage
                   and not on desktop displays. Destruction shall be sufficient to preclude the derivation of
                   sensitive or classified information from the arrangement of the inoperative LEDs.
               •   Printer Platens and Ribbons. Printer platens and ribbons shall be removed from all
                   printers before the equipment is released. One-time ribbons and inked ribbons shall be
                   destroyed as sensitive material. The rubber surface of platens shall be sanitized by
                   wiping the surface with alcohol.
               •   Laser Printer Drums, Belts, and Cartridges.
                       o Laser printer components containing light-sensitive elements (e.g., drums, belts,
                            and complete cartridges) shall be sanitized before release from control.
                       o Used toner cartridges from properly operating equipment that has completed a
                            full printing cycle (without interruption) may be treated, handled, stored and

                              disposed of as unclassified and may be recycled. When a laser printer does not
                              complete a printing cycle (e.g., a paper jam or power failure occurs), the toner
                              cartridge may NOT be treated as unclassified. If the toner cartridge is removed
                              without completing a print cycle, the cartridge drum must be inspected by lifting
                              the protective flap and viewing the exposed portion of the drum. If residual toner
                              is present, manually rotating the drum is sufficient to wipe off residual toner
                              material present. Alternatively, a subsequent print cycle may be completed and
                              is sufficient to wipe residual toner from the cartridge drum. After completing
                              sanitization actions, the toner cartridge may be treated, handled, stored, and
                              disposed of as unclassified (to include recycling).
               •    Multifunction Devices. Multifunction devices, including digital copiers and copier or
                    printer centers, have the capability to copy, print, scan, and fax, either in a standalone
                    mode or networked. These devices are computer-based, network-capable devices with
                    processors, memory, hard drives, image retention components, and, in some cases,
                    cellular phone transmitters with vendor auto-alert features. When using multifunctional
                    printer/copier equipment, the document image may remain on the imaging drum/belt,
                    hard drives, and static RAM. All memory resident components of multifunction devices
                    must be properly sanitized before release.
               Destroying Media
               Follow guidelines established in NSA/CSS Policy Manual 9-12. Media and memory
               components that are damaged, malfunction, or become unusable must be destroyed using
               methods appropriate for the media type.

          Control Enhancements:
          (1)      MEDIA SANITIZATION | REVIEW / APPROVE / TRACK / DOCUMENT / VERIFY
                   The organization reviews, approves, tracks, documents, and verifies media sanitization and disposal actions.
                   Supplemental Guidance: Organizations review and approve media to be sanitized to ensure compliance
                   with records-retention policies. Tracking/documenting actions include, for example, listing personnel
                   who reviewed and approved sanitization and disposal actions, types of media sanitized, specific files
                   stored on the media, sanitization methods used, date and time of the sanitization actions, personnel
                   who performed the sanitization, verification actions taken, personnel who performed the verification,
                   and disposal action taken. Organizations verify that the sanitization of the media was effective prior to
                   disposal. Related control: SI-12.
          (2)      MEDIA SANITIZATION | EQUIPMENT TESTING
                   The organization tests sanitization equipment and procedures at least annually to verify that the intended
                   sanitization is being achieved.
                   Supplemental Guidance: Testing of sanitization equipment and procedures may be conducted by
                   qualified and authorized external entities (e.g., other federal agencies or external service providers).
                    Note that NSA/CSS Degausser Evaluated Products List, dated February 1, 2015, and
                    subject to frequent updates states: “…customers should have their equipment re-tested
                    periodically according to the manufacturer’s recommendations.”

                    Example: Data Security, Inc. currently recommends that their degaussers be tested (aka
                    certified) every six (6) months for the first two (2) years of operation and then annually
                    thereafter. Testing may be accomplished using the Field CheckR, which requires the
                    user to maintain a log of the test results; or using a certified tape, which is returned to the
                    vendor, in this case Data Security, Inc. for results.

          (3)   MEDIA SANITIZATION | NONDESTRUCTIVE TECHNIQUES
                The organization applies nondestructive sanitization techniques to portable storage devices prior to connecting such
                devices to the information system under the following circumstances: [Assignment: organization-defined
                circumstances requiring sanitization of portable storage devices].
                Supplemental Guidance: This control enhancement applies to digital media containing classified
                information and Controlled Unclassified Information (CUI). Portable storage devices can be the source
                of malicious code insertions into organizational information systems. Many of these devices are
                obtained from unknown and potentially untrustworthy sources and may contain malicious code that
                can be readily transferred to information systems through USB ports or other entry portals. While
                scanning such storage devices is always recommended, sanitization provides additional assurance that
                the devices are free of malicious code to include code capable of initiating zero-day attacks.
                Organizations consider nondestructive sanitization of portable storage devices when such devices are
                first purchased from the manufacturer or vendor prior to initial use or when organizations lose a
                positive chain of custody for the devices. Related control: SI-3.
                 The use of nondestructive sanitization techniques (e.g., not destroying the hard drive) are
                 for initial sanitization of media prior to first use and not when the contents of the digital
                 media require retention.
          (4)   MEDIA SANITIZATION | CONTROLLED UNCLASSIFIED INFORMATION
                [Withdrawn: Incorporated into MP-6].
          (5)   MEDIA SANITIZATION | CLASSIFIED INFORMATION
                [Withdrawn: Incorporated into MP-6].
          (6)   MEDIA SANITIZATION | MEDIA DESTRUCTION
                [Withdrawn: Incorporated into MP-6].
          (7)   MEDIA SANITIZATION | DUAL AUTHORIZATION
                The organization enforces dual authorization for the sanitization of [Assignment: organization-defined information
                system media].
                Supplemental Guidance: Organizations employ dual authorization to ensure that information system
                media sanitization cannot occur unless two technically qualified individuals conduct the task.
                Individuals sanitizing information system media possess sufficient skills/expertise to determine if the
                proposed sanitization reflects applicable federal/organizational standards, policies, and procedures.
                Dual authorization also helps to ensure that sanitization occurs as intended, both protecting against
                errors and false claims of having performed the sanitization actions. Dual authorization may also be
                known as two-person control. Related controls: AC-3, MP-2.
          (8)   MEDIA SANITIZATION | REMOTE PURGING / WIPING OF INFORMATION
                The organization provides the capability to purge/wipe information from [Assignment: organization-defined
                information systems, system components, or devices] either remotely or under the following conditions: [Assignment:
                organization-defined conditions].
                Supplemental Guidance: This control enhancement protects data/information on organizational
                information systems, system components, or devices (e.g., mobile devices) if such systems,
                components, or devices are obtained by unauthorized individuals. Remote purge/wipe commands
                require strong authentication to mitigate the risk of unauthorized individuals purging/wiping the
                system/component/device. The purge/wipe function can be implemented in a variety of ways
                including, for example, by overwriting data/information multiple times or by destroying the key
                necessary to decrypt encrypted data.
          References: FIPS Publication 199; NIST Special Publications 800-60, 800-88; Web:
          http://www.nsa.gov/ia/mitigation_guidance/media_destruction_guidance/index.shtml.

MP-7      MEDIA USE

          Control: The organization [Selection: restricts; prohibits] the use of [Assignment: organization-defined
          types of information system media] on [Assignment: organization-defined information systems or system
          components] using [Assignment: organization-defined security safeguards].

          Supplemental Guidance:   Information system media includes both digital and non-digital media. Digital
          media includes, for example, diskettes, magnetic tapes, external/removable hard disk drives, flash drives,
          compact disks, and digital video disks. Non-digital media includes, for example, paper and microfilm. This
          control also applies to mobile devices with information storage capability (e.g., smart phones, tablets, E-
          readers). In contrast to MP-2, which restricts user access to media, this control restricts the use of certain
          types of media on information systems, for example, restricting/prohibiting the use of flash drives or
          external hard disk drives. Organizations can employ technical and nontechnical safeguards (e.g., policies,
          procedures, rules of behavior) to restrict the use of information system media. Organizations may restrict
          the use of portable storage devices, for example, by using physical cages on workstations to prohibit access
          to certain external ports, or disabling/removing the ability to insert, read or write to such devices.
          Organizations may also limit the use of portable storage devices to only approved devices including, for
          example, devices provided by the organization, devices provided by other approved organizations, and
          devices that are not personally owned. Finally, organizations may restrict the use of portable storage
          devices based on the type of device, for example, prohibiting the use of writeable, portable storage devices,
          and implementing this restriction by disabling or removing the capability to write to such devices. Related
          controls: AC-19, PL-4.
               Media use must be controlled at the end point as technically implemented in AC-6(1).
               Media Reuse. Certain types of electronic media that have been previously classified under
               one program may be reused by another program of the same classification level or higher
               (e.g., S//ABC hard disk is transferred to S//XYZ, or S//ABC hard disk is transferred to
               TS//LMNO). The individual types of media required for reuse must have specific procedures
               documented and approved by the system AO. Best practices for wiping magnetic media or
               SSD for reuse include: 1. One time overwrite utilizing a known pattern and an AO approved
               product, and then verifying that the overwrite was successful utilizing a hex editor tool from
               the first to last sector; or 2. Encrypt the whole media with an AO approved whole disk
               encryption (WDE) tool and then destroy the key. For any media type the spirit of the
               procedures must ensure any labels or evidence of the previous program has been removed
               prior to handoff to the gaining ISSM or Security Officer.
               Least Privilege [AC-6] and Separation of Duties [AC-5] are related controls and should be
               enforced to the maximum extent possible to prevent unauthorized removal of information
               from the system.
          Control Enhancements:
          (1)    MEDIA USE | PROHIBIT USE WITHOUT OWNER
                 The organization prohibits the use of portable storage devices in organizational information systems when such
                 devices have no identifiable owner.
                 Supplemental Guidance: Requiring identifiable owners (e.g., individuals, organizations, or projects) for
                 portable storage devices reduces the risk of using such technologies by allowing organizations to
                 assign responsibility and accountability for addressing known vulnerabilities in the devices (e.g.,
                 malicious code insertion). Related control: PL-4.
          (2)    MEDIA USE | PROHIBIT USE OF SANITIZATION-RESISTANT MEDIA
                 The organization prohibits the use of sanitization-resistant media in organizational information systems.
                 Supplemental Guidance: Sanitation-resistance applies to the capability to purge information from media.
                 Certain types of media do not support sanitize commands, or if supported, the interfaces are not
                 supported in a standardized way across these devices. Sanitation-resistant media include, for example,
                 compact flash, embedded flash on boards and devices, solid state drives, and USB removable media.
                 Related control: MP-6.
          References: FIPS Publication 199; NIST Special Publication 800-111.

MP-8      MEDIA DOWNGRADING

          Control: The organization:

          a.    Establishes [Assignment: organization-defined information system media downgrading process] that
                includes employing downgrading mechanisms with [Assignment: organization-defined strength and
                integrity];
          b.    Ensures that the information system media downgrading process is commensurate with the security
                category and/or classification level of the information to be removed and the access authorizations of
                the potential recipients of the downgraded information;
          c.    Identifies [Assignment: organization-defined information system media requiring downgrading]; and
          d.    Downgrades the identified information system media using the established process.
          Supplemental Guidance:    This control applies to all information system media, digital and non-digital, subject
          to release outside of the organization, whether or not the media is considered removable. The downgrading
          process, when applied to system media, removes information from the media, typically by security category
          or classification level, such that the information cannot be retrieved or reconstructed. Downgrading of
          media includes redacting information to enable wider release and distribution. Downgrading of media also
          ensures that empty space on the media (e.g., slack space within files) is devoid of information.
          Control Enhancements:
          (1)   MEDIA DOWNGRADING | DOCUMENTATION OF PROCESS
                The organization documents information system media downgrading actions.
                Supplemental Guidance: Organizations can document the media downgrading process by providing
                information such as the downgrading technique employed, the identification number of the
                downgraded media, and the identity of the individual that authorized and/or performed the
                downgrading action.
          (2)   MEDIA DOWNGRADING | EQUIPMENT TESTING
                The organization employs [Assignment: organization-defined tests] of downgrading equipment and procedures to
                verify correct performance [Assignment: organization-defined frequency].
          (3)   MEDIA DOWNGRADING | CONTROLLED UNCLASSIFIED INFORMATION
                The organization downgrades information system media containing [Assignment: organization-defined Controlled
                Unclassified Information (CUI)] prior to public release in accordance with applicable federal and organizational
                standards and policies.
          (4)   MEDIA DOWNGRADING | CLASSIFIED INFORMATION
                The organization downgrades information system media containing classified information prior to release to
                individuals without required access authorizations in accordance with NSA standards and policies.
                Supplemental Guidance: Downgrading of classified information uses approved sanitization tools,
                techniques, and procedures to transfer information confirmed to be unclassified from classified
                information systems to unclassified media.
                 This control may only need to be addressed if a system downgrade or tech transfer is
                 required, e.g., based on an authorized administrative information downgrade
                 (classification/program levels) by an Original Classification Authority (OCA).
          References: None.
