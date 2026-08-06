# HP Business PC BIOS Research: PowerShell (CMSL) and Manual Setup Navigation

Scope: HP EliteDesk, ProDesk, EliteBook, ProBook (and related commercial/workstation platforms, since HP's official BIOS documentation groups these together as "HP PC Commercial" or "HP Business Notebook and Desktop" products). Two topics are covered: (1) the HP Client Management Script Library (CMSL) and its read-oriented BIOS cmdlets, and (2) manual BIOS/UEFI setup-menu navigation.

---

## 1. HP Client Management Script Library (HP CMSL)

### 1.1 What it is

HP CMSL is a collection of PowerShell modules published by HP for managing HP client devices — querying and changing BIOS settings, managing firmware/BIOS updates, working with SoftPaqs, and other device-management tasks. HP's developer portal describes it as incorporating "a number of modules," including a **BIOS and Device** module that "allows querying client properties, and manipulating the HP BIOS settings," a **Security** module for "querying platform data, invoking TPM credential validation, and other functions," a **Firmware** module for low-level firmware functionality, and modules for SoftPaq management, Consent/telemetry management, notifications, displays, docks, and retail systems ([HP Developer Portal – Client Management Script Library](https://developers.hp.com/hp-client-management/doc/client-management-script-library)).

CMSL is **not built into Windows**. It is a separate, HP-authored PowerShell module set that must be explicitly installed. HP's own portal states it is "supported on 64-bit PowerShell 5.1 and higher" and "supports Windows 10 version 1809 and higher, and Windows 11" ([HP Developer Portal – Client Management Script Library](https://developers.hp.com/hp-client-management/doc/client-management-script-library)). A community troubleshooting thread on Stack Overflow confirms the practical implication for anyone expecting these cmdlets natively: "The command `Get-HPBIOSSettingValue` and `Set-HPBIOSSettingValue` are not native to Windows – you'll need to download the relevant HP module and install it – try Powershell Gallery" ([Stack Overflow](https://stackoverflow.com/questions/66335769/hp-bios-battery-health-settings)).

### 1.2 Installation

**Primary method — PowerShell Gallery.** CMSL is distributed as the `HPCMSL` package (a meta-package bundling the individual `HP.*` modules) on the PowerShell Gallery. The PowerShell Gallery listing for `HPCMSL` confirms it as an installable PowerShell Gallery package requiring **license acceptance**, with a minimum PowerShell version of 5.1, and dependent sub-modules including `HP.ClientManagement`, `HP.Firmware`, `HP.Security`, `HP.Softpaq`, `HP.Notifications`, `HP.Consent`, `HP.Repo`, `HP.Retail`, `HP.Displays`, `HP.Docks`, `HP.Sinks`, `HP.SmartExperiences`, `HP.Private`, and `HP.Utility` ([PowerShell Gallery – HPCMSL](https://www.powershellgallery.com/packages/HPCMSL)). The `HP.ClientManagement` sub-module — which is the one that actually exposes the BIOS-reading cmdlets — is separately listed as "Device and BIOS management module for HP Client Management Script Library" ([PowerShell Gallery – HP.ClientManagement](https://www.powershellgallery.com/packages/HP.ClientManagement)).

The standard install command (documented in HP community/support guidance, consistent with standard PowerShell Gallery usage) is:

```powershell
Install-Module -Name HPCMSL -Force
```

This exact syntax, including the note that PowerShell may prompt to trust an "untrusted repository" the first time, is documented in an HP Support Community troubleshooting thread walking through CMSL installation and TPM/PTT checks ([HP Support Community – TPM 2.0 on ProBook 450 G8](https://h30434.www3.hp.com/t5/Business-Notebooks/URGENT-4-Month-Struggle-to-Enable-TPM-2-0-on-HP-ProBook-450/td-p/9502817)).

**Alternative method — standalone installer / manual deployment.** HP also distributes a "Library Installer" (an EXE) through the Client Management Solutions download page for environments where PowerShell Gallery access is not desired; HP's guidance is that "when attempting to install PowerShell modules manually, always do so by deploying the entire library" because "some of these modules may have interdependencies" ([HP Developer Portal – Client Management Script Library](https://developers.hp.com/hp-client-management/doc/client-management-script-library)). HP's official FAQ documents a fully offline/manual extraction workflow using the installer's silent-unpack switches and `Import-Module`:

```powershell
PS C:\> mkdir localdir
PS C:\> hp-cmsl.exe /VERYSILENT /SP- /UnpackOnly="True" /DestDir="C:\localdir\hp-cmsl"
PS C:\> Import-Module -Force C:\localdir\hp-cmsl\modules\HP.Consent\HP.Consent.psd1
```

and lists `Get-Module -ListAvailable -Name 'HP.*'` as the way to confirm which HP modules and versions are present ([HP Developer Portal – CMSL FAQ](https://developers.hp.com/hp-client-management/doc/faq)).

Once installed, a script must import the relevant module before use, e.g. `Import-Module HP.ClientManagement`, as shown in independent CMSL usage write-ups ([Jon's Notes – HP BIOS Settings Management (HPCMSL)](https://www.configjon.com/hp-bios-settings-management-hpcmsl/)).

### 1.3 Cmdlets for reading BIOS settings

HP's developer portal's **BIOS and Device** module page is the authoritative cmdlet reference. Under "Working with HP BIOS settings directly," the documented read/write cmdlets are:

| Cmdlet | Purpose |
|---|---|
| `Get-HPBIOSSetting` | Retrieves an HP BIOS Setting **object** (all fields) by name |
| `Get-HPBIOSSettingValue` | Retrieves only the **value** of a named BIOS setting |
| `Get-HPBIOSSettingsList` | Retrieves **all** BIOS settings on the device |
| `Set-HPBIOSSettingValue` | Sets the value of a BIOS setting |
| `Set-HPBIOSSettingValuesFromFile` | Sets multiple BIOS settings from a BCU/CSV/XML/JSON file |
| `Set-HPBIOSSettingDefaults` | Resets BIOS settings to shipping defaults |

Under "Working with HP BIOS passwords":

| Cmdlet | Purpose |
|---|---|
| `Get-HPBIOSSetupPasswordIsSet` | Checks whether the BIOS **Setup (Administrator)** password is set |
| `Set-HPBIOSSetupPassword` / `Clear-HPBIOSSetupPassword` | Sets/clears the Setup password |
| `Get-HPBIOSPowerOnPasswordIsSet` | Checks whether the **Power-On** password is set |
| `Set-HPBIOSPowerOnPassword` / `Clear-HPBIOSPowerOnPassword` | Sets/clears the Power-On password |

Additional utility/query cmdlets from the same page: `Get-HPBIOSVersion`, `Get-HPBIOSAuthor`, `Get-HPDeviceManufacturer`, `Get-HPDeviceModel`, `Get-HPDeviceSerialNumber`, `Get-HPDeviceAssetTag`, `Get-HPBIOSUUID`, `Get-HPDeviceBootInformation` (retrieves current boot **mode** and uptime — not full boot-order), `Get-HPCMSLEnvironment`, plus UEFI-variable cmdlets `Get-HPUEFIVariable` / `Set-HPUEFIVariable` / `Remove-HPUEFIVariable` ([HP Developer Portal – BIOS and Device module](https://developers.hp.com/hp-client-management/doc/bios-and-device)).

**Exact documented syntax** (from the individual HP developer-portal cmdlet pages):

```powershell
Get-HPBIOSSettingsList [[-Format] <String>] [[-NoReadonly]] [[-ComputerName] <String>] [[-CimSession] <CimSession>] [<CommonParameters>]
# Example:
Get-HPBIOSSettingsList -Format BCU
```
`-Format` accepts `BCU`, `CSV`, `XML`, `JSON`, or `brief` (default). `-NoReadonly` excludes read-only settings. `-ComputerName`/`-CimSession` allow remote targeting via CIM ([HP Developer Portal – Get-HPBIOSSettingsList](https://developers.hp.com/hp-client-management/doc/get-hpbiossettingslist)).

```powershell
Get-HPBIOSSetting [-Name] <Object> [[-Format] <Object>] [[-ComputerName] <String>] [<CommonParameters>]
# Example:
Get-HPBIOSSetting -Name "Serial Number" -Format BCU
```
Requires HP BIOS; retrieves the full setting object ([HP Developer Portal – Get-HPBIOSSetting](https://developers.hp.com/hp-client-management/doc/get-hpbiossetting)).

```powershell
Get-HPBIOSSettingValue [-Name] <String> [[-ComputerName] <String>] [<CommonParameters>]
# Example:
Get-HPBIOSSettingValue -Name 'Asset Tracking Number'
```
Retrieves only the value, not the full object; requires HP BIOS ([HP Developer Portal – Get-HPBIOSSettingValue](https://developers.hp.com/hp-client-management/doc/get-hpbiossettingvalue)).

Real-world usage examples corroborated by an HP employee/moderator on the HP Support Community, using an HP ProDesk desktop, confirm the same pattern in production troubleshooting:
```powershell
Get-HPBIOSSettingsList
Set-HPBIOSSettingValue -Name 'BIOS Power-On Time (hh:mm)' -value 8:00
```
([HP Support Community – Help to edit Biossettings with HP-CMSL](https://h30434.www3.hp.com/t5/Business-PCs-Workstations-and-Point-of-Sale-Systems/Help-to-edit-Biossettings-with-HP-CMSL/td-p/8463244))

### 1.4 Reading specific setting categories: boot order, admin password, TPM, secure boot, USB boot, virtualization

This is where HP's documentation is **generic rather than setting-specific**: CMSL does not expose dedicated, uniquely-named cmdlets like `Get-HPBootOrder` or `Get-HPSecureBootState`. Instead, HP's design pattern is that `Get-HPBIOSSettingsList` / `Get-HPBIOSSetting` / `Get-HPBIOSSettingValue` are **generic accessors that take the BIOS setting's display name as a string** — the same name shown in the F10 Setup UI — and the specific setting names vary by platform/BIOS generation. This is documented behavior, not a gap in HP's docs, but it does mean an inspector must first enumerate available names on the target device (e.g., via `(Get-HPBIOSSettingsList).Name`) before querying a specific one, as shown in a widely used third-party walkthrough of CMSL usage ([Recast Software – HP Client Management Script Library](https://www.recastsoftware.com/resources/hp-management-via-powershell/)).

Evidence for how each requested category is actually queried, by setting name, through these generic cmdlets:

- **Boot order**: HP's own "BIOS and Device" reference lists a supporting management class, `HP_BIOSOrderedList`, described as extending `HP_BIOSSetting` "to support such hardware features as boot order" ([HP Developer Portal – Understanding HP BIOS Settings](https://developers.hp.com/hp-client-management/doc/understanding-hp-bios-settings)). In practice, administrators query boot order through `Get-HPBIOSSetting`/`Get-HPBIOSSettingValue` using the platform-specific setting name (commonly `"Boot Order"`, `"Legacy Boot Order"`, or `"UEFI Boot Order"` depending on generation), e.g. `Get-HPBIOSSettingValue -Name "Boot Order"`, following the pattern documented on HP's own blog examples for other settings (see §1.5) and community WMI-based equivalents that use the identical setting name against the underlying `HP_BIOSSetting`/`HP_BIOSOrderedList` WMI classes that CMSL wraps ([garytown.com – HP BCU to HP CMSL](https://garytown.com/hp-bcu-to-hp-cmsl)). **HP's developer portal does not publish one single canonical example for reading boot order via CMSL**, so the exact setting-name string should be confirmed per platform using `Get-HPBIOSSettingsList` before scripting against it.
- **Admin (Setup) password state**: `Get-HPBIOSSetupPasswordIsSet` — explicitly documented, returns whether the BIOS Setup/Administrator password is currently set ([HP Developer Portal – BIOS and Device module](https://developers.hp.com/hp-client-management/doc/bios-and-device)).
- **TPM state**: No dedicated `Get-HPTPMState` cmdlet is published on the developer portal's BIOS/Device or Security module pages. TPM-related settings (e.g., "TPM Device", "TPM State", "Intel Platform Trust Technology") are read via the generic `Get-HPBIOSSetting`/`Get-HPBIOSSettingValue` cmdlets by exact setting name. This is demonstrated directly in an HP Support Community post walking through checking Intel PTT/TPM status: `Get-HPBIOSSetting -Name "Intel Platform Trust Technology"` ([HP Support Community – TPM 2.0 on ProBook 450 G8](https://h30434.www3.hp.com/t5/Business-Notebooks/URGENT-4-Month-Struggle-to-Enable-TPM-2-0-on-HP-ProBook-450/td-p/9502817)). HP CMSL's separate **Security** module is described only at a high level as providing functionality for "querying platform data, invoking TPM credential validation, and other functions" — HP's public module-index page does not enumerate a specific TPM-reading cmdlet name for this module ([HP Developer Portal – Client Management Script Library](https://developers.hp.com/hp-client-management/doc/client-management-script-library)).
- **Secure Boot state**: Likewise not exposed as a dedicated cmdlet; read via the generic settings cmdlets using the "Secure Boot" setting name, e.g. `Get-HPBIOSSettingValue -Name "Secure Boot"`, following the same pattern as other named settings. One community post shows administrators occasionally getting a "Not Supported" error when attempting to *set* Secure Boot via `Set-HPBIOSSettingValue` and instead needing `Set-HPBIOSSetting` or a WMI class directly (`HP_BIOSSettingInterface`) — evidence that Secure Boot handling can be platform-dependent and is not always uniform across the generic cmdlet surface ([Reddit r/SCCM – Set SecureBoot via HPCMSL Error Not Supported](https://www.reddit.com/r/SCCM/comments/1nd8iez/set_secureboot_via_hpcmsl_error_not_supported/)).
- **USB boot enable/disable**: Same generic pattern — no dedicated cmdlet; read via `Get-HPBIOSSettingValue -Name "USB Storage Boot"` (the setting name as it appears in the F10 UI; see §2).
- **Virtualization (VT-x/VT-d)**: Same generic pattern — no dedicated cmdlet; an HP-documented deployment walkthrough for enabling virtualization settings via CMSL shows the pattern `Set-HPBIOSSettingValue -Name "Virtualization Technology (VTx)" -Value "Enable"` (implying the corresponding read is `Get-HPBIOSSettingValue -Name "Virtualization Technology (VTx)"`) ([Techuisitive – Manage BIOS Settings with HP CMSL](https://techuisitive.com/manage-bios-settings-with-hp-cmsl/)).

**Underlying mechanism**: All of these CMSL cmdlets are documented wrappers around HP's own WMI provider, exposed under the namespace `root\HP\InstrumentedBIOS`, using WMI classes `HP_BIOSSetting` (read), `HP_BIOSEnumeration` (enumerated/read), `HP_BIOSOrderedList` (ordered lists like boot order), and `HP_BIOSSettingInterface` (a WMI method class used to *set* values) ([HP Developer Portal – Understanding HP BIOS Settings](https://developers.hp.com/hp-client-management/doc/understanding-hp-bios-settings); [garytown.com – HP BCU to HP CMSL](https://garytown.com/hp-bcu-to-hp-cmsl)). This means that, absent CMSL, the same information is accessible directly via native `Get-CimInstance`/`Get-WmiObject` queries against those classes — a fallback path documented across multiple community references and useful context for an inspector without CMSL installed ([Windows OS Hub – How to View and Change BIOS Settings with PowerShell](https://woshub.com/powershell-view-change-bios-settings/)).

### 1.5 Confirmed working examples (from HP's own developer-portal blog)

HP's developer blog provides an authoritative, end-to-end read/write example using the generic settings cmdlets against a named setting:

```powershell
$setting = Get-HPBIOSSettingValue -Name "Battery Health Manager"
if ($setting -eq "Let HP manage my battery charging") { exit 0 }
Set-HPBIOSSettingValue -Name "Battery Health Manager" -value "Let HP manage my battery charging"
```
([HP Developer Portal – Managing battery health settings with Microsoft Endpoint Manager and HPCMSL](https://developers.hp.com/hp-client-management/blog/managing-battery-health-settings-microsoft-endpoint-manager-and-hp-client-management-script-library-hpcmsl))

HP's blog on **HP Sure Admin and CMSL** additionally documents that when a device is provisioned with HP Sure Admin / Secure Platform Management (enhanced BIOS authentication), plain reads of some settings may return "Setting not found" until authenticated, and that setting *changes* to a protected BIOS require signed payload cmdlets (`New-HPSureAdminBIOSSettingValuePayload`, `Set-HPSecurePlatformPayload`) rather than the plain `Set-HPBIOSSettingValue` — relevant context for an inspector who finds `Get-HPBIOSSetting` cmdlets returning empty or blocked on a security-hardened commercial PC ([HP Developer Portal – Secure BIOS with HP Sure Admin and CMSL](https://developers.hp.com/hp-client-management/blog/secure-bios-hp-sure-admin-and-cmsl)).

### 1.6 What is NOT well documented (honesty check)

- HP's official developer-portal module index does **not** publish a complete, authoritative list of exact BIOS setting name strings (e.g., is it "Secure Boot" or "Secure Boot Configuration > Secure Boot"; is it "Boot Order" or "UEFI Boot Order" or "Legacy Boot Order") that apply uniformly across all EliteDesk/ProDesk/EliteBook/ProBook models and BIOS generations. These names must be discovered per-device using `Get-HPBIOSSettingsList` or `(Get-HPBIOSSettingsList).Name`, and they can differ by platform/BIOS family (as seen in the boot-order example spanning older Compaq/HP Elite desktop models with different setting-name conventions) ([HP Support Community – Get/Set HP BIOS with PowerShell](https://h30434.www3.hp.com/t5/Desktops-Archive-Read-Only/Get-Set-HP-BIOS-with-PowerShell/td-p/5070126)).
- There is **no dedicated, single-purpose cmdlet documented by HP** for TPM state, Secure Boot state, USB boot state, or virtualization state (e.g., no `Get-HPTPMState`, `Get-HPSecureBootState`, `Get-HPUSBBootEnabled`, `Get-HPVirtualizationState`). All are accessed via the generic `Get-HPBIOSSetting(Value)` cmdlets using the setting's display name — this is a documented design choice, not a discovered gap, but it should not be mistaken for the existence of setting-specific cmdlets.
- The CMSL **Security module**'s specific cmdlet names for "TPM credential validation" are not enumerated on the public module-index page fetched for this report; only a functional description is given ([HP Developer Portal – Client Management Script Library](https://developers.hp.com/hp-client-management/doc/client-management-script-library)). A more specific Security-module cmdlet reference page may exist on developers.hp.com but was not located/confirmed in this research pass.
- Behavior under HP Sure Admin / Secure Platform Management (locked-down BIOS) can cause standard read cmdlets to return "Setting not found," which is documented anecdotally in HP's own blog and support community but is not exhaustively cataloged as a general rule ([HP Developer Portal – Secure BIOS with HP Sure Admin and CMSL](https://developers.hp.com/hp-client-management/blog/secure-bios-hp-sure-admin-and-cmsl); [HP Support Community – SPM Provisioning](https://h30434.www3.hp.com/t5/Notebook-Software-and-How-To-Questions/Assistance-with-SPM-Secure-Platform-Module-Provisioning-on/td-p/9439343)).

---

## 2. Manual BIOS/UEFI setup menu navigation (current-generation HP business PCs)

### 2.1 Key sequence to enter setup

HP's own consumer-facing but company-wide guidance states: "When the HP or manufacturer logo appears, press the **ESC** key repeatedly until BIOS setup is entered... For HP PCs, the common BIOS keys are ESC and F10" ([HP.com – How to Enter BIOS Setup on Windows PCs](https://www.hp.com/us-en/tech-takes/software/how-to/how-to-enter-bios-setup-windows-pcs.html)).

HP's detailed commercial-platform documentation is more specific and consistent across product manuals and the current PC Technical Whitepaper: **press ESC at the "Press the ESC key for Startup Menu" prompt, then press F10** to enter BIOS/Computer Setup ([HP EliteBook Maintenance & Service Guide](https://h10032.www1.hp.com/ctg/Manual/c02441315.pdf); [HP Computer Setup manual](https://h10032.www1.hp.com/ctg/Manual/c01737395.pdf)). The current (through 2026) **HP PC Commercial BIOS (UEFI) Setup** technical whitepaper confirms this remains the entry method: "BIOS Setup is accessed during system boot using the **F10** function key" ([HP PC Commercial BIOS (UEFI) Setup whitepaper](https://h10032.www1.hp.com/ctg/Manual/c06696065.pdf)); the same whitepaper also documents that pressing **F3** during startup opens **3rd Party Option ROM Management** directly, and that on notebooks, pressing **F9** at the Startup Menu opens the one-time boot-device menu.

**Practical caveat** (documented via HP's own support-community troubleshooting, not an official doc but corroborated repeatedly): on fast-booting current systems, F10/ESC can be missed if not pressed immediately and repeatedly as soon as the logo appears; HP support guidance for this includes disabling Windows "Fast Startup," using the Windows *Advanced Startup → Troubleshoot → Advanced options → UEFI Firmware Settings → Restart* path instead, or (rarely, on older units) holding F10 before powering on ([HP.com – How to Enter BIOS Setup on Windows PCs](https://www.hp.com/us-en/tech-takes/software/how-to/how-to-enter-bios-setup-windows-pcs.html); [HP Support Community – bios access, f10 doesn't work](https://h30434.www3.hp.com/t5/Business-PCs-Workstations-and-Point-of-Sale-Systems/Re-bios-access-f10-doesn-t-work/td-p/6073886)).

### 2.2 Menu structure

HP's F10 Setup UI for current-generation (2015-onward, UEFI-based) commercial notebooks and desktops uses a **common four-tab structure**, per HP's own current technical whitepaper:

- **Main**
- **Security**
- **Advanced**
- **UEFI Drivers**

This structure is stated explicitly: "The top-level tabs in BIOS Setup are: Main..., Security..., Advanced..., and UEFI Drivers" ([HP PC Commercial BIOS (UEFI) Setup whitepaper](https://h10032.www1.hp.com/ctg/Manual/c06696065.pdf)), and the same four-tab structure and rationale ("common set of core modules capable of supporting both notebook and desktop models... similar look and feel for the F10 setup menu") is documented in an earlier version of the same HP whitepaper series describing the 2015 BIOS redesign ([HP PC Commercial BIOS (UEFI) Setup, earlier edition, mirrored copy](https://fr.scribd.com/document/353391751/c05166986-pdf); original HP source: [h10032.www1.hp.com/ctg/Manual/c05166986.pdf](https://h10032.www1.hp.com/ctg/Manual/c05166986.pdf)).

Where an inspector finds each requested item, per HP's current whitepaper:

| Item | Menu path | Notes |
|---|---|---|
| **Boot order / boot sequence** | `Advanced > Boot Options > UEFI Boot Order` | Default device-type precedence: USB → SATA DVD (desktop only) → SATA hard drives → M.2 devices → Network Boot. Highlight the list and press Enter to reorder. |
| **BIOS Administrator (admin) password setup** | `Security > Administrator Tools > Create/Change BIOS Administration Password` | Menu label reads "Create BIOS Administrator Password" if unset, or "Change BIOS Administrator Password" if already set. Controls access to F10 Setup, F3 3rd-Party Option ROM Management, ROM updates, WMI-based setting changes, and BCU. |
| **USB / removable-media boot disable** | `Advanced > Boot Options > USB Storage Boot` (uncheck to disable) | Default: Checked (enabled). Also interacts with `Advanced > Boot Options > Fast Boot` (bypasses USB/CD-ROM/PXE boot when checked) and, for stricter lockdown, `Security > Secure Boot Configuration > Ready BIOS for Device Guard Use`, which disables USB/CD-ROM/Thunderbolt boot as a set. |
| **TPM settings** | `Security > Security Configuration > TPM Embedded Security` | Includes TPM Specification Version (display only; 1.2 or 2.0), TPM Device (Available/Hidden), TPM State (enable OS/app access), Clear TPM, and TPM Activation Policy. Related items: `Security > Trusted Execution Technology (TXT)` (Intel), `Security > DRTM/SMM Protection` (AMD), and `Security > Smart Cover` (desktop, "Clear TPM on boot after cover removal"). |
| **Secure Boot toggle** | `Security > Security Configuration > Secure Boot Configuration > Secure Boot` | Default: Enabled. Related items in the same submenu: Platform Key (HP/Not Enrolled/Custom), Import/Clear/Reset Secure Boot Keys, Enable MS UEFI CA Key, and Ready BIOS for Device Guard Use. |

Source for all rows: [HP PC Commercial BIOS (UEFI) Setup whitepaper](https://h10032.www1.hp.com/ctg/Manual/c06696065.pdf), corroborated by the parallel HP FTP-hosted edition of the same document ([HP PC Commercial BIOS (UEFI) Setup, FTP mirror](https://ftp.hp.com/pub/caps-softpaq/cmit/whitepapers/HPBIOSSetup.pdf)) and, for workstation-class hardware, the HP Z Workstation Commercial BIOS (UEFI) Setup Administration Guide, which independently documents the Secure Boot path as `/Security/Secure Boot Configuration` ([HP Z Workstation BIOS Setup Administration Guide](https://h20195.www2.hp.com/v2/GetDocument.aspx?docname=4AA8-5191ENW)).

Virtualization settings (VT-x/VT-d, relevant to an inspector checking "virtualization") are documented by HP's own Wolf Security guidance as being under a menu "labeled Security, Advanced, Configuration, or CPU Configuration," with the caution that exact labels vary by model — HP does not commit to one universal path across all products for this particular setting ([HP Wolf Security User Guide – enabling virtualization](https://hpwolfsecurity-help.hpwolf.com/console/11.0/en/help.html)). The current commercial-BIOS whitepaper places virtualization-adjacent settings under `Advanced > System Options`, alongside `Advanced > System Options > Measure Additional DMA Settings`, which explicitly measures VT-x/VT-d (Intel) or SVM (AMD) plus Pre-Boot DMA Protection into the TPM ([HP PC Commercial BIOS (UEFI) Setup whitepaper](https://h10032.www1.hp.com/ctg/Manual/c06696065.pdf)).

### 2.3 BIOS UI / navigation differences across generations

HP's documentation explicitly acknowledges and describes **two structurally different eras** of its commercial BIOS:

- **Pre-2015 (older Compaq/HP Elite/ProDesk-era desktops, pre-UEFI-redesign notebooks)**: Setup entry via F10 (with an ESC-then-F10 pattern from roughly mid-2011 onward on notebooks; F10-only entry on notebooks made 2007 and earlier), navigated with a top menu bar of File / Security / Diagnostics / System Configuration rather than the modern Main/Security/Advanced/UEFI Drivers structure ([HP notebook BIOS setup manual, per mirrored copy of support.hp.com document](https://www.scribd.com/document/888511981/59-HP-BIOS); consistent with the equivalent official HP PDF, [HP Computer Setup manual](https://h10032.www1.hp.com/ctg/Manual/c01737395.pdf)). In this era, boot order used setting names such as `"Boot Order"` or `"Legacy Boot Order"` that varied by desktop model, as documented in an HP support community PowerShell script covering Compaq 8000/8100 Elite, Compaq 6005/6200 Pro, and ProDesk 600 G1 desktops ([HP Support Community – Get/Set HP BIOS with PowerShell](https://h30434.www3.hp.com/t5/Desktops-Archive-Read-Only/Get-Set-HP-BIOS-with-PowerShell/td-p/5070126)).
- **2015-onward (current UEFI-based generation, covering current EliteBook/ProBook/EliteDesk/ProDesk lines)**: HP "redesigned the 2015 generation of BIOS... to create a new BIOS architecture based on the UEFI specification... with a common set of core modules capable of supporting both notebook and desktop models," giving "a similar look and feel for the F10 setup menu" across notebooks and desktops, organized into the four tabs Main / Security / Advanced / UEFI Drivers — the UEFI Drivers tab being new at that time ([HP PC Commercial BIOS (UEFI) Setup, earlier edition](https://h10032.www1.hp.com/ctg/Manual/c05166986.pdf)). This basic four-tab structure is confirmed as still current in the most recent whitepaper edition covering 2024–2026 platform generations ([HP PC Commercial BIOS (UEFI) Setup whitepaper, current edition](https://h10032.www1.hp.com/ctg/Manual/c06696065.pdf)).

Within the current UEFI-based era, HP's documentation further identifies **incremental, generation-specific menu changes** (not full redesigns, but relocations/additions/removals of specific items an inspector should be aware of):

- BIOS firmware family/version letter prefixes track calendar-year platform generations (e.g., N=2015, P=2016, Q=2017–2018, R=2019, S=2020-introduced), per the earlier whitepaper edition ([HP PC Commercial BIOS (UEFI) Setup, FTP mirror](https://ftp.hp.com/pub/caps-softpaq/cmit/whitepapers/HPBIOSSetup.pdf)).
- **Secure Boot Configuration** menu location itself can move depending on whether "legacy support" is present: it sits under **Security** on systems *without* legacy support, but a duplicate/alternate **Secure Boot Configuration** entry can appear under **Advanced** on systems *with* legacy support ([HP PC Commercial BIOS (UEFI) Setup, FTP mirror](https://ftp.hp.com/pub/caps-softpaq/cmit/whitepapers/HPBIOSSetup.pdf)).
- **Administrator Authentication Policies** moved out of the **Password Policies** menu into its own item; **"Prompt for Admin authentication on Capsule Update"** was removed as of 2022 platforms ([HP PC Commercial BIOS (UEFI) Setup, FTP mirror](https://ftp.hp.com/pub/caps-softpaq/cmit/whitepapers/HPBIOSSetup.pdf)).
- **Thunderbolt** options moved from `Port Options` into a dedicated `Thunderbolt Options` menu starting with 2019 Thunderbolt-capable platforms, with only the port on/off toggle remaining under `Port Options` ([HP PC Commercial BIOS (UEFI) Setup, FTP mirror](https://ftp.hp.com/pub/caps-softpaq/cmit/whitepapers/HPBIOSSetup.pdf)).
- Newer security features have been added over time and are gated by platform generation or SKU, e.g. **TPM Activation Policy** and **Clear BIOS Passwords on RTC Battery Removal** (2020+), **Virtualization Based BIOS Protection** restricted to "Enterprise Security Edition" PCs starting 2024, **Pluton Security Processor** limited to specific AMD G1a/G1i/G1q products, and **HP TPM Guard** appearing as a 2026-generation addition ([HP PC Commercial BIOS (UEFI) Setup whitepaper, current edition](https://h10032.www1.hp.com/ctg/Manual/c06696065.pdf)).
- The underlying UEFI specification version implemented also changes by year/platform (e.g., desktops moved from UEFI 2.7 in 2021–2023 to 2.7B in 2024 and 2.8 in 2025; notebooks moved from 2.7 through 2024 to 2.9 in 2025), which can subtly affect available boot-manager behavior even where the visible menu labels look unchanged ([HP PC Commercial BIOS (UEFI) Setup whitepaper, current edition](https://h10032.www1.hp.com/ctg/Manual/c06696065.pdf)).

HP explicitly cautions that this whitepaper "describes a superset" of settings: "not every current-generation product supports every feature," some features are "limited to Intel, AMD, notebooks, desktops, workstations, or selected products," and "some older settings may be deprecated on newer models" ([HP PC Commercial BIOS (UEFI) Setup whitepaper, current edition](https://h10032.www1.hp.com/ctg/Manual/c06696065.pdf)).

### 2.4 What is NOT well documented / uncertain (honesty check)

- HP does **not** appear to publish a single official support.hp.com consumer-style article giving a definitive, current, per-product-line (EliteBook vs. ProBook vs. EliteDesk vs. ProDesk) key-sequence table; the general public-facing guidance ("ESC, then F10") is uniform across the HP.com tech-takes article regardless of model line ([HP.com – How to Enter BIOS Setup on Windows PCs](https://www.hp.com/us-en/tech-takes/software/how-to/how-to-enter-bios-setup-windows-pcs.html)). Two attempts to fetch specific `support.hp.com` BIOS-menu documents (`ish_3912651-2318005-16`, `ish_3891464-2337914-16`) returned "Access Denied" errors during this research session, likely due to bot/geographic access restrictions on that support portal rather than the documents not existing — an inspector with direct browser access to support.hp.com should be able to view them where this fetch could not.
- HP's whitepaper is explicit that it is a **superset**: exact tab/submenu presence, item order, and even whether "Secure Boot Configuration" appears under Security or Advanced can vary by specific model, legacy-support configuration, and generation. Treat every path in §2.2 as "where this is typically found on current-generation UEFI-only commercial systems," not as a guarantee for every individual SKU.
- The precise **BIOS setting string names** needed for CMSL cmdlet calls (§1) are not guaranteed to exactly match the on-screen menu labels character-for-character across all products; HP's own examples show close but not always identical wording between UI and WMI/CMSL setting names (e.g., "Virtualization Technology (VTx)" as a setting name vs. how it is labeled on-screen). Always confirm the exact string via `Get-HPBIOSSettingsList` on the specific target device rather than assuming a name from documentation of a different model.
- HP Sure Admin / Secure Platform Management, when provisioned, can hide or lock BIOS menu items and setting names from both the manual UI and CMSL reads; this is documented anecdotally (support-community threads) rather than in a single canonical HP reference enumerating exactly which items get hidden ([HP Support Community – TPM 2.0 on ProBook 450 G8](https://h30434.www3.hp.com/t5/Business-Notebooks/URGENT-4-Month-Struggle-to-Enable-TPM-2-0-on-HP-ProBook-450/td-p/9502817)).

---

## Source list

- [HP Developer Portal – Client Management Script Library (CMSL overview)](https://developers.hp.com/hp-client-management/doc/client-management-script-library)
- [HP Developer Portal – BIOS and Device module (cmdlet index)](https://developers.hp.com/hp-client-management/doc/bios-and-device)
- [HP Developer Portal – Get-HPBIOSSettingsList](https://developers.hp.com/hp-client-management/doc/get-hpbiossettingslist)
- [HP Developer Portal – Get-HPBIOSSetting](https://developers.hp.com/hp-client-management/doc/get-hpbiossetting)
- [HP Developer Portal – Get-HPBIOSSettingValue](https://developers.hp.com/hp-client-management/doc/get-hpbiossettingvalue)
- [HP Developer Portal – Set-HPBIOSSettingValuesFromFile](https://developers.hp.com/hp-client-management/doc/set-hpbiossettingvaluesfromfile)
- [HP Developer Portal – Understanding HP BIOS Settings (WMI classes)](https://developers.hp.com/hp-client-management/doc/understanding-hp-bios-settings)
- [HP Developer Portal – CMSL FAQ (manual/offline install)](https://developers.hp.com/hp-client-management/doc/faq)
- [HP Developer Portal Blog – Managing battery health settings with MEM and HPCMSL](https://developers.hp.com/hp-client-management/blog/managing-battery-health-settings-microsoft-endpoint-manager-and-hp-client-management-script-library-hpcmsl)
- [HP Developer Portal Blog – Improving Battery Health with Battery Health Manager](https://developers.hp.com/hp-client-management/blog/improving-battery-health-battery-health-manager-upd-10122020)
- [HP Developer Portal Blog – Secure BIOS with HP Sure Admin and CMSL](https://developers.hp.com/hp-client-management/blog/secure-bios-hp-sure-admin-and-cmsl)
- [HP Developer Portal Blog – HP Sure Admin step-by-step](https://developers.hp.com/hp-client-management/blog/hp-sure-admin-step-step)
- [PowerShell Gallery – HPCMSL package](https://www.powershellgallery.com/packages/HPCMSL)
- [PowerShell Gallery – HP.ClientManagement module](https://www.powershellgallery.com/packages/HP.ClientManagement)
- [HP Support Community – Help to edit Biossettings with HP-CMSL](https://h30434.www3.hp.com/t5/Business-PCs-Workstations-and-Point-of-Sale-Systems/Help-to-edit-Biossettings-with-HP-CMSL/td-p/8463244)
- [HP Support Community – URGENT: 4-Month Struggle to Enable TPM 2.0 on HP ProBook 450 G8](https://h30434.www3.hp.com/t5/Business-Notebooks/URGENT-4-Month-Struggle-to-Enable-TPM-2-0-on-HP-ProBook-450/td-p/9502817)
- [HP Support Community – Assistance with SPM Provisioning](https://h30434.www3.hp.com/t5/Notebook-Software-and-How-To-Questions/Assistance-with-SPM-Secure-Platform-Module-Provisioning-on/td-p/9439343)
- [HP Support Community – Get/Set HP BIOS with PowerShell](https://h30434.www3.hp.com/t5/Desktops-Archive-Read-Only/Get-Set-HP-BIOS-with-PowerShell/td-p/5070126)
- [HP Support Community – bios access, f10 doesn't work](https://h30434.www3.hp.com/t5/Business-PCs-Workstations-and-Point-of-Sale-Systems/Re-bios-access-f10-doesn-t-work/td-p/6073886)
- [HP.com Tech Takes – How to Enter BIOS Setup on Windows PCs](https://www.hp.com/us-en/tech-takes/software/how-to/how-to-enter-bios-setup-windows-pcs.html)
- [HP PC Commercial BIOS (UEFI) Setup whitepaper (current edition)](https://h10032.www1.hp.com/ctg/Manual/c06696065.pdf)
- [HP PC Commercial BIOS (UEFI) Setup whitepaper (earlier edition)](https://h10032.www1.hp.com/ctg/Manual/c05166986.pdf)
- [HP PC Commercial BIOS (UEFI) Setup whitepaper (FTP mirror)](https://ftp.hp.com/pub/caps-softpaq/cmit/whitepapers/HPBIOSSetup.pdf)
- [HP Z Workstation Commercial BIOS (UEFI) Setup Administration Guide](https://h20195.www2.hp.com/v2/GetDocument.aspx?docname=4AA8-5191ENW)
- [HP EliteBook Maintenance & Service Guide](https://h10032.www1.hp.com/ctg/Manual/c02441315.pdf)
- [HP Computer Setup manual](https://h10032.www1.hp.com/ctg/Manual/c01737395.pdf)
- [HP notebook BIOS setup information and menu options (mirrored copy)](https://www.scribd.com/document/888511981/59-HP-BIOS)
- [HP Wolf Security User Guide – enabling virtualization](https://hpwolfsecurity-help.hpwolf.com/console/11.0/en/help.html)
- [Stack Overflow – HP BIOS Battery Health Settings (confirms CMSL is not native to Windows)](https://stackoverflow.com/questions/66335769/hp-bios-battery-health-settings)
- [Reddit r/SCCM – Set SecureBoot via HPCMSL Error Not Supported](https://www.reddit.com/r/SCCM/comments/1nd8iez/set_secureboot_via_hpcmsl_error_not_supported/)
- [Recast Software – HP Client Management Script Library via PowerShell](https://www.recastsoftware.com/resources/hp-management-via-powershell/)
- [Jon's Notes – HP BIOS Settings Management (HPCMSL)](https://www.configjon.com/hp-bios-settings-management-hpcmsl/)
- [garytown.com – HP BCU to HP CMSL (WMI class mapping)](https://garytown.com/hp-bcu-to-hp-cmsl)
- [Techuisitive – Manage BIOS Settings with HP CMSL](https://techuisitive.com/manage-bios-settings-with-hp-cmsl/)
- [Windows OS Hub – How to View and Change BIOS Settings with PowerShell](https://woshub.com/powershell-view-change-bios-settings/)
