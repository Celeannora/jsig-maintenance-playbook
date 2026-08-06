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
| `Invoke-ISVCollection.ps1` | **The collector.** Executes each of the 41 checklist items' PowerShell command against the local system, captures the real output as evidence, applies each item's `Evaluate` logic (or defaults to `MANUAL` when a check requires human judgment), and writes a canonical, SHA-256-digested `evidence.json`. Never throws on a failed check — a failing command is caught and recorded as `N/A` with the error text as evidence, so one broken check can't crash the run. The 7 site-specific identification fields (Inspector, Area/Location, Program, Asset Tag, SCAP Score, DCN, Prior Win10 Upgrade) are prompted for interactively (`Read-Host`) whenever not supplied as a parameter — no switches are required for a normal run. Supports `-SampleMode` (no live checks, placeholder evidence only, no prompts) for demonstration/dry-run use. |
| `New-ISVReport.ps1` | **The renderer.** Loads an `evidence.json` bundle, recomputes the SHA-256 digest over its items and compares it to the stored value (tamper detection — mismatches surface as a loud warning in both the console and the rendered report), then writes the three HTML deliverables: the main report, and the two vendor BIOS reference guides. |
| `Initial-System-Validation-Report-SAMPLE.html` | Generated deliverable — the main audit report. Every item shows the command executed, captured evidence, result, and timestamp. |
| `Dell-BIOS-Reference-Guide.html` / `HP-BIOS-Reference-Guide.html` | Generated deliverables — companion vendor guides holding the automated command variant, physical-console manual fallback, discovery caveats, and citations for BIOS Controls items 1.A-1.E, split by vendor. |
| `evidence.json` | Generated deliverable — the raw evidence export (meta + items + SHA-256 digest) an auditor can independently re-hash to confirm against the digest printed in the report header. |
| `research_dell_bios.md` / `research_hp_bios.md` | Cited vendor research backing the two BIOS reference guides (DCPP / HP CMSL install paths, BIOS UI generation differences, confidence-level notes on unconfirmed setting paths). |
| `CHANGELOG-round2.md` / `ROUND2-SPEC.md` | Working notes from the report-simplification pass (10-page target, barebones/PowerShell-first pivot, 3-report split). Predate the Python-to-PowerShell rewrite; kept for history. |

## Running the collector

**On the target Windows 11 endpoint**, from an elevated PowerShell prompt (needed for some of the
read-only checks — e.g. `Get-LocalGroupMember` on built-in groups):

```powershell
cd execution-plan\initial-system-validation
.\Invoke-ISVCollection.ps1
```

That's the whole live-mode command. Since the 7 identification fields (Inspector, Area/Location,
Program, Asset Tag, SCAP score, DCN, prior-upgrade flag) are site-specific and cannot be read from
the OS, the script prompts for each one interactively:

```
System Identification -- enter the following site-specific details.
(Press Enter to leave a field as "N/A -- not provided by operator".)
CSU Inspector name: J. Smith
Area / Location: Building 4, Room 210
Program name: JSIG Maintenance Playbook
Asset Tag Number (TAG#): TAG-0001
SCAP score (from separate SCAP scan tool, or N/A): 98.2
DCN: DCN-0001
Prior Windows 10-to-11 upgrade? (Y/N): N
```

It then runs all 41 checks and writes `evidence.json` next to itself:

```
Initial System Validation collection starting (...)...
Collection complete. 41 items recorded.
Evidence bundle written to: .\evidence.json
SHA-256 digest: <hex>
```

**This only writes the evidence file — it does not produce the HTML report.** Rendering the report
is a separate, deliberate second step; see "Regenerating the report" below.

For unattended/scripted runs, any field can still be supplied as a parameter, which skips the
prompt for that field only (mix and match freely — e.g. pre-fill `-Inspector` and get prompted for
the rest):

```powershell
./Invoke-ISVCollection.ps1 `
  -Inspector "J. Smith" -AreaLocation "Building 4, Room 210" `
  -Program "JSIG Maintenance Playbook" -AssetTag "TAG-0001" `
  -ScapScore "98.2" -Dcn "DCN-0001" -PriorWin10Upgrade "N" `
  -OutputPath ./evidence.json
```

```powershell
# Sample/demo mode -- no prompts, no live checks executed; all items report a
# placeholder result so the report's shape and formatting can be reviewed offline.
./Invoke-ISVCollection.ps1 -SampleMode -OutputPath ./evidence.json
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
the console stays quiet. A summary line (`Collection complete. N items recorded.`) always confirms
whether the run finished.

## Regenerating the report

```powershell
cd execution-plan/initial-system-validation
./New-ISVReport.ps1 -EvidencePath ./evidence.json -OutputDir .
# -> Initial-System-Validation-Report-SAMPLE.html
# -> Dell-BIOS-Reference-Guide.html
# -> HP-BIOS-Reference-Guide.html
```

Both scripts are self-contained PowerShell (no external modules beyond what's built into Windows
PowerShell / PowerShell 7) and write their output alongside themselves in this folder. `pwsh -File`
on PowerShell 7+ or `powershell.exe -File` on Windows PowerShell 5.1 both work.

## Tamper-evidence digest

`evidence.json` stores a SHA-256 digest computed over the **items array only** (never the `meta`
block), serialized as canonical JSON: keys sorted ordinally, no extraneous whitespace, non-ASCII
escaped. `Invoke-ISVCollection.ps1` computes this digest when writing the file; `New-ISVReport.ps1`
independently recomputes it when loading the file and compares. Any edit to the evidence after
collection — even a single character — changes the digest and triggers a visible warning banner in
the rendered report (and a console warning) so a reviewer knows to investigate before trusting the
report.

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
- **Planning-only until human approval.** The checked-in `evidence.json` and HTML reports are
  `-SampleMode` output. Running `Invoke-ISVCollection.ps1` against a live system is a separate,
  deliberate action outside this repo's automation.
- Follows the same Nexus design-system styling as the rest of this repo's generated documents
  (see `execution-plan/tools/generate_variance.py` for the sibling implementation).

See `manifest.txt` at the repo root for this folder's file inventory.
