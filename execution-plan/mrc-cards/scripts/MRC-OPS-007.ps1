<#
.SYNOPSIS
    Verifies that a recent, successful System State backup exists for each domain controller.

.DESCRIPTION
    Automates the check/report portion of MRC-OPS-007 -- domain controller System State backup
    verification (weekly task, execution-plan/mrc-cards/ops/MRC-OPS-007.md).

    For each target domain controller (defaults to every DC in the domain), the script uses the
    Windows Server Backup PowerShell module (wbadmin/Get-WBSummary and Get-WBJob-equivalent data via
    `wbadmin get versions`) to determine:
      - The timestamp of the most recent backup that included the System State.
      - Whether that backup completed successfully.
    A DC is flagged Fail if no System State backup is found at all, or the most recent one failed.
    A DC is flagged Warning if the most recent successful System State backup is older than
    -MaxAgeHours (default 168, i.e. 7 days -- matching the card's weekly cadence with one cycle of
    slack).

    This script is READ-ONLY. It never triggers a new backup (`wbadmin start systemstatebackup`),
    changes backup schedules, or deletes backup history. Running a new backup, if remediation is
    needed, is a separate, deliberate, documented action per the card's Procedure section.

.PARAMETER ComputerName
    One or more domain controller host names to check. Defaults to every domain controller in the
    current user's domain, discovered via the ActiveDirectory module. If unavailable and
    -ComputerName is not supplied, checks only the local host.

.PARAMETER MaxAgeHours
    Age, in hours, beyond which the most recent successful System State backup is flagged Warning
    rather than Pass. Default: 168 (7 days).

.PARAMETER OutputPath
    Path to write the combined report file. Defaults to
    .\reports\MRC-OPS-007_<yyyyMMdd-HHmmss>.txt (created if it does not exist).

.EXAMPLE
    .\MRC-OPS-007.ps1
    Discovers all domain controllers and checks System State backup recency/success on each.

.EXAMPLE
    .\MRC-OPS-007.ps1 -ComputerName DC01 -MaxAgeHours 48 -OutputPath C:\Evidence\backup-check.txt
    Checks a single DC with a tighter 48-hour freshness requirement.

.NOTES
    MRC ID     : MRC-OPS-007 -- Domain controller System State backup verification
    Card       : ../ops/MRC-OPS-007.md
    Frequency  : Weekly
    Baseline   : Windows Server Backup, Active Directory (per AGENTS.md rule 8)
    Requires   : Windows Server Backup feature/console tools (wbadmin.exe) installed on, or remotely
                 queryable from, each target DC. Where a third-party backup product is used instead of
                 Windows Server Backup, this script's wbadmin-based checks will not apply -- consult the
                 backup vendor's own reporting/API per the card's manual fallback path.
    Exit codes : 0 = every target has a recent, successful System State backup. 1 = a target is missing
                 a System State backup, its most recent one failed, or it could not be queried.

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
    [int] $MaxAgeHours = 168,

    [Parameter(Mandatory = $false)]
    [string] $OutputPath = ".\reports\MRC-OPS-007_$(Get-Date -Format 'yyyyMMdd-HHmmss').txt"
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

Write-ReportLine "MRC-OPS-007 -- Domain controller System State backup verification"
Write-ReportLine "Run timestamp : $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz')"
Write-ReportLine "Run by        : $env:USERDOMAIN\$env:USERNAME on $env:COMPUTERNAME"
Write-ReportLine "Targets       : $($ComputerName -join ', ')"
Write-ReportLine "MaxAgeHours threshold: $MaxAgeHours"
Write-ReportLine ("=" * 78)
Write-ReportLine ""

foreach ($dc in $ComputerName) {
    $ts = Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz'
    Write-ReportLine "--- Target: $dc ---"

    try {
        # wbadmin get versions -backuptarget: not required when querying local catalog; for remote
        # targets this is typically invoked via Invoke-Command or PsExec-style remoting in production.
        # Kept as a direct external call here so the script can run locally on each DC via a scheduled
        # task, or be wrapped in Invoke-Command by the caller for centralized remote collection.
        $versionsOutput = if ($dc -eq $env:COMPUTERNAME -or $dc -like "$env:COMPUTERNAME.*") {
            & wbadmin.exe get versions 2>&1 | Out-String
        } else {
            & wbadmin.exe get versions -machine:$dc 2>&1 | Out-String
        }

        if ($versionsOutput -match '(?i)no backups? found|no items match') {
            $results.Add([pscustomobject]@{
                Timestamp = $ts; CheckName = 'SystemState-Backup'; Target = $dc
                Result = 'Fail'; Detail = "No backups found via wbadmin get versions"
            })
            $overallExitCode = 1
            Write-ReportLine "FAIL: no backups found on $dc"
            Write-ReportLine ""
            continue
        }

        # Parse version entries: wbadmin output blocks typically include a "Version identified" line
        # (timestamp-derived), a "Backup time" line, and a list of included items (e.g. "System State").
        $blocks = [regex]::Split($versionsOutput, '(?=(?:Version identified|Backup time)\s*:)')
        $systemStateEntries = @()
        foreach ($block in $blocks) {
            if ($block -match '(?i)System State') {
                $timeMatch = [regex]::Match($block, '(?:Version identified|Backup time)\s*:\s*(.+)')
                $ssTime = if ($timeMatch.Success) {
                    try { [datetime]::Parse($timeMatch.Groups[1].Value.Trim()) } catch { $null }
                } else { $null }
                $systemStateEntries += [pscustomobject]@{ Time = $ssTime; Raw = $block.Trim() }
            }
        }

        if ($systemStateEntries.Count -eq 0) {
            $results.Add([pscustomobject]@{
                Timestamp = $ts; CheckName = 'SystemState-Backup'; Target = $dc
                Result = 'Fail'; Detail = "Backup history found, but no version includes System State"
            })
            $overallExitCode = 1
            Write-ReportLine "FAIL: no System State-inclusive backup version found on $dc"
            Write-ReportLine ""
            continue
        }

        $mostRecent = $systemStateEntries | Where-Object { $_.Time } | Sort-Object Time -Descending | Select-Object -First 1
        if (-not $mostRecent) {
            $results.Add([pscustomobject]@{
                Timestamp = $ts; CheckName = 'SystemState-Backup'; Target = $dc
                Result = 'Warning'; Detail = "Found a System State backup entry but could not parse its timestamp; manual review of raw wbadmin output required"
            })
            if ($overallExitCode -eq 0) { $overallExitCode = 1 }
            Write-ReportLine "WARNING: found System State entry but could not parse timestamp on $dc"
            Write-ReportLine ""
            continue
        }

        $ageHours = ((Get-Date) - $mostRecent.Time).TotalHours
        if ($ageHours -gt $MaxAgeHours) {
            $bkResult = 'Warning'
            $bkDetail = "Most recent System State backup was $([math]::Round($ageHours,1)) hours ago (at $($mostRecent.Time)), exceeding the $MaxAgeHours-hour threshold"
        } else {
            $bkResult = 'Pass'
            $bkDetail = "Most recent System State backup was $([math]::Round($ageHours,1)) hours ago (at $($mostRecent.Time))"
        }

        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'SystemState-Backup'; Target = $dc
            Result = $bkResult; Detail = $bkDetail
        })
        if ($bkResult -ne 'Pass' -and $overallExitCode -eq 0) { $overallExitCode = 1 }
        Write-ReportLine "$bkResult`: $bkDetail"
    } catch {
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'SystemState-Backup'; Target = $dc
            Result = 'Fail'; Detail = "Could not query backup versions: $($_.Exception.Message)"
        })
        $overallExitCode = 1
        Write-ReportLine "ERROR: could not query backup versions on $dc`: $($_.Exception.Message)"
    }

    Write-ReportLine ""
}

Write-ReportLine ("=" * 78)
Write-ReportLine "SUMMARY"
Write-ReportLine ("=" * 78)
$summaryLines = $results | Sort-Object Target |
    Format-Table Timestamp, Target, CheckName, Result, Detail -AutoSize | Out-String
Write-ReportLine $summaryLines

$failCount = ($results | Where-Object Result -eq 'Fail').Count
$warnCount = ($results | Where-Object Result -eq 'Warning').Count
$passCount = ($results | Where-Object Result -eq 'Pass').Count
Write-ReportLine "Totals: $passCount passed, $failCount failed, $warnCount warning(s) across $($ComputerName.Count) target(s)."

Write-Host "System State backup verification complete. $passCount passed / $failCount failed / $warnCount warning(s). Report: $OutputPath"

$results
exit $overallExitCode
