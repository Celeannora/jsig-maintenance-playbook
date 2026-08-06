# Round 2 Edit Spec — Initial System Validation Sample Report

Work in `/home/user/workspace/initial-system-validation/`. Read `evidence_data.py`, `render_report.py`, `research_dell_bios.md`, and `research_hp_bios.md` fully before editing. Do NOT touch anything outside this folder — especially never `/home/user/workspace/jsig-reference-scaffold/` or any file named `MAINTENANCE-PLAN.md`.

## 1. Acronym expansion
Throughout `evidence_data.py` (SYSTEM_IDENTIFICATION labels/values and all SECTIONS item text), expand acronyms on first meaningful appearance per item, format `Full Term (ABBR)`:
- HD → Hard Drive (HD)
- CPU → Processor (CPU)
- RAM → Memory (RAM)
- GB → Gigabytes (GB)
- SN → Serial Number (SN)
- TAG# → Asset Tag Number (TAG#)
- SCAP → Security Content Automation Protocol (SCAP) Score
- SRO → Security-Relevant Object (SRO)  [confirmed by Audit.md line 123: "security-relevant objects"]

Leave `DCN` and `CSU` UNEXPANDED exactly as written — they are not defined anywhere in the source Audit.md. Add a short footnote near SYSTEM_IDENTIFICATION (or in REPORT_META notes rendered near the top) stating these two are undefined/site-specific abbreviations not expanded because no source definition was found, and inviting the customer to supply the expansion if desired.

## 2. Extended Asset Inventory (new section)
Add a new section (e.g. "0. Extended Asset Inventory" or append fields to SYSTEM_IDENTIFICATION — your call, keep it clean) with exhaustive per-component hardware identifiers, native Windows/PowerShell/WMI/CIM tools ONLY (no third-party):
- Memory (RAM): stick-by-stick serials — `Get-CimInstance -ClassName Win32_PhysicalMemory | Select-Object DeviceLocator,SerialNumber,Capacity,Manufacturer`
- Motherboard serial — `Get-CimInstance -ClassName Win32_BaseBoard | Select-Object Manufacturer,Product,SerialNumber`
- BIOS/firmware serial (where exposed) — `Get-CimInstance -ClassName Win32_BIOS | Select-Object SerialNumber,SMBIOSBIOSVersion,ReleaseDate`
- EACH disk's serial individually, not just disk #0 — `Get-CimInstance -ClassName Win32_DiskDrive | Select-Object Index,Model,SerialNumber,Size`
- Chassis/asset service tag — `Get-CimInstance -ClassName Win32_SystemEnclosure | Select-Object SerialNumber,SMBIOSAssetTag,ChassisTypes`
- Full OS build/edition — `Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object Caption,Version,BuildNumber,OSArchitecture`
- Processor model — `Get-CimInstance -ClassName Win32_Processor | Select-Object Name,NumberOfCores,NumberOfLogicalProcessors`
- TPM presence/version — `Get-Tpm` (built-in TPM cmdlet) and/or `Get-CimInstance -Namespace root\cimv2\security\microsofttpm -ClassName Win32_Tpm`
- Secure Boot state — `Confirm-SecureBootUEFI` (built-in)
- Domain/workgroup membership — `Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object Domain,PartOfDomain,Workgroup`
- Network adapter MODEL/NAME (equipment inventory only) — `Get-CimInstance -ClassName Win32_NetworkAdapter | Where-Object {$_.PhysicalAdapter} | Select-Object Name,Manufacturer,AdapterType` — do NOT select or display IPAddress/MACAddress properties.

Each item follows the existing item schema (id, requirement/description, method, command, evidence placeholder, timestamp placeholder).

**HARD EXCLUSION — classification guardrail:** Do not include IP addresses or MAC addresses anywhere in this new section or anywhere else in the report. This report must only ever contain information appropriate for an "Unclassified" audit record. Double check no other section leaks IP/MAC data while you're in there.

## 3. BIOS Controls dual/multi-path upgrade (items 1.A–1.E)
Replace the current single method/command/evidence schema on the 5 BIOS Controls items with a new optional `paths` list, each entry a dict: `label`, `method` (AUTOMATED or MANUAL), `command_or_steps`, `evidence` placeholder, `source_citation` (real URL from the research files), and optional `caution` note (see §4).

Use ONLY verified findings from `research_dell_bios.md` and `research_hp_bios.md` — do not invent unconfirmed cmdlets/paths. Where those files flag a gap (no confirmed DCPP path for USB boot/virtualization; no dedicated HP cmdlet for TPM/Secure Boot/USB boot/virtualization — must discover exact setting name per-device via `Get-HPBIOSSettingsList`), carry that honesty caveat into the item text.

For each of the 5 BIOS items add, as applicable:
- (a) Dell Command | PowerShell Provider (DCPP) automated path — exact `DellSmbios:` cmdlet/path from research file §1.4
- (b) HP CMSL automated path — exact `Get-HPBIOSSetting(Value)` pattern from research file §1.3/1.4
- (c) Dell manual navigation — F2 to enter Setup, F12 for one-time boot; menu locations from research file §2.3; note BOTH UI generations (classic pre-~May-2021 tab/tree UI vs. newer tile/toggle "BIOS 4.0" UI, per §2.2)
- (d) HP manual navigation — ESC then F10; four tabs Main/Security/Advanced/UEFI Drivers; exact submenu locations from research file §2.2; note pre-2015 vs 2015-onward redesign plus incremental changes through 2024–2026 (§2.3)

Cite real source URLs from the research files as `source_citation` on every path.

## 4. NEW REQUIREMENT — no plaintext BIOS passwords
Apply to every path/command that reads, sets, or supplies a BIOS admin/setup/power-on password (e.g. Dell's `Set-Item ... -Password $PlainTxtPwd`, `Write-DellBIOSPassword`, `Clear-DellAdminPassword -Password <existing password>`; HP's `Set-HPBIOSSetupPassword`, `Set-HPBIOSPowerOnPassword`):

- Rewrite `command_or_steps` so the password is sourced via SecureString/PSCredential, never a literal string — e.g. `$SecurePwd = Read-Host -Prompt "Enter BIOS Admin Password" -AsSecureString`, or an already-protected credential store (`Get-Credential`, or a DPAPI-bound `Export-Clixml`/`Import-Clixml` PSCredential file), then pass that secure object into the cmdlet.
- Where Dell's own documented syntax internally needs a decrypted plaintext variable (Dell's examples use `$PlainTxtPwd`), describe this accurately and narrowly: convert from SecureString immediately before the single call, never store or display it, never write it to evidence output or terminal history. Do not overclaim the underlying Dell API accepts a SecureString object directly unless the research explicitly confirms that.
- Add a one-line `caution` field on every such path: "Do not hardcode or paste BIOS passwords in plaintext in scripts, terminal history, or evidence captures; use SecureString/PSCredential-based input."
- This rule does NOT apply to password-STATE checks that take no password argument (e.g. `Get-Item DellSmbios:\Security\IsAdminPasswordSet`, `Get-HPBIOSSetupPasswordIsSet`) — those are read-only and fine as-is.

## 5. render_report.py changes
- Update `render_item_card()` (and STYLE CSS only if truly needed) to render the new optional `paths` list: each path as its own labeled sub-block (label, method badge, command/steps in existing `<pre>` class, evidence placeholder, citation link in the existing citation convention, and the `caution` text in a visually distinct small callout if present) inside the existing item-card container. Leave rendering of all non-BIOS items (single method/command/evidence schema) completely unchanged.
- Add a small deduplicated "Sources" list at the end of the report (after the existing AD_QUERY_APPENDIX, before the footer) listing every unique `source_citation` URL used across the BIOS paths, in the same citation style already used in the file.
- Keep the existing Nexus palette — no new colors.

## 6. Regenerate & verify
Run `python3 render_report.py` from `/home/user/workspace/initial-system-validation/`. Confirm it produces `evidence.json` and `Initial-System-Validation-Report-SAMPLE.html` with no errors. Report the new SHA-256 digest and total item count.

Visually sanity-check the rendered HTML (e.g. render to PDF with `soffice --headless --convert-to pdf` purely for your own visual QA, not as a deliverable) for text overflow/wrapping issues in the denser multi-path BIOS cards specifically — these are new and need care.

## 7. Deliverable
Write a short changelog to `/home/user/workspace/initial-system-validation/CHANGELOG-round2.md` listing exactly what changed, file:line style, including: acronym expansion scope, new asset inventory section (list all new item ids), BIOS paths added per item (1.A–1.E) with which citations used, and confirmation that no IP/MAC address fields exist anywhere in evidence_data.py (grep and paste the negative-result command you ran).
