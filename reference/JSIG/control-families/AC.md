# AC — Access Control

JSIG TOC start page: **43**. Control IDs, titles, and page references below were extracted from the JSIG table of contents. [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)

Requirement statements and control enhancements are populated from the official NIST SP 800-53 Rev. 4 XML control catalog; verify every organization-defined parameter against the JSIG body before using this as an authoritative compliance database. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

## JSIG-specific extraction notes

The available JSIG snippets confirm that DoD SAP-specific policy and procedures related to access control are defined in the remainder of the AC family and that AC-2 contains SAP organization-defined parameter values. [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)

## Control inventory

| Control | Title | JSIG page | Baselines in NIST Rev. 4 |
|---|---|---:|---|
| [AC-1](#ac-1) | Access Control Policy And Procedures | 43 | LOW, MODERATE, HIGH |
| [AC-2](#ac-2) | Account Management | 43 | LOW, MODERATE, HIGH |
| [AC-3](#ac-3) | Access Enforcement | 48 | LOW, MODERATE, HIGH |
| [AC-4](#ac-4) | Information Flow Enforcement | 51 | MODERATE, HIGH |
| [AC-5](#ac-5) | Separation Of Duties | 58 | MODERATE, HIGH |
| [AC-6](#ac-6) | Least Privilege | 59 | MODERATE, HIGH |
| [AC-7](#ac-7) | Unsuccessful Logon Attempts | 61 | LOW, MODERATE, HIGH |
| [AC-8](#ac-8) | System Use Notification | 62 | LOW, MODERATE, HIGH |
| [AC-9](#ac-9) | Previous Logon (Access) Notification | 63 | Not listed in NIST XML / verify |
| [AC-10](#ac-10) | Concurrent Session Control | 63 | HIGH |
| [AC-11](#ac-11) | Session Lock | 64 | MODERATE, HIGH |
| [AC-12](#ac-12) | Session Termination | 64 | MODERATE, HIGH |
| [AC-13](#ac-13) | Supervision And Review — Access Control | 65 | Not listed in NIST XML / verify |
| [AC-14](#ac-14) | Permitted Actions Without Identification Or Authentication | 65 | LOW, MODERATE, HIGH |
| [AC-15](#ac-15) | Automated Marking | 66 | Not listed in NIST XML / verify |
| [AC-16](#ac-16) | Security Attributes | 66 | Not listed in NIST XML / verify |
| [AC-17](#ac-17) | Remote Access | 69 | LOW, MODERATE, HIGH |
| [AC-18](#ac-18) | Wireless Access | 70 | LOW, MODERATE, HIGH |
| [AC-19](#ac-19) | Access Control For Mobile Devices | 71 | LOW, MODERATE, HIGH |
| [AC-20](#ac-20) | Use Of External Information Systems | 73 | LOW, MODERATE, HIGH |
| [AC-21](#ac-21) | Information Sharing | 75 | MODERATE, HIGH |
| [AC-22](#ac-22) | Publicly Accessible Content | 76 | LOW, MODERATE, HIGH |
| [AC-23](#ac-23) | Data Mining Protection | 77 | Not listed in NIST XML / verify |
| [AC-24](#ac-24) | Access Control Decisions | 77 | Not listed in NIST XML / verify |
| [AC-25](#ac-25) | Reference Monitor | 78 | Not listed in NIST XML / verify |

## Controls

<a id="ac-1"></a>

### AC-1 — Access Control Policy And Procedures

- **JSIG TOC page:** 43 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Access Control [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **AC-1a.** Develops, documents, and disseminates to [Assignment: organization-defined personnel or roles]:
    - **AC-1a.1.** An access control policy that addresses purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance; and
    - **AC-1a.2.** Procedures to facilitate the implementation of the access control policy and associated access controls; and
  - **AC-1b.** Reviews and updates the current:
    - **AC-1b.1.** Access control policy [Assignment: organization-defined frequency]; and
    - **AC-1b.2.** Access control procedures [Assignment: organization-defined frequency].

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="ac-2"></a>

### AC-2 — Account Management

- **JSIG TOC page:** 43 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Access Control [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **AC-2a.** Identifies and selects the following types of information system accounts to support organizational missions/business functions: [Assignment: organization-defined information system account types];
  - **AC-2b.** Assigns account managers for information system accounts;
  - **AC-2c.** Establishes conditions for group and role membership;
  - **AC-2d.** Specifies authorized users of the information system, group and role membership, and access authorizations (i.e., privileges) and other attributes (as required) for each account;
  - **AC-2e.** Requires approvals by [Assignment: organization-defined personnel or roles] for requests to create information system accounts;
  - **AC-2f.** Creates, enables, modifies, disables, and removes information system accounts in accordance with [Assignment: organization-defined procedures or conditions];
  - **AC-2g.** Monitors the use of information system accounts;
  - **AC-2h.** Notifies account managers:
    - **AC-2h.1.** When accounts are no longer required;
    - **AC-2h.2.** When users are terminated or transferred; and
    - **AC-2h.3.** When individual information system usage or need-to-know changes;
  - **AC-2i.** Authorizes access to the information system based on:
    - **AC-2i.1.** A valid access authorization;
    - **AC-2i.2.** Intended system usage; and
    - **AC-2i.3.** Other attributes as required by the organization or associated missions/business functions;
  - **AC-2j.** Reviews accounts for compliance with account management requirements [Assignment: organization-defined frequency]; and
  - **AC-2k.** Establishes a process for reissuing shared/group account credentials (if deployed) when individuals are removed from the group.

**Known JSIG-specific notes extracted:**

- Extracted JSIG ODPs/supplemental text: account types are "as defined by the service or program"; account creation approvals are by the "ISO or designee"; account creation/enabling/modification/disabling/removal is performed in accordance with "the service or program policy"; account reviews occur "at least annually"; temporary and emergency accounts are disabled after "not to exceed 72 hours"; inactive accounts are disabled after "not to exceed ninety (90) days"; users are required to log out when the work day has ended or there is an extended absence of more than six hours. [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### AC-2 (1) — Automated System Account Management

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs automated mechanisms to support the management of information system accounts.
#### AC-2 (2) — Removal Of Temporary / Emergency Accounts

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system automatically [Selection: removes; disables] temporary and emergency accounts after [Assignment: organization-defined time period for each type of account].
#### AC-2 (3) — Disable Inactive Accounts

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system automatically disables inactive accounts after [Assignment: organization-defined time period].
#### AC-2 (4) — Automated Audit Actions

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system automatically audits account creation, modification, enabling, disabling, and removal actions, and notifies [Assignment: organization-defined personnel or roles].
#### AC-2 (5) — Inactivity Logout

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization requires that users log out when [Assignment: organization-defined time-period of expected inactivity or description of when to log out].
#### AC-2 (6) — Dynamic Privilege Management

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system implements the following dynamic privilege management capabilities: [Assignment: organization-defined list of dynamic privilege management capabilities].
#### AC-2 (7) — Role-Based Schemes

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization:
  - **AC-2 (7)(a)** Establishes and administers privileged user accounts in accordance with a role-based access scheme that organizes allowed information system access and privileges into roles;
  - **AC-2 (7)(b)** Monitors privileged role assignments; and
  - **AC-2 (7)(c)** Takes [Assignment: organization-defined actions] when privileged role assignments are no longer appropriate.
#### AC-2 (8) — Dynamic Account Creation

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system creates [Assignment: organization-defined information system accounts] dynamically.
#### AC-2 (9) — Restrictions On Use Of Shared / Group Accounts

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization only permits the use of shared/group accounts that meet [Assignment: organization-defined conditions for establishing shared/group accounts].
#### AC-2 (10) — Shared / Group Account Credential Termination

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system terminates shared/group account credentials when members leave the group.
#### AC-2 (11) — Usage Conditions

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system enforces [Assignment: organization-defined circumstances and/or usage conditions] for [Assignment: organization-defined information system accounts].
#### AC-2 (12) — Account Monitoring / Atypical Usage

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization:
  - **AC-2 (12)(a)** Monitors information system accounts for [Assignment: organization-defined atypical usage]; and
  - **AC-2 (12)(b)** Reports atypical usage of information system accounts to [Assignment: organization-defined personnel or roles].
#### AC-2 (13) — Disable Accounts For High-Risk Individuals

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization disables accounts of users posing a significant risk within [Assignment: organization-defined time period] of discovery of the risk.

---

<a id="ac-3"></a>

### AC-3 — Access Enforcement

- **JSIG TOC page:** 48 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Access Control [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system enforces approved authorizations for logical access to information and system resources in accordance with applicable access control policies.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### AC-3 (1) — Restricted Access To Privileged Functions

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into AC-6].
#### AC-3 (2) — Dual Authorization

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system enforces dual authorization for [Assignment: organization-defined privileged commands and/or other organization-defined actions].
#### AC-3 (3) — Mandatory Access Control

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system enforces [Assignment: organization-defined mandatory access control policy] over all subjects and objects where the policy:
  - **AC-3 (3)(a)** Is uniformly enforced across all subjects and objects within the boundary of the information system;
  - **AC-3 (3)(b)** Specifies that a subject that has been granted access to information is constrained from doing any of the following;
    - **AC-3 (3)(b)(1)** Passing the information to unauthorized subjects or objects;
    - **AC-3 (3)(b)(2)** Granting its privileges to other subjects;
    - **AC-3 (3)(b)(3)** Changing one or more security attributes on subjects, objects, the information system, or information system components;
    - **AC-3 (3)(b)(4)** Choosing the security attributes and attribute values to be associated with newly created or modified objects; or
    - **AC-3 (3)(b)(5)** Changing the rules governing access control; and
  - **AC-3 (3)(c)** Specifies that [Assignment: organization-defined subjects] may explicitly be granted [Assignment: organization-defined privileges (i.e., they are trusted subjects)] such that they are not limited by some or all of the above constraints.
#### AC-3 (4) — Discretionary Access Control

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system enforces [Assignment: organization-defined discretionary access control policy] over defined subjects and objects where the policy specifies that a subject that has been granted access to information can do one or more of the following:
  - **AC-3 (4)(a)** Pass the information to any other subjects or objects;
  - **AC-3 (4)(b)** Grant its privileges to other subjects;
  - **AC-3 (4)(c)** Change security attributes on subjects, objects, the information system, or the information system's components;
  - **AC-3 (4)(d)** Choose the security attributes to be associated with newly created or revised objects; or
  - **AC-3 (4)(e)** Change the rules governing access control.
#### AC-3 (5) — Security-Relevant Information

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system prevents access to [Assignment: organization-defined security-relevant information] except during secure, non-operable system states.
#### AC-3 (6) — Protection Of User And System Information

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into MP-4 and SC-28].
#### AC-3 (7) — Role-Based Access Control

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system enforces a role-based access control policy over defined subjects and objects and controls access based upon [Assignment: organization-defined roles and users authorized to assume such roles].
#### AC-3 (8) — Revocation Of Access Authorizations

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system enforces the revocation of access authorizations resulting from changes to the security attributes of subjects and objects based on [Assignment: organization-defined rules governing the timing of revocations of access authorizations].
#### AC-3 (9) — Controlled Release

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system does not release information outside of the established system boundary unless:
  - **AC-3 (9)(a)** The receiving [Assignment: organization-defined information system or system component] provides [Assignment: organization-defined security safeguards]; and
  - **AC-3 (9)(b)** [Assignment: organization-defined security safeguards] are used to validate the appropriateness of the information designated for release.
#### AC-3 (10) — Audited Override Of Access Control Mechanisms

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs an audited override of automated access control mechanisms under [Assignment: organization-defined conditions].

---

<a id="ac-4"></a>

### AC-4 — Information Flow Enforcement

- **JSIG TOC page:** 51 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Access Control [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system enforces approved authorizations for controlling the flow of information within the system and between interconnected systems based on [Assignment: organization-defined information flow control policies].

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### AC-4 (1) — Object Security Attributes

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system uses [Assignment: organization-defined security attributes] associated with [Assignment: organization-defined information, source, and destination objects] to enforce [Assignment: organization-defined information flow control policies] as a basis for flow control decisions.
#### AC-4 (2) — Processing Domains

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system uses protected processing domains to enforce [Assignment: organization-defined information flow control policies] as a basis for flow control decisions.
#### AC-4 (3) — Dynamic Information Flow Control

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system enforces dynamic information flow control based on [Assignment: organization-defined policies].
#### AC-4 (4) — Content Check Encrypted Information

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system prevents encrypted information from bypassing content-checking mechanisms by [Selection (one or more): decrypting the information; blocking the flow of the encrypted information; terminating communications sessions attempting to pass encrypted information; [Assignment: organization-defined procedure or method]].
#### AC-4 (5) — Embedded Data Types

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system enforces [Assignment: organization-defined limitations] on embedding data types within other data types.
#### AC-4 (6) — Metadata

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system enforces information flow control based on [Assignment: organization-defined metadata].
#### AC-4 (7) — One-Way Flow Mechanisms

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system enforces [Assignment: organization-defined one-way information flows] using hardware mechanisms.
#### AC-4 (8) — Security Policy Filters

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system enforces information flow control using [Assignment: organization-defined security policy filters] as a basis for flow control decisions for [Assignment: organization-defined information flows].
#### AC-4 (9) — Human Reviews

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system enforces the use of human reviews for [Assignment: organization-defined information flows] under the following conditions: [Assignment: organization-defined conditions].
#### AC-4 (10) — Enable / Disable Security Policy Filters

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system provides the capability for privileged administrators to enable/disable [Assignment: organization-defined security policy filters] under the following conditions: [Assignment: organization-defined conditions].
#### AC-4 (11) — Configuration Of Security Policy Filters

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system provides the capability for privileged administrators to configure [Assignment: organization-defined security policy filters] to support different security policies.
#### AC-4 (12) — Data Type Identifiers

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system, when transferring information between different security domains, uses [Assignment: organization-defined data type identifiers] to validate data essential for information flow decisions.
#### AC-4 (13) — Decomposition Into Policy-Relevant Subcomponents

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system, when transferring information between different security domains, decomposes information into [Assignment: organization-defined policy-relevant subcomponents] for submission to policy enforcement mechanisms.
#### AC-4 (14) — Security Policy Filter Constraints

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system, when transferring information between different security domains, implements [Assignment: organization-defined security policy filters] requiring fully enumerated formats that restrict data structure and content.
#### AC-4 (15) — Detection Of Unsanctioned Information

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system, when transferring information between different security domains, examines the information for the presence of [Assignment: organized-defined unsanctioned information] and prohibits the transfer of such information in accordance with the [Assignment: organization-defined security policy].
#### AC-4 (16) — Information Transfers On Interconnected Systems

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into AC-4].
#### AC-4 (17) — Domain Authentication

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system uniquely identifies and authenticates source and destination points by [Selection (one or more): organization, system, application, individual] for information transfer.
#### AC-4 (18) — Security Attribute Binding

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system binds security attributes to information using [Assignment: organization-defined binding techniques] to facilitate information flow policy enforcement.
#### AC-4 (19) — Validation Of Metadata

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system, when transferring information between different security domains, applies the same security policy filtering to metadata as it applies to data payloads.
#### AC-4 (20) — Approved Solutions

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs [Assignment: organization-defined solutions in approved configurations] to control the flow of [Assignment: organization-defined information] across security domains.
#### AC-4 (21) — Physical / Logical Separation Of Information Flows

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system separates information flows logically or physically using [Assignment: organization-defined mechanisms and/or techniques] to accomplish [Assignment: organization-defined required separations by types of information].
#### AC-4 (22) — Access Only

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system provides access from a single device to computing platforms, applications, or data residing on multiple different security domains, while preventing any information flow between the different security domains.

---

<a id="ac-5"></a>

### AC-5 — Separation Of Duties

- **JSIG TOC page:** 58 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Access Control [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **AC-5a.** Separates [Assignment: organization-defined duties of individuals];
  - **AC-5b.** Documents separation of duties of individuals; and
  - **AC-5c.** Defines information system access authorizations to support separation of duties.

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="ac-6"></a>

### AC-6 — Least Privilege

- **JSIG TOC page:** 59 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Access Control [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization employs the principle of least privilege, allowing only authorized accesses for users (or processes acting on behalf of users) which are necessary to accomplish assigned tasks in accordance with organizational missions and business functions.

**Known JSIG-specific notes extracted:**

- Non-tailorable JSIG note: AC-6(1), Least Privilege | Authorize Access to Security Functions, states that system endpoint protection shall not be tailored out; waiver authority rests with the Component SAP Senior Authorizing Official and cannot be further delegated. [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### AC-6 (1) — Authorize Access To Security Functions

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization explicitly authorizes access to [Assignment: organization-defined security functions (deployed in hardware, software, and firmware) and security-relevant information].
#### AC-6 (2) — Non-Privileged Access For Nonsecurity Functions

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization requires that users of information system accounts, or roles, with access to [Assignment: organization-defined security functions or security-relevant information], use non-privileged accounts or roles, when accessing nonsecurity functions.
#### AC-6 (3) — Network Access To Privileged Commands

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization authorizes network access to [Assignment: organization-defined privileged commands] only for [Assignment: organization-defined compelling operational needs] and documents the rationale for such access in the security plan for the information system.
#### AC-6 (4) — Separate Processing Domains

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system provides separate processing domains to enable finer-grained allocation of user privileges.
#### AC-6 (5) — Privileged Accounts

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization restricts privileged accounts on the information system to [Assignment: organization-defined personnel or roles].
#### AC-6 (6) — Privileged Access By Non-Organizational Users

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization prohibits privileged access to the information system by non-organizational users.
#### AC-6 (7) — Review Of User Privileges

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization:
  - **AC-6 (7)(a)** Reviews [Assignment: organization-defined frequency] the privileges assigned to [Assignment: organization-defined roles or classes of users] to validate the need for such privileges; and
  - **AC-6 (7)(b)** Reassigns or removes privileges, if necessary, to correctly reflect organizational mission/business needs.
#### AC-6 (8) — Privilege Levels For Code Execution

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system prevents [Assignment: organization-defined software] from executing at higher privilege levels than users executing the software.
#### AC-6 (9) — Auditing Use Of Privileged Functions

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system audits the execution of privileged functions.
#### AC-6 (10) — Prohibit Non-Privileged Users From Executing Privileged Functions

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system prevents non-privileged users from executing privileged functions to include disabling, circumventing, or altering implemented security safeguards/countermeasures.

---

<a id="ac-7"></a>

### AC-7 — Unsuccessful Logon Attempts

- **JSIG TOC page:** 61 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Access Control [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system:
  - **AC-7a.** Enforces a limit of [Assignment: organization-defined number] consecutive invalid logon attempts by a user during a [Assignment: organization-defined time period]; and
  - **AC-7b.** Automatically [Selection: locks the account/node for an [Assignment: organization-defined time period]; locks the account/node until released by an administrator; delays next logon prompt according to [Assignment: organization-defined delay algorithm]] when the maximum number of unsuccessful attempts is exceeded.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### AC-7 (1) — Automatic Account Lock

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into AC-7].
#### AC-7 (2) — Purge / Wipe Mobile Device

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system purges/wipes information from [Assignment: organization-defined mobile devices] based on [Assignment: organization-defined purging/wiping requirements/techniques] after [Assignment: organization-defined number] consecutive, unsuccessful device logon attempts.

---

<a id="ac-8"></a>

### AC-8 — System Use Notification

- **JSIG TOC page:** 62 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Access Control [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system:
  - **AC-8a.** Displays to users [Assignment: organization-defined system use notification message or banner] before granting access to the system that provides privacy and security notices consistent with applicable federal laws, Executive Orders, directives, policies, regulations, standards, and guidance and states that:
    - **AC-8a.1.** Users are accessing a U.S. Government information system;
    - **AC-8a.2.** Information system usage may be monitored, recorded, and subject to audit;
    - **AC-8a.3.** Unauthorized use of the information system is prohibited and subject to criminal and civil penalties; and
    - **AC-8a.4.** Use of the information system indicates consent to monitoring and recording;
  - **AC-8b.** Retains the notification message or banner on the screen until users acknowledge the usage conditions and take explicit actions to log on to or further access the information system; and
  - **AC-8c.** For publicly accessible systems:
    - **AC-8c.1.** Displays system use information [Assignment: organization-defined conditions], before granting further access;
    - **AC-8c.2.** Displays references, if any, to monitoring, recording, or auditing that are consistent with privacy accommodations for such systems that generally prohibit those activities; and
    - **AC-8c.3.** Includes a description of the authorized uses of the system.

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="ac-9"></a>

### AC-9 — Previous Logon (Access) Notification

- **JSIG TOC page:** 63 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Access Control [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system notifies the user, upon successful logon (access) to the system, of the date and time of the last logon (access).

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### AC-9 (1) — Unsuccessful Logons

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system notifies the user, upon successful logon/access, of the number of unsuccessful logon/access attempts since the last successful logon/access.
#### AC-9 (2) — Successful / Unsuccessful Logons

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system notifies the user of the number of [Selection: successful logons/accesses; unsuccessful logon/access attempts; both] during [Assignment: organization-defined time period].
#### AC-9 (3) — Notification Of Account Changes

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system notifies the user of changes to [Assignment: organization-defined security-related characteristics/parameters of the user's account] during [Assignment: organization-defined time period].
#### AC-9 (4) — Additional Logon Information

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system notifies the user, upon successful logon (access), of the following additional information: [Assignment: organization-defined information to be included in addition to the date and time of the last logon (access)].

---

<a id="ac-10"></a>

### AC-10 — Concurrent Session Control

- **JSIG TOC page:** 63 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Access Control [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system limits the number of concurrent sessions for each [Assignment: organization-defined account and/or account type] to [Assignment: organization-defined number].

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="ac-11"></a>

### AC-11 — Session Lock

- **JSIG TOC page:** 64 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Access Control [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system:
  - **AC-11a.** Prevents further access to the system by initiating a session lock after [Assignment: organization-defined time period] of inactivity or upon receiving a request from a user; and
  - **AC-11b.** Retains the session lock until the user reestablishes access using established identification and authentication procedures.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### AC-11 (1) — Pattern-Hiding Displays

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system conceals, via the session lock, information previously visible on the display with a publicly viewable image.

---

<a id="ac-12"></a>

### AC-12 — Session Termination

- **JSIG TOC page:** 64 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Access Control [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system automatically terminates a user session after [Assignment: organization-defined conditions or trigger events requiring session disconnect].

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### AC-12 (1) — User-Initiated Logouts / Message Displays

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system:
  - **AC-12 (1)(a)** Provides a logout capability for user-initiated communications sessions whenever authentication is used to gain access to [Assignment: organization-defined information resources]; and
  - **AC-12 (1)(b)** Displays an explicit logout message to users indicating the reliable termination of authenticated communications sessions.

---

<a id="ac-13"></a>

### AC-13 — Supervision And Review — Access Control

- **JSIG TOC page:** 65 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Access Control [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- [Withdrawn: Incorporated into AC-2 and AU-6].

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="ac-14"></a>

### AC-14 — Permitted Actions Without Identification Or Authentication

- **JSIG TOC page:** 65 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Access Control [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **AC-14a.** Identifies [Assignment: organization-defined user actions] that can be performed on the information system without identification or authentication consistent with organizational missions/business functions; and
  - **AC-14b.** Documents and provides supporting rationale in the security plan for the information system, user actions not requiring identification or authentication.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### AC-14 (1) — Necessary Uses

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into AC-14].

---

<a id="ac-15"></a>

### AC-15 — Automated Marking

- **JSIG TOC page:** 66 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Access Control [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- [Withdrawn: Incorporated into MP-3].

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="ac-16"></a>

### AC-16 — Security Attributes

- **JSIG TOC page:** 66 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Access Control [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **AC-16a.** Provides the means to associate [Assignment: organization-defined types of security attributes] having [Assignment: organization-defined security attribute values] with information in storage, in process, and/or in transmission;
  - **AC-16b.** Ensures that the security attribute associations are made and retained with the information;
  - **AC-16c.** Establishes the permitted [Assignment: organization-defined security attributes] for [Assignment: organization-defined information systems]; and
  - **AC-16d.** Determines the permitted [Assignment: organization-defined values or ranges] for each of the established security attributes.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### AC-16 (1) — Dynamic Attribute Association

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system dynamically associates security attributes with [Assignment: organization-defined subjects and objects] in accordance with [Assignment: organization-defined security policies] as information is created and combined.
#### AC-16 (2) — Attribute Value Changes By Authorized Individuals

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system provides authorized individuals (or processes acting on behalf of individuals) the capability to define or change the value of associated security attributes.
#### AC-16 (3) — Maintenance Of Attribute Associations By Information System

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system maintains the association and integrity of [Assignment: organization-defined security attributes] to [Assignment: organization-defined subjects and objects].
#### AC-16 (4) — Association Of Attributes By Authorized Individuals

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system supports the association of [Assignment: organization-defined security attributes] with [Assignment: organization-defined subjects and objects] by authorized individuals (or processes acting on behalf of individuals).
#### AC-16 (5) — Attribute Displays For Output Devices

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system displays security attributes in human-readable form on each object that the system transmits to output devices to identify [Assignment: organization-identified special dissemination, handling, or distribution instructions] using [Assignment: organization-identified human-readable, standard naming conventions].
#### AC-16 (6) — Maintenance Of Attribute Association By Organization

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization allows personnel to associate, and maintain the association of [Assignment: organization-defined security attributes] with [Assignment: organization-defined subjects and objects] in accordance with [Assignment: organization-defined security policies].
#### AC-16 (7) — Consistent Attribute Interpretation

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization provides a consistent interpretation of security attributes transmitted between distributed information system components.
#### AC-16 (8) — Association Techniques / Technologies

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system implements [Assignment: organization-defined techniques or technologies] with [Assignment: organization-defined level of assurance] in associating security attributes to information.
#### AC-16 (9) — Attribute Reassignment

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization ensures that security attributes associated with information are reassigned only via re-grading mechanisms validated using [Assignment: organization-defined techniques or procedures].
#### AC-16 (10) — Attribute Configuration By Authorized Individuals

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system provides authorized individuals the capability to define or change the type and value of security attributes available for association with subjects and objects.

---

<a id="ac-17"></a>

### AC-17 — Remote Access

- **JSIG TOC page:** 69 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Access Control [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **AC-17a.** Establishes and documents usage restrictions, configuration/connection requirements, and implementation guidance for each type of remote access allowed; and
  - **AC-17b.** Authorizes remote access to the information system prior to allowing such connections.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### AC-17 (1) — Automated Monitoring / Control

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system monitors and controls remote access methods.
#### AC-17 (2) — Protection Of Confidentiality / Integrity Using Encryption

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system implements cryptographic mechanisms to protect the confidentiality and integrity of remote access sessions.
#### AC-17 (3) — Managed Access Control Points

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system routes all remote accesses through [Assignment: organization-defined number] managed network access control points.
#### AC-17 (4) — Privileged Commands / Access

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization:
  - **AC-17 (4)(a)** Authorizes the execution of privileged commands and access to security-relevant information via remote access only for [Assignment: organization-defined needs]; and
  - **AC-17 (4)(b)** Documents the rationale for such access in the security plan for the information system.
#### AC-17 (5) — Monitoring For Unauthorized Connections

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into SI-4].
#### AC-17 (6) — Protection Of Information

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization ensures that users protect information about remote access mechanisms from unauthorized use and disclosure.
#### AC-17 (7) — Additional Protection For Security Function Access

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into AC-3 (10)].
#### AC-17 (8) — Disable Nonsecure Network Protocols

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into CM-7].
#### AC-17 (9) — Disconnect / Disable Access

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization provides the capability to expeditiously disconnect or disable remote access to the information system within [Assignment: organization-defined time period].

---

<a id="ac-18"></a>

### AC-18 — Wireless Access

- **JSIG TOC page:** 70 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Access Control [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **AC-18a.** Establishes usage restrictions, configuration/connection requirements, and implementation guidance for wireless access; and
  - **AC-18b.** Authorizes wireless access to the information system prior to allowing such connections.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### AC-18 (1) — Authentication And Encryption

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system protects wireless access to the system using authentication of [Selection (one or more): users; devices] and encryption.
#### AC-18 (2) — Monitoring Unauthorized Connections

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into SI-4].
#### AC-18 (3) — Disable Wireless Networking

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization disables, when not intended for use, wireless networking capabilities internally embedded within information system components prior to issuance and deployment.
#### AC-18 (4) — Restrict Configurations By Users

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization identifies and explicitly authorizes users allowed to independently configure wireless networking capabilities.
#### AC-18 (5) — Antennas / Transmission Power Levels

- **NIST baselines:** HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization selects radio antennas and calibrates transmission power levels to reduce the probability that usable signals can be received outside of organization-controlled boundaries.

---

<a id="ac-19"></a>

### AC-19 — Access Control For Mobile Devices

- **JSIG TOC page:** 71 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Access Control [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **AC-19a.** Establishes usage restrictions, configuration requirements, connection requirements, and implementation guidance for organization-controlled mobile devices; and
  - **AC-19b.** Authorizes the connection of mobile devices to organizational information systems.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### AC-19 (1) — Use Of Writable / Portable Storage Devices

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into MP-7].
#### AC-19 (2) — Use Of Personally Owned Portable Storage Devices

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into MP-7].
#### AC-19 (3) — Use Of Portable Storage Devices With No Identifiable Owner

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- [Withdrawn: Incorporated into MP-7].
#### AC-19 (4) — Restrictions For Classified Information

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization:
  - **AC-19 (4)(a)** Prohibits the use of unclassified mobile devices in facilities containing information systems processing, storing, or transmitting classified information unless specifically permitted by the authorizing official; and
  - **AC-19 (4)(b)** Enforces the following restrictions on individuals permitted by the authorizing official to use unclassified mobile devices in facilities containing information systems processing, storing, or transmitting classified information:
    - **AC-19 (4)(b)(1)** Connection of unclassified mobile devices to classified information systems is prohibited;
    - **AC-19 (4)(b)(2)** Connection of unclassified mobile devices to unclassified information systems requires approval from the authorizing official;
    - **AC-19 (4)(b)(3)** Use of internal or external modems or wireless interfaces within the unclassified mobile devices is prohibited; and
    - **AC-19 (4)(b)(4)** Unclassified mobile devices and the information stored on those devices are subject to random reviews and inspections by [Assignment: organization-defined security officials], and if classified information is found, the incident handling policy is followed.
  - **AC-19 (4)(c)** Restricts the connection of classified mobile devices to classified information systems in accordance with [Assignment: organization-defined security policies].
#### AC-19 (5) — Full Device / Container-Based Encryption

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization employs [Selection: full-device encryption; container encryption] to protect the confidentiality and integrity of information on [Assignment: organization-defined mobile devices].

---

<a id="ac-20"></a>

### AC-20 — Use Of External Information Systems

- **JSIG TOC page:** 73 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Access Control [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization establishes terms and conditions, consistent with any trust relationships established with other organizations owning, operating, and/or maintaining external information systems, allowing authorized individuals to:
  - **AC-20a.** Access the information system from external information systems; and
  - **AC-20b.** Process, store, or transmit organization-controlled information using external information systems.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### AC-20 (1) — Limits On Authorized Use

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization permits authorized individuals to use an external information system to access the information system or to process, store, or transmit organization-controlled information only when the organization:
  - **AC-20 (1)(a)** Verifies the implementation of required security controls on the external system as specified in the organization's information security policy and security plan; or
  - **AC-20 (1)(b)** Retains approved information system connection or processing agreements with the organizational entity hosting the external information system.
#### AC-20 (2) — Portable Storage Devices

- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization [Selection: restricts; prohibits] the use of organization-controlled portable storage devices by authorized individuals on external information systems.
#### AC-20 (3) — Non-Organizationally Owned Systems / Components / Devices

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization [Selection: restricts; prohibits] the use of non-organizationally owned information systems, system components, or devices to process, store, or transmit organizational information.
#### AC-20 (4) — Network Accessible Storage Devices

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The organization prohibits the use of [Assignment: organization-defined network accessible storage devices] in external information systems.

---

<a id="ac-21"></a>

### AC-21 — Information Sharing

- **JSIG TOC page:** 75 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Access Control [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **AC-21a.** Facilitates information sharing by enabling authorized users to determine whether access authorizations assigned to the sharing partner match the access restrictions on the information for [Assignment: organization-defined information sharing circumstances where user discretion is required]; and
  - **AC-21b.** Employs [Assignment: organization-defined automated mechanisms or manual processes] to assist users in making information sharing/collaboration decisions.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### AC-21 (1) — Automated Decision Support

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system enforces information-sharing decisions by authorized users based on access authorizations of sharing partners and access restrictions on information to be shared.
#### AC-21 (2) — Information Search And Retrieval

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system implements information search and retrieval services that enforce [Assignment: organization-defined information sharing restrictions].

---

<a id="ac-22"></a>

### AC-22 — Publicly Accessible Content

- **JSIG TOC page:** 76 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Access Control [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** LOW, MODERATE, HIGH [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization:
  - **AC-22a.** Designates individuals authorized to post information onto a publicly accessible information system;
  - **AC-22b.** Trains authorized individuals to ensure that publicly accessible information does not contain nonpublic information;
  - **AC-22c.** Reviews the proposed content of information prior to posting onto the publicly accessible information system to ensure that nonpublic information is not included; and
  - **AC-22d.** Reviews the content on the publicly accessible information system for nonpublic information [Assignment: organization-defined frequency] and removes such information, if discovered.

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="ac-23"></a>

### AC-23 — Data Mining Protection

- **JSIG TOC page:** 77 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Access Control [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization employs [Assignment: organization-defined data mining prevention and detection techniques] for [Assignment: organization-defined data storage objects] to adequately detect and protect against data mining.

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

<a id="ac-24"></a>

### AC-24 — Access Control Decisions

- **JSIG TOC page:** 77 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Access Control [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The organization establishes procedures to ensure [Assignment: organization-defined access control decisions] are applied to each access request prior to access enforcement.

**Control enhancements (NIST Rev. 4 text; JSIG applicability/ODPs require verification):**

#### AC-24 (1) — Transmit Access Authorization Information

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system transmits [Assignment: organization-defined access authorization information] using [Assignment: organization-defined security safeguards] to [Assignment: organization-defined information systems] that enforce access control decisions.
#### AC-24 (2) — No User Or Process Identity

- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- The information system enforces access control decisions based on [Assignment: organization-defined security attributes] that do not include the identity of the user or process acting on behalf of the user.

---

<a id="ac-25"></a>

### AC-25 — Reference Monitor

- **JSIG TOC page:** 78 [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **NIST family:** Access Control [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **NIST baselines:** None listed [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

**Baseline control statement (NIST Rev. 4 text; JSIG ODPs require verification):**

- The information system implements a reference monitor for [Assignment: organization-defined access control policies] that is tamperproof, always invoked, and small enough to be subject to analysis and testing, the completeness of which can be assured.

**Control enhancements:** None listed in the NIST XML for this control. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

---

