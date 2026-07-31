<#
.SYNOPSIS
    Reviews Active Directory database (ntds.dit) file size and volume free space, and scans for
    ESE/JET database engine errors in the event log -- without ever taking the database offline.

.DESCRIPTION
    Automates the safe, non-disruptive portion of MRC-OPS-012 -- Active Directory database (ntds.dit)
    size/health review (quarterly task, execution-plan/mrc-cards/ops/MRC-OPS-012.md).

    For each target domain controller, the script:
      - Reads the ntds.dit file size (from the registry-configured NTDS database path, defaulting to
        the standard %SystemRoot%\NTDS\ntds.dit) and reports it alongside free space on that volume,
        flagging Warning if free space on the volume is below -MinFreeSpacePercent (default 15%) of the
        volume's total size, since ntds.dit can grow unexpectedly (e.g. after a large bulk import or a
        replication/tombstone issue) and Active Directory can fail unpredictably if its volume runs out
        of space.
      - Scans the Application and Directory Service event logs for ESE/JET database engine error
        events (Source=ESENT, Levels 1-2, e.g. Event ID 623/624 disk-full and general database
        corruption/consistency error IDs) in the last -LookbackDays (default 90, since this is a
        quarterly check), flagging Fail on any match.

    INTENTIONALLY OUT OF SCOPE -- DO NOT AUTOMATE: A full ntdsutil "semantic database analysis" or
    "integrity" check requires stopping the NTDS service (or booting into Directory Services Restore
    Mode) and can take hours on a large database, during which the DC cannot authenticate or replicate.
    This is a highly disruptive, planned-outage-window activity, not a routine quarterly script. It is
    documented in the card's Section 5.2 (Manual path) as a separate, explicitly-scheduled, out-of-band
    procedure requiring change-control approval -- never run it as part of this or any unattended
    script.

    This script is otherwise READ-ONLY. It never stops a service, deletes a file, or modifies the
    database in any way.

.PARAMETER ComputerName
    One or more domain controller host names to check. Defaults to every domain controller in the
    current user's domain, discovered via the ActiveDirectory module. If unavailable and
    -ComputerName is not supplied, checks only the local host.

.PARAMETER MinFreeSpacePercent
    Minimum acceptable free-space percentage on the volume hosting ntds.dit. Default: 15.

.PARAMETER LookbackDays
    Number of days of event log history to scan for ESE/JET database engine errors. Default: 90.

.PARAMETER OutputPath
    Path to write the combined report file. Defaults to
    .\reports\MRC-OPS-012_<yyyyMMdd-HHmmss>.txt (created if it does not exist).

.EXAMPLE
    .\MRC-OPS-012.ps1
    Discovers all domain controllers and reports ntds.dit size, volume free space, and any ESE/JET
    errors in the last 90 days on each.

.EXAMPLE
    .\MRC-OPS-012.ps1 -ComputerName DC01 -MinFreeSpacePercent 20 -LookbackDays 180
    Checks a single DC with a stricter free-space threshold and a longer lookback window.

.NOTES
    MRC ID     : MRC-OPS-012 -- Active Directory database (ntds.dit) size/health review
    Card       : ../ops/MRC-OPS-012.md
    Frequency  : Quarterly
    Baseline   : Active Directory / Windows Server (ntdsutil.exe) (per AGENTS.md rule 8)
    Requires   : Remote registry/CIM access to read the NTDS database path and disk free space, and
                 remote event log access (Get-WinEvent), or run locally on each DC.
    Exit codes : 0 = ntds.dit size/free space within threshold and no ESE/JET errors found on any
                 target. 1 = free space below threshold, an ESE/JET error was found, or a target could
                 not be queried.

    SAFETY DISCLAIMER: Provided as a starting point for the stated baseline environment. Not
    validated against a live production system in this repository. A human must review this script's
    logic and test it in a non-production environment before operational use, per the organization's
    own change-control process. This script never stops the NTDS service, never runs ntdsutil, and
    never modifies the database.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string[]] $ComputerName,

    [Parameter(Mandatory = $false)]
    [double] $MinFreeSpacePercent = 15,

    [Parameter(Mandatory = $false)]
    [int] $LookbackDays = 90,

    [Parameter(Mandatory = $false)]
    [string] $OutputPath = ".\reports\MRC-OPS-012_$(Get-Date -Format 'yyyyMMdd-HHmmss').txt"
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

Write-ReportLine "MRC-OPS-012 -- Active Directory database (ntds.dit) size/health review"
Write-ReportLine "Run timestamp : $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz')"
Write-ReportLine "Run by        : $env:USERDOMAIN\$env:USERNAME on $env:COMPUTERNAME"
Write-ReportLine "Targets       : $($ComputerName -join ', ')"
Write-ReportLine "Min free space on ntds.dit volume: $MinFreeSpacePercent%"
Write-ReportLine "ESE/JET error lookback: $LookbackDays day(s)"
Write-ReportLine ("=" * 78)
Write-ReportLine ""
Write-ReportLine "NOTE: This script does NOT run ntdsutil integrity/semantic database analysis. That"
Write-ReportLine "check requires a planned outage window and is documented separately in the card's"
Write-ReportLine "manual path -- it is never run automatically."
Write-ReportLine ""

$startTime = (Get-Date).AddDays(-$LookbackDays)

foreach ($dc in $ComputerName) {
    $ts = Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz'
    Write-ReportLine "--- Target: $dc ---"

    # --- ntds.dit size and volume free space ---
    try {
        $ntdsPath = Invoke-Command -ComputerName $dc -ScriptBlock {
            (Get-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\NTDS\Parameters' -Name 'DSA Database file' -ErrorAction Stop).'DSA Database file'
        } -ErrorAction Stop

        $volumeLetter = ($ntdsPath -split ':')[0]
        $fileInfo = Invoke-Command -ComputerName $dc -ScriptBlock {
            param($p) Get-Item -LiteralPath $p -ErrorAction Stop
        } -ArgumentList $ntdsPath -ErrorAction Stop

        $volume = Get-CimInstance -ComputerName $dc -ClassName Win32_LogicalDisk -Filter "DeviceID='$volumeLetter`:'" -ErrorAction Stop
        $freePct = if ($volume.Size -gt 0) { ($volume.FreeSpace / $volume.Size) * 100 } else { 0 }
        $freePctRounded = [math]::Round($freePct, 1)
        $sizeGb = [math]::Round($fileInfo.Length / 1GB, 2)

        $sizeResult = if ($freePct -lt $MinFreeSpacePercent) { 'Warning' } else { 'Pass' }
        if ($sizeResult -eq 'Warning' -and $overallExitCode -eq 0) { $overallExitCode = 1 }

        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'NTDS-DatabaseSize'; Target = $dc
            Result = $sizeResult; Detail = "ntds.dit = $sizeGb GB at $ntdsPath, volume $volumeLetter`: $freePctRounded% free"
        })
        Write-ReportLine "ntds.dit on $dc`: $sizeGb GB, volume $volumeLetter`: $freePctRounded% free ($sizeResult)"
    } catch {
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'NTDS-DatabaseSize'; Target = $dc
            Result = 'Fail'; Detail = "Could not read ntds.dit size/free space: $($_.Exception.Message)"
        })
        $overallExitCode = 1
        Write-ReportLine "ERROR: could not read ntds.dit size/free space on $dc`: $($_.Exception.Message)"
    }

    # --- ESE/JET database engine errors ---
    try {
        $eseEvents = Get-WinEvent -ComputerName $dc -FilterHashtable @{
            LogName = 'Application', 'Directory Service'; ProviderName = 'ESENT'; Level = 1, 2; StartTime = $startTime
        } -ErrorAction SilentlyContinue
        $count = if ($eseEvents) { $eseEvents.Count } else { 0 }
        $eseResult = if ($count -gt 0) { 'Fail' } else { 'Pass' }
        if ($eseResult -eq 'Fail') { $overallExitCode = 1 }
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'NTDS-ESEEngineErrors'; Target = $dc
            Result = $eseResult; Detail = "$count ESENT Critical/Error event(s) in the last $LookbackDays day(s)"
        })
        Write-ReportLine "ESE/JET errors on $dc`: $count in the last $LookbackDays day(s) ($eseResult)"
    } catch {
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'NTDS-ESEEngineErrors'; Target = $dc
            Result = 'Warning'; Detail = "Could not query ESENT events: $($_.Exception.Message)"
        })
        if ($overallExitCode -eq 0) { $overallExitCode = 1 }
        Write-ReportLine "WARNING: could not query ESENT events on $dc`: $($_.Exception.Message)"
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
Write-ReportLine "Reminder: no ntdsutil integrity/semantic database analysis was run -- see the card's manual path for that separate, outage-window procedure."

Write-Host "ntds.dit size/health review complete. $passCount passed / $failCount failed / $warnCount warning(s). Report: $OutputPath"

$results
exit $overallExitCode
