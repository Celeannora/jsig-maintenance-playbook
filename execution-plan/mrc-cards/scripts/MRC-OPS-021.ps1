<#
.SYNOPSIS
    Verifies that Exchange databases have a recent, successful VSS application-aware backup.

.DESCRIPTION
    Automates MRC-OPS-021 -- Exchange application-aware backup verification (weekly task,
    execution-plan/mrc-cards/ops/MRC-OPS-021.md).

    Must be run from an Exchange Management Shell session (for the mailbox database inventory)
    with access to the Windows Server Backup / VSS writer state on each Mailbox server (for the
    backup-recency check). For every mailbox database (or the one(s) specified via -Database), the
    script:
      - Reads Get-MailboxDatabase's BackupInProgress and (critically) the last full backup
        timestamp exposed via Get-MailboxDatabase -Status's LastFullBackup property, which Exchange
        only updates when a *VSS application-aware* backup (e.g. Windows Server Backup with the
        Exchange plugin, or a third-party VSS-aware Exchange backup product) completes successfully
        -- a plain file-copy of the .edb file does NOT update this property and does NOT truncate
        transaction logs, so this property is the correct source of truth for "was there a real
        application-aware backup."
      - Flags Fail if LastFullBackup is null (no application-aware backup has ever completed) or is
        older than -MaxBackupAgeHours (default 48 hours, i.e. more than roughly 2x this task's own
        weekly cadence tolerance built in for a daily-backup environment -- adjust to match your
        organization's actual backup schedule).
      - Also checks the Microsoft Exchange Writer VSS writer state (via vssadmin list writers,
        parsed for "Microsoft Exchange Writer") on each Mailbox server and flags Fail if its state is
        not "Stable" and its last error is not "No error", since a VSS writer in a failed state will
        cause the next backup attempt to fail even if the last completed backup looked fine.

    This script is READ-ONLY. It never triggers, schedules, or cancels a backup job, and it never
    truncates logs directly -- log truncation after a successful application-aware backup is
    performed automatically by Exchange/VSS as part of that backup process, not by this script.

.PARAMETER Database
    Mailbox database(s) to check. Defaults to every mailbox database, returned by
    Get-MailboxDatabase.

.PARAMETER MaxBackupAgeHours
    Maximum age, in hours, since the last successful application-aware backup before a database is
    flagged Fail. Default: 48.

.PARAMETER OutputPath
    Path to write the combined report file. Defaults to
    .\reports\MRC-OPS-021_<yyyyMMdd-HHmmss>.txt (created if it does not exist).

.EXAMPLE
    .\MRC-OPS-021.ps1
    Verifies application-aware backup recency and VSS writer health for every mailbox database.

.NOTES
    MRC ID     : MRC-OPS-021 -- Exchange application-aware backup verification
    Card       : ../ops/MRC-OPS-021.md
    Frequency  : Weekly
    Baseline   : Exchange Server + Windows Server Backup (VSS writer) (per AGENTS.md rule 8)
    Requires   : Must be run in (or via a remote session to) Exchange Management Shell, with access
                 to run vssadmin.exe on each Mailbox server (local admin rights on that server).
    Exit codes : 0 = every database's last application-aware backup is within the age threshold and
                 the Microsoft Exchange Writer is Stable on every server. 1 = any database is
                 missing a recent application-aware backup, any Exchange Writer is not Stable, or a
                 target could not be queried.

    SAFETY DISCLAIMER: Provided as a starting point for the stated baseline environment. Not
    validated against a live production system in this repository. A human must review this script's
    logic and test it in a non-production environment before operational use, per the organization's
    own change-control process. This script never triggers a backup job or truncates logs directly.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string[]] $Database,

    [Parameter(Mandatory = $false)]
    [int] $MaxBackupAgeHours = 48,

    [Parameter(Mandatory = $false)]
    [string] $OutputPath = ".\reports\MRC-OPS-021_$(Get-Date -Format 'yyyyMMdd-HHmmss').txt"
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
$now = Get-Date

Write-ReportLine "MRC-OPS-021 -- Exchange application-aware backup verification"
Write-ReportLine "Run timestamp : $ts"
Write-ReportLine "Run by        : $env:USERDOMAIN\$env:USERNAME on $env:COMPUTERNAME"
Write-ReportLine "Max backup age threshold: $MaxBackupAgeHours hour(s)"
Write-ReportLine ("=" * 78)
Write-ReportLine ""

# --- Database backup recency ---
Write-ReportLine "--- Database Backup Recency ---"
try {
    $dbParams = @{ Status = $true; ErrorAction = 'Stop' }
    if ($Database) { $dbParams['Identity'] = $Database }
    $dbs = Get-MailboxDatabase @dbParams
    $serversToCheck = New-Object System.Collections.Generic.HashSet[string]

    foreach ($db in $dbs) {
        if ($db.Server) { [void]$serversToCheck.Add($db.Server) }
        if (-not $db.LastFullBackup) {
            $overallExitCode = 1
            $results.Add([pscustomobject]@{
                Timestamp = $ts; CheckName = 'Backup-Recency'; Target = $db.Name
                Result = 'Fail'; Detail = 'No application-aware backup has ever completed (LastFullBackup is null)'
            })
            Write-ReportLine "Database $($db.Name): NO application-aware backup on record (Fail)"
            continue
        }
        $ageHours = [math]::Round(($now - $db.LastFullBackup).TotalHours, 1)
        if ($ageHours -gt $MaxBackupAgeHours) {
            $overallExitCode = 1
            $results.Add([pscustomobject]@{
                Timestamp = $ts; CheckName = 'Backup-Recency'; Target = $db.Name
                Result = 'Fail'; Detail = "Last application-aware backup $ageHours hour(s) ago (threshold $MaxBackupAgeHours h); LastFullBackup=$($db.LastFullBackup)"
            })
            Write-ReportLine "Database $($db.Name): last backup $ageHours h ago, EXCEEDS $MaxBackupAgeHours h threshold (Fail)"
        } else {
            $results.Add([pscustomobject]@{
                Timestamp = $ts; CheckName = 'Backup-Recency'; Target = $db.Name
                Result = 'Pass'; Detail = "Last application-aware backup $ageHours hour(s) ago; LastFullBackup=$($db.LastFullBackup)"
            })
            Write-ReportLine "Database $($db.Name): last backup $ageHours h ago (Pass)"
        }
    }
} catch {
    $results.Add([pscustomobject]@{
        Timestamp = $ts; CheckName = 'Backup-Recency'; Target = '(all databases)'
        Result = 'Fail'; Detail = "Could not query Get-MailboxDatabase -Status: $($_.Exception.Message)"
    })
    $overallExitCode = 1
    Write-ReportLine "ERROR: could not query Get-MailboxDatabase -Status: $($_.Exception.Message)"
    $serversToCheck = New-Object System.Collections.Generic.HashSet[string]
}

Write-ReportLine ""

# --- VSS writer health ---
Write-ReportLine "--- Microsoft Exchange Writer (VSS) Health ---"
foreach ($srv in $serversToCheck) {
    try {
        $vssOutput = if ($srv -eq $env:COMPUTERNAME) {
            & vssadmin.exe list writers 2>&1
        } else {
            Invoke-Command -ComputerName $srv -ScriptBlock { & vssadmin.exe list writers 2>&1 } -ErrorAction Stop
        }
        $vssText = $vssOutput -join "`n"
        if ($vssText -match "Writer name: 'Microsoft Exchange Writer'[\s\S]*?State: \[(\d+)\] (\w+)[\s\S]*?Last error: (.+)") {
            $writerState = $matches[2]
            $lastError = $matches[3].Trim()
            if ($writerState -eq 'Stable' -and $lastError -eq 'No error') {
                $results.Add([pscustomobject]@{
                    Timestamp = $ts; CheckName = 'VSS-Writer'; Target = $srv
                    Result = 'Pass'; Detail = "Microsoft Exchange Writer: State=$writerState, LastError=$lastError"
                })
                Write-ReportLine "$srv Microsoft Exchange Writer: State=$writerState, LastError=$lastError (Pass)"
            } else {
                $overallExitCode = 1
                $results.Add([pscustomobject]@{
                    Timestamp = $ts; CheckName = 'VSS-Writer'; Target = $srv
                    Result = 'Fail'; Detail = "Microsoft Exchange Writer: State=$writerState, LastError=$lastError"
                })
                Write-ReportLine "$srv Microsoft Exchange Writer: State=$writerState, LastError=$lastError (Fail)"
            }
        } else {
            $overallExitCode = 1
            $results.Add([pscustomobject]@{
                Timestamp = $ts; CheckName = 'VSS-Writer'; Target = $srv
                Result = 'Fail'; Detail = 'Microsoft Exchange Writer entry not found in vssadmin list writers output'
            })
            Write-ReportLine "$srv`: Microsoft Exchange Writer entry NOT FOUND in vssadmin output (Fail)"
        }
    } catch {
        $overallExitCode = 1
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'VSS-Writer'; Target = $srv
            Result = 'Fail'; Detail = "Could not query VSS writers: $($_.Exception.Message)"
        })
        Write-ReportLine "ERROR: could not query VSS writers on $srv`: $($_.Exception.Message)"
    }
}

Write-ReportLine ""
Write-ReportLine ("=" * 78)
Write-ReportLine "SUMMARY"
Write-ReportLine ("=" * 78)
$summaryLines = $results | Format-Table Timestamp, Target, CheckName, Result, Detail -AutoSize | Out-String
Write-ReportLine $summaryLines

$failCount = ($results | Where-Object Result -eq 'Fail').Count
$passCount = ($results | Where-Object Result -eq 'Pass').Count
Write-ReportLine "Totals: $passCount passed, $failCount failed."

Write-Host "Application-aware backup verification complete. $passCount passed / $failCount failed. Report: $OutputPath"

$results
exit $overallExitCode
