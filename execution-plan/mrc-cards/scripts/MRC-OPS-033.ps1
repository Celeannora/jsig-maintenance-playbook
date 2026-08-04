<#
.SYNOPSIS
    Checks system uptime and pending-reboot status on one or more Windows Server hosts to
    flag patch-reboot compliance gaps.

.DESCRIPTION
    Automates MRC-OPS-033 -- Server uptime and patch-reboot compliance tracking (weekly task,
    execution-plan/mrc-cards/ops/MRC-OPS-033.md).

    On each -ComputerName, this script:
      1. Reads Win32_OperatingSystem.LastBootUpTime via Get-CimInstance and computes uptime in
         days, flagging Warning if it exceeds -MaxUptimeDays (default 35, intended to cover a
         monthly security-patch cycle plus a short grace window).
      2. Checks the standard set of Windows pending-reboot indicators:
           - Component Based Servicing:
             HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\RebootPending
           - Windows Update / Auto Update:
             HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired
           - Pending file rename operations:
             HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager (PendingFileRenameOperations)
         and flags Warning if any indicator is present, since a lingering pending-reboot state
         (especially alongside high uptime) means an already-applied patch has not taken effect.

    This script is READ-ONLY. It never triggers a reboot, never modifies registry values, and
    never changes any WSUS/patching configuration.

.PARAMETER ComputerName
    One or more computer names to check. Defaults to the local computer ($env:COMPUTERNAME).
    Remote targets are queried via Invoke-Command (requires WinRM/PSRemoting access).

.PARAMETER MaxUptimeDays
    Flag a host as Warning if its uptime exceeds this many days. Default: 35.

.PARAMETER OutputPath
    Path to write the combined report file. Defaults to
    .\reports\MRC-OPS-033_<yyyyMMdd-HHmmss>.txt (created if it does not exist).

.EXAMPLE
    .\MRC-OPS-033.ps1 -ComputerName dc01.example.mil -MaxUptimeDays 30
    Checks uptime (warning above 30 days) and pending-reboot indicators on dc01.

.NOTES
    MRC ID     : MRC-OPS-033 -- Server uptime and patch-reboot compliance tracking
    Card       : ../ops/MRC-OPS-033.md
    Frequency  : Weekly
    Baseline   : Windows Server (General) / WSUS (Windows Server Update Services)
    Requires   : Built-in CimCmdlets and registry access (present on all supported Windows
                 Server versions) and, for remote -ComputerName targets, WinRM/PSRemoting
                 access.
    Exit codes : 0 = every host is under -MaxUptimeDays with no pending-reboot indicators.
                 1 = any host exceeds -MaxUptimeDays, has any pending-reboot indicator set, or
                 could not be queried.

    SAFETY DISCLAIMER: Provided as a starting point for the stated baseline environment. Not
    validated against a live production system in this repository. A human must review this
    script's logic and test it in a non-production environment before operational use, per the
    organization's own change-control process. This script never triggers a reboot or modifies
    any configuration.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string[]] $ComputerName = @($env:COMPUTERNAME),

    [Parameter(Mandatory = $false)]
    [int] $MaxUptimeDays = 35,

    [Parameter(Mandatory = $false)]
    [string] $OutputPath = ".\reports\MRC-OPS-033_$(Get-Date -Format 'yyyyMMdd-HHmmss').txt"
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

Write-ReportLine "MRC-OPS-033 -- Server uptime and patch-reboot compliance tracking"
Write-ReportLine "Run timestamp : $ts"
Write-ReportLine "Run by        : $env:USERDOMAIN\$env:USERNAME on $env:COMPUTERNAME"
Write-ReportLine "Max uptime days threshold: $MaxUptimeDays"
Write-ReportLine ("=" * 78)
Write-ReportLine ""

$checkScript = {
    $out = [pscustomobject]@{
        LastBootUpTime  = $null
        UptimeDays      = $null
        CBServicing     = $false
        WindowsUpdate   = $false
        PendFileRename  = $false
    }

    $os = Get-CimInstance -ClassName Win32_OperatingSystem
    $out.LastBootUpTime = $os.LastBootUpTime
    $out.UptimeDays = [math]::Round(((Get-Date) - $os.LastBootUpTime).TotalDays, 2)

    if (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\RebootPending') {
        $out.CBServicing = $true
    }

    $wuRebootKey = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired'
    if (Test-Path $wuRebootKey) {
        $out.WindowsUpdate = $true
    }

    $pfro = Get-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager' -Name 'PendingFileRenameOperations' -ErrorAction SilentlyContinue
    if ($pfro -and $pfro.PendingFileRenameOperations) {
        $out.PendFileRename = $true
    }

    $out
}

foreach ($comp in $ComputerName) {
    Write-ReportLine "--- $comp ---"
    try {
        $data = if ($comp -eq $env:COMPUTERNAME -or $comp -eq 'localhost') {
            & $checkScript
        } else {
            Invoke-Command -ComputerName $comp -ScriptBlock $checkScript -ErrorAction Stop
        }

        if ($data.UptimeDays -gt $MaxUptimeDays) {
            $overallExitCode = 1
            $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'System-Uptime'; Target = $comp; Result = 'Warning'; Detail = "Uptime=$($data.UptimeDays) days (LastBoot=$($data.LastBootUpTime)), threshold $MaxUptimeDays days" })
            Write-ReportLine "Uptime: $($data.UptimeDays) days, last boot $($data.LastBootUpTime) (Warning, threshold $MaxUptimeDays days)"
        } else {
            $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'System-Uptime'; Target = $comp; Result = 'Pass'; Detail = "Uptime=$($data.UptimeDays) days (LastBoot=$($data.LastBootUpTime))" })
            Write-ReportLine "Uptime: $($data.UptimeDays) days, last boot $($data.LastBootUpTime) (Pass)"
        }

        $pendingIndicators = @()
        if ($data.CBServicing) { $pendingIndicators += 'ComponentBasedServicing' }
        if ($data.WindowsUpdate) { $pendingIndicators += 'WindowsUpdate' }
        if ($data.PendFileRename) { $pendingIndicators += 'PendingFileRenameOperations' }

        if ($pendingIndicators.Count -gt 0) {
            $overallExitCode = 1
            $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Pending-Reboot'; Target = $comp; Result = 'Warning'; Detail = "Indicator(s) present: $($pendingIndicators -join ', ')" })
            Write-ReportLine "Pending reboot indicators: $($pendingIndicators -join ', ') (Warning)"
        } else {
            $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Pending-Reboot'; Target = $comp; Result = 'Pass'; Detail = 'No pending-reboot indicators detected' })
            Write-ReportLine "Pending reboot indicators: none (Pass)"
        }
    } catch {
        $overallExitCode = 1
        $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Uptime-RebootCompliance'; Target = $comp; Result = 'Fail'; Detail = "Could not query host: $($_.Exception.Message)" })
        Write-ReportLine "ERROR: could not query $comp`: $($_.Exception.Message)"
    }
    Write-ReportLine ""
}

Write-ReportLine ("=" * 78)
Write-ReportLine "SUMMARY"
Write-ReportLine ("=" * 78)
$summaryLines = $results | Format-Table Timestamp, Target, CheckName, Result, Detail -AutoSize | Out-String
Write-ReportLine $summaryLines

$failCount = ($results | Where-Object { $_.Result -in @('Fail', 'Warning') }).Count
$passCount = ($results | Where-Object Result -eq 'Pass').Count
Write-ReportLine "Totals: $passCount passed, $failCount failed/warning."

Write-Host "Uptime/patch-reboot compliance check complete. $passCount passed / $failCount failed/warning. Report: $OutputPath"

$results
exit $overallExitCode
