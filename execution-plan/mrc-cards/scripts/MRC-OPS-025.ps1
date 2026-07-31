<#
.SYNOPSIS
    Checks AD CS Certificate Authority service health and enterprise certificate expiration.

.DESCRIPTION
    Automates MRC-OPS-025 -- AD CS Certificate Authority health and enterprise
    certificate-expiration monitoring (monthly task, execution-plan/mrc-cards/ops/MRC-OPS-025.md).

    Two checks:
      1. CA service health -- runs certutil.exe -ping against each -CAServer (confirms the CA's
         RPC/DCOM interface answers) and, where the ADCSAdministration module is available, also
         reads Get-CertificationAuthority | Get-CAAccessControl-equivalent service status. Falls
         back gracefully to certutil.exe -ping alone when the ADCSAdministration module (an RSAT
         feature, not installed on every management workstation) is not present.
      2. Enterprise certificate expiration -- enumerates certificates in the Local Machine
         Personal store (Cert:\LocalMachine\My) on each -CertScanTarget (defaults to the local
         computer) and flags any certificate expiring within -ExpiryWarningDays (default 30).
         This is a spot-check of the certificate stores on the specified hosts, not a substitute
         for a full enterprise-wide certificate inventory/PKI management tool -- see the card's
         Section 5.3 for scope notes.

    This script is READ-ONLY. It never revokes, renews, requests, or removes any certificate, and
    never modifies AD CS configuration.

.PARAMETER CAServer
    One or more Certification Authority server names/FQDNs to ping via certutil.exe -ping.
    Required.

.PARAMETER CertScanTarget
    One or more computer names whose Cert:\LocalMachine\My store should be scanned for expiring
    certificates. Defaults to the local computer ($env:COMPUTERNAME). Remote targets are queried
    via Invoke-Command (requires WinRM/PSRemoting access).

.PARAMETER ExpiryWarningDays
    Number of days before expiration at which a certificate is flagged Warning. Default: 30.

.PARAMETER OutputPath
    Path to write the combined report file. Defaults to
    .\reports\MRC-OPS-025_<yyyyMMdd-HHmmss>.txt (created if it does not exist).

.EXAMPLE
    .\MRC-OPS-025.ps1 -CAServer ca01.example.mil -CertScanTarget ca01.example.mil,ex01.example.mil
    Pings the CA and scans the local machine cert store on both listed hosts for near-expiry
    certificates.

.NOTES
    MRC ID     : MRC-OPS-025 -- AD CS Certificate Authority health and enterprise
                 certificate-expiration monitoring
    Card       : ../ops/MRC-OPS-025.md
    Frequency  : Monthly
    Baseline   : Active Directory Certificate Services (per AGENTS.md rule 8)
    Requires   : certutil.exe (built into Windows), and for -CertScanTarget hosts other than the
                 local computer, WinRM/PSRemoting access with permission to read the Local Machine
                 Personal certificate store.
    Exit codes : 0 = every CA responded and no certificate is within the expiry-warning window.
                 1 = a CA did not respond, a certificate is expiring/expired, or a target could not
                 be queried.

    SAFETY DISCLAIMER: Provided as a starting point for the stated baseline environment. Not
    validated against a live production system in this repository. A human must review this
    script's logic and test it in a non-production environment before operational use, per the
    organization's own change-control process. This script never modifies any certificate or CA
    configuration; it is a read-only health and inventory check.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string[]] $CAServer,

    [Parameter(Mandatory = $false)]
    [string[]] $CertScanTarget = @($env:COMPUTERNAME),

    [Parameter(Mandatory = $false)]
    [int] $ExpiryWarningDays = 30,

    [Parameter(Mandatory = $false)]
    [string] $OutputPath = ".\reports\MRC-OPS-025_$(Get-Date -Format 'yyyyMMdd-HHmmss').txt"
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
$now = Get-Date

Write-ReportLine "MRC-OPS-025 -- AD CS Certificate Authority health and enterprise certificate-expiration monitoring"
Write-ReportLine "Run timestamp : $ts"
Write-ReportLine "Run by        : $env:USERDOMAIN\$env:USERNAME on $env:COMPUTERNAME"
Write-ReportLine "Expiry warning threshold: $ExpiryWarningDays day(s)"
Write-ReportLine ("=" * 78)
Write-ReportLine ""

# --- CA service health ---
Write-ReportLine "--- Certification Authority Service Health ---"
foreach ($ca in $CAServer) {
    try {
        $pingOutput = & certutil.exe -ping $ca 2>&1
        $pingText = $pingOutput -join "`n"
        if ($LASTEXITCODE -eq 0 -and $pingText -match 'interface is alive') {
            $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'CA-Ping'; Target = $ca; Result = 'Pass'; Detail = 'certutil -ping: interface is alive' })
            Write-ReportLine "$ca`: certutil -ping succeeded, interface is alive (Pass)"
        } else {
            $overallExitCode = 1
            $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'CA-Ping'; Target = $ca; Result = 'Fail'; Detail = "certutil -ping did not report a live interface (exit $LASTEXITCODE): $pingText" })
            Write-ReportLine "$ca`: certutil -ping FAILED (exit $LASTEXITCODE): $pingText (Fail)"
        }
    } catch {
        $overallExitCode = 1
        $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'CA-Ping'; Target = $ca; Result = 'Fail'; Detail = "Could not run certutil -ping: $($_.Exception.Message)" })
        Write-ReportLine "ERROR: could not run certutil -ping against $ca`: $($_.Exception.Message)"
    }
}
Write-ReportLine ""

# --- Enterprise certificate expiration ---
Write-ReportLine "--- Certificate Expiration (Cert:\LocalMachine\My) ---"
$expiryScript = {
    param($WarningDays)
    Get-ChildItem -Path 'Cert:\LocalMachine\My' | ForEach-Object {
        [pscustomobject]@{
            Subject    = $_.Subject
            Thumbprint = $_.Thumbprint
            NotAfter   = $_.NotAfter
            DaysLeft   = [math]::Round(($_.NotAfter - (Get-Date)).TotalDays, 1)
        }
    }
}

foreach ($target in $CertScanTarget) {
    try {
        $certs = if ($target -eq $env:COMPUTERNAME -or $target -eq 'localhost') {
            & $expiryScript $ExpiryWarningDays
        } else {
            Invoke-Command -ComputerName $target -ScriptBlock $expiryScript -ArgumentList $ExpiryWarningDays -ErrorAction Stop
        }
        if (-not $certs) {
            Write-ReportLine "$target`: no certificates found in Cert:\LocalMachine\My"
            continue
        }
        foreach ($cert in $certs) {
            if ($cert.DaysLeft -le 0) {
                $overallExitCode = 1
                $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Cert-Expiry'; Target = "$target : $($cert.Subject)"; Result = 'Fail'; Detail = "EXPIRED $([math]::Abs($cert.DaysLeft)) day(s) ago (NotAfter=$($cert.NotAfter)); Thumbprint=$($cert.Thumbprint)" })
                Write-ReportLine "$target`: '$($cert.Subject)' EXPIRED $([math]::Abs($cert.DaysLeft)) day(s) ago -- Thumbprint $($cert.Thumbprint) (Fail)"
            } elseif ($cert.DaysLeft -le $ExpiryWarningDays) {
                $overallExitCode = 1
                $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Cert-Expiry'; Target = "$target : $($cert.Subject)"; Result = 'Warning'; Detail = "Expires in $($cert.DaysLeft) day(s) (NotAfter=$($cert.NotAfter)); Thumbprint=$($cert.Thumbprint)" })
                Write-ReportLine "$target`: '$($cert.Subject)' expires in $($cert.DaysLeft) day(s), WITHIN $ExpiryWarningDays day threshold -- Thumbprint $($cert.Thumbprint) (Warning)"
            }
        }
    } catch {
        $overallExitCode = 1
        $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Cert-Expiry'; Target = $target; Result = 'Fail'; Detail = "Could not enumerate certificate store: $($_.Exception.Message)" })
        Write-ReportLine "ERROR: could not enumerate certificate store on $target`: $($_.Exception.Message)"
    }
}

Write-ReportLine ""
Write-ReportLine ("=" * 78)
Write-ReportLine "SUMMARY"
Write-ReportLine ("=" * 78)
$summaryLines = $results | Format-Table Timestamp, Target, CheckName, Result, Detail -AutoSize | Out-String
Write-ReportLine $summaryLines

$failCount = ($results | Where-Object { $_.Result -in @('Fail', 'Warning') }).Count
$passCount = ($results | Where-Object Result -eq 'Pass').Count
Write-ReportLine "Totals: $passCount passed, $failCount failed/warning. (Note: certificates within threshold are only listed when flagged; a clean cert scan with zero flagged entries produces no Cert-Expiry rows.)"

Write-Host "AD CS / certificate expiration check complete. $passCount passed / $failCount failed/warning. Report: $OutputPath"

$results
exit $overallExitCode
