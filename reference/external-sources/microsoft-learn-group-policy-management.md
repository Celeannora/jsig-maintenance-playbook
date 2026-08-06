# Microsoft Learn — Group Policy Management: gpresult and Get-GPOReport Baseline Verification (Excerpt)

- **Source URL:** https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/gpresult
- **Retrieved:** 2026-08-05
- **Why included:** Supports CM-2 (Baseline Configuration) / CM-6 (Configuration Settings) evidence for Group Policy baseline verification — `gpresult` (Resultant Set of Policy reporting) and `Get-GPOReport` (GPO report export) command usage used to confirm applied policy settings match approved configuration baselines.

> **NOTE — THIS IS AN EXCERPT, NOT THE COMPLETE DOCUMENT.** The Microsoft Learn Windows Commands reference and PowerShell GroupPolicy module reference each contain many independent command pages covering the full Group Policy Management Console (GPMC) toolset. Only the `gpresult` and `Get-GPOReport` references relevant to baseline/policy verification are reproduced below. For the complete references, see the source URLs below.

---

## gpresult

`gpresult` displays the Resultant Set of Policy (RSoP) information for a target user and computer — i.e., which Group Policy settings are actually in effect and which GPOs applied them.

**Syntax:**
```
gpresult [/s <Computer> [/u <Domain>\<UserName> /p [<Password>]]]
         [/user [<TargetDomain>\]<TargetUser>] [/scope {user | computer}]
         {/r | /v | /z} [/x <Filename> | /h <Filename>] [/f]
```

**Parameters:**
| Parameter | Description |
|---|---|
| `/s <Computer>` | Specifies the remote system to connect to. |
| `/u` / `/p` | Alternate credentials for the connection. |
| `/user <TargetUser>` | Specifies the user name for which RSoP data should be displayed. |
| `/scope {user \| computer}` | Restricts the results to just user or just computer settings. |
| `/x <Filename>` | Saves the report in XML format to the specified file. |
| `/h <Filename>` | Saves the report in HTML format to the specified file. |
| `/r` | Displays RSoP summary data. |
| `/v` | Displays verbose policy information, including detailed settings applied for each GPO. |
| `/z` | Displays all available information about Group Policy (super-verbose), including registry-based policy settings applied on a per-GPO basis. |
| `/f` | Forces gpresult to overwrite the file specified in `/x` or `/h` if it already exists. |

**Examples:**
```
gpresult /s srvmain /user maindom\targetuser /scope user /r
```
Displays an RSoP summary of the user settings applied to `targetuser` from the remote computer `srvmain`.

```
gpresult /s srvmain /user maindom\targetuser /z > policy.txt
```
Writes the full verbose Group Policy report for the target user to a text file for later review/archival — useful for producing point-in-time evidence of applied baseline settings.

```
gpresult /s srvmain /u maindom\hiropln /p p@ssW23 /r
```
Connects to `srvmain` using alternate administrative credentials and displays the RSoP summary.

The output of `gpresult /r` (summary mode) lists, per user and per computer: the applied GPOs, denied GPOs (with the reason — e.g., empty, disabled link, security filtering, WMI filtering), and applied security group memberships — which is the primary evidence used to confirm a system received its intended baseline GPOs.

*(Source: Microsoft Learn, Windows Commands — gpresult — https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/gpresult)*

## Get-GPOReport (GroupPolicy module)

`Get-GPOReport` generates a report (in XML or HTML format) for a specified Group Policy Object (GPO), or for all GPOs in a domain, showing the GPO's full policy settings and metadata.

**Syntax (selected parameter sets):**
```
# By GPO name
Get-GPOReport -Name <String> -ReportType {Xml | Html} [-Path <String>] [-Domain <String>] [-Server <String>]

# By GUID
Get-GPOReport -Guid <Guid> -ReportType {Xml | Html} [-Path <String>] [-Domain <String>] [-Server <String>]

# All GPOs in the domain
Get-GPOReport -All -ReportType {Xml | Html} [-Path <String>] [-Domain <String>] [-Server <String>]
```

**Examples:**
```powershell
Get-GPOReport -Name "TestGPO1" -ReportType HTML -Path "C:\GPOReports\GPOReport1.html"
```
Generates an HTML report of the settings configured in the GPO named `TestGPO1` and saves it to the specified path — a common way to produce a human-readable, point-in-time snapshot of a baseline GPO's configuration for audit evidence.

```powershell
Get-GPOReport -Guid <guid> -ReportType XML
```
Generates an XML-formatted report for the GPO identified by its GUID, useful for programmatic comparison against a known-good baseline export.

```powershell
Get-GPOReport -All -Domain 'sales.contoso.com' -Server 'DC1' -ReportType 'XML' -Path 'C:\GPOReports\AllGPOs.xml'
```
Generates a report covering **every** GPO in the `sales.contoso.com` domain (queried against domain controller `DC1`) and writes the combined XML output to a single file — providing a full-domain baseline snapshot in one operation.

Because `Get-GPOReport` output includes every policy setting configured within a GPO (registry-based policy settings, security settings, administrative templates, preferences), administrators commonly diff successive XML reports for the same GPO to detect unauthorized or unexpected configuration drift from the approved baseline.

*(Source: Microsoft Learn, PowerShell GroupPolicy module — Get-GPOReport — https://learn.microsoft.com/en-us/powershell/module/grouppolicy/get-gporeport?view=windowsserver2025-ps)*

---

*End of excerpt. Full source: https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/gpresult*
