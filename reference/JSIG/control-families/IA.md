# IA — Identification And Authentication

JSIG TOC start page: **143**. Control IDs, titles, and page references below were extracted from the JSIG table of contents. [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)

Requirement statements and control enhancements are populated from the official NIST SP 800-53 Rev. 4 XML control catalog; verify every organization-defined parameter against the JSIG body before using this as an authoritative compliance database. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

## Control inventory

| Control | Title | JSIG page | Baselines in NIST Rev. 4 |
|---|---|---:|---|
| [IA-1](#ia-1) | Identification And Authentication Policy And Procedures | 143 | LOW, MODERATE, HIGH |
| [IA-2](#ia-2) | Identification And Authentication (Organizational Users) | 143 | LOW, MODERATE, HIGH |
| [IA-3](#ia-3) | Device Identification And Authentication | 146 | MODERATE, HIGH |
| [IA-4](#ia-4) | Identifier Management | 147 | LOW, MODERATE, HIGH |
| [IA-5](#ia-5) | Authenticator Management | 148 | LOW, MODERATE, HIGH |
| [IA-6](#ia-6) | Authenticator Feedback | 153 | LOW, MODERATE, HIGH |
| [IA-7](#ia-7) | Cryptographic Module Authentication | 153 | LOW, MODERATE, HIGH |
| [IA-8](#ia-8) | Identification And Authentication (Non-Organizational Users) | 154 | LOW, MODERATE, HIGH |
| [IA-9](#ia-9) | Service Identification And Authentication | 155 | Not listed in NIST XML / verify |
| [IA-10](#ia-10) | Adaptive Identification And Authentication | 156 | Not listed in NIST XML / verify |
| [IA-11](#ia-11) | Re-Authentication | 156 | Not listed in NIST XML / verify |

## Controls

<a id="ia-1"></a>

### IA-1 — Identification And Authentication Policy And Procedures

- **JSIG TOC page:** 143 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Identification And Authentication [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **IA-1a.** Develops, documents, and disseminates to [Assignment: organization-defined personnel or roles]:
    - **IA-1a.1.** An identification and authentication policy that addresses purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance; and
    - **IA-1a.2.** Procedures to facilitate the implementation of the identification and authentication policy and associated identification and authentication controls; and
  - **IA-1b.** Reviews and updates the current:
    - **IA-1b.1.** Identification and authentication policy [Assignment: organization-defined frequency]; and
    - **IA-1b.2.** Identification and authentication procedures [Assignment: organization-defined frequency].

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="ia-2"></a>

### IA-2 — Identification And Authentication (Organizational Users)

- **JSIG TOC page:** 143 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Identification And Authentication [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system uniquely identifies and authenticates organizational users (or processes acting on behalf of organizational users).

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### IA-2 (1) — Network Access To Privileged Accounts

- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system implements multifactor authentication for network access to privileged accounts.
#### IA-2 (2) — Network Access To Non-Privileged Accounts

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system implements multifactor authentication for network access to non-privileged accounts.
#### IA-2 (3) — Local Access To Privileged Accounts

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system implements multifactor authentication for local access to privileged accounts.
#### IA-2 (4) — Local Access To Non-Privileged Accounts

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system implements multifactor authentication for local access to non-privileged accounts.
#### IA-2 (5) — Group Authentication

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization requires individuals to be authenticated with an individual authenticator when a group authenticator is employed.
#### IA-2 (6) — Network Access To Privileged Accounts - Separate Device

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system implements multifactor authentication for network access to privileged accounts such that one of the factors is provided by a device separate from the system gaining access and the device meets [Assignment: organization-defined strength of mechanism requirements].
#### IA-2 (7) — Network Access To Non-Privileged Accounts - Separate Device

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system implements multifactor authentication for network access to non-privileged accounts such that one of the factors is provided by a device separate from the system gaining access and the device meets [Assignment: organization-defined strength of mechanism requirements].
#### IA-2 (8) — Network Access To Privileged Accounts - Replay Resistant

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system implements replay-resistant authentication mechanisms for network access to privileged accounts.
#### IA-2 (9) — Network Access To Non-Privileged Accounts - Replay Resistant

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system implements replay-resistant authentication mechanisms for network access to non-privileged accounts.
#### IA-2 (10) — Single Sign-On

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system provides a single sign-on capability for [Assignment: organization-defined information system accounts and services].
#### IA-2 (11) — Remote Access - Separate Device

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system implements multifactor authentication for remote access to privileged and non-privileged accounts such that one of the factors is provided by a device separate from the system gaining access and the device meets [Assignment: organization-defined strength of mechanism requirements].
#### IA-2 (12) — Acceptance Of Piv Credentials

- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system accepts and electronically verifies Personal Identity Verification (PIV) credentials.
#### IA-2 (13) — Out-Of-Band Authentication

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system implements [Assignment: organization-defined out-of-band authentication] under [Assignment: organization-defined conditions].

---

<a id="ia-3"></a>

### IA-3 — Device Identification And Authentication

- **JSIG TOC page:** 146 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Identification And Authentication [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system uniquely identifies and authenticates [Assignment: organization-defined specific and/or types of devices] before establishing a [Selection (one or more): local; remote; network] connection.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### IA-3 (1) — Cryptographic Bidirectional Authentication

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system authenticates [Assignment: organization-defined specific devices and/or types of devices] before establishing [Selection (one or more): local; remote; network] connection using bidirectional authentication that is cryptographically based.
#### IA-3 (2) — Cryptographic Bidirectional Network Authentication

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into IA-3 (1)].
#### IA-3 (3) — Dynamic Address Allocation

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization:
  - **IA-3 (3)(a)** Standardizes dynamic address allocation lease information and the lease duration assigned to devices in accordance with [Assignment: organization-defined lease information and lease duration]; and
  - **IA-3 (3)(b)** Audits lease information when assigned to a device.
#### IA-3 (4) — Device Attestation

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization ensures that device identification and authentication based on attestation is handled by [Assignment: organization-defined configuration management process].

---

<a id="ia-4"></a>

### IA-4 — Identifier Management

- **JSIG TOC page:** 147 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Identification And Authentication [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization manages information system identifiers by:
  - **IA-4a.** Receiving authorization from [Assignment: organization-defined personnel or roles] to assign an individual, group, role, or device identifier;
  - **IA-4b.** Selecting an identifier that identifies an individual, group, role, or device;
  - **IA-4c.** Assigning the identifier to the intended individual, group, role, or device;
  - **IA-4d.** Preventing reuse of identifiers for [Assignment: organization-defined time period]; and
  - **IA-4e.** Disabling the identifier after [Assignment: organization-defined time period of inactivity].

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### IA-4 (1) — Prohibit Account Identifiers As Public Identifiers

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization prohibits the use of information system account identifiers that are the same as public identifiers for individual electronic mail accounts.
#### IA-4 (2) — Supervisor Authorization

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization requires that the registration process to receive an individual identifier includes supervisor authorization.
#### IA-4 (3) — Multiple Forms Of Certification

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization requires multiple forms of certification of individual identification be presented to the registration authority.
#### IA-4 (4) — Identify User Status

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization manages individual identifiers by uniquely identifying each individual as [Assignment: organization-defined characteristic identifying individual status].
#### IA-4 (5) — Dynamic Management

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system dynamically manages identifiers.
#### IA-4 (6) — Cross-Organization Management

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization coordinates with [Assignment: organization-defined external organizations] for cross-organization management of identifiers.
#### IA-4 (7) — In-Person Registration

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization requires that the registration process to receive an individual identifier be conducted in person before a designated registration authority.

---

<a id="ia-5"></a>

### IA-5 — Authenticator Management

- **JSIG TOC page:** 148 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Identification And Authentication [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization manages information system authenticators by:
  - **IA-5a.** Verifying, as part of the initial authenticator distribution, the identity of the individual, group, role, or device receiving the authenticator;
  - **IA-5b.** Establishing initial authenticator content for authenticators defined by the organization;
  - **IA-5c.** Ensuring that authenticators have sufficient strength of mechanism for their intended use;
  - **IA-5d.** Establishing and implementing administrative procedures for initial authenticator distribution, for lost/compromised or damaged authenticators, and for revoking authenticators;
  - **IA-5e.** Changing default content of authenticators prior to information system installation;
  - **IA-5f.** Establishing minimum and maximum lifetime restrictions and reuse conditions for authenticators;
  - **IA-5g.** Changing/refreshing authenticators [Assignment: organization-defined time period by authenticator type];
  - **IA-5h.** Protecting authenticator content from unauthorized disclosure and modification;
  - **IA-5i.** Requiring individuals to take, and having devices implement, specific security safeguards to protect authenticators; and
  - **IA-5j.** Changing authenticators for group/role accounts when membership to those accounts changes.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### IA-5 (1) — Password-Based Authentication

- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system, for password-based authentication:
  - **IA-5 (1)(a)** Enforces minimum password complexity of [Assignment: organization-defined requirements for case sensitivity, number of characters, mix of upper-case letters, lower-case letters, numbers, and special characters, including minimum requirements for each type];
  - **IA-5 (1)(b)** Enforces at least the following number of changed characters when new passwords are created: [Assignment: organization-defined number];
  - **IA-5 (1)(c)** Stores and transmits only cryptographically-protected passwords;
  - **IA-5 (1)(d)** Enforces password minimum and maximum lifetime restrictions of [Assignment: organization-defined numbers for lifetime minimum, lifetime maximum];
  - **IA-5 (1)(e)** Prohibits password reuse for [Assignment: organization-defined number] generations; and
  - **IA-5 (1)(f)** Allows the use of a temporary password for system logons with an immediate change to a permanent password.
#### IA-5 (2) — Pki-Based Authentication

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system, for PKI-based authentication:
  - **IA-5 (2)(a)** Validates certifications by constructing and verifying a certification path to an accepted trust anchor including checking certificate status information;
  - **IA-5 (2)(b)** Enforces authorized access to the corresponding private key;
  - **IA-5 (2)(c)** Maps the authenticated identity to the account of the individual or group; and
  - **IA-5 (2)(d)** Implements a local cache of revocation data to support path discovery and validation in case of inability to access revocation information via the network.
#### IA-5 (3) — In-Person Or Trusted Third-Party Registration

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization requires that the registration process to receive [Assignment: organization-defined types of and/or specific authenticators] be conducted [Selection: in person; by a trusted third party] before [Assignment: organization-defined registration authority] with authorization by [Assignment: organization-defined personnel or roles].
#### IA-5 (4) — Automated Support For Password Strength Determination

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs automated tools to determine if password authenticators are sufficiently strong to satisfy [Assignment: organization-defined requirements].
#### IA-5 (5) — Change Authenticators Prior To Delivery

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization requires developers/installers of information system components to provide unique authenticators or change default authenticators prior to delivery/installation.
#### IA-5 (6) — Protection Of Authenticators

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization protects authenticators commensurate with the security category of the information to which use of the authenticator permits access.
#### IA-5 (7) — No Embedded Unencrypted Static Authenticators

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization ensures that unencrypted static authenticators are not embedded in applications or access scripts or stored on function keys.
#### IA-5 (8) — Multiple Information System Accounts

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization implements [Assignment: organization-defined security safeguards] to manage the risk of compromise due to individuals having accounts on multiple information systems.
#### IA-5 (9) — Cross-Organization Credential Management

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization coordinates with [Assignment: organization-defined external organizations] for cross-organization management of credentials.
#### IA-5 (10) — Dynamic Credential Association

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system dynamically provisions identities.
#### IA-5 (11) — Hardware Token-Based Authentication

- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system, for hardware token-based authentication, employs mechanisms that satisfy [Assignment: organization-defined token quality requirements].
#### IA-5 (12) — Biometric-Based Authentication

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system, for biometric-based authentication, employs mechanisms that satisfy [Assignment: organization-defined biometric quality requirements].
#### IA-5 (13) — Expiration Of Cached Authenticators

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system prohibits the use of cached authenticators after [Assignment: organization-defined time period].
#### IA-5 (14) — Managing Content Of Pki Trust Stores

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization, for PKI-based authentication, employs a deliberate organization-wide methodology for managing the content of PKI trust stores installed across all platforms including networks, operating systems, browsers, and applications.
#### IA-5 (15) — Ficam-Approved Products And Services

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization uses only FICAM-approved path discovery and validation products and services.

---

<a id="ia-6"></a>

### IA-6 — Authenticator Feedback

- **JSIG TOC page:** 153 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Identification And Authentication [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system obscures feedback of authentication information during the authentication process to protect the information from possible exploitation/use by unauthorized individuals.

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="ia-7"></a>

### IA-7 — Cryptographic Module Authentication

- **JSIG TOC page:** 153 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Identification And Authentication [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system implements mechanisms for authentication to a cryptographic module that meet the requirements of applicable federal laws, Executive Orders, directives, policies, regulations, standards, and guidance for such authentication.

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="ia-8"></a>

### IA-8 — Identification And Authentication (Non-Organizational Users)

- **JSIG TOC page:** 154 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Identification And Authentication [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system uniquely identifies and authenticates non-organizational users (or processes acting on behalf of non-organizational users).

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### IA-8 (1) — Acceptance Of Piv Credentials From Other Agencies

- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system accepts and electronically verifies Personal Identity Verification (PIV) credentials from other federal agencies.
#### IA-8 (2) — Acceptance Of Third-Party Credentials

- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system accepts only FICAM-approved third-party credentials.
#### IA-8 (3) — Use Of Ficam-Approved Products

- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs only FICAM-approved information system components in [Assignment: organization-defined information systems] to accept third-party credentials.
#### IA-8 (4) — Use Of Ficam-Issued Profiles

- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system conforms to FICAM-issued profiles.
#### IA-8 (5) — Acceptance Of Piv-I Credentials

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system accepts and electronically verifies Personal Identity Verification-I (PIV-I) credentials.

---

<a id="ia-9"></a>

### IA-9 — Service Identification And Authentication

- **JSIG TOC page:** 155 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Identification And Authentication [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization identifies and authenticates [Assignment: organization-defined information system services] using [Assignment: organization-defined security safeguards].

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### IA-9 (1) — Information Exchange

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization ensures that service providers receive, validate, and transmit identification and authentication information.
#### IA-9 (2) — Transmission Of Decisions

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization ensures that identification and authentication decisions are transmitted between [Assignment: organization-defined services] consistent with organizational policies.

---

<a id="ia-10"></a>

### IA-10 — Adaptive Identification And Authentication

- **JSIG TOC page:** 156 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Identification And Authentication [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization requires that individuals accessing the information system employ [Assignment: organization-defined supplemental authentication techniques or mechanisms] under specific [Assignment: organization-defined circumstances or situations].

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="ia-11"></a>

### IA-11 — Re-Authentication

- **JSIG TOC page:** 156 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Identification And Authentication [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization requires users and devices to re-authenticate when [Assignment: organization-defined circumstances or situations requiring re-authentication].

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

