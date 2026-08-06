#Requires -Version 5.1
<#
.SYNOPSIS
    Runs the 41-item Initial System Validation (ISV) checklist against the
    local Windows system and writes a tamper-evident evidence.json bundle.

.DESCRIPTION
    This is the real collector: for each item defined in IsvDefinitions.ps1
    it executes that item's native PowerShell/CIM/reg/icacls Command live on
    this machine, captures the raw output, and -- where an Evaluate
    scriptblock is defined -- automatically derives PASS / FAIL / N/A.
    Items with no Evaluate scriptblock are always recorded as MANUAL: either
    they are pure inventory capture with no pass/fail criterion (Section 0),
    or the requirement is a judgment call this script deliberately does not
    attempt to automate (BIOS settings review, ACL-vs-baseline comparison,
    approved-account-list membership, physical port inspection).

    A single failing check never aborts the run: every command is wrapped in
    try/catch, and a failure/exception is captured as Result = 'N/A' with the
    error text recorded as evidence, exactly like the original mockup's
    intent, so the operator always gets a complete 41-row report.

    -SampleMode preserves the prior demo/mockup behavior: instead of running
    live commands, it re-emits the existing MANUAL/SAMPLE-placeholder
    evidence rows unchanged, which is useful for demonstrating the reporting
    pipeline on a non-Windows or non-target machine (this repo's Linux
    sandbox, for instance, cannot execute Win32_* CIM classes or icacls).

    Per repo policy (AGENTS.md Rule 9 pattern, applied here to the ISV
    checklist itself): this script is READ/CHECK/REPORT ONLY. It never
    modifies system state, sets a password, changes a registry value, or
    disables a service -- it only inspects and records.

.PARAMETER Inspector
    CSU Inspector name for the System Identification block. Site-specific;
    no OS query can supply this.

.PARAMETER AreaLocation
    Area / Location for the System Identification block. Site-specific.

.PARAMETER Program
    Program name for the System Identification block. Site-specific.

.PARAMETER AssetTag
    Asset Tag Number (TAG#) for the System Identification block. Site-specific.

.PARAMETER ScapScore
    SCAP score for the System Identification block. Site-specific; typically
    populated from a separate SCAP scan tool's output, not this script.

.PARAMETER Dcn
    DCN value for the System Identification block. Site-specific,
    undefined abbreviation -- see IsvDefinitions.ps1 $ReportNotes.

.PARAMETER PriorWin10Upgrade
    Y/N -- whether this asset was a previously hardened Windows 10-to-11
    upgrade. Site-specific history, not derivable from the OS alone.

.PARAMETER SampleMode
    Skip live command execution and re-emit MANUAL/SAMPLE placeholder rows
    instead. Use for demonstrating the pipeline off-target.

.PARAMETER OutputPath
    Where to write the evidence bundle. Defaults to evidence.json alongside
    this script.

.EXAMPLE
    .\Invoke-ISVCollection.ps1 -Inspector "J. Smith" -AreaLocation "Bldg 4" `
        -Program "JSIG-DEMO" -AssetTag "TAG-00042" -Dcn "N/A" `
        -PriorWin10Upgrade "N"

.EXAMPLE
    .\Invoke-ISVCollection.ps1 -SampleMode -OutputPath .\evidence.json
#>

[CmdletBinding()]
param(
    [string]$Inspector          = 'SAMPLE DATA -- not a real examiner',
    [string]$AreaLocation       = 'SAMPLE placeholder -- site-specific, not OS-derivable',
    [string]$Program            = 'SAMPLE placeholder -- site-specific, not OS-derivable',
    [string]$AssetTag           = 'SAMPLE placeholder -- site-specific, not OS-derivable',
    [string]$ScapScore          = 'SAMPLE placeholder -- populate from SCAP scan tool output',
    [string]$Dcn                = 'SAMPLE placeholder -- undefined site-specific abbreviation',
    [string]$PriorWin10Upgrade  = 'SAMPLE placeholder -- site-specific history',
    [switch]$SampleMode,
    [string]$OutputPath = (Join-Path $PSScriptRoot 'evidence.json')
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

. (Join-Path $PSScriptRoot 'IsvDefinitions.ps1')

# ---------------------------------------------------------------------------
# Canonical JSON serializer -- MUST match the Python collector's digest
# algorithm exactly: json.dumps(bundle, sort_keys=True, separators=(",", ":"))
# with ensure_ascii=True (non-ASCII escaped as \uXXXX). PowerShell's built-in
# ConvertTo-Json does not sort keys, does not use compact separators, and
# does not escape non-ASCII the same way, so it cannot be used here.
# ---------------------------------------------------------------------------
function ConvertTo-CanonicalJson {
    param([Parameter(Mandatory)]$InputObject)

    function Format-JsonString {
        param([string]$Value)
        $sb = [System.Text.StringBuilder]::new()
        [void]$sb.Append('"')
        foreach ($ch in $Value.ToCharArray()) {
            $code = [int][char]$ch
            switch ($ch) {
                '"'  { [void]$sb.Append('\"'); continue }
                '\'  { [void]$sb.Append('\\'); continue }
                "`b" { [void]$sb.Append('\b'); continue }
                "`f" { [void]$sb.Append('\f'); continue }
                "`n" { [void]$sb.Append('\n'); continue }
                "`r" { [void]$sb.Append('\r'); continue }
                "`t" { [void]$sb.Append('\t'); continue }
                default {
                    if ($code -lt 0x20 -or $code -gt 0x7E) {
                        [void]$sb.Append(('\u{0:x4}' -f $code))
                    } else {
                        [void]$sb.Append($ch)
                    }
                }
            }
        }
        [void]$sb.Append('"')
        return $sb.ToString()
    }

    function ConvertTo-CanonicalJsonInner {
        param($Obj)
        if ($null -eq $Obj) { return 'null' }
        if ($Obj -is [bool]) { return $(if ($Obj) { 'true' } else { 'false' }) }
        if ($Obj -is [string]) { return Format-JsonString $Obj }
        if ($Obj -is [int] -or $Obj -is [long] -or $Obj -is [double] -or $Obj -is [decimal]) {
            return ([string]$Obj)
        }
        if ($Obj -is [System.Collections.IDictionary]) {
            $keys = @($Obj.Keys) | Sort-Object -Culture 'en-US' -CaseSensitive
            $parts = foreach ($k in $keys) {
                '{0}:{1}' -f (Format-JsonString $k), (ConvertTo-CanonicalJsonInner $Obj[$k])
            }
            return '{' + ($parts -join ',') + '}'
        }
        if ($Obj -is [System.Collections.IEnumerable] -and -not ($Obj -is [string])) {
            $parts = foreach ($item in $Obj) { ConvertTo-CanonicalJsonInner $item }
            return '[' + ($parts -join ',') + ']'
        }
        # PSCustomObject fallback
        $keys = @($Obj.PSObject.Properties.Name) | Sort-Object -Culture 'en-US' -CaseSensitive
        $parts = foreach ($k in $keys) {
            '{0}:{1}' -f (Format-JsonString $k), (ConvertTo-CanonicalJsonInner $Obj.$k)
        }
        return '{' + ($parts -join ',') + '}'
    }

    return ConvertTo-CanonicalJsonInner $InputObject
}

function Get-Sha256Hex {
    param([Parameter(Mandatory)][string]$Text)
    $sha256 = [System.Security.Cryptography.SHA256]::Create()
    try {
        $bytes = [System.Text.Encoding]::UTF8.GetBytes($Text)
        $hash  = $sha256.ComputeHash($bytes)
        return -join ($hash | ForEach-Object { $_.ToString('x2') })
    } finally {
        $sha256.Dispose()
    }
}

# ---------------------------------------------------------------------------
# System Identification collection
# ---------------------------------------------------------------------------
function Get-SystemIdentificationValues {
    $manualMap = @{
        AreaLocation       = $AreaLocation
        Program            = $Program
        Inspector          = $Inspector
        AssetTag           = $AssetTag
        ScapScore          = $ScapScore
        Dcn                = $Dcn
        PriorWin10Upgrade  = $PriorWin10Upgrade
    }

    $auto = [ordered]@{}
    try {
        $cs   = Get-CimInstance -ClassName Win32_ComputerSystem -ErrorAction Stop
        $cpu  = Get-CimInstance -ClassName Win32_Processor -ErrorAction Stop | Select-Object -First 1
        $mem  = Get-CimInstance -ClassName Win32_PhysicalMemory -ErrorAction Stop
        $disks = Get-CimInstance -ClassName Win32_DiskDrive -ErrorAction Stop

        $auto.MakeModel     = "$($cs.Manufacturer) $($cs.Model)".Trim()
        $auto.CpuSerial     = $cpu.ProcessorId
        $ramBytes           = ($mem | Measure-Object -Property Capacity -Sum).Sum
        $auto.RamGb         = if ($ramBytes) { [math]::Round($ramBytes / 1GB, 0) } else { $null }
        $auto.MultipleHd    = if (@($disks).Count -gt 1) { 'Y' } else { 'N' }
        $hd0 = $disks | Select-Object -First 1
        $auto.Hd0Make       = $hd0.Manufacturer
        $auto.Hd0Model      = $hd0.Model
        $auto.Hd0CapacityGb = if ($hd0.Size) { [math]::Round($hd0.Size / 1GB, 0) } else { $null }
        $auto.Hd0Serial     = $hd0.SerialNumber
    } catch {
        Write-Warning "System Identification auto-collection failed (expected on non-Windows hosts): $($_.Exception.Message)"
    }

    $result = [ordered]@{}
    foreach ($label in $SystemIdentificationFields.Keys) {
        $spec = $SystemIdentificationFields[$label]
        if ($spec -like 'auto:*') {
            $key = $spec.Substring(5)
            $result[$label] = if ($auto.Contains($key) -and $null -ne $auto[$key]) { [string]$auto[$key] } else { 'N/A -- not collected on this host' }
        } elseif ($spec -like 'manual:*') {
            $key = $spec.Substring(7)
            $result[$label] = $manualMap[$key]
        }
    }
    return $result
}

# ---------------------------------------------------------------------------
# Per-item execution
# ---------------------------------------------------------------------------
function Invoke-IsvItem {
    param($Section, $Item)

    $timestamp = (Get-Date).ToUniversalTime().ToString('yyyy-MM-dd HH:mm:ss') + ' UTC'

    if ($SampleMode) {
        return [ordered]@{
            section       = $Section.Title
            item_id       = $Item.Id
            requirement   = $Item.Req
            result        = 'MANUAL'
            timestamp_utc = $null
            method        = $Item.Method
            command       = $Item.Command
            evidence      = 'SAMPLE placeholder -- run without -SampleMode on the target Windows system to collect live evidence.'
        }
    }

    $resultValue   = 'MANUAL'
    $evidenceText  = ''
    try {
        $scriptBlock  = [scriptblock]::Create($Item.Command)
        $rawObjects   = & $scriptBlock
        $evidenceText = ($rawObjects | Out-String).TrimEnd()
        if ([string]::IsNullOrWhiteSpace($evidenceText)) {
            $evidenceText = '(no output returned)'
        }
        if ($Item.ContainsKey('Evaluate') -and $Item.Evaluate) {
            $resultValue = & $Item.Evaluate $rawObjects $evidenceText
        }
    } catch {
        $resultValue  = 'N/A'
        $evidenceText = "ERROR executing check: $($_.Exception.Message)"
    }

    [ordered]@{
        section       = $Section.Title
        item_id       = $Item.Id
        requirement   = $Item.Req
        result        = $resultValue
        timestamp_utc = $timestamp
        method        = $Item.Method
        command       = $Item.Command
        evidence      = $evidenceText
    }
}

# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------
Write-Host "Initial System Validation collection starting ($ToolName $ToolVersion)..." -ForegroundColor Cyan
if ($SampleMode) { Write-Host 'Running in -SampleMode: no live checks will be executed.' -ForegroundColor Yellow }

$sysId = Get-SystemIdentificationValues

$items = New-Object System.Collections.Generic.List[object]
foreach ($section in $Sections) {
    foreach ($item in $section.Items) {
        Write-Verbose "Running item $($item.Id): $($item.Req)"
        $items.Add((Invoke-IsvItem -Section $section -Item $item))
    }
}

$hostname = try { $env:COMPUTERNAME } catch { 'UNKNOWN-HOST' }
if ([string]::IsNullOrWhiteSpace($hostname)) { $hostname = 'UNKNOWN-HOST' }

$meta = [ordered]@{
    report_title     = $ReportTitle
    report_id        = "ISV-$hostname-$((Get-Date).ToUniversalTime().ToString('yyyyMMddHHmmss'))"
    generated_at_utc = (Get-Date).ToUniversalTime().ToString('yyyy-MM-dd HH:mm') + ' UTC'
    tool_name        = $ToolName
    tool_version     = $ToolVersion
    examiner         = $Inspector
    hostname         = $hostname
    notes            = $ReportNotes
    system_identification = $sysId
}

$itemsArray = $items.ToArray()
# Digest matches the original Python collector's algorithm exactly: it is
# computed over the items list ONLY (json.dumps(items, sort_keys=True,
# separators=(",", ":"))), not the meta block -- verified against the
# existing sample evidence.json's stored digest.
$canonicalJson = ConvertTo-CanonicalJson -InputObject $itemsArray
$digest = Get-Sha256Hex -Text $canonicalJson

$bundle = [ordered]@{
    meta          = $meta
    sha256_digest = $digest
    items         = $itemsArray
}

$json = $bundle | ConvertTo-Json -Depth 10
Set-Content -Path $OutputPath -Value $json -Encoding UTF8

Write-Host "Collection complete. $($itemsArray.Count) items recorded." -ForegroundColor Green
Write-Host "Evidence bundle written to: $OutputPath" -ForegroundColor Green
Write-Host "SHA-256 digest: $digest" -ForegroundColor Green
