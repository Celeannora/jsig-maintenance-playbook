# Initial System Validation (ISV) Report Tooling

This is the **audit script** for generating the Initial System Validation Report: a barebones,
PowerShell-first, evidence-cited HTML audit report for a single Windows 11 endpoint, built to be
usable in air-gapped environments (native Windows tools / Sysinternals only, no third-party
scanner dependency). The toolchain is **pure PowerShell** — a real collector that executes checks
on a live system, and a renderer that turns the resulting evidence into HTML. Nothing here shells
out to Python.

Everything currently checked in is generated in `-SampleMode`, so every captured-evidence value
reads `SAMPLE placeholder -- run without -SampleMode on the target Windows system to collect live
evidence.` The tooling has not been pointed at a real endpoint; running it live is a deliberate,
separate, human-approved step (see "Design constraints" below).

## What's here

| File | Purpose |
|---|---|
| `IsvDefinitions.ps1` | Shared data source of truth, dot-sourced by both scripts below — report title/tool metadata, the 15-field System Identification block, 9 sections / 41 checklist items (`Id`, `Req`, `Method`, `Command`, optional `Evaluate` scriptblock), the Active Directory group-resolution appendix content, and the Dell/HP BIOS reference tables (`$BiosDellReference` / `$BiosHpReference`, plus their background/context HTML). Edit this file to change what the report asks for or says. |
| `Invoke-ISVCollection.ps1` | **The collector (and, by default, report trigger).** Detects the local physical drive inventory, executes each of the 41 checklist items' PowerShell command against the local system, captures the real output as evidence, applies each item's `Evaluate` logic (or defaults to `MANUAL` when a check requires human judgment), and writes a canonical, SHA-256-digested `evidence-<hostname>.json` (or `evidence-SAMPLE.json`) — which records whether the run was `-SampleMode` or a real collection (`meta.is_sample_mode`) so the renderer can name the output file correctly. Never throws on a failed check — a failing command is caught and recorded as `N/A` with a descriptive `Automated check unavailable -- <reason>` message as evidence, so one broken/unsupported check can't crash the run and the console output stays legible. Only *after* drive detection and all 41 automated checks finish does it prompt for the 6 site-specific identification fields (Inspector, Area/Location, Program, Asset Tag, SCAP Score, Examiner Initials) plus **one DCN prompt per detected physical drive** (DCN is a site-assigned control number tracked per drive, not a single system-wide field, and each captured value is echoed back to the console immediately for confirmation) — whenever a field isn't supplied as a parameter. No switches are required for a normal run. **All output (the evidence bundle and, once rendered, the HTML report) is written into a per-host subfolder** named after the machine's hostname (or `SAMPLE` for a `-SampleMode` run) — e.g. `.\WIN-PROD-0451\evidence-WIN-PROD-0451.json` — created automatically if it doesn't exist, so output from multiple hosts never collides in one shared folder. Pass an explicit `-OutputPath` to bypass this and write exactly where told instead. Once evidence is written, it automatically invokes `New-ISVReport.ps1` in the same run to produce the host-specific HTML report in that same folder, unless `-SkipReport` is passed. Supports `-SampleMode` (no live checks, two canned placeholder drives, placeholder evidence only, no prompts) for demonstration/dry-run use. |
| `New-ISVReport.ps1` | **The main report renderer.** Loads an evidence bundle, recomputes the SHA-256 digest over its items and compares it to the stored value (tamper detection — mismatches surface as a loud warning in both the console and the rendered report), then writes the audit report as HTML. **The output filename is derived from the evidence itself**, not hardcoded: a real/live bundle is named `Initial-System-Validation-Report-<hostname>.html`; a `-SampleMode` bundle keeps `Initial-System-Validation-Report-SAMPLE.html`. The evidence bundle's own filename is likewise shown in the report header exactly as passed via `-EvidencePath`, never a hardcoded literal. **The output folder defaults to wherever `-EvidencePath` lives** (so re-rendering `.\WIN-PROD-0451\evidence-WIN-PROD-0451.json` standalone writes the report back into `.\WIN-PROD-0451\` alongside it) — pass `-OutputDir` to override. Pass `-ReportFileName` to override the filename with an explicit name. Every checklist item also renders an **Examiner Initials** field, pre-filled from the single launch-time prompt when supplied (blank for wet signature otherwise), so a human reviewer can sign off on that specific line item after reviewing the captured evidence — each field remains individually editable regardless of the pre-fill. |
| `New-BiosReferenceGuides.ps1` | **Standalone BIOS guide renderer**, independent of any host's evidence. Writes the two vendor reference guides below from the static content in `IsvDefinitions.ps1`, flat into this folder (not into a per-host subfolder — the guides are generic vendor documentation, not tied to any specific audited host). Not part of the collector's auto-chain — run it manually once, or whenever the BIOS reference content in `IsvDefinitions.ps1` changes. |
| `SAMPLE/Initial-System-Validation-Report-SAMPLE.html` | Generated deliverable — the main audit report, checked in under the `SAMPLE/` folder produced by a `-SampleMode` run. A live run against a real host produces `<hostname>/Initial-System-Validation-Report-<hostname>.html` instead. Every item shows the command executed, captured evidence, result, timestamp, and a blank Examiner Initials field. |
| `Dell-BIOS-Reference-Guide.html` / `HP-BIOS-Reference-Guide.html` | Generated deliverables (via `New-BiosReferenceGuides.ps1`, not the collector) — companion vendor guides holding the automated command variant, physical-console manual fallback, discovery caveats, and citations for BIOS Controls items 1.A-1.E, split by vendor. Generic vendor documentation, not tied to any specific audited host — written flat into this folder, never into a per-host subfolder. |
| `SAMPLE/evidence-SAMPLE.json` | Generated deliverable — the raw evidence export (meta + items + SHA-256 digest) an auditor can independently re-hash to confirm against the digest printed in the report header. Checked in under `SAMPLE/`, matching where a real `-SampleMode` run would write it. |
| `ad-group-map.example.json` | Starter template for the per-environment Active Directory group-name-resolution config file referenced from Appendix A of the report (Section 5, Accounts). Illustrative only — not read automatically by either script; copy and edit it for your domain. |
| `research_dell_bios.md` / `research_hp_bios.md` | Cited vendor research backing the two BIOS reference guides (DCPP / HP CMSL install paths, BIOS UI generation differences, confidence-level notes on unconfirmed setting paths). |
| `CHANGELOG-round2.md` / `ROUND2-SPEC.md` | Working notes from the report-simplification pass (10-page target, barebones/PowerShell-first pivot, 3-report split). Predate the Python-to-PowerShell rewrite; kept for history. |

## Running the collector

**On the target Windows 11 endpoint**, from an elevated PowerShell prompt (needed for some of the
read-only checks — e.g. `Get-LocalGroupMember` on built-in groups):

```powershell
cd execution-plan\initial-system-validation
.\Invoke-ISVCollection.ps1
```

**That's the whole thing — one command produces the finished HTML report.** The run happens in this
order:

1. **Hardware/drive detection** — queries `Win32_DiskDrive` to enumerate every physical drive
   (index, make, model, capacity, serial number) before anything else runs.
2. **All 41 checklist items** — fully automated, zero prompts.
3. **Site-specific identification prompts** — 6 fields that can't be read from the OS (Inspector,
   Area/Location, Program, Asset Tag, SCAP score, Examiner Initials -- the last one is optional and,
   if supplied, pre-fills every item's per-line Examiner Initials field in the rendered report while
   leaving each one individually editable; leave it blank to leave every field blank for a wet
   signature instead).
4. **Per-drive DCN prompts** — one prompt *per detected physical drive*, run last, because the drive
   count has to be known before the script can know how many DCNs to ask for. DCN (Drive Control
   Number) is a site-assigned control number tracked per physical drive, not a single system-wide
   field — a system with 3 drives gets 3 separate DCN prompts, each labeled with that drive's
   detected model/serial number so it's unambiguous which DCN belongs to which disk. If drive
   auto-detection fails or finds nothing (e.g. non-Windows host, CIM unavailable), the script falls
   back to a single generic "DCN (drive auto-detection unavailable on this host)" prompt.
5. **The evidence bundle is written into a per-host output folder**, named `evidence-<hostname>.json`
   (or `evidence-SAMPLE.json`), then `New-ISVReport.ps1` is automatically invoked against it in the
   same run — no second command needed. The folder is named after the machine's hostname (e.g.
   `.\WIN11-DESKTOP-04\`) for a live run, or `.\SAMPLE\` for a `-SampleMode` run, created
   automatically if it doesn't already exist — this keeps output from multiple hosts from overwriting
   each other when this tool is run against many machines in turn. The main report's filename is
   generated from that same evidence: a live run names it after the machine's hostname
   (`Initial-System-Validation-Report-<hostname>.html`); only a `-SampleMode` run keeps the
   `-SAMPLE.html` name. It's written into that same per-host folder, alongside the evidence bundle.
   (The Dell/HP BIOS reference guides are a separate, standalone deliverable — see
   "Generating the BIOS reference guides" below — and are not written by this step, and are never
   placed in a per-host folder.)

```
Initial System Validation collection starting (...)...
Detecting hardware inventory (including all physical drives)...
Detected 3 physical drive(s).
Running all 41 checklist items...
Automated collection complete.

System Identification -- enter the following site-specific details.
(Press Enter to leave a field as "N/A -- not provided by operator".)
CSU Inspector name: J. Smith
Area / Location: Building 4, Room 210
Program name: JSIG Maintenance Playbook
Asset Tag Number (TAG#): TAG-0001
SCAP score (from separate SCAP scan tool, or N/A): 98.2
Examiner Initials (optional -- pre-fills every item's initials field, still individually editable; press Enter to leave all blank for wet signature): JS
DCN for Hard Drive #0 (Samsung SSD 980 PRO, SN S1): DCN-0001
  -> Recorded DCN for drive 0: DCN-0001
DCN for Hard Drive #1 (WD Blue HDD, SN S2): DCN-0002
  -> Recorded DCN for drive 1: DCN-0002
DCN for Hard Drive #2 (Crucial MX500, SN S3): DCN-0003
  -> Recorded DCN for drive 2: DCN-0003

Collection complete. 41 items recorded across 3 drive(s).
Evidence bundle written to: .\WIN11-DESKTOP-04\evidence-WIN11-DESKTOP-04.json
SHA-256 digest: <hex>

Rendering HTML report via .\New-ISVReport.ps1 ...
Wrote .\WIN11-DESKTOP-04\Initial-System-Validation-Report-WIN11-DESKTOP-04.html
```

(A `-SampleMode` run instead writes into `.\SAMPLE\`, producing
`SAMPLE\Initial-System-Validation-Report-SAMPLE.html`, matching the files checked into this repo.)

For unattended/scripted runs, any field can still be supplied as a parameter, which skips the
prompt for that field only (mix and match freely — e.g. pre-fill `-Inspector` and get prompted for
the rest). `-Dcn` takes an **array**, mapped positionally to drives in detected index order — supply
fewer values than there are drives and only the remaining drives prompt:

```powershell
./Invoke-ISVCollection.ps1 `
  -Inspector "J. Smith" -AreaLocation "Building 4, Room 210" `
  -Program "JSIG Maintenance Playbook" -AssetTag "TAG-0001" `
  -ScapScore "98.2" -ExaminerInitials "JS" `
  -Dcn "DCN-0001","DCN-0002","DCN-0003"
# -> writes to .\WIN11-DESKTOP-04\evidence-WIN11-DESKTOP-04.json (folder auto-named/created from hostname)
```

```powershell
# Sample/demo mode -- no prompts, no live checks executed; two canned sample
# drives populate the Hard Drives table so the report's shape and formatting
# can be reviewed offline. Writes to .\SAMPLE\evidence-SAMPLE.json.
./Invoke-ISVCollection.ps1 -SampleMode
```

```powershell
# Write the evidence bundle only, skip the auto-chained report render (e.g.
# if you want to inspect/edit the evidence before rendering, or render
# elsewhere). Still lands in the per-host/SAMPLE folder unless -OutputPath is given.
./Invoke-ISVCollection.ps1 -SkipReport
```

```powershell
# An explicit -OutputPath always overrides the per-host folder and is used
# exactly as given, with no folder auto-nesting applied:
./Invoke-ISVCollection.ps1 -SampleMode -OutputPath ./evidence-SAMPLE.json
```

Live mode executes each item's real command (`Get-CimInstance`, `icacls`, `reg query`, `auditpol`,
`secedit`, etc.) and records the actual output as evidence with a live `PASS`/`FAIL`/`N/A`/`MANUAL`
result and timestamp. Every check is wrapped in its own try/catch, so a single unsupported or
access-denied command degrades to `N/A` with the error captured as evidence rather than halting the
run. Native command output (e.g. `reg query` or `icacls` against a key/path that doesn't exist on
this particular host) is redirected into the captured evidence rather than printed to the console —
an earlier version of this script let lines like `ERROR: The system was unable to find the
specified registry key or value.` print directly to the console while collection was still running,
which looked alarming but was harmless (the item was already correctly recorded as `N/A`/`FAIL`
with no evidence captured). That text now lands cleanly in the item's evidence field instead, and
the console stays quiet. A summary line (`Collection complete. N items recorded across N drive(s).`)
always confirms whether the run finished.

## Regenerating the report

The collector auto-chains into the renderer by default, so this step is normally not needed. It's
still available for re-rendering an existing evidence bundle on its own (e.g. after using
`-SkipReport`, or to re-render on a different machine than the one that collected the evidence):

```powershell
cd execution-plan/initial-system-validation
./New-ISVReport.ps1 -EvidencePath ./WIN11-DESKTOP-04/evidence-WIN11-DESKTOP-04.json
# -> writes into .\WIN11-DESKTOP-04\Initial-System-Validation-Report-<hostname>.html
#    (or ...-SAMPLE.html for a -SampleMode bundle) -- same folder the evidence came from
```

The output filename is read from the evidence bundle itself (`meta.hostname` / `meta.is_sample_mode`),
so it doesn't need to be told which machine the evidence came from. **The output folder defaults to
wherever `-EvidencePath` lives** — pass `-OutputDir` to write somewhere else instead:

```powershell
./New-ISVReport.ps1 -EvidencePath ./WIN11-DESKTOP-04/evidence-WIN11-DESKTOP-04.json -OutputDir ./some-other-folder
```

To force a specific filename regardless of what the evidence says, pass `-ReportFileName`:

```powershell
./New-ISVReport.ps1 -EvidencePath ./WIN11-DESKTOP-04/evidence-WIN11-DESKTOP-04.json -ReportFileName Custom-Report-Name.html
```

## Generating the BIOS reference guides

The Dell and HP BIOS reference guides are generic vendor documentation — they don't depend on any
host's evidence and don't change between collection runs — so they're a standalone script, not part
of the collector's auto-chain:

```powershell
cd execution-plan/initial-system-validation
./New-BiosReferenceGuides.ps1
# -> Dell-BIOS-Reference-Guide.html
# -> HP-BIOS-Reference-Guide.html
```

Run this once after cloning the repo, or again any time the BIOS reference content in
`IsvDefinitions.ps1` is edited.

All three scripts are self-contained PowerShell (no external modules beyond what's built into
Windows PowerShell / PowerShell 7) and write their output alongside themselves in this folder.
`pwsh -File` on PowerShell 7+ or `powershell.exe -File` on Windows PowerShell 5.1 both work.

## Tamper-evidence digest

The evidence bundle stores a SHA-256 digest computed over the **items array only** (never the `meta`
block), serialized as canonical JSON: keys sorted ordinally, no extraneous whitespace, non-ASCII
escaped. `Invoke-ISVCollection.ps1` computes this digest when writing the file; `New-ISVReport.ps1`
independently recomputes it when loading the file and compares. Any edit to the evidence after
collection — even a single character — changes the digest and triggers a visible warning banner in
the rendered report (and a console warning) so a reviewer knows to investigate before trusting the
report. An auditor can independently re-hash the accompanying evidence file (SHA-256, canonical/
sorted-key JSON) and confirm it matches the digest printed in the report header.

## Design constraints (carried over from the source conversation)

- **Barebones / PowerShell-first.** Native Windows tools and Sysinternals are preferred over any
  third-party tool everywhere a check can be accomplished that way. The audit script itself is
  PowerShell, not Python.
- **Air-gapped dual-path.** Where a check has both a connected/automated method and a
  standalone/manual method, both must be documented — the automated command actually run stays in
  the main report; the manual fallback and citations live in the vendor BIOS reference guides.
- **Unclassified only.** No IP addresses, MAC addresses, hostnames, or other program-identifying
  data — the report captures configuration/compliance state only.
- **No plaintext secrets.** Any BIOS/account item involving a password records only the
  password-set state or an access-test attestation, never the password itself.
- **Planning-only until human approval.** The checked-in `SAMPLE/evidence-SAMPLE.json` and
  `SAMPLE/Initial-System-Validation-Report-SAMPLE.html` are `-SampleMode` output, sitting exactly
  where a real `-SampleMode` run would write them. Running `Invoke-ISVCollection.ps1` against a live
  system is a separate, deliberate action outside this repo's automation.
- Follows the same Nexus design-system styling as the rest of this repo's generated documents
  (see `execution-plan/tools/generate_variance.py` for the sibling implementation).

See `manifest.txt` at the repo root for this folder's file inventory.
