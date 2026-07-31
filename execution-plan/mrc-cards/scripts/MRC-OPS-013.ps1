<#
.SYNOPSIS
    Reviews Exchange mailbox database whitespace and database copy health.

.DESCRIPTION
    Automates MRC-OPS-013 -- Mailbox database health and whitespace review (weekly task,
    execution-plan/mrc-cards/ops/MRC-OPS-013.md).

    Must be run from an Exchange Management Shell session (or a session with the Exchange
    management snap-in/remote PowerShell session loaded). For every mailbox database in the
    organization, the script:
      - Reads database size and available whitespace via Get-MailboxDatabase -Status, flagging
        Warning when whitespace exceeds -MaxWhitespacePercent (default 20%) of the database size --
        a database consistently running with a lot of whitespace is a candidate for an online
        defragmentation pass (via eseutil, planned separately -- never run automatically here).
      - Reads database copy status (for databases in a Database Availability Group) via
        Get-MailboxDatabaseCopyStatus, flagging Fail for any copy not in a healthy state
        (Mounted/Healthy) and Warning for a degraded-but-not-failed content index state.

    This script is READ-ONLY. It never dismounts a database, forces a database copy switchover, or
    runs an offline defragmentation pass.

.PARAMETER MaxWhitespacePercent
    Whitespace percentage of database size above which a database is flagged Warning. Default: 20.

.PARAMETER OutputPath
    Path to write the combined report file. Defaults to
    .\reports\MRC-OPS-013_<yyyyMMdd-HHmmss>.txt (created if it does not exist).

.EXAMPLE
    .\MRC-OPS-013.ps1
    Reviews whitespace and copy status for every mailbox database in the organization.

.NOTES
    MRC ID     : MRC-OPS-013 -- Mailbox database health and whitespace review
    Card       : ../ops/MRC-OPS-013.md
    Frequency  : Weekly
    Baseline   : Exchange Server (Get-MailboxDatabaseCopyStatus) (per AGENTS.md rule 8)
    Requires   : Must be run in (or via a remote session to) Exchange Management Shell -- the
                 Get-MailboxDatabase and Get-MailboxDatabaseCopyStatus cmdlets are not part of the
                 standard Windows PowerShell module set.
    Exit codes : 0 = every database's whitespace within threshold and every copy healthy. 1 = a
                 database exceeds the whitespace threshold, a copy is unhealthy, or the databases
                 could not be queried.

    SAFETY DISCLAIMER: Provided as a starting point for the stated baseline environment. Not
    validated against a live production system in this repository. A human must review this script's
    logic and test it in a non-production environment before operational use, per the organization's
    own change-control process. This script never dismounts a database or modifies any Exchange
    configuration.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [double] $MaxWhitespacePercent = 20,

    [Parameter(Mandatory = $false)]
    [string] $OutputPath = ".\reports\MRC-OPS-013_$(Get-Date -Format 'yyyyMMdd-HHmmss').txt"
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

Write-ReportLine "MRC-OPS-013 -- Mailbox database health and whitespace review"
Write-ReportLine "Run timestamp : $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz')"
Write-ReportLine "Run by        : $env:USERDOMAIN\$env:USERNAME on $env:COMPUTERNAME"
Write-ReportLine "MaxWhitespacePercent threshold: $MaxWhitespacePercent%"
Write-ReportLine ("=" * 78)
Write-ReportLine ""

$ts = Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz'

# --- Whitespace review ---
try {
    $databases = Get-MailboxDatabase -Status -ErrorAction Stop
    foreach ($db in $databases) {
        $sizeBytes = $db.DatabaseSize.ToBytes()
        $whitespaceBytes = $db.AvailableNewMailboxSpace.ToBytes()
        $whitespacePct = if ($sizeBytes -gt 0) { ($whitespaceBytes / $sizeBytes) * 100 } else { 0 }
        $whitespacePctRounded = [math]::Round($whitespacePct, 1)
        $wsResult = if ($whitespacePct -gt $MaxWhitespacePercent) { 'Warning' } else { 'Pass' }
        if ($wsResult -eq 'Warning' -and $overallExitCode -eq 0) { $overallExitCode = 1 }
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'DB-Whitespace'; Target = $db.Name
            Result = $wsResult; Detail = "$whitespacePctRounded% whitespace ($($db.AvailableNewMailboxSpace) of $($db.DatabaseSize))"
        })
        Write-ReportLine "$($db.Name) whitespace: $whitespacePctRounded% ($wsResult)"
    }
} catch {
    $results.Add([pscustomobject]@{
        Timestamp = $ts; CheckName = 'DB-Whitespace'; Target = '(organization)'
        Result = 'Fail'; Detail = "Could not query mailbox databases: $($_.Exception.Message)"
    })
    $overallExitCode = 1
    Write-ReportLine "ERROR: could not query mailbox databases: $($_.Exception.Message)"
}

Write-ReportLine ""

# --- Database copy status ---
try {
    $copies = Get-MailboxDatabaseCopyStatus -Identity * -ErrorAction Stop
    foreach ($copy in $copies) {
        $healthyStatuses = @('Mounted', 'Healthy')
        $copyResult = if ($healthyStatuses -contains $copy.Status) { 'Pass' } else { 'Fail' }
        if ($copyResult -eq 'Fail') { $overallExitCode = 1 }
        $indexResult = if ($copy.ContentIndexState -eq 'Healthy') { 'Pass' } else { 'Warning' }
        if ($indexResult -eq 'Warning' -and $overallExitCode -eq 0) { $overallExitCode = 1 }

        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'DBCopy-Status'; Target = $copy.Name
            Result = $copyResult; Detail = "Status=$($copy.Status)"
        })
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'DBCopy-ContentIndex'; Target = $copy.Name
            Result = $indexResult; Detail = "ContentIndexState=$($copy.ContentIndexState)"
        })
        Write-ReportLine "$($copy.Name) copy status: $($copy.Status) ($copyResult), content index: $($copy.ContentIndexState) ($indexResult)"
    }
} catch {
    $results.Add([pscustomobject]@{
        Timestamp = $ts; CheckName = 'DBCopy-Status'; Target = '(organization)'
        Result = 'Fail'; Detail = "Could not query database copy status: $($_.Exception.Message)"
    })
    $overallExitCode = 1
    Write-ReportLine "ERROR: could not query database copy status: $($_.Exception.Message)"
}

Write-ReportLine ""
Write-ReportLine ("=" * 78)
Write-ReportLine "SUMMARY"
Write-ReportLine ("=" * 78)
$summaryLines = $results | Format-Table Timestamp, Target, CheckName, Result, Detail -AutoSize | Out-String
Write-ReportLine $summaryLines

$failCount = ($results | Where-Object Result -eq 'Fail').Count
$warnCount = ($results | Where-Object Result -eq 'Warning').Count
$passCount = ($results | Where-Object Result -eq 'Pass').Count
Write-ReportLine "Totals: $passCount passed, $failCount failed, $warnCount warning(s)."

Write-Host "Mailbox database health/whitespace review complete. $passCount passed / $failCount failed / $warnCount warning(s). Report: $OutputPath"

$results
exit $overallExitCode
