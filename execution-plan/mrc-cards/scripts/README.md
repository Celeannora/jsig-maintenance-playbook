# MRC Automation Scripts — Standard & Index

Runnable PowerShell scripts that automate the check/report-generation portion of a Guide-status MRC card, so a system administrator can run one command instead of performing every step of the Procedure by hand.

**Scope:** only Guide-status cards get a script, and only where the underlying task is genuinely automatable (a check, scan, or report pull against Windows Server/AD/Exchange, Splunk, Tenable Nessus, or Trellix/McAfee ePO — the baseline stack in [`AGENTS.md`](../../../AGENTS.md) rule 8). Tasks that are inherently manual or judgment-based (physical walk-throughs, governance decisions, policy review) stay `N/A` in the [tracking matrix](../README.md) and never get a script here.

## Naming convention

One script per card: `<MRC-ID>.ps1`, e.g. `MRC-OPS-002.ps1` for MRC-OPS-002 — DCDIAG full domain controller health check.

## Required script structure

Every script in this folder must follow this shape so an admin unfamiliar with a specific script can still run any of them the same way:

1. **Comment-based help header** (`<# .SYNOPSIS / .DESCRIPTION / .PARAMETER / .EXAMPLE / .NOTES #>`) — `.NOTES` must cite the MRC ID, the card's title, and a link back to `../<family>/<MRC-ID>.md`.
2. **Standard parameters** — every script accepts at minimum:
   - `-OutputPath <string>` — where to write the report (default: `.\reports\<MRC-ID>_<yyyyMMdd-HHmmss>.txt` or `.html`, created if missing).
   - `-ComputerName <string[]>` — target host(s), where applicable; default `$env:COMPUTERNAME` or the local domain-joined scope.
3. **No destructive actions.** These scripts read/check/report only — they never remediate, delete, disable, or modify configuration. If a task's procedure includes a remediation step, the script covers only the detection/reporting half; remediation stays a manual, documented action per the card's Procedure.
4. **Structured output, not just console text.** Emit a PowerShell object (or array of objects) via the pipeline in addition to writing the human-readable report file, so the report can be piped into `Export-Csv`, `ConvertTo-Json`, or a monitoring system later. Minimum fields: `Timestamp`, `CheckName`, `Target`, `Result` (Pass/Fail/Warning), `Detail`.
5. **Exit codes.** `0` = all checks passed. `1` = one or more checks failed/warned (lets the script be wrapped in a scheduled task that alerts on non-zero exit). Never throw an unhandled exception for an expected failure condition (e.g., a host being unreachable) — catch it, record it as a `Fail` result, and continue to the next check/target.
6. **No embedded credentials, hostnames, or environment-specific values.** Parameterize everything; the script must run as-is in any JSIG-governed environment matching the baseline stack, not just the original author's lab.
7. **Never fabricate a check.** If a step in the card's Procedure can't actually be verified programmatically (e.g., a value that requires human judgment), do not fake a Pass — omit that step from the script and leave it as a manual line item in the card, flagged clearly as "not scripted — human review required."

## Safety disclaimer (include in every script's `.NOTES` and in the card that links to it)

> Provided as a starting point for the stated baseline environment. Not validated against a live production system in this repository. A human must review this script's logic and test it in a non-production environment before operational use, per the organization's own change-control process.

## Index

| MRC | Script | Card |
|---|---|---|
| MRC-OPS-001 | [`MRC-OPS-001.ps1`](MRC-OPS-001.ps1) | [AD replication health check](../ops/MRC-OPS-001.md) |
| MRC-OPS-002 | [`MRC-OPS-002.ps1`](MRC-OPS-002.ps1) | [DCDIAG full domain controller health check](../ops/MRC-OPS-002.md) |
| MRC-OPS-003 | [`MRC-OPS-003.ps1`](MRC-OPS-003.ps1) | [DNS zone health and scavenging review](../ops/MRC-OPS-003.md) |
| MRC-OPS-004 | [`MRC-OPS-004.ps1`](MRC-OPS-004.ps1) | [SYSVOL/DFSR replication health check](../ops/MRC-OPS-004.md) |
| MRC-OPS-005 | [`MRC-OPS-005.ps1`](MRC-OPS-005.ps1) | [FSMO role holder verification](../ops/MRC-OPS-005.md) |
| MRC-OPS-006 | [`MRC-OPS-006.ps1`](MRC-OPS-006.ps1) | [Domain/forest trust health check](../ops/MRC-OPS-006.md) |
| MRC-OPS-007 | [`MRC-OPS-007.ps1`](MRC-OPS-007.ps1) | [Domain controller System State backup verification](../ops/MRC-OPS-007.md) |
| MRC-OPS-008 | [`MRC-OPS-008.ps1`](MRC-OPS-008.ps1) | [Stale computer/user Active Directory object cleanup](../ops/MRC-OPS-008.md) |
| MRC-OPS-009 | [`MRC-OPS-009.ps1`](MRC-OPS-009.ps1) | [Domain controller disk space and event log health check](../ops/MRC-OPS-009.md) |
| MRC-OPS-010 | [`MRC-OPS-010.ps1`](MRC-OPS-010.ps1) | [Netlogon/KDC/DNS Server service health check](../ops/MRC-OPS-010.md) |
| MRC-OPS-011 | [`MRC-OPS-011.ps1`](MRC-OPS-011.ps1) | [Group Policy Object replication and health check](../ops/MRC-OPS-011.md) |
| MRC-OPS-012 | [`MRC-OPS-012.ps1`](MRC-OPS-012.ps1) | [Active Directory database (ntds.dit) size/health review](../ops/MRC-OPS-012.md) |
| MRC-OPS-013 | [`MRC-OPS-013.ps1`](MRC-OPS-013.ps1) | [Mailbox database health and whitespace review](../ops/MRC-OPS-013.md) |
| MRC-OPS-014 | [`MRC-OPS-014.ps1`](MRC-OPS-014.ps1) | [Database Availability Group (DAG) health and failover readiness check](../ops/MRC-OPS-014.md) |
| MRC-OPS-015 | [`MRC-OPS-015.ps1`](MRC-OPS-015.ps1) | [Mail queue / transport health check (stuck-queue check)](../ops/MRC-OPS-015.md) |
| MRC-OPS-016 | [`MRC-OPS-016.ps1`](MRC-OPS-016.ps1) | [Exchange/OWA/SMTP certificate expiration monitoring](../ops/MRC-OPS-016.md) |
| MRC-OPS-017 | [`MRC-OPS-017.ps1`](MRC-OPS-017.ps1) | [Exchange transaction log truncation and disk space check](../ops/MRC-OPS-017.md) |
| MRC-OPS-018 | [`MRC-OPS-018.ps1`](MRC-OPS-018.ps1) | [Client access (OWA/ActiveSync) availability check](../ops/MRC-OPS-018.md) |
| MRC-OPS-019 | [`MRC-OPS-019.ps1`](MRC-OPS-019.ps1) | [Exchange connector and transport rule health review](../ops/MRC-OPS-019.md) |
| MRC-OPS-020 | [`MRC-OPS-020.ps1`](MRC-OPS-020.ps1) | [Message tracking log review (mail-flow troubleshooting)](../ops/MRC-OPS-020.md) |
| MRC-OPS-021 | [`MRC-OPS-021.ps1`](MRC-OPS-021.ps1) | [Exchange application-aware backup verification](../ops/MRC-OPS-021.md) |
| MRC-OPS-023 | [`MRC-OPS-023.ps1`](MRC-OPS-023.ps1) | [Splunk forwarder health, index health, and license usage check](../ops/MRC-OPS-023.md) |
| MRC-OPS-024 | [`MRC-OPS-024.ps1`](MRC-OPS-024.ps1) | [Nessus scanner engine and plugin feed health check](../ops/MRC-OPS-024.md) |
| MRC-OPS-025 | [`MRC-OPS-025.ps1`](MRC-OPS-025.ps1) | [AD CS Certificate Authority health and enterprise certificate-expiration monitoring](../ops/MRC-OPS-025.md) |
| MRC-OPS-026 | [`MRC-OPS-026.ps1`](MRC-OPS-026.ps1) | [Scheduled task/job success monitoring](../ops/MRC-OPS-026.md) |
| MRC-OPS-027 | [`MRC-OPS-027.ps1`](MRC-OPS-027.ps1) | [Service account password expiration tracking](../ops/MRC-OPS-027.md) |
| MRC-OPS-029 | [`MRC-OPS-029.ps1`](MRC-OPS-029.ps1) | [Functional patching beyond security patches (feature/driver updates)](../ops/MRC-OPS-029.md) |
| MRC-OPS-031 | [`MRC-OPS-031.ps1`](MRC-OPS-031.ps1) | [File/print server share health and disk capacity check](../ops/MRC-OPS-031.md) |
| MRC-OPS-032 | [`MRC-OPS-032.ps1`](MRC-OPS-032.ps1) | [DHCP scope utilization and lease health check](../ops/MRC-OPS-032.md) |
| MRC-OPS-033 | [`MRC-OPS-033.ps1`](MRC-OPS-033.ps1) | [Server uptime and patch-reboot compliance tracking](../ops/MRC-OPS-033.md) |
| MRC-OPS-034 | [`MRC-OPS-034.ps1`](MRC-OPS-034.ps1) | [Core Windows service health check across servers](../ops/MRC-OPS-034.md) |
