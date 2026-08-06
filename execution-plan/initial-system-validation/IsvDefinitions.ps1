#Requires -Version 5.1
<#
.SYNOPSIS
    Shared data definitions for the Initial System Validation (ISV) PowerShell
    toolchain -- dot-sourced by both Invoke-ISVCollection.ps1 (runs the checks
    for real) and New-ISVReport.ps1 (renders the HTML report + BIOS guides).

.DESCRIPTION
    This is the single source of truth for: the 41 checklist items across 9
    sections, the System Identification field list, the Active Directory
    group-name-resolution appendix, and the Dell/HP BIOS vendor reference
    content. Neither consuming script invents its own item text -- they only
    read what's defined here.

    Native Windows tools, PowerShell built-ins, and Sysinternals are used
    throughout; no third-party scanner/agent is required for any check here.
    Where a check has both an automated and a manual/physical-console path
    (the air-gapped dual-path standard used across this repo), the automated
    path lives here as the executed Command, and the manual fallback lives in
    the companion Dell/HP BIOS Reference Guides (BIOS items) or directly in
    an item's Req/manual guidance text (all other sections).

    Every `Command` is executed live by Invoke-ISVCollection.ps1 unless
    -SampleMode is used. `Evaluate`, where present, is a scriptblock that
    receives the raw output objects and raw output text and returns one of
    PASS / FAIL / N/A. Items with no Evaluate scriptblock always resolve to
    MANUAL -- either because the requirement is inherently a human judgment
    call (approved-list membership, ACL-vs-baseline comparison, physical
    port inspection) or because it is a pure inventory capture with no
    pass/fail criterion.
#>

Set-StrictMode -Version Latest

$Script:ReportTitle = 'Initial System Validation Report'
$Script:ToolName    = 'initial-system-validation (PowerShell collector/renderer)'
$Script:ToolVersion = 'v1.0-powershell'

# ---------------------------------------------------------------------------
# System Identification -- label -> source spec.
#   'auto:<Key>'   collected live via CIM in Invoke-ISVCollection.ps1
#   'manual:<Key>' supplied as a parameter to Invoke-ISVCollection.ps1;
#                  falls back to a clearly marked placeholder if omitted,
#                  since these are program-specific/site-specific facts no
#                  OS query can answer.
# ---------------------------------------------------------------------------
$Script:SystemIdentificationFields = [ordered]@{
    'Area / Location'                                            = 'manual:AreaLocation'
    'Program'                                                     = 'manual:Program'
    'CSU Inspector'                                               = 'manual:Inspector'
    'Asset Tag Number (TAG#)'                                     = 'manual:AssetTag'
    'Make / Model'                                                = 'auto:MakeModel'
    'Security Content Automation Protocol (SCAP) Score'           = 'manual:ScapScore'
    'Processor (CPU) Serial Number (SN)'                          = 'auto:CpuSerial'
    'Gigabytes (GB) Memory (RAM)'                                 = 'auto:RamGb'
    'Multiple Hard Drives (HD) (Y/N)'                             = 'auto:MultipleHd'
}

# Per-drive fields are NOT in the table above -- a system can have more than
# one physical drive, and each drive gets its own row (with its own DCN) in
# the dedicated Hard Drives table instead of a fixed Hd0/Hd1/... field list.
# See $DriveFields below for that table's column definitions, and
# Invoke-ISVCollection.ps1's disk-inventory step for how the `drives` array
# in evidence.json is built (auto-detected Index/Make/Model/CapacityGb/Serial
# via CIM, plus an operator-supplied Dcn captured per drive after detection).
$Script:DriveFields = [ordered]@{
    'Index'                    = 'Index'
    'Make'                     = 'Make'
    'Model'                    = 'Model'
    'Capacity (GB)'            = 'CapacityGb'
    'Serial Number (SN)'       = 'Serial'
    'DCN'                      = 'Dcn'
}

# CSU (undefined site-specific abbreviation, see -Program) and DCN
# (per-drive control number, see the Hard Drives table) conventions used to
# be explained in an on-report Notes paragraph. Removed from the rendered
# report per operator request -- this comment preserves the context for
# future maintainers only; $Script:ReportNotes intentionally no longer
# exists, so New-ISVReport.ps1's notes block renders empty.

# ---------------------------------------------------------------------------
# Section / item definitions
# ---------------------------------------------------------------------------
$Script:Sections = @(
    @{
        Title = '0. Extended Asset Inventory'
        Note  = 'Inventory collection uses only native Windows PowerShell, WMI, CIM, and built-in cmdlets. It deliberately records equipment identifiers and configuration only; network addressing identifiers are not collected or displayed.'
        Items = @(
            @{ Id='0.A'; Req='Memory (RAM): record each installed module''s device locator, Serial Number (SN), capacity, and manufacturer.'; Method='Native -- PowerShell CIM'; Command='Get-CimInstance -ClassName Win32_PhysicalMemory | Select-Object DeviceLocator,SerialNumber,Capacity,Manufacturer | Format-Table -AutoSize | Out-String -Width 200' }
            @{ Id='0.B'; Req='Motherboard: record manufacturer, product, and Serial Number (SN).'; Method='Native -- PowerShell CIM'; Command='Get-CimInstance -ClassName Win32_BaseBoard | Select-Object Manufacturer,Product,SerialNumber | Format-Table -AutoSize | Out-String -Width 200' }
            @{ Id='0.C'; Req='BIOS/firmware: record the exposed Serial Number (SN), SMBIOS BIOS version, and release date.'; Method='Native -- PowerShell CIM'; Command='Get-CimInstance -ClassName Win32_BIOS | Select-Object SerialNumber,SMBIOSBIOSVersion,ReleaseDate | Format-Table -AutoSize | Out-String -Width 200' }
            @{ Id='0.D'; Req='Hard drives (HD): record the index, model, Serial Number (SN), and size for every disk individually.'; Method='Native -- PowerShell CIM'; Command='Get-CimInstance -ClassName Win32_DiskDrive | Select-Object Index,Model,SerialNumber,Size | Format-Table -AutoSize | Out-String -Width 200' }
            @{ Id='0.E'; Req='Chassis: record the service tag/Serial Number (SN), SMBIOS asset tag, and chassis type.'; Method='Native -- PowerShell CIM'; Command='Get-CimInstance -ClassName Win32_SystemEnclosure | Select-Object SerialNumber,SMBIOSAssetTag,ChassisTypes | Format-Table -AutoSize | Out-String -Width 200' }
            @{ Id='0.F'; Req='Operating system: record full edition/caption, version, build number, and architecture.'; Method='Native -- PowerShell CIM'; Command='Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object Caption,Version,BuildNumber,OSArchitecture | Format-Table -AutoSize | Out-String -Width 200' }
            @{ Id='0.G'; Req='Processor (CPU): record model name, core count, and logical-processor count.'; Method='Native -- PowerShell CIM'; Command='Get-CimInstance -ClassName Win32_Processor | Select-Object Name,NumberOfCores,NumberOfLogicalProcessors | Format-Table -AutoSize | Out-String -Width 200' }
            @{ Id='0.H'; Req='Trusted Platform Module (TPM): record presence, readiness, enablement, and version where exposed.'; Method='Native -- PowerShell TPM cmdlet / CIM fallback'; Command='Get-Tpm | Out-String; Get-CimInstance -Namespace root\cimv2\security\microsofttpm -ClassName Win32_Tpm -ErrorAction SilentlyContinue | Out-String' }
            @{ Id='0.I'; Req='Secure Boot: record the firmware Secure Boot state.'; Method='Native -- PowerShell Secure Boot cmdlet'; Command='Confirm-SecureBootUEFI | Out-String' }
            @{ Id='0.J'; Req='System membership and physical network adapters: record joined-status (Domain vs Workgroup) only -- the actual domain/workgroup name is withheld from this report as potentially sensitive -- plus adapter name, manufacturer, and type.'; Method='Native -- PowerShell CIM'; Command='$cs = Get-CimInstance -ClassName Win32_ComputerSystem; if ($cs.PartOfDomain) { "Membership status: Domain (domain name withheld from this report)" } else { "Membership status: Workgroup (workgroup name withheld from this report)" } | Out-String -Width 200; Get-CimInstance -ClassName Win32_NetworkAdapter | Where-Object { $_.PhysicalAdapter } | Select-Object Name,Manufacturer,AdapterType | Format-Table -AutoSize | Out-String -Width 200' }
        )
    }
    @{
        Title = '1. BIOS Controls'
        Note  = 'The automated path shown per item depends on the detected BIOS vendor: Dell Command | PowerShell Provider (DCPP) on Dell systems, HP Client Management Script Library (CMSL) on HP systems. If neither vendor module is present, the item resolves to N/A here with a pointer to the physical-console fallback documented in the companion Dell BIOS Reference Guide and HP BIOS Reference Guide.'
        Items = @(
            @{ Id='1.A'; Req='Check system timezone, date, and time. Automated checks are operating-system or vendor-setting cross-checks; the inspector must also verify the firmware setup display.'; Method='Vendor BIOS provider (Dell DCPP / HP CMSL, auto-detected)'; Command='if (Get-Module -ListAvailable -Name DellBIOSProvider) { Import-Module DellBIOSProvider; Get-ChildItem DellSmbios:\ -Recurse | Where-Object Name -match "Date|Time|Zone" | Out-String } elseif (Get-Module -ListAvailable -Name HP.ClientManagement) { Import-Module HP.ClientManagement; (Get-HPBIOSSettingsList).Name | Out-String } else { throw "No BIOS vendor module detected (DellBIOSProvider / HP.ClientManagement) -- use the manual fallback in the companion BIOS Reference Guide." }' }
            @{ Id='1.B'; Req='Boot order: internal Hard Drive (HD) only. Network, USB, and removable-media boot must be disabled if present.'; Method='Vendor BIOS provider (Dell DCPP / HP CMSL, auto-detected)'; Command='if (Get-Module -ListAvailable -Name DellBIOSProvider) { Import-Module DellBIOSProvider; Get-Item DellSmbios:\BootSequence\BootList | Out-String; Get-Item DellSmbios:\BootSequence\BootSequence | Out-String } elseif (Get-Module -ListAvailable -Name HP.ClientManagement) { Import-Module HP.ClientManagement; (Get-HPBIOSSettingsList).Name | Out-String } else { throw "No BIOS vendor module detected (DellBIOSProvider / HP.ClientManagement) -- use the manual fallback in the companion BIOS Reference Guide." }' }
            @{ Id='1.C'; Req='Disable any unneeded device or ports. Verify virtualization and removable-device controls where the approved baseline requires them.'; Method='Vendor BIOS provider (Dell DCPP / HP CMSL, auto-detected)'; Command='if (Get-Module -ListAvailable -Name DellBIOSProvider) { Import-Module DellBIOSProvider; Get-ChildItem DellSmbios:\ -Recurse | Select-Object Name, CurrentValue | Format-Table -AutoSize | Out-String -Width 200 } elseif (Get-Module -ListAvailable -Name HP.ClientManagement) { Import-Module HP.ClientManagement; (Get-HPBIOSSettingsList).Name | Out-String } else { throw "No BIOS vendor module detected (DellBIOSProvider / HP.ClientManagement) -- use the manual fallback in the companion BIOS Reference Guide." }' }
            @{ Id='1.D'; Req='Password-protect the BIOS administrator/setup account with the current approved password; test access without exposing the secret in the report.'; Method='Vendor BIOS provider (Dell DCPP / HP CMSL, auto-detected)'; Command='if (Get-Module -ListAvailable -Name DellBIOSProvider) { Import-Module DellBIOSProvider; Get-Item DellSmbios:\Security\IsAdminPasswordSet | Out-String } elseif (Get-Module -ListAvailable -Name HP.ClientManagement) { Import-Module HP.ClientManagement; Get-HPBIOSSetupPasswordIsSet | Out-String } else { throw "No BIOS vendor module detected (DellBIOSProvider / HP.ClientManagement) -- use the manual fallback in the companion BIOS Reference Guide." }' }
            @{ Id='1.E'; Req='Verify the BIOS user/power-on password, if present, cannot modify BIOS settings; apply the approved read-only or no-access control without exposing the secret in the report.'; Method='Vendor BIOS provider (Dell DCPP / HP CMSL, auto-detected)'; Command='if (Get-Module -ListAvailable -Name DellBIOSProvider) { Import-Module DellBIOSProvider; Get-Item DellSmbios:\Security\IsSystemPasswordSet | Out-String; Get-Item DellSmbios:\Security\AdminSetupLockout | Out-String } elseif (Get-Module -ListAvailable -Name HP.ClientManagement) { Import-Module HP.ClientManagement; Get-HPBIOSPowerOnPasswordIsSet | Out-String } else { throw "No BIOS vendor module detected (DellBIOSProvider / HP.ClientManagement) -- use the manual fallback in the companion BIOS Reference Guide." }' }
        )
    }
    @{
        Title = '2. Services'
        Note  = 'Verified natively via PowerShell Get-Service -- no vendor tooling or network access required. The source checklist frames this as one consolidated instruction covering 45 named services (services.msc equivalent), each of which should be Disabled/Stopped if present, or N/A if the service does not exist on this Windows edition.'
        Items = @(
            @{
                Id  = '2.A'
                Req = 'Un-needed services: verify each of the 45 listed services (AllJoyn Router Service, Auto Time Zone Updater, Bluetooth Handsfree Service, Bluetooth Support Service, dmwappushsvc, Downloaded Maps Manager, Fax, Geolocation Service, HomeGroup Listener, HomeGroup Provider, HV Host Service, Infrared Monitor Service, Internet Connection Sharing (ICS), Microsoft Software Shadow Copy Provider, Peer Name Resolution Protocol, Peer Networking Grouping, Peer Networking Identity Manager, Phone Service, PNRP Machine Name Publication Service, Radio Management Service, Remote Access Auto Connection Manager, Remote Access Connection Manager, Remote Access Management Service, Retail Demo Service, SNMP Trap, SSDP Discovery, Wallet Service, Wi-Fi Direct Services Connection Manager Service, Windows Backup, Windows Camera Frame Server, Windows Connect Now - Config Registrar, Windows Insider Service, Windows Media Player Network Sharing Service, Windows Mobile Hotspot Service, Windows Perception Service, Windows PushToInstall Service, Windows Store Install Service, WLAN AutoConfig, Work Folders, WWAN AutoConfig, Xbox Accessory Management Service, Xbox Game Monitoring, Xbox Live Auth Manager, Xbox Live Game Save, Xbox Live Networking Service) is set to Startup Type Disabled and Status Stopped; mark N/A for any service not present on this Windows edition. Xbox Game Monitoring may be set to Manual if it cannot be Disabled.'
                Method = 'Native -- PowerShell Get-Service'
                Command = '$targets = @(''AllJoyn Router Service'',''Auto Time Zone Updater'',''Bluetooth Handsfree Service'',''Bluetooth Support Service'',''dmwappushsvc'',''Downloaded Maps Manager'',''Fax'',''Geolocation Service'',''HomeGroup Listener'',''HomeGroup Provider'',''HV Host Service'',''Infrared Monitor Service'',''Internet Connection Sharing (ICS)'',''Microsoft Software Shadow Copy Provider'',''Peer Name Resolution Protocol'',''Peer Networking Grouping'',''Peer Networking Identity Manager'',''Phone Service'',''PNRP Machine Name Publication Service'',''Radio Management Service'',''Remote Access Auto Connection Manager'',''Remote Access Connection Manager'',''Remote Access Management Service'',''Retail Demo Service'',''SNMP Trap'',''SSDP Discovery'',''Wallet Service'',''Wi-Fi Direct Services Connection Manager Service'',''Windows Backup'',''Windows Camera Frame Server'',''Windows Connect Now - Config Registrar'',''Windows Insider Service'',''Windows Media Player Network Sharing Service'',''Windows Mobile Hotspot Service'',''Windows Perception Service'',''Windows PushToInstall Service'',''Windows Store Install Service'',''WLAN AutoConfig'',''Work Folders'',''WWAN AutoConfig'',''Xbox Accessory Management Service'',''Xbox Game Monitoring'',''Xbox Live Auth Manager'',''Xbox Live Game Save'',''Xbox Live Networking Service'')
Get-Service | Where-Object { $targets -contains $_.DisplayName } | Select-Object DisplayName,Name,Status,StartType'
                Evaluate = {
                    param($Objects, $Text)
                    if (-not $Objects -or @($Objects).Count -eq 0) { return 'N/A' }
                    $violators = @($Objects) | Where-Object {
                        -not (
                            ($_.Status -eq 'Stopped' -and $_.StartType -eq 'Disabled') -or
                            ($_.DisplayName -eq 'Xbox Game Monitoring' -and $_.StartType -in @('Disabled','Manual'))
                        )
                    }
                    if (@($violators).Count -eq 0) { 'PASS' } else { 'FAIL' }
                }
            }
        )
    }
    @{
        Title = '3. Screen Saver'
        Note  = 'Verified natively via registry policy keys -- reflects the effective Group Policy state (HKCU Policies hive), matching what gpedit.msc/Local Computer Policy would show.'
        Items = @(
            @{ Id='3.A'; Req='Enable screen saver: ENABLED'; Method='Native -- reg query (Group Policy hive)'; Command='reg query "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v ScreenSaveActive'
               Evaluate = { param($Objects,$Text) if ($Text -match '(?m)REG_SZ\s+0*1\s*$') { 'PASS' } elseif ($Text -match 'ERROR') { 'FAIL' } else { 'FAIL' } } }
            @{ Id='3.B'; Req='Prevent changing screen saver: ENABLED'; Method='Native -- reg query (Group Policy hive)'; Command='reg query "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v NoDispScrSavPage'
               Evaluate = { param($Objects,$Text) if ($Text -match '(?m)REG_SZ\s+0*1\s*$') { 'PASS' } else { 'FAIL' } } }
            @{ Id='3.C'; Req='Password-protect the screen saver: ENABLED'; Method='Native -- reg query (Group Policy hive)'; Command='reg query "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v ScreenSaverIsSecure'
               Evaluate = { param($Objects,$Text) if ($Text -match '(?m)REG_SZ\s+0*1\s*$') { 'PASS' } else { 'FAIL' } } }
            @{ Id='3.D'; Req='Screen saver timeout: ENABLED -- 15 minutes (900 seconds)'; Method='Native -- reg query (Group Policy hive)'; Command='reg query "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v ScreenSaveTimeOut'
               Evaluate = {
                   param($Objects,$Text)
                   if ($Text -match 'REG_SZ\s+(\d+)') {
                       if ([int]$Matches[1] -eq 900) { 'PASS' } else { 'FAIL' }
                   } else { 'N/A' }
               } }
            @{ Id='3.E'; Req='Force specific screen saver: approved screen saver path exists.'; Method='Native -- reg query + Test-Path'; Command='reg query "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v SCRNSAVE.EXE; Test-Path ''C:\Windows\system32\Mystify.scr'''
               Evaluate = { param($Objects,$Text) if ($Text -match 'Mystify\.scr' -and $Text -match '(?m)^\s*True\s*$') { 'PASS' } else { 'FAIL' } } }
        )
    }
    @{
        Title = '4. General Policy'
        Note  = 'Log size/retention verified natively via Get-WinEvent -ListLog (no third-party tool needed). The Games check requires a per-title determination the inspector confirms manually. The audit-retention item (4.D) resolves to MANUAL because the correct expected LogMode depends on which air-gapped dual-path branch (SPLUNK-enabled vs. non-SPLUNK-enabled forwarding -- see MRC-006/011/014/017/022) applies to this environment; that is an environment fact, not something derivable from the log configuration alone.'
        Items = @(
            @{ Id='4.A'; Req='Application event log max size >= 81920 KB'; Method='Native -- PowerShell Get-WinEvent -ListLog'; Command='(Get-WinEvent -ListLog Application).MaximumSizeInBytes / 1KB'
               Evaluate = { param($Objects,$Text) if ($Text -match '(-?[\d.]+)') { if ([double]$Matches[1] -ge 81920) { 'PASS' } else { 'FAIL' } } else { 'N/A' } } }
            @{ Id='4.B'; Req='Security event log max size >= 5120000 KB'; Method='Native -- PowerShell Get-WinEvent -ListLog'; Command='(Get-WinEvent -ListLog Security).MaximumSizeInBytes / 1KB'
               Evaluate = { param($Objects,$Text) if ($Text -match '(-?[\d.]+)') { if ([double]$Matches[1] -ge 5120000) { 'PASS' } else { 'FAIL' } } else { 'N/A' } } }
            @{ Id='4.C'; Req='System event log max size >= 81920 KB'; Method='Native -- PowerShell Get-WinEvent -ListLog'; Command='(Get-WinEvent -ListLog System).MaximumSizeInBytes / 1KB'
               Evaluate = { param($Objects,$Text) if ($Text -match '(-?[\d.]+)') { if ([double]$Matches[1] -ge 81920) { 'PASS' } else { 'FAIL' } } else { 'N/A' } } }
            @{ Id='4.D'; Req='Audit retention setting matches SPLUNK-enabled / non-SPLUNK-enabled branch (both connected and disconnected forwarding paths apply per the air-gapped dual-path standard -- see MRC-006/011/014/017/022 for the Splunk forwarding connected/offline caveats already documented in the JSIG playbook). Applicability is determined by checking whether a Splunk Universal Forwarder is installed AND actively reporting (established connection on the standard forwarder-to-indexer port), not by assumption.'; Method='Native -- PowerShell Get-WinEvent -ListLog (LogMode property), plus Get-Service/Get-NetTCPConnection to detect an installed and actively-reporting Splunk Universal Forwarder (TCP 9997 is the default Splunk-to-indexer data channel)'; Command='(Get-WinEvent -ListLog Application,Security,System) | Select-Object LogName,LogMode | Format-Table -AutoSize | Out-String
$splunkSvc = Get-Service -Name ''SplunkForwarder'' -ErrorAction SilentlyContinue
if ($splunkSvc) { "Splunk Universal Forwarder service: $($splunkSvc.Status) (StartType: $($splunkSvc.StartType))" } else { "Splunk Universal Forwarder service: NOT INSTALLED" }
$splunkConns = @(Get-NetTCPConnection -State Established -ErrorAction SilentlyContinue | Where-Object { $_.RemotePort -eq 9997 -or $_.LocalPort -eq 9997 })
if ($splunkConns.Count -gt 0) { $splunkConns | Select-Object LocalAddress,LocalPort,RemoteAddress,RemotePort,State | Format-Table -AutoSize | Out-String } else { "No established TCP connection on the default Splunk forwarding port (9997) detected -- this host may not currently be reporting to a Splunk indexer, or uses a non-default port/receiver configuration." }' }
            @{ Id='4.E'; Req='Windows games removed/uninstalled'; Method='Manual -- Control Panel > Turn Windows features on/off, cross-checked with Get-AppxPackage'; Command='Get-AppxPackage -AllUsers | Where-Object Name -like ''*Microsoft.*Game*'' | Select-Object Name | Out-String' }
        )
    }
    @{
        Title = '5. Accounts'
        Note  = 'Verified natively via Get-LocalUser / Get-LocalGroupMember (Microsoft.PowerShell.LocalAccounts module, built into Windows) -- no third-party tool required. For domain-joined systems, see the companion Active Directory query path in the report appendix, which allows the operator to resolve group names that differ from this checklist''s examples (e.g. "Server Admins" vs. an environment''s actual "Tier-1-Admins" group). Membership-against-approved-list items (5.H_L, 5.Y_AB) resolve to MANUAL because the approved-account list is environment-specific configuration, not something this script can validate without it.'
        Items = @(
            @{ Id='5.B'; Req='ADMINISTRATOR (local) -- Password Never Expires unchecked'; Method='Native -- PowerShell Get-LocalUser'; Command='Get-LocalUser -Name ''Administrator'' | Select-Object Name, PasswordExpires, Enabled'
               Evaluate = { param($Objects,$Text) if ($Objects -and $Objects.PasswordExpires) { 'PASS' } else { 'FAIL' } } }
            @{ Id='5.C'; Req='SDC_Admin (built-in vendor admin account) Disabled'; Method='Native -- PowerShell Get-LocalUser'; Command='Get-LocalUser -Name ''SDC_Admin'' | Select-Object Name, Enabled'
               Evaluate = { param($Objects,$Text) if ($Objects -and $Objects.Enabled -eq $false) { 'PASS' } else { 'FAIL' } } }
            @{ Id='5.D'; Req='Default Account (Win10/11 built-in) Disabled'; Method='Native -- PowerShell Get-LocalUser'; Command='Get-LocalUser -Name ''DefaultAccount'' | Select-Object Name, Enabled'
               Evaluate = { param($Objects,$Text) if ($Objects -and $Objects.Enabled -eq $false) { 'PASS' } else { 'FAIL' } } }
            @{ Id='5.E'; Req='Guest account Disabled'; Method='Native -- PowerShell Get-LocalUser'; Command='Get-LocalUser -Name ''Guest'' | Select-Object Name, Enabled'
               Evaluate = { param($Objects,$Text) if ($Objects -and $Objects.Enabled -eq $false) { 'PASS' } else { 'FAIL' } } }
            @{ Id='5.F'; Req='WDAGUtilityAccount (Windows Defender) Disabled'; Method='Native -- PowerShell Get-LocalUser'; Command='Get-LocalUser -Name ''WDAGUtilityAccount'' | Select-Object Name, Enabled'
               Evaluate = { param($Objects,$Text) if ($Objects -and $Objects.Enabled -eq $false) { 'PASS' } else { 'FAIL' } } }
            @{ Id='5.H_L'; Req='Local Administrators group -- membership limited to approved accounts'; Method='Native -- PowerShell Get-LocalGroupMember'; Command='Get-LocalGroupMember -Group ''Administrators'' | Select-Object Name, ObjectClass | Format-Table -AutoSize | Out-String' }
            @{ Id='5.M_X'; Req='Sensitive built-in local groups (Backup Operators, Cryptographic Operators, Power Users, etc.) verified empty'; Method='Native -- PowerShell Get-LocalGroupMember'; Command='''Backup Operators'',''Cryptographic Operators'',''Power Users'',''Remote Management Users'' | ForEach-Object { $g = $_; Get-LocalGroupMember -Group $g -ErrorAction SilentlyContinue | Select-Object @{n=''Group'';e={$g}}, Name, ObjectClass }'
               Evaluate = { param($Objects,$Text) if (-not $Objects -or @($Objects).Count -eq 0) { 'PASS' } else { 'FAIL' } } }
            @{ Id='5.Y_AB'; Req='Users group contains only the approved entries (Authenticated Users, Interactive, Domain Users, Network Engineers)'; Method='Native -- PowerShell Get-LocalGroupMember, cross-referenced with Active Directory (see appendix query below for environments where the group''s real name differs)'; Command='Get-LocalGroupMember -Group ''Users'' | Select-Object Name, ObjectClass | Format-Table -AutoSize | Out-String' }
        )
    }
    @{
        Title = '6. Anti-Virus Definitions'
        Note  = 'Checks BOTH a Trellix/McAfee legacy registry path (VirusScan Enterprise / older-generation ENS) AND Windows Defender (Get-MpComputerStatus) -- whichever is present on this endpoint. KNOWN LIMITATION: modern ePO-managed McAfee/Trellix Endpoint Security (ENS) reportedly does not expose the DAT date locally at all in most configurations -- it lives only in the ePO database (EPOLeafNode/AM_CustomProps.AMCoreContentDate), which this script cannot reach (see https://www.reddit.com/r/sysadmin/comments/816c51/mcafee_endpoint_security_platform_dat_date/). If neither source yields a date, this resolves to N/A with that limitation noted rather than a false PASS/FAIL -- confirm ePO-managed DAT currency directly in the ePO console.'
        Items = @(
            @{
                Id  = '6'
                Req = 'Anti-virus signature file current within 30 days (checks McAfee/Trellix legacy registry state, then falls back to Windows Defender)'
                Method = 'Native -- PowerShell reg query against the local AV engine''s registry state (Trellix/McAfee legacy: HKLM\SOFTWARE\WOW6432Node\McAfee\AVEngine), falling back to Get-MpComputerStatus (Windows Defender, see https://learn.microsoft.com/en-us/powershell/module/defender/get-mpcomputerstatus) if the McAfee path is absent'
                Command = '$mcafeeKey = ''HKLM:\SOFTWARE\WOW6432Node\McAfee\AVEngine''
if (Test-Path $mcafeeKey) {
    $dat = (Get-ItemProperty -Path $mcafeeKey -Name AVDatDate -ErrorAction Stop).AVDatDate
    "Source: McAfee/Trellix legacy AVEngine registry`nAVDatDate: $dat"
} else {
    try {
        $mp = Get-MpComputerStatus -ErrorAction Stop
        "Source: Windows Defender (Get-MpComputerStatus)`nAntivirusEnabled: $($mp.AntivirusEnabled)`nAntivirusSignatureLastUpdated: $($mp.AntivirusSignatureLastUpdated)"
    } catch {
        "N/A -- neither the McAfee/Trellix legacy registry key nor Get-MpComputerStatus (Windows Defender) is present/available on this host. If this endpoint runs modern ePO-managed McAfee/Trellix ENS, its DAT date is likely only queryable from the ePO console/database, not locally -- verify there instead."
    }
}'
                Evaluate = {
                    param($Objects, $Text)
                    $raw = $Text
                    if ($Text -match '(?m)^AVDatDate:\s*(.+)$') { $raw = $Matches[1] }
                    elseif ($Text -match '(?m)^AntivirusSignatureLastUpdated:\s*(.+)$') { $raw = $Matches[1] }
                    else { $raw = ($Text -replace '(?m)^.*AVDatDate.*$','').Trim(); if ([string]::IsNullOrWhiteSpace($raw)) { $raw = $Text.Trim() } }
                    $parsed = $null
                    if ([DateTime]::TryParse($raw, [ref]$parsed)) {
                        $age = (Get-Date) - $parsed
                        if ($age.TotalDays -le 30) { 'PASS' } else { 'FAIL' }
                    } else {
                        'N/A'
                    }
                }
            }
        )
    }
    @{
        Title = '7. Permissions and Security-Relevant Object (SRO) Policy'
        Note  = 'Verified natively via icacls (built into Windows) -- no third-party tool required. Showing 5 of the 16 lettered checklist items to demonstrate the evidence pattern; the full script enumerates all of them identically. These resolve to MANUAL because comparing an arbitrary ACL string against a site''s approved baseline is a judgment call this script does not attempt to automate blindly -- the inspector reviews the captured icacls output against the approved baseline for this asset.'
        Items = @(
            @{ Id='7.B'; Req='C:\Audit_logs -- Auditors: Full Control (or SPLUNK-branch handling)'; Method='Native -- icacls'; Command='icacls C:\Audit_logs' }
            @{ Id='7.D'; Req='C:\Windows\INF\USBSTOR.INF -- Administrators: Read/Execute only'; Method='Native -- icacls'; Command='icacls C:\Windows\INF\USBSTOR.INF' }
            @{ Id='7.F'; Req='C:\Windows\regedit.exe -- ACL matches specified vendor baseline'; Method='Native -- icacls'; Command='icacls C:\Windows\regedit.exe' }
            @{ Id='7.H'; Req='C:\Windows\System32\Eventvwr.exe -- Auditors: Full Control added'; Method='Native -- icacls'; Command='icacls C:\Windows\System32\Eventvwr.exe' }
            @{ Id='7.L'; Req='C:\Program Files\Common Files\McAfee -- ACL matches specified vendor baseline'; Method='Native -- icacls'; Command='icacls "C:\Program Files\Common Files\McAfee"' }
        )
    }
    @{
        Title = 'General Security'
        Note  = 'Physical port removal cannot be confirmed by any OS-level tool.'
        Items = @(
            @{ Id='Final'; Req='Remove/disable all writable media devices unless documented DTA exception exists'; Method='Manual -- physical inspection, cross-checked with Device Manager'; Command='Get-PnpDevice -Class DiskDrive,USB | Select-Object FriendlyName, Status | Format-Table -AutoSize | Out-String -Width 200' }
        )
    }
)

# ---------------------------------------------------------------------------
# Appendix: AD group-name-resolution helper referenced from Section 5.
# ---------------------------------------------------------------------------
$Script:AdQueryAppendix = @{
    Title  = 'Appendix A -- Active Directory Group Name Resolution (Interactive Query)'
    Body   = 'Checklist items in Section 5 name groups generically ("Domain Admins", "Server Admins", "Workstation Administration", "Network Engineers"). Real environments frequently use different actual group names for the same role. Rather than hardcode exact names, resolve each role through a small per-environment config file (a starter template is checked into this repo at execution-plan/initial-system-validation/ad-group-map.example.json -- copy it, edit the mappings for your domain, and rename it e.g. ad-group-map.json), with an Active Directory search fallback when a configured name isn''t found:'
    ConfigExample = '# ad-group-map.json (copy from the checked-in ad-group-map.example.json template in this folder, then edit per-environment)
{
  "Domain Admins": ["Domain Admins"],
  "Server Admins": ["Server Admins", "Tier-1-Admins"],
  "Workstation Administration": ["Workstation Administration", "WKSTN-Admins"],
  "Network Engineers": ["Network Engineers", "NetEng"]
}'
    Command = '# Native -- PowerShell ActiveDirectory module (RSAT)
Get-ADGroup -Filter "Name -like ''*Admin*''" | Select-Object Name, DistinguishedName

# If a configured name in ad-group-map.json isn''t found on this domain,
# fall back to this wildcard search, prompt the operator to pick the
# correct match, then offer to save it back to the config file for
# future runs on the same domain.'
    EvidenceExample = 'Name                        DistinguishedName
----                        -----------------
Domain Admins               CN=Domain Admins,CN=Users,DC=contoso,DC=local
Tier-1-Admins               OU=Groups,DC=contoso,DC=local
NOTE: "Server Admins" not found verbatim -- "Tier-1-Admins" offered as the closest match and confirmed by the operator.'
}

# ---------------------------------------------------------------------------
# BIOS vendor reference content (Dell / HP) -- used by New-ISVReport.ps1 to
# render the two standalone companion guides. Unchanged in substance from
# the prior mockup; ported verbatim into PowerShell data structures.
# ---------------------------------------------------------------------------
$Script:BiosDellReference = @(
    @{ Id='1.A'; Req='Check system timezone, date, and time. Automated checks are operating-system or vendor-setting cross-checks; the inspector must also verify the firmware setup display.'
       Automated=@{ Label='Dell Command | PowerShell Provider (DCPP)'; Method='AUTOMATED'; CommandOrSteps="Import-Module DellBIOSProvider; Get-ChildItem DellSmbios:\ -Recurse | Where-Object Name -match 'Date|Time|Zone'"; Evidence='SAMPLE placeholder -- record the returned setting name and CurrentValue.'; SourceCitation='https://www.powershellgallery.com/packages/DellBIOSProvider/2.8.0/Content/en-US%5Cabout_DellBIOSProvider.help.txt' }
       Manual=@{ Label='Dell manual firmware setup'; Method='MANUAL'; CommandOrSteps='Press F2 at boot to enter Setup and verify date/time/timezone on the setup screen.'; Evidence='SAMPLE placeholder -- record the observed date/time and sign the attestation.'; SourceCitation='https://www.dell.com/support/kbdoc/en-us/000124211/dell-bios-updates' } }
    @{ Id='1.B'; Req='Boot order: internal Hard Drive (HD) only. Network, USB, and removable-media boot must be disabled if present.'
       Automated=@{ Label='Dell Command | PowerShell Provider (DCPP)'; Method='AUTOMATED'; CommandOrSteps='Import-Module DellBIOSProvider; Get-Item DellSmbios:\BootSequence\BootList; Get-Item DellSmbios:\BootSequence\BootSequence'; Evidence='SAMPLE placeholder -- record BootList/BootSequence CurrentValue and PossibleValues.'; SourceCitation='https://www.powershellgallery.com/packages/DellBIOSProvider/2.8.0/Content/en-US%5Cabout_DellBIOSProvider.help.txt' }
       Manual=@{ Label='Dell manual firmware setup'; Method='MANUAL'; CommandOrSteps='Press F2 at boot, open Boot Sequence, confirm HD-only order, and disable USB Boot Support under Integrated Devices.'; Evidence='SAMPLE placeholder -- record the approved boot sequence and USB boot state.'; SourceCitation='https://www.dell.com/support/kbdoc/en-us/000216658/how-to-enable-or-disable-usb-boot-support-for-a-dell-optiplex-3000' } }
    @{ Id='1.C'; Req='Disable any unneeded device or ports. Verify virtualization and removable-device controls where the approved baseline requires them.'
       Automated=@{ Label='Dell Command | PowerShell Provider (DCPP)'; Method='AUTOMATED'; CommandOrSteps='Import-Module DellBIOSProvider; Get-ChildItem DellSmbios:\ -Recurse | Select-Object Name, CurrentValue'; Evidence='SAMPLE placeholder -- record discovered device/port/virtualization settings vs. baseline.'; SourceCitation='https://www.dell.com/support/manuals/en-lt/command-powershell-provider/dcpp_2_8_ug/frequently-asked-questions-for-dell-command-powershell-provider-280?guid=guid-d1dc47b8-e30c-41b4-9cc9-268c89a40ed1&lang=en-us' }
       Manual=@{ Label='Dell manual firmware setup'; Method='MANUAL'; CommandOrSteps='Press F2 at boot; review Integrated Devices for port/device controls and Virtualization Support for virtualization.'; Evidence='SAMPLE placeholder -- record each disabled or approved device/port control.'; SourceCitation='https://www.dell.com/support/manuals/en-us/optiplex-7460-aio/optiplex_7460_setup_specs/entering-bios-setup-program?guid=guid-1432a924-49e9-4080-961d-2afbdaf42039&lang=en-us&lang=en-us' } }
    @{ Id='1.D'; Req='Password-protect the BIOS administrator/setup account with the current approved password; test access without exposing the secret in the report.'
       Automated=@{ Label='Dell Command | PowerShell Provider (DCPP)'; Method='AUTOMATED'; CommandOrSteps='Import-Module DellBIOSProvider; Get-Item DellSmbios:\Security\IsAdminPasswordSet'; Evidence='SAMPLE placeholder -- record only the password-set state and access-test attestation, never a password.'; SourceCitation='https://www.dell.com/support/kbdoc/en-us/000146358/dell-command-powershell-provider-bios-passwords-feature'; Caution='Never hardcode or paste BIOS passwords in plaintext; use SecureString/PSCredential input if setting one.' }
       Manual=@{ Label='Dell manual firmware setup'; Method='MANUAL'; CommandOrSteps='Press F2 at boot; in Security > Admin Password, confirm a password is set and test that Setup is protected.'; Evidence='SAMPLE placeholder -- record password-set state and access-test result only.'; SourceCitation='https://www.dell.com/support/kbdoc/en-us/000219905/how-to-set-a-bios-admin-password-on-a-dell-computer'; Caution='Never hardcode or paste BIOS passwords in plaintext; use SecureString/PSCredential input if setting one.' } }
    @{ Id='1.E'; Req='Verify the BIOS user/power-on password, if present, cannot modify BIOS settings; apply the approved read-only or no-access control without exposing the secret in the report.'
       Automated=@{ Label='Dell Command | PowerShell Provider (DCPP)'; Method='AUTOMATED'; CommandOrSteps='Import-Module DellBIOSProvider; Get-Item DellSmbios:\Security\IsSystemPasswordSet; Get-Item DellSmbios:\Security\AdminSetupLockout'; Evidence='SAMPLE placeholder -- record state values and the user-access test attestation, never a password.'; SourceCitation='https://www.dell.com/support/kbdoc/en-us/000146358/dell-command-powershell-provider-bios-passwords-feature'; Caution='Never hardcode or paste BIOS passwords in plaintext; use SecureString/PSCredential input if setting one.' }
       Manual=@{ Label='Dell manual firmware setup'; Method='MANUAL'; CommandOrSteps='Press F2 at boot; in Security, confirm the power-on/user password cannot modify BIOS settings, and test.'; Evidence='SAMPLE placeholder -- record state and no-modification test result only, never a password.'; SourceCitation='https://www.dell.com/support/kbdoc/en-us/000219905/how-to-set-a-bios-admin-password-on-a-dell-computer'; Caution='Never hardcode or paste BIOS passwords in plaintext; use SecureString/PSCredential input if setting one.' } }
)

$Script:BiosHpReference = @(
    @{ Id='1.A'; Req='Check system timezone, date, and time. Automated checks are operating-system or vendor-setting cross-checks; the inspector must also verify the firmware setup display.'
       Automated=@{ Label='HP Client Management Script Library (CMSL) setting discovery'; Method='AUTOMATED'; CommandOrSteps="Import-Module HP.ClientManagement; (Get-HPBIOSSettingsList).Name; Get-HPBIOSSettingValue -Name '<exact date/time setting name discovered on this device>'`nHP publishes generic setting accessors, not a universal date/time setting-name string; discover the exact name first."; Evidence='SAMPLE placeholder -- retain the discovered setting name, returned value, and setup-screen attestation.'; SourceCitation='https://developers.hp.com/hp-client-management/doc/get-hpbiossettingslist' }
       Manual=@{ Label='HP manual firmware setup'; Method='MANUAL'; CommandOrSteps='At startup, press ESC and then F10 to enter BIOS Setup. Verify date/time fields on the specific model. Current 2015-onward systems use Main/Security/Advanced/UEFI Drivers tabs; pre-2015 systems use a different File/Security/Diagnostics/System Configuration structure, with incremental menu changes continuing through 2024-2026.'; Evidence='SAMPLE placeholder -- inspector records the firmware date/time observed and signs the attestation.'; SourceCitation='https://h10032.www1.hp.com/ctg/Manual/c06696065.pdf' } }
    @{ Id='1.B'; Req='Boot order: internal Hard Drive (HD) only. Network, USB, and removable-media boot must be disabled if present.'
       Automated=@{ Label='HP Client Management Script Library (CMSL) boot-setting read'; Method='AUTOMATED'; CommandOrSteps="Import-Module HP.ClientManagement; (Get-HPBIOSSettingsList).Name; Get-HPBIOSSettingValue -Name '<exact discovered Boot Order or UEFI Boot Order setting name>'`nHP provides no dedicated boot-order or USB-boot cmdlet; discover the per-device setting name before querying it."; Evidence='SAMPLE placeholder -- retain the discovered boot-setting name and returned value.'; SourceCitation='https://developers.hp.com/hp-client-management/doc/bios-and-device' }
       Manual=@{ Label='HP manual firmware setup'; Method='MANUAL'; CommandOrSteps='At startup, press ESC and then F10. On typical 2015-onward commercial systems, review Advanced > Boot Options > UEFI Boot Order and uncheck Advanced > Boot Options > USB Storage Boot. Pre-2015 systems use a different menu structure; 2015-onward layouts have incremental changes through 2024-2026.'; Evidence='SAMPLE placeholder -- inspector records the approved boot order and USB Storage Boot state.'; SourceCitation='https://h10032.www1.hp.com/ctg/Manual/c06696065.pdf' } }
    @{ Id='1.C'; Req='Disable any unneeded device or ports. Verify virtualization and removable-device controls where the approved baseline requires them.'
       Automated=@{ Label='HP Client Management Script Library (CMSL) setting discovery'; Method='AUTOMATED'; CommandOrSteps="Import-Module HP.ClientManagement; (Get-HPBIOSSettingsList).Name; Get-HPBIOSSettingValue -Name '<exact discovered device, port, or virtualization setting name>'`nHP provides no dedicated TPM, Secure Boot, USB-boot, or virtualization cmdlet; use the generic setting pattern only after discovering the exact name on this device."; Evidence='SAMPLE placeholder -- retain discovered names and values for each baseline-relevant control.'; SourceCitation='https://developers.hp.com/hp-client-management/doc/get-hpbiossettingvalue' }
       Manual=@{ Label='HP manual firmware setup'; Method='MANUAL'; CommandOrSteps='At startup, press ESC and then F10. Review model-appropriate device/port settings in Main, Security, Advanced, or UEFI Drivers. Virtualization is commonly under Advanced > System Options, but HP documents that labels can vary among Security, Advanced, Configuration, or CPU Configuration. Pre-2015 layouts differ; 2015-onward layouts have incremental changes through 2024-2026.'; Evidence='SAMPLE placeholder -- inspector records each disabled or approved device/port and virtualization control.'; SourceCitation='https://h10032.www1.hp.com/ctg/Manual/c06696065.pdf' } }
    @{ Id='1.D'; Req='Password-protect the BIOS administrator/setup account with the current approved password; test access without exposing the secret in the report.'
       Automated=@{ Label='HP Client Management Script Library (CMSL) administrator-password state'; Method='AUTOMATED'; CommandOrSteps="Import-Module HP.ClientManagement; Get-HPBIOSSetupPasswordIsSet`nThis read-only state check takes no password argument. For an approved HP password-setting operation, obtain the secret with `$SecurePwd = Read-Host -Prompt 'Enter BIOS Admin Password' -AsSecureString and pass only protected credential material according to the exact HP CMSL cmdlet documentation for the target platform; do not use a literal password string."; Evidence='SAMPLE placeholder -- retain only the setup-password state and access-test attestation; never retain a password.'; SourceCitation='https://developers.hp.com/hp-client-management/doc/bios-and-device'; Caution='Do not hardcode or paste BIOS passwords in plaintext in scripts, terminal history, or evidence captures; use SecureString/PSCredential-based input.' }
       Manual=@{ Label='HP manual firmware setup'; Method='MANUAL'; CommandOrSteps='At startup, press ESC and then F10. On typical 2015-onward commercial systems use Security > Administrator Tools > Create/Change BIOS Administration Password, save, reboot, and test protected F10 Setup access. Pre-2015 layouts differ; 2015-onward layouts have incremental changes through 2024-2026.'; Evidence='SAMPLE placeholder -- inspector records only password-set state and access-test result, never the password.'; SourceCitation='https://h10032.www1.hp.com/ctg/Manual/c06696065.pdf'; Caution='Do not hardcode or paste BIOS passwords in plaintext in scripts, terminal history, or evidence captures; use SecureString/PSCredential-based input.' } }
    @{ Id='1.E'; Req='Verify the BIOS user/power-on password, if present, cannot modify BIOS settings; apply the approved read-only or no-access control without exposing the secret in the report.'
       Automated=@{ Label='HP Client Management Script Library (CMSL) power-on-password state'; Method='AUTOMATED'; CommandOrSteps="Import-Module HP.ClientManagement; Get-HPBIOSPowerOnPasswordIsSet; (Get-HPBIOSSettingsList).Name`nThis state check takes no password argument. HP provides no dedicated cmdlet for the required no-access/read-only behavior; discover model-specific controls and use protected SecureString/PSCredential input for any approved password-setting operation, never a literal password string."; Evidence='SAMPLE placeholder -- retain only power-on-password state, discovered control names, and user-access test attestation.'; SourceCitation='https://developers.hp.com/hp-client-management/doc/bios-and-device'; Caution='Do not hardcode or paste BIOS passwords in plaintext in scripts, terminal history, or evidence captures; use SecureString/PSCredential-based input.' }
       Manual=@{ Label='HP manual firmware setup'; Method='MANUAL'; CommandOrSteps="At startup, press ESC and then F10. Review Security controls and the model's power-on/password policy, then test that a user/power-on password cannot modify protected BIOS settings. Current systems use Main/Security/Advanced/UEFI Drivers tabs; pre-2015 layouts differ, and 2015-onward layouts have incremental changes through 2024-2026."; Evidence='SAMPLE placeholder -- inspector records state and no-modification test result only; never record a password.'; SourceCitation='https://h10032.www1.hp.com/ctg/Manual/c06696065.pdf'; Caution='Do not hardcode or paste BIOS passwords in plaintext in scripts, terminal history, or evidence captures; use SecureString/PSCredential-based input.' } }
)

# ---------------------------------------------------------------------------
# Vendor background/intro HTML blocks for the two BIOS reference guides.
# Ported verbatim (including citation URLs) into PowerShell here-strings.
# ---------------------------------------------------------------------------
$Script:BiosDellBackground = @'
<p><strong>What it is:</strong> Dell Command | PowerShell Provider (DCPP) is a Windows PowerShell
module ("DellBIOSProvider") that exposes Dell BIOS/UEFI configuration as a PowerShell provider drive
(<code>DellSmbios:</code>), scoped to Dell business/enterprise client systems (OptiPlex, Latitude, Precision).
DCPP is <strong>not</strong> a native Windows component -- it must be explicitly installed and imported before use
(<a class="citation" href="https://www.dell.com/support/kbdoc/en-us/000177240/dell-command-powershell-provider">Dell Command | PowerShell Provider -- Dell US</a>).</p>
<p><strong>Air-gapped / offline install path:</strong> download the module .zip from Dell's Drivers &amp; Downloads
page (Systems Management category), extract it, create a WindowsPowerShell\Modules folder under the
system's Program Files directory if it does not already exist, and copy the architecture-specific subfolder
contents into that module folder; verify with <code>Get-Module -ListAvailable</code>
(<a class="citation" href="https://www.dell.com/support/home/en-us/drivers/driversdetails?driverid=twkmg">Dell Command | PowerShell Provider Driver Details</a>).
Where PowerShell Gallery access is available instead, use <code>Install-Module -Name DellBIOSProvider</code>
(<a class="citation" href="https://www.powershellgallery.com/packages/DellBIOSProvider/2.3.0">DellBIOSProvider, PowerShell Gallery</a>).
Either way, the module must be imported into the session with <code>Import-Module DellBIOSProvider</code> before the
commands below will work.</p>
<p><strong>Two BIOS UI generations:</strong> Dell has explicitly confirmed a UI/behavior change between the classic
tab-based Setup menu and the newer tile/toggle "New Dell Branded BIOS" ("BIOS 4.0") introduced on systems released
May 2021 and later
(<a class="citation" href="https://www.dell.com/support/kbdoc/en-us/000190038/my-computer-keeps-asking-for-the-bios-password-when-booting-after-removing-a-previous-bios-password">Dell KB 000190038</a>).
An inspector auditing a fleet spanning several purchase years should expect to see either interface and should not
assume identical keystrokes or click paths across the fleet. Both use <strong>F2</strong> at the Dell logo to enter
Setup and <strong>F12</strong> for the one-time boot menu.</p>
'@

$Script:BiosHpBackground = @'
<p><strong>What it is:</strong> HP Client Management Script Library (CMSL) is a collection of
PowerShell modules published by HP for querying and changing BIOS settings on HP commercial/business client systems
(EliteDesk, ProDesk, EliteBook, ProBook). The BIOS-reading cmdlets used below live in the <code>HP.ClientManagement</code>
sub-module. CMSL is <strong>not built into Windows</strong> -- it must be explicitly installed
(<a class="citation" href="https://developers.hp.com/hp-client-management/doc/client-management-script-library">HP Developer Portal -- Client Management Script Library</a>).</p>
<p><strong>Air-gapped / offline install path:</strong> HP distributes a standalone "Library Installer" (an EXE) for
environments without PowerShell Gallery access. HP's own FAQ documents a fully offline extraction workflow:</p>
<pre class="cmd">mkdir localdir
hp-cmsl.exe /VERYSILENT /SP- /UnpackOnly="True" /DestDir="C:\localdir\hp-cmsl"
Import-Module -Force C:\localdir\hp-cmsl\modules\HP.ClientManagement\HP.ClientManagement.psd1
Get-Module -ListAvailable -Name 'HP.*'</pre>
<div class="path-meta">Source: <a class="citation" href="https://developers.hp.com/hp-client-management/doc/faq">HP Developer Portal -- CMSL FAQ</a></div>
<p style="margin-top:6px;">Where PowerShell Gallery access is available instead, use
<code>Install-Module -Name HPCMSL -Force</code>
(<a class="citation" href="https://h30434.www3.hp.com/t5/Business-Notebooks/URGENT-4-Month-Struggle-to-Enable-TPM-2-0-on-HP-ProBook-450/td-p/9502817">HP Support Community</a>).
No individual HP CMSL cmdlet returns a universal setting-name string for date/time, boot order, or device/port
controls -- run <code>(Get-HPBIOSSettingsList).Name</code> on the target device first to discover the exact setting
name before querying or setting it.</p>
<p><strong>Manual setup-menu generations:</strong> current (2015-onward) HP commercial systems use Main/Security/
Advanced/UEFI Drivers tabs reached via <strong>ESC</strong> then <strong>F10</strong> at startup; pre-2015 systems use
a different File/Security/Diagnostics/System Configuration structure, and 2015-onward layouts have had incremental
menu changes through 2024-2026. Confirm the exact tab/menu wording on the specific model before relying on the labels
below.</p>
'@
