# SC — System And Communications Protection

JSIG TOC start page: **250**. Control IDs, titles, and page references below were extracted from the JSIG table of contents. [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)

Requirement statements and control enhancements are populated from the official NIST SP 800-53 Rev. 4 XML control catalog; verify every organization-defined parameter against the JSIG body before using this as an authoritative compliance database. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

## JSIG-specific extraction notes

The available JSIG snippets confirm SC-28 as one of three non-tailorable controls and state that encryption of data at rest shall be implemented for all SAP systems. [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)

## Control inventory

| Control | Title | JSIG page | Baselines in NIST Rev. 4 |
|---|---|---:|---|
| [SC-1](#sc-1) | System And Communications Protection Policy And Procedures | 250 | LOW, MODERATE, HIGH |
| [SC-2](#sc-2) | Application Partitioning | 250 | MODERATE, HIGH |
| [SC-3](#sc-3) | Security Function Isolation | 251 | HIGH |
| [SC-4](#sc-4) | Information In Shared Resources | 252 | MODERATE, HIGH |
| [SC-5](#sc-5) | Denial Of Service Protection | 252 | LOW, MODERATE, HIGH |
| [SC-6](#sc-6) | Resource Availability | 253 | Not listed in NIST XML / verify |
| [SC-7](#sc-7) | Boundary Protection | 254 | LOW, MODERATE, HIGH |
| [SC-8](#sc-8) | Transmission Confidentiality And Integrity | 258 | MODERATE, HIGH |
| [SC-9](#sc-9) | Transmission Confidentiality | 260 | Not listed in NIST XML / verify |
| [SC-10](#sc-10) | Network Disconnect | 260 | MODERATE, HIGH |
| [SC-11](#sc-11) | Trusted Path | 261 | Not listed in NIST XML / verify |
| [SC-12](#sc-12) | Cryptographic Key Establishment And Management | 261 | LOW, MODERATE, HIGH |
| [SC-13](#sc-13) | Cryptographic Protection | 262 | LOW, MODERATE, HIGH |
| [SC-14](#sc-14) | Public Access Protections | 262 | Not listed in NIST XML / verify |
| [SC-15](#sc-15) | Collaborative Computing Devices | 262 | LOW, MODERATE, HIGH |
| [SC-16](#sc-16) | Transmission Of Security Attributes | 264 | Not listed in NIST XML / verify |
| [SC-17](#sc-17) | Public Key Infrastructure Certificates | 264 | MODERATE, HIGH |
| [SC-18](#sc-18) | Mobile Code | 265 | MODERATE, HIGH |
| [SC-19](#sc-19) | Voice Over Internet Protocol | 267 | MODERATE, HIGH |
| [SC-20](#sc-20) | Secure Name / Address Resolution Service (Authoritative Source) | 268 | LOW, MODERATE, HIGH |
| [SC-21](#sc-21) | Secure Name / Address Resolution Service (Recursive Or Caching Resolver) | 268 | LOW, MODERATE, HIGH |
| [SC-22](#sc-22) | Session Authenticity | 269 | LOW, MODERATE, HIGH |
| [SC-23](#sc-23) | Session Authenticity | 269 | MODERATE, HIGH |
| [SC-24](#sc-24) | Fail In Known State | 270 | HIGH |
| [SC-25](#sc-25) | Thin Nodes | 270 | Not listed in NIST XML / verify |
| [SC-26](#sc-26) | Honeypots | 270 | Not listed in NIST XML / verify |
| [SC-27](#sc-27) | Platform-Independent Applications | 270 | Not listed in NIST XML / verify |
| [SC-28](#sc-28) | Protection Of Information At Rest | 271 | MODERATE, HIGH |
| [SC-29](#sc-29) | Heterogeneity | 272 | Not listed in NIST XML / verify |
| [SC-30](#sc-30) | Concealment And Misdirection | 272 | Not listed in NIST XML / verify |
| [SC-31](#sc-31) | Covert Channel Analysis | 273 | Not listed in NIST XML / verify |
| [SC-32](#sc-32) | Information System Partitioning | 274 | Not listed in NIST XML / verify |
| [SC-33](#sc-33) | Transmission Preparation Integrity | 274 | Not listed in NIST XML / verify |
| [SC-34](#sc-34) | Non-Modifiable Executable Programs | 274 | Not listed in NIST XML / verify |
| [SC-35](#sc-35) | Honeyclients | 275 | Not listed in NIST XML / verify |
| [SC-36](#sc-36) | Distributed Processing And Storage | 275 | Not listed in NIST XML / verify |
| [SC-37](#sc-37) | Out-Of-Band Channels | 276 | Not listed in NIST XML / verify |
| [SC-38](#sc-38) | Operations Security | 276 | Not listed in NIST XML / verify |
| [SC-39](#sc-39) | Process Isolation | 277 | LOW, MODERATE, HIGH |
| [SC-40](#sc-40) | Wireless Link Protection | 277 | Not listed in NIST XML / verify |
| [SC-41](#sc-41) | Port And I/O Device Access | 278 | Not listed in NIST XML / verify |
| [SC-42](#sc-42) | Sensor Capability And Data | 279 | Not listed in NIST XML / verify |
| [SC-43](#sc-43) | Usage Restrictions | 279 | Not listed in NIST XML / verify |
| [SC-44](#sc-44) | Detonation Chambers | 280 | Not listed in NIST XML / verify |

## Controls

<a id="sc-1"></a>

### SC-1 — System And Communications Protection Policy And Procedures

- **JSIG TOC page:** 250 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **SC-1a.** Develops, documents, and disseminates to [Assignment: organization-defined personnel or roles]:
    - **SC-1a.1.** A system and communications protection policy that addresses purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance; and
    - **SC-1a.2.** Procedures to facilitate the implementation of the system and communications protection policy and associated system and communications protection controls; and
  - **SC-1b.** Reviews and updates the current:
    - **SC-1b.1.** System and communications protection policy [Assignment: organization-defined frequency]; and
    - **SC-1b.2.** System and communications protection procedures [Assignment: organization-defined frequency].

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="sc-2"></a>

### SC-2 — Application Partitioning

- **JSIG TOC page:** 250 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system separates user functionality (including user interface services) from information system management functionality.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SC-2 (1) — Interfaces For Non-Privileged Users

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system prevents the presentation of information system management-related functionality at an interface for non-privileged users.

---

<a id="sc-3"></a>

### SC-3 — Security Function Isolation

- **JSIG TOC page:** 251 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system isolates security functions from nonsecurity functions.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SC-3 (1) — Hardware Separation

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system utilizes underlying hardware separation mechanisms to implement security function isolation.
#### SC-3 (2) — Access / Flow Control Functions

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system isolates security functions enforcing access and information flow control from nonsecurity functions and from other security functions.
#### SC-3 (3) — Minimize Nonsecurity Functionality

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization minimizes the number of nonsecurity functions included within the isolation boundary containing security functions.
#### SC-3 (4) — Module Coupling And Cohesiveness

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization implements security functions as largely independent modules that maximize internal cohesiveness within modules and minimize coupling between modules.
#### SC-3 (5) — Layered Structures

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization implements security functions as a layered structure minimizing interactions between layers of the design and avoiding any dependence by lower layers on the functionality or correctness of higher layers.

---

<a id="sc-4"></a>

### SC-4 — Information In Shared Resources

- **JSIG TOC page:** 252 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system prevents unauthorized and unintended information transfer via shared system resources.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SC-4 (1) — Security Levels

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into SC-4].
#### SC-4 (2) — Periods Processing

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system prevents unauthorized information transfer via shared resources in accordance with [Assignment: organization-defined procedures] when system processing explicitly switches between different information classification levels or security categories.

---

<a id="sc-5"></a>

### SC-5 — Denial Of Service Protection

- **JSIG TOC page:** 252 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system protects against or limits the effects of the following types of denial of service attacks: [Assignment: organization-defined types of denial of service attacks or references to sources for such information] by employing [Assignment: organization-defined security safeguards].

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SC-5 (1) — Restrict Internal Users

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system restricts the ability of individuals to launch [Assignment: organization-defined denial of service attacks] against other information systems.
#### SC-5 (2) — Excess Capacity / Bandwidth / Redundancy

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system manages excess capacity, bandwidth, or other redundancy to limit the effects of information flooding denial of service attacks.
#### SC-5 (3) — Detection / Monitoring

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization:
  - **SC-5 (3)(a)** Employs [Assignment: organization-defined monitoring tools] to detect indicators of denial of service attacks against the information system; and
  - **SC-5 (3)(b)** Monitors [Assignment: organization-defined information system resources] to determine if sufficient resources exist to prevent effective denial of service attacks.

---

<a id="sc-6"></a>

### SC-6 — Resource Availability

- **JSIG TOC page:** 253 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system protects the availability of resources by allocating [Assignment: organization-defined resources] by [Selection (one or more); priority; quota; [Assignment: organization-defined security safeguards]].

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="sc-7"></a>

### SC-7 — Boundary Protection

- **JSIG TOC page:** 254 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system:
  - **SC-7a.** Monitors and controls communications at the external boundary of the system and at key internal boundaries within the system;
  - **SC-7b.** Implements subnetworks for publicly accessible system components that are [Selection: physically; logically] separated from internal organizational networks; and
  - **SC-7c.** Connects to external networks or information systems only through managed interfaces consisting of boundary protection devices arranged in accordance with an organizational security architecture.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SC-7 (1) — Physically Separated Subnetworks

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into SC-7].
#### SC-7 (2) — Public Access

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into SC-7].
#### SC-7 (3) — Access Points

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization limits the number of external network connections to the information system.
#### SC-7 (4) — External Telecommunications Services

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization:
  - **SC-7 (4)(a)** Implements a managed interface for each external telecommunication service;
  - **SC-7 (4)(b)** Establishes a traffic flow policy for each managed interface;
  - **SC-7 (4)(c)** Protects the confidentiality and integrity of the information being transmitted across each interface;
  - **SC-7 (4)(d)** Documents each exception to the traffic flow policy with a supporting mission/business need and duration of that need; and
  - **SC-7 (4)(e)** Reviews exceptions to the traffic flow policy [Assignment: organization-defined frequency] and removes exceptions that are no longer supported by an explicit mission/business need.
#### SC-7 (5) — Deny By Default / Allow By Exception

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system at managed interfaces denies network communications traffic by default and allows network communications traffic by exception (i.e., deny all, permit by exception).
#### SC-7 (6) — Response To Recognized Failures

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into SC-7 (18)].
#### SC-7 (7) — Prevent Split Tunneling For Remote Devices

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system, in conjunction with a remote device, prevents the device from simultaneously establishing non-remote connections with the system and communicating via some other connection to resources in external networks.
#### SC-7 (8) — Route Traffic To Authenticated Proxy Servers

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system routes [Assignment: organization-defined internal communications traffic] to [Assignment: organization-defined external networks] through authenticated proxy servers at managed interfaces.
#### SC-7 (9) — Restrict Threatening Outgoing Communications Traffic

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system:
  - **SC-7 (9)(a)** Detects and denies outgoing communications traffic posing a threat to external information systems; and
  - **SC-7 (9)(b)** Audits the identity of internal users associated with denied communications.
#### SC-7 (10) — Prevent Unauthorized Exfiltration

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization prevents the unauthorized exfiltration of information across managed interfaces.
#### SC-7 (11) — Restrict Incoming Communications Traffic

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system only allows incoming communications from [Assignment: organization-defined authorized sources] to be routed to [Assignment: organization-defined authorized destinations].
#### SC-7 (12) — Host-Based Protection

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization implements [Assignment: organization-defined host-based boundary protection mechanisms] at [Assignment: organization-defined information system components].
#### SC-7 (13) — Isolation Of Security Tools / Mechanisms / Support Components

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization isolates [Assignment: organization-defined information security tools, mechanisms, and support components] from other internal information system components by implementing physically separate subnetworks with managed interfaces to other components of the system.
#### SC-7 (14) — Protects Against Unauthorized Physical Connections

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization protects against unauthorized physical connections at [Assignment: organization-defined managed interfaces].
#### SC-7 (15) — Route Privileged Network Accesses

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system routes all networked, privileged accesses through a dedicated, managed interface for purposes of access control and auditing.
#### SC-7 (16) — Prevent Discovery Of Components / Devices

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system prevents discovery of specific system components composing a managed interface.
#### SC-7 (17) — Automated Enforcement Of Protocol Formats

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system enforces adherence to protocol formats.
#### SC-7 (18) — Fail Secure

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system fails securely in the event of an operational failure of a boundary protection device.
#### SC-7 (19) — Blocks Communication From Non-Organizationally Configured Hosts

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system blocks both inbound and outbound communications traffic between [Assignment: organization-defined communication clients] that are independently configured by end users and external service providers.
#### SC-7 (20) — Dynamic Isolation / Segregation

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system provides the capability to dynamically isolate/segregate [Assignment: organization-defined information system components] from other components of the system.
#### SC-7 (21) — Isolation Of Information System Components

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs boundary protection mechanisms to separate [Assignment: organization-defined information system components] supporting [Assignment: organization-defined missions and/or business functions].
#### SC-7 (22) — Separate Subnets For Connecting To Different Security Domains

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system implements separate network addresses (i.e., different subnets) to connect to systems in different security domains.
#### SC-7 (23) — Disable Sender Feedback On Protocol Validation Failure

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system disables feedback to senders on protocol format validation failure.

---

<a id="sc-8"></a>

### SC-8 — Transmission Confidentiality And Integrity

- **JSIG TOC page:** 258 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system protects the [Selection (one or more): confidentiality; integrity] of transmitted information.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SC-8 (1) — Cryptographic Or Alternate Physical Protection

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system implements cryptographic mechanisms to [Selection (one or more): prevent unauthorized disclosure of information; detect changes to information] during transmission unless otherwise protected by [Assignment: organization-defined alternative physical safeguards].
#### SC-8 (2) — Pre / Post Transmission Handling

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system maintains the [Selection (one or more): confidentiality; integrity] of information during preparation for transmission and during reception.
#### SC-8 (3) — Cryptographic Protection For Message Externals

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system implements cryptographic mechanisms to protect message externals unless otherwise protected by [Assignment: organization-defined alternative physical safeguards].
#### SC-8 (4) — Conceal / Randomize Communications

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system implements cryptographic mechanisms to conceal or randomize communication patterns unless otherwise protected by [Assignment: organization-defined alternative physical safeguards].

---

<a id="sc-9"></a>

### SC-9 — Transmission Confidentiality

- **JSIG TOC page:** 260 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- [Withdrawn: Incorporated into SC-8].

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="sc-10"></a>

### SC-10 — Network Disconnect

- **JSIG TOC page:** 260 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system terminates the network connection associated with a communications session at the end of the session or after [Assignment: organization-defined time period] of inactivity.

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="sc-11"></a>

### SC-11 — Trusted Path

- **JSIG TOC page:** 261 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system establishes a trusted communications path between the user and the following security functions of the system: [Assignment: organization-defined security functions to include at a minimum, information system authentication and re-authentication].

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SC-11 (1) — Logical Isolation

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system provides a trusted communications path that is logically isolated and distinguishable from other paths.

---

<a id="sc-12"></a>

### SC-12 — Cryptographic Key Establishment And Management

- **JSIG TOC page:** 261 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization establishes and manages cryptographic keys for required cryptography employed within the information system in accordance with [Assignment: organization-defined requirements for key generation, distribution, storage, access, and destruction].

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SC-12 (1) — Availability

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization maintains availability of information in the event of the loss of cryptographic keys by users.
#### SC-12 (2) — Symmetric Keys

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization produces, controls, and distributes symmetric cryptographic keys using [Selection: NIST FIPS-compliant; NSA-approved] key management technology and processes.
#### SC-12 (3) — Asymmetric Keys

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization produces, controls, and distributes asymmetric cryptographic keys using [Selection: NSA-approved key management technology and processes; approved PKI Class 3 certificates or prepositioned keying material; approved PKI Class 3 or Class 4 certificates and hardware security tokens that protect the user's private key].
#### SC-12 (4) — Pki Certificates

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into SC-12].
#### SC-12 (5) — Pki Certificates / Hardware Tokens

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into SC-12].

---

<a id="sc-13"></a>

### SC-13 — Cryptographic Protection

- **JSIG TOC page:** 262 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system implements [Assignment: organization-defined cryptographic uses and type of cryptography required for each use] in accordance with applicable federal laws, Executive Orders, directives, policies, regulations, and standards.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SC-13 (1) — Fips-Validated Cryptography

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into SC-13].
#### SC-13 (2) — Nsa-Approved Cryptography

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into SC-13].
#### SC-13 (3) — Individuals Without Formal Access Approvals

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into SC-13].
#### SC-13 (4) — Digital Signatures

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into SC-13].

---

<a id="sc-14"></a>

### SC-14 — Public Access Protections

- **JSIG TOC page:** 262 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- [Withdrawn: Capability provided by AC-2, AC-3, AC-5, AC-6, SI-3, SI-4, SI-5, SI-7, SI-10].

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="sc-15"></a>

### SC-15 — Collaborative Computing Devices

- **JSIG TOC page:** 262 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system:
  - **SC-15a.** Prohibits remote activation of collaborative computing devices with the following exceptions: [Assignment: organization-defined exceptions where remote activation is to be allowed]; and
  - **SC-15b.** Provides an explicit indication of use to users physically present at the devices.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SC-15 (1) — Physical Disconnect

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system provides physical disconnect of collaborative computing devices in a manner that supports ease of use.
#### SC-15 (2) — Blocking Inbound / Outbound Communications Traffic

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into SC-7].
#### SC-15 (3) — Disabling / Removal In Secure Work Areas

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization disables or removes collaborative computing devices from [Assignment: organization-defined information systems or information system components] in [Assignment: organization-defined secure work areas].
#### SC-15 (4) — Explicitly Indicate Current Participants

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system provides an explicit indication of current participants in [Assignment: organization-defined online meetings and teleconferences].

---

<a id="sc-16"></a>

### SC-16 — Transmission Of Security Attributes

- **JSIG TOC page:** 264 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system associates [Assignment: organization-defined security attributes] with information exchanged between information systems and between system components.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SC-16 (1) — Integrity Validation

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system validates the integrity of transmitted security attributes.

---

<a id="sc-17"></a>

### SC-17 — Public Key Infrastructure Certificates

- **JSIG TOC page:** 264 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization issues public key certificates under an [Assignment: organization-defined certificate policy] or obtains public key certificates from an approved service provider.

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="sc-18"></a>

### SC-18 — Mobile Code

- **JSIG TOC page:** 265 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **SC-18a.** Defines acceptable and unacceptable mobile code and mobile code technologies;
  - **SC-18b.** Establishes usage restrictions and implementation guidance for acceptable mobile code and mobile code technologies; and
  - **SC-18c.** Authorizes, monitors, and controls the use of mobile code within the information system.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SC-18 (1) — Identify Unacceptable Code / Take Corrective Actions

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system identifies [Assignment: organization-defined unacceptable mobile code] and takes [Assignment: organization-defined corrective actions].
#### SC-18 (2) — Acquisition / Development / Use

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization ensures that the acquisition, development, and use of mobile code to be deployed in the information system meets [Assignment: organization-defined mobile code requirements].
#### SC-18 (3) — Prevent Downloading / Execution

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system prevents the download and execution of [Assignment: organization-defined unacceptable mobile code].
#### SC-18 (4) — Prevent Automatic Execution

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system prevents the automatic execution of mobile code in [Assignment: organization-defined software applications] and enforces [Assignment: organization-defined actions] prior to executing the code.
#### SC-18 (5) — Allow Execution Only In Confined Environments

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization allows execution of permitted mobile code only in confined virtual machine environments.

---

<a id="sc-19"></a>

### SC-19 — Voice Over Internet Protocol

- **JSIG TOC page:** 267 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **SC-19a.** Establishes usage restrictions and implementation guidance for Voice over Internet Protocol (VoIP) technologies based on the potential to cause damage to the information system if used maliciously; and
  - **SC-19b.** Authorizes, monitors, and controls the use of VoIP within the information system.

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="sc-20"></a>

### SC-20 — Secure Name / Address Resolution Service (Authoritative Source)

- **JSIG TOC page:** 268 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system:
  - **SC-20a.** Provides additional data origin authentication and integrity verification artifacts along with the authoritative name resolution data the system returns in response to external name/address resolution queries; and
  - **SC-20b.** Provides the means to indicate the security status of child zones and (if the child supports secure resolution services) to enable verification of a chain of trust among parent and child domains, when operating as part of a distributed, hierarchical namespace.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SC-20 (1) — Child Subspaces

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into SC-20].
#### SC-20 (2) — Data Origin / Integrity

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system provides data origin and integrity protection artifacts for internal name/address resolution queries.

---

<a id="sc-21"></a>

### SC-21 — Secure Name / Address Resolution Service (Recursive Or Caching Resolver)

- **JSIG TOC page:** 268 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system requests and performs data origin authentication and data integrity verification on the name/address resolution responses the system receives from authoritative sources.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SC-21 (1) — Data Origin / Integrity

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into SC-21].

---

<a id="sc-22"></a>

### SC-22 — Session Authenticity

- **JSIG TOC page:** 269 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information systems that collectively provide name/address resolution service for an organization are fault-tolerant and implement internal/external role separation.

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="sc-23"></a>

### SC-23 — Session Authenticity

- **JSIG TOC page:** 269 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system protects the authenticity of communications sessions.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SC-23 (1) — Invalidate Session Identifiers At Logout

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system invalidates session identifiers upon user logout or other session termination.
#### SC-23 (2) — User-Initiated Logouts / Message Displays

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into AC-12 (1)].
#### SC-23 (3) — Unique Session Identifiers With Randomization

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system generates a unique session identifier for each session with [Assignment: organization-defined randomness requirements] and recognizes only session identifiers that are system-generated.
#### SC-23 (4) — Unique Session Identifiers With Randomization

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into SC-23 (3)].
#### SC-23 (5) — Allowed Certificate Authorities

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system only allows the use of [Assignment: organization-defined certificate authorities] for verification of the establishment of protected sessions.

---

<a id="sc-24"></a>

### SC-24 — Fail In Known State

- **JSIG TOC page:** 270 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system fails to a [Assignment: organization-defined known-state] for [Assignment: organization-defined types of failures] preserving [Assignment: organization-defined system state information] in failure.

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="sc-25"></a>

### SC-25 — Thin Nodes

- **JSIG TOC page:** 270 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization employs [Assignment: organization-defined information system components] with minimal functionality and information storage.

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="sc-26"></a>

### SC-26 — Honeypots

- **JSIG TOC page:** 270 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system includes components specifically designed to be the target of malicious attacks for the purpose of detecting, deflecting, and analyzing such attacks.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SC-26 (1) — Detection Of Malicious Code

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into SC-35].

---

<a id="sc-27"></a>

### SC-27 — Platform-Independent Applications

- **JSIG TOC page:** 270 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system includes: [Assignment: organization-defined platform-independent applications].

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="sc-28"></a>

### SC-28 — Protection Of Information At Rest

- **JSIG TOC page:** 271 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system protects the [Selection (one or more): confidentiality; integrity] of [Assignment: organization-defined information at rest].

**Known JSIG-specific notes extracted:**

- Non-tailorable JSIG note: SC-28, Protection of Information at Rest, requires encryption of data at rest for all SAP systems; waiver authority rests with the Component SAP Senior Authorizing Official and cannot be further delegated. [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SC-28 (1) — Cryptographic Protection

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system implements cryptographic mechanisms to prevent unauthorized disclosure and modification of [Assignment: organization-defined information] on [Assignment: organization-defined information system components].
#### SC-28 (2) — Off-Line Storage

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization removes from online storage and stores off-line in a secure location [Assignment: organization-defined information].

---

<a id="sc-29"></a>

### SC-29 — Heterogeneity

- **JSIG TOC page:** 272 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization employs a diverse set of information technologies for [Assignment: organization-defined information system components] in the implementation of the information system.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SC-29 (1) — Virtualization Techniques

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs virtualization techniques to support the deployment of a diversity of operating systems and applications that are changed [Assignment: organization-defined frequency].

---

<a id="sc-30"></a>

### SC-30 — Concealment And Misdirection

- **JSIG TOC page:** 272 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization employs [Assignment: organization-defined concealment and misdirection techniques] for [Assignment: organization-defined information systems] at [Assignment: organization-defined time periods] to confuse and mislead adversaries.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SC-30 (1) — Virtualization Techniques

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into SC-29 (1)].
#### SC-30 (2) — Randomness

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs [Assignment: organization-defined techniques] to introduce randomness into organizational operations and assets.
#### SC-30 (3) — Change Processing / Storage Locations

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization changes the location of [Assignment: organization-defined processing and/or storage] [Selection: [Assignment: organization-defined time frequency]; at random time intervals]].
#### SC-30 (4) — Misleading Information

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs realistic, but misleading information in [Assignment: organization-defined information system components] with regard to its security state or posture.
#### SC-30 (5) — Concealment Of System Components

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs [Assignment: organization-defined techniques] to hide or conceal [Assignment: organization-defined information system components].

---

<a id="sc-31"></a>

### SC-31 — Covert Channel Analysis

- **JSIG TOC page:** 273 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **SC-31a.** Performs a covert channel analysis to identify those aspects of communications within the information system that are potential avenues for covert [Selection (one or more): storage; timing] channels; and
  - **SC-31b.** Estimates the maximum bandwidth of those channels.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SC-31 (1) — Test Covert Channels For Exploitability

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization tests a subset of the identified covert channels to determine which channels are exploitable.
#### SC-31 (2) — Maximum Bandwidth

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization reduces the maximum bandwidth for identified covert [Selection (one or more); storage; timing] channels to [Assignment: organization-defined values].
#### SC-31 (3) — Measure Bandwidth In Operational Environments

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization measures the bandwidth of [Assignment: organization-defined subset of identified covert channels] in the operational environment of the information system.

---

<a id="sc-32"></a>

### SC-32 — Information System Partitioning

- **JSIG TOC page:** 274 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization partitions the information system into [Assignment: organization-defined information system components] residing in separate physical domains or environments based on [Assignment: organization-defined circumstances for physical separation of components].

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="sc-33"></a>

### SC-33 — Transmission Preparation Integrity

- **JSIG TOC page:** 274 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- [Withdrawn: Incorporated into SC-8].

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="sc-34"></a>

### SC-34 — Non-Modifiable Executable Programs

- **JSIG TOC page:** 274 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system at [Assignment: organization-defined information system components]:
  - **SC-34a.** Loads and executes the operating environment from hardware-enforced, read-only media; and
  - **SC-34b.** Loads and executes [Assignment: organization-defined applications] from hardware-enforced, read-only media.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SC-34 (1) — No Writable Storage

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs [Assignment: organization-defined information system components] with no writeable storage that is persistent across component restart or power on/off.
#### SC-34 (2) — Integrity Protection / Read-Only Media

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization protects the integrity of information prior to storage on read-only media and controls the media after such information has been recorded onto the media.
#### SC-34 (3) — Hardware-Based Protection

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization:
  - **SC-34 (3)(a)** Employs hardware-based, write-protect for [Assignment: organization-defined information system firmware components]; and
  - **SC-34 (3)(b)** Implements specific procedures for [Assignment: organization-defined authorized individuals] to manually disable hardware write-protect for firmware modifications and re-enable the write-protect prior to returning to operational mode.

---

<a id="sc-35"></a>

### SC-35 — Honeyclients

- **JSIG TOC page:** 275 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system includes components that proactively seek to identify malicious websites and/or web-based malicious code.

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="sc-36"></a>

### SC-36 — Distributed Processing And Storage

- **JSIG TOC page:** 275 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization distributes [Assignment: organization-defined processing and storage] across multiple physical locations.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SC-36 (1) — Polling Techniques

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs polling techniques to identify potential faults, errors, or compromises to [Assignment: organization-defined distributed processing and storage components].

---

<a id="sc-37"></a>

### SC-37 — Out-Of-Band Channels

- **JSIG TOC page:** 276 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization employs [Assignment: organization-defined out-of-band channels] for the physical delivery or electronic transmission of [Assignment: organization-defined information, information system components, or devices] to [Assignment: organization-defined individuals or information systems].

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SC-37 (1) — Ensure Delivery / Transmission

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs [Assignment: organization-defined security safeguards] to ensure that only [Assignment: organization-defined individuals or information systems] receive the [Assignment: organization-defined information, information system components, or devices].

---

<a id="sc-38"></a>

### SC-38 — Operations Security

- **JSIG TOC page:** 276 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization employs [Assignment: organization-defined operations security safeguards] to protect key organizational information throughout the system development life cycle.

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="sc-39"></a>

### SC-39 — Process Isolation

- **JSIG TOC page:** 277 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system maintains a separate execution domain for each executing process.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SC-39 (1) — Hardware Separation

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system implements underlying hardware separation mechanisms to facilitate process separation.
#### SC-39 (2) — Thread Isolation

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system maintains a separate execution domain for each thread in [Assignment: organization-defined multi-threaded processing].

---

<a id="sc-40"></a>

### SC-40 — Wireless Link Protection

- **JSIG TOC page:** 277 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system protects external and internal [Assignment: organization-defined wireless links] from [Assignment: organization-defined types of signal parameter attacks or references to sources for such attacks].

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SC-40 (1) — Electromagnetic Interference

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system implements cryptographic mechanisms that achieve [Assignment: organization-defined level of protection] against the effects of intentional electromagnetic interference.
#### SC-40 (2) — Reduce Detection Potential

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system implements cryptographic mechanisms to reduce the detection potential of wireless links to [Assignment: organization-defined level of reduction].
#### SC-40 (3) — Imitative Or Manipulative Communications Deception

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system implements cryptographic mechanisms to identify and reject wireless transmissions that are deliberate attempts to achieve imitative or manipulative communications deception based on signal parameters.
#### SC-40 (4) — Signal Parameter Identification

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system implements cryptographic mechanisms to prevent the identification of [Assignment: organization-defined wireless transmitters] by using the transmitter signal parameters.

---

<a id="sc-41"></a>

### SC-41 — Port And I/O Device Access

- **JSIG TOC page:** 278 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization physically disables or removes [Assignment: organization-defined connection ports or input/output devices] on [Assignment: organization-defined information systems or information system components].

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="sc-42"></a>

### SC-42 — Sensor Capability And Data

- **JSIG TOC page:** 279 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system:
  - **SC-42a.** Prohibits the remote activation of environmental sensing capabilities with the following exceptions: [Assignment: organization-defined exceptions where remote activation of sensors is allowed]; and
  - **SC-42b.** Provides an explicit indication of sensor use to [Assignment: organization-defined class of users].

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SC-42 (1) — Reporting To Authorized Individuals Or Roles

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization ensures that the information system is configured so that data or information collected by the [Assignment: organization-defined sensors] is only reported to authorized individuals or roles.
#### SC-42 (2) — Authorized Use

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs the following measures: [Assignment: organization-defined measures], so that data or information collected by [Assignment: organization-defined sensors] is only used for authorized purposes.
#### SC-42 (3) — Prohibit Use Of Devices

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization prohibits the use of devices possessing [Assignment: organization-defined environmental sensing capabilities] in [Assignment: organization-defined facilities, areas, or systems].

---

<a id="sc-43"></a>

### SC-43 — Usage Restrictions

- **JSIG TOC page:** 279 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **SC-43a.** Establishes usage restrictions and implementation guidance for [Assignment: organization-defined information system components] based on the potential to cause damage to the information system if used maliciously; and
  - **SC-43b.** Authorizes, monitors, and controls the use of such components within the information system.

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="sc-44"></a>

### SC-44 — Detonation Chambers

- **JSIG TOC page:** 280 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Communications Protection [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization employs a detonation chamber capability within [Assignment: organization-defined information system, system component, or location].

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

