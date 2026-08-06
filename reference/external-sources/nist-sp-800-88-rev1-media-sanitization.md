# NIST SP 800-88 Revision 1 — Guidelines for Media Sanitization: Clear/Purge/Destroy Categories and Media-Specific Guidance (Excerpt)

- **Source URL:** https://nvlpubs.nist.gov/nistpubs/specialpublications/nist.sp.800-88r1.pdf
- **Retrieved:** 2026-08-05
- **Why included:** Supports JSIG MP-6 (media sanitization) claims. This is NIST's official Special Publication 800-88 Revision 1, "Guidelines for Media Sanitization" (December 2014), the foundational federal reference defining the Clear/Purge/Destroy sanitization categories and specifying media-type-specific sanitization and verification methods, including cryptographic erase for self-encrypting drives. **Note on document status:** As of September 26, 2025, NIST has withdrawn SP 800-88 Rev. 1 and superseded it in its entirety with **SP 800-88 Revision 2** (see https://csrc.nist.gov/pubs/sp/800/88/r2/final); the Rev. 1 PDF remains published by NIST at the URL above as an archived/historical document. This excerpt specifically documents Rev. 1, as requested, because it is the version this repository's JSIG artifacts reference.

> **NOTE — THIS IS AN EXCERPT, NOT THE COMPLETE DOCUMENT.** The full SP 800-88 Rev. 1 publication is 64 pages and includes additional material not reproduced here, including the full system life-cycle sanitization-decision flowchart figure, the complete Appendix A tables for every covered media type (including optical media, mobile devices, networking equipment, and office equipment such as copiers/fax machines/printers), Appendix B (glossary), Appendix C (acronyms), and Appendix G (a sample Certificate of Sanitization template). Only the Clear/Purge/Destroy definitions, the sanitization decision-process overview, verification and documentation guidance, and the Appendix A guidance for magnetic media, ATA/SCSI/NVMe hard disk drives and SSDs, and cryptographic erase for self-encrypting drives are reproduced below. For the complete document, see the source URL above.

---

## Clear, Purge, and Destroy — Definitions

| Sanitization action | Definition (verbatim) |
|---|---|
| **Clear** | "Clear applies logical techniques to sanitize data in all user-addressable storage locations for protection against simple non-invasive data recovery techniques; typically applied through the standard Read and Write commands to the storage device, such as by rewriting with a new value or using a menu option to reset the device to the factory state (where rewriting is not supported)." |
| **Purge** | "Purge applies physical or logical techniques that render Target Data recovery infeasible using state of the art laboratory techniques." |
| **Destroy** | "Destroy renders Target Data recovery infeasible using state of the art laboratory techniques and results in the subsequent inability to use the media for storage of data." |

- "Sanitization is a process to render access to target data (the data subject to the sanitization technique) on the media infeasible for a given level of recovery effort."
- Disposal without sanitization should be considered only if information disclosure "would have no impact on organizational mission," "would not result in damage to organizational assets," and "would not result in financial loss or harm to any individuals."

## Sanitization Decision Process Overview

- "The decision process is based on the confidentiality of the information, not the type of media." Once the sanitization type is decided, the media type influences the technique used to achieve it.
- Data confidentiality should be identified using **FIPS 199**; additional guidance on mapping information types to security categories is in **NIST SP 800-60 Revision 1**.
- Recommended sequence: (1) categorize the information, (2) assess the nature of the medium, (3) assess the risk to confidentiality, (4) determine future plans for the media, (5) choose the appropriate sanitization type(s), (6) assess cost/environmental impact/other constraints, (7) select the decision that best mitigates confidentiality risk within constraints.
- Media sanitization needs and methods should be identified before the Disposal phase of the system life cycle — ideally at initial system security plan development.
- Organizations may request a **"statement of volatility"** from vendors identifying storage media that may contain sensitive data. A single item (e.g., a desktop computer) may contain multiple media types (hard drive, motherboard, RAM, ROM) each requiring different sanitization.
- Reuse/recycling intent matters: if media will not be reused, "the simplest and most cost-effective method of control may be Destroy." Purge or Clear may be preferable when considering environmental concerns, reuse/resale/donation, media cost, or difficulty of physical destruction.
- Organizational control matters: media under contractual confidentiality obligations during maintenance, or maintained on-site under supervision, remains under organizational control; media exchanged for warranty/rebate and not returned is outside organizational control.

## Verification

Two types of verification should be considered: (1) verification every time sanitization is applied, and (2) representative sampling verification on a subset of media.

- If possible, verification sampling should be performed by personnel who did not perform the original sanitization.
- Sanitization equipment requires calibration, testing, and scheduled maintenance; operators must be competent.
- For representative sampling on LBA-addressed storage: minimum of **1,000 subsections**; at least **two non-overlapping pseudorandom locations** per subsection (plus first/last addressable location); each sample covers at least **5%** of its subsection, with two samples covering at least **10%** of the media across all subsections.
- For **Cryptographic Erase (CE)**: reading pseudorandom locations before and after CE and comparing results is described as "likely the most effective verification technique." If CE cannot be verified, an alternative, verifiable sanitization method should be used in combination with or instead of CE.
- **Secondary verification:** select a random subset of media, use a different verification tool from a separate developer, and perform full verification on at least **20%** of sanitized media (by item count).

## Documentation

Following sanitization, a certificate of media disposition should be completed for each sanitized item (unless the organization deems documentation unnecessary for very-low-confidentiality media), recording at minimum: Manufacturer, Model, Serial Number, organizationally assigned media/property number, Media Type (e.g., magnetic, flash memory, hybrid), Media Source, pre-/post-sanitization confidentiality categorization (optional), Sanitization Description (Clear/Purge/Destroy), Method Used (e.g., degauss, overwrite, block erase, crypto erase), Tool Used (with version), Verification Method, and the name/title/date/location/contact/signature of personnel performing sanitization and verification.

## Appendix A: Media-Specific Sanitization Guidance (Selected)

### Magnetic Media

| Media | Clear | Purge | Destroy |
|---|---|---|---|
| Floppies / flexible or fixed magnetic disks | Overwrite with organizationally approved software; at least a single write pass with a fixed data value (e.g., all zeros); multiple passes/complex values optional | Degauss in an organizationally approved degausser rated at minimum for the media | Incinerate by burning in a licensed incinerator, or shred |
| Reel/cassette magnetic tape | Re-record/overwrite all data using an organizationally approved pattern and a system with similar characteristics to the original recorder; all portions overwritten once with known non-sensitive signals | Degauss in an organizationally approved degausser rated at minimum for the media | Incinerate by burning in a licensed incinerator, or shred |

"Degaussing magnetic disks typically renders the disk permanently unusable."

### ATA Hard Disk Drives (PATA, SATA, eSATA, etc.)

- **Clear:** Overwrite with organizationally approved/validated technologies; at least one write pass with a fixed data value (e.g., all zeros); multiple passes/complex values optional.
- **Purge** — one of:
  1. **ATA Sanitize Device feature set commands**, if supported:
     - **Overwrite EXT command** — one write pass of a fixed pattern (or three passes of a pseudorandom pattern with invert on the second pass).
     - **Cryptographic Erase** (`CRYPTO SCRAMBLE EXT` command), if the device supports encryption and the document's technical conditions are satisfied.
  2. **ATA Security feature set `SECURE ERASE UNIT` command**, in **Enhanced Erase** mode, if supported. (The Sanitize Device feature set is preferred over Security feature set `SECURITY ERASE UNIT` when both are supported.)
  3. **Cryptographic Erase via TCG interface** — **TCG Opal SSC** or **Enterprise SSC**, issuing commands to change all MEKs (Media Encryption Keys).
  4. **Degaussing** — organizationally approved automatic degausser, or disassemble and degauss the platters with an approved wand.
- **Destroy:** Shred, disintegrate, pulverize, or incinerate in a licensed incinerator.
- Notes: verification is required for every Clear/Purge technique except degaussing; HPA/DCO/Accessible Max Address restrictions must be reset before sanitization; ATA Secure Erase's Enhanced mode implementation varies by manufacturer and should be confirmed before reliance.

### SCSI Hard Disk Drives (Parallel SCSI, SAS, Fibre Channel, UAS, SCSI Express)

- **Clear:** Same overwrite approach as ATA.
- **Purge** — one of: (1) SCSI `SANITIZE` command's `OVERWRITE` or `CRYPTOGRAPHIC ERASE` service actions, if supported; (2) Cryptographic Erase via TCG Opal SSC/Enterprise SSC interface; (3) Degaussing.
- **Destroy:** Same as ATA.

### Flash Memory-Based Storage Devices and SSDs

**ATA SSDs:**
- **Clear:** Overwrite (organizationally approved/tested tools) or ATA Security feature set `SECURITY ERASE UNIT` command.
- **Purge** — one of: (1) ATA Sanitize command's **Block Erase** or **Cryptographic Erase** (`sanitize crypto scramble`), if supported; (2) Cryptographic Erase via TCG Opal SSC/Enterprise SSC interface.
- **Destroy:** Shred, disintegrate, pulverize, or incinerate.
- Note: "ATA Secure Erase was a Purge mechanism for magnetic media, but it is only a Clear mechanism for flash memory due to variability in implementation and the possibility that sensitive data may remain in areas such as spare cells that have been rotated out of use." Overwriting flash media may reduce effective lifetime and may not sanitize unmapped physical media. Degaussing must never be relied on for flash-memory devices.

**SCSI SSDs:** Same Clear approach; Purge via SCSI `SANITIZE` command's `BLOCK ERASE`/`CRYPTOGRAPHIC ERASE` service actions or TCG interface Cryptographic Erase; Destroy as above. Degaussing must not be performed on flash-based devices.

**NVM Express SSDs:** Purge via the NVM Express **`Format`** command's **User Data Erase** or **Cryptographic Erase** commands, or via TCG Opal SSC/Enterprise SSC interface Cryptographic Erase. Destroy as above.

**USB removable flash media / memory cards:** Clear via at least a two-pass overwrite (pattern + complement); Purge is generally unsupported or non-standardized across these devices — "For most cases where Purging is desired, USB removable media should be Destroyed."

## Cryptographic Erase (CE) for Self-Encrypting Drives

- "Cryptographic Erase (CE) leverages the encryption of target data by enabling sanitization of the target data's encryption key. This leaves only the ciphertext remaining on the media, effectively sanitizing the data by preventing read-access. Without the encryption key used to encrypt the target data, the data is unrecoverable."
- "Typically, CE can be executed in a fraction of a second." Federal agencies must use **FIPS 140 validated encryption modules**.
- **Do not** use CE to Purge media if encryption was enabled *after* sensitive data was already stored unsanitized, or if it is unknown whether that occurred.
- Consider CE only when: all target data was encrypted prior to storage; key-storage locations are known and can themselves be sanitized; all copies of the encryption key(s) — including wrapping keys — can be accounted for and sanitized; and device commands to perform CE are clearly identifiable.
- If keys exist outside the device (backup/escrow), CE should be combined with another sanitization method unless the organization has high confidence in key protection and destruction.
- Command paths documented in Appendix A: ATA HDDs/SSDs via `CRYPTO SCRAMBLE EXT` / `sanitize crypto scramble`; SCSI HDDs/SSDs via the SCSI `SANITIZE` command's `CRYPTOGRAPHIC ERASE` service action; NVMe SSDs via the `Format` command's Cryptographic Erase; all device types alternatively via the **TCG Opal SSC** or **Enterprise SSC** interface, issuing commands to change all MEKs.

---

*End of excerpt. Full source: https://nvlpubs.nist.gov/nistpubs/specialpublications/nist.sp.800-88r1.pdf — current CSRC record (noting withdrawal/supersession by SP 800-88 Rev. 2): https://csrc.nist.gov/pubs/sp/800/88/r1/final*
