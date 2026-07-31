<#
.SYNOPSIS
    Checks Splunk forwarder connectivity, index health, and license usage via the Splunk REST API.

.DESCRIPTION
    Automates MRC-OPS-023 -- Splunk forwarder health, index health, and license usage check (weekly
    task, execution-plan/mrc-cards/ops/MRC-OPS-023.md).

    Calls the Splunk management REST API (default port 8089, HTTPS) directly via
    Invoke-RestMethod -- no Splunk Web / browser console interaction is required. Splunk's REST API
    reference documents these endpoints (see the card's References section for source links):
      - GET /services/server/health/splunkd            -- overall splunkd feature-health color
      - GET /services/deployment/server/clients         -- deployment clients and their
                                                            lastPhoneHomeTime (run against the
                                                            Deployment Server instance; per Splunk's
                                                            own documentation this endpoint is only
                                                            authoritative when queried on the DS
                                                            itself)
      - GET /services/data/indexes                      -- per-index currentDBSizeMB /
                                                            maxTotalDataSizeMB
      - GET /services/licenser/usage                     -- quota and peers_usage_bytes for the
                                                            active license stack

    For every check, the script flags Warning (not Fail -- Splunk health/capacity signals are
    rarely a hard outage on their own and generally warrant investigation rather than an immediate
    page) when:
      - splunkd health is not "green"
      - any deployment client's lastPhoneHomeTime is older than -ForwarderStaleMinutes (default 15,
        which is well above Splunk's default 60-second phone-home interval)
      - any enabled index's currentDBSizeMB / maxTotalDataSizeMB exceeds -IndexCapacityWarnPercent
        (default 90)
      - license usage (peers_usage_bytes / quota) exceeds -LicenseWarnPercent (default 85)

    This script is READ-ONLY. It never modifies a forwarder, index, or license configuration, and
    never restarts any Splunk service.

.PARAMETER SplunkHost
    Hostname or IP of the Splunk instance to query (typically the Deployment Server for the
    forwarder-connectivity check, and/or a search head / license master for the other checks; if
    a single all-in-one instance serves all these roles, one run is sufficient).

.PARAMETER Port
    Splunk management (REST API) port. Default: 8089.

.PARAMETER Credential
    PSCredential for HTTP Basic authentication against the Splunk REST API. Required. Use a
    read-only Splunk user account created specifically for this automation.

.PARAMETER ForwarderStaleMinutes
    Minutes since a deployment client's last phone-home before it is flagged Warning. Default: 15.

.PARAMETER IndexCapacityWarnPercent
    Percent of an index's maxTotalDataSizeMB in use before it is flagged Warning. Default: 90.

.PARAMETER LicenseWarnPercent
    Percent of license quota (peers_usage_bytes / quota) in use before it is flagged Warning.
    Default: 85.

.PARAMETER SkipForwarderCheck
    Skip the deployment-client/forwarder check. Use when this instance is not a Deployment Server
    and forwarders are managed/checked elsewhere.

.PARAMETER OutputPath
    Path to write the combined report file. Defaults to
    .\reports\MRC-OPS-023_<yyyyMMdd-HHmmss>.txt (created if it does not exist).

.EXAMPLE
    .\MRC-OPS-023.ps1 -SplunkHost splunk-ds01.example.mil -Credential (Get-Credential)
    Checks splunkd health, forwarder phone-home recency, index capacity, and license usage.

.NOTES
    MRC ID     : MRC-OPS-023 -- Splunk forwarder health, index health, and license usage check
    Card       : ../ops/MRC-OPS-023.md
    Frequency  : Weekly
    Baseline   : Splunk (per AGENTS.md rule 8)
    Requires   : Network access to the Splunk management port (default 8089) and a Splunk account
                 with sufficient capability to read server/health, deployment/server/clients,
                 data/indexes, and licenser/usage endpoints (a built-in "admin" or a custom
                 read-only role with list_health / list_settings-equivalent capabilities).
    Exit codes : 0 = every check passed. 1 = any check returned Warning or could not be queried.

    SAFETY DISCLAIMER: Provided as a starting point for the stated baseline environment. Not
    validated against a live production system in this repository. A human must review this
    script's logic, confirm the target instance's actual role (Deployment Server vs. indexer vs.
    license master) and test it in a non-production environment before operational use, per the
    organization's own change-control process. This script never modifies Splunk configuration.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string] $SplunkHost,

    [Parameter(Mandatory = $false)]
    [int] $Port = 8089,

    [Parameter(Mandatory = $true)]
    [System.Management.Automation.PSCredential] $Credential,

    [Parameter(Mandatory = $false)]
    [int] $ForwarderStaleMinutes = 15,

    [Parameter(Mandatory = $false)]
    [int] $IndexCapacityWarnPercent = 90,

    [Parameter(Mandatory = $false)]
    [int] $LicenseWarnPercent = 85,

    [Parameter(Mandatory = $false)]
    [switch] $SkipForwarderCheck,

    [Parameter(Mandatory = $false)]
    [string] $OutputPath = ".\reports\MRC-OPS-023_$(Get-Date -Format 'yyyyMMdd-HHmmss').txt"
)

$ErrorActionPreference = 'Stop'
$results = New-Object System.Collections.Generic.List[object]
$overallExitCode = 0
$baseUri = "https://${SplunkHost}:${Port}/services"

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

function Invoke-SplunkApi {
    param(
        [Parameter(Mandatory = $true)] [string] $Endpoint,
        [Parameter(Mandatory = $false)] [hashtable] $QueryParams = @{}
    )
    $qp = @{ output_mode = 'json'; count = 0 }
    foreach ($k in $QueryParams.Keys) { $qp[$k] = $QueryParams[$k] }
    $qs = ($qp.GetEnumerator() | ForEach-Object { "$($_.Key)=$([uri]::EscapeDataString([string]$_.Value))" }) -join '&'
    $uri = "$baseUri/$Endpoint`?$qs"
    if ($script:IsPSCore) {
        Invoke-RestMethod -Uri $uri -Credential $Credential -Method Get -SkipCertificateCheck -ErrorAction Stop
    } else {
        Invoke-RestMethod -Uri $uri -Credential $Credential -Method Get -ErrorAction Stop
    }
}

$outDir = Split-Path -Path $OutputPath -Parent
if ($outDir -and -not (Test-Path -LiteralPath $outDir)) {
    New-Item -ItemType Directory -Path $outDir -Force | Out-Null
}
New-Item -ItemType File -Path $OutputPath -Force | Out-Null

$ts = Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz'
$now = Get-Date

Write-ReportLine "MRC-OPS-023 -- Splunk forwarder health, index health, and license usage check"
Write-ReportLine "Run timestamp : $ts"
Write-ReportLine "Run by        : $env:USERDOMAIN\$env:USERNAME on $env:COMPUTERNAME"
Write-ReportLine "Target        : ${SplunkHost}:${Port}"
Write-ReportLine ("=" * 78)
Write-ReportLine ""

# --- splunkd overall health ---
Write-ReportLine "--- splunkd Overall Health ---"
try {
    $health = Invoke-SplunkApi -Endpoint 'server/health/splunkd'
    $healthColor = $health.entry[0].content.health
    if ($healthColor -eq 'green') {
        $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'splunkd-Health'; Target = $SplunkHost; Result = 'Pass'; Detail = "health=$healthColor" })
        Write-ReportLine "splunkd health: $healthColor (Pass)"
    } else {
        $overallExitCode = 1
        $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'splunkd-Health'; Target = $SplunkHost; Result = 'Warning'; Detail = "health=$healthColor -- see server/health/splunkd/details for the specific unhealthy feature" })
        Write-ReportLine "splunkd health: $healthColor -- NOT green (Warning)"
    }
} catch {
    $overallExitCode = 1
    $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'splunkd-Health'; Target = $SplunkHost; Result = 'Warning'; Detail = "Could not query server/health/splunkd: $($_.Exception.Message)" })
    Write-ReportLine "ERROR: could not query server/health/splunkd: $($_.Exception.Message)"
}
Write-ReportLine ""

# --- Forwarder / deployment client phone-home recency ---
if (-not $SkipForwarderCheck) {
    Write-ReportLine "--- Deployment Client (Forwarder) Phone-Home Recency ---"
    try {
        $clients = Invoke-SplunkApi -Endpoint 'deployment/server/clients'
        if (-not $clients.entry -or $clients.entry.Count -eq 0) {
            Write-ReportLine "No deployment clients returned -- this instance may not be a Deployment Server; re-run with -SkipForwarderCheck if forwarders are managed elsewhere."
        }
        foreach ($c in $clients.entry) {
            $hostname = $c.content.hostname
            $lastPhoneHome = $c.content.lastPhoneHomeTime
            if (-not $lastPhoneHome) {
                $overallExitCode = 1
                $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Forwarder-PhoneHome'; Target = $hostname; Result = 'Warning'; Detail = 'No lastPhoneHomeTime reported' })
                Write-ReportLine "$hostname`: no lastPhoneHomeTime reported (Warning)"
                continue
            }
            $lastSeen = [DateTimeOffset]::FromUnixTimeSeconds([long]$lastPhoneHome).LocalDateTime
            $ageMin = [math]::Round(($now - $lastSeen).TotalMinutes, 1)
            if ($ageMin -gt $ForwarderStaleMinutes) {
                $overallExitCode = 1
                $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Forwarder-PhoneHome'; Target = $hostname; Result = 'Warning'; Detail = "Last phone-home $ageMin minute(s) ago (threshold $ForwarderStaleMinutes min)" })
                Write-ReportLine "$hostname`: last phone-home $ageMin min ago, EXCEEDS $ForwarderStaleMinutes min threshold (Warning)"
            } else {
                $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Forwarder-PhoneHome'; Target = $hostname; Result = 'Pass'; Detail = "Last phone-home $ageMin minute(s) ago" })
                Write-ReportLine "$hostname`: last phone-home $ageMin min ago (Pass)"
            }
        }
    } catch {
        $overallExitCode = 1
        $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Forwarder-PhoneHome'; Target = $SplunkHost; Result = 'Warning'; Detail = "Could not query deployment/server/clients: $($_.Exception.Message)" })
        Write-ReportLine "ERROR: could not query deployment/server/clients: $($_.Exception.Message)"
    }
    Write-ReportLine ""
} else {
    Write-ReportLine "--- Deployment Client (Forwarder) Phone-Home Recency: SKIPPED (-SkipForwarderCheck) ---"
    Write-ReportLine ""
}

# --- Index capacity ---
Write-ReportLine "--- Index Capacity ---"
try {
    $indexes = Invoke-SplunkApi -Endpoint 'data/indexes'
    foreach ($idx in $indexes.entry) {
        if ($idx.content.disabled -eq $true -or $idx.content.disabled -eq '1') { continue }
        $used = [double]$idx.content.currentDBSizeMB
        $max = [double]$idx.content.maxTotalDataSizeMB
        if ($max -le 0) { continue }
        $pct = [math]::Round(($used / $max) * 100, 1)
        if ($pct -gt $IndexCapacityWarnPercent) {
            $overallExitCode = 1
            $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Index-Capacity'; Target = $idx.name; Result = 'Warning'; Detail = "$pct% of maxTotalDataSizeMB in use ($used / $max MB)" })
            Write-ReportLine "Index $($idx.name): $pct% used ($used / $max MB), EXCEEDS $IndexCapacityWarnPercent% threshold (Warning)"
        } else {
            $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Index-Capacity'; Target = $idx.name; Result = 'Pass'; Detail = "$pct% of maxTotalDataSizeMB in use ($used / $max MB)" })
            Write-ReportLine "Index $($idx.name): $pct% used ($used / $max MB) (Pass)"
        }
    }
} catch {
    $overallExitCode = 1
    $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Index-Capacity'; Target = $SplunkHost; Result = 'Warning'; Detail = "Could not query data/indexes: $($_.Exception.Message)" })
    Write-ReportLine "ERROR: could not query data/indexes: $($_.Exception.Message)"
}
Write-ReportLine ""

# --- License usage ---
Write-ReportLine "--- License Usage ---"
try {
    $lic = Invoke-SplunkApi -Endpoint 'licenser/usage'
    $quota = [double]$lic.entry[0].content.quota
    $used = [double]$lic.entry[0].content.peers_usage_bytes
    if ($quota -le 0) {
        Write-ReportLine "License quota reported as 0 or unavailable -- skipping percentage calculation; review licenser/usage output manually."
    } else {
        $pct = [math]::Round(($used / $quota) * 100, 1)
        if ($pct -gt $LicenseWarnPercent) {
            $overallExitCode = 1
            $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'License-Usage'; Target = $SplunkHost; Result = 'Warning'; Detail = "$pct% of daily license quota in use ($used / $quota bytes)" })
            Write-ReportLine "License usage: $pct% of quota ($used / $quota bytes), EXCEEDS $LicenseWarnPercent% threshold (Warning)"
        } else {
            $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'License-Usage'; Target = $SplunkHost; Result = 'Pass'; Detail = "$pct% of daily license quota in use ($used / $quota bytes)" })
            Write-ReportLine "License usage: $pct% of quota ($used / $quota bytes) (Pass)"
        }
    }
} catch {
    $overallExitCode = 1
    $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'License-Usage'; Target = $SplunkHost; Result = 'Warning'; Detail = "Could not query licenser/usage: $($_.Exception.Message)" })
    Write-ReportLine "ERROR: could not query licenser/usage: $($_.Exception.Message)"
}

Write-ReportLine ""
Write-ReportLine ("=" * 78)
Write-ReportLine "SUMMARY"
Write-ReportLine ("=" * 78)
$summaryLines = $results | Format-Table Timestamp, Target, CheckName, Result, Detail -AutoSize | Out-String
Write-ReportLine $summaryLines

$failCount = ($results | Where-Object Result -eq 'Warning').Count
$passCount = ($results | Where-Object Result -eq 'Pass').Count
Write-ReportLine "Totals: $passCount passed, $failCount warning(s)."

Write-Host "Splunk health check complete. $passCount passed / $failCount warning(s). Report: $OutputPath"

$results
exit $overallExitCode
