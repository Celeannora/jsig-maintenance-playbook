#Requires -Version 5.1
<#
.SYNOPSIS
    Renders the Dell and HP BIOS Reference Guide companion documents.

.DESCRIPTION
    Standalone renderer. These two guides are generic, vendor-level reference
    material (automated command variants, physical-console manual fallback,
    discovery caveats, and citations for BIOS Controls items 1.A-1.E) sourced
    entirely from the static $BiosDellReference / $BiosHpReference definitions
    in IsvDefinitions.ps1. Their content does NOT depend on any host's
    evidence.json and does not change from one collection run to the next --
    so they are deliberately NOT regenerated as part of every
    Invoke-ISVCollection.ps1 run. Run this script on its own, once, or
    whenever IsvDefinitions.ps1's BIOS reference content is edited.

    (Earlier versions of this toolchain had New-ISVReport.ps1 silently
    re-write both of these files into the evidence output folder on every
    single collection run, alongside the actual host-specific report. That
    made an audit output folder for one specific host contain two unrelated,
    unchanging vendor documents that had nothing to do with that host, and
    served no purpose being regenerated repeatedly. They are now standalone,
    generated only by this script.)

.PARAMETER OutputDir
    Directory to write the two HTML files to. Defaults to this script's
    folder.

.EXAMPLE
    .\New-BiosReferenceGuides.ps1
    # -> Dell-BIOS-Reference-Guide.html
    # -> HP-BIOS-Reference-Guide.html

.EXAMPLE
    .\New-BiosReferenceGuides.ps1 -OutputDir C:\Reference\BIOS
#>

[CmdletBinding()]
param(
    [string]$OutputDir = $PSScriptRoot
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

. (Join-Path $PSScriptRoot 'IsvDefinitions.ps1')

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
# Shared Nexus design-system CSS (matches New-ISVReport.ps1's palette exactly
# -- duplicated here, not dot-sourced, so this script has zero dependency on
# New-ISVReport.ps1 and can genuinely run standalone).
# ---------------------------------------------------------------------------
$ColorBg = '#F7F6F2'; $ColorSurface = '#FFFFFF'; $ColorSurfaceAlt = '#F9F8F5'
$ColorBorder = '#D4D1CA'; $ColorText = '#28251D'; $ColorTextMuted = '#7A7974'
$ColorTextFaint = '#BAB9B4'; $ColorPrimary = '#01696F'
$ColorWarning = '#964219'; $ColorWarningFill = '#FBF1EA'
$ColorHeaderFill = '#F2F1EC'

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
if (-not (Test-Path $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir -Force | Out-Null
}

$dellHtml = New-BiosGuideHtml -Vendor 'Dell' -Title 'Dell BIOS Reference Guide' -ReferenceList $BiosDellReference -BackgroundHtml $BiosDellBackground
$dellPath = Join-Path $OutputDir 'Dell-BIOS-Reference-Guide.html'
Set-Content -Path $dellPath -Value $dellHtml -Encoding UTF8
Write-Host "Wrote $dellPath" -ForegroundColor Green

$hpHtml = New-BiosGuideHtml -Vendor 'HP' -Title 'HP BIOS Reference Guide' -ReferenceList $BiosHpReference -BackgroundHtml $BiosHpBackground
$hpPath = Join-Path $OutputDir 'HP-BIOS-Reference-Guide.html'
Set-Content -Path $hpPath -Value $hpHtml -Encoding UTF8
Write-Host "Wrote $hpPath" -ForegroundColor Green
