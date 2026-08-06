# Microsoft Learn — Windows Defender Firewall with Advanced Security: Reviewing Rules with PowerShell (Excerpt)

- **Source URL:** https://learn.microsoft.com/en-us/windows/security/operating-system-security/network-security/windows-firewall/configure-with-command-line
- **Retrieved:** 2026-08-05
- **Why included:** Supports SC-7 (Boundary Protection) / CM-6 (Configuration Settings) evidence for host-based firewall rule review — `Get-NetFirewallRule` and related NetSecurity module cmdlet usage for verifying which inbound/outbound rules are active, their profile scope, and their source (local policy vs. Group Policy).

> **NOTE — THIS IS AN EXCERPT, NOT THE COMPLETE DOCUMENT.** The Microsoft Learn Windows Defender Firewall with Advanced Security documentation set includes a full deployment guide, design guide, and multiple command references (Netsh, PowerShell NetSecurity module, GPO-based configuration). Only the sections and cmdlet reference content relevant to reviewing/verifying existing firewall rules via PowerShell are reproduced below. For the complete documentation, see the source URLs below.

---

## Viewing and Querying Firewall Rules

Windows Defender Firewall with Advanced Security rules can be reviewed using the `NetSecurity` PowerShell module. Common conditions such as addresses and ports are stored in separate **Filter** objects associated with each rule rather than on the rule object itself, so verifying a rule's full configuration typically requires combining `Get-NetFirewallRule` with the matching filter cmdlet.

### Query a rule by port and other properties

```powershell
Get-NetFirewallPortFilter | ?{$_.LocalPort -eq 80} | Get-NetFirewallRule | ?{ $_.Direction -eq "Inbound" -and $_.Action -eq "Allow"} | Set-NetFirewallRule -RemoteAddress 192.168.0.2
```
This retrieves rules bound to local port 80, filters to inbound Allow rules, and (in this example) pipes them to `Set-NetFirewallRule` for modification — the same read pattern applies for verification-only queries by omitting the final `Set-NetFirewallRule` stage.

### Query rules by application with a wildcard

```powershell
Get-NetFirewallApplicationFilter -Program "*svchost*" | Get-NetFirewallRule
```
Returns all firewall rules associated with a program matching the wildcard.

## Reviewing Rules Before Making Changes

It is recommended to first query rules with a `Get` command, store them in a variable, and inspect the results before applying any changes:

```powershell
$x = Get-NetFirewallRule -Action Block
$x
$x[0-3] | Remove-NetFirewallRule
```

## Reviewing Rule Groups and Remote Devices

Rules can be reviewed and managed by their display group:
```powershell
Set-NetFirewallRule -DisplayGroup "Windows Firewall Remote Management" -Enabled True
Enable-NetFirewallRule -DisplayGroup "Windows Firewall Remote Management" -Verbose
```

Rules on a remote device can be reviewed via WinRM using the `-CimSession` parameter, which is supported by default:
```powershell
Get-NetFirewallRule -CimSession RemoteDevice
```

## Determining the Source GPO of a Rule

To determine whether a given rule originates from a Group Policy Object rather than local policy, query the rule with `-TracePolicyStore`:
```powershell
Get-NetIPsecRule -DisplayName "Require Inbound Authentication" -TracePolicyStore
```
When a rule originates from a GPO, the `PolicyStoreSource` field of the returned object identifies the source GPO.

*(Source: Microsoft Learn — "Manage Windows Firewall with the Command Line" — https://learn.microsoft.com/en-us/windows/security/operating-system-security/network-security/windows-firewall/configure-with-command-line)*

## Get-NetFirewallRule Cmdlet Reference

`Get-NetFirewallRule` retrieves the instances of firewall rules that match the search parameters supplied. Rules can be returned by the `-Name` parameter (default identifier), `-DisplayName`, other rule properties (`-Direction`, `-Action`, `-Enabled`, `-Profile`, `-Group`, `-DisplayGroup`), or by associated filter objects. Queried rules can be stored in variables or piped to other cmdlets for further inspection.

**Selected parameters:**
| Parameter | Description |
|---|---|
| `-Name` | Retrieves rule(s) by their internal stable identifier. |
| `-DisplayName` | Retrieves rule(s) by their localized display name; supports wildcards. |
| `-Direction` | Filters by `Inbound` or `Outbound`. |
| `-Action` | Filters by `Allow`, `Block`, or `NotConfigured`. |
| `-Enabled` | Filters by rule enabled state (`True`/`False`). |
| `-Profile` | Filters by `Domain`, `Private`, `Public`, or `Any`. |
| `-PolicyStore` | Specifies which policy store to query (defaults to the persistent local store); `ActiveStore` returns the effective merged set of rules currently applied to the computer. |
| `-CimSession` | Runs the query against a remote computer via WinRM. |

**Examples:**
```powershell
Get-NetFirewallRule -PolicyStore ActiveStore
```
Retrieves all firewall rules in the **active store** — the merged collection of all policy stores (local + GPO-delivered) currently in effect on the computer. Running the cmdlet without `-PolicyStore` retrieves only the persistent (local) store.

```powershell
Get-NetFirewallProfile -Name Public | Get-NetFirewallRule
```
Retrieves all rules scoped to the Public firewall profile.

Additional practical verification patterns commonly used for compliance review:
```powershell
# All enabled inbound Allow rules on the Public profile, joined with port info
Get-NetFirewallRule -Direction Inbound -Action Allow -Profile Public -Enabled True | ForEach-Object {
    $port = $_ | Get-NetFirewallPortFilter
    [PSCustomObject]@{
        Name      = $_.DisplayName
        Protocol  = $port.Protocol
        LocalPort = $port.LocalPort -join ','
    }
}

# Disabled rules (candidates for cleanup review)
Get-NetFirewallRule -Enabled False | Select-Object DisplayName
```

*(Source: Microsoft Learn, PowerShell NetSecurity module — Get-NetFirewallRule — https://learn.microsoft.com/en-us/powershell/module/netsecurity/get-netfirewallrule?view=windowsserver2025-ps)*

## Firewall Profile Status

`Get-NetFirewallProfile` displays the per-profile (Domain, Private, Public) configuration of Windows Defender Firewall with Advanced Security, including whether the firewall is enabled for that profile and the default inbound/outbound actions:
```powershell
Get-NetFirewallProfile -PolicyStore ActiveStore
```
The corresponding `Set-NetFirewallProfile` cmdlet is used to enable/disable the firewall per profile, e.g.:
```powershell
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
```
The underlying Windows service is **Windows Defender Firewall** (service name `MpsSvc`); Microsoft documentation notes that stopping this service (rather than disabling firewall profiles) is unsupported and can cause problems.

*(Source: Microsoft Learn, PowerShell NetSecurity module — Get-NetFirewallProfile — https://learn.microsoft.com/en-us/powershell/module/netsecurity/get-netfirewallprofile?view=windowsserver2025-ps)*

---

*End of excerpt. Full source: https://learn.microsoft.com/en-us/windows/security/operating-system-security/network-security/windows-firewall/configure-with-command-line*
