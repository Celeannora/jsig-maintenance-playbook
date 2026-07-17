# CM — Configuration Management

JSIG TOC start page: **112**. Control IDs, titles, and page references below were extracted from the JSIG table of contents. [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)

Requirement statements and control enhancements are populated from the official NIST SP 800-53 Rev. 4 XML control catalog; verify every organization-defined parameter against the JSIG body before using this as an authoritative compliance database. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

## JSIG-specific extraction notes

The available JSIG snippets emphasize that configuration management is integral to authorization, that CM decisions affect AO/DAO awareness, and that changes must be captured, approved by the AO as required, and documented in the SSP. [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)

## Control inventory

| Control | Title | JSIG page | Baselines in NIST Rev. 4 |
|---|---|---:|---|
| [CM-1](#cm-1) | Configuration Management Policy And Procedures | 112 | LOW, MODERATE, HIGH |
| [CM-2](#cm-2) | Baseline Configuration | 112 | LOW, MODERATE, HIGH |
| [CM-3](#cm-3) | Configuration Change Control | 114 | MODERATE, HIGH |
| [CM-4](#cm-4) | Security Impact Analysis | 117 | LOW, MODERATE, HIGH |
| [CM-5](#cm-5) | Access Restrictions For Change | 119 | MODERATE, HIGH |
| [CM-6](#cm-6) | Configuration Settings | 120 | LOW, MODERATE, HIGH |
| [CM-7](#cm-7) | Least Functionality | 122 | LOW, MODERATE, HIGH |
| [CM-8](#cm-8) | Information System Component Inventory | 124 | LOW, MODERATE, HIGH |
| [CM-9](#cm-9) | Configuration Management Plan | 126 | MODERATE, HIGH |
| [CM-10](#cm-10) | Software Usage Restrictions | 127 | LOW, MODERATE, HIGH |
| [CM-11](#cm-11) | User-Installed Software | 128 | LOW, MODERATE, HIGH |

## Controls

<a id="cm-1"></a>

### CM-1 — Configuration Management Policy And Procedures

- **JSIG TOC page:** 112 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Configuration Management [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **CM-1a.** Develops, documents, and disseminates to [Assignment: organization-defined personnel or roles]:
    - **CM-1a.1.** A configuration management policy that addresses purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance; and
    - **CM-1a.2.** Procedures to facilitate the implementation of the configuration management policy and associated configuration management controls; and
  - **CM-1b.** Reviews and updates the current:
    - **CM-1b.1.** Configuration management policy [Assignment: organization-defined frequency]; and
    - **CM-1b.2.** Configuration management procedures [Assignment: organization-defined frequency].

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="cm-2"></a>

### CM-2 — Baseline Configuration

- **JSIG TOC page:** 112 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Configuration Management [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization develops, documents, and maintains under configuration control, a current baseline configuration of the information system.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### CM-2 (1) — Reviews And Updates

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization reviews and updates the baseline configuration of the information system:
  - **CM-2 (1)(a)** [Assignment: organization-defined frequency];
  - **CM-2 (1)(b)** When required due to [Assignment organization-defined circumstances]; and
  - **CM-2 (1)(c)** As an integral part of information system component installations and upgrades.
#### CM-2 (2) — Automation Support For Accuracy / Currency

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs automated mechanisms to maintain an up-to-date, complete, accurate, and readily available baseline configuration of the information system.
#### CM-2 (3) — Retention Of Previous Configurations

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization retains [Assignment: organization-defined previous versions of baseline configurations of the information system] to support rollback.
#### CM-2 (4) — Unauthorized Software

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into CM-7].
#### CM-2 (5) — Authorized Software

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into CM-7].
#### CM-2 (6) — Development And Test Environments

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization maintains a baseline configuration for information system development and test environments that is managed separately from the operational baseline configuration.
#### CM-2 (7) — Configure Systems, Components, Or Devices For High-Risk Areas

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization:
  - **CM-2 (7)(a)** Issues [Assignment: organization-defined information systems, system components, or devices] with [Assignment: organization-defined configurations] to individuals traveling to locations that the organization deems to be of significant risk; and
  - **CM-2 (7)(b)** Applies [Assignment: organization-defined security safeguards] to the devices when the individuals return.

---

<a id="cm-3"></a>

### CM-3 — Configuration Change Control

- **JSIG TOC page:** 114 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Configuration Management [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **CM-3a.** Determines the types of changes to the information system that are configuration-controlled;
  - **CM-3b.** Reviews proposed configuration-controlled changes to the information system and approves or disapproves such changes with explicit consideration for security impact analyses;
  - **CM-3c.** Documents configuration change decisions associated with the information system;
  - **CM-3d.** Implements approved configuration-controlled changes to the information system;
  - **CM-3e.** Retains records of configuration-controlled changes to the information system for [Assignment: organization-defined time period];
  - **CM-3f.** Audits and reviews activities associated with configuration-controlled changes to the information system; and
  - **CM-3g.** Coordinates and provides oversight for configuration change control activities through [Assignment: organization-defined configuration change control element (e.g., committee, board)] that convenes [Selection (one or more): [Assignment: organization-defined frequency]; [Assignment: organization-defined configuration change conditions]].

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### CM-3 (1) — Automated Document / Notification / Prohibition Of Changes

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs automated mechanisms to:
  - **CM-3 (1)(a)** Document proposed changes to the information system;
  - **CM-3 (1)(b)** Notify [Assignment: organized-defined approval authorities] of proposed changes to the information system and request change approval;
  - **CM-3 (1)(c)** Highlight proposed changes to the information system that have not been approved or disapproved by [Assignment: organization-defined time period];
  - **CM-3 (1)(d)** Prohibit changes to the information system until designated approvals are received;
  - **CM-3 (1)(e)** Document all changes to the information system; and
  - **CM-3 (1)(f)** Notify [Assignment: organization-defined personnel] when approved changes to the information system are completed.
#### CM-3 (2) — Test / Validate / Document Changes

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization tests, validates, and documents changes to the information system before implementing the changes on the operational system.
#### CM-3 (3) — Automated Change Implementation

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs automated mechanisms to implement changes to the current information system baseline and deploys the updated baseline across the installed base.
#### CM-3 (4) — Security Representative

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization requires an information security representative to be a member of the [Assignment: organization-defined configuration change control element].
#### CM-3 (5) — Automated Security Response

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system implements [Assignment: organization-defined security responses] automatically if baseline configurations are changed in an unauthorized manner.
#### CM-3 (6) — Cryptography Management

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization ensures that cryptographic mechanisms used to provide [Assignment: organization-defined security safeguards] are under configuration management.

---

<a id="cm-4"></a>

### CM-4 — Security Impact Analysis

- **JSIG TOC page:** 117 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Configuration Management [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization analyzes changes to the information system to determine potential security impacts prior to change implementation.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### CM-4 (1) — Separate Test Environments

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization analyzes changes to the information system in a separate test environment before implementation in an operational environment, looking for security impacts due to flaws, weaknesses, incompatibility, or intentional malice.
#### CM-4 (2) — Verification Of Security Functions

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization, after the information system is changed, checks the security functions to verify that the functions are implemented correctly, operating as intended, and producing the desired outcome with regard to meeting the security requirements for the system.

---

<a id="cm-5"></a>

### CM-5 — Access Restrictions For Change

- **JSIG TOC page:** 119 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Configuration Management [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization defines, documents, approves, and enforces physical and logical access restrictions associated with changes to the information system.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### CM-5 (1) — Automated Access Enforcement / Auditing

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system enforces access restrictions and supports auditing of the enforcement actions.
#### CM-5 (2) — Review System Changes

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization reviews information system changes [Assignment: organization-defined frequency] and [Assignment: organization-defined circumstances] to determine whether unauthorized changes have occurred.
#### CM-5 (3) — Signed Components

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system prevents the installation of [Assignment: organization-defined software and firmware components] without verification that the component has been digitally signed using a certificate that is recognized and approved by the organization.
#### CM-5 (4) — Dual Authorization

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization enforces dual authorization for implementing changes to [Assignment: organization-defined information system components and system-level information].
#### CM-5 (5) — Limit Production / Operational Privileges

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization:
  - **CM-5 (5)(a)** Limits privileges to change information system components and system-related information within a production or operational environment; and
  - **CM-5 (5)(b)** Reviews and reevaluates privileges [Assignment: organization-defined frequency].
#### CM-5 (6) — Limit Library Privileges

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization limits privileges to change software resident within software libraries.
#### CM-5 (7) — Automatic Implementation Of Security Safeguards

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into SI-7].

---

<a id="cm-6"></a>

### CM-6 — Configuration Settings

- **JSIG TOC page:** 120 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Configuration Management [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **CM-6a.** Establishes and documents configuration settings for information technology products employed within the information system using [Assignment: organization-defined security configuration checklists] that reflect the most restrictive mode consistent with operational requirements;
  - **CM-6b.** Implements the configuration settings;
  - **CM-6c.** Identifies, documents, and approves any deviations from established configuration settings for [Assignment: organization-defined information system components] based on [Assignment: organization-defined operational requirements]; and
  - **CM-6d.** Monitors and controls changes to the configuration settings in accordance with organizational policies and procedures.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### CM-6 (1) — Automated Central Management / Application / Verification

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs automated mechanisms to centrally manage, apply, and verify configuration settings for [Assignment: organization-defined information system components].
#### CM-6 (2) — Respond To Unauthorized Changes

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs [Assignment: organization-defined security safeguards] to respond to unauthorized changes to [Assignment: organization-defined configuration settings].
#### CM-6 (3) — Unauthorized Change Detection

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into SI-7].
#### CM-6 (4) — Conformance Demonstration

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into CM-4].

---

<a id="cm-7"></a>

### CM-7 — Least Functionality

- **JSIG TOC page:** 122 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Configuration Management [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **CM-7a.** Configures the information system to provide only essential capabilities; and
  - **CM-7b.** Prohibits or restricts the use of the following functions, ports, protocols, and/or services: [Assignment: organization-defined prohibited or restricted functions, ports, protocols, and/or services].

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### CM-7 (1) — Periodic Review

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization:
  - **CM-7 (1)(a)** Reviews the information system [Assignment: organization-defined frequency] to identify unnecessary and/or nonsecure functions, ports, protocols, and services; and
  - **CM-7 (1)(b)** Disables [Assignment: organization-defined functions, ports, protocols, and services within the information system deemed to be unnecessary and/or nonsecure].
#### CM-7 (2) — Prevent Program Execution

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system prevents program execution in accordance with [Selection (one or more): [Assignment: organization-defined policies regarding software program usage and restrictions]; rules authorizing the terms and conditions of software program usage].
#### CM-7 (3) — Registration Compliance

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization ensures compliance with [Assignment: organization-defined registration requirements for functions, ports, protocols, and services].
#### CM-7 (4) — Unauthorized Software / Blacklisting

- **NIST baselines:** MODERATE [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization:
  - **CM-7 (4)(a)** Identifies [Assignment: organization-defined software programs not authorized to execute on the information system];
  - **CM-7 (4)(b)** Employs an allow-all, deny-by-exception policy to prohibit the execution of unauthorized software programs on the information system; and
  - **CM-7 (4)(c)** Reviews and updates the list of unauthorized software programs [Assignment: organization-defined frequency].
#### CM-7 (5) — Authorized Software / Whitelisting

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization:
  - **CM-7 (5)(a)** Identifies [Assignment: organization-defined software programs authorized to execute on the information system];
  - **CM-7 (5)(b)** Employs a deny-all, permit-by-exception policy to allow the execution of authorized software programs on the information system; and
  - **CM-7 (5)(c)** Reviews and updates the list of authorized software programs [Assignment: organization-defined frequency].

---

<a id="cm-8"></a>

### CM-8 — Information System Component Inventory

- **JSIG TOC page:** 124 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Configuration Management [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **CM-8a.** Develops and documents an inventory of information system components that:
    - **CM-8a.1.** Accurately reflects the current information system;
    - **CM-8a.2.** Includes all components within the authorization boundary of the information system;
    - **CM-8a.3.** Is at the level of granularity deemed necessary for tracking and reporting; and
    - **CM-8a.4.** Includes [Assignment: organization-defined information deemed necessary to achieve effective information system component accountability]; and
  - **CM-8b.** Reviews and updates the information system component inventory [Assignment: organization-defined frequency].

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### CM-8 (1) — Updates During Installations / Removals

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization updates the inventory of information system components as an integral part of component installations, removals, and information system updates.
#### CM-8 (2) — Automated Maintenance

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs automated mechanisms to help maintain an up-to-date, complete, accurate, and readily available inventory of information system components.
#### CM-8 (3) — Automated Unauthorized Component Detection

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization:
  - **CM-8 (3)(a)** Employs automated mechanisms [Assignment: organization-defined frequency] to detect the presence of unauthorized hardware, software, and firmware components within the information system; and
  - **CM-8 (3)(b)** Takes the following actions when unauthorized components are detected: [Selection (one or more): disables network access by such components; isolates the components; notifies [Assignment: organization-defined personnel or roles]].
#### CM-8 (4) — Accountability Information

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization includes in the information system component inventory information, a means for identifying by [Selection (one or more): name; position; role], individuals responsible/accountable for administering those components.
#### CM-8 (5) — No Duplicate Accounting Of Components

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization verifies that all components within the authorization boundary of the information system are not duplicated in other information system component inventories.
#### CM-8 (6) — Assessed Configurations / Approved Deviations

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization includes assessed component configurations and any approved deviations to current deployed configurations in the information system component inventory.
#### CM-8 (7) — Centralized Repository

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization provides a centralized repository for the inventory of information system components.
#### CM-8 (8) — Automated Location Tracking

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs automated mechanisms to support tracking of information system components by geographic location.
#### CM-8 (9) — Assignment Of Components To Systems

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization:
  - **CM-8 (9)(a)** Assigns [Assignment: organization-defined acquired information system components] to an information system; and
  - **CM-8 (9)(b)** Receives an acknowledgement from the information system owner of this assignment.

---

<a id="cm-9"></a>

### CM-9 — Configuration Management Plan

- **JSIG TOC page:** 126 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Configuration Management [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization develops, documents, and implements a configuration management plan for the information system that:
  - **CM-9a.** Addresses roles, responsibilities, and configuration management processes and procedures;
  - **CM-9b.** Establishes a process for identifying configuration items throughout the system development life cycle and for managing the configuration of the configuration items;
  - **CM-9c.** Defines the configuration items for the information system and places the configuration items under configuration management; and
  - **CM-9d.** Protects the configuration management plan from unauthorized disclosure and modification.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### CM-9 (1) — Assignment Of Responsibility

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization assigns responsibility for developing the configuration management process to organizational personnel that are not directly involved in information system development.

---

<a id="cm-10"></a>

### CM-10 — Software Usage Restrictions

- **JSIG TOC page:** 127 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Configuration Management [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **CM-10a.** Uses software and associated documentation in accordance with contract agreements and copyright laws;
  - **CM-10b.** Tracks the use of software and associated documentation protected by quantity licenses to control copying and distribution; and
  - **CM-10c.** Controls and documents the use of peer-to-peer file sharing technology to ensure that this capability is not used for the unauthorized distribution, display, performance, or reproduction of copyrighted work.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### CM-10 (1) — Open Source Software

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization establishes the following restrictions on the use of open source software: [Assignment: organization-defined restrictions].

---

<a id="cm-11"></a>

### CM-11 — User-Installed Software

- **JSIG TOC page:** 128 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Configuration Management [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **CM-11a.** Establishes [Assignment: organization-defined policies] governing the installation of software by users;
  - **CM-11b.** Enforces software installation policies through [Assignment: organization-defined methods]; and
  - **CM-11c.** Monitors policy compliance at [Assignment: organization-defined frequency].

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### CM-11 (1) — Alerts For Unauthorized Installations

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system alerts [Assignment: organization-defined personnel or roles] when the unauthorized installation of software is detected.
#### CM-11 (2) — Prohibit Installation Without Privileged Status

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system prohibits user installation of software without explicit privileged status.

---

