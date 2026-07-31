<#
.SYNOPSIS
    Runs a full DCDIAG health check against one or more domain controllers and produces a structured report.

.DESCRIPTION
    Automates the check/report portion of MRC-OPS-002 -- DCDIAG full domain controller health check
    (weekly task, execution-plan/mrc-cards/ops/MRC-OPS-002.md).

    For each target domain controller, runs `dcdiag.exe /v` (verbose, all default tests), parses the
    per-test pass/fail/warning results out of the raw output, and emits both:
      - A PowerShell object per test result (pipeline output), for further filtering/export.
      - A combined human-readable report file at -OutputPath containing a summary table followed by
        the full raw dcdiag output per DC (for evidence/attachment purposes).

    This script is READ-ONLY. It never runs dcdiag with a repair switch (e.g. /fix, /recreatescobj)
    and never modifies AD, DNS, or any other system state. If dcdiag reports a failure, remediation is
    a separate, deliberate, documented action per the card's Procedure section -- not something this
    script performs.

.PARAMETER ComputerName
    One or more domain controller host names to check. Defaults to every domain controller in the
    current user's domain, discovered via the ActiveDirectory module (Get-ADDomainController -Filter *).
    If the ActiveDirectory module is not available and -ComputerName is not supplied, the script checks
    only the local host.

.PARAMETER OutputPath
    Path to write the combined report file. Defaults to
    .\reports\MRC-OPS-002_<yyyyMMdd-HHmmss>.txt (the reports folder is created if it does not exist).

.PARAMETER Comprehensive
    If set, adds /c (comprehensive -- includes non-default tests such as DcPromoReadiness) and /e
    (test all DCs in the enterprise, not just -ComputerName) to the dcdiag invocation. Off by default
    because /e ignores -ComputerName and /c takes noticeably longer; use for a periodic deep check
    rather than every weekly run if runtime is a concern.

.EXAMPLE
    .\MRC-OPS-002.ps1
    Discovers all domain controllers in the current domain and runs a standard verbose DCDIAG against
    each, writing the report to .\reports\MRC-OPS-002_<timestamp>.txt.

.EXAMPLE
    .\MRC-OPS-002.ps1 -ComputerName DC01,DC02 -OutputPath C:\Evidence\dcdiag-2026-08-03.txt
    Checks only DC01 and DC02 and writes the report to the specified evidence path.

.EXAMPLE
    .\MRC-OPS-002.ps1 -Comprehensive | Where-Object Result -eq 'Fail'
    Runs the comprehensive enterprise-wide check and pipes only the failed test results to the console.

.NOTES
    MRC ID     : MRC-OPS-002 -- DCDIAG full domain controller health check
    Card       : ../ops/MRC-OPS-002.md
    Frequency  : Weekly
    Baseline   : Windows Server / Active Directory (per AGENTS.md rule 8)
    Exit codes : 0 = all tests passed. 1 = one or more tests failed or warned, or a target was
                 unreachable. Non-zero exit lets this be wrapped in a scheduled task that alerts.

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
    [string] $OutputPath = ".\reports\MRC-OPS-002_$(Get-Date -Format 'yyyyMMdd-HHmmss').txt",

    [Parameter(Mandatory = $false)]
    [switch] $Comprehensive
)

$ErrorActionPreference = 'Stop'
$results = New-Object System.Collections.Generic.List[object]
$overallExitCode = 0

function Write-ReportLine {
    param([string] $Line)
    Add-Content -LiteralPath $OutputPath -Value $Line
}

# --- Resolve target DC list ---------------------------------------------------
if (-not $ComputerName) {
    $adModuleAvailable = Get-Module -ListAvailable -Name ActiveDirectory
    if ($adModuleAvailable) {
        try {
            Import-Module ActiveDirectory -ErrorAction Stop
            $ComputerName = (Get-ADDomainController -Filter *).HostName
        } catch {
            Write-Warning "Could not enumerate domain controllers via ActiveDirectory module ($($_.Exception.Message)). Falling back to local host."
            $ComputerName = @($env:COMPUTERNAME)
        }
    } else {
        Write-Warning "ActiveDirectory module not found and -ComputerName not supplied. Falling back to local host."
        $ComputerName = @($env:COMPUTERNAME)
    }
}

# --- Prepare output file -------------------------------------------------------
$outDir = Split-Path -Path $OutputPath -Parent
if ($outDir -and -not (Test-Path -LiteralPath $outDir)) {
    New-Item -ItemType Directory -Path $outDir -Force | Out-Null
}
New-Item -ItemType File -Path $OutputPath -Force | Out-Null

Write-ReportLine "MRC-OPS-002 -- DCDIAG full domain controller health check"
Write-ReportLine "Run timestamp : $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz')"
Write-ReportLine "Run by        : $env:USERDOMAIN\$env:USERNAME on $env:COMPUTERNAME"
Write-ReportLine "Targets       : $($ComputerName -join ', ')"
Write-ReportLine "Comprehensive : $($Comprehensive.IsPresent)"
Write-ReportLine ("=" * 78)
Write-ReportLine ""

$testResultPattern = '^\s*\.+\s+(?<dc>\S+)\s+(?<verdict>passed|failed)\s+test\s+(?<test>\S+)'
$warningPattern     = 'Warning:'

foreach ($dc in $ComputerName) {
    $dcTimestamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz'
    Write-ReportLine "--- Target: $dc ---"

    $dcdiagArgs = @("/s:$dc", "/v")
    if ($Comprehensive) { $dcdiagArgs += @("/c", "/e") }

    try {
        $rawOutput = & dcdiag.exe @dcdiagArgs 2>&1 | Out-String
    } catch {
        Write-Warning "dcdiag.exe failed to run against $dc`: $($_.Exception.Message)"
        $results.Add([pscustomobject]@{
            Timestamp = $dcTimestamp
            CheckName = 'DCDIAG-Invocation'
            Target    = $dc
            Result    = 'Fail'
            Detail    = "dcdiag.exe could not be executed against this target: $($_.Exception.Message)"
        })
        $overallExitCode = 1
        Write-ReportLine "  ERROR: dcdiag.exe could not be executed against this target."
        Write-ReportLine ""
        continue
    }

    $lines = $rawOutput -split "`r?`n"
    $matchedAnyTest = $false

    foreach ($line in $lines) {
        $m = [regex]::Match($line, $testResultPattern)
        if ($m.Success) {
            $matchedAnyTest = $true
            $verdict = if ($m.Groups['verdict'].Value -eq 'passed') { 'Pass' } else { 'Fail' }
            $results.Add([pscustomobject]@{
                Timestamp = $dcTimestamp
                CheckName = $m.Groups['test'].Value
                Target    = $m.Groups['dc'].Value
                Result    = $verdict
                Detail    = $line.Trim()
            })
            if ($verdict -eq 'Fail') { $overallExitCode = 1 }
        } elseif ($line -match $warningPattern) {
            $results.Add([pscustomobject]@{
                Timestamp = $dcTimestamp
                CheckName = 'Warning'
                Target    = $dc
                Result    = 'Warning'
                Detail    = $line.Trim()
            })
            if ($overallExitCode -eq 0) { $overallExitCode = 1 }
        }
    }

    if (-not $matchedAnyTest) {
        Write-Warning "No recognizable dcdiag test-result lines were found for $dc. The raw output below has been preserved for manual review -- do not assume this target passed."
        $results.Add([pscustomobject]@{
            Timestamp = $dcTimestamp
            CheckName = 'DCDIAG-Parse'
            Target    = $dc
            Result    = 'Warning'
            Detail    = 'No test-result lines matched the expected dcdiag output format; raw output preserved in report file for manual review.'
        })
        if ($overallExitCode -eq 0) { $overallExitCode = 1 }
    }

    Write-ReportLine $rawOutput
    Write-ReportLine ""
}

# --- Summary table in the report file ------------------------------------------
Write-ReportLine ("=" * 78)
Write-ReportLine "SUMMARY"
Write-ReportLine ("=" * 78)
$summaryLines = $results | Sort-Object Target, CheckName |
    Format-Table Timestamp, Target, CheckName, Result -AutoSize | Out-String
Write-ReportLine $summaryLines

$failCount = ($results | Where-Object Result -eq 'Fail').Count
$warnCount = ($results | Where-Object Result -eq 'Warning').Count
$passCount = ($results | Where-Object Result -eq 'Pass').Count
Write-ReportLine "Totals: $passCount passed, $failCount failed, $warnCount warning(s) across $($ComputerName.Count) target(s)."

Write-Host "DCDIAG check complete. $passCount passed / $failCount failed / $warnCount warning(s). Report: $OutputPath"

# --- Pipeline output (structured objects) --------------------------------------
$results

exit $overallExitCode
