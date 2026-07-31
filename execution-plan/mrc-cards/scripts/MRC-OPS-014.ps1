<#
.SYNOPSIS
    Checks Exchange Database Availability Group (DAG) replication health and failover readiness.

.DESCRIPTION
    Automates MRC-OPS-014 -- Database Availability Group (DAG) health and failover readiness check
    (daily task, execution-plan/mrc-cards/ops/MRC-OPS-014.md).

    Must be run from an Exchange Management Shell session. For every DAG in the organization (or the
    one specified via -DagName), the script runs Test-ReplicationHealth against every member server,
    which exercises the cluster service, replay service, Active Manager, tasks RPC listener, TCP
    listener, DAG membership, cluster network, quorum, and per-database replication/availability
    checks in a single built-in Exchange cmdlet. Any result other than "Passed" is flagged Fail. It
    also cross-checks Get-MailboxDatabaseCopyStatus for a redundant, healthy copy of every database.

    This script is READ-ONLY. It never triggers a database copy switchover, evicts a DAG member, or
    changes quorum configuration -- Test-ReplicationHealth itself is a read-only diagnostic cmdlet.

.PARAMETER DagName
    Name of a specific Database Availability Group to check. If omitted, checks every DAG in the
    organization.

.PARAMETER OutputPath
    Path to write the combined report file. Defaults to
    .\reports\MRC-OPS-014_<yyyyMMdd-HHmmss>.txt (created if it does not exist).

.EXAMPLE
    .\MRC-OPS-014.ps1
    Checks replication health and failover readiness for every DAG in the organization.

.EXAMPLE
    .\MRC-OPS-014.ps1 -DagName DAG01
    Checks a single named DAG.

.NOTES
    MRC ID     : MRC-OPS-014 -- Database Availability Group (DAG) health and failover readiness check
    Card       : ../ops/MRC-OPS-014.md
    Frequency  : Daily
    Baseline   : Exchange Server DAG (per AGENTS.md rule 8)
    Requires   : Must be run in (or via a remote session to) Exchange Management Shell.
    Exit codes : 0 = Test-ReplicationHealth passes every check on every DAG member and every database
                 copy is in a healthy, redundant state. 1 = any check fails, or the DAG(s) could not
                 be queried.

    SAFETY DISCLAIMER: Provided as a starting point for the stated baseline environment. Not
    validated against a live production system in this repository. A human must review this script's
    logic and test it in a non-production environment before operational use, per the organization's
    own change-control process. This script never triggers a failover or modifies DAG configuration.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string] $DagName,

    [Parameter(Mandatory = $false)]
    [string] $OutputPath = ".\reports\MRC-OPS-014_$(Get-Date -Format 'yyyyMMdd-HHmmss').txt"
)

$ErrorActionPreference = 'Stop'
$results = New-Object System.Collections.Generic.List[object]
$overallExitCode = 0

function Write-ReportLine {
    param([string] $Line)
    Add-Content -LiteralPath $OutputPath -Value $Line
}

if (-not (Get-Command Get-DatabaseAvailabilityGroup -ErrorAction SilentlyContinue)) {
    throw "Get-DatabaseAvailabilityGroup is not available. Run this script from an Exchange Management Shell session (or a session with the Exchange management tools/remote PowerShell session loaded)."
}

$outDir = Split-Path -Path $OutputPath -Parent
if ($outDir -and -not (Test-Path -LiteralPath $outDir)) {
    New-Item -ItemType Directory -Path $outDir -Force | Out-Null
}
New-Item -ItemType File -Path $OutputPath -Force | Out-Null

$ts = Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz'

Write-ReportLine "MRC-OPS-014 -- Database Availability Group (DAG) health and failover readiness check"
Write-ReportLine "Run timestamp : $ts"
Write-ReportLine "Run by        : $env:USERDOMAIN\$env:USERNAME on $env:COMPUTERNAME"
Write-ReportLine ("=" * 78)
Write-ReportLine ""

try {
    if ($DagName) {
        $dags = @(Get-DatabaseAvailabilityGroup -Identity $DagName -ErrorAction Stop)
    } else {
        $dags = Get-DatabaseAvailabilityGroup -ErrorAction Stop
    }
} catch {
    $results.Add([pscustomobject]@{
        Timestamp = $ts; CheckName = 'DAG-Discovery'; Target = '(organization)'
        Result = 'Fail'; Detail = "Could not enumerate DAGs: $($_.Exception.Message)"
    })
    Write-ReportLine "ERROR: could not enumerate DAGs: $($_.Exception.Message)"
    $results | Format-Table | Out-String | Write-Host
    exit 1
}

foreach ($dag in $dags) {
    Write-ReportLine "--- DAG: $($dag.Name) ---"
    foreach ($member in $dag.Servers) {
        try {
            $repHealth = Test-ReplicationHealth -Identity $member -ErrorAction Stop
            foreach ($check in $repHealth) {
                $checkResult = if ($check.Result -eq 'Passed') { 'Pass' } else { 'Fail' }
                if ($checkResult -eq 'Fail') { $overallExitCode = 1 }
                $results.Add([pscustomobject]@{
                    Timestamp = $ts; CheckName = "ReplHealth-$($check.Check)"; Target = $member
                    Result = $checkResult; Detail = "Result=$($check.Result); $($check.Error)"
                })
                Write-ReportLine "$member / $($check.Check): $($check.Result) ($checkResult)"
            }
        } catch {
            $results.Add([pscustomobject]@{
                Timestamp = $ts; CheckName = 'ReplHealth'; Target = $member
                Result = 'Fail'; Detail = "Could not run Test-ReplicationHealth: $($_.Exception.Message)"
            })
            $overallExitCode = 1
            Write-ReportLine "ERROR: could not run Test-ReplicationHealth against $member`: $($_.Exception.Message)"
        }
    }
    Write-ReportLine ""
}

# --- Redundancy cross-check: every database should have at least 2 healthy copies in a DAG ---
try {
    $copyGroups = Get-MailboxDatabaseCopyStatus -Identity * -ErrorAction Stop | Group-Object DatabaseName
    foreach ($group in $copyGroups) {
        $healthyCount = ($group.Group | Where-Object { $_.Status -in @('Mounted', 'Healthy') }).Count
        $redundancyResult = if ($healthyCount -ge 2) { 'Pass' } elseif ($healthyCount -eq 1) { 'Warning' } else { 'Fail' }
        if ($redundancyResult -ne 'Pass' -and $overallExitCode -eq 0) { $overallExitCode = 1 }
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'DB-Redundancy'; Target = $group.Name
            Result = $redundancyResult; Detail = "$healthyCount of $($group.Count) copies healthy"
        })
        Write-ReportLine "$($group.Name) redundancy: $healthyCount of $($group.Count) copies healthy ($redundancyResult)"
    }
} catch {
    $results.Add([pscustomobject]@{
        Timestamp = $ts; CheckName = 'DB-Redundancy'; Target = '(organization)'
        Result = 'Warning'; Detail = "Could not query database copy status for redundancy check: $($_.Exception.Message)"
    })
    if ($overallExitCode -eq 0) { $overallExitCode = 1 }
    Write-ReportLine "WARNING: could not query database copy status for redundancy check: $($_.Exception.Message)"
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

Write-Host "DAG health/failover readiness check complete. $passCount passed / $failCount failed / $warnCount warning(s). Report: $OutputPath"

$results
exit $overallExitCode
