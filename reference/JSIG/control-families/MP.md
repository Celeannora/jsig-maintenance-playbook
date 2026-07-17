# MP — Media Protection

JSIG TOC start page: **176**. Control IDs, titles, and page references below were extracted from the JSIG table of contents. [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)

Requirement statements and control enhancements are populated from the official NIST SP 800-53 Rev. 4 XML control catalog; verify every organization-defined parameter against the JSIG body before using this as an authoritative compliance database. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

## JSIG-specific extraction notes

The available JSIG snippets identify media handling, sanitization, releasing system components/media, and decommissioning-related media sanitization as operations and maintenance concerns. [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)

## Control inventory

| Control | Title | JSIG page | Baselines in NIST Rev. 4 |
|---|---|---:|---|
| [MP-1](#mp-1) | Media Protection Policy And Procedures | 176 | LOW, MODERATE, HIGH |
| [MP-2](#mp-2) | Media Access | 176 | LOW, MODERATE, HIGH |
| [MP-3](#mp-3) | Media Marking | 177 | MODERATE, HIGH |
| [MP-4](#mp-4) | Media Storage | 179 | MODERATE, HIGH |
| [MP-5](#mp-5) | Media Transport | 181 | MODERATE, HIGH |
| [MP-6](#mp-6) | Media Sanitization | 182 | LOW, MODERATE, HIGH |
| [MP-7](#mp-7) | Media Use | 187 | LOW, MODERATE, HIGH |
| [MP-8](#mp-8) | Media Downgrading | 189 | Not listed in NIST XML / verify |

## Controls

<a id="mp-1"></a>

### MP-1 — Media Protection Policy And Procedures

- **JSIG TOC page:** 176 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Media Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **MP-1a.** Develops, documents, and disseminates to [Assignment: organization-defined personnel or roles]:
    - **MP-1a.1.** A media protection policy that addresses purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance; and
    - **MP-1a.2.** Procedures to facilitate the implementation of the media protection policy and associated media protection controls; and
  - **MP-1b.** Reviews and updates the current:
    - **MP-1b.1.** Media protection policy [Assignment: organization-defined frequency]; and
    - **MP-1b.2.** Media protection procedures [Assignment: organization-defined frequency].

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="mp-2"></a>

### MP-2 — Media Access

- **JSIG TOC page:** 176 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Media Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization restricts access to [Assignment: organization-defined types of digital and/or non-digital media] to [Assignment: organization-defined personnel or roles].

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### MP-2 (1) — Automated Restricted Access

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into MP-4 (2)].
#### MP-2 (2) — Cryptographic Protection

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into SC-28 (1)].

---

<a id="mp-3"></a>

### MP-3 — Media Marking

- **JSIG TOC page:** 177 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Media Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **MP-3a.** Marks information system media indicating the distribution limitations, handling caveats, and applicable security markings (if any) of the information; and
  - **MP-3b.** Exempts [Assignment: organization-defined types of information system media] from marking as long as the media remain within [Assignment: organization-defined controlled areas].

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="mp-4"></a>

### MP-4 — Media Storage

- **JSIG TOC page:** 179 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Media Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **MP-4a.** Physically controls and securely stores [Assignment: organization-defined types of digital and/or non-digital media] within [Assignment: organization-defined controlled areas]; and
  - **MP-4b.** Protects information system media until the media are destroyed or sanitized using approved equipment, techniques, and procedures.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### MP-4 (1) — Cryptographic Protection

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into SC-28 (1)].
#### MP-4 (2) — Automated Restricted Access

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs automated mechanisms to restrict access to media storage areas and to audit access attempts and access granted.

---

<a id="mp-5"></a>

### MP-5 — Media Transport

- **JSIG TOC page:** 181 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Media Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **MP-5a.** Protects and controls [Assignment: organization-defined types of information system media] during transport outside of controlled areas using [Assignment: organization-defined security safeguards];
  - **MP-5b.** Maintains accountability for information system media during transport outside of controlled areas;
  - **MP-5c.** Documents activities associated with the transport of information system media; and
  - **MP-5d.** Restricts the activities associated with the transport of information system media to authorized personnel.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### MP-5 (1) — Protection Outside Of Controlled Areas

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into MP-5].
#### MP-5 (2) — Documentation Of Activities

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into MP-5].
#### MP-5 (3) — Custodians

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs an identified custodian during transport of information system media outside of controlled areas.
#### MP-5 (4) — Cryptographic Protection

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system implements cryptographic mechanisms to protect the confidentiality and integrity of information stored on digital media during transport outside of controlled areas.

---

<a id="mp-6"></a>

### MP-6 — Media Sanitization

- **JSIG TOC page:** 182 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Media Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **MP-6a.** Sanitizes [Assignment: organization-defined information system media] prior to disposal, release out of organizational control, or release for reuse using [Assignment: organization-defined sanitization techniques and procedures] in accordance with applicable federal and organizational standards and policies; and
  - **MP-6b.** Employs sanitization mechanisms with the strength and integrity commensurate with the security category or classification of the information.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### MP-6 (1) — Review / Approve / Track / Document / Verify

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization reviews, approves, tracks, documents, and verifies media sanitization and disposal actions.
#### MP-6 (2) — Equipment Testing

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization tests sanitization equipment and procedures [Assignment: organization-defined frequency] to verify that the intended sanitization is being achieved.
#### MP-6 (3) — Nondestructive Techniques

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization applies nondestructive sanitization techniques to portable storage devices prior to connecting such devices to the information system under the following circumstances: [Assignment: organization-defined circumstances requiring sanitization of portable storage devices].
#### MP-6 (4) — Controlled Unclassified Information

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into MP-6].
#### MP-6 (5) — Classified Information

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into MP-6].
#### MP-6 (6) — Media Destruction

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into MP-6].
#### MP-6 (7) — Dual Authorization

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization enforces dual authorization for the sanitization of [Assignment: organization-defined information system media].
#### MP-6 (8) — Remote Purging / Wiping Of Information

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization provides the capability to purge/wipe information from [Assignment: organization-defined information systems, system components, or devices] either remotely or under the following conditions: [Assignment: organization-defined conditions].

---

<a id="mp-7"></a>

### MP-7 — Media Use

- **JSIG TOC page:** 187 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Media Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization [Selection: restricts; prohibits] the use of [Assignment: organization-defined types of information system media] on [Assignment: organization-defined information systems or system components] using [Assignment: organization-defined security safeguards].

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### MP-7 (1) — Prohibit Use Without Owner

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization prohibits the use of portable storage devices in organizational information systems when such devices have no identifiable owner.
#### MP-7 (2) — Prohibit Use Of Sanitization-Resistant Media

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization prohibits the use of sanitization-resistant media in organizational information systems.

---

<a id="mp-8"></a>

### MP-8 — Media Downgrading

- **JSIG TOC page:** 189 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Media Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **MP-8a.** Establishes [Assignment: organization-defined information system media downgrading process] that includes employing downgrading mechanisms with [Assignment: organization-defined strength and integrity];
  - **MP-8b.** Ensures that the information system media downgrading process is commensurate with the security category and/or classification level of the information to be removed and the access authorizations of the potential recipients of the downgraded information;
  - **MP-8c.** Identifies [Assignment: organization-defined information system media requiring downgrading]; and
  - **MP-8d.** Downgrades the identified information system media using the established process.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### MP-8 (1) — Documentation Of Process

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization documents information system media downgrading actions.
#### MP-8 (2) — Equipment Testing

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs [Assignment: organization-defined tests] of downgrading equipment and procedures to verify correct performance [Assignment: organization-defined frequency].
#### MP-8 (3) — Controlled Unclassified Information

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization downgrades information system media containing [Assignment: organization-defined Controlled Unclassified Information (CUI)] prior to public release in accordance with applicable federal and organizational standards and policies.
#### MP-8 (4) — Classified Information

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization downgrades information system media containing classified information prior to release to individuals without required access authorizations in accordance with NSA standards and policies.

---

