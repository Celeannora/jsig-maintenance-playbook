<#
.SYNOPSIS
    Reports Exchange transport rule and connector configuration for human review.

.DESCRIPTION
    Automates the data-collection portion of MRC-OPS-019 -- Exchange connector and transport rule
    health review (monthly task, execution-plan/mrc-cards/ops/MRC-OPS-019.md).

    Must be run from an Exchange Management Shell session. The script reads and reports:
      - Every transport rule (Get-TransportRule): enabled/disabled state, priority, and whether it
        has a Comments/description set. Flags an enabled rule with no description as Warning (a
        best-practice/auditability concern -- an undocumented rule is hard for the next reviewer to
        assess) and a disabled rule as informational (Pass, noted for awareness since a disabled
        rule that was meant to be temporary is easy to forget about).
      - Every Receive connector (Get-ReceiveConnector) and Send connector (Get-SendConnector):
        enabled/disabled state and key security-relevant settings (AuthMechanism,
        RequireTLS/TlsDomain where applicable, PermissionGroups). Flags a Receive connector that
        both allows anonymous submission (PermissionGroups includes AnonymousUsers) and does not
        require TLS as Warning, since that combination is the most common accidental-open-relay or
        unencrypted-submission misconfiguration.

    This script does NOT replace the human review this card requires -- transport rule and
    connector *intent* (is this rule/connector still needed, is its configuration still correct for
    current business requirements) is a judgment call for the reviewer. This script's role is
    narrower: collect the current configuration completely and flag the specific known-risky
    patterns above, so the reviewer's judgment call is well informed.

    This script is READ-ONLY. It never creates, modifies, enables, disables, or removes a transport
    rule or connector.

.PARAMETER OutputPath
    Path to write the combined report file. Defaults to
    .\reports\MRC-OPS-019_<yyyyMMdd-HHmmss>.txt (created if it does not exist).

.EXAMPLE
    .\MRC-OPS-019.ps1
    Reports every transport rule and connector's configuration for this cycle's review.

.NOTES
    MRC ID     : MRC-OPS-019 -- Exchange connector and transport rule health review
    Card       : ../ops/MRC-OPS-019.md
    Frequency  : Monthly
    Baseline   : Exchange Server (Exchange Admin Center) (per AGENTS.md rule 8) -- this script
                 automates the equivalent read-only data pull via Exchange Management Shell so the
                 reviewer does not have to click through the Exchange Admin Center UI to gather it.
    Requires   : Must be run in (or via a remote session to) Exchange Management Shell.
    Exit codes : 0 = no undocumented enabled rule and no Receive connector combining anonymous
                 submission with no TLS requirement. 1 = any of those patterns found, or the
                 organization's rules/connectors could not be queried. A 0 exit code does NOT mean
                 the review is complete -- the human review of rule/connector *intent* is still
                 required regardless of exit code.

    SAFETY DISCLAIMER: Provided as a starting point for the stated baseline environment. Not
    validated against a live production system in this repository. A human must review this script's
    logic and test it in a non-production environment before operational use, per the organization's
    own change-control process. This script never creates, modifies, or removes any transport rule
    or connector.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string] $OutputPath = ".\reports\MRC-OPS-019_$(Get-Date -Format 'yyyyMMdd-HHmmss').txt"
)

$ErrorActionPreference = 'Stop'
$results = New-Object System.Collections.Generic.List[object]
$overallExitCode = 0

function Write-ReportLine {
    param([string] $Line)
    Add-Content -LiteralPath $OutputPath -Value $Line
}

if (-not (Get-Command Get-TransportRule -ErrorAction SilentlyContinue)) {
    throw "Get-TransportRule is not available. Run this script from an Exchange Management Shell session (or a session with the Exchange management tools/remote PowerShell session loaded)."
}

$outDir = Split-Path -Path $OutputPath -Parent
if ($outDir -and -not (Test-Path -LiteralPath $outDir)) {
    New-Item -ItemType Directory -Path $outDir -Force | Out-Null
}
New-Item -ItemType File -Path $OutputPath -Force | Out-Null

$ts = Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz'

Write-ReportLine "MRC-OPS-019 -- Exchange connector and transport rule health review"
Write-ReportLine "Run timestamp : $ts"
Write-ReportLine "Run by        : $env:USERDOMAIN\$env:USERNAME on $env:COMPUTERNAME"
Write-ReportLine "NOTE: This report supports, but does not replace, the required human review of rule/connector intent."
Write-ReportLine ("=" * 78)
Write-ReportLine ""

# --- Transport rules ---
Write-ReportLine "--- Transport Rules ---"
try {
    $rules = Get-TransportRule -ErrorAction Stop
    foreach ($rule in $rules) {
        $hasDescription = -not [string]::IsNullOrWhiteSpace($rule.Comments)
        if (-not $rule.Enabled) {
            $ruleResult = 'Pass'
            $detail = "Disabled (Priority=$($rule.Priority)) -- noted for awareness"
        } elseif (-not $hasDescription) {
            $ruleResult = 'Warning'
            $detail = "Enabled, no Comments/description set (Priority=$($rule.Priority))"
            if ($overallExitCode -eq 0) { $overallExitCode = 1 }
        } else {
            $ruleResult = 'Pass'
            $detail = "Enabled, documented (Priority=$($rule.Priority))"
        }
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'TransportRule'; Target = $rule.Name
            Result = $ruleResult; Detail = $detail
        })
        Write-ReportLine "Rule '$($rule.Name)': $detail ($ruleResult)"
    }
} catch {
    $results.Add([pscustomobject]@{
        Timestamp = $ts; CheckName = 'TransportRule'; Target = '(organization)'
        Result = 'Fail'; Detail = "Could not query transport rules: $($_.Exception.Message)"
    })
    $overallExitCode = 1
    Write-ReportLine "ERROR: could not query transport rules: $($_.Exception.Message)"
}

Write-ReportLine ""

# --- Receive connectors ---
Write-ReportLine "--- Receive Connectors ---"
try {
    $recvConnectors = Get-ReceiveConnector -ErrorAction Stop
    foreach ($conn in $recvConnectors) {
        $allowsAnonymous = $conn.PermissionGroups -match 'AnonymousUsers'
        $requiresTls = $conn.TlsDomainCapabilities -or ($conn.AuthMechanism -match 'Tls')
        if ($allowsAnonymous -and -not $requiresTls) {
            $connResult = 'Warning'
            $overallExitCode = 1
            $detail = "Allows anonymous submission WITHOUT a TLS requirement -- possible open-relay/unencrypted-submission risk (Enabled=$($conn.Enabled))"
        } elseif (-not $conn.Enabled) {
            $connResult = 'Pass'
            $detail = "Disabled -- noted for awareness"
        } else {
            $connResult = 'Pass'
            $detail = "Enabled, PermissionGroups=$($conn.PermissionGroups -join ','), AuthMechanism=$($conn.AuthMechanism -join ',')"
        }
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'ReceiveConnector'; Target = $conn.Name
            Result = $connResult; Detail = $detail
        })
        Write-ReportLine "Receive connector '$($conn.Name)': $detail ($connResult)"
    }
} catch {
    $results.Add([pscustomobject]@{
        Timestamp = $ts; CheckName = 'ReceiveConnector'; Target = '(organization)'
        Result = 'Fail'; Detail = "Could not query receive connectors: $($_.Exception.Message)"
    })
    $overallExitCode = 1
    Write-ReportLine "ERROR: could not query receive connectors: $($_.Exception.Message)"
}

Write-ReportLine ""

# --- Send connectors ---
Write-ReportLine "--- Send Connectors ---"
try {
    $sendConnectors = Get-SendConnector -ErrorAction Stop
    foreach ($conn in $sendConnectors) {
        $sendResult = if ($conn.Enabled) { 'Pass' } else { 'Pass' }
        $detail = "Enabled=$($conn.Enabled), AddressSpaces=$($conn.AddressSpaces -join ','), TlsAuthLevel=$($conn.TlsAuthLevel)"
        $results.Add([pscustomobject]@{
            Timestamp = $ts; CheckName = 'SendConnector'; Target = $conn.Name
            Result = $sendResult; Detail = $detail
        })
        Write-ReportLine "Send connector '$($conn.Name)': $detail ($sendResult)"
    }
} catch {
    $results.Add([pscustomobject]@{
        Timestamp = $ts; CheckName = 'SendConnector'; Target = '(organization)'
        Result = 'Fail'; Detail = "Could not query send connectors: $($_.Exception.Message)"
    })
    $overallExitCode = 1
    Write-ReportLine "ERROR: could not query send connectors: $($_.Exception.Message)"
}

Write-ReportLine ""
Write-ReportLine ("=" * 78)
Write-ReportLine "SUMMARY"
Write-ReportLine ("=" * 78)
$summaryLines = $results | Format-Table Timestamp, CheckName, Target, Result, Detail -AutoSize | Out-String
Write-ReportLine $summaryLines

$failCount = ($results | Where-Object Result -eq 'Fail').Count
$warnCount = ($results | Where-Object Result -eq 'Warning').Count
$passCount = ($results | Where-Object Result -eq 'Pass').Count
Write-ReportLine "Totals: $passCount passed, $failCount failed, $warnCount warning(s)."
Write-ReportLine "REMINDER: exit code 0 reflects only the automated risk-pattern checks above -- the required human review of rule/connector intent is separate and must still be performed."

Write-Host "Connector/transport rule data collection complete. $passCount passed / $failCount failed / $warnCount warning(s). Report: $OutputPath"

$results
exit $overallExitCode
