<#
.SYNOPSIS
    Verifies that the Netlogon, Kerberos Key Distribution Center (KDC), and DNS Server services are
    running on every target domain controller.

.DESCRIPTION
    Automates MRC-OPS-010 -- Netlogon/KDC/DNS Server service health check (daily task,
    execution-plan/mrc-cards/ops/MRC-OPS-010.md).

    Queries the Netlogon, Kdc, and DNS service state on each target domain controller via
    Get-Service (remote or local). A DC where any of these three services is not in the Running state
    cannot authenticate users/computers (Netlogon/KDC) or resolve AD-integrated DNS records (DNS), so
    any non-Running state is flagged Fail.

    This script is READ-ONLY -- it never starts, stops, or restarts a service. Any remediation (e.g.
    starting a stopped service) is a deliberate action taken by a human after reviewing this report,
    since a stopped core service on a DC often indicates an underlying problem that should be
    understood before simply restarting it (see the card's Section 4 Safety and Section 5.3 triage
    table).

.PARAMETER ComputerName
    One or more domain controller host names to check. Defaults to every domain controller in the
    current user's domain, discovered via the ActiveDirectory module. If unavailable and
    -ComputerName is not supplied, checks only the local host.

.PARAMETER OutputPath
    Path to write the combined report file. Defaults to
    .\reports\MRC-OPS-010_<yyyyMMdd-HHmmss>.txt (created if it does not exist).

.EXAMPLE
    .\MRC-OPS-010.ps1
    Discovers all domain controllers and checks Netlogon/Kdc/DNS service state on each.

.EXAMPLE
    .\MRC-OPS-010.ps1 -ComputerName DC01
    Checks a single domain controller.

.NOTES
    MRC ID     : MRC-OPS-010 -- Netlogon/KDC/DNS Server service health check
    Card       : ../ops/MRC-OPS-010.md
    Frequency  : Daily
    Baseline   : Active Directory / Windows Server (Services console) (per AGENTS.md rule 8)
    Requires   : Remote service query access (Get-Service -ComputerName) to each target, or run
                 locally on each DC. The DNS service check only applies to hosts running the DNS
                 Server role -- if a DC is not a DNS server, that check is reported Skipped rather
                 than Fail.
    Exit codes : 0 = all applicable services Running on every target. 1 = any service not Running, or
                 a target could not be queried.

    SAFETY DISCLAIMER: Provided as a starting point for the stated baseline environment. Not
    validated against a live production system in this repository. A human must review this script's
    logic and test it in a non-production environment before operational use, per the organization's
    own change-control process. This script never starts, stops, or restarts any service.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string[]] $ComputerName,

    [Parameter(Mandatory = $false)]
    [string] $OutputPath = ".\reports\MRC-OPS-010_$(Get-Date -Format 'yyyyMMdd-HHmmss').txt"
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

Write-ReportLine "MRC-OPS-010 -- Netlogon/KDC/DNS Server service health check"
Write-ReportLine "Run timestamp : $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz')"
Write-ReportLine "Run by        : $env:USERDOMAIN\$env:USERNAME on $env:COMPUTERNAME"
Write-ReportLine "Targets       : $($ComputerName -join ', ')"
Write-ReportLine ("=" * 78)
Write-ReportLine ""

$servicesToCheck = @('Netlogon', 'Kdc', 'DNS')

foreach ($dc in $ComputerName) {
    $ts = Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz'
    Write-ReportLine "--- Target: $dc ---"

    foreach ($svcName in $servicesToCheck) {
        try {
            $svc = Get-Service -ComputerName $dc -Name $svcName -ErrorAction Stop
            if ($svc.Status -eq 'Running') {
                $svcResult = 'Pass'
            } else {
                $svcResult = 'Fail'
                $overallExitCode = 1
            }
            $results.Add([pscustomobject]@{
                Timestamp = $ts; CheckName = "Service-$svcName"; Target = $dc
                Result = $svcResult; Detail = "Status=$($svc.Status), StartType=$($svc.StartType)"
            })
            Write-ReportLine "$svcName on $dc`: $($svc.Status) ($svcResult)"
        } catch {
            # DNS service absent is expected on a DC that is not a DNS server -- treat that specific
            # case as Skipped rather than Fail. Any other error (unreachable host, access denied, etc.)
            # is a genuine Fail.
            if ($svcName -eq 'DNS' -and $_.Exception.Message -match 'not exist|not found|Cannot find') {
                $results.Add([pscustomobject]@{
                    Timestamp = $ts; CheckName = "Service-$svcName"; Target = $dc
                    Result = 'Skipped'; Detail = 'DNS Server role not installed on this host'
                })
                Write-ReportLine "$svcName on $dc`: Skipped (DNS Server role not installed)"
            } else {
                $results.Add([pscustomobject]@{
                    Timestamp = $ts; CheckName = "Service-$svcName"; Target = $dc
                    Result = 'Fail'; Detail = "Could not query service: $($_.Exception.Message)"
                })
                $overallExitCode = 1
                Write-ReportLine "ERROR: could not query $svcName on $dc`: $($_.Exception.Message)"
            }
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
$passCount = ($results | Where-Object Result -eq 'Pass').Count
$skipCount = ($results | Where-Object Result -eq 'Skipped').Count
Write-ReportLine "Totals: $passCount passed, $failCount failed, $skipCount skipped across $($ComputerName.Count) target(s)."

Write-Host "Netlogon/KDC/DNS service check complete. $passCount passed / $failCount failed / $skipCount skipped. Report: $OutputPath"

$results
exit $overallExitCode
