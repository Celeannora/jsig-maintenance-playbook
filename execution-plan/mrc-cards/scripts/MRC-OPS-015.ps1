<#
.SYNOPSIS
    Checks Exchange mail transport queues for stuck/retrying messages and verifies the Transport
    service is running.

.DESCRIPTION
    Automates MRC-OPS-015 -- Mail queue / transport health check (stuck-queue check) (daily task,
    execution-plan/mrc-cards/ops/MRC-OPS-015.md).

    Must be run from an Exchange Management Shell session. For every transport server (or the one
    specified via -Server), the script:
      - Confirms the Microsoft Exchange Transport service (MSExchangeTransport) is Running.
      - Enumerates transport queues via Get-Queue, flagging a queue in the Retry status with a
        message count above -RetryQueueWarningCount (default 25) as Warning, and any queue in the
        Suspended status (which never clears on its own and requires manual intervention) as Fail.

    This script is READ-ONLY. It never resumes, suspends, or removes a queue, nor restarts the
    Transport service. Any remediation is a deliberate action taken by a human after reviewing this
    report.

.PARAMETER Server
    Transport server(s) to check. Defaults to every Hub Transport/Mailbox server with the Transport
    role in the organization.

.PARAMETER RetryQueueWarningCount
    Message count in a single Retry-status queue above which that queue is flagged Warning.
    Default: 25.

.PARAMETER OutputPath
    Path to write the combined report file. Defaults to
    .\reports\MRC-OPS-015_<yyyyMMdd-HHmmss>.txt (created if it does not exist).

.EXAMPLE
    .\MRC-OPS-015.ps1
    Checks transport service state and queue health on every transport server in the organization.

.NOTES
    MRC ID     : MRC-OPS-015 -- Mail queue / transport health check (stuck-queue check)
    Card       : ../ops/MRC-OPS-015.md
    Frequency  : Daily
    Baseline   : Exchange Server (Get-Queue, Transport service) (per AGENTS.md rule 8)
    Requires   : Must be run in (or via a remote session to) Exchange Management Shell.
    Exit codes : 0 = Transport service Running and no queue in Retry above threshold or Suspended on
                 any server. 1 = the Transport service is stopped, a queue exceeds threshold, a queue
                 is Suspended, or a server could not be queried.

    SAFETY DISCLAIMER: Provided as a starting point for the stated baseline environment. Not
    validated against a live production system in this repository. A human must review this script's
    logic and test it in a non-production environment before operational use, per the organization's
    own change-control process. This script never modifies queue state or restarts any service.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string[]] $Server,

    [Parameter(Mandatory = $false)]
    [int] $RetryQueueWarningCount = 25,

    [Parameter(Mandatory = $false)]
    [string] $OutputPath = ".\reports\MRC-OPS-015_$(Get-Date -Format 'yyyyMMdd-HHmmss').txt"
)

$ErrorActionPreference = 'Stop'
$results = New-Object System.Collections.Generic.List[object]
$overallExitCode = 0

function Write-ReportLine {
    param([string] $Line)
    Add-Content -LiteralPath $OutputPath -Value $Line
}

if (-not (Get-Command Get-Queue -ErrorAction SilentlyContinue)) {
    throw "Get-Queue is not available. Run this script from an Exchange Management Shell session (or a session with the Exchange management tools/remote PowerShell session loaded)."
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

Write-ReportLine "MRC-OPS-015 -- Mail queue / transport health check (stuck-queue check)"
Write-ReportLine "Run timestamp : $ts"
Write-ReportLine "Run by        : $env:USERDOMAIN\$env:USERNAME on $env:COMPUTERNAME"
Write-ReportLine "Targets       : $($Server -join ', ')"
Write-ReportLine "Retry queue Warning threshold: $RetryQueueWarningCount message(s)"
Write-ReportLine ("=" * 78)
Write-ReportLine ""

foreach ($srv in $Server) {
    Write-ReportLine "--- Target: $srv ---"

    # --- Transport service state ---
    try {
        $svc = Get-Service -ComputerName $srv -Name MSExchangeTransport -ErrorAction Stop
        $svcResult = if ($svc.Status -eq 'Running') { 'Pass' } else { 'Fail' }
        if ($svcResult -eq 'Fail') { $overallExitCode = 1 }
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'Transport-Service'; Target = $srv
            Result = $svcResult; Detail = "Status=$($svc.Status)"
        })
        Write-ReportLine "MSExchangeTransport on $srv`: $($svc.Status) ($svcResult)"
    } catch {
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'Transport-Service'; Target = $srv
            Result = 'Fail'; Detail = "Could not query service: $($_.Exception.Message)"
        })
        $overallExitCode = 1
        Write-ReportLine "ERROR: could not query MSExchangeTransport on $srv`: $($_.Exception.Message)"
    }

    # --- Queue health ---
    try {
        $queues = Get-Queue -Server $srv -ErrorAction Stop
        foreach ($q in $queues) {
            if ($q.Status -eq 'Suspended') {
                $qResult = 'Fail'
            } elseif ($q.Status -eq 'Retry' -and $q.MessageCount -gt $RetryQueueWarningCount) {
                $qResult = 'Warning'
            } else {
                $qResult = 'Pass'
            }
            if ($qResult -eq 'Fail') { $overallExitCode = 1 }
            elseif ($qResult -eq 'Warning' -and $overallExitCode -eq 0) { $overallExitCode = 1 }
            $results.Add([pscustomobject]@{
                Timestamp = $ts; CheckName = 'Queue-Health'; Target = "$srv/$($q.Identity)"
                Result = $qResult; Detail = "Status=$($q.Status), MessageCount=$($q.MessageCount), NextHopDomain=$($q.NextHopDomain)"
            })
            Write-ReportLine "Queue $($q.Identity) on $srv`: Status=$($q.Status), Count=$($q.MessageCount) ($qResult)"
        }
    } catch {
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'Queue-Health'; Target = $srv
            Result = 'Fail'; Detail = "Could not query queues: $($_.Exception.Message)"
        })
        $overallExitCode = 1
        Write-ReportLine "ERROR: could not query queues on $srv`: $($_.Exception.Message)"
    }

    Write-ReportLine ""
}

Write-ReportLine ("=" * 78)
Write-ReportLine "SUMMARY"
Write-ReportLine ("=" * 78)
$summaryLines = $results | Sort-Object Target, CheckName |
    Format-Table Timestamp, Target, CheckName, Result, Detail -AutoSize | Out-String
Write-ReportLine $summaryLines

$failCount = ($results | Where-Object Result -eq 'Fail').Count
$warnCount = ($results | Where-Object Result -eq 'Warning').Count
$passCount = ($results | Where-Object Result -eq 'Pass').Count
Write-ReportLine "Totals: $passCount passed, $failCount failed, $warnCount warning(s) across $($Server.Count) target(s)."

Write-Host "Mail queue/transport health check complete. $passCount passed / $failCount failed / $warnCount warning(s). Report: $OutputPath"

$results
exit $overallExitCode
