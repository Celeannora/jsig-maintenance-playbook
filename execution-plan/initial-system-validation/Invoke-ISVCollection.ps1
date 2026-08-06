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
    DCN value(s) for the Hard Drives table -- one per physical drive, in the
    same order as the drives detected by this script (Index 0, 1, 2, ...).
    DCN is a site-assigned control number tracked PER DRIVE (confirmed by
    the operator), not a single system-wide value: a system with 2 drives
    needs 2 DCNs. Detection always runs BEFORE any DCN is requested (via
    -Dcn or via prompt) so the drive count is already known. Supply fewer
    values than detected drives to have this script prompt only for the
    remainder; omit entirely to be prompted for every drive.

.PARAMETER PriorWin10Upgrade
    Y/N -- whether this asset was a previously hardened Windows 10-to-11
    upgrade. Site-specific history, not derivable from the OS alone.

.PARAMETER SampleMode
    Skip live command execution and re-emit MANUAL/SAMPLE placeholder rows
    instead. Use for demonstrating the pipeline off-target. Also emits 2
    canned sample drives (rather than running live disk detection) so the
    multi-drive Hard Drives table renders realistically in the demo output.

.PARAMETER OutputPath
    Where to write the evidence bundle. Defaults to evidence.json alongside
    this script.

.PARAMETER SkipReport
    By default this script automatically renders the HTML report (and the
    two BIOS reference guides) immediately after writing evidence.json, by
    calling New-ISVReport.ps1 in the same run -- one command, one full set
    of output files, nothing extra to remember. Pass -SkipReport to opt out
    and only write evidence.json (e.g. if you plan to hand-edit it before
    rendering, or render it separately/offline later).

.EXAMPLE
    .\Invoke-ISVCollection.ps1
    Full live run, one command: detects hardware (including every physical
    drive) FIRST, then prompts for Inspector, Area/Location, Program, Asset
    Tag, SCAP Score, and Prior Win10 Upgrade, then prompts for one DCN PER
    detected drive (now that the drive count is known), then executes all
    41 checks, writes evidence.json, and automatically renders the HTML
    report and BIOS reference guides -- no second command required.

.EXAMPLE
    .\Invoke-ISVCollection.ps1 -Inspector "J. Smith" -AreaLocation "Bldg 4" `
        -Program "JSIG-DEMO" -AssetTag "TAG-00042" -Dcn "DCN-001","DCN-002" `
        -PriorWin10Upgrade "N"
    Non-interactive live run on a 2-drive machine: any field supplied as a
    parameter is used as-is and skipped in the prompt sequence; the two -Dcn
    values are assigned to detected drives 0 and 1 in order. Any field NOT
    supplied (including extra drives beyond how many -Dcn values you gave)
    is still prompted for interactively (mix and match freely).

.EXAMPLE
    .\Invoke-ISVCollection.ps1 -SampleMode -OutputPath .\evidence.json
    Demo/mockup run: no prompts, no live checks -- re-emits placeholder rows
    (including 2 sample drives) and still auto-renders the HTML report.
#>

[CmdletBinding()]
param(
    [string]$Inspector,
    [string]$AreaLocation,
    [string]$Program,
    [string]$AssetTag,
    [string]$ScapScore,
    [string[]]$Dcn,
    [string]$PriorWin10Upgrade,
    [switch]$SampleMode,
    [string]$OutputPath = (Join-Path $PSScriptRoot 'evidence.json'),
    [switch]$SkipReport
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

. (Join-Path $PSScriptRoot 'IsvDefinitions.ps1')

# ---------------------------------------------------------------------------
# Interactive prompting helper for site-specific identification fields.
#
# Design: these fields cannot be derived from the OS, so the script always
# needs a value for each of them. Rather than force the operator to memorize
# command-line switches, any field left unsupplied on the command line is
# prompted for interactively via Read-Host. Passing a switch still works
# exactly as before (useful for unattended/scripted runs) and skips the
# prompt for that specific field only -- interactive and switch-based input
# can be freely mixed.
#
# -SampleMode never prompts: it re-emits the historical SAMPLE placeholder
# text for any field not explicitly overridden, matching the previous
# demo/mockup behavior exactly.
#
# IMPORTANT (drive-count-dependent prompts): this function is called for the
# DCN field ONLY after hardware auto-detection has already run (see the Main
# section below), specifically so the number of DCN prompts shown can match
# the number of physical drives actually detected on this machine, instead
# of guessing a single value up front.
# ---------------------------------------------------------------------------
function Read-IsvField {
    param(
        [string]$CurrentValue,
        [string]$PromptText,
        [string]$SampleDefault
    )
    if (-not [string]::IsNullOrWhiteSpace($CurrentValue)) { return $CurrentValue }
    if ($SampleMode) { return $SampleDefault }
    try {
        $entered = Read-Host $PromptText
    } catch {
        # No interactive console available (e.g. run from a non-interactive
        # scheduler) -- degrade gracefully instead of crashing the run.
        Write-Warning "Could not prompt for '$PromptText' (no interactive console available); recording as not provided."
        $entered = ''
    }
    if ([string]::IsNullOrWhiteSpace($entered)) { return 'N/A -- not provided by operator' }
    return $entered
}

# ---------------------------------------------------------------------------
# Disk inventory -- runs BEFORE any DCN prompting so the drive count is known
# up front. Returns an array of ordered hashtables (one per physical drive,
# Index/Make/Model/CapacityGb/Serial populated, Dcn left $null for the Main
# section to fill in per-drive), or an empty array if detection fails (e.g.
# non-Windows host, CIM unavailable, insufficient permissions). -SampleMode
# returns 2 canned sample drives instead of querying CIM, so the multi-drive
# table renders realistically without needing a real multi-drive machine.
# ---------------------------------------------------------------------------
function Get-DiskInventory {
    if ($SampleMode) {
        return @(
            [ordered]@{ Index = 0; Make = 'SAMPLE placeholder -- not a real vendor'; Model = 'SAMPLE-MODEL-0'; CapacityGb = 512; Serial = 'SAMPLE-SERIAL-0'; Dcn = $null }
            [ordered]@{ Index = 1; Make = 'SAMPLE placeholder -- not a real vendor'; Model = 'SAMPLE-MODEL-1'; CapacityGb = 1024; Serial = 'SAMPLE-SERIAL-1'; Dcn = $null }
        )
    }
    try {
        $disks = @(Get-CimInstance -ClassName Win32_DiskDrive -ErrorAction Stop | Sort-Object Index)
    } catch {
        Write-Warning "Disk inventory auto-detection failed (expected on non-Windows hosts): $($_.Exception.Message)"
        return @()
    }
    $result = @()
    foreach ($d in $disks) {
        $result += [ordered]@{
            Index      = $d.Index
            Make       = $d.Manufacturer
            Model      = $d.Model
            CapacityGb = if ($d.Size) { [math]::Round($d.Size / 1GB, 0) } else { $null }
            Serial     = $d.SerialNumber
            Dcn        = $null
        }
    }
    return $result
}

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
# System Identification collection (excludes per-drive fields -- those live
# in the separate `drives` array built by Get-DiskInventory / the Main
# section below, since a system can have more than one drive).
# ---------------------------------------------------------------------------
function Get-SystemIdentificationValues {
    param([int]$DriveCount)

    $manualMap = @{
        AreaLocation       = $AreaLocation
        Program            = $Program
        Inspector          = $Inspector
        AssetTag           = $AssetTag
        ScapScore          = $ScapScore
        PriorWin10Upgrade  = $PriorWin10Upgrade
    }

    $auto = [ordered]@{}
    try {
        $cs  = Get-CimInstance -ClassName Win32_ComputerSystem -ErrorAction Stop
        $cpu = Get-CimInstance -ClassName Win32_Processor -ErrorAction Stop | Select-Object -First 1
        $mem = Get-CimInstance -ClassName Win32_PhysicalMemory -ErrorAction Stop

        $auto.MakeModel = "$($cs.Manufacturer) $($cs.Model)".Trim()
        $auto.CpuSerial = $cpu.ProcessorId
        $ramBytes       = ($mem | Measure-Object -Property Capacity -Sum).Sum
        $auto.RamGb     = if ($ramBytes) { [math]::Round($ramBytes / 1GB, 0) } else { $null }
    } catch {
        Write-Warning "System Identification auto-collection failed (expected on non-Windows hosts): $($_.Exception.Message)"
    }
    $auto.MultipleHd = if ($DriveCount -gt 1) { 'Y' } elseif ($DriveCount -eq 1) { 'N' } else { 'N/A -- not collected on this host' }

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
        # '2>&1' merges the error stream into the output stream for this
        # invocation. This matters for native executables (reg.exe,
        # icacls.exe): on a non-existent key/path they write their message
        # to STDERR and exit non-zero WITHOUT throwing a catchable
        # PowerShell exception, so without this redirect that text prints
        # directly to the console (bypassing the try/catch entirely) and
        # is lost from the evidence record. With the redirect it becomes
        # part of $rawObjects/$evidenceText instead -- captured as evidence
        # exactly like any other command output, and nothing leaks to the
        # console. PowerShell cmdlets under $ErrorActionPreference = 'Stop'
        # are unaffected: their errors still throw and are still caught
        # below.
        $rawObjects   = & $scriptBlock 2>&1
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
# Main -- ordered so ALL automated collection (hardware inventory incl. every
# physical drive, plus the 41 checklist items) runs FIRST, with zero prompts
# in this phase, and every manual/site-specific field -- including DCN, now
# asked ONCE PER DETECTED DRIVE -- is only requested AFTER the run completes.
# This is deliberate: it means the drive count used to decide how many DCN
# prompts to show is always the real, just-detected count, never a guess
# made before anything has run.
# ---------------------------------------------------------------------------
Write-Host "Initial System Validation collection starting ($ToolName $ToolVersion)..." -ForegroundColor Cyan
if ($SampleMode) { Write-Host 'Running in -SampleMode: no live checks will be executed.' -ForegroundColor Yellow }

Write-Host 'Detecting hardware inventory (including all physical drives)...' -ForegroundColor Cyan
# Force re-wrapping in an array: a bare `return @()`/`return $emptyArray` from
# a PowerShell function unrolls to $null at the call site (a well-known
# pipeline-output gotcha), which would otherwise make $disks.Count throw
# under Set-StrictMode when zero drives are detected.
$disks = @(Get-DiskInventory)
Write-Host "Detected $($disks.Count) physical drive(s)." -ForegroundColor Cyan

Write-Host "Running all $((@($Sections | ForEach-Object { $_.Items.Count } | Measure-Object -Sum).Sum)) checklist items..." -ForegroundColor Cyan
$items = New-Object System.Collections.Generic.List[object]
foreach ($section in $Sections) {
    foreach ($item in $section.Items) {
        Write-Verbose "Running item $($item.Id): $($item.Req)"
        $items.Add((Invoke-IsvItem -Section $section -Item $item))
    }
}
Write-Host 'Automated collection complete.' -ForegroundColor Green

# ---------------------------------------------------------------------------
# Manual / site-specific fields -- prompted here, AFTER every automated step
# above has already run, so (a) the operator never has to wait through 41
# checks before typing anything is avoided by *not* blocking on prompts
# up front, and (b) the DCN prompt sequence below is built from the ACTUAL
# detected drive count, never a guess.
# ---------------------------------------------------------------------------
if (-not $SampleMode) {
    Write-Host ''
    Write-Host 'System Identification -- enter the following site-specific details.' -ForegroundColor Cyan
    Write-Host '(Press Enter to leave a field as "N/A -- not provided by operator".)' -ForegroundColor DarkGray
}
$Inspector         = Read-IsvField -CurrentValue $Inspector         -PromptText 'CSU Inspector name'                                -SampleDefault 'SAMPLE DATA -- not a real examiner'
$AreaLocation      = Read-IsvField -CurrentValue $AreaLocation      -PromptText 'Area / Location'                                    -SampleDefault 'SAMPLE placeholder -- site-specific, not OS-derivable'
$Program           = Read-IsvField -CurrentValue $Program           -PromptText 'Program name'                                       -SampleDefault 'SAMPLE placeholder -- site-specific, not OS-derivable'
$AssetTag          = Read-IsvField -CurrentValue $AssetTag          -PromptText 'Asset Tag Number (TAG#)'                           -SampleDefault 'SAMPLE placeholder -- site-specific, not OS-derivable'
$ScapScore         = Read-IsvField -CurrentValue $ScapScore         -PromptText 'SCAP score (from separate SCAP scan tool, or N/A)' -SampleDefault 'SAMPLE placeholder -- populate from SCAP scan tool output'
$PriorWin10Upgrade = Read-IsvField -CurrentValue $PriorWin10Upgrade -PromptText 'Prior Windows 10-to-11 upgrade? (Y/N)'             -SampleDefault 'SAMPLE placeholder -- site-specific history'

# DCN is a per-drive control number (confirmed by the operator): prompt once
# for EACH detected drive, pre-filled positionally from -Dcn if supplied.
# If no drives were detected at all (non-Windows host, CIM unavailable), fall
# back to exactly one generic DCN prompt so the value is still captured.
$detectedDriveCount = $disks.Count
if ($disks.Count -gt 0) {
    for ($i = 0; $i -lt $disks.Count; $i++) {
        $preset = if ($Dcn -and $i -lt $Dcn.Count) { $Dcn[$i] } else { $null }
        $label  = "DCN for Hard Drive #$($disks[$i].Index) ($($disks[$i].Model), SN $($disks[$i].Serial))"
        $disks[$i].Dcn = Read-IsvField -CurrentValue $preset -PromptText $label -SampleDefault "SAMPLE placeholder -- DCN for drive $($disks[$i].Index)"
    }
} else {
    $preset = if ($Dcn -and $Dcn.Count -gt 0) { $Dcn[0] } else { $null }
    $genericDcn = Read-IsvField -CurrentValue $preset -PromptText 'DCN (drive auto-detection unavailable on this host)' -SampleDefault 'SAMPLE placeholder -- DCN, drive detection unavailable'
    $disks = @([ordered]@{ Index = 'N/A'; Make = 'N/A -- not collected on this host'; Model = 'N/A -- not collected on this host'; CapacityGb = $null; Serial = 'N/A -- not collected on this host'; Dcn = $genericDcn })
}
if (-not $SampleMode) { Write-Host '' }

$sysId = Get-SystemIdentificationValues -DriveCount $detectedDriveCount

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
    drives           = $disks
}

$itemsArray = $items.ToArray()
# Digest matches the original Python collector's algorithm exactly: it is
# computed over the items list ONLY (json.dumps(items, sort_keys=True,
# separators=(",", ":"))), not the meta block -- verified against the
# existing sample evidence.json's stored digest. Because `drives` and the
# trimmed `system_identification` live under meta, restructuring them here
# never touches this digest.
$canonicalJson = ConvertTo-CanonicalJson -InputObject $itemsArray
$digest = Get-Sha256Hex -Text $canonicalJson

$bundle = [ordered]@{
    meta          = $meta
    sha256_digest = $digest
    items         = $itemsArray
}

$json = $bundle | ConvertTo-Json -Depth 10
Set-Content -Path $OutputPath -Value $json -Encoding UTF8

Write-Host "Collection complete. $($itemsArray.Count) items recorded across $($disks.Count) drive(s)." -ForegroundColor Green
Write-Host "Evidence bundle written to: $OutputPath" -ForegroundColor Green
Write-Host "SHA-256 digest: $digest" -ForegroundColor Green

# ---------------------------------------------------------------------------
# Auto-chain the renderer -- by default this script produces the finished
# HTML report (and the two BIOS reference guides) in the SAME run, so there
# is no second command to forget. Pass -SkipReport to opt out.
# ---------------------------------------------------------------------------
if (-not $SkipReport) {
    $reportScript = Join-Path $PSScriptRoot 'New-ISVReport.ps1'
    $outputDir = Split-Path -Path $OutputPath -Parent
    if ([string]::IsNullOrWhiteSpace($outputDir)) { $outputDir = $PSScriptRoot }
    Write-Host ''
    Write-Host "Rendering HTML report via $reportScript ..." -ForegroundColor Cyan
    try {
        & $reportScript -EvidencePath $OutputPath -OutputDir $outputDir
    } catch {
        Write-Warning "Automatic report rendering failed: $($_.Exception.Message)"
        Write-Warning "evidence.json was still written successfully. Render it manually with: .\New-ISVReport.ps1 -EvidencePath `"$OutputPath`" -OutputDir `"$outputDir`""
    }
} else {
    Write-Host ''
    Write-Host '-SkipReport was set: no HTML report was generated. Render it later with:' -ForegroundColor Yellow
    Write-Host "  .\New-ISVReport.ps1 -EvidencePath `"$OutputPath`" -OutputDir `"<folder>`"" -ForegroundColor Yellow
}
