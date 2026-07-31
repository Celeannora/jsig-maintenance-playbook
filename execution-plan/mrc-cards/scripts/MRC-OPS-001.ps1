<#
.SYNOPSIS
    Runs an Active Directory replication health check (repadmin /replsummary) and produces a structured report.

.DESCRIPTION
    Automates the check/report portion of MRC-OPS-001 -- AD replication health check
    (daily task, execution-plan/mrc-cards/ops/MRC-OPS-001.md).

    Runs `repadmin.exe /replsummary` (optionally scoped to specific servers), parses the per-DC
    outbound ("Source DSA") and inbound ("Destination DSA") replication summary rows out of the raw
    output, and emits both:
      - A PowerShell object per DC/direction (pipeline output), for further filtering/export.
      - A combined human-readable report file at -OutputPath containing a summary table followed by
        the full raw repadmin output (for evidence/attachment purposes).

    For any DC with one or more replication failures, the script additionally runs
    `repadmin /showrepl <DC>` against that DC and appends the verbose per-partner output to the report,
    to save the admin a manual follow-up step when there is already something to investigate.

    This script is READ-ONLY. It never runs repadmin with a state-changing switch (e.g. /replicate,
    /removelingeringobjects, /removeref, /options) and never forces replication or modifies AD state.
    If repadmin reports a failure, remediation is a separate, deliberate, documented action per the
    card's Procedure section -- not something this script performs.

.PARAMETER ComputerName
    One or more domain controller (or site) names to scope the replication summary to, passed as
    successive `repadmin /replsummary <name>` invocations. If omitted, runs a single
    `repadmin /replsummary` with no scope argument, which defaults to the entire enterprise ("*") --
    this is the normal daily-check behavior and covers every DC without needing to enumerate them.

.PARAMETER OutputPath
    Path to write the combined report file. Defaults to
    .\reports\MRC-OPS-001_<yyyyMMdd-HHmmss>.txt (the reports folder is created if it does not exist).

.PARAMETER MaxDeltaHours
    Largest-replication-delta threshold, in hours. Any Source/Destination DSA row whose "largest delta"
    exceeds this value is flagged as a Warning even if its failure count is 0 -- a link that has gone
    quiet without erroring is still worth a look. Default: 24.

.EXAMPLE
    .\MRC-OPS-001.ps1
    Runs an enterprise-wide replication summary and writes the report to
    .\reports\MRC-OPS-001_<timestamp>.txt.

.EXAMPLE
    .\MRC-OPS-001.ps1 -ComputerName DC01,DC02 -OutputPath C:\Evidence\repadmin-2026-08-03.txt
    Scopes the check to DC01 and DC02 only and writes the report to the specified evidence path.

.EXAMPLE
    .\MRC-OPS-001.ps1 -MaxDeltaHours 12 | Where-Object Result -ne 'Pass'
    Runs the default enterprise-wide check with a tighter 12-hour staleness threshold and pipes only
    non-passing rows to the console.

.NOTES
    MRC ID     : MRC-OPS-001 -- AD replication health check (repadmin /replsummary, /showrepl)
    Card       : ../ops/MRC-OPS-001.md
    Frequency  : Daily
    Baseline   : Windows Server / Active Directory (per AGENTS.md rule 8)
    Exit codes : 0 = all rows passed with no staleness warnings. 1 = one or more replication failures,
                 stale links, or repadmin could not be run. Non-zero exit lets this be wrapped in a
                 scheduled task that alerts.

    SAFETY DISCLAIMER: Provided as a starting point for the stated baseline environment. Not
    validated against a live production system in this repository. A human must review this script's
    logic and test it in a non-production environment before operational use, per the organization's
    own change-control process.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string[]] $ComputerName,

    [Parameter(Mandatory = $false)]
    [string] $OutputPath = ".\reports\MRC-OPS-001_$(Get-Date -Format 'yyyyMMdd-HHmmss').txt",

    [Parameter(Mandatory = $false)]
    [double] $MaxDeltaHours = 24
)

$ErrorActionPreference = 'Stop'
$results = New-Object System.Collections.Generic.List[object]
$overallExitCode = 0
$scopes = if ($ComputerName) { $ComputerName } else { @('*') }

function Write-ReportLine {
    param([string] $Line)
    Add-Content -LiteralPath $OutputPath -Value $Line
}

function ConvertTo-DeltaHours {
    param([string] $Delta)
    # repadmin formats the largest-delta column as HHh:MMm:SSs, e.g. "05h:23m:11s" or "1234h:05m:00s".
    $m = [regex]::Match($Delta, '^(?<h>\d+)h:(?<m>\d+)m:(?<s>\d+)s$')
    if (-not $m.Success) { return $null }
    return [double]$m.Groups['h'].Value + ([double]$m.Groups['m'].Value / 60.0) + ([double]$m.Groups['s'].Value / 3600.0)
}

# --- Prepare output file -------------------------------------------------------
$outDir = Split-Path -Path $OutputPath -Parent
if ($outDir -and -not (Test-Path -LiteralPath $outDir)) {
    New-Item -ItemType Directory -Path $outDir -Force | Out-Null
}
New-Item -ItemType File -Path $OutputPath -Force | Out-Null

Write-ReportLine "MRC-OPS-001 -- AD replication health check (repadmin /replsummary)"
Write-ReportLine "Run timestamp   : $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz')"
Write-ReportLine "Run by          : $env:USERDOMAIN\$env:USERNAME on $env:COMPUTERNAME"
Write-ReportLine "Scope           : $($scopes -join ', ')"
Write-ReportLine "MaxDeltaHours   : $MaxDeltaHours"
Write-ReportLine ("=" * 78)
Write-ReportLine ""

# Matches a Source/Destination DSA data row, e.g.:
#   DC01                 05h:23m:11s    0 /   5    0
#   DC02                 10h:12m:00s    2 /   5   40   (1722) The RPC server is unavailable.
$rowPattern = '^\s*(?<dc>\S+)\s+(?<delta>\d+h:\d{2}m:\d{2}s)\s+(?<fails>\d+)\s*/\s*(?<total>\d+)\s+(?<pct>\d+)\s*(?<error>.*)$'
$failedDCs = New-Object System.Collections.Generic.HashSet[string]

foreach ($scope in $scopes) {
    $scopeTimestamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz'
    Write-ReportLine "--- Scope: $scope ---"

    try {
        $rawOutput = & repadmin.exe /replsummary $scope 2>&1 | Out-String
    } catch {
        Write-Warning "repadmin.exe failed to run for scope '$scope': $($_.Exception.Message)"
        $results.Add([pscustomobject]@{
            Timestamp = $scopeTimestamp
            CheckName = 'Repadmin-Invocation'
            Target    = $scope
            Result    = 'Fail'
            Detail    = "repadmin.exe /replsummary could not be executed for this scope: $($_.Exception.Message)"
        })
        $overallExitCode = 1
        Write-ReportLine "  ERROR: repadmin.exe could not be executed for this scope."
        Write-ReportLine ""
        continue
    }

    $lines = $rawOutput -split "`r?`n"
    $section = $null
    $matchedAnyRow = $false

    foreach ($line in $lines) {
        if ($line -match 'Source DSA') { $section = 'Outbound'; continue }
        if ($line -match 'Destination DSA') { $section = 'Inbound'; continue }
        if (-not $section) { continue }

        $m = [regex]::Match($line, $rowPattern)
        if (-not $m.Success) { continue }
        $matchedAnyRow = $true

        $dc = $m.Groups['dc'].Value
        $fails = [int]$m.Groups['fails'].Value
        $total = [int]$m.Groups['total'].Value
        $errorText = $m.Groups['error'].Value.Trim()
        $deltaHours = ConvertTo-DeltaHours -Delta $m.Groups['delta'].Value

        $verdict = 'Pass'
        if ($fails -gt 0) {
            $verdict = 'Fail'
            [void]$failedDCs.Add($dc)
        } elseif ($deltaHours -ne $null -and $deltaHours -gt $MaxDeltaHours) {
            $verdict = 'Warning'
        }

        $detail = "delta=$($m.Groups['delta'].Value); fails=$fails/$total"
        if ($errorText) { $detail += "; error=$errorText" }

        $results.Add([pscustomobject]@{
            Timestamp = $scopeTimestamp
            CheckName = "Replication-$section"
            Target    = $dc
            Result    = $verdict
            Detail    = $detail
        })
        if ($verdict -ne 'Pass' -and $overallExitCode -eq 0) { $overallExitCode = 1 }
    }

    if (-not $matchedAnyRow) {
        Write-Warning "No recognizable repadmin summary rows were found for scope '$scope'. The raw output below has been preserved for manual review -- do not assume this scope passed."
        $results.Add([pscustomobject]@{
            Timestamp = $scopeTimestamp
            CheckName = 'Repadmin-Parse'
            Target    = $scope
            Result    = 'Warning'
            Detail    = 'No summary rows matched the expected repadmin output format; raw output preserved in report file for manual review.'
        })
        if ($overallExitCode -eq 0) { $overallExitCode = 1 }
    }

    Write-ReportLine $rawOutput
    Write-ReportLine ""
}

# --- Verbose drill-down for any DC with a failure ------------------------------
if ($failedDCs.Count -gt 0) {
    Write-ReportLine ("=" * 78)
    Write-ReportLine "VERBOSE /showrepl OUTPUT FOR FAILING DCs"
    Write-ReportLine ("=" * 78)
    foreach ($dc in $failedDCs) {
        Write-ReportLine "--- /showrepl $dc ---"
        try {
            $showreplOutput = & repadmin.exe /showrepl $dc 2>&1 | Out-String
        } catch {
            $showreplOutput = "repadmin /showrepl could not be executed for $dc`: $($_.Exception.Message)"
        }
        Write-ReportLine $showreplOutput
        Write-ReportLine ""
    }
}

# --- Summary table in the report file ------------------------------------------
Write-ReportLine ("=" * 78)
Write-ReportLine "SUMMARY"
Write-ReportLine ("=" * 78)
$summaryLines = $results | Sort-Object Target, CheckName |
    Format-Table Timestamp, Target, CheckName, Result, Detail -AutoSize | Out-String
Write-ReportLine $summaryLines

$failCount = ($results | Where-Object Result -eq 'Fail').Count
$warnCount = ($results | Where-Object Result -eq 'Warning').Count
$passCount = ($results | Where-Object Result -eq 'Pass').Count
Write-ReportLine "Totals: $passCount passed, $failCount failed, $warnCount warning(s) across $($scopes.Count) scope(s)."

Write-Host "Repadmin replication check complete. $passCount passed / $failCount failed / $warnCount warning(s). Report: $OutputPath"

# --- Pipeline output (structured objects) --------------------------------------
$results

exit $overallExitCode
