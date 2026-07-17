# SI — System And Information Integrity

JSIG TOC start page: **281**. Control IDs, titles, and page references below were extracted from the JSIG table of contents. [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)

Requirement statements and control enhancements are populated from the official NIST SP 800-53 Rev. 4 XML control catalog; verify every organization-defined parameter against the JSIG body before using this as an authoritative compliance database. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

## Control inventory

| Control | Title | JSIG page | Baselines in NIST Rev. 4 |
|---|---|---:|---|
| [SI-1](#si-1) | System And Information Integrity Policy And Procedures | 281 | LOW, MODERATE, HIGH |
| [SI-2](#si-2) | Flaw Remediation | 281 | LOW, MODERATE, HIGH |
| [SI-3](#si-3) | Malicious Code Protection | 283 | LOW, MODERATE, HIGH |
| [SI-4](#si-4) | Information System Monitoring | 285 | LOW, MODERATE, HIGH |
| [SI-5](#si-5) | Security Alerts, Advisories, And Directives | 290 | LOW, MODERATE, HIGH |
| [SI-6](#si-6) | Security Function Verification | 291 | HIGH |
| [SI-7](#si-7) | Software, Firmware, And Information Integrity | 291 | MODERATE, HIGH |
| [SI-8](#si-8) | Spam Protection | 294 | MODERATE, HIGH |
| [SI-9](#si-9) | Information Input Restrictions | 295 | Not listed in NIST XML / verify |
| [SI-10](#si-10) | Information Input Validation | 295 | MODERATE, HIGH |
| [SI-11](#si-11) | Error Handling | 296 | MODERATE, HIGH |
| [SI-12](#si-12) | Information Handling And Retention | 297 | LOW, MODERATE, HIGH |
| [SI-13](#si-13) | Predictable Failure Prevention | 297 | Not listed in NIST XML / verify |
| [SI-14](#si-14) | Non-Persistence | 298 | Not listed in NIST XML / verify |
| [SI-15](#si-15) | Information Output Filtering | 298 | Not listed in NIST XML / verify |
| [SI-16](#si-16) | Memory Protection | 299 | MODERATE, HIGH |
| [SI-17](#si-17) | Fail-Safe Procedures | 299 | Not listed in NIST XML / verify |

## Controls

<a id="si-1"></a>

### SI-1 — System And Information Integrity Policy And Procedures

- **JSIG TOC page:** 281 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Information Integrity [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **SI-1a.** Develops, documents, and disseminates to [Assignment: organization-defined personnel or roles]:
    - **SI-1a.1.** A system and information integrity policy that addresses purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance; and
    - **SI-1a.2.** Procedures to facilitate the implementation of the system and information integrity policy and associated system and information integrity controls; and
  - **SI-1b.** Reviews and updates the current:
    - **SI-1b.1.** System and information integrity policy [Assignment: organization-defined frequency]; and
    - **SI-1b.2.** System and information integrity procedures [Assignment: organization-defined frequency].

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="si-2"></a>

### SI-2 — Flaw Remediation

- **JSIG TOC page:** 281 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Information Integrity [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **SI-2a.** Identifies, reports, and corrects information system flaws;
  - **SI-2b.** Tests software and firmware updates related to flaw remediation for effectiveness and potential side effects before installation;
  - **SI-2c.** Installs security-relevant software and firmware updates within [Assignment: organization-defined time period] of the release of the updates; and
  - **SI-2d.** Incorporates flaw remediation into the organizational configuration management process.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SI-2 (1) — Central Management

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization centrally manages the flaw remediation process.
#### SI-2 (2) — Automated Flaw Remediation Status

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs automated mechanisms [Assignment: organization-defined frequency] to determine the state of information system components with regard to flaw remediation.
#### SI-2 (3) — Time To Remediate Flaws / Benchmarks For Corrective Actions

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization:
  - **SI-2 (3)(a)** Measures the time between flaw identification and flaw remediation; and
  - **SI-2 (3)(b)** Establishes [Assignment: organization-defined benchmarks] for taking corrective actions.
#### SI-2 (4) — Automated Patch Management Tools

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into SI-2].
#### SI-2 (5) — Automatic Software / Firmware Updates

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization installs [Assignment: organization-defined security-relevant software and firmware updates] automatically to [Assignment: organization-defined information system components].
#### SI-2 (6) — Removal Of Previous Versions Of Software / Firmware

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization removes [Assignment: organization-defined software and firmware components] after updated versions have been installed.

---

<a id="si-3"></a>

### SI-3 — Malicious Code Protection

- **JSIG TOC page:** 283 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Information Integrity [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **SI-3a.** Employs malicious code protection mechanisms at information system entry and exit points to detect and eradicate malicious code;
  - **SI-3b.** Updates malicious code protection mechanisms whenever new releases are available in accordance with organizational configuration management policy and procedures;
  - **SI-3c.** Configures malicious code protection mechanisms to:
    - **SI-3c.1.** Perform periodic scans of the information system [Assignment: organization-defined frequency] and real-time scans of files from external sources at [Selection (one or more); endpoint; network entry/exit points] as the files are downloaded, opened, or executed in accordance with organizational security policy; and
    - **SI-3c.2.** [Selection (one or more): block malicious code; quarantine malicious code; send alert to administrator; [Assignment: organization-defined action]] in response to malicious code detection; and
  - **SI-3d.** Addresses the receipt of false positives during malicious code detection and eradication and the resulting potential impact on the availability of the information system.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SI-3 (1) — Central Management

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization centrally manages malicious code protection mechanisms.
#### SI-3 (2) — Automatic Updates

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system automatically updates malicious code protection mechanisms.
#### SI-3 (3) — Non-Privileged Users

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into AC-6 (10)].
#### SI-3 (4) — Updates Only By Privileged Users

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system updates malicious code protection mechanisms only when directed by a privileged user.
#### SI-3 (5) — Portable Storage Devices

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into MP-7].
#### SI-3 (6) — Testing / Verification

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization:
  - **SI-3 (6)(a)** Tests malicious code protection mechanisms [Assignment: organization-defined frequency] by introducing a known benign, non-spreading test case into the information system; and
  - **SI-3 (6)(b)** Verifies that both detection of the test case and associated incident reporting occur.
#### SI-3 (7) — Nonsignature-Based Detection

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system implements nonsignature-based malicious code detection mechanisms.
#### SI-3 (8) — Detect Unauthorized Commands

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system detects [Assignment: organization-defined unauthorized operating system commands] through the kernel application programming interface at [Assignment: organization-defined information system hardware components] and [Selection (one or more): issues a warning; audits the command execution; prevents the execution of the command].
#### SI-3 (9) — Authenticate Remote Commands

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system implements [Assignment: organization-defined security safeguards] to authenticate [Assignment: organization-defined remote commands].
#### SI-3 (10) — Malicious Code Analysis

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization:
  - **SI-3 (10)(a)** Employs [Assignment: organization-defined tools and techniques] to analyze the characteristics and behavior of malicious code; and
  - **SI-3 (10)(b)** Incorporates the results from malicious code analysis into organizational incident response and flaw remediation processes.

---

<a id="si-4"></a>

### SI-4 — Information System Monitoring

- **JSIG TOC page:** 285 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Information Integrity [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **SI-4a.** Monitors the information system to detect:
    - **SI-4a.1.** Attacks and indicators of potential attacks in accordance with [Assignment: organization-defined monitoring objectives]; and
    - **SI-4a.2.** Unauthorized local, network, and remote connections;
  - **SI-4b.** Identifies unauthorized use of the information system through [Assignment: organization-defined techniques and methods];
  - **SI-4c.** Deploys monitoring devices:
    - **SI-4c.1.** Strategically within the information system to collect organization-determined essential information; and
    - **SI-4c.2.** At ad hoc locations within the system to track specific types of transactions of interest to the organization;
  - **SI-4d.** Protects information obtained from intrusion-monitoring tools from unauthorized access, modification, and deletion;
  - **SI-4e.** Heightens the level of information system monitoring activity whenever there is an indication of increased risk to organizational operations and assets, individuals, other organizations, or the Nation based on law enforcement information, intelligence information, or other credible sources of information;
  - **SI-4f.** Obtains legal opinion with regard to information system monitoring activities in accordance with applicable federal laws, Executive Orders, directives, policies, or regulations; and
  - **SI-4g.** Provides [Assignment: organization-defined information system monitoring information] to [Assignment: organization-defined personnel or roles] [Selection (one or more): as needed; [Assignment: organization-defined frequency]].

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SI-4 (1) — System-Wide Intrusion Detection System

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization connects and configures individual intrusion detection tools into an information system-wide intrusion detection system.
#### SI-4 (2) — Automated Tools For Real-Time Analysis

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs automated tools to support near real-time analysis of events.
#### SI-4 (3) — Automated Tool Integration

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs automated tools to integrate intrusion detection tools into access control and flow control mechanisms for rapid response to attacks by enabling reconfiguration of these mechanisms in support of attack isolation and elimination.
#### SI-4 (4) — Inbound And Outbound Communications Traffic

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system monitors inbound and outbound communications traffic [Assignment: organization-defined frequency] for unusual or unauthorized activities or conditions.
#### SI-4 (5) — System-Generated Alerts

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system alerts [Assignment: organization-defined personnel or roles] when the following indications of compromise or potential compromise occur: [Assignment: organization-defined compromise indicators].
#### SI-4 (6) — Restrict Non-Privileged Users

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into AC-6 (10)].
#### SI-4 (7) — Automated Response To Suspicious Events

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system notifies [Assignment: organization-defined incident response personnel (identified by name and/or by role)] of detected suspicious events and takes [Assignment: organization-defined least-disruptive actions to terminate suspicious events].
#### SI-4 (8) — Protection Of Monitoring Information

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into SI-4].
#### SI-4 (9) — Testing Of Monitoring Tools

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization tests intrusion-monitoring tools [Assignment: organization-defined frequency].
#### SI-4 (10) — Visibility Of Encrypted Communications

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization makes provisions so that [Assignment: organization-defined encrypted communications traffic] is visible to [Assignment: organization-defined information system monitoring tools].
#### SI-4 (11) — Analyze Communications Traffic Anomalies

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization analyzes outbound communications traffic at the external boundary of the information system and selected [Assignment: organization-defined interior points within the system (e.g., subnetworks, subsystems)] to discover anomalies.
#### SI-4 (12) — Automated Alerts

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs automated mechanisms to alert security personnel of the following inappropriate or unusual activities with security implications: [Assignment: organization-defined activities that trigger alerts].
#### SI-4 (13) — Analyze Traffic / Event Patterns

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization:
  - **SI-4 (13)(a)** Analyzes communications traffic/event patterns for the information system;
  - **SI-4 (13)(b)** Develops profiles representing common traffic patterns and/or events; and
  - **SI-4 (13)(c)** Uses the traffic/event profiles in tuning system-monitoring devices to reduce the number of false positives and the number of false negatives.
#### SI-4 (14) — Wireless Intrusion Detection

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs a wireless intrusion detection system to identify rogue wireless devices and to detect attack attempts and potential compromises/breaches to the information system.
#### SI-4 (15) — Wireless To Wireline Communications

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs an intrusion detection system to monitor wireless communications traffic as the traffic passes from wireless to wireline networks.
#### SI-4 (16) — Correlate Monitoring Information

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization correlates information from monitoring tools employed throughout the information system.
#### SI-4 (17) — Integrated Situational Awareness

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization correlates information from monitoring physical, cyber, and supply chain activities to achieve integrated, organization-wide situational awareness.
#### SI-4 (18) — Analyze Traffic / Covert Exfiltration

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization analyzes outbound communications traffic at the external boundary of the information system (i.e., system perimeter) and at [Assignment: organization-defined interior points within the system (e.g., subsystems, subnetworks)] to detect covert exfiltration of information.
#### SI-4 (19) — Individuals Posing Greater Risk

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization implements [Assignment: organization-defined additional monitoring] of individuals who have been identified by [Assignment: organization-defined sources] as posing an increased level of risk.
#### SI-4 (20) — Privileged Users

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization implements [Assignment: organization-defined additional monitoring] of privileged users.
#### SI-4 (21) — Probationary Periods

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization implements [Assignment: organization-defined additional monitoring] of individuals during [Assignment: organization-defined probationary period].
#### SI-4 (22) — Unauthorized Network Services

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system detects network services that have not been authorized or approved by [Assignment: organization-defined authorization or approval processes] and [Selection (one or more): audits; alerts [Assignment: organization-defined personnel or roles]].
#### SI-4 (23) — Host-Based Devices

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization implements [Assignment: organization-defined host-based monitoring mechanisms] at [Assignment: organization-defined information system components].
#### SI-4 (24) — Indicators Of Compromise

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system discovers, collects, distributes, and uses indicators of compromise.

---

<a id="si-5"></a>

### SI-5 — Security Alerts, Advisories, And Directives

- **JSIG TOC page:** 290 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Information Integrity [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **SI-5a.** Receives information system security alerts, advisories, and directives from [Assignment: organization-defined external organizations] on an ongoing basis;
  - **SI-5b.** Generates internal security alerts, advisories, and directives as deemed necessary;
  - **SI-5c.** Disseminates security alerts, advisories, and directives to: [Selection (one or more): [Assignment: organization-defined personnel or roles]; [Assignment: organization-defined elements within the organization]; [Assignment: organization-defined external organizations]]; and
  - **SI-5d.** Implements security directives in accordance with established time frames, or notifies the issuing organization of the degree of noncompliance.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SI-5 (1) — Automated Alerts And Advisories

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs automated mechanisms to make security alert and advisory information available throughout the organization.

---

<a id="si-6"></a>

### SI-6 — Security Function Verification

- **JSIG TOC page:** 291 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Information Integrity [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system:
  - **SI-6a.** Verifies the correct operation of [Assignment: organization-defined security functions];
  - **SI-6b.** Performs this verification [Selection (one or more): [Assignment: organization-defined system transitional states]; upon command by user with appropriate privilege; [Assignment: organization-defined frequency]];
  - **SI-6c.** Notifies [Assignment: organization-defined personnel or roles] of failed security verification tests; and
  - **SI-6d.** [Selection (one or more): shuts the information system down; restarts the information system; [Assignment: organization-defined alternative action(s)]] when anomalies are discovered.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SI-6 (1) — Notification Of Failed Security Tests

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into SI-6].
#### SI-6 (2) — Automation Support For Distributed Testing

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system implements automated mechanisms to support the management of distributed security testing.
#### SI-6 (3) — Report Verification Results

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization reports the results of security function verification to [Assignment: organization-defined personnel or roles].

---

<a id="si-7"></a>

### SI-7 — Software, Firmware, And Information Integrity

- **JSIG TOC page:** 291 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Information Integrity [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization employs integrity verification tools to detect unauthorized changes to [Assignment: organization-defined software, firmware, and information].

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SI-7 (1) — Integrity Checks

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system performs an integrity check of [Assignment: organization-defined software, firmware, and information] [Selection (one or more): at startup; at [Assignment: organization-defined transitional states or security-relevant events]; [Assignment: organization-defined frequency]].
#### SI-7 (2) — Automated Notifications Of Integrity Violations

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs automated tools that provide notification to [Assignment: organization-defined personnel or roles] upon discovering discrepancies during integrity verification.
#### SI-7 (3) — Centrally-Managed Integrity Tools

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs centrally managed integrity verification tools.
#### SI-7 (4) — Tamper-Evident Packaging

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into SA-12].
#### SI-7 (5) — Automated Response To Integrity Violations

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system automatically [Selection (one or more): shuts the information system down; restarts the information system; implements [Assignment: organization-defined security safeguards]] when integrity violations are discovered.
#### SI-7 (6) — Cryptographic Protection

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system implements cryptographic mechanisms to detect unauthorized changes to software, firmware, and information.
#### SI-7 (7) — Integration Of Detection And Response

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization incorporates the detection of unauthorized [Assignment: organization-defined security-relevant changes to the information system] into the organizational incident response capability.
#### SI-7 (8) — Auditing Capability For Significant Events

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system, upon detection of a potential integrity violation, provides the capability to audit the event and initiates the following actions: [Selection (one or more): generates an audit record; alerts current user; alerts [Assignment: organization-defined personnel or roles]; [Assignment: organization-defined other actions]].
#### SI-7 (9) — Verify Boot Process

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system verifies the integrity of the boot process of [Assignment: organization-defined devices].
#### SI-7 (10) — Protection Of Boot Firmware

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system implements [Assignment: organization-defined security safeguards] to protect the integrity of boot firmware in [Assignment: organization-defined devices].
#### SI-7 (11) — Confined Environments With Limited Privileges

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization requires that [Assignment: organization-defined user-installed software] execute in a confined physical or virtual machine environment with limited privileges.
#### SI-7 (12) — Integrity Verification

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization requires that the integrity of [Assignment: organization-defined user-installed software] be verified prior to execution.
#### SI-7 (13) — Code Execution In Protected Environments

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization allows execution of binary or machine-executable code obtained from sources with limited or no warranty and without the provision of source code only in confined physical or virtual machine environments and with the explicit approval of [Assignment: organization-defined personnel or roles].
#### SI-7 (14) — Binary Or Machine Executable Code

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization:
  - **SI-7 (14)(a)** Prohibits the use of binary or machine-executable code from sources with limited or no warranty and without the provision of source code; and
  - **SI-7 (14)(b)** Provides exceptions to the source code requirement only for compelling mission/operational requirements and with the approval of the authorizing official.
#### SI-7 (15) — Code Authentication

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system implements cryptographic mechanisms to authenticate [Assignment: organization-defined software or firmware components] prior to installation.
#### SI-7 (16) — Time Limit On Process Execution W/O Supervision

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization does not allow processes to execute without supervision for more than [Assignment: organization-defined time period].

---

<a id="si-8"></a>

### SI-8 — Spam Protection

- **JSIG TOC page:** 294 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Information Integrity [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **SI-8a.** Employs spam protection mechanisms at information system entry and exit points to detect and take action on unsolicited messages; and
  - **SI-8b.** Updates spam protection mechanisms when new releases are available in accordance with organizational configuration management policy and procedures.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SI-8 (1) — Central Management

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization centrally manages spam protection mechanisms.
#### SI-8 (2) — Automatic Updates

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system automatically updates spam protection mechanisms.
#### SI-8 (3) — Continuous Learning Capability

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system implements spam protection mechanisms with a learning capability to more effectively identify legitimate communications traffic.

---

<a id="si-9"></a>

### SI-9 — Information Input Restrictions

- **JSIG TOC page:** 295 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Information Integrity [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- [Withdrawn: Incorporated into AC-2, AC-3, AC-5, AC-6].

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="si-10"></a>

### SI-10 — Information Input Validation

- **JSIG TOC page:** 295 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Information Integrity [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system checks the validity of [Assignment: organization-defined information inputs].

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SI-10 (1) — Manual Override Capability

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system:
  - **SI-10 (1)(a)** Provides a manual override capability for input validation of [Assignment: organization-defined inputs];
  - **SI-10 (1)(b)** Restricts the use of the manual override capability to only [Assignment: organization-defined authorized individuals]; and
  - **SI-10 (1)(c)** Audits the use of the manual override capability.
#### SI-10 (2) — Review / Resolution Of Errors

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization ensures that input validation errors are reviewed and resolved within [Assignment: organization-defined time period].
#### SI-10 (3) — Predictable Behavior

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system behaves in a predictable and documented manner that reflects organizational and system objectives when invalid inputs are received.
#### SI-10 (4) — Review / Timing Interactions

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization accounts for timing interactions among information system components in determining appropriate responses for invalid inputs.
#### SI-10 (5) — Restrict Inputs To Trusted Sources And Approved Formats

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization restricts the use of information inputs to [Assignment: organization-defined trusted sources] and/or [Assignment: organization-defined formats].

---

<a id="si-11"></a>

### SI-11 — Error Handling

- **JSIG TOC page:** 296 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Information Integrity [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system:
  - **SI-11a.** Generates error messages that provide information necessary for corrective actions without revealing information that could be exploited by adversaries; and
  - **SI-11b.** Reveals error messages only to [Assignment: organization-defined personnel or roles].

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="si-12"></a>

### SI-12 — Information Handling And Retention

- **JSIG TOC page:** 297 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Information Integrity [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization handles and retains information within the information system and information output from the system in accordance with applicable federal laws, Executive Orders, directives, policies, regulations, standards, and operational requirements.

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="si-13"></a>

### SI-13 — Predictable Failure Prevention

- **JSIG TOC page:** 297 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Information Integrity [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **SI-13a.** Determines mean time to failure (MTTF) for [Assignment: organization-defined information system components] in specific environments of operation; and
  - **SI-13b.** Provides substitute information system components and a means to exchange active and standby components at [Assignment: organization-defined MTTF substitution criteria].

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SI-13 (1) — Transferring Component Responsibilities

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization takes information system components out of service by transferring component responsibilities to substitute components no later than [Assignment: organization-defined fraction or percentage] of mean time to failure.
#### SI-13 (2) — Time Limit On Process Execution Without Supervision

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into SI-7 (16)].
#### SI-13 (3) — Manual Transfer Between Components

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization manually initiates transfers between active and standby information system components [Assignment: organization-defined frequency] if the mean time to failure exceeds [Assignment: organization-defined time period].
#### SI-13 (4) — Standby Component Installation / Notification

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization, if information system component failures are detected:
  - **SI-13 (4)(a)** Ensures that the standby components are successfully and transparently installed within [Assignment: organization-defined time period]; and
  - **SI-13 (4)(b)** [Selection (one or more): activates [Assignment: organization-defined alarm]; automatically shuts down the information system].
#### SI-13 (5) — Failover Capability

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization provides [Selection: real-time; near real-time] [Assignment: organization-defined failover capability] for the information system.

---

<a id="si-14"></a>

### SI-14 — Non-Persistence

- **JSIG TOC page:** 298 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Information Integrity [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization implements non-persistent [Assignment: organization-defined information system components and services] that are initiated in a known state and terminated [Selection (one or more): upon end of session of use; periodically at [Assignment: organization-defined frequency]].

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### SI-14 (1) — Refresh From Trusted Sources

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization ensures that software and data employed during information system component and service refreshes are obtained from [Assignment: organization-defined trusted sources].

---

<a id="si-15"></a>

### SI-15 — Information Output Filtering

- **JSIG TOC page:** 298 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Information Integrity [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system validates information output from [Assignment: organization-defined software programs and/or applications] to ensure that the information is consistent with the expected content.

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="si-16"></a>

### SI-16 — Memory Protection

- **JSIG TOC page:** 299 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Information Integrity [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system implements [Assignment: organization-defined security safeguards] to protect its memory from unauthorized code execution.

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="si-17"></a>

### SI-17 — Fail-Safe Procedures

- **JSIG TOC page:** 299 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** System And Information Integrity [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system implements [Assignment: organization-defined fail-safe procedures] when [Assignment: organization-defined failure conditions occur].

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

