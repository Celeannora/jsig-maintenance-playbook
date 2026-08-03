<#
.SYNOPSIS
    Checks WSUS synchronization health and outstanding functional (non-security) update
    backlog on a WSUS server.

.DESCRIPTION
    Automates MRC-OPS-029 -- Functional patching beyond security patches (feature/driver
    updates) (monthly task, execution-plan/mrc-cards/ops/MRC-OPS-029.md).

    Uses the UpdateServices PowerShell module (installed with the WSUS server role, or the
    WSUS RSAT feature on an admin workstation) to:
      1. Connect to the WSUS server via Get-WsusServer.
      2. Check the last synchronization result and age via
         (Get-WsusServer).GetSubscription().GetLastSynchronizationInfo().
      3. Query approved updates in WSUS's "WSUS" classification bucket (the classification
         WSUS uses for updates outside Critical/Security -- this bucket is where feature
         packs, driver updates, and update rollups typically land) with a Failed or Needed
         installation status via Get-WsusUpdate, to surface the functional-patching backlog
         this task exists to track.

    This script is READ-ONLY. It never approves, declines, or deploys any update, and never
    changes WSUS server or synchronization configuration.

.PARAMETER WsusServer
    WSUS server name to connect to. Defaults to the local computer ($env:COMPUTERNAME).

.PARAMETER PortNumber
    WSUS server port. Defaults to 8530 (standard HTTP WSUS port). Use 8531 with -UseSSL for
    the standard HTTPS WSUS port.

.PARAMETER UseSSL
    Connect over HTTPS. Default: disabled ($false).

.PARAMETER MaxSyncAgeDays
    Flag as Warning if the last successful synchronization is older than this many days.
    Default: 7.

.PARAMETER FailedOrNeededThreshold
    Flag as Warning if the count of approved, Failed-or-Needed updates in the non-Critical/
    non-Security ("WSUS") classification bucket is at or above this number. Default: 1 (any
    outstanding functional-update backlog is reported).

.PARAMETER OutputPath
    Path to write the combined report file. Defaults to
    .\reports\MRC-OPS-029_<yyyyMMdd-HHmmss>.txt (created if it does not exist).

.EXAMPLE
    .\MRC-OPS-029.ps1 -WsusServer wsus01.example.mil -PortNumber 8531 -UseSSL
    Checks synchronization health and the functional-update backlog on wsus01 over HTTPS.

.NOTES
    MRC ID     : MRC-OPS-029 -- Functional patching beyond security patches (feature/driver updates)
    Card       : ../ops/MRC-OPS-029.md
    Frequency  : Monthly
    Baseline   : Windows Server (General) / WSUS (Windows Server Update Services)
    Requires   : The UpdateServices PowerShell module (present on any WSUS server, or via the
                 "WSUS RSAT" Windows feature on an admin workstation) and network access to the
                 WSUS server's configured port.
    Exit codes : 0 = server connected, last sync succeeded and is within -MaxSyncAgeDays, and
                 the functional-update backlog is below -FailedOrNeededThreshold. 1 = any
                 check failed, the sync is stale/unsuccessful, the backlog threshold was met
                 or exceeded, or the server could not be queried.

    SAFETY DISCLAIMER: Provided as a starting point for the stated baseline environment. Not
    validated against a live production system in this repository. A human must review this
    script's logic and test it in a non-production environment before operational use, per the
    organization's own change-control process. This script never approves, declines, deploys,
    or otherwise modifies any update or WSUS configuration.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string] $WsusServer = $env:COMPUTERNAME,

    [Parameter(Mandatory = $false)]
    [int] $PortNumber = 8530,

    [Parameter(Mandatory = $false)]
    [switch] $UseSSL,

    [Parameter(Mandatory = $false)]
    [int] $MaxSyncAgeDays = 7,

    [Parameter(Mandatory = $false)]
    [int] $FailedOrNeededThreshold = 1,

    [Parameter(Mandatory = $false)]
    [string] $OutputPath = ".\reports\MRC-OPS-029_$(Get-Date -Format 'yyyyMMdd-HHmmss').txt"
)

$ErrorActionPreference = 'Stop'
$results = New-Object System.Collections.Generic.List[object]
$overallExitCode = 0

function Write-ReportLine {
    param([string] $Line)
    Add-Content -LiteralPath $OutputPath -Value $Line
}

$outDir = Split-Path -Path $OutputPath -Parent
if ($outDir -and -not (Test-Path -LiteralPath $outDir)) {
    New-Item -ItemType Directory -Path $outDir -Force | Out-Null
}
New-Item -ItemType File -Path $OutputPath -Force | Out-Null

$ts = Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz'

Write-ReportLine "MRC-OPS-029 -- Functional patching beyond security patches (feature/driver updates)"
Write-ReportLine "Run timestamp : $ts"
Write-ReportLine "Run by        : $env:USERDOMAIN\$env:USERNAME on $env:COMPUTERNAME"
Write-ReportLine "WSUS server   : $WsusServer`:$PortNumber (SSL=$($UseSSL.IsPresent))"
Write-ReportLine ("=" * 78)
Write-ReportLine ""

try {
    $wsus = Get-WsusServer -Name $WsusServer -PortNumber $PortNumber -UseSsl:$UseSSL.IsPresent

    # --- Check 1: last synchronization result and age ---
    try {
        $syncInfo = $wsus.GetSubscription().GetLastSynchronizationInfo()
        $syncAgeDays = if ($syncInfo.EndTime) { ((Get-Date) - $syncInfo.EndTime).TotalDays } else { [double]::PositiveInfinity }
        if ($syncInfo.Result -ne 'Succeeded') {
            $overallExitCode = 1
            $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'WSUS-Sync'; Target = $WsusServer; Result = 'Fail'; Detail = "Last synchronization result=$($syncInfo.Result), ended $($syncInfo.EndTime)" })
            Write-ReportLine "Sync result=$($syncInfo.Result) (Fail), last ended $($syncInfo.EndTime)"
        } elseif ($syncAgeDays -gt $MaxSyncAgeDays) {
            $overallExitCode = 1
            $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'WSUS-Sync'; Target = $WsusServer; Result = 'Warning'; Detail = "Last successful sync was $([math]::Round($syncAgeDays,1)) days ago (threshold $MaxSyncAgeDays days), ended $($syncInfo.EndTime)" })
            Write-ReportLine "Sync succeeded but is $([math]::Round($syncAgeDays,1)) days old, exceeds $MaxSyncAgeDays-day threshold (Warning)"
        } else {
            $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'WSUS-Sync'; Target = $WsusServer; Result = 'Pass'; Detail = "Last sync succeeded $([math]::Round($syncAgeDays,1)) days ago, ended $($syncInfo.EndTime)" })
            Write-ReportLine "Sync result=Succeeded, $([math]::Round($syncAgeDays,1)) days ago (Pass)"
        }
    } catch {
        $overallExitCode = 1
        $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'WSUS-Sync'; Target = $WsusServer; Result = 'Fail'; Detail = "Could not read synchronization info: $($_.Exception.Message)" })
        Write-ReportLine "ERROR: could not read synchronization info: $($_.Exception.Message)"
    }
    Write-ReportLine ""

    # --- Check 2: functional/feature update backlog (non-Critical/Security "WSUS" classification) ---
    try {
        $backlog = @(Get-WsusUpdate -UpdateServer $wsus -Classification WSUS -Approval Approved -Status FailedOrNeeded)
        if ($backlog.Count -ge $FailedOrNeededThreshold) {
            $overallExitCode = 1
            $titles = ($backlog | Select-Object -First 10 -ExpandProperty Title) -join '; '
            $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'WSUS-FunctionalBacklog'; Target = $WsusServer; Result = 'Warning'; Detail = "$($backlog.Count) approved non-Critical/Security update(s) failed or needed (threshold $FailedOrNeededThreshold). Examples: $titles" })
            Write-ReportLine "Functional-update backlog: $($backlog.Count) update(s) failed or needed (Warning)"
            foreach ($u in $backlog) { Write-ReportLine "  - $($u.Title)" }
        } else {
            $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'WSUS-FunctionalBacklog'; Target = $WsusServer; Result = 'Pass'; Detail = "$($backlog.Count) approved non-Critical/Security update(s) failed or needed (below threshold $FailedOrNeededThreshold)" })
            Write-ReportLine "Functional-update backlog: $($backlog.Count) update(s) failed or needed (Pass)"
        }
    } catch {
        $overallExitCode = 1
        $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'WSUS-FunctionalBacklog'; Target = $WsusServer; Result = 'Fail'; Detail = "Could not query functional-update backlog: $($_.Exception.Message)" })
        Write-ReportLine "ERROR: could not query functional-update backlog: $($_.Exception.Message)"
    }
} catch {
    $overallExitCode = 1
    $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'WSUS-Connect'; Target = $WsusServer; Result = 'Fail'; Detail = "Could not connect to WSUS server: $($_.Exception.Message)" })
    Write-ReportLine "ERROR: could not connect to WSUS server $WsusServer`:$PortNumber`: $($_.Exception.Message)"
}

Write-ReportLine ""
Write-ReportLine ("=" * 78)
Write-ReportLine "SUMMARY"
Write-ReportLine ("=" * 78)
$summaryLines = $results | Format-Table Timestamp, Target, CheckName, Result, Detail -AutoSize | Out-String
Write-ReportLine $summaryLines

$failCount = ($results | Where-Object { $_.Result -in @('Fail', 'Warning') }).Count
$passCount = ($results | Where-Object Result -eq 'Pass').Count
Write-ReportLine "Totals: $passCount passed, $failCount failed/warning."

Write-Host "WSUS functional-patching check complete. $passCount passed / $failCount failed/warning. Report: $OutputPath"

$results
exit $overallExitCode
