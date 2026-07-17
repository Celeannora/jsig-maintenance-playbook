# Meeting IRS Safeguards Audit Requirements (Safeguard Technical Assistance Memo) (Excerpt)

- **Source URL:** https://www.irs.gov/privacy-disclosure/meeting-irs-safeguards-audit-requirements
- **Retrieved:** 2026-07-17
- **Why included:** Supports the research file's AU-2/AU-6/AU-11 audit-review cadence claims with a concrete, tiered daily/weekly-monthly/quarterly RACF audit log review schedule, plus the "audit information shall be retained for 6 years" retention requirement — a longer retention period than several other sources in this collection, useful for contrast with the FedRAMP/NIST baseline retention figures.

> **NOTE:** This page was retrieved in full (not truncated). It is a companion technical assistance memo to IRS Publication 1075 (Exhibit 9), illustrating how the 17 Exhibit 9 audit-trail requirements are implemented across mainframe (RACF), Windows, and Cisco router technology layers. See `irs-publication-1075.md` in this same directory for the primary Publication 1075 excerpt.

---

## Source and Scope

> "Publication 1075, Tax Information Security Guidelines for Federal, State and Local Agencies and Entities, provides very detailed audit requirements... Specifically section 5.6.2 and exhibit 9."

## Exhibit 9 — System Audit Management Guidelines (17 Requirements)

The audit trail shall capture: successful/unsuccessful login and logoff attempts; identification/authentication attempts; all actions by privileged users and privileged functions; changes to logical access control authorities; system changes affecting audit/security policy configuration; creation/modification/deletion of objects, user accounts, and group accounts; account/group privilege changes; date/time/type/initiator of system events; system start-up/shutdown; administrator account modifications; enabling/disabling of audit report generation; command-line/batch-file/query changes. The audit trail itself "shall be protected from unauthorized access, use, deletion or modification" and "shall be restricted to personnel routinely responsible for performing security audit functions."

## Ten Summary Auditing Requirement Areas

1. Audit and accountability policy and procedures must be developed, documented, disseminated, and updated.
2. Auditable events must be identified and captured.
3. Content of audit records should be understood and defined.
4. Proper audit storage capacity must be determined and allocated.
5. Audit logs must be reviewed periodically as defined by the policy.
6. Processes must be in place to handle auditing failures.
7. Audit logs must be monitored, analyzed and reported.
8. Time stamps must be enforced to correlate events from multiple sources.
9. Audit information is sensitive and must be protected.
10. **"Audit information shall be retained for 6 years."**

## Example Tiered Audit Log Review Schedule (RACF Mainframe Example)

> "Expected in the policy and procedures would be some kind of schedule for reviewing particular audit logs. Here is an example (we would expect to see a similar process applied to any technology and its associated audit information):"

- **Daily Review — RACF System Administrator:** reviewed daily for data set access violations, resource access violations, program use violations.
- **Weekly/Monthly Review — RACF System Administrator & RACF SA Manager:** reviewed weekly/monthly for failed logon attempts (RACF user violation report), special and operation privileges.
- **Quarterly Review — RACF Auditor team:** reviewed quarterly for trusted STC accesses, FTP userids/logonids/ACIDs accesses, Global Control Options.

## Windows Auditing Storage Minimums (Technical Detail)

> "The value for 'Maximum application log size' MUST BE set to a minimum of '16384 kilobytes.' The value for 'Maximum security log size' MUST BE set to a minimum of '81920 kilobytes.' The value for 'Maximum system log size' MUST BE set to a minimum of '16384 kilobytes.'"

Event Viewer logs must be set to "Do Not Overwrite Events (clear log manually)" to prevent premature loss of audit data.

## RACF/Cisco Common Findings (Illustrative)

- RACF: SETROPTS AUDIT operand not enabled; STATISTICS processing not enabled; ATTRIBUTES operand missing INITSTATS/SAUDIT/OPERAUDIT/CMDVIOL; excessive ALTER/UPDATE access to SMF audit logs (SYS1.MAN*).
- Cisco routers: missing syslog sequence numbers; no NTP authentication (risking audit trail time-integrity); no dedicated/protected log server.

---

*End of excerpt. Full source: https://www.irs.gov/privacy-disclosure/meeting-irs-safeguards-audit-requirements*
