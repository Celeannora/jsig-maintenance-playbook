<#
.SYNOPSIS
    Summarizes Exchange message tracking logs for mail-flow troubleshooting review.

.DESCRIPTION
    Automates the data-collection portion of MRC-OPS-020 -- Message tracking log review
    (mail-flow troubleshooting) (weekly task, execution-plan/mrc-cards/ops/MRC-OPS-020.md).

    Must be run from an Exchange Management Shell session. For every transport server (or the
    one(s) specified via -Server), the script queries Get-MessageTrackingLog over the lookback
    window (default the past 7 days) and produces:
      - A count of messages by EventId (e.g. DELIVER, FAIL, DEFER, SEND) as a mail-flow-volume
        summary.
      - The full list of FAIL events with Recipients and a RecipientStatus/error detail, since
        these are the messages a mail-flow troubleshooting review is specifically looking for.
      - A flag (Warning) if the FAIL count for the window exceeds -FailCountWarning (default 50)
        as a possible indicator of a broader delivery problem worth investigating, rather than
        isolated one-off bounces.

    This script does NOT diagnose *why* any individual message failed -- it surfaces the raw FAIL
    events and volume trend so a human reviewer can investigate specific cases and any broader
    pattern.

    This script is READ-ONLY. It only reads message tracking logs; it never resends, redirects, or
    deletes a message, and it never modifies the message tracking log configuration.

.PARAMETER Server
    Transport server(s) to query. Defaults to every server with the Transport role, returned by
    Get-TransportServer.

.PARAMETER LookbackDays
    Number of days of message tracking log history to query. Default: 7.

.PARAMETER FailCountWarning
    Total FAIL event count across all targets above which the cycle is flagged Warning. Default: 50.

.PARAMETER OutputPath
    Path to write the combined report file. Defaults to
    .\reports\MRC-OPS-020_<yyyyMMdd-HHmmss>.txt (created if it does not exist).

.EXAMPLE
    .\MRC-OPS-020.ps1
    Summarizes the past 7 days of message tracking logs across every transport server.

.NOTES
    MRC ID     : MRC-OPS-020 -- Message tracking log review (mail-flow troubleshooting)
    Card       : ../ops/MRC-OPS-020.md
    Frequency  : Weekly
    Baseline   : Exchange Server (Get-MessageTrackingLog) (per AGENTS.md rule 8)
    Requires   : Must be run in (or via a remote session to) Exchange Management Shell.
    Exit codes : 0 = FAIL event count within threshold on every target. 1 = FAIL count exceeds
                 threshold, or a target could not be queried. A 0 exit code does not mean no
                 individual FAIL events exist -- the report always lists every FAIL event found for
                 human review regardless of the total count.

    SAFETY DISCLAIMER: Provided as a starting point for the stated baseline environment. Not
    validated against a live production system in this repository. A human must review this script's
    logic and test it in a non-production environment before operational use, per the organization's
    own change-control process. This script never modifies any message or log configuration.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string[]] $Server,

    [Parameter(Mandatory = $false)]
    [int] $LookbackDays = 7,

    [Parameter(Mandatory = $false)]
    [int] $FailCountWarning = 50,

    [Parameter(Mandatory = $false)]
    [string] $OutputPath = ".\reports\MRC-OPS-020_$(Get-Date -Format 'yyyyMMdd-HHmmss').txt"
)

$ErrorActionPreference = 'Stop'
$results = New-Object System.Collections.Generic.List[object]
$overallExitCode = 0
$totalFailCount = 0

function Write-ReportLine {
    param([string] $Line)
    Add-Content -LiteralPath $OutputPath -Value $Line
}

if (-not (Get-Command Get-MessageTrackingLog -ErrorAction SilentlyContinue)) {
    throw "Get-MessageTrackingLog is not available. Run this script from an Exchange Management Shell session (or a session with the Exchange management tools/remote PowerShell session loaded)."
}

if (-not $Server) {
    try {
        $Server = (Get-TransportServer -ErrorAction Stop).Name
    } catch {
        Write-Warning "Could not enumerate transport servers via Get-TransportServer ($($_.Exception.Message)). Falling back to local host."
        $Server = @($env:COMPUTERNAME)
    }
}

$outDir = Split-Path -Path $OutputPath -Parent
if ($outDir -and -not (Test-Path -LiteralPath $outDir)) {
    New-Item -ItemType Directory -Path $outDir -Force | Out-Null
}
New-Item -ItemType File -Path $OutputPath -Force | Out-Null

$ts = Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz'
$startDate = (Get-Date).AddDays(-$LookbackDays)

Write-ReportLine "MRC-OPS-020 -- Message tracking log review (mail-flow troubleshooting)"
Write-ReportLine "Run timestamp : $ts"
Write-ReportLine "Run by        : $env:USERDOMAIN\$env:USERNAME on $env:COMPUTERNAME"
Write-ReportLine "Lookback      : $LookbackDays day(s) (since $startDate)"
Write-ReportLine "FAIL count Warning threshold (total across targets): $FailCountWarning"
Write-ReportLine ("=" * 78)
Write-ReportLine ""

foreach ($srv in $Server) {
    Write-ReportLine "--- Target: $srv ---"
    try {
        $logs = Get-MessageTrackingLog -Server $srv -Start $startDate -ResultSize Unlimited -ErrorAction Stop
        $byEvent = $logs | Group-Object EventId | Sort-Object Count -Descending
        Write-ReportLine "Event volume summary:"
        foreach ($grp in $byEvent) {
            Write-ReportLine "  $($grp.Name): $($grp.Count)"
            $results.Add([pscustomobject]@{
                Timestamp = $ts; CheckName = "EventVolume-$($grp.Name)"; Target = $srv
                Result = 'Pass'; Detail = "$($grp.Count) event(s) in lookback window"
            })
        }

        $failEvents = $logs | Where-Object { $_.EventId -eq 'FAIL' }
        $failCount = $failEvents.Count
        $totalFailCount += $failCount
        Write-ReportLine ""
        Write-ReportLine "FAIL events on $srv`: $failCount"
        foreach ($fail in $failEvents) {
            Write-ReportLine "  $($fail.Timestamp) | Recipients=$($fail.Recipients -join ',') | Status=$($fail.RecipientStatus -join ',')"
        }
        $failResult = if ($failCount -gt $FailCountWarning) { 'Warning' } else { 'Pass' }
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'FAIL-Count'; Target = $srv
            Result = $failResult; Detail = "$failCount FAIL event(s) in lookback window"
        })
    } catch {
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'MessageTrackingLog'; Target = $srv
            Result = 'Fail'; Detail = "Could not query message tracking log: $($_.Exception.Message)"
        })
        $overallExitCode = 1
        Write-ReportLine "ERROR: could not query message tracking log on $srv`: $($_.Exception.Message)"
    }
    Write-ReportLine ""
}

if ($totalFailCount -gt $FailCountWarning) { $overallExitCode = 1 }

Write-ReportLine ("=" * 78)
Write-ReportLine "SUMMARY"
Write-ReportLine ("=" * 78)
Write-ReportLine "Total FAIL events across all targets: $totalFailCount (Warning threshold: $FailCountWarning)"
$summaryLines = $results | Format-Table Timestamp, Target, CheckName, Result, Detail -AutoSize | Out-String
Write-ReportLine $summaryLines

$failCheckCount = ($results | Where-Object Result -eq 'Fail').Count
$warnCount = ($results | Where-Object Result -eq 'Warning').Count
$passCount = ($results | Where-Object Result -eq 'Pass').Count
Write-ReportLine "Totals: $passCount passed, $failCheckCount failed, $warnCount warning(s)."

Write-Host "Message tracking log review complete. Total FAIL events: $totalFailCount. Report: $OutputPath"

$results
exit $overallExitCode
