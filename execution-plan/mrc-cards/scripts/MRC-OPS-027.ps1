<#
.SYNOPSIS
    Tracks Active Directory service account password expiration.

.DESCRIPTION
    Automates MRC-OPS-027 -- Service account password expiration tracking (monthly task,
    execution-plan/mrc-cards/ops/MRC-OPS-027.md).

    Queries Active Directory (via the ActiveDirectory PowerShell module) for user accounts in
    -ServiceAccountOU whose password does not expire on a normal user cadence-only basis --
    specifically every account in that OU regardless of the "password never expires" flag, since
    a service account with PasswordNeverExpires=$true still needs its password ROTATED on a
    manual schedule even though AD will never force it, and this task's purpose is to make sure
    that manual rotation is not silently missed. For each account, the script reads
    msDS-UserPasswordExpiryTimeComputed (the authoritative computed expiration timestamp AD
    exposes, which already accounts for fine-grained password policies) when PasswordNeverExpires
    is $false, and PasswordLastSet when PasswordNeverExpires is $true (comparing its age against
    -NeverExpiresMaxAgeDays, since there is no AD-computed expiration for such accounts).

    This script is READ-ONLY. It never resets, unlocks, or modifies any account password or
    attribute.

.PARAMETER ServiceAccountOU
    Distinguished Name of the organizational unit containing service accounts to check (e.g.
    'OU=Service Accounts,DC=example,DC=mil'). Required.

.PARAMETER ExpiryWarningDays
    Number of days before a computed password expiration at which an account (PasswordNeverExpires
    = $false) is flagged Warning. Default: 14.

.PARAMETER NeverExpiresMaxAgeDays
    Maximum password age, in days, for an account with PasswordNeverExpires = $true before it is
    flagged Warning as overdue for manual rotation. Default: 365. Set to match this organization's
    documented service-account rotation policy.

.PARAMETER Server
    Optional specific domain controller to query. Defaults to AD's normal DC locator.

.PARAMETER OutputPath
    Path to write the combined report file. Defaults to
    .\reports\MRC-OPS-027_<yyyyMMdd-HHmmss>.txt (created if it does not exist).

.EXAMPLE
    .\MRC-OPS-027.ps1 -ServiceAccountOU 'OU=Service Accounts,DC=example,DC=mil'
    Checks every account in the OU for upcoming password expiration or overdue manual rotation.

.NOTES
    MRC ID     : MRC-OPS-027 -- Service account password expiration tracking
    Card       : ../ops/MRC-OPS-027.md
    Frequency  : Monthly
    Baseline   : Active Directory / Windows Server (per AGENTS.md rule 8)
    Requires   : The ActiveDirectory PowerShell module (RSAT-AD-PowerShell) and read access to the
                 specified OU.
    Exit codes : 0 = no account is within the expiry/rotation warning window. 1 = any account is
                 expiring, expired, or overdue for rotation, or the OU could not be queried.

    SAFETY DISCLAIMER: Provided as a starting point for the stated baseline environment. Not
    validated against a live production system in this repository. A human must review this
    script's logic (in particular, confirm -ServiceAccountOU and -NeverExpiresMaxAgeDays match this
    organization's actual OU structure and rotation policy) and test it in a non-production
    environment before operational use, per the organization's own change-control process. This
    script never modifies any account.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string] $ServiceAccountOU,

    [Parameter(Mandatory = $false)]
    [int] $ExpiryWarningDays = 14,

    [Parameter(Mandatory = $false)]
    [int] $NeverExpiresMaxAgeDays = 365,

    [Parameter(Mandatory = $false)]
    [string] $Server,

    [Parameter(Mandatory = $false)]
    [string] $OutputPath = ".\reports\MRC-OPS-027_$(Get-Date -Format 'yyyyMMdd-HHmmss').txt"
)

$ErrorActionPreference = 'Stop'
$results = New-Object System.Collections.Generic.List[object]
$overallExitCode = 0

function Write-ReportLine {
    param([string] $Line)
    Add-Content -LiteralPath $OutputPath -Value $Line
}

if (-not (Get-Command Get-ADUser -ErrorAction SilentlyContinue)) {
    throw "Get-ADUser is not available. Install/import the ActiveDirectory PowerShell module (RSAT-AD-PowerShell) before running this script."
}

$outDir = Split-Path -Path $OutputPath -Parent
if ($outDir -and -not (Test-Path -LiteralPath $outDir)) {
    New-Item -ItemType Directory -Path $outDir -Force | Out-Null
}
New-Item -ItemType File -Path $OutputPath -Force | Out-Null

$ts = Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz'
$now = Get-Date

Write-ReportLine "MRC-OPS-027 -- Service account password expiration tracking"
Write-ReportLine "Run timestamp : $ts"
Write-ReportLine "Run by        : $env:USERDOMAIN\$env:USERNAME on $env:COMPUTERNAME"
Write-ReportLine "Service account OU: $ServiceAccountOU"
Write-ReportLine "Expiry warning threshold: $ExpiryWarningDays day(s); never-expires max age: $NeverExpiresMaxAgeDays day(s)"
Write-ReportLine ("=" * 78)
Write-ReportLine ""

Write-ReportLine "--- Service Account Password Status ---"
try {
    $adParams = @{
        SearchBase = $ServiceAccountOU
        Filter     = '*'
        Properties = @('PasswordNeverExpires', 'PasswordLastSet', 'msDS-UserPasswordExpiryTimeComputed', 'Enabled')
        ErrorAction = 'Stop'
    }
    if ($Server) { $adParams['Server'] = $Server }
    $accounts = Get-ADUser @adParams

    if (-not $accounts) {
        Write-ReportLine "No accounts found in $ServiceAccountOU"
    }

    foreach ($acct in $accounts) {
        if (-not $acct.Enabled) {
            Write-ReportLine "$($acct.SamAccountName): disabled -- skipped"
            continue
        }
        if ($acct.PasswordNeverExpires) {
            if (-not $acct.PasswordLastSet) {
                $overallExitCode = 1
                $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'SvcAcct-Password'; Target = $acct.SamAccountName; Result = 'Warning'; Detail = 'PasswordNeverExpires=true and PasswordLastSet is null -- password age unknown' })
                Write-ReportLine "$($acct.SamAccountName): PasswordNeverExpires=true, PasswordLastSet unknown (Warning)"
                continue
            }
            $ageDays = [math]::Round(($now - $acct.PasswordLastSet).TotalDays, 1)
            if ($ageDays -gt $NeverExpiresMaxAgeDays) {
                $overallExitCode = 1
                $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'SvcAcct-Password'; Target = $acct.SamAccountName; Result = 'Warning'; Detail = "PasswordNeverExpires=true, password is $ageDays day(s) old (rotation policy threshold $NeverExpiresMaxAgeDays days); PasswordLastSet=$($acct.PasswordLastSet)" })
                Write-ReportLine "$($acct.SamAccountName): PasswordNeverExpires=true, password $ageDays day(s) old, OVERDUE for manual rotation (threshold $NeverExpiresMaxAgeDays days) (Warning)"
            } else {
                $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'SvcAcct-Password'; Target = $acct.SamAccountName; Result = 'Pass'; Detail = "PasswordNeverExpires=true, password is $ageDays day(s) old; PasswordLastSet=$($acct.PasswordLastSet)" })
                Write-ReportLine "$($acct.SamAccountName): PasswordNeverExpires=true, password $ageDays day(s) old (Pass)"
            }
            continue
        }

        $expiryRaw = $acct.'msDS-UserPasswordExpiryTimeComputed'
        if (-not $expiryRaw -or $expiryRaw -eq 0 -or $expiryRaw -ge [int64]::MaxValue) {
            $overallExitCode = 1
            $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'SvcAcct-Password'; Target = $acct.SamAccountName; Result = 'Warning'; Detail = 'msDS-UserPasswordExpiryTimeComputed unavailable or not meaningful' })
            Write-ReportLine "$($acct.SamAccountName): msDS-UserPasswordExpiryTimeComputed unavailable/not meaningful (Warning)"
            continue
        }
        $expiryDate = [datetime]::FromFileTime($expiryRaw)
        $daysLeft = [math]::Round(($expiryDate - $now).TotalDays, 1)
        if ($daysLeft -le 0) {
            $overallExitCode = 1
            $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'SvcAcct-Password'; Target = $acct.SamAccountName; Result = 'Fail'; Detail = "Password EXPIRED $([math]::Abs($daysLeft)) day(s) ago (expiry=$expiryDate)" })
            Write-ReportLine "$($acct.SamAccountName): password EXPIRED $([math]::Abs($daysLeft)) day(s) ago (Fail)"
        } elseif ($daysLeft -le $ExpiryWarningDays) {
            $overallExitCode = 1
            $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'SvcAcct-Password'; Target = $acct.SamAccountName; Result = 'Warning'; Detail = "Password expires in $daysLeft day(s) (expiry=$expiryDate)" })
            Write-ReportLine "$($acct.SamAccountName): password expires in $daysLeft day(s), WITHIN $ExpiryWarningDays day threshold (Warning)"
        } else {
            $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'SvcAcct-Password'; Target = $acct.SamAccountName; Result = 'Pass'; Detail = "Password expires in $daysLeft day(s) (expiry=$expiryDate)" })
            Write-ReportLine "$($acct.SamAccountName): password expires in $daysLeft day(s) (Pass)"
        }
    }
} catch {
    $overallExitCode = 1
    $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'SvcAcct-Password'; Target = $ServiceAccountOU; Result = 'Fail'; Detail = "Could not query Get-ADUser: $($_.Exception.Message)" })
    Write-ReportLine "ERROR: could not query Get-ADUser for $ServiceAccountOU`: $($_.Exception.Message)"
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

Write-Host "Service account password expiration check complete. $passCount passed / $failCount failed/warning. Report: $OutputPath"

$results
exit $overallExitCode
