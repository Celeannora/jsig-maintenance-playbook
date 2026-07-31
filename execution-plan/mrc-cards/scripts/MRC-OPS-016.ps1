<#
.SYNOPSIS
    Monitors Exchange/OWA/SMTP TLS certificates for upcoming expiration.

.DESCRIPTION
    Automates MRC-OPS-016 -- Exchange/OWA/SMTP certificate expiration monitoring (monthly task,
    execution-plan/mrc-cards/ops/MRC-OPS-016.md).

    Must be run from an Exchange Management Shell session. For every certificate returned by
    Get-ExchangeCertificate on the target server(s), the script computes days-until-expiration and
    flags:
      - Fail   : already expired (days remaining <= 0), or expiring within -CriticalDays (default 14).
      - Warning: expiring within -WarningDays (default 30) but outside the Critical window.
      - Pass   : more than WarningDays remaining.
    Each result also records which Exchange services the certificate is currently bound to (IIS, SMTP,
    POP, IMAP, etc.) via the certificate's Services property, since a certificate with no services
    bound is informational only and does not need renewal for continuity of service.

    This script is READ-ONLY. It never requests, imports, binds, or removes a certificate -- renewal
    and rebind are always a deliberate, change-controlled action taken by a human.

.PARAMETER Server
    Exchange server(s) to check. Defaults to every server in the organization returned by
    Get-ExchangeServer.

.PARAMETER WarningDays
    Days-until-expiration threshold for a Warning flag. Default: 30.

.PARAMETER CriticalDays
    Days-until-expiration threshold for a Fail flag. Default: 14.

.PARAMETER OutputPath
    Path to write the combined report file. Defaults to
    .\reports\MRC-OPS-016_<yyyyMMdd-HHmmss>.txt (created if it does not exist).

.EXAMPLE
    .\MRC-OPS-016.ps1
    Checks certificate expiration on every Exchange server in the organization.

.NOTES
    MRC ID     : MRC-OPS-016 -- Exchange/OWA/SMTP certificate expiration monitoring
    Card       : ../ops/MRC-OPS-016.md
    Frequency  : Monthly
    Baseline   : Exchange Server (Get-ExchangeCertificate) (per AGENTS.md rule 8)
    Requires   : Must be run in (or via a remote session to) Exchange Management Shell.
    Exit codes : 0 = every certificate with a bound service has more than WarningDays remaining.
                 1 = a certificate with a bound service is expired or inside the Warning/Critical
                 window, or a server could not be queried.

    SAFETY DISCLAIMER: Provided as a starting point for the stated baseline environment. Not
    validated against a live production system in this repository. A human must review this script's
    logic and test it in a non-production environment before operational use, per the organization's
    own change-control process. This script never modifies certificate bindings or configuration.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string[]] $Server,

    [Parameter(Mandatory = $false)]
    [int] $WarningDays = 30,

    [Parameter(Mandatory = $false)]
    [int] $CriticalDays = 14,

    [Parameter(Mandatory = $false)]
    [string] $OutputPath = ".\reports\MRC-OPS-016_$(Get-Date -Format 'yyyyMMdd-HHmmss').txt"
)

$ErrorActionPreference = 'Stop'
$results = New-Object System.Collections.Generic.List[object]
$overallExitCode = 0

function Write-ReportLine {
    param([string] $Line)
    Add-Content -LiteralPath $OutputPath -Value $Line
}

if (-not (Get-Command Get-ExchangeCertificate -ErrorAction SilentlyContinue)) {
    throw "Get-ExchangeCertificate is not available. Run this script from an Exchange Management Shell session (or a session with the Exchange management tools/remote PowerShell session loaded)."
}

if (-not $Server) {
    try {
        $Server = (Get-ExchangeServer -ErrorAction Stop).Name
    } catch {
        Write-Warning "Could not enumerate Exchange servers via Get-ExchangeServer ($($_.Exception.Message)). Falling back to local host."
        $Server = @($env:COMPUTERNAME)
    }
}

$outDir = Split-Path -Path $OutputPath -Parent
if ($outDir -and -not (Test-Path -LiteralPath $outDir)) {
    New-Item -ItemType Directory -Path $outDir -Force | Out-Null
}
New-Item -ItemType File -Path $OutputPath -Force | Out-Null

$ts = Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz'
$now = Get-Date

Write-ReportLine "MRC-OPS-016 -- Exchange/OWA/SMTP certificate expiration monitoring"
Write-ReportLine "Run timestamp : $ts"
Write-ReportLine "Run by        : $env:USERDOMAIN\$env:USERNAME on $env:COMPUTERNAME"
Write-ReportLine "Targets       : $($Server -join ', ')"
Write-ReportLine "Warning threshold: $WarningDays day(s); Critical threshold: $CriticalDays day(s)"
Write-ReportLine ("=" * 78)
Write-ReportLine ""

foreach ($srv in $Server) {
    Write-ReportLine "--- Target: $srv ---"
    try {
        $certs = Get-ExchangeCertificate -Server $srv -ErrorAction Stop
        foreach ($cert in $certs) {
            $daysRemaining = [math]::Floor(($cert.NotAfter - $now).TotalDays)
            $hasBoundServices = -not [string]::IsNullOrWhiteSpace([string]$cert.Services) -and $cert.Services -ne 'None'

            if ($daysRemaining -le $CriticalDays) {
                $certResult = 'Fail'
            } elseif ($daysRemaining -le $WarningDays) {
                $certResult = 'Warning'
            } else {
                $certResult = 'Pass'
            }

            # A certificate not bound to any service is informational -- it does not affect
            # continuity of service, so it never raises the script's overall exit code.
            if ($hasBoundServices -and $certResult -ne 'Pass' -and $overallExitCode -eq 0) {
                $overallExitCode = 1
            }
            if (-not $hasBoundServices -and $certResult -ne 'Pass') {
                $certResult = "$certResult(Unbound)"
            }

            $results.Add([pscustomobject]@{
                Timestamp = $ts; CheckName = 'Cert-Expiration'; Target = "$srv/$($cert.Thumbprint)"
                Result = $certResult
                Detail = "Subject=$($cert.Subject); Services=$($cert.Services); NotAfter=$($cert.NotAfter); DaysRemaining=$daysRemaining"
            })
            Write-ReportLine "$srv cert $($cert.Thumbprint) ($($cert.Subject)): expires $($cert.NotAfter) ($daysRemaining days), Services=$($cert.Services) -> $certResult"
        }
    } catch {
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'Cert-Expiration'; Target = $srv
            Result = 'Fail'; Detail = "Could not query certificates: $($_.Exception.Message)"
        })
        $overallExitCode = 1
        Write-ReportLine "ERROR: could not query certificates on $srv`: $($_.Exception.Message)"
    }
    Write-ReportLine ""
}

Write-ReportLine ("=" * 78)
Write-ReportLine "SUMMARY"
Write-ReportLine ("=" * 78)
$summaryLines = $results | Sort-Object Target |
    Format-Table Timestamp, Target, CheckName, Result, Detail -AutoSize | Out-String
Write-ReportLine $summaryLines

$failCount = ($results | Where-Object { $_.Result -like 'Fail*' }).Count
$warnCount = ($results | Where-Object { $_.Result -like 'Warning*' }).Count
$passCount = ($results | Where-Object Result -eq 'Pass').Count
Write-ReportLine "Totals: $passCount passed, $failCount failed, $warnCount warning(s) across $($Server.Count) target(s)."

Write-Host "Certificate expiration monitoring complete. $passCount passed / $failCount failed / $warnCount warning(s). Report: $OutputPath"

$results
exit $overallExitCode
