<#
.SYNOPSIS
    Checks domain controller disk space and recent critical/error event log entries, producing a
    structured report.

.DESCRIPTION
    Automates the check/report portion of MRC-OPS-009 -- domain controller disk space and event log
    health check (daily task, execution-plan/mrc-cards/ops/MRC-OPS-009.md).

    For each target domain controller (defaults to every DC in the domain), the script:
      - Checks free space on every fixed local disk via CIM/WMI, flagging Fail below
        -CriticalFreePercent (default 10%) and Warning below -WarningFreePercent (default 20%).
      - Counts Critical and Error-level events in the System, Application, and Directory Service event
        logs within the last -LookbackHours (default 24), flagging Warning if the count exceeds
        -MaxErrorEvents (default 25) in any single log.

    This script is READ-ONLY. It never clears event logs, deletes files to free space, or changes disk
    configuration. Any remediation (freeing disk space, investigating a specific event ID) is a
    separate action taken after reviewing this report.

.PARAMETER ComputerName
    One or more domain controller host names to check. Defaults to every domain controller in the
    current user's domain, discovered via the ActiveDirectory module. If unavailable and
    -ComputerName is not supplied, checks only the local host.

.PARAMETER CriticalFreePercent
    Free-space percentage below which a disk is flagged Fail. Default: 10.

.PARAMETER WarningFreePercent
    Free-space percentage below which a disk is flagged Warning (and above CriticalFreePercent).
    Default: 20.

.PARAMETER LookbackHours
    Number of hours of event log history to scan for Critical/Error events. Default: 24.

.PARAMETER MaxErrorEvents
    Number of Critical/Error events in a single log within the lookback window above which that log is
    flagged Warning. Default: 25.

.PARAMETER OutputPath
    Path to write the combined report file. Defaults to
    .\reports\MRC-OPS-009_<yyyyMMdd-HHmmss>.txt (created if it does not exist).

.EXAMPLE
    .\MRC-OPS-009.ps1
    Discovers all domain controllers and checks disk space plus the last 24 hours of event log activity
    on each.

.EXAMPLE
    .\MRC-OPS-009.ps1 -ComputerName DC01 -CriticalFreePercent 5 -LookbackHours 48
    Checks a single DC with a lower critical disk threshold and a 48-hour event log lookback.

.NOTES
    MRC ID     : MRC-OPS-009 -- Domain controller disk space and event log health check
    Card       : ../ops/MRC-OPS-009.md
    Frequency  : Daily
    Baseline   : Windows Server (Event Viewer, Performance Monitor) (per AGENTS.md rule 8)
    Requires   : Remote CIM/WMI access (Get-CimInstance) and remote event log access (Get-WinEvent) to
                 each target, or run locally on each DC.
    Exit codes : 0 = every disk above WarningFreePercent and every log's error/critical count within
                 threshold. 1 = a disk below CriticalFreePercent, or a target could not be queried.
                 (A disk in the Warning band, or a log exceeding MaxErrorEvents, also sets exit code 1
                 so scheduled-task alerting catches Warnings too -- see the card's Section 5 for how to
                 triage Warning vs. Fail severity.)

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
    [double] $CriticalFreePercent = 10,

    [Parameter(Mandatory = $false)]
    [double] $WarningFreePercent = 20,

    [Parameter(Mandatory = $false)]
    [int] $LookbackHours = 24,

    [Parameter(Mandatory = $false)]
    [int] $MaxErrorEvents = 25,

    [Parameter(Mandatory = $false)]
    [string] $OutputPath = ".\reports\MRC-OPS-009_$(Get-Date -Format 'yyyyMMdd-HHmmss').txt"
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

Write-ReportLine "MRC-OPS-009 -- Domain controller disk space and event log health check"
Write-ReportLine "Run timestamp : $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz')"
Write-ReportLine "Run by        : $env:USERDOMAIN\$env:USERNAME on $env:COMPUTERNAME"
Write-ReportLine "Targets       : $($ComputerName -join ', ')"
Write-ReportLine "Disk thresholds: Fail < $CriticalFreePercent% free, Warning < $WarningFreePercent% free"
Write-ReportLine "Event log lookback: $LookbackHours hour(s), Warning if > $MaxErrorEvents Critical/Error events in one log"
Write-ReportLine ("=" * 78)
Write-ReportLine ""

$startTime = (Get-Date).AddHours(-$LookbackHours)

foreach ($dc in $ComputerName) {
    $ts = Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz'
    Write-ReportLine "--- Target: $dc ---"

    # --- Disk space ---
    try {
        $disks = Get-CimInstance -ComputerName $dc -ClassName Win32_LogicalDisk -Filter "DriveType=3" -ErrorAction Stop
        foreach ($disk in $disks) {
            $freePct = if ($disk.Size -gt 0) { ($disk.FreeSpace / $disk.Size) * 100 } else { 0 }
            $freePctRounded = [math]::Round($freePct, 1)
            if ($freePct -lt $CriticalFreePercent) {
                $diskResult = 'Fail'
            } elseif ($freePct -lt $WarningFreePercent) {
                $diskResult = 'Warning'
            } else {
                $diskResult = 'Pass'
            }
            $results.Add([pscustomobject]@{
                Timestamp = $ts; CheckName = 'Disk-FreeSpace'; Target = "$dc/$($disk.DeviceID)"
                Result = $diskResult; Detail = "$freePctRounded% free ($([math]::Round($disk.FreeSpace/1GB,1)) GB of $([math]::Round($disk.Size/1GB,1)) GB)"
            })
            if ($diskResult -eq 'Fail') { $overallExitCode = 1 }
            elseif ($diskResult -eq 'Warning' -and $overallExitCode -eq 0) { $overallExitCode = 1 }
            Write-ReportLine "Disk $($disk.DeviceID) on $dc`: $diskResult -- $freePctRounded% free"
        }
    } catch {
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'Disk-FreeSpace'; Target = $dc
            Result = 'Fail'; Detail = "Could not query disk space: $($_.Exception.Message)"
        })
        $overallExitCode = 1
        Write-ReportLine "ERROR: could not query disk space on $dc`: $($_.Exception.Message)"
    }

    # --- Event log Critical/Error counts ---
    foreach ($logName in @('System', 'Application', 'Directory Service')) {
        try {
            $events = Get-WinEvent -ComputerName $dc -FilterHashtable @{
                LogName = $logName; Level = 1, 2; StartTime = $startTime
            } -ErrorAction SilentlyContinue
            $count = if ($events) { $events.Count } else { 0 }
            $evtResult = if ($count -gt $MaxErrorEvents) { 'Warning' } else { 'Pass' }
            $results.Add([pscustomobject]@{
                Timestamp = $ts; CheckName = "EventLog-$($logName -replace ' ', '')"; Target = $dc
                Result = $evtResult; Detail = "$count Critical/Error event(s) in the last $LookbackHours hour(s)"
            })
            if ($evtResult -eq 'Warning' -and $overallExitCode -eq 0) { $overallExitCode = 1 }
            Write-ReportLine "$logName log on $dc`: $count Critical/Error event(s) ($evtResult)"
        } catch {
            $results.Add([pscustomobject]@{
                Timestamp = $ts; CheckName = "EventLog-$($logName -replace ' ', '')"; Target = $dc
                Result = 'Warning'; Detail = "Could not query $logName log: $($_.Exception.Message)"
            })
            if ($overallExitCode -eq 0) { $overallExitCode = 1 }
            Write-ReportLine "WARNING: could not query $logName log on $dc`: $($_.Exception.Message)"
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

Write-Host "Disk space/event log check complete. $passCount passed / $failCount failed / $warnCount warning(s). Report: $OutputPath"

$results
exit $overallExitCode
