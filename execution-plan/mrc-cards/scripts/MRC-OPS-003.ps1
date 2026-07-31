<#
.SYNOPSIS
    Checks DNS Server service health and zone aging/scavenging configuration and produces a structured report.

.DESCRIPTION
    Automates the check/report portion of MRC-OPS-003 -- DNS zone health and scavenging review
    (weekly task, execution-plan/mrc-cards/ops/MRC-OPS-003.md).

    For each target DNS server (defaults to every domain controller, since AD-integrated DNS normally
    runs on DCs in this baseline), the script:
      - Confirms the DNS Server service is running.
      - Reads server-wide scavenging configuration (Get-DnsServerScavenging) and flags a Warning if
        scavenging is enabled but has never run, or has not run within roughly 2x its configured
        interval (a likely-stuck scavenging cycle).
      - Reads per-zone aging configuration (Get-DnsServerZoneAging) for every zone and reports it
        informationally (Pass) -- whether aging *should* be enabled for a given zone is an
        organizational policy decision, not something this script judges.

    This script is READ-ONLY. It never enables/disables scavenging, changes aging settings, or forces
    a scavenging cycle (Start-DnsServerScavenging). Any configuration change is a separate, deliberate,
    documented action per the card's Procedure section.

.PARAMETER ComputerName
    One or more DNS server host names to check. Defaults to every domain controller in the current
    user's domain, discovered via the ActiveDirectory module (Get-ADDomainController -Filter *). If the
    ActiveDirectory module is not available and -ComputerName is not supplied, the script checks only
    the local host.

.PARAMETER OutputPath
    Path to write the combined report file. Defaults to
    .\reports\MRC-OPS-003_<yyyyMMdd-HHmmss>.txt (the reports folder is created if it does not exist).

.EXAMPLE
    .\MRC-OPS-003.ps1
    Discovers all domain controllers and checks DNS service health plus scavenging/aging configuration
    on each.

.EXAMPLE
    .\MRC-OPS-003.ps1 -ComputerName DNS01,DNS02 -OutputPath C:\Evidence\dns-2026-08-03.txt
    Checks only the named DNS servers.

.NOTES
    MRC ID     : MRC-OPS-003 -- DNS zone health and scavenging review
    Card       : ../ops/MRC-OPS-003.md
    Frequency  : Weekly
    Baseline   : Windows Server / Active Directory, DNS Server role (per AGENTS.md rule 8)
    Requires   : DnsServer PowerShell module (installed with the DNS Server role or RSAT: DNS Server Tools)
    Exit codes : 0 = DNS service running everywhere and no stuck-scavenging warnings. 1 = a stopped
                 service, a likely-stuck scavenging cycle, or a target could not be queried.

    SAFETY DISCLAIMER: Provided as a starting point for the stated baseline environment. Not
    validated against a live production system in this repository. A human must review this script's
    logic and test it in a non-production environment before operational use, per the organization's
    own change-control process.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string[]] $ComputerName,

    [Parameter(Mandatory = $false)]
    [string] $OutputPath = ".\reports\MRC-OPS-003_$(Get-Date -Format 'yyyyMMdd-HHmmss').txt"
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

Write-ReportLine "MRC-OPS-003 -- DNS zone health and scavenging review"
Write-ReportLine "Run timestamp : $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz')"
Write-ReportLine "Run by        : $env:USERDOMAIN\$env:USERNAME on $env:COMPUTERNAME"
Write-ReportLine "Targets       : $($ComputerName -join ', ')"
Write-ReportLine ("=" * 78)
Write-ReportLine ""

if (-not (Get-Module -ListAvailable -Name DnsServer)) {
    Write-Warning "The DnsServer PowerShell module is not available on this host. Install RSAT: DNS Server Tools or run this script from a DNS server / DC."
}

foreach ($dns in $ComputerName) {
    $ts = Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz'
    Write-ReportLine "--- Target: $dns ---"

    # --- DNS Server service state ---
    try {
        $svc = Get-Service -ComputerName $dns -Name DNS -ErrorAction Stop
        $svcResult = if ($svc.Status -eq 'Running') { 'Pass' } else { 'Fail' }
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'DNS-Service'; Target = $dns
            Result = $svcResult; Detail = "Service status: $($svc.Status)"
        })
        if ($svcResult -eq 'Fail') { $overallExitCode = 1 }
        Write-ReportLine "DNS Server service on $dns`: $($svc.Status)"
    } catch {
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'DNS-Service'; Target = $dns
            Result = 'Fail'; Detail = "Could not query DNS service: $($_.Exception.Message)"
        })
        $overallExitCode = 1
        Write-ReportLine "ERROR: could not query DNS service on $dns`: $($_.Exception.Message)"
        Write-ReportLine ""
        continue
    }

    # --- Server-wide scavenging configuration ---
    try {
        $scav = Get-DnsServerScavenging -ComputerName $dns -ErrorAction Stop
        $scavDetail = "ScavengingState=$($scav.ScavengingState); ScavengingInterval=$($scav.ScavengingInterval); LastScavengeTime=$($scav.LastScavengeTime)"
        $scavResult = 'Pass'
        if ($scav.ScavengingState -eq $true) {
            $intervalHours = $scav.ScavengingInterval.TotalHours
            if (-not $scav.LastScavengeTime -or $scav.LastScavengeTime -eq [datetime]::MinValue) {
                $scavResult = 'Warning'
                $scavDetail += " -- scavenging is enabled but has apparently never run"
            } elseif ($intervalHours -gt 0 -and ((Get-Date) - $scav.LastScavengeTime).TotalHours -gt (2 * $intervalHours)) {
                $scavResult = 'Warning'
                $scavDetail += " -- last scavenge is more than 2x the configured interval ago (possible stuck cycle)"
            }
        }
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'DNS-Scavenging'; Target = $dns
            Result = $scavResult; Detail = $scavDetail
        })
        if ($scavResult -ne 'Pass' -and $overallExitCode -eq 0) { $overallExitCode = 1 }
        Write-ReportLine "Scavenging config on $dns`: $scavDetail"
    } catch {
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'DNS-Scavenging'; Target = $dns
            Result = 'Warning'; Detail = "Could not query scavenging configuration: $($_.Exception.Message)"
        })
        if ($overallExitCode -eq 0) { $overallExitCode = 1 }
        Write-ReportLine "WARNING: could not query scavenging configuration on $dns`: $($_.Exception.Message)"
    }

    # --- Per-zone aging configuration (informational) ---
    try {
        $zones = Get-DnsServerZone -ComputerName $dns -ErrorAction Stop | Where-Object { -not $_.IsAutoCreated }
        foreach ($zone in $zones) {
            try {
                $aging = Get-DnsServerZoneAging -ComputerName $dns -Name $zone.ZoneName -ErrorAction Stop
                $results.Add([pscustomobject]@{
                    Timestamp = $ts; CheckName = 'DNS-ZoneAging'; Target = "$dns/$($zone.ZoneName)"
                    Result = 'Pass'
                    Detail = "AgingEnabled=$($aging.AgingEnabled); NoRefreshInterval=$($aging.NoRefreshInterval); RefreshInterval=$($aging.RefreshInterval); ZoneType=$($zone.ZoneType); DsIntegrated=$($zone.IsDsIntegrated)"
                })
            } catch {
                $results.Add([pscustomobject]@{
                    Timestamp = $ts; CheckName = 'DNS-ZoneAging'; Target = "$dns/$($zone.ZoneName)"
                    Result = 'Warning'; Detail = "Could not query aging settings for this zone (may not support aging, e.g. a secondary or stub zone): $($_.Exception.Message)"
                })
            }
        }
        Write-ReportLine "Zones enumerated on $dns`: $($zones.Count)"
    } catch {
        Write-ReportLine "WARNING: could not enumerate zones on $dns`: $($_.Exception.Message)"
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

Write-Host "DNS health/scavenging check complete. $passCount passed / $failCount failed / $warnCount warning(s). Report: $OutputPath"

$results
exit $overallExitCode
