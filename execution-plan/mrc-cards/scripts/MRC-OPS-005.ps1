<#
.SYNOPSIS
    Verifies that all five FSMO role holders are online and reachable, and reports current assignment.

.DESCRIPTION
    Automates the check/report portion of MRC-OPS-005 -- FSMO role holder verification (monthly task,
    execution-plan/mrc-cards/ops/MRC-OPS-005.md).

    Enumerates the current holder of each of the five FSMO roles (Schema Master, Domain Naming Master,
    RID Master, PDC Emulator, Infrastructure Master) via the ActiveDirectory module, then confirms each
    holder is online (responds to ping / RPC) and, where possible, that the Active Directory Domain
    Services (NTDS) service is running on it.

    This script does NOT transfer or seize any FSMO role. It is strictly a verification/reporting tool.
    Role transfer or seizure is a deliberate, high-impact, documented change-control action that is
    explicitly out of scope for this script and for the routine MRC-OPS-005 check itself.

.PARAMETER OutputPath
    Path to write the combined report file. Defaults to
    .\reports\MRC-OPS-005_<yyyyMMdd-HHmmss>.txt (created if it does not exist).

.EXAMPLE
    .\MRC-OPS-005.ps1
    Enumerates and verifies all five FSMO role holders for the current forest/domain.

.EXAMPLE
    .\MRC-OPS-005.ps1 -OutputPath C:\Evidence\fsmo-2026-08.txt
    Same check, with an explicit report path.

.NOTES
    MRC ID     : MRC-OPS-005 -- FSMO role holder verification
    Card       : ../ops/MRC-OPS-005.md
    Frequency  : Monthly
    Baseline   : Active Directory / Windows Server (per AGENTS.md rule 8)
    Requires   : ActiveDirectory PowerShell module (RSAT: Active Directory Domain Services and Lightweight
                 Directory Services Tools) with rights to read forest/domain configuration.
    Exit codes : 0 = all five role holders identified and reachable/service running. 1 = a role holder
                 could not be identified, is unreachable, or its NTDS service is not running.

    SAFETY DISCLAIMER: Provided as a starting point for the stated baseline environment. Not
    validated against a live production system in this repository. A human must review this script's
    logic and test it in a non-production environment before operational use, per the organization's
    own change-control process.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string] $OutputPath = ".\reports\MRC-OPS-005_$(Get-Date -Format 'yyyyMMdd-HHmmss').txt"
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

Write-ReportLine "MRC-OPS-005 -- FSMO role holder verification"
Write-ReportLine "Run timestamp : $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz')"
Write-ReportLine "Run by        : $env:USERDOMAIN\$env:USERNAME on $env:COMPUTERNAME"
Write-ReportLine ("=" * 78)
Write-ReportLine ""

if (-not (Get-Module -ListAvailable -Name ActiveDirectory)) {
    Write-Warning "The ActiveDirectory PowerShell module is not available on this host. Install RSAT: Active Directory Domain Services and Lightweight Directory Services Tools."
}
Import-Module ActiveDirectory -ErrorAction Stop

$ts = Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz'
$roleHolders = @{}

try {
    $forest = Get-ADForest -ErrorAction Stop
    $roleHolders['SchemaMaster']    = $forest.SchemaMaster
    $roleHolders['DomainNamingMaster'] = $forest.DomainNamingMaster
} catch {
    $results.Add([pscustomobject]@{
        Timestamp = $ts; CheckName = 'FSMO-ForestRoles'; Target = '(forest)'
        Result = 'Fail'; Detail = "Could not query forest-wide FSMO roles: $($_.Exception.Message)"
    })
    $overallExitCode = 1
    Write-ReportLine "ERROR: could not query forest-wide FSMO roles: $($_.Exception.Message)"
}

try {
    $domain = Get-ADDomain -ErrorAction Stop
    $roleHolders['RIDMaster']            = $domain.RIDMaster
    $roleHolders['PDCEmulator']          = $domain.PDCEmulator
    $roleHolders['InfrastructureMaster'] = $domain.InfrastructureMaster
} catch {
    $results.Add([pscustomobject]@{
        Timestamp = $ts; CheckName = 'FSMO-DomainRoles'; Target = '(domain)'
        Result = 'Fail'; Detail = "Could not query domain-wide FSMO roles: $($_.Exception.Message)"
    })
    $overallExitCode = 1
    Write-ReportLine "ERROR: could not query domain-wide FSMO roles: $($_.Exception.Message)"
}

foreach ($role in @('SchemaMaster', 'DomainNamingMaster', 'RIDMaster', 'PDCEmulator', 'InfrastructureMaster')) {
    $holder = $roleHolders[$role]
    if (-not $holder) {
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = "FSMO-$role"; Target = '(unknown)'
            Result = 'Fail'; Detail = "Role holder could not be determined (see forest/domain query error above)"
        })
        $overallExitCode = 1
        Write-ReportLine "$role`: FAIL -- role holder could not be determined"
        continue
    }

    Write-ReportLine "$role`: holder = $holder"

    # Reachability check
    $pingOk = $false
    try {
        $pingOk = Test-Connection -ComputerName $holder -Count 2 -Quiet -ErrorAction Stop
    } catch {
        $pingOk = $false
    }

    if (-not $pingOk) {
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = "FSMO-$role"; Target = $holder
            Result = 'Fail'; Detail = "Role holder $holder did not respond to ICMP ping"
        })
        $overallExitCode = 1
        Write-ReportLine "  -> FAIL: $holder did not respond to ping"
        continue
    }

    # NTDS service check (best-effort; requires remote service query rights)
    $svcResult = 'Pass'
    $svcDetail = "$holder responded to ping"
    try {
        $svc = Get-Service -ComputerName $holder -Name NTDS -ErrorAction Stop
        if ($svc.Status -ne 'Running') {
            $svcResult = 'Fail'
            $svcDetail = "NTDS service on $holder is $($svc.Status), expected Running"
        } else {
            $svcDetail = "$holder reachable; NTDS service Running"
        }
    } catch {
        $svcResult = 'Warning'
        $svcDetail = "$holder reachable via ping, but could not query NTDS service remotely: $($_.Exception.Message)"
    }

    $results.Add([pscustomobject]@{
        Timestamp = $ts; CheckName = "FSMO-$role"; Target = $holder
        Result = $svcResult; Detail = $svcDetail
    })
    if ($svcResult -eq 'Fail') { $overallExitCode = 1 }
    elseif ($svcResult -eq 'Warning' -and $overallExitCode -eq 0) { $overallExitCode = 1 }
    Write-ReportLine "  -> $svcResult`: $svcDetail"
}

Write-ReportLine ""
Write-ReportLine ("=" * 78)
Write-ReportLine "SUMMARY"
Write-ReportLine ("=" * 78)
$summaryLines = $results | Sort-Object CheckName |
    Format-Table Timestamp, CheckName, Target, Result, Detail -AutoSize | Out-String
Write-ReportLine $summaryLines

$failCount = ($results | Where-Object Result -eq 'Fail').Count
$warnCount = ($results | Where-Object Result -eq 'Warning').Count
$passCount = ($results | Where-Object Result -eq 'Pass').Count
Write-ReportLine "Totals: $passCount passed, $failCount failed, $warnCount warning(s) across 5 FSMO roles."

Write-Host "FSMO role holder verification complete. $passCount passed / $failCount failed / $warnCount warning(s). Report: $OutputPath"

$results
exit $overallExitCode
