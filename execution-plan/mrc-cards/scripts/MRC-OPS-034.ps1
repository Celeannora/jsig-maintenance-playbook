<#
.SYNOPSIS
    Checks that a defined set of core/critical Windows services are running on one or more
    Windows Server hosts.

.DESCRIPTION
    Automates MRC-OPS-034 -- Core Windows service health check across servers (daily task,
    execution-plan/mrc-cards/ops/MRC-OPS-034.md).

    On each -ComputerName, this script uses Get-Service to confirm that every service named in
    -ServiceNames (default: a baseline set of core Windows services -- see below) reports
    Status = Running. A service present but not Running is flagged Fail; a service named in
    -ServiceNames but not found on the host at all is flagged Warning (it may be a role/feature
    not installed on that particular host, which the operator should confirm is expected rather
    than an oversight).

    Default -ServiceNames baseline (adjust for this organization's actual server roles):
      RpcSs         - Remote Procedure Call (RPC), required by nearly every other service
      EventLog      - Windows Event Log
      Dnscache      - DNS Client
      LanmanServer  - Server (SMB server-side)
      LanmanWorkstation - Workstation (SMB client-side)
      Netlogon      - Netlogon (domain-joined hosts / domain controllers)
      W32Time       - Windows Time
      Schedule      - Task Scheduler

    This script is READ-ONLY. It never starts, stops, restarts, or reconfigures any service.

.PARAMETER ComputerName
    One or more computer names to check. Defaults to the local computer ($env:COMPUTERNAME).
    Remote targets are queried via Invoke-Command (requires WinRM/PSRemoting access).

.PARAMETER ServiceNames
    One or more service names (the short Name, not DisplayName) to check. Defaults to the
    baseline set listed above. Override with this organization's actual list of services this
    card should track (e.g. add DNS Server, DHCP Server, or Print Spooler on hosts with those
    roles).

.PARAMETER OutputPath
    Path to write the combined report file. Defaults to
    .\reports\MRC-OPS-034_<yyyyMMdd-HHmmss>.txt (created if it does not exist).

.EXAMPLE
    .\MRC-OPS-034.ps1 -ComputerName dc01.example.mil -ServiceNames RpcSs,EventLog,Netlogon,W32Time,DNS
    Checks the listed core services (including the DNS Server service, appropriate for a
    domain controller) on dc01.

.NOTES
    MRC ID     : MRC-OPS-034 -- Core Windows service health check across servers
    Card       : ../ops/MRC-OPS-034.md
    Frequency  : Daily
    Baseline   : Windows Server (General) / Services console
    Requires   : Built-in Get-Service cmdlet (present on all supported Windows Server versions)
                 and, for remote -ComputerName targets, WinRM/PSRemoting access.
    Exit codes : 0 = every named service is found and Running on every host. 1 = any named
                 service is found but not Running, any named service is not found on a host, or
                 a host could not be queried.

    SAFETY DISCLAIMER: Provided as a starting point for the stated baseline environment. Not
    validated against a live production system in this repository. A human must review this
    script's logic -- especially the default -ServiceNames list, which must be tailored to this
    organization's actual server roles -- and test it in a non-production environment before
    operational use, per the organization's own change-control process. This script never
    starts, stops, or modifies any service.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string[]] $ComputerName = @($env:COMPUTERNAME),

    [Parameter(Mandatory = $false)]
    [string[]] $ServiceNames = @('RpcSs', 'EventLog', 'Dnscache', 'LanmanServer', 'LanmanWorkstation', 'Netlogon', 'W32Time', 'Schedule'),

    [Parameter(Mandatory = $false)]
    [string] $OutputPath = ".\reports\MRC-OPS-034_$(Get-Date -Format 'yyyyMMdd-HHmmss').txt"
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

Write-ReportLine "MRC-OPS-034 -- Core Windows service health check across servers"
Write-ReportLine "Run timestamp : $ts"
Write-ReportLine "Run by        : $env:USERDOMAIN\$env:USERNAME on $env:COMPUTERNAME"
Write-ReportLine "Service list  : $($ServiceNames -join ', ')"
Write-ReportLine ("=" * 78)
Write-ReportLine ""

$checkScript = {
    param($Names)
    $out = @()
    foreach ($name in $Names) {
        $svc = Get-Service -Name $name -ErrorAction SilentlyContinue
        if (-not $svc) {
            $out += [pscustomobject]@{ Name = $name; Found = $false; Status = $null }
        } else {
            $out += [pscustomobject]@{ Name = $name; Found = $true; Status = $svc.Status.ToString() }
        }
    }
    $out
}

foreach ($comp in $ComputerName) {
    Write-ReportLine "--- $comp ---"
    try {
        $data = if ($comp -eq $env:COMPUTERNAME -or $comp -eq 'localhost') {
            & $checkScript $ServiceNames
        } else {
            Invoke-Command -ComputerName $comp -ScriptBlock $checkScript -ArgumentList (,$ServiceNames) -ErrorAction Stop
        }

        foreach ($svc in $data) {
            if (-not $svc.Found) {
                $overallExitCode = 1
                $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Service-Health'; Target = "$comp : $($svc.Name)"; Result = 'Warning'; Detail = 'Service not found on this host -- confirm this role/feature is not expected here' })
                Write-ReportLine "Service '$($svc.Name)': not found (Warning)"
            } elseif ($svc.Status -ne 'Running') {
                $overallExitCode = 1
                $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Service-Health'; Target = "$comp : $($svc.Name)"; Result = 'Fail'; Detail = "Status=$($svc.Status)" })
                Write-ReportLine "Service '$($svc.Name)': $($svc.Status) (Fail)"
            } else {
                $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Service-Health'; Target = "$comp : $($svc.Name)"; Result = 'Pass'; Detail = 'Status=Running' })
                Write-ReportLine "Service '$($svc.Name)': Running (Pass)"
            }
        }
    } catch {
        $overallExitCode = 1
        $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Service-Health'; Target = $comp; Result = 'Fail'; Detail = "Could not query host: $($_.Exception.Message)" })
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

Write-Host "Core service health check complete. $passCount passed / $failCount failed/warning. Report: $OutputPath"

$results
exit $overallExitCode
