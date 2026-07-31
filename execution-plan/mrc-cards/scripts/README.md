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
| MRC-OPS-002 | [`MRC-OPS-002.ps1`](MRC-OPS-002.ps1) | [DCDIAG full domain controller health check](../ops/MRC-OPS-002.md) |
