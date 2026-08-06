#Requires -Version 5.1
<#
.SYNOPSIS
    Renders the Initial System Validation (ISV) HTML report from an
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
         mockup renderer (render_report.py), reading section content from
         IsvDefinitions.ps1 so the two scripts never drift.
      4. Names the output file based on the evidence itself: a real/live
         bundle (`meta.is_sample_mode -eq $false`, or the field absent from
         an older evidence.json) gets `Initial-System-Validation-Report-
         <hostname>.html`; a `-SampleMode` bundle keeps the historical
         `Initial-System-Validation-Report-SAMPLE.html` name. A live report
         is NEVER named "...-SAMPLE.html" -- an earlier version of this
         script hardcoded that filename unconditionally regardless of
         whether the evidence was real or placeholder data, which made a
         genuine live-host report look like unrendered demo output.

    The Dell/HP BIOS reference guides are NOT produced by this script --
    see New-BiosReferenceGuides.ps1. Those two documents are generic vendor
    reference material that doesn't depend on any host's evidence and
    doesn't change between collection runs, so they are a separate,
    standalone deliverable rather than something rewritten into every
    per-host output folder on every run.

    Output (default -OutputDir is this script's folder):
      - Initial-System-Validation-Report-<hostname-or-SAMPLE>.html

.PARAMETER EvidencePath
    Path to the evidence.json bundle to render. Defaults to evidence.json
    alongside this script.

.PARAMETER OutputDir
    Directory to write the HTML report to. Defaults to this script's folder.

.PARAMETER ReportFileName
    Optional explicit output filename, overriding the automatic
    hostname/-SampleMode-based naming described above.

.EXAMPLE
    .\New-ISVReport.ps1 -EvidencePath .\evidence.json -OutputDir .

.EXAMPLE
    .\New-ISVReport.ps1 -EvidencePath .\evidence.json -ReportFileName Custom-Name.html
#>

[CmdletBinding()]
param(
    [string]$EvidencePath   = (Join-Path $PSScriptRoot 'evidence.json'),
    [string]$OutputDir      = $PSScriptRoot,
    [string]$ReportFileName = $null
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
    .drives-table th { width: auto; white-space: normal; }
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
    .item-initials { display: flex; align-items: center; gap: 6px; margin-top: 4px; padding-top: 4px; border-top: 1px dashed $ColorBorder; }
    .item-initials .item-field-label { white-space: nowrap; }
    .initials-input { width: 76px; border: none; border-bottom: 1px solid $ColorTextMuted; background: transparent; font-size: 12px; font-family: inherit; color: $ColorText; padding: 1px 2px; text-transform: uppercase; }
    .initials-input:focus { outline: none; border-bottom: 1px solid $ColorPrimary; }
    .initials-input::placeholder { color: $ColorTextFaint; text-transform: none; font-style: italic; }
    @media print { .initials-input { border-bottom: 1px solid $ColorText; } }
    .fill-in { color: $ColorTextFaint; font-style: italic; }
    .summary-grid { display: flex; gap: 8px; margin: 4px 0 8px; flex-wrap: wrap; }
    .summary-card { flex: 1; min-width: 110px; border: 1px solid $ColorBorder; background: $ColorSurfaceAlt; padding: 6px; text-align: center; }
    .summary-card .n { font-size: 19px; font-weight: 700; }
    .summary-card .l { font-size: 10.5px; color: $ColorTextMuted; text-transform: uppercase; letter-spacing: 0.04em; }
    footer { margin-top: 18px; font-size: 10.5px; color: $ColorTextMuted; border-top: 1px solid $ColorBorder; padding-top: 8px; font-style: italic; }
    code { font-family: Consolas, "Courier New", monospace; }
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

function Format-DrivesTable {
    param($Drives)
    # `Drives` is an array of per-physical-drive records (see IsvDefinitions.ps1
    # $DriveFields and Invoke-ISVCollection.ps1's Get-DiskInventory): a system
    # with more than one drive gets more than one row here, each with its own
    # DCN, instead of a single system-wide DCN field.
    $driveList = @()
    if ($Drives) { $driveList = @($Drives) }
    if ($driveList.Count -eq 0) {
        return '<p class="section-note">No drive inventory present in this evidence bundle.</p>'
    }
    $headerCells = ($DriveFields.Keys | ForEach-Object { "<th>$(Esc $_)</th>" }) -join ''
    $bodySb = New-Object System.Text.StringBuilder
    foreach ($drive in $driveList) {
        $cellsSb = New-Object System.Text.StringBuilder
        foreach ($label in $DriveFields.Keys) {
            $key = $DriveFields[$label]
            $value = $null
            if ($drive -is [System.Collections.IDictionary]) {
                if ($drive.Contains($key)) { $value = $drive[$key] }
            } elseif ($drive.PSObject.Properties.Name -contains $key) {
                $value = $drive.$key
            }
            # NOTE: deliberately do NOT write `$value -eq ''` here -- PowerShell
            # coerces the empty-string operand to the left operand's type for
            # `-eq`, so an integer 0 (a perfectly valid Index or CapacityGb)
            # would compare equal to '' and get wrongly replaced below.
            if ($null -eq $value -or ($value -is [string] -and $value -eq '')) { $value = 'N/A -- not present in this evidence bundle' }
            [void]$cellsSb.Append("<td>$(Esc $value)</td>")
        }
        [void]$bodySb.Append("<tr>$($cellsSb.ToString())</tr>")
    }
    return "<table class=`"drives-table`"><tr>$headerCells</tr>$($bodySb.ToString())</table>"
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
<div class="item-initials"><span class="item-field-label">Examiner Initials</span><input type="text" class="initials-input" maxlength="6" placeholder="---" aria-label="Examiner initials for $(Esc $Item.item_id)"></div>
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

    $drivesValue = if ($Meta.PSObject.Properties.Name -contains 'drives') { $Meta.drives } else { $null }
    $drivesHtml = Format-DrivesTable -Drives $drivesValue

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

<h2>Hard Drives (Drive Control Numbers -- DCN)</h2>
<p class="section-note">DCN is a site-assigned control number tracked per physical hard drive. Systems with more than one drive have more than one DCN, one per row below.</p>
$drivesHtml

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

if ($ReportFileName) {
    # Explicit override always wins.
    $resolvedFileName = $ReportFileName
} else {
    # `meta.is_sample_mode` is read defensively (PSCustomObject property
    # access throws under Set-StrictMode if the key is absent) so that an
    # evidence.json written by an OLDER version of Invoke-ISVCollection.ps1
    # -- from before this field existed -- still renders instead of crashing.
    # Absent the field, we fall back to treating the bundle as real/live data,
    # since that's the far more common and higher-stakes case to get right:
    # a real audit report must never accidentally be named "...-SAMPLE.html".
    $metaProps = $bundle.meta.PSObject.Properties.Name
    $isSample  = ($metaProps -contains 'is_sample_mode') -and [bool]$bundle.meta.is_sample_mode
    if ($isSample) {
        $resolvedFileName = 'Initial-System-Validation-Report-SAMPLE.html'
    } else {
        $hostForName = if ($metaProps -contains 'hostname' -and $bundle.meta.hostname) { [string]$bundle.meta.hostname } else { 'UNKNOWN-HOST' }
        # Defensive filename sanitization: strip characters that are invalid
        # in Windows/NTFS filenames. Real COMPUTERNAME values are already
        # restricted to a safe character set, but this guarantees the
        # renderer never throws or silently mangles the path on an edge case.
        $safeHost = ($hostForName -replace '[<>:"/\\|?*]', '_')
        $resolvedFileName = "Initial-System-Validation-Report-$safeHost.html"
    }
}
$reportPath = Join-Path $OutputDir $resolvedFileName
Set-Content -Path $reportPath -Value $reportHtml -Encoding UTF8
Write-Host "Wrote $reportPath" -ForegroundColor Green
Write-Host ''
Write-Host 'Note: the Dell/HP BIOS reference guides are generic, host-independent' -ForegroundColor DarkGray
Write-Host 'documents and are no longer regenerated here on every run. Generate/refresh' -ForegroundColor DarkGray
Write-Host 'them standalone with: .\New-BiosReferenceGuides.ps1' -ForegroundColor DarkGray
