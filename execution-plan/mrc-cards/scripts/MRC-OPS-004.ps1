<#
.SYNOPSIS
    Checks SYSVOL/DFSR replication health across domain controllers and produces a structured report.

.DESCRIPTION
    Automates the check/report portion of MRC-OPS-004 -- SYSVOL/DFSR replication health check
    (weekly task, execution-plan/mrc-cards/ops/MRC-OPS-004.md).

    For each target domain controller (defaults to every DC in the domain), the script:
      - Runs `dfsrdiag.exe replicationstate` and captures whether any replication group shows a
        non-idle (i.e. actively backlogged/error) state for longer than expected.
      - Runs `dfsrdiag.exe backlog` for the SYSVOL Share replication group between this DC and its
        replication partners and records the reported backlog file count.
      - Reports the DFS Replication service (DFSR) status.
      - Flags Fail when the DFSR service is stopped, or backlog count exceeds -MaxBacklogFiles
        (default 50). Flags Warning for smaller non-zero backlog counts (potential transient lag).

    This script is READ-ONLY. It never forces a resync, changes replication schedules, or restarts the
    DFSR service. Any remediation action is a separate, deliberate, documented action per the card's
    Procedure section.

.PARAMETER ComputerName
    One or more domain controller host names to check. Defaults to every domain controller in the
    current user's domain, discovered via the ActiveDirectory module. If unavailable and
    -ComputerName is not supplied, checks only the local host.

.PARAMETER MaxBacklogFiles
    Backlog file count above which a replication partner pair is flagged Fail rather than Warning.
    Default: 50.

.PARAMETER OutputPath
    Path to write the combined report file. Defaults to
    .\reports\MRC-OPS-004_<yyyyMMdd-HHmmss>.txt (created if it does not exist).

.EXAMPLE
    .\MRC-OPS-004.ps1
    Discovers all domain controllers and checks DFSR/SYSVOL replication health on each.

.EXAMPLE
    .\MRC-OPS-004.ps1 -ComputerName DC01,DC02 -MaxBacklogFiles 100 -OutputPath C:\Evidence\dfsr.txt
    Checks only the named DCs with a higher backlog tolerance.

.NOTES
    MRC ID     : MRC-OPS-004 -- SYSVOL/DFSR replication health check
    Card       : ../ops/MRC-OPS-004.md
    Frequency  : Weekly
    Baseline   : Active Directory / Windows Server (dfsrdiag.exe) (per AGENTS.md rule 8)
    Requires   : dfsrdiag.exe available on the host running the check (part of Windows Server DFSR
                 feature; also available via RSAT: DFS Management Tools).
    Exit codes : 0 = DFSR service running and no backlog above threshold on any target. 1 = stopped
                 service, backlog above -MaxBacklogFiles, or a target could not be queried.

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
    [int] $MaxBacklogFiles = 50,

    [Parameter(Mandatory = $false)]
    [string] $OutputPath = ".\reports\MRC-OPS-004_$(Get-Date -Format 'yyyyMMdd-HHmmss').txt"
)

$ErrorActionPreference = 'Stop'
$results = New-Object System.Collections.Generic.List[object]
$overallExitCode = 0

function Write-ReportLine {
    param([string] $Line)
    Add-Content -LiteralPath $OutputPath -Value $Line
}

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

$outDir = Split-Path -Path $OutputPath -Parent
if ($outDir -and -not (Test-Path -LiteralPath $outDir)) {
    New-Item -ItemType Directory -Path $outDir -Force | Out-Null
}
New-Item -ItemType File -Path $OutputPath -Force | Out-Null

Write-ReportLine "MRC-OPS-004 -- SYSVOL/DFSR replication health check"
Write-ReportLine "Run timestamp : $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz')"
Write-ReportLine "Run by        : $env:USERDOMAIN\$env:USERNAME on $env:COMPUTERNAME"
Write-ReportLine "Targets       : $($ComputerName -join ', ')"
Write-ReportLine "MaxBacklogFiles threshold: $MaxBacklogFiles"
Write-ReportLine ("=" * 78)
Write-ReportLine ""

if (-not (Get-Command dfsrdiag.exe -ErrorAction SilentlyContinue)) {
    Write-Warning "dfsrdiag.exe was not found on PATH. Install the DFS Replication feature or RSAT: DFS Management Tools."
}

foreach ($dc in $ComputerName) {
    $ts = Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz'
    Write-ReportLine "--- Target: $dc ---"

    # --- DFSR service state ---
    try {
        $svc = Get-Service -ComputerName $dc -Name DFSR -ErrorAction Stop
        $svcResult = if ($svc.Status -eq 'Running') { 'Pass' } else { 'Fail' }
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'DFSR-Service'; Target = $dc
            Result = $svcResult; Detail = "Service status: $($svc.Status)"
        })
        if ($svcResult -eq 'Fail') { $overallExitCode = 1 }
        Write-ReportLine "DFSR service on $dc`: $($svc.Status)"
        if ($svcResult -eq 'Fail') {
            Write-ReportLine ""
            continue
        }
    } catch {
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'DFSR-Service'; Target = $dc
            Result = 'Fail'; Detail = "Could not query DFSR service: $($_.Exception.Message)"
        })
        $overallExitCode = 1
        Write-ReportLine "ERROR: could not query DFSR service on $dc`: $($_.Exception.Message)"
        Write-ReportLine ""
        continue
    }

    # --- Replication state ---
    try {
        $stateOutput = & dfsrdiag.exe replicationstate /Member:$dc 2>&1 | Out-String
        $isIdle = $stateOutput -match '(?im)^\s*Replicated Folder\b.*$' -and $stateOutput -notmatch '(?im)error|failed'
        $stateResult = if ($stateOutput -match '(?i)error|failed') { 'Warning' } else { 'Pass' }
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'DFSR-ReplicationState'; Target = $dc
            Result = $stateResult; Detail = ($stateOutput.Trim() -replace '\s+', ' ')
        })
        if ($stateResult -ne 'Pass' -and $overallExitCode -eq 0) { $overallExitCode = 1 }
        Write-ReportLine "Replication state on $dc`: $stateResult"
    } catch {
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'DFSR-ReplicationState'; Target = $dc
            Result = 'Warning'; Detail = "Could not run dfsrdiag replicationstate: $($_.Exception.Message)"
        })
        if ($overallExitCode -eq 0) { $overallExitCode = 1 }
        Write-ReportLine "WARNING: could not run dfsrdiag replicationstate on $dc`: $($_.Exception.Message)"
    }

    # --- SYSVOL backlog against each other DC ---
    foreach ($partner in ($ComputerName | Where-Object { $_ -ne $dc })) {
        try {
            $backlogOutput = & dfsrdiag.exe backlog /RGName:"Domain System Volume" /RFName:"SYSVOL Share" /SendingMember:$partner /ReceivingMember:$dc 2>&1 | Out-String
            $countMatch = [regex]::Match($backlogOutput, '(?i)Backlog File count:\s*(\d+)')
            $backlogCount = if ($countMatch.Success) { [int]$countMatch.Groups[1].Value } else { -1 }

            if ($backlogCount -lt 0) {
                $backlogResult = 'Warning'
                $backlogDetail = "Could not parse backlog count from dfsrdiag output. Raw: $($backlogOutput.Trim() -replace '\s+', ' ')"
            } elseif ($backlogCount -gt $MaxBacklogFiles) {
                $backlogResult = 'Fail'
                $backlogDetail = "Backlog file count $backlogCount exceeds threshold $MaxBacklogFiles"
            } elseif ($backlogCount -gt 0) {
                $backlogResult = 'Warning'
                $backlogDetail = "Backlog file count $backlogCount (non-zero but within threshold $MaxBacklogFiles; may be transient)"
            } else {
                $backlogResult = 'Pass'
                $backlogDetail = "Backlog file count 0"
            }

            $results.Add([pscustomobject]@{
                Timestamp = $ts; CheckName = 'DFSR-SYSVOL-Backlog'; Target = "$partner -> $dc"
                Result = $backlogResult; Detail = $backlogDetail
            })
            if ($backlogResult -eq 'Fail') { $overallExitCode = 1 }
            elseif ($backlogResult -eq 'Warning' -and $overallExitCode -eq 0) { $overallExitCode = 1 }
            Write-ReportLine "SYSVOL backlog $partner -> $dc`: $backlogDetail"
        } catch {
            $results.Add([pscustomobject]@{
                Timestamp = $ts; CheckName = 'DFSR-SYSVOL-Backlog'; Target = "$partner -> $dc"
                Result = 'Warning'; Detail = "Could not run dfsrdiag backlog: $($_.Exception.Message)"
            })
            if ($overallExitCode -eq 0) { $overallExitCode = 1 }
            Write-ReportLine "WARNING: could not run dfsrdiag backlog $partner -> $dc`: $($_.Exception.Message)"
        }
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
Write-ReportLine "Totals: $passCount passed, $failCount failed, $warnCount warning(s) across $($ComputerName.Count) target(s)."

Write-Host "SYSVOL/DFSR replication check complete. $passCount passed / $failCount failed / $warnCount warning(s). Report: $OutputPath"

$results
exit $overallExitCode
