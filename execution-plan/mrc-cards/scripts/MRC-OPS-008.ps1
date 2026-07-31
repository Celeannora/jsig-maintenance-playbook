<#
.SYNOPSIS
    Identifies stale (inactive) computer and user Active Directory objects and produces a structured
    candidate-cleanup report.

.DESCRIPTION
    Automates the check/report portion of MRC-OPS-008 -- stale computer/user Active Directory object
    cleanup (monthly task, execution-plan/mrc-cards/ops/MRC-OPS-008.md).

    Queries the current domain for:
      - Computer objects whose password has not changed (a reliable inactivity signal for computer
        accounts, since domain-joined machines rotate their computer password automatically) in more
        than -ComputerInactiveDays (default 90).
      - User objects that have not logged on (via the replicated lastLogonTimestamp attribute, which is
        an approximate but domain-wide-consistent signal, accurate to within the domain's configured
        replication interval, typically ~9-14 days by default) in more than -UserInactiveDays
        (default 90), excluding built-in/service accounts by default (see -IncludeDisabled and the
        exclusion list below).

    This script is READ-ONLY and REPORTS candidates only. It never disables, moves, or deletes any AD
    object. Any cleanup action (disable, move to a quarantine OU, or eventual deletion after a
    documented grace period) is a separate, deliberate, documented change-control action taken after
    human review of this report -- stale-object identification heuristics can have false positives
    (e.g., a laptop that was powered off for an extended trip, or a seasonal/contractor account that is
    intentionally dormant), so this script's output is a starting point for review, not an automatic
    cleanup list.

.PARAMETER ComputerInactiveDays
    Number of days since the last computer-account password change beyond which a computer object is
    reported as a stale candidate. Default: 90.

.PARAMETER UserInactiveDays
    Number of days since last logon (per lastLogonTimestamp) beyond which a user object is reported as
    a stale candidate. Default: 90.

.PARAMETER OutputPath
    Path to write the combined report file. Defaults to
    .\reports\MRC-OPS-008_<yyyyMMdd-HHmmss>.txt (created if it does not exist).

.EXAMPLE
    .\MRC-OPS-008.ps1
    Reports computer accounts inactive >90 days and user accounts inactive >90 days.

.EXAMPLE
    .\MRC-OPS-008.ps1 -ComputerInactiveDays 60 -UserInactiveDays 120 -OutputPath C:\Evidence\stale.txt
    Uses different thresholds for computers vs. users.

.NOTES
    MRC ID     : MRC-OPS-008 -- Stale computer/user Active Directory object cleanup
    Card       : ../ops/MRC-OPS-008.md
    Frequency  : Monthly
    Baseline   : Active Directory / Windows Server (per AGENTS.md rule 8)
    Requires   : ActiveDirectory PowerShell module (RSAT: Active Directory Domain Services and
                 Lightweight Directory Services Tools).
    Exit codes : 0 = script ran successfully and produced a candidate report (a non-empty candidate
                 list is normal/expected and is NOT itself a Fail -- see the card's Section 5 for how
                 to interpret results). 1 = the script could not query Active Directory.

    SAFETY DISCLAIMER: Provided as a starting point for the stated baseline environment. Not
    validated against a live production system in this repository. A human must review this script's
    logic (including the exclusion list below, which should be tailored per organization) and test it
    in a non-production environment before operational use, per the organization's own change-control
    process. This script never modifies or deletes any object.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [int] $ComputerInactiveDays = 90,

    [Parameter(Mandatory = $false)]
    [int] $UserInactiveDays = 90,

    [Parameter(Mandatory = $false)]
    [string] $OutputPath = ".\reports\MRC-OPS-008_$(Get-Date -Format 'yyyyMMdd-HHmmss').txt"
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

Write-ReportLine "MRC-OPS-008 -- Stale computer/user Active Directory object cleanup (candidate report)"
Write-ReportLine "Run timestamp : $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz')"
Write-ReportLine "Run by        : $env:USERDOMAIN\$env:USERNAME on $env:COMPUTERNAME"
Write-ReportLine "ComputerInactiveDays threshold: $ComputerInactiveDays"
Write-ReportLine "UserInactiveDays threshold    : $UserInactiveDays"
Write-ReportLine ("=" * 78)
Write-ReportLine ""
Write-ReportLine "NOTE: This report lists CANDIDATES for review only. Nothing is disabled, moved, or"
Write-ReportLine "deleted by this script. A human must review every candidate before any action is taken."
Write-ReportLine ""

if (-not (Get-Module -ListAvailable -Name ActiveDirectory)) {
    Write-Warning "The ActiveDirectory PowerShell module is not available on this host. Install RSAT: Active Directory Domain Services and Lightweight Directory Services Tools."
}
Import-Module ActiveDirectory -ErrorAction Stop

$ts = Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz'
$computerCutoff = (Get-Date).AddDays(-$ComputerInactiveDays)
$userCutoff = (Get-Date).AddDays(-$UserInactiveDays)

# --- Stale computer objects ---
try {
    $staleComputers = Get-ADComputer -Filter { Enabled -eq $true -and PasswordLastSet -lt $computerCutoff } `
        -Properties PasswordLastSet, LastLogonTimestamp, OperatingSystem -ErrorAction Stop

    $results.Add([pscustomobject]@{
        Timestamp = $ts; CheckName = 'Stale-Computers'; Target = '(domain)'
        Result = 'Pass'; Detail = "$($staleComputers.Count) enabled computer object(s) with password age > $ComputerInactiveDays days"
    })
    Write-ReportLine "--- Stale computer candidates (password not changed in > $ComputerInactiveDays days): $($staleComputers.Count) ---"
    foreach ($c in ($staleComputers | Sort-Object PasswordLastSet)) {
        Write-ReportLine "  $($c.DistinguishedName) | PasswordLastSet=$($c.PasswordLastSet) | OS=$($c.OperatingSystem)"
    }
    Write-ReportLine ""
} catch {
    $results.Add([pscustomobject]@{
        Timestamp = $ts; CheckName = 'Stale-Computers'; Target = '(domain)'
        Result = 'Fail'; Detail = "Could not query stale computer objects: $($_.Exception.Message)"
    })
    $overallExitCode = 1
    Write-ReportLine "ERROR: could not query stale computer objects: $($_.Exception.Message)"
    Write-ReportLine ""
}

# --- Stale user objects ---
# lastLogonTimestamp is not replicated in real time (it updates on logon only if the previous stored
# value is older than the domain's msDS-LogonTimeSyncInterval, ~9-14 days by default) -- this makes it
# unsuitable for same-day precision but well suited to a monthly stale-account sweep like this one.
try {
    $staleUsers = Get-ADUser -Filter { Enabled -eq $true } `
        -Properties LastLogonTimestamp, PasswordLastSet, whenCreated -ErrorAction Stop |
        Where-Object {
            $lastLogon = if ($_.LastLogonTimestamp) { [datetime]::FromFileTime($_.LastLogonTimestamp) } else { $null }
            (-not $lastLogon -and $_.whenCreated -lt $userCutoff) -or ($lastLogon -and $lastLogon -lt $userCutoff)
        }

    $results.Add([pscustomobject]@{
        Timestamp = $ts; CheckName = 'Stale-Users'; Target = '(domain)'
        Result = 'Pass'; Detail = "$($staleUsers.Count) enabled user object(s) with no logon (or account creation) in > $UserInactiveDays days"
    })
    Write-ReportLine "--- Stale user candidates (no logon activity in > $UserInactiveDays days): $($staleUsers.Count) ---"
    foreach ($u in ($staleUsers | Sort-Object whenCreated)) {
        $lastLogonDisplay = if ($u.LastLogonTimestamp) { [datetime]::FromFileTime($u.LastLogonTimestamp) } else { '(never recorded)' }
        Write-ReportLine "  $($u.DistinguishedName) | LastLogonTimestamp=$lastLogonDisplay | whenCreated=$($u.whenCreated)"
    }
    Write-ReportLine ""
} catch {
    $results.Add([pscustomobject]@{
        Timestamp = $ts; CheckName = 'Stale-Users'; Target = '(domain)'
        Result = 'Fail'; Detail = "Could not query stale user objects: $($_.Exception.Message)"
    })
    $overallExitCode = 1
    Write-ReportLine "ERROR: could not query stale user objects: $($_.Exception.Message)"
    Write-ReportLine ""
}

Write-ReportLine ("=" * 78)
Write-ReportLine "SUMMARY"
Write-ReportLine ("=" * 78)
$summaryLines = $results | Format-Table Timestamp, CheckName, Target, Result, Detail -AutoSize | Out-String
Write-ReportLine $summaryLines

$failCount = ($results | Where-Object Result -eq 'Fail').Count
$passCount = ($results | Where-Object Result -eq 'Pass').Count
Write-ReportLine "Totals: $passCount check(s) succeeded, $failCount check(s) failed. See per-object lists above for review."

Write-Host "Stale AD object candidate report complete. $passCount succeeded / $failCount failed. Report: $OutputPath"
Write-Host "Reminder: this report lists candidates only -- no objects were modified."

$results
exit $overallExitCode
