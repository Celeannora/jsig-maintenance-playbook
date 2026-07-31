<#
.SYNOPSIS
    Checks Group Policy Object (GPO) version consistency between Active Directory (the Group Policy
    Container, GPC) and SYSVOL (the Group Policy Template, GPT) for every GPO in the domain.

.DESCRIPTION
    Automates MRC-OPS-011 -- Group Policy Object replication and health check (monthly task,
    execution-plan/mrc-cards/ops/MRC-OPS-011.md).

    Each GPO stores its version number in two places that must agree: the AD-replicated Group Policy
    Container (GPC, versionNumber attribute) and the SYSVOL-replicated Group Policy Template (GPT,
    gpt.ini). If SYSVOL replication (see MRC-OPS-004) falls behind or a GPO edit does not fully
    propagate, these two version numbers diverge -- the classic symptom of "policy not applying" or
    "policy applying inconsistently across sites" complaints. This script queries every GPO in the
    domain via the GroupPolicy module's Get-GPO cmdlet, which surfaces both the DSVersion (from AD) and
    SysvolVersion (from gpt.ini) for the User and Computer halves of each GPO, and flags any GPO where
    they do not match as Fail.

    This script is READ-ONLY. It never runs gpupdate, edits a GPO, or forces replication. Any
    remediation (e.g. forcing SYSVOL replication per MRC-OPS-004, or re-editing/re-saving a corrupted
    GPO to force a version bump) is a deliberate action taken after reviewing this report.

.PARAMETER Domain
    Domain name to query GPOs from. Defaults to the current user's domain.

.PARAMETER OutputPath
    Path to write the combined report file. Defaults to
    .\reports\MRC-OPS-011_<yyyyMMdd-HHmmss>.txt (created if it does not exist).

.EXAMPLE
    .\MRC-OPS-011.ps1
    Checks every GPO in the current domain for DS/SYSVOL version mismatches.

.EXAMPLE
    .\MRC-OPS-011.ps1 -Domain corp.example.com -OutputPath C:\Evidence\gpo-health.txt
    Checks a specific domain and writes the report to a custom path.

.NOTES
    MRC ID     : MRC-OPS-011 -- Group Policy Object replication and health check
    Card       : ../ops/MRC-OPS-011.md
    Frequency  : Monthly
    Baseline   : Active Directory / Windows Server (GPMC, gpupdate) (per AGENTS.md rule 8)
    Requires   : GroupPolicy PowerShell module (RSAT: Group Policy Management Tools).
    Exit codes : 0 = every GPO's DSVersion matches its SysvolVersion for both User and Computer. 1 =
                 any GPO has a version mismatch, or the domain's GPOs could not be queried.

    SAFETY DISCLAIMER: Provided as a starting point for the stated baseline environment. Not
    validated against a live production system in this repository. A human must review this script's
    logic and test it in a non-production environment before operational use, per the organization's
    own change-control process. This script never modifies any GPO or forces replication.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string] $Domain,

    [Parameter(Mandatory = $false)]
    [string] $OutputPath = ".\reports\MRC-OPS-011_$(Get-Date -Format 'yyyyMMdd-HHmmss').txt"
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

Write-ReportLine "MRC-OPS-011 -- Group Policy Object replication and health check"
Write-ReportLine "Run timestamp : $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz')"
Write-ReportLine "Run by        : $env:USERDOMAIN\$env:USERNAME on $env:COMPUTERNAME"
Write-ReportLine "Domain        : $(if ($Domain) { $Domain } else { '(current domain)' })"
Write-ReportLine ("=" * 78)
Write-ReportLine ""

if (-not (Get-Module -ListAvailable -Name GroupPolicy)) {
    Write-Warning "The GroupPolicy PowerShell module is not available on this host. Install RSAT: Group Policy Management Tools."
}
Import-Module GroupPolicy -ErrorAction Stop

$ts = Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz'

try {
    $gpoParams = @{ All = $true }
    if ($Domain) { $gpoParams['Domain'] = $Domain }
    $allGpos = Get-GPO @gpoParams -ErrorAction Stop

    Write-ReportLine "Total GPOs found: $($allGpos.Count)"
    Write-ReportLine ""

    foreach ($gpo in $allGpos) {
        $userMatch = ($gpo.User.DSVersion -eq $gpo.User.SysvolVersion)
        $computerMatch = ($gpo.Computer.DSVersion -eq $gpo.Computer.SysvolVersion)

        if ($userMatch -and $computerMatch) {
            $gpoResult = 'Pass'
        } else {
            $gpoResult = 'Fail'
            $overallExitCode = 1
        }

        $detail = "User DS=$($gpo.User.DSVersion)/SYSVOL=$($gpo.User.SysvolVersion), Computer DS=$($gpo.Computer.DSVersion)/SYSVOL=$($gpo.Computer.SysvolVersion)"
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'GPO-VersionConsistency'; Target = $gpo.DisplayName
            Result = $gpoResult; Detail = $detail
        })
        Write-ReportLine "$($gpo.DisplayName) [$($gpo.Id)]: $gpoResult -- $detail"
    }
} catch {
    $results.Add([pscustomobject]@{
        Timestamp = $ts; CheckName = 'GPO-VersionConsistency'; Target = '(domain)'
        Result = 'Fail'; Detail = "Could not query GPOs: $($_.Exception.Message)"
    })
    $overallExitCode = 1
    Write-ReportLine "ERROR: could not query GPOs: $($_.Exception.Message)"
}

Write-ReportLine ""
Write-ReportLine ("=" * 78)
Write-ReportLine "SUMMARY"
Write-ReportLine ("=" * 78)
$summaryLines = $results | Format-Table Timestamp, Target, CheckName, Result, Detail -AutoSize | Out-String
Write-ReportLine $summaryLines

$failCount = ($results | Where-Object Result -eq 'Fail').Count
$passCount = ($results | Where-Object Result -eq 'Pass').Count
Write-ReportLine "Totals: $passCount GPO(s) consistent, $failCount GPO(s) with a DS/SYSVOL version mismatch."

Write-Host "GPO replication/health check complete. $passCount consistent / $failCount mismatched. Report: $OutputPath"

$results
exit $overallExitCode
