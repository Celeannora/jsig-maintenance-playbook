#Requires -Version 5.1
<#
.SYNOPSIS
    Renders the Initial System Validation (ISV) HTML report and the two
    Dell/HP BIOS Reference Guide companion documents from a live
    evidence.json bundle produced by Invoke-ISVCollection.ps1.

.DESCRIPTION
    Pure string/file I/O renderer -- no system inspection happens here, all
    of that already happened in Invoke-ISVCollection.ps1. This script:
      1. Loads evidence.json (real collected results, or -SampleMode output).
      2. Recomputes the canonical SHA-256 digest from the loaded items array
         and compares it to the digest stored in the file -- if they don't
         match, evidence.json was edited after collection, and this is
         surfaced as a loud warning in both the console and the report
         itself (tamper-evidence, not tamper-prevention).
      3. Renders the same Nexus design-system HTML structure as the original
         mockup renderer (render_report.py) plus the two BIOS reference
         guides (render_bios_guides.py), reading section/BIOS reference
         content from IsvDefinitions.ps1 so the two scripts never drift.

    Outputs (default -OutputDir is this script's folder):
      - Initial-System-Validation-Report-SAMPLE.html
      - Dell-BIOS-Reference-Guide.html
      - HP-BIOS-Reference-Guide.html

.PARAMETER EvidencePath
    Path to the evidence.json bundle to render. Defaults to evidence.json
    alongside this script.

.PARAMETER OutputDir
    Directory to write the three HTML files to. Defaults to this script's
    folder.

.EXAMPLE
    .\New-ISVReport.ps1 -EvidencePath .\evidence.json -OutputDir .
#>

[CmdletBinding()]
param(
    [string]$EvidencePath = (Join-Path $PSScriptRoot 'evidence.json'),
    [string]$OutputDir    = $PSScriptRoot
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

. (Join-Path $PSScriptRoot 'IsvDefinitions.ps1')

# ---------------------------------------------------------------------------
# Canonical JSON + digest (must stay byte-identical to Invoke-ISVCollection.ps1)
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
        if ($Obj -is [datetime]) {
            # Defensive: some JSON parsers (including PowerShell's own
            # ConvertFrom-Json) auto-convert ISO-8601-looking strings into
            # [datetime]. Re-emit in the same Z-suffixed ISO 8601 shape so a
            # value that started as text round-trips back to matching text.
            return Format-JsonString ($Obj.ToString("yyyy-MM-ddTHH:mm:ss'Z'"))
        }
        if ($Obj -is [System.Collections.IDictionary]) {
            $keys = @($Obj.Keys) | Sort-Object -Culture 'en-US' -CaseSensitive
            $parts = foreach ($k in $keys) {
                '{0}:{1}' -f (Format-JsonString $k), (ConvertTo-CanonicalJsonInner $Obj[$k])
            }
            return '{' + ($parts -join ',') + '}'
        }
        if ($Obj -is [System.Management.Automation.PSCustomObject]) {
            $keys = @($Obj.PSObject.Properties.Name) | Sort-Object -Culture 'en-US' -CaseSensitive
            $parts = foreach ($k in $keys) {
                '{0}:{1}' -f (Format-JsonString $k), (ConvertTo-CanonicalJsonInner $Obj.$k)
            }
            return '{' + ($parts -join ',') + '}'
        }
        if ($Obj -is [System.Collections.IEnumerable]) {
            $parts = foreach ($item in $Obj) { ConvertTo-CanonicalJsonInner $item }
            return '[' + ($parts -join ',') + ']'
        }
        return Format-JsonString ([string]$Obj)
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
# HTML escaping
# ---------------------------------------------------------------------------
function Esc {
    param($Value)
    if ($null -eq $Value) { return '' }
    [System.Net.WebUtility]::HtmlEncode([string]$Value)
}

function EscPre {
    param($Value)
    if ($null -eq $Value) { return '<span class="fill-in">(no automated evidence -- see note)</span>' }
    [System.Net.WebUtility]::HtmlEncode([string]$Value)
}

# ---------------------------------------------------------------------------
# Shared Nexus design-system CSS (matches the original render_report.py /
# render_bios_guides.py palette and layout exactly).
# ---------------------------------------------------------------------------
$ColorBg = '#F7F6F2'; $ColorSurface = '#FFFFFF'; $ColorSurfaceAlt = '#F9F8F5'
$ColorBorder = '#D4D1CA'; $ColorText = '#28251D'; $ColorTextMuted = '#7A7974'
$ColorTextFaint = '#BAB9B4'; $ColorPrimary = '#01696F'
$ColorWarning = '#964219'; $ColorWarningFill = '#FBF1EA'
$ColorError = '#A12C7B'; $ColorErrorFill = '#FBEFF6'
$ColorSuccess = '#437A22'; $ColorHeaderFill = '#F2F1EC'

$ResultStyle = @{
    'PASS'   = @{ Color = $ColorSuccess; Fill = '#EEF5E7' }
    'FAIL'   = @{ Color = $ColorError;   Fill = $ColorErrorFill }
    'N/A'    = @{ Color = $ColorTextMuted; Fill = $ColorHeaderFill }
    'MANUAL' = @{ Color = $ColorWarning; Fill = $ColorWarningFill }
}

$ReportStyle = @"
    @page { size: Letter; margin: 9mm 8mm; }
    :root { color-scheme: light; }
    * { box-sizing: border-box; }
    body {
      font-family: Calibri, "Segoe UI", Arial, sans-serif;
      background: $ColorBg;
      color: $ColorText;
      margin: 0;
      padding: 12px 10px;
      line-height: 1.26;
    }
    .doc {
      max-width: 980px;
      margin: 0 auto;
      background: $ColorSurface;
      border: 1px solid $ColorBorder;
      padding: 16px 26px 14px;
    }
    h1 {
      font-size: 22px;
      color: $ColorPrimary;
      border-bottom: 2px solid $ColorPrimary;
      padding-bottom: 7px;
      margin: 0 0 12px;
    }
    h2 {
      font-size: 15px;
      color: $ColorPrimary;
      margin: 11px 0 4px;
      border-bottom: 1px solid $ColorBorder;
      padding-bottom: 3px;
    }
    h3 { font-size: 13px; margin: 6px 0 3px; }
    .sample-banner {
      background: $ColorWarningFill;
      border: 2px solid $ColorWarning;
      color: $ColorWarning;
      font-weight: 700;
      text-align: center;
      padding: 7px;
      margin-bottom: 12px;
      font-size: 12.5px;
      letter-spacing: 0.02em;
    }
    .digest-warning {
      background: $ColorErrorFill;
      border: 2px solid $ColorError;
      color: $ColorError;
      font-weight: 700;
      text-align: center;
      padding: 7px;
      margin-bottom: 12px;
      font-size: 12.5px;
    }
    .meta-note {
      background: $ColorSurfaceAlt;
      border-left: 4px solid $ColorPrimary;
      padding: 9px 13px;
      font-size: 11.5px;
      color: $ColorTextMuted;
      margin-bottom: 12px;
      line-height: 1.35;
    }
    .meta-note strong { color: $ColorText; }
    .digest {
      font-family: Consolas, "Courier New", monospace;
      font-size: 11.5px;
      word-break: break-all;
      background: $ColorHeaderFill;
      padding: 2px 6px;
      border-radius: 3px;
      display: inline-block;
      margin: 3px 0;
    }
    table { width: 100%; border-collapse: collapse; margin: 3px 0 9px; font-size: 11.5px; }
    th, td { text-align: left; padding: 3px 7px; border: 1px solid $ColorBorder; vertical-align: top; }
    th { background: $ColorHeaderFill; font-weight: 600; }
    .id-table th { width: 34%; white-space: nowrap; }
    .section-note { font-size: 11.5px; color: $ColorTextMuted; font-style: italic; margin: 3px 0 7px; }
    pre.cmd, pre.evd {
      background: $ColorHeaderFill;
      border: 1px solid $ColorBorder;
      padding: 4px 7px;
      white-space: pre-wrap;
      word-wrap: break-word;
      font-family: Consolas, "Courier New", monospace;
      font-size: 10.5px;
      line-height: 1.28;
      margin: 3px 0 0;
    }
    .result-badge { display: inline-block; font-weight: 700; font-size: 10.5px; padding: 1px 7px; border-radius: 3px; white-space: nowrap; }
    .item-card { border: 1px solid $ColorBorder; background: $ColorSurfaceAlt; padding: 6px 10px 7px; margin: 0 0 6px; }
    .item-card-head { display: flex; justify-content: space-between; align-items: baseline; gap: 12px; margin-bottom: 4px; flex-wrap: wrap; }
    .item-id { font-weight: 700; color: $ColorPrimary; font-size: 12.5px; white-space: nowrap; }
    .item-req { font-size: 12.5px; flex: 1; min-width: 200px; }
    .item-field { margin-top: 4px; }
    .method-value { font-size: 12px; font-weight: 600; }
    .item-field-label { font-size: 10px; text-transform: uppercase; letter-spacing: 0.04em; color: $ColorTextMuted; font-weight: 600; }
    .item-ts { font-size: 10.5px; color: $ColorTextMuted; margin-top: 3px; }
    .fill-in { color: $ColorTextFaint; font-style: italic; }
    .summary-grid { display: flex; gap: 8px; margin: 4px 0 8px; flex-wrap: wrap; }
    .summary-card { flex: 1; min-width: 110px; border: 1px solid $ColorBorder; background: $ColorSurfaceAlt; padding: 6px; text-align: center; }
    .summary-card .n { font-size: 19px; font-weight: 700; }
    .summary-card .l { font-size: 10.5px; color: $ColorTextMuted; text-transform: uppercase; letter-spacing: 0.04em; }
    footer { margin-top: 18px; font-size: 10.5px; color: $ColorTextMuted; border-top: 1px solid $ColorBorder; padding-top: 8px; font-style: italic; }
    code { font-family: Consolas, "Courier New", monospace; }
"@

$GuideStyle = @"
    @page { size: Letter; margin: 9mm 8mm; }
    :root { color-scheme: light; }
    * { box-sizing: border-box; }
    body { font-family: Calibri, "Segoe UI", Arial, sans-serif; background: $ColorBg; color: $ColorText; margin: 0; padding: 12px 10px; line-height: 1.32; }
    .doc { max-width: 980px; margin: 0 auto; background: $ColorSurface; border: 1px solid $ColorBorder; padding: 16px 26px 14px; }
    h1 { font-size: 22px; color: $ColorPrimary; border-bottom: 2px solid $ColorPrimary; padding-bottom: 7px; margin: 0 0 12px; }
    h2 { font-size: 15px; color: $ColorPrimary; margin: 14px 0 5px; border-bottom: 1px solid $ColorBorder; padding-bottom: 3px; }
    h3 { font-size: 12.5px; margin: 8px 0 3px; }
    .sample-banner { background: $ColorWarningFill; border: 2px solid $ColorWarning; color: $ColorWarning; font-weight: 700; text-align: center; padding: 7px; margin-bottom: 12px; font-size: 12.5px; letter-spacing: 0.02em; }
    .intro { font-size: 12.5px; background: $ColorSurfaceAlt; border-left: 3px solid $ColorPrimary; padding: 8px 12px; margin-bottom: 10px; }
    .intro p { margin: 4px 0; }
    .companion-note { font-size: 11.5px; color: $ColorTextMuted; font-style: italic; margin: 0 0 10px; }
    p { font-size: 12.5px; line-height: 1.4; }
    .item-card { border: 1px solid $ColorBorder; background: $ColorSurfaceAlt; padding: 8px 12px; margin-bottom: 8px; }
    .item-card-head { display: flex; align-items: baseline; gap: 8px; margin-bottom: 4px; flex-wrap: wrap; }
    .item-id { font-weight: 700; color: $ColorPrimary; font-size: 12.5px; white-space: nowrap; }
    .item-req { font-size: 12.5px; flex: 1; min-width: 200px; }
    .item-path { border-top: 1px solid $ColorBorder; margin-top: 6px; padding-top: 6px; }
    .item-path:first-of-type { border-top: 0; margin-top: 4px; padding-top: 0; }
    .item-path-head { display: flex; align-items: baseline; gap: 8px; flex-wrap: wrap; margin-bottom: 2px; }
    .item-path-label { color: $ColorText; font-size: 11.5px; font-weight: 700; }
    .path-method { border: 1px solid $ColorPrimary; color: $ColorPrimary; font-size: 9.5px; font-weight: 700; letter-spacing: 0.04em; padding: 1px 6px; }
    .path-steps { font-size: 11.5px; margin: 3px 0 0; line-height: 1.35; }
    .path-note { font-size: 11px; font-style: italic; color: $ColorTextMuted; margin: 2px 0 0; }
    pre.cmd { background: $ColorHeaderFill; border: 1px solid $ColorBorder; padding: 5px 8px; margin: 3px 0 0; font-size: 11px; overflow-wrap: anywhere; white-space: pre-wrap; font-family: Consolas, "Courier New", monospace; }
    .path-meta { font-size: 10.5px; color: $ColorTextMuted; margin-top: 3px; }
    .citation { color: $ColorPrimary; font-size: 10.5px; overflow-wrap: anywhere; }
    .path-caution { background: $ColorWarningFill; border-left: 3px solid $ColorWarning; color: $ColorWarning; font-size: 11px; margin-top: 4px; padding: 4px 7px; }
    .sources-list { font-size: 11px; margin: 5px 0 0; padding-left: 18px; }
    .sources-list li { margin-bottom: 2px; overflow-wrap: anywhere; }
    code { font-family: Consolas, "Courier New", monospace; }
    footer { margin-top: 16px; font-size: 10.5px; color: $ColorTextMuted; border-top: 1px solid $ColorBorder; padding-top: 8px; font-style: italic; }
"@

# ---------------------------------------------------------------------------
# Main report rendering
# ---------------------------------------------------------------------------
function Format-IdentificationTable {
    param($SystemIdentification)
    $rows = New-Object System.Text.StringBuilder
    foreach ($label in $SystemIdentificationFields.Keys) {
        $value = $null
        if ($SystemIdentification) {
            if ($SystemIdentification -is [System.Collections.IDictionary]) {
                if ($SystemIdentification.Contains($label)) { $value = $SystemIdentification[$label] }
            } elseif ($SystemIdentification.PSObject.Properties.Name -contains $label) {
                $value = $SystemIdentification.$label
            }
        }
        if ($null -eq $value) { $value = 'N/A -- not present in this evidence bundle' }
        [void]$rows.Append("<tr><th>$(Esc $label)</th><td>$(Esc $value)</td></tr>")
    }
    return "<table class=`"id-table`">$($rows.ToString())</table>"
}

function Format-ItemCard {
    param($Item)
    $style = if ($ResultStyle.ContainsKey($Item.result)) { $ResultStyle[$Item.result] } else { $ResultStyle['N/A'] }
    $badge = "<span class=`"result-badge`" style=`"color:$($style.Color);background:$($style.Fill);border:1px solid $($style.Color);`">$(Esc $Item.result)</span>"
    $tsHtml = if ($Item.timestamp_utc) { Esc $Item.timestamp_utc } else { '<span class="fill-in">(not applicable -- manual item)</span>' }
    return @"
<div class="item-card">
<div class="item-card-head">
<span class="item-id">$(Esc $Item.item_id)</span>
<span class="item-req">$(Esc $Item.requirement)</span>
$badge
</div>
<div class="item-field"><span class="item-field-label">Verification Method:</span> <span class="method-value">$(Esc $Item.method)</span></div>
<div class="item-field"><span class="item-field-label">Command Executed</span><pre class="cmd">$(EscPre $Item.command)</pre></div>
<div class="item-field"><span class="item-field-label">Captured Evidence</span><pre class="evd">$(EscPre $Item.evidence)</pre></div>
<div class="item-ts"><strong>Timestamp (UTC):</strong> $tsHtml</div>
</div>
"@
}

function Format-Section {
    param($Section, $ItemsByIdMap)
    $cardsSb = New-Object System.Text.StringBuilder
    foreach ($def in $Section.Items) {
        $liveItem = $ItemsByIdMap[$def.Id]
        if ($liveItem) {
            [void]$cardsSb.Append((Format-ItemCard -Item $liveItem))
        }
    }
    $note = if ($Section.Note) { "<p class=`"section-note`">$(Esc $Section.Note)</p>" } else { '' }
    return "<h2>$(Esc $Section.Title)</h2>`n$note`n$($cardsSb.ToString())"
}

function Format-Summary {
    param($Items)
    $counts = [ordered]@{ PASS = 0; FAIL = 0; 'N/A' = 0; MANUAL = 0 }
    foreach ($it in $Items) {
        if ($counts.Contains($it.result)) { $counts[$it.result]++ } else { $counts[$it.result] = 1 }
    }
    $cardsSb = New-Object System.Text.StringBuilder
    foreach ($pair in @(@('Pass','PASS'), @('Fail','FAIL'), @('N/A','N/A'), @('Manual','MANUAL'))) {
        $label = $pair[0]; $key = $pair[1]
        $style = $ResultStyle[$key]
        $n = if ($counts.Contains($key)) { $counts[$key] } else { 0 }
        [void]$cardsSb.Append("<div class=`"summary-card`"><div class=`"n`" style=`"color:$($style.Color);`">$n</div><div class=`"l`">$label</div></div>")
    }
    return "<div class=`"summary-grid`">$($cardsSb.ToString())</div>", $counts
}

function Format-Appendix {
    $a = $AdQueryAppendix
    return @"
<h2>$(Esc $a.Title)</h2>
<p style="font-size:13px;">$(Esc $a.Body)</p>
<h3>Per-environment config file</h3>
<pre class="cmd">$(EscPre $a.ConfigExample)</pre>
<h3>Fallback command (native -- RSAT ActiveDirectory module)</h3>
<pre class="cmd">$(EscPre $a.Command)</pre>
<h3>Example evidence captured</h3>
<pre class="evd">$(EscPre $a.EvidenceExample)</pre>
"@
}

function New-MainReportHtml {
    param($Meta, $Items, $Digest, $DigestMatches)

    $itemsByIdMap = @{}
    foreach ($it in $Items) { $itemsByIdMap[$it.item_id] = $it }

    $summaryHtml, $counts = Format-Summary -Items $Items
    $sectionsSb = New-Object System.Text.StringBuilder
    foreach ($section in $Sections) {
        [void]$sectionsSb.Append((Format-Section -Section $section -ItemsByIdMap $itemsByIdMap))
    }
    $total = ($counts.Values | Measure-Object -Sum).Sum

    $notesValue = if ($Meta.PSObject.Properties.Name -contains 'notes') { $Meta.notes } else { $null }
    $notesHtml = if ($notesValue) { "<strong>Notes:</strong> $(Esc $notesValue)<br>" } else { '' }

    $digestWarningHtml = ''
    if (-not $DigestMatches) {
        $digestWarningHtml = '<div class="digest-warning">WARNING: The stored SHA-256 digest in evidence.json does NOT match a fresh recomputation over its items. The evidence file may have been edited after collection. Investigate before relying on this report.</div>'
    }

    $sysIdValue = if ($Meta.PSObject.Properties.Name -contains 'system_identification') { $Meta.system_identification } else { $null }
    $identificationHtml = Format-IdentificationTable -SystemIdentification $sysIdValue

    return @"
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>$(Esc $Meta.report_title) -- $(Esc $Meta.report_id)</title>
<style>$ReportStyle</style>
</head>
<body>
<div class="doc">

$digestWarningHtml
<h1>$(Esc $Meta.report_title)</h1>

<div class="meta-note">
<strong>Report ID:</strong> $(Esc $Meta.report_id)<br>
<strong>Generated:</strong> $(Esc $Meta.generated_at_utc)<br>
<strong>Generating tool:</strong> $(Esc $Meta.tool_name) ($(Esc $Meta.tool_version))<br>
<strong>Examiner:</strong> $(Esc $Meta.examiner)<br>
<strong>Hostname:</strong> $(Esc $Meta.hostname)<br>
<strong>Evidence bundle:</strong> <code>evidence.json</code> ($total items)<br>
<strong>Evidence SHA-256 digest:</strong><br><span class="digest">$(Esc $Digest)</span><br>
$notesHtml
<em>An auditor can independently re-hash the accompanying evidence.json (SHA-256, canonical/sorted-key JSON)
and confirm it matches this digest -- any post-generation edit to the raw evidence changes the hash.</em>
</div>

<h2>System Identification</h2>
$identificationHtml

<h2>Summary</h2>
$summaryHtml

$($sectionsSb.ToString())

$(Format-Appendix)

<footer>
Sources referenced by the verification methods above cite the authoritative documentation already collected in
<code>reference/external-sources/</code> for this repo, including Microsoft Learn PowerShell module references,
NIST SP 800-88, and the Sysinternals Suite docs. This report's rendering pipeline itself follows this repo's own
established report-generation convention (<code>execution-plan/tools/generate_variance.py</code>).
</footer>

</div>
</body>
</html>
"@
}

# ---------------------------------------------------------------------------
# BIOS reference guide rendering
# ---------------------------------------------------------------------------
function Split-CommandNote {
    param([string]$CommandOrSteps)
    if ($CommandOrSteps -match "`n") {
        $parts = $CommandOrSteps -split "`n", 2
        return @($parts[0].Trim(), $parts[1].Trim())
    }
    return @($CommandOrSteps.Trim(), $null)
}

function Get-HashValue {
    # Safe optional-key lookup for hashtables under Set-StrictMode -Version Latest,
    # where dot-notation access to a missing hashtable key throws instead of
    # returning $null (unlike bracket-notation access, which is always safe).
    param($Table, [string]$Key)
    if ($Table -is [System.Collections.IDictionary] -and $Table.Contains($Key)) {
        return $Table[$Key]
    }
    return $null
}

function Format-PathBlock {
    param($Path)
    $cautionValue = Get-HashValue -Table $Path -Key 'Caution'
    $caution = if ($cautionValue) { "<div class=`"path-caution`"><strong>Caution:</strong> $(Esc $cautionValue)</div>" } else { '' }
    if ($Path.Method -eq 'AUTOMATED') {
        $cmd, $note = Split-CommandNote -CommandOrSteps $Path.CommandOrSteps
        $bodyHtml = "<pre class=`"cmd`">$(EscPre $cmd)</pre>"
        if ($note) { $bodyHtml += "<div class=`"path-note`">$(Esc $note)</div>" }
    } else {
        $bodyHtml = "<p class=`"path-steps`">$(Esc $Path.CommandOrSteps)</p>"
    }
    return @"
<div class="item-path">
<div class="item-path-head">
<span class="item-path-label">$(Esc $Path.Label)</span>
<span class="path-method">$(Esc $Path.Method)</span>
</div>
$bodyHtml
<div class="path-meta">$(Esc $Path.Evidence) &middot; <a class="citation" href="$(Esc $Path.SourceCitation)">$(Esc $Path.SourceCitation)</a></div>
$caution
</div>
"@
}

function Format-BiosItemCard {
    param($Entry)
    return @"
<div class="item-card">
<div class="item-card-head">
<span class="item-id">$(Esc $Entry.Id)</span>
<span class="item-req">$(Esc $Entry.Req)</span>
</div>
$(Format-PathBlock -Path $Entry.Automated)
$(Format-PathBlock -Path $Entry.Manual)
</div>
"@
}

function Get-BiosSources {
    param($ReferenceList)
    $sources = New-Object System.Collections.Generic.List[string]
    foreach ($entry in $ReferenceList) {
        foreach ($path in @($entry.Automated, $entry.Manual)) {
            if ($path.SourceCitation -and -not $sources.Contains($path.SourceCitation)) {
                [void]$sources.Add($path.SourceCitation)
            }
        }
    }
    return $sources
}

function Format-BiosSources {
    param($ReferenceList)
    $sources = Get-BiosSources -ReferenceList $ReferenceList
    $entriesSb = New-Object System.Text.StringBuilder
    foreach ($url in $sources) {
        [void]$entriesSb.Append("<li><a class=`"citation`" href=`"$(Esc $url)`">$(Esc $url)</a></li>")
    }
    return "<h2>Sources</h2>`n<ul class=`"sources-list`">$($entriesSb.ToString())</ul>"
}

function New-BiosGuideHtml {
    param([string]$Vendor, [string]$Title, $ReferenceList, [string]$BackgroundHtml)

    $cardsSb = New-Object System.Text.StringBuilder
    foreach ($entry in $ReferenceList) {
        [void]$cardsSb.Append((Format-BiosItemCard -Entry $entry))
    }
    $article = if ($Vendor -eq 'HP') { 'an' } else { 'a' }

    return @"
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>$(Esc $Title)</title>
<style>$GuideStyle</style>
</head>
<body>
<div class="doc">
<div class="sample-banner">$(Esc $Vendor.ToUpper()) BIOS REFERENCE GUIDE -- CITED VENDOR RESEARCH, VERIFY AGAINST THE CURRENT VENDOR DOCUMENTATION BEFORE USE.</div>
<h1>$(Esc $Title)</h1>
<p class="companion-note">Companion reference to the Initial System Validation Report. The main report records only
the automated command executed against the audited system for BIOS Controls items 1.A&ndash;1.E; this guide holds the
full $(Esc $Vendor) instructional detail -- automated command variants, the physical-console fallback for air-gapped or
no-tooling systems, discovery caveats, and citations -- for whichever items apply to $article $(Esc $Vendor) asset.</p>
<div class="intro">
$BackgroundHtml
</div>
<h2>BIOS Controls 1.A&ndash;1.E -- $(Esc $Vendor) Path</h2>
$($cardsSb.ToString())
$(Format-BiosSources -ReferenceList $ReferenceList)
<footer>
This guide cites only $(Esc $Vendor)'s own product documentation, official knowledge-base articles, or the
Microsoft-hosted PowerShell Gallery listing of the vendor's own module, plus clearly labeled community sources used
only as corroborating color. See the Sources list above for every URL referenced.
</footer>
</div>
</body>
</html>
"@
}

# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------
if (-not (Test-Path $EvidencePath)) {
    throw "Evidence file not found: $EvidencePath. Run Invoke-ISVCollection.ps1 first (or with -SampleMode) to generate it."
}
if (-not (Test-Path $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir -Force | Out-Null
}

Write-Host "Loading evidence bundle: $EvidencePath" -ForegroundColor Cyan
$bundle = Get-Content -Path $EvidencePath -Raw | ConvertFrom-Json

$items = @($bundle.items)
$storedDigest = $bundle.sha256_digest

$canonicalJson    = ConvertTo-CanonicalJson -InputObject $items
$recomputedDigest = Get-Sha256Hex -Text $canonicalJson
$digestMatches    = ($recomputedDigest -eq $storedDigest)

if ($digestMatches) {
    Write-Host "Digest verification: OK ($recomputedDigest)" -ForegroundColor Green
} else {
    Write-Warning "Digest verification FAILED. Stored: $storedDigest / Recomputed: $recomputedDigest"
}

$reportHtml = New-MainReportHtml -Meta $bundle.meta -Items $items -Digest $storedDigest -DigestMatches $digestMatches
$reportPath = Join-Path $OutputDir 'Initial-System-Validation-Report-SAMPLE.html'
Set-Content -Path $reportPath -Value $reportHtml -Encoding UTF8
Write-Host "Wrote $reportPath" -ForegroundColor Green

$dellHtml = New-BiosGuideHtml -Vendor 'Dell' -Title 'Dell BIOS Reference Guide' -ReferenceList $BiosDellReference -BackgroundHtml $BiosDellBackground
$dellPath = Join-Path $OutputDir 'Dell-BIOS-Reference-Guide.html'
Set-Content -Path $dellPath -Value $dellHtml -Encoding UTF8
Write-Host "Wrote $dellPath" -ForegroundColor Green

$hpHtml = New-BiosGuideHtml -Vendor 'HP' -Title 'HP BIOS Reference Guide' -ReferenceList $BiosHpReference -BackgroundHtml $BiosHpBackground
$hpPath = Join-Path $OutputDir 'HP-BIOS-Reference-Guide.html'
Set-Content -Path $hpPath -Value $hpHtml -Encoding UTF8
Write-Host "Wrote $hpPath" -ForegroundColor Green
