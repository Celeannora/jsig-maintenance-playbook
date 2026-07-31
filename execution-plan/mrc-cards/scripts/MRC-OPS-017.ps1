<#
.SYNOPSIS
    Checks Exchange transaction log truncation status and free space on database/log volumes.

.DESCRIPTION
    Automates MRC-OPS-017 -- Exchange transaction log truncation and disk space check (daily task,
    execution-plan/mrc-cards/ops/MRC-OPS-017.md).

    Must be run from an Exchange Management Shell session. For every mailbox database in the
    organization (or the one(s) specified via -Database), the script:
      - Reads free space on the volume hosting the database file and the volume hosting its log
        files (which may be the same volume) via Get-CimInstance, flagging Fail when free space is
        below -CriticalFreePercent (default 10%) and Warning when below -WarningFreePercent
        (default 20%).
      - Confirms circular logging is disabled (CircularLoggingEnabled = $false) for every database
        that is part of a Database Availability Group, since circular logging is incompatible with
        continuous replication and, if accidentally enabled, silently breaks the DAG's ability to
        replay logs to passive copies. Flags Fail if circular logging is enabled on a DAG member
        database.
      - Reports the count of ESE transaction log files currently present in each database's log
        folder as a diagnostic data point (a large, growing count over consecutive runs is the
        classic symptom of truncation not occurring, most often because a passive copy has fallen
        behind or a backup has not completed) -- flagged Warning above -LogFileCountWarning
        (default 5000 files).

    This script is READ-ONLY. It never deletes a log file, forces log truncation, or changes the
    circular logging setting. Truncation happens automatically once every copy of the database (for
    DAG members) or the last successful backup (for standalone databases) has consumed the log --
    this script only reports whether that appears to be happening, it never forces it.

.PARAMETER Database
    Mailbox database name(s) to check. If omitted, checks every mailbox database in the organization.

.PARAMETER WarningFreePercent
    Free-space percentage threshold for a Warning flag. Default: 20.

.PARAMETER CriticalFreePercent
    Free-space percentage threshold for a Fail flag. Default: 10.

.PARAMETER LogFileCountWarning
    Transaction log file count above which a database is flagged Warning as a possible truncation
    problem. Default: 5000.

.PARAMETER OutputPath
    Path to write the combined report file. Defaults to
    .\reports\MRC-OPS-017_<yyyyMMdd-HHmmss>.txt (created if it does not exist).

.EXAMPLE
    .\MRC-OPS-017.ps1
    Checks log truncation health and disk space for every mailbox database in the organization.

.NOTES
    MRC ID     : MRC-OPS-017 -- Exchange transaction log truncation and disk space check
    Card       : ../ops/MRC-OPS-017.md
    Frequency  : Daily
    Baseline   : Exchange Server (database/log volumes) (per AGENTS.md rule 8)
    Requires   : Must be run in (or via a remote session to) Exchange Management Shell, on or with
                 access to the server hosting each database (for the log file count and CIM volume
                 checks).
    Exit codes : 0 = every volume above the Critical threshold, circular logging disabled on every
                 DAG member database, and no database over the log file count threshold. 1 = any of
                 those conditions fails, or a database could not be queried.

    SAFETY DISCLAIMER: Provided as a starting point for the stated baseline environment. Not
    validated against a live production system in this repository. A human must review this script's
    logic and test it in a non-production environment before operational use, per the organization's
    own change-control process. This script never deletes log files or modifies database settings.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string[]] $Database,

    [Parameter(Mandatory = $false)]
    [double] $WarningFreePercent = 20,

    [Parameter(Mandatory = $false)]
    [double] $CriticalFreePercent = 10,

    [Parameter(Mandatory = $false)]
    [int] $LogFileCountWarning = 5000,

    [Parameter(Mandatory = $false)]
    [string] $OutputPath = ".\reports\MRC-OPS-017_$(Get-Date -Format 'yyyyMMdd-HHmmss').txt"
)

$ErrorActionPreference = 'Stop'
$results = New-Object System.Collections.Generic.List[object]
$overallExitCode = 0

function Write-ReportLine {
    param([string] $Line)
    Add-Content -LiteralPath $OutputPath -Value $Line
}

if (-not (Get-Command Get-MailboxDatabase -ErrorAction SilentlyContinue)) {
    throw "Get-MailboxDatabase is not available. Run this script from an Exchange Management Shell session (or a session with the Exchange management tools/remote PowerShell session loaded)."
}

$outDir = Split-Path -Path $OutputPath -Parent
if ($outDir -and -not (Test-Path -LiteralPath $outDir)) {
    New-Item -ItemType Directory -Path $outDir -Force | Out-Null
}
New-Item -ItemType File -Path $OutputPath -Force | Out-Null

$ts = Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz'

Write-ReportLine "MRC-OPS-017 -- Exchange transaction log truncation and disk space check"
Write-ReportLine "Run timestamp : $ts"
Write-ReportLine "Run by        : $env:USERDOMAIN\$env:USERNAME on $env:COMPUTERNAME"
Write-ReportLine "Warning free-space threshold: $WarningFreePercent%; Critical: $CriticalFreePercent%"
Write-ReportLine "Log file count Warning threshold: $LogFileCountWarning file(s)"
Write-ReportLine ("=" * 78)
Write-ReportLine ""

try {
    if ($Database) {
        $databases = $Database | ForEach-Object { Get-MailboxDatabase -Identity $_ -Status -ErrorAction Stop }
    } else {
        $databases = Get-MailboxDatabase -Status -ErrorAction Stop
    }
} catch {
    $results.Add([pscustomobject]@{
        Timestamp = $ts; CheckName = 'DB-Discovery'; Target = '(organization)'
        Result = 'Fail'; Detail = "Could not enumerate mailbox databases: $($_.Exception.Message)"
    })
    Write-ReportLine "ERROR: could not enumerate mailbox databases: $($_.Exception.Message)"
    $results | Format-Table | Out-String | Write-Host
    exit 1
}

foreach ($db in $databases) {
    $server = $db.Server.Name
    Write-ReportLine "--- Database: $($db.Name) (Server: $server) ---"

    # --- Volume free space (DB path and log path, deduplicated) ---
    $volumePaths = @($db.EdbFilePath.DriveName, $db.LogFolderPath.DriveName) | Select-Object -Unique
    foreach ($vol in $volumePaths) {
        try {
            $disk = Get-CimInstance -ComputerName $server -ClassName Win32_LogicalDisk -Filter "DeviceID='$vol'" -ErrorAction Stop
            if (-not $disk) { throw "No Win32_LogicalDisk instance returned for $vol." }
            $freePct = ($disk.FreeSpace / $disk.Size) * 100
            $freePctRounded = [math]::Round($freePct, 1)
            $volResult = if ($freePct -lt $CriticalFreePercent) { 'Fail' } elseif ($freePct -lt $WarningFreePercent) { 'Warning' } else { 'Pass' }
            if ($volResult -eq 'Fail') { $overallExitCode = 1 }
            elseif ($volResult -eq 'Warning' -and $overallExitCode -eq 0) { $overallExitCode = 1 }
            $results.Add([pscustomobject]@{
                Timestamp = $ts; CheckName = 'Volume-FreeSpace'; Target = "$server/$vol"
                Result = $volResult; Detail = "$freePctRounded% free"
            })
            Write-ReportLine "$server volume $vol`: $freePctRounded% free ($volResult)"
        } catch {
            $results.Add([pscustomobject]@{
                Timestamp = $ts; CheckName = 'Volume-FreeSpace'; Target = "$server/$vol"
                Result = 'Fail'; Detail = "Could not query volume: $($_.Exception.Message)"
            })
            $overallExitCode = 1
            Write-ReportLine "ERROR: could not query volume $vol on $server`: $($_.Exception.Message)"
        }
    }

    # --- Circular logging (DAG member databases only) ---
    if ($db.MasterServerOrAvailabilityGroup) {
        $clResult = if ($db.CircularLoggingEnabled) { 'Fail' } else { 'Pass' }
        if ($clResult -eq 'Fail') { $overallExitCode = 1 }
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'CircularLogging'; Target = $db.Name
            Result = $clResult; Detail = "CircularLoggingEnabled=$($db.CircularLoggingEnabled) (DAG member: $($db.MasterServerOrAvailabilityGroup))"
        })
        Write-ReportLine "$($db.Name) circular logging: $($db.CircularLoggingEnabled) ($clResult)"
    }

    # --- Log file count ---
    try {
        $logPath = $db.LogFolderPath.PathName
        $logCount = (Get-ChildItem -Path $logPath -Filter '*.log' -ErrorAction Stop).Count
        $logResult = if ($logCount -gt $LogFileCountWarning) { 'Warning' } else { 'Pass' }
        if ($logResult -eq 'Warning' -and $overallExitCode -eq 0) { $overallExitCode = 1 }
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'LogFile-Count'; Target = $db.Name
            Result = $logResult; Detail = "$logCount log file(s) in $logPath"
        })
        Write-ReportLine "$($db.Name) log file count: $logCount ($logResult)"
    } catch {
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'LogFile-Count'; Target = $db.Name
            Result = 'Warning'; Detail = "Could not enumerate log files: $($_.Exception.Message)"
        })
        if ($overallExitCode -eq 0) { $overallExitCode = 1 }
        Write-ReportLine "WARNING: could not enumerate log files for $($db.Name): $($_.Exception.Message)"
    }

    Write-ReportLine ""
}

Write-ReportLine ("=" * 78)
Write-ReportLine "SUMMARY"
Write-ReportLine ("=" * 78)
$summaryLines = $results | Sort-Object Target |
    Format-Table Timestamp, Target, CheckName, Result, Detail -AutoSize | Out-String
Write-ReportLine $summaryLines

$failCount = ($results | Where-Object Result -eq 'Fail').Count
$warnCount = ($results | Where-Object Result -eq 'Warning').Count
$passCount = ($results | Where-Object Result -eq 'Pass').Count
Write-ReportLine "Totals: $passCount passed, $failCount failed, $warnCount warning(s)."

Write-Host "Transaction log truncation/disk space check complete. $passCount passed / $failCount failed / $warnCount warning(s). Report: $OutputPath"

$results
exit $overallExitCode
