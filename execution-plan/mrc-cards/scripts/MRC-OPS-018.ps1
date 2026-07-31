<#
.SYNOPSIS
    Checks Exchange Client Access (OWA/ActiveSync) service health and synthetic-transaction
    connectivity.

.DESCRIPTION
    Automates MRC-OPS-018 -- Client access (OWA/ActiveSync) availability check (daily task,
    execution-plan/mrc-cards/ops/MRC-OPS-018.md).

    Must be run from an Exchange Management Shell session. For every Client Access server (or the
    one(s) specified via -Server), the script:
      - Runs Test-ServiceHealth, which verifies every Windows service required for that server's
        installed Exchange roles is present and in the expected state (Fail on any required
        service not running).
      - Runs Test-OwaConnectivity and Test-ActiveSyncConnectivity, Exchange's built-in synthetic
        transactions that perform an actual end-to-end logon test against a real (test) mailbox,
        flagging Fail on any result other than Success.

    This script is READ-ONLY. It never restarts a service, changes a virtual directory setting, or
    modifies any client access configuration. The synthetic transactions authenticate against
    whatever test mailbox is already configured for this purpose in the organization (Exchange's
    built-in test-mailbox mechanism) -- this script does not create or manage that test mailbox.

.PARAMETER Server
    Client Access server(s) to check. Defaults to every server with the Client Access role,
    returned by Get-ExchangeServer.

.PARAMETER OutputPath
    Path to write the combined report file. Defaults to
    .\reports\MRC-OPS-018_<yyyyMMdd-HHmmss>.txt (created if it does not exist).

.EXAMPLE
    .\MRC-OPS-018.ps1
    Checks service health and OWA/ActiveSync connectivity on every Client Access server.

.NOTES
    MRC ID     : MRC-OPS-018 -- Client access (OWA/ActiveSync) availability check
    Card       : ../ops/MRC-OPS-018.md
    Frequency  : Daily
    Baseline   : Exchange Server Client Access services (per AGENTS.md rule 8)
    Requires   : Must be run in (or via a remote session to) Exchange Management Shell. The
                 synthetic transactions require the organization's standard test-mailbox
                 configuration for Test-OwaConnectivity/Test-ActiveSyncConnectivity to be already
                 in place -- this script assumes that configuration exists and simply invokes it.
    Exit codes : 0 = Test-ServiceHealth reports every required service running and both synthetic
                 transactions report Success on every target. 1 = any required service is not
                 running, either synthetic transaction fails, or a server could not be queried.

    SAFETY DISCLAIMER: Provided as a starting point for the stated baseline environment. Not
    validated against a live production system in this repository. A human must review this script's
    logic and test it in a non-production environment before operational use, per the organization's
    own change-control process. This script never modifies service state or client access
    configuration.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string[]] $Server,

    [Parameter(Mandatory = $false)]
    [string] $OutputPath = ".\reports\MRC-OPS-018_$(Get-Date -Format 'yyyyMMdd-HHmmss').txt"
)

$ErrorActionPreference = 'Stop'
$results = New-Object System.Collections.Generic.List[object]
$overallExitCode = 0

function Write-ReportLine {
    param([string] $Line)
    Add-Content -LiteralPath $OutputPath -Value $Line
}

if (-not (Get-Command Test-ServiceHealth -ErrorAction SilentlyContinue)) {
    throw "Test-ServiceHealth is not available. Run this script from an Exchange Management Shell session (or a session with the Exchange management tools/remote PowerShell session loaded)."
}

if (-not $Server) {
    try {
        $Server = (Get-ExchangeServer -ErrorAction Stop | Where-Object { $_.IsClientAccessServer }).Name
    } catch {
        Write-Warning "Could not enumerate Client Access servers via Get-ExchangeServer ($($_.Exception.Message)). Falling back to local host."
        $Server = @($env:COMPUTERNAME)
    }
}

$outDir = Split-Path -Path $OutputPath -Parent
if ($outDir -and -not (Test-Path -LiteralPath $outDir)) {
    New-Item -ItemType Directory -Path $outDir -Force | Out-Null
}
New-Item -ItemType File -Path $OutputPath -Force | Out-Null

$ts = Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz'

Write-ReportLine "MRC-OPS-018 -- Client access (OWA/ActiveSync) availability check"
Write-ReportLine "Run timestamp : $ts"
Write-ReportLine "Run by        : $env:USERDOMAIN\$env:USERNAME on $env:COMPUTERNAME"
Write-ReportLine "Targets       : $($Server -join ', ')"
Write-ReportLine ("=" * 78)
Write-ReportLine ""

foreach ($srv in $Server) {
    Write-ReportLine "--- Target: $srv ---"

    # --- Required-service health ---
    try {
        $svcHealth = Test-ServiceHealth -Server $srv -ErrorAction Stop
        foreach ($role in $svcHealth) {
            foreach ($notRunning in $role.ServicesNotRunning) {
                $overallExitCode = 1
                $results.Add([pscustomobject]@{
                    Timestamp = $ts; CheckName = 'Service-Health'; Target = "$srv/$notRunning"
                    Result = 'Fail'; Detail = "Role=$($role.Role); required service not running"
                })
                Write-ReportLine "$srv role $($role.Role): required service $notRunning is NOT running (Fail)"
            }
            if (-not $role.ServicesNotRunning -or $role.ServicesNotRunning.Count -eq 0) {
                $results.Add([pscustomobject]@{
                    Timestamp = $ts; CheckName = 'Service-Health'; Target = "$srv/$($role.Role)"
                    Result = 'Pass'; Detail = 'All required services running'
                })
                Write-ReportLine "$srv role $($role.Role): all required services running (Pass)"
            }
        }
    } catch {
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'Service-Health'; Target = $srv
            Result = 'Fail'; Detail = "Could not run Test-ServiceHealth: $($_.Exception.Message)"
        })
        $overallExitCode = 1
        Write-ReportLine "ERROR: could not run Test-ServiceHealth against $srv`: $($_.Exception.Message)"
    }

    # --- OWA synthetic transaction ---
    try {
        $owaResult = Test-OwaConnectivity -ClientAccessServer $srv -ErrorAction Stop
        foreach ($r in $owaResult) {
            $owaCheck = if ($r.Result -eq 'Success') { 'Pass' } else { 'Fail' }
            if ($owaCheck -eq 'Fail') { $overallExitCode = 1 }
            $results.Add([pscustomobject]@{
                Timestamp = $ts; CheckName = 'OWA-Connectivity'; Target = $srv
                Result = $owaCheck; Detail = "Result=$($r.Result); Latency=$($r.Latency); Error=$($r.Error)"
            })
            Write-ReportLine "$srv OWA connectivity: $($r.Result) ($owaCheck)"
        }
    } catch {
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'OWA-Connectivity'; Target = $srv
            Result = 'Fail'; Detail = "Could not run Test-OwaConnectivity: $($_.Exception.Message)"
        })
        $overallExitCode = 1
        Write-ReportLine "ERROR: could not run Test-OwaConnectivity against $srv`: $($_.Exception.Message)"
    }

    # --- ActiveSync synthetic transaction ---
    try {
        $easResult = Test-ActiveSyncConnectivity -ClientAccessServer $srv -ErrorAction Stop
        foreach ($r in $easResult) {
            $easCheck = if ($r.Result -eq 'Success') { 'Pass' } else { 'Fail' }
            if ($easCheck -eq 'Fail') { $overallExitCode = 1 }
            $results.Add([pscustomobject]@{
                Timestamp = $ts; CheckName = 'ActiveSync-Connectivity'; Target = $srv
                Result = $easCheck; Detail = "Result=$($r.Result); Latency=$($r.Latency); Error=$($r.Error)"
            })
            Write-ReportLine "$srv ActiveSync connectivity: $($r.Result) ($easCheck)"
        }
    } catch {
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'ActiveSync-Connectivity'; Target = $srv
            Result = 'Fail'; Detail = "Could not run Test-ActiveSyncConnectivity: $($_.Exception.Message)"
        })
        $overallExitCode = 1
        Write-ReportLine "ERROR: could not run Test-ActiveSyncConnectivity against $srv`: $($_.Exception.Message)"
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
$passCount = ($results | Where-Object Result -eq 'Pass').Count
Write-ReportLine "Totals: $passCount passed, $failCount failed across $($Server.Count) target(s)."

Write-Host "Client access availability check complete. $passCount passed / $failCount failed. Report: $OutputPath"

$results
exit $overallExitCode
