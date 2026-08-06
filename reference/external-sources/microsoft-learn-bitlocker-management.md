# Microsoft Learn — BitLocker Status Verification: manage-bde and Get-BitLockerVolume (Excerpt)

- **Source URL:** https://learn.microsoft.com/en-us/windows/security/operating-system-security/data-protection/bitlocker/operations-guide
- **Retrieved:** 2026-08-05
- **Why included:** Supports SC-28 (Protection of Information at Rest) / CM-6 (Configuration Settings) evidence for full-disk-encryption status verification — `manage-bde -status` and `Get-BitLockerVolume` command usage/output interpretation used to confirm BitLocker encryption and protector status on managed endpoints.

> **NOTE — THIS IS AN EXCERPT, NOT THE COMPLETE DOCUMENT.** The Microsoft Learn BitLocker documentation set includes multiple full guides (Overview, Deployment Guide, Operations Guide, Countermeasures, Recovery Guide) plus separate command and PowerShell cmdlet references. Only the sections on checking BitLocker status via PowerShell and the command line are reproduced below. For the complete BitLocker documentation, see the source URLs below.

---

## Checking BitLocker Status

There are three primary ways to check the BitLocker encryption status of a volume: PowerShell, the command line (`manage-bde`), and Control Panel.

### PowerShell: Get-BitLockerVolume

```powershell
Get-BitLockerVolume C: | fl
```

Example output:
```
ComputerName          : DESKTOP-01
MountPoint            : C:
EncryptionMethod      : XtsAes128
AutoUnlockEnabled     :
LockStatus            : Unlocked
ProtectionStatus      : On
VolumeStatus          : FullyEncrypted
CapacityGB            : 254.79
VolumeType            : OperatingSystem
KeyProtector          : {TpmPin, RecoveryPassword}
EncryptionPercentage  : 100
```

Key fields for verification:
- **VolumeStatus** — `FullyEncrypted`, `FullyDecrypted`, `EncryptionInProgress`, or `DecryptionInProgress`.
- **ProtectionStatus** — `On` (protection active) or `Off` (protection suspended/disabled).
- **LockStatus** — `Unlocked` or `Locked`.
- **EncryptionPercentage** — the current percentage of the volume that is encrypted (100 indicates fully encrypted).
- **KeyProtector** — the list of configured key protectors (e.g., TPM, TPM+PIN, Recovery Password, Numerical Password).

### Command Prompt: manage-bde -status

```
manage-bde.exe -status
```

Example output:
```
BitLocker Drive Encryption: Configuration Tool version 10.0.19041
Copyright (C) 2013 Microsoft Corporation. All rights reserved.

Volume C: [OSDisk]
[OS Volume]

    Size:                 254.79 GB
    BitLocker Version:    2.0
    Conversion Status:    Fully Encrypted
    Percentage Encrypted: 100.0%
    Encryption Method:    XTS-AES 128
    Protection Status:    Protection On
    Lock Status:          Unlocked
    Identification Field: Unknown
    Key Protectors:
        TPM
        Numerical Password
```

### Control Panel Status Values

| Status | Meaning |
|---|---|
| **On** | BitLocker protection is fully enabled and the volume is encrypted. |
| **Off** | BitLocker is not enabled on the volume. |
| **Suspended** | Protection is temporarily disabled (e.g., during maintenance); the volume remains encrypted but the protectors are not being enforced. |
| **Waiting for Activation** | The volume is encrypted, but only a clear key protector is in place — this state means protection is not fully active and requires an administrator to add an appropriate protector (TPM, PIN, recovery password) to complete activation. |

*(Source: Microsoft Learn, BitLocker Operations Guide — "Check the BitLocker status" — https://learn.microsoft.com/en-us/windows/security/operating-system-security/data-protection/bitlocker/operations-guide)*

## manage-bde Command Reference

`manage-bde` is the command-line tool used to configure, manage, and query BitLocker Drive Encryption.

**Syntax:**
```
manage-bde [-status | -on | -off | -pause | -resume | -lock | -unlock | -autounlock |
            -protectors | -tpm | -setidentifier | -ForceRecovery | -changepassword |
            -changepin | -changekey | -KeyPackage | -upgrade | -WipeFreeSpace] [<Options>]
```

**Selected subcommands:**
| Subcommand | Description |
|---|---|
| `-status [<Drive>]` | Displays the current encryption/protection status for one or all volumes: size, BitLocker version, conversion status, percentage encrypted, encryption method, protection status, lock status, identification field, and key protectors. |
| `-on <Drive>` | Enables BitLocker encryption on the specified volume. |
| `-off <Drive>` | Decrypts the specified volume and removes BitLocker protection. |
| `-pause <Drive>` | Suspends protection on the specified volume. |
| `-resume <Drive>` | Resumes protection that was previously suspended. |
| `-lock <Drive>` | Prevents access to encrypted data on the volume. |
| `-unlock <Drive>` | Restores access to encrypted data using a recovery password, recovery key, password, or key package. |
| `-protectors` | Manages (adds, deletes, lists) key protectors for a volume. |
| `-tpm` | Configures the trusted platform module (TPM). |
| `-forcerecovery` | Forces a volume into recovery mode on next restart, for testing recovery procedures. |

Example status query for a specific volume:
```
manage-bde -status C:
```

*(Source: Microsoft Learn, Windows Commands — manage-bde — https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/manage-bde; manage-bde status subcommand — https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/ff829859(v=ws.11))*

## Get-BitLockerVolume Cmdlet

`Get-BitLockerVolume` gets information about volumes that BitLocker Drive Encryption can protect, returning properties including `VolumeType`, `MountPoint`, `CapacityGB`, `VolumeStatus`, `EncryptionPercentage`, `KeyProtector`, `AutoUnlockEnabled`, `ProtectionStatus`, and `EncryptionMethod`. Running the cmdlet with no parameters returns a table listing all BitLocker-manageable volumes on the local computer, which is a quick way to confirm protection status across every fixed volume during a compliance check.

*(Source: Microsoft Learn, PowerShell BitLocker module — Get-BitLockerVolume — https://learn.microsoft.com/en-us/powershell/module/bitlocker/get-bitlockervolume?view=windowsserver2025-ps)*

---

*End of excerpt. Full source: https://learn.microsoft.com/en-us/windows/security/operating-system-security/data-protection/bitlocker/operations-guide*
