<#
.SYNOPSIS
    Checks Nessus scanner engine status and plugin feed currency via the Nessus REST API.

.DESCRIPTION
    Automates MRC-OPS-024 -- Nessus scanner engine and plugin feed health check (weekly task,
    execution-plan/mrc-cards/ops/MRC-OPS-024.md).

    Calls the Nessus REST API directly via Invoke-RestMethod using API key authentication (the
    X-ApiKeys header, per Tenable's documented authentication scheme) -- no Nessus web console
    interaction is required. Two endpoints are used (see the card's References section for source
    links):
      - GET /server/status      -- scanner engine up/loading/ready state
      - GET /server/properties  -- nessus_ui_version, nessus_type, and the current loaded plugin
                                    feed's timestamp (feed identifiers are date-coded, e.g.
                                    202607071632 = 2026-07-07 16:32 UTC)

    Flags:
      - Fail if /server/status does not report a ready state
      - Warning if the loaded plugin feed's encoded date is older than -MaxFeedAgeDays (default 7
        -- Tenable typically ships new plugin feeds daily, so a week-old feed indicates the
        scheduled feed update is not running)

    This script is READ-ONLY. It never triggers a plugin update, scan, or configuration change.

.PARAMETER NessusHost
    Hostname or IP of the Nessus scanner to query.

.PARAMETER Port
    Nessus REST API port. Default: 8834.

.PARAMETER AccessKey
    Nessus API access key (generated under the scanner's My Account > API Keys, per Tenable
    documentation). Required.

.PARAMETER SecretKey
    Nessus API secret key, paired with -AccessKey. Required. Pass as a SecureString; the script
    converts it only in memory for the X-ApiKeys header value.

.PARAMETER MaxFeedAgeDays
    Maximum age, in days, of the loaded plugin feed before it is flagged Warning. Default: 7.

.PARAMETER OutputPath
    Path to write the combined report file. Defaults to
    .\reports\MRC-OPS-024_<yyyyMMdd-HHmmss>.txt (created if it does not exist).

.EXAMPLE
    .\MRC-OPS-024.ps1 -NessusHost nessus01.example.mil -AccessKey $ak -SecretKey (Read-Host -AsSecureString)
    Checks scanner engine readiness and plugin feed currency.

.NOTES
    MRC ID     : MRC-OPS-024 -- Nessus scanner engine and plugin feed health check
    Card       : ../ops/MRC-OPS-024.md
    Frequency  : Weekly
    Baseline   : Nessus (per AGENTS.md rule 8)
    Requires   : Network access to the Nessus REST API port (default 8834) and a valid Nessus API
                 access/secret key pair for an account with at least read access.
    Exit codes : 0 = scanner is ready and the plugin feed is within the age threshold. 1 = the
                 scanner is not ready, the feed is stale, or the API could not be queried.

    SAFETY DISCLAIMER: Provided as a starting point for the stated baseline environment. Not
    validated against a live production system in this repository. A human must review this
    script's logic and test it in a non-production environment before operational use, per the
    organization's own change-control process. This script never triggers a scan or plugin update.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string] $NessusHost,

    [Parameter(Mandatory = $false)]
    [int] $Port = 8834,

    [Parameter(Mandatory = $true)]
    [string] $AccessKey,

    [Parameter(Mandatory = $true)]
    [System.Security.SecureString] $SecretKey,

    [Parameter(Mandatory = $false)]
    [int] $MaxFeedAgeDays = 7,

    [Parameter(Mandatory = $false)]
    [string] $OutputPath = ".\reports\MRC-OPS-024_$(Get-Date -Format 'yyyyMMdd-HHmmss').txt"
)

$ErrorActionPreference = 'Stop'
$results = New-Object System.Collections.Generic.List[object]
$overallExitCode = 0
$baseUri = "https://${NessusHost}:${Port}"

function Write-ReportLine {
    param([string] $Line)
    Add-Content -LiteralPath $OutputPath -Value $Line
}

# Windows PowerShell 5.1 has no -SkipCertificateCheck parameter on Invoke-RestMethod (added in
# PowerShell 6+); fall back to a ServicePointManager certificate-validation override for that case
# so this script runs unmodified on either PowerShell edition. This only relaxes TLS certificate
# validation for this process's own outbound calls -- it never changes any server-side setting.
$script:IsPSCore = $PSVersionTable.PSVersion.Major -ge 6
if (-not $script:IsPSCore) {
    [System.Net.ServicePointManager]::ServerCertificateValidationCallback = { $true }
}

$secretPlain = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto(
    [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecretKey))
$apiKeyHeader = @{ 'X-ApiKeys' = "accessKey=$AccessKey;secretKey=$secretPlain" }

function Invoke-NessusApi {
    param([Parameter(Mandatory = $true)] [string] $Endpoint)
    $uri = "$baseUri/$Endpoint"
    if ($script:IsPSCore) {
        Invoke-RestMethod -Uri $uri -Headers $apiKeyHeader -Method Get -SkipCertificateCheck -ErrorAction Stop
    } else {
        Invoke-RestMethod -Uri $uri -Headers $apiKeyHeader -Method Get -ErrorAction Stop
    }
}

$outDir = Split-Path -Path $OutputPath -Parent
if ($outDir -and -not (Test-Path -LiteralPath $outDir)) {
    New-Item -ItemType Directory -Path $outDir -Force | Out-Null
}
New-Item -ItemType File -Path $OutputPath -Force | Out-Null

$ts = Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz'
$now = Get-Date

Write-ReportLine "MRC-OPS-024 -- Nessus scanner engine and plugin feed health check"
Write-ReportLine "Run timestamp : $ts"
Write-ReportLine "Run by        : $env:USERDOMAIN\$env:USERNAME on $env:COMPUTERNAME"
Write-ReportLine "Target        : ${NessusHost}:${Port}"
Write-ReportLine ("=" * 78)
Write-ReportLine ""

# --- Scanner engine status ---
Write-ReportLine "--- Scanner Engine Status ---"
try {
    $status = Invoke-NessusApi -Endpoint 'server/status'
    if ($status.status -eq 'ready') {
        $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Engine-Status'; Target = $NessusHost; Result = 'Pass'; Detail = "status=$($status.status)" })
        Write-ReportLine "Scanner status: $($status.status) (Pass)"
    } else {
        $overallExitCode = 1
        $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Engine-Status'; Target = $NessusHost; Result = 'Fail'; Detail = "status=$($status.status) -- expected 'ready'" })
        Write-ReportLine "Scanner status: $($status.status) -- NOT ready (Fail)"
    }
} catch {
    $overallExitCode = 1
    $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Engine-Status'; Target = $NessusHost; Result = 'Fail'; Detail = "Could not query server/status: $($_.Exception.Message)" })
    Write-ReportLine "ERROR: could not query server/status: $($_.Exception.Message)"
}
Write-ReportLine ""

# --- Plugin feed currency ---
Write-ReportLine "--- Plugin Feed Currency ---"
try {
    $props = Invoke-NessusApi -Endpoint 'server/properties'
    $feedRaw = $props.loaded_plugin_set
    if (-not $feedRaw) { $feedRaw = $props.plugin_set }
    if (-not $feedRaw -or $feedRaw.Length -lt 8) {
        $overallExitCode = 1
        $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Plugin-Feed'; Target = $NessusHost; Result = 'Warning'; Detail = "No usable plugin feed identifier returned by server/properties (got '$feedRaw')" })
        Write-ReportLine "Plugin feed: no usable identifier returned (got '$feedRaw') (Warning)"
    } else {
        # Feed identifiers are date-coded, e.g. 202607071632 = 2026-07-07 16:32 UTC.
        $datePart = $feedRaw.Substring(0, 8)
        $feedDate = [datetime]::ParseExact($datePart, 'yyyyMMdd', $null)
        $ageDays = [math]::Round(($now.Date - $feedDate.Date).TotalDays, 1)
        if ($ageDays -gt $MaxFeedAgeDays) {
            $overallExitCode = 1
            $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Plugin-Feed'; Target = $NessusHost; Result = 'Warning'; Detail = "Plugin feed $feedRaw is $ageDays day(s) old (threshold $MaxFeedAgeDays days)" })
            Write-ReportLine "Plugin feed $feedRaw is $ageDays day(s) old, EXCEEDS $MaxFeedAgeDays day threshold (Warning)"
        } else {
            $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Plugin-Feed'; Target = $NessusHost; Result = 'Pass'; Detail = "Plugin feed $feedRaw is $ageDays day(s) old" })
            Write-ReportLine "Plugin feed $feedRaw is $ageDays day(s) old (Pass)"
        }
    }
} catch {
    $overallExitCode = 1
    $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Plugin-Feed'; Target = $NessusHost; Result = 'Warning'; Detail = "Could not query/parse server/properties: $($_.Exception.Message)" })
    Write-ReportLine "ERROR: could not query/parse server/properties: $($_.Exception.Message)"
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

Write-Host "Nessus health check complete. $passCount passed / $failCount failed/warning. Report: $OutputPath"

$results
exit $overallExitCode
