<#
.SYNOPSIS
    Checks DHCP scope utilization on a Windows DHCP server and flags scopes nearing address
    exhaustion.

.DESCRIPTION
    Automates MRC-OPS-032 -- DHCP scope utilization and lease health check (weekly task,
    execution-plan/mrc-cards/ops/MRC-OPS-032.md).

    Uses the built-in DhcpServer PowerShell module to:
      1. Enumerate configured IPv4 scopes on -DhcpServer via Get-DhcpServerv4Scope, and flag
         any scope reporting State other than 'Active' as informational (not itself a Fail --
         an intentionally deactivated scope is a design decision, not a health issue -- but
         worth surfacing in case it is unintentional).
      2. For each Active scope, pull utilization via Get-DhcpServerv4ScopeStatistics and flag
         any scope whose PercentageInUse is at or above -ScopeUtilizationWarnPercent, since a
         near-exhausted scope risks clients failing to obtain a lease.

    This script is READ-ONLY. It never creates, modifies, deactivates, or deletes any scope,
    reservation, or lease, and never changes DHCP server configuration.

.PARAMETER DhcpServer
    DHCP server name to connect to. Defaults to the local computer ($env:COMPUTERNAME).

.PARAMETER ScopeUtilizationWarnPercent
    Flag an Active scope as Warning if its Get-DhcpServerv4ScopeStatistics PercentageInUse
    value is at or above this threshold. Default: 85.

.PARAMETER OutputPath
    Path to write the combined report file. Defaults to
    .\reports\MRC-OPS-032_<yyyyMMdd-HHmmss>.txt (created if it does not exist).

.EXAMPLE
    .\MRC-OPS-032.ps1 -DhcpServer dhcp01.example.mil -ScopeUtilizationWarnPercent 90
    Checks all IPv4 scopes on dhcp01 and flags any at or above 90% utilization.

.NOTES
    MRC ID     : MRC-OPS-032 -- DHCP scope utilization and lease health check
    Card       : ../ops/MRC-OPS-032.md
    Frequency  : Weekly
    Baseline   : Windows Server (General) / Windows Server DHCP Server role
    Requires   : The built-in DhcpServer PowerShell module (present on any Windows Server with
                 the DHCP Server role, or via RSAT on an admin workstation) and network access
                 to query the target DHCP server (RPC).
    Exit codes : 0 = server reachable and every Active scope's utilization is below
                 -ScopeUtilizationWarnPercent. 1 = any Active scope is at or above the
                 threshold, or the server/scope list could not be queried.

    SAFETY DISCLAIMER: Provided as a starting point for the stated baseline environment. Not
    validated against a live production system in this repository. A human must review this
    script's logic and test it in a non-production environment before operational use, per the
    organization's own change-control process. This script never modifies any scope,
    reservation, lease, or DHCP server configuration.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string] $DhcpServer = $env:COMPUTERNAME,

    [Parameter(Mandatory = $false)]
    [int] $ScopeUtilizationWarnPercent = 85,

    [Parameter(Mandatory = $false)]
    [string] $OutputPath = ".\reports\MRC-OPS-032_$(Get-Date -Format 'yyyyMMdd-HHmmss').txt"
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

Write-ReportLine "MRC-OPS-032 -- DHCP scope utilization and lease health check"
Write-ReportLine "Run timestamp : $ts"
Write-ReportLine "Run by        : $env:USERDOMAIN\$env:USERNAME on $env:COMPUTERNAME"
Write-ReportLine "DHCP server   : $DhcpServer"
Write-ReportLine ("=" * 78)
Write-ReportLine ""

try {
    $scopes = @(Get-DhcpServerv4Scope -ComputerName $DhcpServer)

    if ($scopes.Count -eq 0) {
        Write-ReportLine "No IPv4 scopes configured on $DhcpServer"
    }

    foreach ($scope in $scopes) {
        if ($scope.State -ne 'Active') {
            $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Scope-State'; Target = "$DhcpServer : $($scope.ScopeId)"; Result = 'Pass'; Detail = "Scope '$($scope.Name)' State=$($scope.State) (informational -- not counted as a failure)" })
            Write-ReportLine "Scope $($scope.ScopeId) ('$($scope.Name)'): State=$($scope.State) (informational, not Active -- skipped from utilization check)"
            continue
        }

        try {
            $stats = Get-DhcpServerv4ScopeStatistics -ComputerName $DhcpServer -ScopeId $scope.ScopeId
            if ($stats.PercentageInUse -ge $ScopeUtilizationWarnPercent) {
                $overallExitCode = 1
                $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Scope-Utilization'; Target = "$DhcpServer : $($scope.ScopeId)"; Result = 'Warning'; Detail = "Scope '$($scope.Name)' at $($stats.PercentageInUse)% utilization (threshold $ScopeUtilizationWarnPercent%)" })
                Write-ReportLine "Scope $($scope.ScopeId) ('$($scope.Name)'): $($stats.PercentageInUse)% in use (Warning, threshold $ScopeUtilizationWarnPercent%)"
            } else {
                $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Scope-Utilization'; Target = "$DhcpServer : $($scope.ScopeId)"; Result = 'Pass'; Detail = "Scope '$($scope.Name)' at $($stats.PercentageInUse)% utilization" })
                Write-ReportLine "Scope $($scope.ScopeId) ('$($scope.Name)'): $($stats.PercentageInUse)% in use (Pass)"
            }
        } catch {
            $overallExitCode = 1
            $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Scope-Utilization'; Target = "$DhcpServer : $($scope.ScopeId)"; Result = 'Fail'; Detail = "Could not read scope statistics: $($_.Exception.Message)" })
            Write-ReportLine "ERROR: could not read statistics for scope $($scope.ScopeId): $($_.Exception.Message)"
        }
    }
} catch {
    $overallExitCode = 1
    $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'DHCP-Connect'; Target = $DhcpServer; Result = 'Fail'; Detail = "Could not query DHCP server: $($_.Exception.Message)" })
    Write-ReportLine "ERROR: could not query DHCP server $DhcpServer`: $($_.Exception.Message)"
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

Write-Host "DHCP scope utilization check complete. $passCount passed / $failCount failed/warning. Report: $OutputPath"

$results
exit $overallExitCode
