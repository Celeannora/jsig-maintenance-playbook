# CA — Security Assessment And Authorization

JSIG TOC start page: **100**. Control IDs, titles, and page references below were extracted from the JSIG table of contents. [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)

Requirement statements and control enhancements are populated from the official NIST SP 800-53 Rev. 4 XML control catalog; verify every organization-defined parameter against the JSIG body before using this as an authoritative compliance database. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

## Control inventory

| Control | Title | JSIG page | Baselines in NIST Rev. 4 |
|---|---|---:|---|
| [CA-1](#ca-1) | Security Assessment And Authorization Policy And Procedures | 100 | LOW, MODERATE, HIGH |
| [CA-2](#ca-2) | Security Assessments | 100 | LOW, MODERATE, HIGH |
| [CA-3](#ca-3) | System Interconnections | 104 | LOW, MODERATE, HIGH |
| [CA-4](#ca-4) | Security Certification | 105 | Not listed in NIST XML / verify |
| [CA-5](#ca-5) | Plan Of Action And Milestones | 105 | LOW, MODERATE, HIGH |
| [CA-6](#ca-6) | Security Authorization | 106 | LOW, MODERATE, HIGH |
| [CA-8](#ca-8) | Penetration Testing | 110 | HIGH |
| [CA-9](#ca-9) | Internal System Connections | 111 | LOW, MODERATE, HIGH |

## Controls

<a id="ca-1"></a>

### CA-1 — Security Assessment And Authorization Policy And Procedures

- **JSIG TOC page:** 100 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Security Assessment And Authorization [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **CA-1a.** Develops, documents, and disseminates to [Assignment: organization-defined personnel or roles]:
    - **CA-1a.1.** A security assessment and authorization policy that addresses purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance; and
    - **CA-1a.2.** Procedures to facilitate the implementation of the security assessment and authorization policy and associated security assessment and authorization controls; and
  - **CA-1b.** Reviews and updates the current:
    - **CA-1b.1.** Security assessment and authorization policy [Assignment: organization-defined frequency]; and
    - **CA-1b.2.** Security assessment and authorization procedures [Assignment: organization-defined frequency].

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="ca-2"></a>

### CA-2 — Security Assessments

- **JSIG TOC page:** 100 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Security Assessment And Authorization [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **CA-2a.** Develops a security assessment plan that describes the scope of the assessment including:
    - **CA-2a.1.** Security controls and control enhancements under assessment;
    - **CA-2a.2.** Assessment procedures to be used to determine security control effectiveness; and
    - **CA-2a.3.** Assessment environment, assessment team, and assessment roles and responsibilities;
  - **CA-2b.** Assesses the security controls in the information system and its environment of operation [Assignment: organization-defined frequency] to determine the extent to which the controls are implemented correctly, operating as intended, and producing the desired outcome with respect to meeting established security requirements;
  - **CA-2c.** Produces a security assessment report that documents the results of the assessment; and
  - **CA-2d.** Provides the results of the security control assessment to [Assignment: organization-defined individuals or roles].

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### CA-2 (1) — Independent Assessors

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs assessors or assessment teams with [Assignment: organization-defined level of independence] to conduct security control assessments.
#### CA-2 (2) — Specialized Assessments

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization includes as part of security control assessments, [Assignment: organization-defined frequency], [Selection: announced; unannounced], [Selection (one or more): in-depth monitoring; vulnerability scanning; malicious user testing; insider threat assessment; performance/load testing; [Assignment: organization-defined other forms of security assessment]].
#### CA-2 (3) — External Organizations

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization accepts the results of an assessment of [Assignment: organization-defined information system] performed by [Assignment: organization-defined external organization] when the assessment meets [Assignment: organization-defined requirements].

---

<a id="ca-3"></a>

### CA-3 — System Interconnections

- **JSIG TOC page:** 104 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Security Assessment And Authorization [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **CA-3a.** Authorizes connections from the information system to other information systems through the use of Interconnection Security Agreements;
  - **CA-3b.** Documents, for each interconnection, the interface characteristics, security requirements, and the nature of the information communicated; and
  - **CA-3c.** Reviews and updates Interconnection Security Agreements [Assignment: organization-defined frequency].

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### CA-3 (1) — Unclassified National Security System Connections

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization prohibits the direct connection of an [Assignment: organization-defined unclassified, national security system] to an external network without the use of [Assignment: organization-defined boundary protection device].
#### CA-3 (2) — Classified National Security System Connections

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization prohibits the direct connection of a classified, national security system to an external network without the use of [Assignment: organization-defined boundary protection device].
#### CA-3 (3) — Unclassified Non-National Security System Connections

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization prohibits the direct connection of an [Assignment: organization-defined unclassified, non-national security system] to an external network without the use of [Assignment; organization-defined boundary protection device].
#### CA-3 (4) — Connections To Public Networks

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization prohibits the direct connection of an [Assignment: organization-defined information system] to a public network.
#### CA-3 (5) — Restrictions On External System Connections

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs [Selection: allow-all, deny-by-exception; deny-all, permit-by-exception] policy for allowing [Assignment: organization-defined information systems] to connect to external information systems.

---

<a id="ca-4"></a>

### CA-4 — Security Certification

- **JSIG TOC page:** 105 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Security Assessment And Authorization [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- [Withdrawn: Incorporated into CA-2].

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="ca-5"></a>

### CA-5 — Plan Of Action And Milestones

- **JSIG TOC page:** 105 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Security Assessment And Authorization [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **CA-5a.** Develops a plan of action and milestones for the information system to document the organization's planned remedial actions to correct weaknesses or deficiencies noted during the assessment of the security controls and to reduce or eliminate known vulnerabilities in the system; and
  - **CA-5b.** Updates existing plan of action and milestones [Assignment: organization-defined frequency] based on the findings from security controls assessments, security impact analyses, and continuous monitoring activities.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### CA-5 (1) — Automation Support For Accuracy / Currency

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs automated mechanisms to help ensure that the plan of action and milestones for the information system is accurate, up to date, and readily available.

---

<a id="ca-6"></a>

### CA-6 — Security Authorization

- **JSIG TOC page:** 106 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Security Assessment And Authorization [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **CA-6a.** Assigns a senior-level executive or manager as the authorizing official for the information system;
  - **CA-6b.** Ensures that the authorizing official authorizes the information system for processing before commencing operations; and
  - **CA-6c.** Updates the security authorization [Assignment: organization-defined frequency].

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="ca-8"></a>

### CA-8 — Penetration Testing

- **JSIG TOC page:** 110 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Security Assessment And Authorization [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization conducts penetration testing [Assignment: organization-defined frequency] on [Assignment: organization-defined information systems or system components].

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### CA-8 (1) — Independent Penetration Agent Or Team

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs an independent penetration agent or penetration team to perform penetration testing on the information system or system components.
#### CA-8 (2) — Red Team Exercises

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs [Assignment: organization-defined red team exercises] to simulate attempts by adversaries to compromise organizational information systems in accordance with [Assignment: organization-defined rules of engagement].

---

<a id="ca-9"></a>

### CA-9 — Internal System Connections

- **JSIG TOC page:** 111 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Security Assessment And Authorization [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **CA-9a.** Authorizes internal connections of [Assignment: organization-defined information system components or classes of components] to the information system; and
  - **CA-9b.** Documents, for each internal connection, the interface characteristics, security requirements, and the nature of the information communicated.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### CA-9 (1) — Security Compliance Checks

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system performs security compliance checks on constituent system components prior to the establishment of the internal connection.

---

