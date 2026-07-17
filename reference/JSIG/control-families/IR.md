# IR — Incident Response

JSIG TOC start page: **157**. Control IDs, titles, and page references below were extracted from the JSIG table of contents. [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)

Requirement statements and control enhancements are populated from the official NIST SP 800-53 Rev. 4 XML control catalog; verify every organization-defined parameter against the JSIG body before using this as an authoritative compliance database. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

## Control inventory

| Control | Title | JSIG page | Baselines in NIST Rev. 4 |
|---|---|---:|---|
| [IR-1](#ir-1) | Incident Response Policy And Procedures | 157 | LOW, MODERATE, HIGH |
| [IR-2](#ir-2) | Incident Response Training | 158 | LOW, MODERATE, HIGH |
| [IR-3](#ir-3) | Incident Response Testing | 158 | MODERATE, HIGH |
| [IR-4](#ir-4) | Incident Handling | 159 | LOW, MODERATE, HIGH |
| [IR-5](#ir-5) | Incident Monitoring | 163 | LOW, MODERATE, HIGH |
| [IR-6](#ir-6) | Incident Reporting | 164 | LOW, MODERATE, HIGH |
| [IR-7](#ir-7) | Incident Response Assistance | 165 | LOW, MODERATE, HIGH |
| [IR-8](#ir-8) | Incident Response Plan | 166 | LOW, MODERATE, HIGH |
| [IR-9](#ir-9) | Information Spillage Response | 167 | Not listed in NIST XML / verify |
| [IR-10](#ir-10) | Integrated Information Security Analysis Team | 168 | Not listed in NIST XML / verify |

## Controls

<a id="ir-1"></a>

### IR-1 — Incident Response Policy And Procedures

- **JSIG TOC page:** 157 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Incident Response [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **IR-1a.** Develops, documents, and disseminates to [Assignment: organization-defined personnel or roles]:
    - **IR-1a.1.** An incident response policy that addresses purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance; and
    - **IR-1a.2.** Procedures to facilitate the implementation of the incident response policy and associated incident response controls; and
  - **IR-1b.** Reviews and updates the current:
    - **IR-1b.1.** Incident response policy [Assignment: organization-defined frequency]; and
    - **IR-1b.2.** Incident response procedures [Assignment: organization-defined frequency].

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="ir-2"></a>

### IR-2 — Incident Response Training

- **JSIG TOC page:** 158 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Incident Response [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization provides incident response training to information system users consistent with assigned roles and responsibilities:
  - **IR-2a.** Within [Assignment: organization-defined time period] of assuming an incident response role or responsibility;
  - **IR-2b.** When required by information system changes; and
  - **IR-2c.** [Assignment: organization-defined frequency] thereafter.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### IR-2 (1) — Simulated Events

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization incorporates simulated events into incident response training to facilitate effective response by personnel in crisis situations.
#### IR-2 (2) — Automated Training Environments

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs automated mechanisms to provide a more thorough and realistic incident response training environment.

---

<a id="ir-3"></a>

### IR-3 — Incident Response Testing

- **JSIG TOC page:** 158 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Incident Response [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization tests the incident response capability for the information system [Assignment: organization-defined frequency] using [Assignment: organization-defined tests] to determine the incident response effectiveness and documents the results.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### IR-3 (1) — Automated Testing

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs automated mechanisms to more thoroughly and effectively test the incident response capability.
#### IR-3 (2) — Coordination With Related Plans

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization coordinates incident response testing with organizational elements responsible for related plans.

---

<a id="ir-4"></a>

### IR-4 — Incident Handling

- **JSIG TOC page:** 159 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Incident Response [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **IR-4a.** Implements an incident handling capability for security incidents that includes preparation, detection and analysis, containment, eradication, and recovery;
  - **IR-4b.** Coordinates incident handling activities with contingency planning activities; and
  - **IR-4c.** Incorporates lessons learned from ongoing incident handling activities into incident response procedures, training, and testing, and implements the resulting changes accordingly.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### IR-4 (1) — Automated Incident Handling Processes

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs automated mechanisms to support the incident handling process.
#### IR-4 (2) — Dynamic Reconfiguration

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization includes dynamic reconfiguration of [Assignment: organization-defined information system components] as part of the incident response capability.
#### IR-4 (3) — Continuity Of Operations

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization identifies [Assignment: organization-defined classes of incidents] and [Assignment: organization-defined actions to take in response to classes of incidents] to ensure continuation of organizational missions and business functions.
#### IR-4 (4) — Information Correlation

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization correlates incident information and individual incident responses to achieve an organization-wide perspective on incident awareness and response.
#### IR-4 (5) — Automatic Disabling Of Information System

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization implements a configurable capability to automatically disable the information system if [Assignment: organization-defined security violations] are detected.
#### IR-4 (6) — Insider Threats - Specific Capabilities

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization implements incident handling capability for insider threats.
#### IR-4 (7) — Insider Threats - Intra-Organization Coordination

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization coordinates incident handling capability for insider threats across [Assignment: organization-defined components or elements of the organization].
#### IR-4 (8) — Correlation With External Organizations

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization coordinates with [Assignment: organization-defined external organizations] to correlate and share [Assignment: organization-defined incident information] to achieve a cross-organization perspective on incident awareness and more effective incident responses.
#### IR-4 (9) — Dynamic Response Capability

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs [Assignment: organization-defined dynamic response capabilities] to effectively respond to security incidents.
#### IR-4 (10) — Supply Chain Coordination

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization coordinates incident handling activities involving supply chain events with other organizations involved in the supply chain.

---

<a id="ir-5"></a>

### IR-5 — Incident Monitoring

- **JSIG TOC page:** 163 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Incident Response [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization tracks and documents information system security incidents.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### IR-5 (1) — Automated Tracking / Data Collection / Analysis

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs automated mechanisms to assist in the tracking of security incidents and in the collection and analysis of incident information.

---

<a id="ir-6"></a>

### IR-6 — Incident Reporting

- **JSIG TOC page:** 164 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Incident Response [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **IR-6a.** Requires personnel to report suspected security incidents to the organizational incident response capability within [Assignment: organization-defined time period]; and
  - **IR-6b.** Reports security incident information to [Assignment: organization-defined authorities].

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### IR-6 (1) — Automated Reporting

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs automated mechanisms to assist in the reporting of security incidents.
#### IR-6 (2) — Vulnerabilities Related To Incidents

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization reports information system vulnerabilities associated with reported security incidents to [Assignment: organization-defined personnel or roles].
#### IR-6 (3) — Coordination With Supply Chain

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization provides security incident information to other organizations involved in the supply chain for information systems or information system components related to the incident.

---

<a id="ir-7"></a>

### IR-7 — Incident Response Assistance

- **JSIG TOC page:** 165 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Incident Response [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization provides an incident response support resource, integral to the organizational incident response capability that offers advice and assistance to users of the information system for the handling and reporting of security incidents.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### IR-7 (1) — Automation Support For Availability Of Information / Support

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs automated mechanisms to increase the availability of incident response-related information and support.
#### IR-7 (2) — Coordination With External Providers

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization:
  - **IR-7 (2)(a)** Establishes a direct, cooperative relationship between its incident response capability and external providers of information system protection capability; and
  - **IR-7 (2)(b)** Identifies organizational incident response team members to the external providers.

---

<a id="ir-8"></a>

### IR-8 — Incident Response Plan

- **JSIG TOC page:** 166 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Incident Response [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **IR-8a.** Develops an incident response plan that:
    - **IR-8a.1.** Provides the organization with a roadmap for implementing its incident response capability;
    - **IR-8a.2.** Describes the structure and organization of the incident response capability;
    - **IR-8a.3.** Provides a high-level approach for how the incident response capability fits into the overall organization;
    - **IR-8a.4.** Meets the unique requirements of the organization, which relate to mission, size, structure, and functions;
    - **IR-8a.5.** Defines reportable incidents;
    - **IR-8a.6.** Provides metrics for measuring the incident response capability within the organization;
    - **IR-8a.7.** Defines the resources and management support needed to effectively maintain and mature an incident response capability; and
    - **IR-8a.8.** Is reviewed and approved by [Assignment: organization-defined personnel or roles];
  - **IR-8b.** Distributes copies of the incident response plan to [Assignment: organization-defined incident response personnel (identified by name and/or by role) and organizational elements];
  - **IR-8c.** Reviews the incident response plan [Assignment: organization-defined frequency];
  - **IR-8d.** Updates the incident response plan to address system/organizational changes or problems encountered during plan implementation, execution, or testing;
  - **IR-8e.** Communicates incident response plan changes to [Assignment: organization-defined incident response personnel (identified by name and/or by role) and organizational elements]; and
  - **IR-8f.** Protects the incident response plan from unauthorized disclosure and modification.

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="ir-9"></a>

### IR-9 — Information Spillage Response

- **JSIG TOC page:** 167 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Incident Response [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization responds to information spills by:
  - **IR-9a.** Identifying the specific information involved in the information system contamination;
  - **IR-9b.** Alerting [Assignment: organization-defined personnel or roles] of the information spill using a method of communication not associated with the spill;
  - **IR-9c.** Isolating the contaminated information system or system component;
  - **IR-9d.** Eradicating the information from the contaminated information system or component;
  - **IR-9e.** Identifying other information systems or system components that may have been subsequently contaminated; and
  - **IR-9f.** Performing other [Assignment: organization-defined actions].

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### IR-9 (1) — Responsible Personnel

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization assigns [Assignment: organization-defined personnel or roles] with responsibility for responding to information spills.
#### IR-9 (2) — Training

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization provides information spillage response training [Assignment: organization-defined frequency].
#### IR-9 (3) — Post-Spill Operations

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization implements [Assignment: organization-defined procedures] to ensure that organizational personnel impacted by information spills can continue to carry out assigned tasks while contaminated systems are undergoing corrective actions.
#### IR-9 (4) — Exposure To Unauthorized Personnel

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs [Assignment: organization-defined security safeguards] for personnel exposed to information not within assigned access authorizations.

---

<a id="ir-10"></a>

### IR-10 — Integrated Information Security Analysis Team

- **JSIG TOC page:** 168 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Incident Response [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization establishes an integrated team of forensic/malicious code analysts, tool developers, and real-time operations personnel.

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

