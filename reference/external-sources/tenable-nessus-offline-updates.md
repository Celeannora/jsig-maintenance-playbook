# Tenable Nessus — Offline (Air-Gapped) Plugin Updates and License Activation (Excerpt)

- **Source URL:** https://docs.tenable.com/nessus/Content/UpdatePluginsOffline.htm (offline plugin updates); https://docs.tenable.com/nessus/Content/UpdateLicenseOffline.htm (offline license activation)
- **Retrieved:** 2026-08-05
- **Why included:** Supports JSIG SI-2 (flaw remediation) and RA-5 (vulnerability scanning) claims for air-gapped/isolated enclaves. These are Tenable's official, currently-published Nessus product documentation pages describing how to update Nessus vulnerability-scanner plugins on a scanner with no internet access (using a plugin archive transferred via removable media/another computer) and how to activate or license a Nessus scanner offline using a generated challenge code and license file, without the scanner ever needing outbound internet connectivity.

> **NOTE — THIS IS AN EXCERPT, NOT THE COMPLETE DOCUMENT.** These are individual topic pages from Tenable's live Nessus product documentation site (docs.tenable.com), not full PDF manuals. Only the offline plugin-update procedure and the offline license-activation/challenge-response procedure are reproduced below, including the exact `nessuscli` command syntax as published. Surrounding topics — such as initial offline installation, proxy configuration, and general plugin-management concepts — are not reproduced. For the complete, current documentation, see the source URLs above.

---

## Updating Nessus Plugins Offline

**Required user role when using Tenable Nessus Manager:** System Administrator

This procedure updates an existing offline Tenable Nessus server's plugins. It assumes Tenable Nessus has already been installed offline.

> **Tenable note:** Tenable recommends using this process only for offline Tenable Nessus instances. All online instances receive automatic plugin updates.

**Procedure:**

1. Using a separate computer **with internet access**, open the **Custom URL** that was saved during the initial Tenable Nessus offline license-generation process. This downloads the Tenable Nessus plugins TAR file (the compressed plugin feed archive) to that machine.
2. Install the plugins TAR file using one of the following methods.

### Method A — Install via the Tenable Nessus user interface

1. On the offline Tenable Nessus system, in the top navigation bar, click **Settings**. The **About** page appears.
2. Click the **Software Update** tab.
3. In the upper-right corner, click **Manual Software Update**. The **Manual Software Update** dialog box appears.
4. Select **Upload your own plugin archive**, then select **Continue**.
5. Navigate to the compressed TAR file downloaded in step 1, select it, then click **Open**. Tenable Nessus updates with the uploaded plugins.

### Method B — Install via the command-line interface (`nessuscli update`)

1. Copy the compressed TAR file to the offline Tenable Nessus system (for example, via removable media), placing it in the directory specific to the operating system:

   | Platform | Directory |
   |---|---|
   | Windows | `C:\Program Files\Tenable\Nessus` |
   | macOS | `/Library/Nessus/run/sbin/` |
   | Linux | `/opt/nessus/sbin/` |

2. On the offline system, open a command prompt.
3. Run the `nessuscli update <tar.gz file name>` command specific to the operating system:

   | Platform | Command |
   |---|---|
   | Windows | `"C:\Program Files\Tenable\Nessus\nessuscli.exe" update <tar.gz file name>` |
   | macOS | `# /Library/Nessus/run/sbin/nessuscli update <tar.gz file name>` |
   | Linux | `# /opt/nessus/sbin/nessuscli update <tar.gz file name>` |

**Note on file naming:** The published documentation refers to the downloaded archive generically as "the Tenable Nessus plugins TAR file" / "the compressed TAR file" and uses the placeholder `<tar.gz file name>` in the command syntax. It does not itself specify a literal example file name such as `all-2.0.tar.gz`; operators substitute the actual downloaded file name (a `.tar.gz` archive) for the `<tar.gz file name>` placeholder shown above.

## Activating/Updating a Nessus License Offline (Challenge/Response)

**Required user role when using Tenable Nessus Manager:** System Administrator

Offline license management requires two computers: the Tenable Nessus server (not connected to the internet) and a separate computer that is connected to the internet. When online, Nessus operations use an **activation code**; when offline, operations use a **license** generated from a **challenge code**.

### Step 1 — Generate a challenge code on the offline system

**Via the Nessus UI:** Log in to Nessus → **Settings** → click the pencil icon next to the activation code → in **Update Activation Code**, set **Registration** to **Offline** → **Activate**. The challenge code is displayed (example format: `aaaaaa11b2222cc33d44e5f6666a777b8cc99999`).

**Via the CLI**, run `nessuscli fetch --challenge`:

| Platform | Command |
|---|---|
| Windows | `C:\Program Files\Tenable\Nessus>nessuscli.exe fetch --challenge` |
| macOS | `# /Library/Nessus/run/sbin/nessuscli fetch --challenge` |
| Linux | `# /opt/nessus/sbin/nessuscli fetch --challenge` |

### Step 2 — Retrieve the activation code from the offline system

View it in the Nessus UI (**Settings** → **About** → **Overview** tab), or via the CLI using `nessuscli fetch --code-in-use`:

| Platform | Command |
|---|---|
| Windows | `C:\Program Files\Tenable\Nessus>nessuscli.exe fetch --code-in-use` |
| macOS | `# /Library/Nessus/run/sbin/nessuscli fetch --code-in-use` |
| Linux | `# /opt/nessus/sbin/nessuscli fetch --code-in-use` |

### Step 3 — Generate the license on a system with internet access

The license is unique to the product, cannot be shared, and is a text-based file containing a string of alphanumeric characters generated from the challenge code. On a system with internet access, go to the Tenable Nessus offline registration page, enter the challenge code and the activation code, then select **Submit**. The resulting page embeds a downloadable `nessus.license` file.

### Step 4 — Transfer the license file to the offline system

Download `nessus.license` on the internet-connected machine, then copy it (for example, via removable media) to the offline Nessus server, into the directory specific to the OS:

| Platform | Directory |
|---|---|
| Windows | `C:\ProgramData\Tenable\Nessus\conf` |
| macOS | `/Library/Nessus/run/etc/nessus` |
| Linux | `/opt/nessus/etc/nessus/` |

### Step 5 — Register the license on the offline system

**Via the Nessus UI:** **Settings** → pencil icon next to the activation code → **Update Activation Code** → set drop-down to **Offline** → paste the license key into **License** → **Activate** → confirm the activation status updates successfully.

**Via the CLI**, run `nessuscli fetch --register-offline "<path to nessus.license>"`:

| Platform | Command |
|---|---|
| Windows | `C:\Program Files\Tenable\Nessus>nessuscli.exe fetch --register-offline "C:\ProgramData\Tenable\Nessus\conf\nessus.license"` |
| macOS | `# /Library/Nessus/run/sbin/nessuscli fetch --register-offline /Library/Nessus/run/etc/nessus/nessus.license` |
| Linux | `# /opt/nessus/sbin/nessuscli fetch --register-offline /opt/nessus/etc/nessus/nessus.license` |

### `nessuscli fetch` command summary (offline licensing)

| Purpose | Switch |
|---|---|
| Generate a challenge code | `nessuscli fetch --challenge` |
| Display the activation code currently in use | `nessuscli fetch --code-in-use` |
| Register the offline license | `nessuscli fetch --register-offline "<path to nessus.license>"` |

---

*End of excerpt. Full sources: https://docs.tenable.com/nessus/Content/UpdatePluginsOffline.htm and https://docs.tenable.com/nessus/Content/UpdateLicenseOffline.htm*
