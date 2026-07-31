<#
.SYNOPSIS
    Checks scheduled task last-run results on one or more Windows Server hosts.

.DESCRIPTION
    Automates MRC-OPS-026 -- Scheduled task/job success monitoring (weekly task,
    execution-plan/mrc-cards/ops/MRC-OPS-026.md).

    Uses the built-in ScheduledTasks module (Get-ScheduledTask / Get-ScheduledTaskInfo) on each
    -ComputerName to enumerate enabled scheduled tasks and their last run result. Microsoft Task
    Scheduler's LastTaskResult is a Win32 status code -- 0x0 (0) means the task's last run
    completed successfully; any other value indicates a failure or that the task has never run.
    Tasks under \Microsoft\... (built-in OS maintenance tasks) are excluded by default via
    -ExcludeMicrosoftTasks since this task is about organization-defined/application scheduled
    jobs, not the OS's own maintenance tasks -- override with -IncludeMicrosoftTasks if a
    site-specific requirement calls for reviewing those too.

    This script is READ-ONLY. It never enables, disables, runs, or modifies any scheduled task.

.PARAMETER ComputerName
    One or more computer names to check. Defaults to the local computer ($env:COMPUTERNAME).
    Remote targets are queried via Invoke-Command (requires WinRM/PSRemoting access) unless
    -TaskPath scoping makes a local Get-ScheduledTask call more appropriate for your environment.

.PARAMETER TaskPath
    Task Scheduler path filter (e.g. '\MyOrg\*') to limit which tasks are checked. Defaults to
    checking all enabled tasks.

.PARAMETER ExcludeMicrosoftTasks
    Exclude tasks under \Microsoft\... from the check. Default: enabled (true). Use
    -ExcludeMicrosoftTasks:$false to include them.

.PARAMETER OutputPath
    Path to write the combined report file. Defaults to
    .\reports\MRC-OPS-026_<yyyyMMdd-HHmmss>.txt (created if it does not exist).

.EXAMPLE
    .\MRC-OPS-026.ps1 -ComputerName fs01.example.mil
    Checks all enabled, non-Microsoft scheduled tasks on fs01 for a non-zero last run result.

.NOTES
    MRC ID     : MRC-OPS-026 -- Scheduled task/job success monitoring
    Card       : ../ops/MRC-OPS-026.md
    Frequency  : Weekly
    Baseline   : Windows Server (General) / Windows Task Scheduler (per AGENTS.md rule 8)
    Requires   : The built-in ScheduledTasks PowerShell module (present on all supported Windows
                 Server versions) and, for remote -ComputerName targets, WinRM/PSRemoting access.
    Exit codes : 0 = every checked enabled task's last run result was 0 (success). 1 = any task's
                 last run result was non-zero, a task has never run, or a target could not be
                 queried.

    SAFETY DISCLAIMER: Provided as a starting point for the stated baseline environment. Not
    validated against a live production system in this repository. A human must review this
    script's logic and test it in a non-production environment before operational use, per the
    organization's own change-control process. This script never modifies any scheduled task.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string[]] $ComputerName = @($env:COMPUTERNAME),

    [Parameter(Mandatory = $false)]
    [string] $TaskPath,

    [Parameter(Mandatory = $false)]
    [bool] $ExcludeMicrosoftTasks = $true,

    [Parameter(Mandatory = $false)]
    [string] $OutputPath = ".\reports\MRC-OPS-026_$(Get-Date -Format 'yyyyMMdd-HHmmss').txt"
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

Write-ReportLine "MRC-OPS-026 -- Scheduled task/job success monitoring"
Write-ReportLine "Run timestamp : $ts"
Write-ReportLine "Run by        : $env:USERDOMAIN\$env:USERNAME on $env:COMPUTERNAME"
Write-ReportLine "Exclude Microsoft built-in tasks: $ExcludeMicrosoftTasks"
Write-ReportLine ("=" * 78)
Write-ReportLine ""

$checkScript = {
    param($TaskPathFilter, $ExcludeMs)
    $getParams = @{}
    if ($TaskPathFilter) { $getParams['TaskPath'] = $TaskPathFilter }
    $tasks = Get-ScheduledTask @getParams | Where-Object { $_.State -ne 'Disabled' }
    if ($ExcludeMs) { $tasks = $tasks | Where-Object { $_.TaskPath -notlike '\Microsoft\*' } }
    foreach ($t in $tasks) {
        $info = Get-ScheduledTaskInfo -TaskName $t.TaskName -TaskPath $t.TaskPath -ErrorAction SilentlyContinue
        [pscustomobject]@{
            TaskName       = $t.TaskName
            TaskPath       = $t.TaskPath
            State          = $t.State
            LastRunTime    = $info.LastRunTime
            LastTaskResult = $info.LastTaskResult
            NextRunTime    = $info.NextRunTime
        }
    }
}

foreach ($comp in $ComputerName) {
    Write-ReportLine "--- $comp ---"
    try {
        $tasks = if ($comp -eq $env:COMPUTERNAME -or $comp -eq 'localhost') {
            & $checkScript $TaskPath $ExcludeMicrosoftTasks
        } else {
            Invoke-Command -ComputerName $comp -ScriptBlock $checkScript -ArgumentList $TaskPath, $ExcludeMicrosoftTasks -ErrorAction Stop
        }
        if (-not $tasks) {
            Write-ReportLine "$comp`: no enabled tasks matched the filter"
            Write-ReportLine ""
            continue
        }
        foreach ($t in $tasks) {
            $fullName = "$($t.TaskPath)$($t.TaskName)"
            if ($null -eq $t.LastRunTime -or $t.LastRunTime -eq [datetime]'1/1/1999 12:00:00 AM') {
                $overallExitCode = 1
                $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Task-LastRun'; Target = "$comp : $fullName"; Result = 'Warning'; Detail = 'Task has never run (no LastRunTime recorded)' })
                Write-ReportLine "$fullName`: never run (Warning)"
            } elseif ($t.LastTaskResult -ne 0) {
                $overallExitCode = 1
                $hexResult = '0x{0:X8}' -f $t.LastTaskResult
                $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Task-LastRun'; Target = "$comp : $fullName"; Result = 'Fail'; Detail = "LastTaskResult=$hexResult (non-zero), LastRunTime=$($t.LastRunTime)" })
                Write-ReportLine "$fullName`: LastTaskResult=$hexResult (non-zero), last ran $($t.LastRunTime) (Fail)"
            } else {
                $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Task-LastRun'; Target = "$comp : $fullName"; Result = 'Pass'; Detail = "LastTaskResult=0x00000000, LastRunTime=$($t.LastRunTime)" })
                Write-ReportLine "$fullName`: LastTaskResult=0x00000000, last ran $($t.LastRunTime) (Pass)"
            }
        }
    } catch {
        $overallExitCode = 1
        $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Task-LastRun'; Target = $comp; Result = 'Fail'; Detail = "Could not query scheduled tasks: $($_.Exception.Message)" })
        Write-ReportLine "ERROR: could not query scheduled tasks on $comp`: $($_.Exception.Message)"
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

Write-Host "Scheduled task check complete. $passCount passed / $failCount failed/warning. Report: $OutputPath"

$results
exit $overallExitCode
