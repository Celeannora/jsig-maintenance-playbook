# Microsoft Learn — WSUS Disconnected Network Synchronization (wsusutil export/import) and Per-Host Patch Verification (Excerpt)

- **Source URL:** https://learn.microsoft.com/en-us/intune/configmgr/sum/get-started/synchronize-software-updates-disconnected
- **Additional source URLs:** https://learn.microsoft.com/en-us/windows-server/administration/windows-server-update-services/deploy/2-configure-wsus ; https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-hotfix?view=powershell-7.5 ; https://learn.microsoft.com/en-us/powershell/scripting/samples/collecting-information-about-computers?view=powershell-7.5
- **Retrieved:** 2026-08-05
- **Why included:** Supports CM-2/CM-6 (Configuration/Baseline Management) and SI-2 (Flaw Remediation) evidence for an air-gapped environment with no direct upstream WSUS-to-Microsoft-Update connectivity — documents the `wsusutil.exe export` / `wsusutil.exe import` workflow used to move update metadata from a connected WSUS server to a disconnected downstream WSUS server, and the native `Get-HotFix` and `Get-CimInstance -ClassName Win32_QuickFixEngineering` PowerShell cmdlets used to verify a patch is actually installed on an endpoint rather than merely approved in WSUS.

> **NOTE — THIS IS AN EXCERPT, NOT THE COMPLETE DOCUMENT.** The Microsoft Learn Windows Server Update Services deployment guide, the Configuration Manager software updates documentation, and the PowerShell cmdlet reference each contain many independent pages covering the full WSUS/software-update lifecycle. Only the disconnected-network export/import procedure and the two per-host hotfix verification cmdlets are reproduced below. For the complete references, see the source URLs above.

---

## WSUS in an air-gapped / disconnected network

Microsoft Learn's WSUS deployment guide describes the disconnected-network (air-gapped) scenario directly:

> "If your network is *air gapped*—if it doesn't have access to the internet at all—you can still use WSUS to provide updates to client computers on the network. This approach requires two WSUS servers. One WSUS server with internet access collects the updates from Microsoft. A second WSUS server on the protected network serves the updates to the client computers. Updates are exported from the first server onto removable media, carried across the air gap, and imported into the second server."

*(Source: Microsoft Learn, Step 2: Configure WSUS — https://learn.microsoft.com/en-us/windows-server/administration/windows-server-update-services/deploy/2-configure-wsus)*

## Export and import software updates metadata with WSUSutil.exe

The Microsoft Learn Configuration Manager documentation ("Synchronize software updates from a disconnected software update point") describes the export/import procedure using the WSUSutil tool. Although written in the context of a Configuration Manager software update point, the underlying export/import mechanism is the native WSUS `wsusutil.exe` tool and the same process applies to a standalone disconnected WSUS deployment:

> "When the software update point at the top-level site is disconnected from the Internet, you must use the export and import functions of the WSUSUtil tool to synchronize software updates metadata. You can choose an existing WSUS server not in your Configuration Manager hierarchy as the synchronization source... To export and import software updates metadata, you must export software updates metadata from the WSUS database on a specified export server, then copy the locally stored license terms files to the disconnected software update point, and then import the software updates metadata to the WSUS database on the disconnected software update point."

**Important prerequisites:**
- "The WSUSUtil tool must be run locally on the export server to export the software updates metadata, and it also must be run on the disconnected software update point server to import the software updates metadata. In addition, the user that runs the WSUSUtil tool must be a member of the local Administrators group on each server."
- Before exporting, verify software updates synchronization has completed successfully on the export server (WSUS Administration console → **Synchronizations**).
- Advanced synchronization options for express installation files and languages must match between the export server and the import server.

### To copy local files from the export server to the disconnected server

1. On the export server, navigate to the folder where software updates and license terms are stored — by default `<WSUSInstallationDrive>:\WSUS\WSUSContent\`.
2. Copy all files and folders from this location to the `WSUSContent` folder on the disconnected server.

### To export software updates metadata (run on the connected/export server)

1. At the command prompt on the export server, navigate to the folder that contains `WSUSutil.exe`. By default, the tool is located at `%ProgramFiles%\Update Services\Tools`.
2. Run:

   ```
   wsusutil.exe export <packagename> <logfile>
   ```

   For example:

   ```
   wsusutil.exe export export.xml.gz export.log
   ```

   "The format can be summarized as follows: WSUSutil.exe is followed by the export option, the name of the export .xml.gz file that is created during the export operation, and the name of a log file. WSUSutil.exe exports the metadata from the export server and creates a log file of the operation." The package and log file names must be unique in the current folder.
3. Move the export package to the folder that contains `WSUSutil.exe` on the import (disconnected) WSUS server.

### To import software updates metadata (run on the disconnected/import server)

> **Important:** "Never import any exported data from a source that you do not trust. If you import content from a source that you do not trust, it might compromise the security of your WSUS server."

1. At the command prompt on the import WSUS server, navigate to the folder that contains `WSUSutil.exe` (`%ProgramFiles%\Update Services\Tools` by default).
2. Run:

   ```
   wsusutil.exe import <packagename> <logfile>
   ```

   For example:

   ```
   wsusutil.exe import export.xml.gz import.log
   ```

   "WSUSutil.exe is followed by the import command, the name of package file (.xml.gz) that is created during the export operation, the path to the package file if it is in a different folder, and the name of a log file. WSUSutil.exe imports the metadata from the export server and creates a log file of the operation."

*(Source: Microsoft Learn, Synchronize software updates from a disconnected software update point — https://learn.microsoft.com/en-us/intune/configmgr/sum/get-started/synchronize-software-updates-disconnected)*

---

## Native per-host patch verification: confirming an update actually installed

WSUS approval status only reflects what the WSUS server has approved for deployment — it does not by itself prove a given endpoint successfully installed the patch. Microsoft Learn documents two native cmdlets for confirming installation state directly on the endpoint.

### Get-HotFix

`Get-HotFix` (module: `Microsoft.PowerShell.Management`) "gets the hotfixes that are installed on local or remote computers." It uses the **Win32_QuickFixEngineering** WMI class internally.

**Syntax:**
```
Get-HotFix
    [[-Id] <String[]>]
    [-ComputerName <String[]>]
    [-Credential <PSCredential>]
    [<CommonParameters>]

Get-HotFix
    [-Description <String[]>]
    [-ComputerName <String[]>]
    [-Credential <PSCredential>]
    [<CommonParameters>]
```

**Example — verify whether a particular update is installed, and record missing hosts:**
```powershell
$A = Get-Content -Path ./Servers.txt
$A | ForEach-Object { if (!(Get-HotFix -Id KB957095 -ComputerName $_))
    { Add-Content $_ -Path ./Missing-KB957095.txt }}
```
"The commands in this example verify whether a particular update installed. If the update isn't installed, the computer name is written to a text file." This is the pattern used to confirm a specific KB (e.g., an approved WSUS update) is actually present on a list of target computers, rather than only checking WSUS approval/compliance status.

**Example — get all hotfixes on the local computer:**
```powershell
Get-HotFix
```
```
Source Description HotFixID InstalledBy InstalledOn
------ ----------- -------- ----------- -----------
Server01 Update KB4495590 NT AUTHORITY\SYSTEM 5/16/2019 00:00:00
Server01 Security Update KB4470788 NT AUTHORITY\SYSTEM 1/22/2019 00:00:00
```

Note: "The **Win32_QuickFixEngineering** WMI class represents a small system-wide update, commonly referred to as a quick-fix engineering (QFE) update... This class returns only the updates supplied by Component Based Servicing (CBS). These updates aren't listed in the registry. Updates supplied by Microsoft Windows Installer (MSI) or the Windows Update site aren't returned by **Win32_QuickFixEngineering**."

*(Source: Microsoft Learn, Get-HotFix — https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-hotfix?view=powershell-7.5)*

### Get-CimInstance -ClassName Win32_QuickFixEngineering

The Microsoft Learn PowerShell samples documentation ("Collecting information about computers") documents querying the same underlying WMI class directly via `Get-CimInstance` for listing installed hotfixes:

> "You can list all installed hotfixes by using **Win32_QuickFixEngineering**:
> ```
> Get-CimInstance -ClassName Win32_QuickFixEngineering
> ```
> This class returns a list of hotfixes that looks like this:
> ```
> Source Description HotFixID InstalledBy InstalledOn PSComputerName
> ------ ----------- -------- ----------- ----------- --------------
>        Security Update KB4048951 Administrator 12/16/2017 .
> ```"

For more succinct output limited to the KB identifier, the article recommends piping to `Select-Object` (using `-Property` alone on `Get-CimInstance` returns more metadata, not less):

```powershell
Get-CimInstance -ClassName Win32_QuickFixEngineering -Property HotFixId |
    Select-Object -Property HotFixId
```
```
HotFixId
--------
KB4048951
```

*(Source: Microsoft Learn, Collecting information about computers — https://learn.microsoft.com/en-us/powershell/scripting/samples/collecting-information-about-computers?view=powershell-7.5)*

---

*End of excerpt. Full source: https://learn.microsoft.com/en-us/intune/configmgr/sum/get-started/synchronize-software-updates-disconnected*
