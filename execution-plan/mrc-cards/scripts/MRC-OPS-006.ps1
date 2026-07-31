<#
.SYNOPSIS
    Verifies the secure channel health of every domain/forest trust and produces a structured report.

.DESCRIPTION
    Automates the check/report portion of MRC-OPS-006 -- domain/forest trust health check (monthly
    task, execution-plan/mrc-cards/ops/MRC-OPS-006.md).

    Enumerates all trust relationships for the current domain (via the ActiveDirectory module) and, for
    each trusted domain, runs `nltest.exe /sc_query:<TrustedDomain>` from a domain controller to verify
    the secure channel is healthy. Also runs `nltest.exe /sc_verify:<TrustedDomain>` for a stronger
    verification pass when -Verify is specified (verify actively contacts the trusted domain, so it is
    opt-in rather than the default to keep the routine check lightweight and non-disruptive).

    This script is READ-ONLY with -Verify off (default): sc_query only queries locally cached secure
    channel state. With -Verify on, sc_verify actively contacts the trusted domain's DC to confirm the
    trust password is in sync -- this is still non-destructive but does generate remote traffic, which
    is why it is opt-in. The script never resets a trust password (`nltest /sc_reset`) or removes/creates
    a trust; any such remediation is a separate, deliberate, documented action.

.PARAMETER Verify
    If set, also runs `nltest /sc_verify` (active secure channel verification) for each trust, in
    addition to the default `/sc_query` (cached state) check. Default: off.

.PARAMETER OutputPath
    Path to write the combined report file. Defaults to
    .\reports\MRC-OPS-006_<yyyyMMdd-HHmmss>.txt (created if it does not exist).

.EXAMPLE
    .\MRC-OPS-006.ps1
    Runs the lightweight cached-state secure channel query against every configured trust.

.EXAMPLE
    .\MRC-OPS-006.ps1 -Verify -OutputPath C:\Evidence\trusts-2026-08.txt
    Also actively verifies each trust's secure channel against its trusted domain.

.NOTES
    MRC ID     : MRC-OPS-006 -- Domain/forest trust health check
    Card       : ../ops/MRC-OPS-006.md
    Frequency  : Monthly
    Baseline   : Active Directory / Windows Server (nltest.exe) (per AGENTS.md rule 8)
    Requires   : ActiveDirectory PowerShell module (to enumerate trusts) and nltest.exe (part of Windows
                 Server / RSAT Active Directory Domain Services Tools) on PATH.
    Exit codes : 0 = no trusts configured, or every configured trust's secure channel reports healthy.
                 1 = a trust's secure channel query/verify failed, or trusts could not be enumerated.

    SAFETY DISCLAIMER: Provided as a starting point for the stated baseline environment. Not
    validated against a live production system in this repository. A human must review this script's
    logic and test it in a non-production environment before operational use, per the organization's
    own change-control process.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [switch] $Verify,

    [Parameter(Mandatory = $false)]
    [string] $OutputPath = ".\reports\MRC-OPS-006_$(Get-Date -Format 'yyyyMMdd-HHmmss').txt"
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

Write-ReportLine "MRC-OPS-006 -- Domain/forest trust health check"
Write-ReportLine "Run timestamp : $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz')"
Write-ReportLine "Run by        : $env:USERDOMAIN\$env:USERNAME on $env:COMPUTERNAME"
Write-ReportLine "Active verify (nltest /sc_verify): $($Verify.IsPresent)"
Write-ReportLine ("=" * 78)
Write-ReportLine ""

if (-not (Get-Module -ListAvailable -Name ActiveDirectory)) {
    Write-Warning "The ActiveDirectory PowerShell module is not available on this host. Install RSAT: Active Directory Domain Services and Lightweight Directory Services Tools."
}
Import-Module ActiveDirectory -ErrorAction Stop

if (-not (Get-Command nltest.exe -ErrorAction SilentlyContinue)) {
    Write-Warning "nltest.exe was not found on PATH. Run this from a domain-joined Windows host with RSAT AD DS Tools."
}

$ts = Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz'
$trusts = @()
try {
    $trusts = Get-ADTrust -Filter * -ErrorAction Stop
} catch {
    $results.Add([pscustomobject]@{
        Timestamp = $ts; CheckName = 'Trust-Enumeration'; Target = '(domain)'
        Result = 'Fail'; Detail = "Could not enumerate trusts via Get-ADTrust: $($_.Exception.Message)"
    })
    $overallExitCode = 1
    Write-ReportLine "ERROR: could not enumerate trusts: $($_.Exception.Message)"
}

if (-not $trusts -or $trusts.Count -eq 0) {
    Write-ReportLine "No trust relationships configured for this domain. Nothing to verify."
} else {
    Write-ReportLine "Trusts found: $($trusts.Count)"
    Write-ReportLine ""
}

foreach ($trust in $trusts) {
    $trustName = $trust.Name
    Write-ReportLine "--- Trust: $trustName (Direction=$($trust.Direction), Type=$($trust.TrustType)) ---"

    # --- sc_query: cached secure channel state ---
    try {
        $queryOutput = & nltest.exe "/sc_query:$trustName" 2>&1 | Out-String
        $queryOk = $queryOutput -match '(?i)The command completed successfully'
        $queryResult = if ($queryOk) { 'Pass' } else { 'Fail' }
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'Trust-SCQuery'; Target = $trustName
            Result = $queryResult; Detail = ($queryOutput.Trim() -replace '\s+', ' ')
        })
        if ($queryResult -eq 'Fail') { $overallExitCode = 1 }
        Write-ReportLine "sc_query: $queryResult"
    } catch {
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'Trust-SCQuery'; Target = $trustName
            Result = 'Fail'; Detail = "Could not run nltest /sc_query: $($_.Exception.Message)"
        })
        $overallExitCode = 1
        Write-ReportLine "ERROR: could not run nltest /sc_query for $trustName`: $($_.Exception.Message)"
    }

    # --- sc_verify: active secure channel verification (opt-in) ---
    if ($Verify) {
        try {
            $verifyOutput = & nltest.exe "/sc_verify:$trustName" 2>&1 | Out-String
            $verifyOk = $verifyOutput -match '(?i)The command completed successfully'
            $verifyResult = if ($verifyOk) { 'Pass' } else { 'Fail' }
            $results.Add([pscustomobject]@{
                Timestamp = $ts; CheckName = 'Trust-SCVerify'; Target = $trustName
                Result = $verifyResult; Detail = ($verifyOutput.Trim() -replace '\s+', ' ')
            })
            if ($verifyResult -eq 'Fail') { $overallExitCode = 1 }
            Write-ReportLine "sc_verify: $verifyResult"
        } catch {
            $results.Add([pscustomobject]@{
                Timestamp = $ts; CheckName = 'Trust-SCVerify'; Target = $trustName
                Result = 'Fail'; Detail = "Could not run nltest /sc_verify: $($_.Exception.Message)"
            })
            $overallExitCode = 1
            Write-ReportLine "ERROR: could not run nltest /sc_verify for $trustName`: $($_.Exception.Message)"
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
$warnCount = ($results | Where-Object Result -eq 'Warning').Count
$passCount = ($results | Where-Object Result -eq 'Pass').Count
Write-ReportLine "Totals: $passCount passed, $failCount failed, $warnCount warning(s) across $($trusts.Count) trust(s)."

Write-Host "Trust health check complete. $passCount passed / $failCount failed / $warnCount warning(s). Report: $OutputPath"

$results
exit $overallExitCode
