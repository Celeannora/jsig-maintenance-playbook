# MRC Card Status — Stub / Guide Tracking Matrix

Tracks the build-out status of every Maintenance Requirement Card (MRC) across all three families in this repository -- **master** (110, JSIG Master Calendar), **ops** (34, Operational Tasking), and **network-infra** (16, Network Infrastructure Tasking), for a combined **160** cards.

Regenerate this file after upgrading any card's status: edit the `GUIDE_STATUS_OVERRIDES` dict in `/home/user/workspace/build_mrc_status_readme.py` and re-run `python3 build_mrc_status_readme.py`.

## Status definitions

| Status | Meaning |
|---|---|
| **Stub** | Card follows one of the 8 generic execution patterns (Pattern A-H) from [`runbooks/_EXECUTION-PATTERNS.md`](../runbooks/_EXECUTION-PATTERNS.md) with light task-specific substitution. Procedure steps describe *what* to check and *what* done looks like in tool-agnostic language, but do not name specific screens, commands, or menu paths. **Not yet usable as literal step-by-step instructions for an employee.** |
| **Guide** | Card has been hand-authored with exact, tool-specific steps an employee can follow literally -- naming the actual product, screen, command, or menu path in the assumed baseline environment (see [`AGENTS.md`](../../AGENTS.md) rule 8: Windows Server/Active Directory, Splunk, Tenable Nessus, Trellix/McAfee ePO). **Usable as-is by an employee performing the task.** |

**Current progress: 2 / 160 cards upgraded to Guide status (158 remaining as Stub).**

**Script** column: `Yes` = a runnable PowerShell automation script exists under [`scripts/`](scripts/README.md) for this card; `No` = scriptable in principle but not yet built; `N/A` = inherently manual/judgment task, cannot be scripted (see [`AGENTS.md`](../../AGENTS.md) rule 9).

## Master Calendar (110 cards)

One card per [`MAINTENANCE-PLAN.md`](../../MAINTENANCE-PLAN.md) Sec 4 Master Calendar task. Full index with assignment-source detail: [`master/INDEX.md`](master/INDEX.md).

| MRC | Task | Family | Frequency | Pattern | Status | Script |
|---|---|---|---|---|---|---|
| [MRC-001](master/MRC-001.md) | Maintain asset/software inventory (automated) | CM | Continuous | Pattern A | Stub | No |
| [MRC-002](master/MRC-002.md) | Monitor system communications/security dashboards | SI | Continuous | Pattern A | Stub | No |
| [MRC-003](master/MRC-003.md) | Real-time malware scanning of externally sourced files | SI | Continuous | Pattern A | Stub | No |
| [MRC-004](master/MRC-004.md) | Maintain IAVM directive compliance | SI | Continuous | Pattern C | Stub | No |
| [MRC-005](master/MRC-005.md) | Enforce access control/session/least-privilege mechanisms | AC | Continuous | Pattern A | Stub | No |
| [MRC-006](master/MRC-006.md) | Monitor audit storage capacity and processing-failure alerts | AU | Continuous | Pattern A | Stub | No |
| [MRC-007](master/MRC-007.md) | Enforce boundary protection (firewalls/guards) | SC | Continuous | Pattern A | Stub | No |
| [MRC-008](master/MRC-008.md) | Enforce encryption at rest (non-tailorable) | SC | Continuous | Pattern A | Stub | No |
| [MRC-009](master/MRC-009.md) | Enforce transmission confidentiality/integrity | SC | Continuous | Pattern A | Stub | No |
| [MRC-010](master/MRC-010.md) | Enforce reauthentication/session timeout | IA | Continuous | Pattern A | Stub | No |
| [MRC-011](master/MRC-011.md) | Monitor denial-of-service protections/session authenticity | SC | Continuous | Pattern A | Stub | No |
| [MRC-012](master/MRC-012.md) | Monitor temperature/humidity environmental controls | PE | Continuous | Pattern A | Stub | No |
| [MRC-013](master/MRC-013.md) | Operate privacy incident response capability | SE | Continuous | Custom | Stub | No |
| [MRC-014](master/MRC-014.md) | Handle and monitor for security incidents (24/7) | IR | Continuous | Custom | Stub | No |
| [MRC-015](master/MRC-015.md) | Maintain accounting-of-disclosures log | AR | Continuous | Pattern B | Stub | No |
| [MRC-016](master/MRC-016.md) | Check/update malware-tool signatures | SI | Daily | Pattern C | Stub | No |
| [MRC-017](master/MRC-017.md) | Provide incident status updates during active incident | IR | Daily (per-event) | Custom | Stub | No |
| [MRC-018](master/MRC-018.md) | Notify account manager on termination/transfer/need-to-know change (8–24 hr window) | AC | Daily (per-event) | Pattern C | Stub | No |
| [MRC-019](master/MRC-019.md) | Process termination access-revocation actions (≤24 hr) | PS | Daily (per-event) | Pattern C | Stub | No |
| [MRC-020](master/MRC-020.md) | Process transfer access-reassessment actions (≤24 hr) | PS | Daily (per-event) | Pattern C | Stub | No |
| [MRC-021](master/MRC-021.md) | Verify system clock/time-stamp synchronization | AU | Daily (automated check) | Pattern A | Stub | No |
| [MRC-022](master/MRC-022.md) | Review and analyze system audit records | AU | Weekly | Pattern B | Stub | No |
| [MRC-023](master/MRC-023.md) | Run periodic malicious-code (antivirus) scans | SI | Weekly | Pattern A | Stub | No |
| [MRC-024](master/MRC-024.md) | Perform incremental backups (daily-incremental/weekly-full pattern) | CP | Weekly | Pattern A | Stub | No |
| [MRC-025](master/MRC-025.md) | Update Plan of Action and Milestones (POA&M) | CA | Monthly | Pattern B | Stub | No |
| [MRC-026](master/MRC-026.md) | Assemble ConMon deliverable package | CA | Monthly | Pattern B | Stub | No |
| [MRC-027](master/MRC-027.md) | Perform vulnerability scanning | RA | Monthly | Pattern A | Stub | No |
| [MRC-028](master/MRC-028.md) | Update scanner vulnerability signatures | RA | Monthly | Pattern C | Stub | No |
| [MRC-029](master/MRC-029.md) | Check/report flaw-remediation (patch) status | SI | Monthly | Pattern C | Stub | No |
| [MRC-030](master/MRC-030.md) | Test backup integrity/restoration | CP | Monthly | Pattern D | Stub | No |
| [MRC-031](master/MRC-031.md) | Review physical access logs | PE | Monthly | Pattern B | Stub | No |
| [MRC-032](master/MRC-032.md) | Review visitor access records | PE | Monthly | Pattern B | Stub | No |
| [MRC-033](master/MRC-033.md) | Review Authorized Access List for restricted/SAPF areas | PE | Monthly | Pattern B | Stub | No |
| [MRC-034](master/MRC-034.md) | Convene Configuration Control Board (when changes proposed) | CM | Monthly | Pattern H | Stub | No |
| [MRC-035](master/MRC-035.md) | Update system component inventory (manual/verification pass) | CM | Monthly | Pattern B | Stub | No |
| [MRC-036](master/MRC-036.md) | Maintain organization-level POA&M rollup | PM | Monthly | Pattern B | Stub | No |
| [MRC-037](master/MRC-037.md) | Maintain organization-wide information system inventory | PM | Monthly | Pattern B | Stub | No |
| [MRC-038](master/MRC-038.md) | Monitor nonlocal maintenance session records | MA | Monthly | Pattern B | Stub | No |
| [MRC-039](master/MRC-039.md) | Verify media storage physical/environmental controls | MP | Monthly | Pattern A | Stub | No |
| [MRC-040](master/MRC-040.md) | Monitor/audit privacy control compliance | AR | Monthly | Pattern B | Stub | No |
| [MRC-041](master/MRC-041.md) | Update PII/system-holdings inventory | SE | Monthly | Pattern B | Stub | No |
| [MRC-042](master/MRC-042.md) | Verify security function operation (self-tests) | SI | Monthly | Pattern A | Stub | No |
| [MRC-043](master/MRC-043.md) | Verify software/firmware/information integrity | SI | Monthly | Pattern A | Stub | No |
| [MRC-044](master/MRC-044.md) | Install security-relevant software/firmware updates | SI | Monthly/30 days | Pattern C | Stub | No |
| [MRC-045](master/MRC-045.md) | Report information security performance measures | PM | Monthly/quarterly | Pattern B | Stub | No |
| [MRC-046](master/MRC-046.md) | Review privileged account list and entitlements | AC | Quarterly | Pattern B | Stub | No |
| [MRC-047](master/MRC-047.md) | Reassess least-privilege/privileged-function assignments | AC | Quarterly | Pattern B | Stub | No |
| [MRC-048](master/MRC-048.md) | Review authorized software list | CM | Quarterly | Pattern B | Stub | No |
| [MRC-049](master/MRC-049.md) | Reassess/reevaluate privileged access tied to change | CM | Quarterly | Pattern B | Stub | No |
| [MRC-050](master/MRC-050.md) | Review unsupported system components (EOL/EOS) | SA | Quarterly | Pattern B | Stub | No |
| [MRC-051](master/MRC-051.md) | Verify encryption-at-rest compliance | SC | Quarterly | Pattern B | Stub | No |
| [MRC-052](master/MRC-052.md) | Verify transmission encryption compliance | SC | Quarterly | Pattern B | Stub | No |
| [MRC-053](master/MRC-053.md) | Distribute quarterly security/privacy awareness reminders | AT | Quarterly | Custom | Stub | No |
| [MRC-054](master/MRC-054.md) | Review remote access and wireless access authorization lists | AC | Quarterly | Pattern B | Stub | No |
| [MRC-055](master/MRC-055.md) | Review publicly accessible content | AC | Quarterly | Pattern B | Stub | No |
| [MRC-056](master/MRC-056.md) | Review access-enforcement/flow-enforcement rule sets | AC | Quarterly | Pattern B | Stub | No |
| [MRC-057](master/MRC-057.md) | Verify device identification/authentication configuration | IA | Quarterly | Pattern B | Stub | No |
| [MRC-058](master/MRC-058.md) | Verify configuration settings against baseline/STIG | CM | Quarterly | Pattern B | Stub | No |
| [MRC-059](master/MRC-059.md) | Review protection of audit tools/information | AU | Quarterly | Pattern B | Stub | No |
| [MRC-060](master/MRC-060.md) | Review media access authorization list | MP | Quarterly | Pattern B | Stub | No |
| [MRC-061](master/MRC-061.md) | Verify media marking compliance | MP | Quarterly | Pattern B | Stub | No |
| [MRC-062](master/MRC-062.md) | Review transmission medium/output device access controls | PE | Quarterly | Pattern B | Stub | No |
| [MRC-063](master/MRC-063.md) | Review data quality of PII holdings | DI | Quarterly | Pattern B | Stub | No |
| [MRC-064](master/MRC-064.md) | Track and report privacy complaint trends | IP | Quarterly | Pattern B | Stub | No |
| [MRC-065](master/MRC-065.md) | Review boundary-protection rule set | SC | Quarterly | Pattern B | Stub | No |
| [MRC-066](master/MRC-066.md) | Review spam protection mechanism effectiveness | SI | Quarterly | Pattern B | Stub | No |
| [MRC-067](master/MRC-067.md) | Review non-privileged/user account list | AC | Semi-annual | Pattern B | Stub | No |
| [MRC-068](master/MRC-068.md) | Test/exercise incident response capability (SAP default) | IR | Semi-annual | Pattern D | Stub | No |
| [MRC-069](master/MRC-069.md) | Review inventory records for computers/removable media (IRS-analog practice) | CM | Semi-annual | Pattern B | Stub | No |
| [MRC-070](master/MRC-070.md) | Review/update baseline configuration | CM | Annual | Pattern E | Stub | No |
| [MRC-071](master/MRC-071.md) | Review/update all family policies and procedures (-1 controls) | All 26 | Annual | Pattern E | Stub | No |
| [MRC-072](master/MRC-072.md) | Review/update contingency plan | CP | Annual | Pattern E | Stub | No |
| [MRC-073](master/MRC-073.md) | Test/exercise contingency plan | CP | Annual | Pattern D | Stub | No |
| [MRC-074](master/MRC-074.md) | Perform independent security control assessment | CA | Annual | Pattern D | Stub | No |
| [MRC-075](master/MRC-075.md) | Perform penetration testing | CA | Annual | Pattern D | Stub | No |
| [MRC-076](master/MRC-076.md) | Review approved maintenance tools | MA | Annual | Pattern B | Stub | No |
| [MRC-077](master/MRC-077.md) | Update/reassess organizational risk assessment | RA | Annual | Pattern E | Stub | No |
| [MRC-078](master/MRC-078.md) | Review/re-sign personnel access agreements | PS | Annual | Pattern B | Stub | No |
| [MRC-079](master/MRC-079.md) | Deliver annual security awareness refresher training | AT | Annual | Pattern F | Stub | No |
| [MRC-080](master/MRC-080.md) | Deliver role-based training refresher | AT | Annual | Pattern F | Stub | No |
| [MRC-081](master/MRC-081.md) | Deliver incident response training refresher | IR | Annual | Pattern F | Stub | No |
| [MRC-082](master/MRC-082.md) | Deliver contingency training refresher | CP | Annual | Pattern F | Stub | No |
| [MRC-083](master/MRC-083.md) | Review/update incident response plan | IR | Annual | Pattern E | Stub | No |
| [MRC-084](master/MRC-084.md) | Review/update auditable events list | AU | Annual | Pattern E | Stub | No |
| [MRC-085](master/MRC-085.md) | Review unnecessary functions/ports/protocols/services | CM | Annual | Pattern B | Stub | No |
| [MRC-086](master/MRC-086.md) | Inventory physical access devices; change combinations/keys | PE | Annual | Pattern C | Stub | No |
| [MRC-087](master/MRC-087.md) | Review/update System Security Plan (SSP) | PL | Annual | Pattern E | Stub | No |
| [MRC-088](master/MRC-088.md) | Review Rules of Behavior acknowledgment | PL | Annual | Pattern B | Stub | No |
| [MRC-089](master/MRC-089.md) | Review external system service provider compliance | SA | Annual | Pattern B | Stub | No |
| [MRC-090](master/MRC-090.md) | Rotate/manage cryptographic keys | SC | Annual | Pattern C | Stub | No |
| [MRC-091](master/MRC-091.md) | Review security categorization | RA | Annual | Pattern E | Stub | No |
| [MRC-092](master/MRC-092.md) | Review position risk designations | PS | Annual | Pattern B | Stub | No |
| [MRC-093](master/MRC-093.md) | Update Privacy Impact Assessment | AR | Annual | Pattern E | Stub | No |
| [MRC-094](master/MRC-094.md) | Review PII minimization opportunities in holdings | DM | Annual | Pattern B | Stub | No |
| [MRC-095](master/MRC-095.md) | Review/update privacy notices, SORNs, and Privacy Act statements | TR | Annual | Pattern E | Stub | No |
| [MRC-096](master/MRC-096.md) | Review internal-use and third-party info-sharing compliance | UL | Annual | Pattern B | Stub | No |
| [MRC-097](master/MRC-097.md) | Review Configuration Management Plan | CM | Annual | Pattern E | Stub | No |
| [MRC-098](master/MRC-098.md) | Test information system recovery/reconstitution procedures | CP | Annual | Pattern D | Stub | No |
| [MRC-099](master/MRC-099.md) | Verify alternate storage/processing site and telecom readiness | CP | Annual | Pattern A | Stub | No |
| [MRC-100](master/MRC-100.md) | Verify TEMPEST/information-leakage countermeasures (SAP-specific) | PE | Annual | Pattern B | Stub | No |
| [MRC-101](master/MRC-101.md) | Test fire detection/suppression and inspect water-damage risk | PE | Annual | Pattern D | Stub | No |
| [MRC-102](master/MRC-102.md) | Review third-party/contractor personnel security compliance | PS | Annual | Pattern B | Stub | No |
| [MRC-103](master/MRC-103.md) | Retain audit records offline per NARA schedule or 6–7 years (IRS analog) | AU | Multi-year / retention | Pattern G | Stub | No |
| [MRC-104](master/MRC-104.md) | Prevent identifier reuse for ≥2 years | IA | Multi-year / retention | Pattern G | Stub | No |
| [MRC-105](master/MRC-105.md) | Ensure every control assessed at least once per 3-year cycle | CA | Multi-year / retention | Pattern G | Stub | No |
| [MRC-106](master/MRC-106.md) | Retain incident records 3 years after follow-up actions complete | IR | Multi-year / retention | Pattern G | Stub | No |
| [MRC-107](master/MRC-107.md) | Retain visitor access records (1–5 years per source) | PE | Multi-year / retention | Pattern G | Stub | No |
| [MRC-108](master/MRC-108.md) | Execute PII retention/disposal per records schedule | DM | Multi-year / retention | Pattern G | Stub | No |
| [MRC-109](master/MRC-109.md) | Track and initiate personnel reinvestigations | PS | Periodic (DoD/IC cycle) | Pattern B | Stub | No |
| [MRC-110](master/MRC-110.md) | Conduct Technical Surveillance Countermeasures Survey | RA | Periodic (facility policy) | Pattern A | Stub | No |

## Operational Tasking (34 cards)

One card per Operational Tasking Calendar task. Full index: [`ops/INDEX.md`](ops/INDEX.md).

| MRC | Task | System | Frequency | Pattern | Status | Script |
|---|---|---|---|---|---|---|
| [MRC-OPS-001](ops/MRC-OPS-001.md) | AD replication health check (repadmin /replsummary, /showrepl) | Active Directory / Domain Controllers | Daily | Pattern A | Guide | Yes |
| [MRC-OPS-002](ops/MRC-OPS-002.md) | DCDIAG full domain controller health check | Active Directory / Domain Controllers | Weekly | Pattern B | Guide | Yes |
| [MRC-OPS-003](ops/MRC-OPS-003.md) | DNS zone health and scavenging review | Active Directory / Domain Controllers | Weekly | Pattern B | Stub | No |
| [MRC-OPS-004](ops/MRC-OPS-004.md) | SYSVOL/DFSR replication health check | Active Directory / Domain Controllers | Weekly | Pattern A | Stub | No |
| [MRC-OPS-005](ops/MRC-OPS-005.md) | FSMO role holder verification | Active Directory / Domain Controllers | Monthly | Pattern B | Stub | No |
| [MRC-OPS-006](ops/MRC-OPS-006.md) | Domain/forest trust health check | Active Directory / Domain Controllers | Monthly | Pattern B | Stub | No |
| [MRC-OPS-007](ops/MRC-OPS-007.md) | Domain controller System State backup verification | Active Directory / Domain Controllers | Weekly | Pattern A | Stub | No |
| [MRC-OPS-008](ops/MRC-OPS-008.md) | Stale computer/user Active Directory object cleanup | Active Directory / Domain Controllers | Monthly | Pattern G | Stub | No |
| [MRC-OPS-009](ops/MRC-OPS-009.md) | Domain controller disk space and event log health check | Active Directory / Domain Controllers | Daily | Pattern A | Stub | No |
| [MRC-OPS-010](ops/MRC-OPS-010.md) | Netlogon/KDC/DNS Server service health check | Active Directory / Domain Controllers | Daily | Pattern A | Stub | No |
| [MRC-OPS-011](ops/MRC-OPS-011.md) | Group Policy Object replication and health check | Active Directory / Domain Controllers | Monthly | Pattern B | Stub | No |
| [MRC-OPS-012](ops/MRC-OPS-012.md) | Active Directory database (ntds.dit) size/health review | Active Directory / Domain Controllers | Quarterly | Pattern B | Stub | No |
| [MRC-OPS-013](ops/MRC-OPS-013.md) | Mailbox database health and whitespace review | Exchange Messaging | Weekly | Pattern B | Stub | No |
| [MRC-OPS-014](ops/MRC-OPS-014.md) | Database Availability Group (DAG) health and failover readiness check | Exchange Messaging | Daily | Pattern A | Stub | No |
| [MRC-OPS-015](ops/MRC-OPS-015.md) | Mail queue / transport health check (stuck-queue check) | Exchange Messaging | Daily | Pattern A | Stub | No |
| [MRC-OPS-016](ops/MRC-OPS-016.md) | Exchange/OWA/SMTP certificate expiration monitoring | Exchange Messaging | Monthly | Pattern B | Stub | No |
| [MRC-OPS-017](ops/MRC-OPS-017.md) | Exchange transaction log truncation and disk space check | Exchange Messaging | Daily | Pattern A | Stub | No |
| [MRC-OPS-018](ops/MRC-OPS-018.md) | Client access (OWA/ActiveSync) availability check | Exchange Messaging | Daily | Pattern A | Stub | No |
| [MRC-OPS-019](ops/MRC-OPS-019.md) | Exchange connector and transport rule health review | Exchange Messaging | Monthly | Pattern B | Stub | No |
| [MRC-OPS-020](ops/MRC-OPS-020.md) | Message tracking log review (mail-flow troubleshooting) | Exchange Messaging | Weekly | Pattern B | Stub | No |
| [MRC-OPS-021](ops/MRC-OPS-021.md) | Exchange application-aware backup verification | Exchange Messaging | Weekly | Pattern A | Stub | No |
| [MRC-OPS-022](ops/MRC-OPS-022.md) | Trellix/McAfee ePO agent heartbeat and endpoint coverage check | Security Tooling (Operational Health) | Weekly | Pattern A | Stub | No |
| [MRC-OPS-023](ops/MRC-OPS-023.md) | Splunk forwarder health, index health, and license usage check | Security Tooling (Operational Health) | Weekly | Pattern A | Stub | No |
| [MRC-OPS-024](ops/MRC-OPS-024.md) | Nessus scanner engine and plugin feed health check | Security Tooling (Operational Health) | Weekly | Pattern C | Stub | No |
| [MRC-OPS-025](ops/MRC-OPS-025.md) | AD CS Certificate Authority health and enterprise certificate-expiration monitoring | Windows Server (General) | Monthly | Pattern B | Stub | No |
| [MRC-OPS-026](ops/MRC-OPS-026.md) | Scheduled task/job success monitoring | Windows Server (General) | Weekly | Pattern B | Stub | No |
| [MRC-OPS-027](ops/MRC-OPS-027.md) | Service account password expiration tracking | Windows Server (General) | Monthly | Pattern B | Stub | No |
| [MRC-OPS-028](ops/MRC-OPS-028.md) | Hardware/RAID/disk health and out-of-band management check | Windows Server (General) | Weekly | Pattern A | Stub | No |
| [MRC-OPS-029](ops/MRC-OPS-029.md) | Functional patching beyond security patches (feature/driver updates) | Windows Server (General) | Monthly | Pattern C | Stub | No |
| [MRC-OPS-030](ops/MRC-OPS-030.md) | Windows Server / Exchange licensing and CAL compliance review | Windows Server (General) | Quarterly | Pattern B | Stub | No |
| [MRC-OPS-031](ops/MRC-OPS-031.md) | File/print server share health and disk capacity check | Windows Server (General) | Weekly | Pattern A | Stub | No |
| [MRC-OPS-032](ops/MRC-OPS-032.md) | DHCP scope utilization and lease health check | Windows Server (General) | Weekly | Pattern B | Stub | No |
| [MRC-OPS-033](ops/MRC-OPS-033.md) | Server uptime and patch-reboot compliance tracking | Windows Server (General) | Weekly | Pattern A | Stub | No |
| [MRC-OPS-034](ops/MRC-OPS-034.md) | Core Windows service health check across servers | Windows Server (General) | Daily | Pattern A | Stub | No |

## Network Infrastructure Tasking (16 cards)

One card per Network Infrastructure Tasking Calendar task. Full index: [`network-infra/INDEX.md`](network-infra/INDEX.md).

| MRC | Task | System | Frequency | Pattern | Status | Script |
|---|---|---|---|---|---|---|
| [MRC-NET-001](network-infra/MRC-NET-001.md) | Core switch/router interface error-rate and utilization review | Network Infrastructure (Switches/Routers) | Daily | Pattern A | Stub | No |
| [MRC-NET-002](network-infra/MRC-NET-002.md) | Switch configuration backup verification | Network Infrastructure (Switches/Routers) | Weekly | Pattern B | Stub | No |
| [MRC-NET-003](network-infra/MRC-NET-003.md) | Router configuration backup verification | Network Infrastructure (Switches/Routers) | Weekly | Pattern B | Stub | No |
| [MRC-NET-004](network-infra/MRC-NET-004.md) | Firewall configuration and rule-set backup verification | Network Infrastructure (Firewalls) | Weekly | Pattern B | Stub | No |
| [MRC-NET-005](network-infra/MRC-NET-005.md) | Switch firmware/OS version currency review | Network Infrastructure (Switches/Routers) | Monthly | Pattern B | Stub | No |
| [MRC-NET-006](network-infra/MRC-NET-006.md) | Router firmware/OS version currency review | Network Infrastructure (Switches/Routers) | Monthly | Pattern B | Stub | No |
| [MRC-NET-007](network-infra/MRC-NET-007.md) | Firewall firmware/OS version currency review | Network Infrastructure (Firewalls) | Monthly | Pattern B | Stub | No |
| [MRC-NET-008](network-infra/MRC-NET-008.md) | Core switch/router redundant pair (HA) failover readiness check | Network Infrastructure (Switches/Routers) | Monthly | Pattern D | Stub | No |
| [MRC-NET-009](network-infra/MRC-NET-009.md) | Firewall HA pair/cluster failover readiness check | Network Infrastructure (Firewalls) | Monthly | Pattern D | Stub | No |
| [MRC-NET-010](network-infra/MRC-NET-010.md) | Network device out-of-band (OOB) management access health check | Network Infrastructure (General) | Daily | Pattern A | Stub | No |
| [MRC-NET-011](network-infra/MRC-NET-011.md) | Network device AAA (TACACS+/RADIUS) authentication health check | Network Infrastructure (General) | Monthly | Pattern A | Stub | No |
| [MRC-NET-012](network-infra/MRC-NET-012.md) | Network device SNMP/syslog health check | Network Infrastructure (General) | Weekly | Pattern A | Stub | No |
| [MRC-NET-013](network-infra/MRC-NET-013.md) | Spanning-tree/loop-prevention health review | Network Infrastructure (Switches/Routers) | Monthly | Pattern B | Stub | No |
| [MRC-NET-014](network-infra/MRC-NET-014.md) | Network device SSH host-key and management-certificate currency check | Network Infrastructure (General) | Quarterly | Pattern B | Stub | No |
| [MRC-NET-015](network-infra/MRC-NET-015.md) | Core network hardware health check (fans, power supplies, temperature) | Network Infrastructure (General) | Weekly | Pattern A | Stub | No |
| [MRC-NET-016](network-infra/MRC-NET-016.md) | VLAN/trunk configuration consistency audit | Network Infrastructure (Switches/Routers) | Quarterly | Pattern B | Stub | No |

