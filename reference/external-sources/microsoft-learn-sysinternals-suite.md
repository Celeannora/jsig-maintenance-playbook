# Microsoft Learn Sysinternals — Sigcheck, AccessChk, and Autoruns (Excerpt)

- **Source URL:** https://learn.microsoft.com/en-us/sysinternals/downloads/sigcheck (Sigcheck); https://learn.microsoft.com/en-us/sysinternals/downloads/accesschk (AccessChk); https://learn.microsoft.com/en-us/sysinternals/downloads/autoruns (Autoruns)
- **Retrieved:** 2026-08-05
- **Why included:** Supports secondary, tool-agnostic verification of controls otherwise evidenced by vendor security consoles (Tenable Nessus, Trellix ePO) — relevant to JSIG CM-6/CM-7 (configuration settings, least functionality), AC-6 (least privilege / effective permissions), and SI-7 (software/firmware integrity) claims. These are Microsoft's official, currently-published Sysinternals documentation pages (authored by Mark Russinovich) for three command-line utilities used to independently spot-check file digital-signature/version integrity (Sigcheck), effective file/registry/service permissions (AccessChk), and autostart/driver enumeration (Autoruns/Autorunsc) directly on a Windows endpoint, without relying on a centralized management console.

> **NOTE — THIS IS AN EXCERPT, NOT THE COMPLETE DOCUMENT.** Each Sysinternals tool page also includes download links, full version-history notes, and (for Autoruns) detailed GUI-navigation instructions for every autostart category tab. Only the tool descriptions and command-line switch references relevant to this repository's use cases — signature/version verification, effective-permission/ACL checking, and autostart/driver enumeration — are reproduced below. For complete documentation, see the source URLs above.

---

## Sigcheck v2.91 (by Mark Russinovich)

**Description:** Sigcheck is a command-line utility that shows file version number, timestamp information, and digital signature details, including certificate chains. It also includes an option to check a file's status on VirusTotal (automated scanning against 40+ antivirus engines) and an option to upload a file for scanning.

**Usage syntax:**

```text
sigcheck [-a][-h][-i][-e][-l][-n][[-s]|[-c|-ct]|[-m]][-q][-r][-u][-vt][-v[r][s]][-f catalog file] <file or directory>
sigcheck -d [-c|-ct] <file or directory>
usage: sigcheck -t[u][v] [-i] [-c|-ct] <certificate store name|*>
```

**Switches relevant to file signature/version verification:**

| Switch | Description |
|---|---|
| `-a` | Show extended version information; the entropy measure reported is bits per byte of the file's contents. |
| `-c` / `-ct` | CSV output, comma- or tab-delimited. |
| `-d` | Dump contents of a catalog file. |
| `-e` | Scan executable images only, regardless of extension. |
| `-f` | Look for a signature in the specified catalog file. |
| `-h` | Show file hashes. |
| `-i` | Show catalog name and signing chain. |
| `-l` | Traverse symbolic links and directory junctions. |
| `-m` | Dump manifest. |
| `-n` | Only show the file version number. |
| `-o` | Perform VirusTotal lookups of hashes previously captured to a CSV file via `-h`; intended for scans of offline systems. |
| `-p` | Verify signatures against a specified policy, represented by its GUID. |
| `-r` | Disable the check for certificate revocation. |
| `-s` | Recurse subdirectories. |
| `-t[u][v]` | Dump contents of the specified certificate store (`*` for all stores); `-tu` queries the user store (machine store is default); appending `-v` downloads the trusted Microsoft root certificate list and outputs only valid certificates rooted to it (falling back to local `authrootstl.cab`/`authroot.stl` if the site is unreachable). |
| `-u` | With VirusTotal checking, show files unknown to VirusTotal or with non-zero detections; otherwise show only unsigned files. |
| `-v[rs]` | Query VirusTotal for malware by file hash; `r` opens reports for non-zero-detection files; `s` uploads previously-unscanned files. |
| `-vt` | Accept VirusTotal terms of service before using VirusTotal features (otherwise prompted interactively). |

**Example — check for unsigned files under System32:**

```text
sigcheck -u -e c:\windows\system32
```

Per the documentation: "You should investigate the purpose of any files that are not signed."

## AccessChk v6.15 (by Mark Russinovich)

**Description:** AccessChk is a command-line tool for viewing effective permissions on files, directories, Registry keys, global objects, and Windows services, letting administrators quickly answer what access specific users or groups have to resources.

**Usage syntax:**

```text
accesschk [-s][-e][-u][-r][-w][-n][-v]-[f <account>,...][[-a]|[-k]|[-p [-f] [-t]]|[-h][-o [-t <object type>]][-c]|[-d]] [[-l [-i]]|[username]] <file, directory, registry key, process, service, object>
```

**Switches relevant to effective-permission/ACL checking:**

| Switch | Description |
|---|---|
| `-a` | Name is a Windows account right; `"*"` shows all rights assigned to a user. |
| `-c` | Name is a Windows Service (e.g., `ssdpsrv`); `"*"` shows all services; `scmanager` checks the Service Control Manager's security. |
| `-d` | Only process directories or top-level keys. |
| `-e` | Show only explicitly set Integrity Levels (Windows Vista+). |
| `-f` | After `-p`, shows full process token info (groups/privileges); otherwise a comma-separated account filter list. |
| `-h` | Name is a file or printer share; `"*"` shows all shares. |
| `-i` | Ignore inherited-only ACEs when dumping full ACLs (used with `-l`). |
| `-k` | Name is a Registry key (e.g., `hklm\software`). |
| `-l` | Show the full security descriptor. |
| `-n` | Show only objects with no access. |
| `-o` | Name is an Object Manager namespace object; default is root; trailing backslash or `-s` lists directory contents; `-t <type>` filters by object type (e.g., `section`). |
| `-p` | Name is a process name or PID (e.g., `cmd.exe`); `"*"` shows all processes; `-f` adds token detail; `-t` shows threads. |
| `-r` | Show only objects with read access. |
| `-s` | Recurse. |
| `-u` | Suppress errors. |
| `-v` | Verbose; includes the Windows Vista Integrity Level and dumps specific granted accesses. |
| `-w` | Show only objects with write access. |

For each object, AccessChk prints `R` (read access), `W` (write access), or nothing (neither), for the account(s) in scope. If a user/group name is specified along with a path, AccessChk reports that account's effective permissions; if no account is specified, it reports effective access for accounts referenced in the object's security descriptor.

**Examples from the documentation:**

```text
accesschk "power users" c:\windows\system32
accesschk -e -s c:\users\mark
accesschk -k hklm\software
accesschk -kns austin\mruss hklm\software
accesschk users -cw *
accesschk -wuo everyone \basednamedobjects
```

(Respectively: Power Users' access to System32; explicit integrity levels recursively under a user profile; security on `HKLM\Software`; Registry keys a specific account cannot access; services members of Users can write to; global objects Everyone can modify.)

## Autoruns v14.3 / Autorunsc (by Mark Russinovich)

**Description:** Autoruns has "the most comprehensive knowledge of auto-starting locations of any startup monitor." It shows programs configured to run at boot/login or when starting built-in Windows applications (Internet Explorer, Explorer, media players), including entries in the Startup folder, `Run`/`RunOnce` Registry keys, and other Registry locations. It reports Explorer shell extensions, toolbars, browser helper objects, Winlogon notifications, auto-start services, and more. The **Hide Signed Microsoft Entries** option isolates third-party auto-starting images; Autoruns also supports viewing autostarts configured for other user accounts. **Autorunsc** is the included command-line equivalent, supporting CSV output.

**Autorunsc usage syntax:**

```text
autorunsc [-a <*|bdeghiklmoprsw>] [-c|-ct] [-h]
[-m] [-s] [-u] [-vt] [[-z ] | [user]]
```

**Autostart-location and driver enumeration switches (`-a`):**

| Switch | Enumerates |
|---|---|
| `-a *` | All autostart entries |
| `-a b` | Boot execute images |
| `-a d` | Appinit DLLs |
| `-a e` | Explorer add-ons |
| `-a g` | Sidebar gadgets (Vista+) |
| `-a h` | Image hijacks |
| `-a i` | Internet Explorer add-ons |
| `-a k` | Known DLLs |
| `-a l` | Logon startups (default) |
| `-a m` | WMI entries |
| `-a n` | Winsock protocol and network providers |
| `-a o` | Codecs |
| `-a p` | Printer monitor DLLs |
| `-a r` | LSA security providers |
| `-a s` | **Autostart services and non-disabled drivers** |
| `-a t` | Scheduled tasks |
| `-a w` | Winlogon entries |

**Output, verification, and filtering switches:**

| Switch | Description |
|---|---|
| `-c` / `-ct` | CSV / tab-delimited output. |
| `-x` | XML output. |
| `-h` | Show file hashes. |
| `-s` | Verify digital signatures. |
| `-m` | Hide Microsoft entries (signed entries, if combined with `-v`). |
| `-t` | Show timestamps in normalized UTC (`YYYYMMDD-hhmmss`). |
| `-u` | With VirusTotal checking, show unknown/non-zero-detection files; otherwise show only unsigned files. |
| `-v[rs]` | Query VirusTotal by file hash; `r` opens reports; `s` uploads unscanned files. |
| `-vt` | Accept VirusTotal terms of service before use. |
| `-z` | Specify an offline Windows system to scan. |
| `user` | Show autorun items for a specific user account; `*` scans all user profiles. |

Driver enumeration specifically is covered by `-a s` ("Autostart services and non-disabled drivers"), while signature verification of any listed autostart image (including drivers) is enabled with `-s`.

---

*End of excerpt. Full sources: https://learn.microsoft.com/en-us/sysinternals/downloads/sigcheck, https://learn.microsoft.com/en-us/sysinternals/downloads/accesschk, and https://learn.microsoft.com/en-us/sysinternals/downloads/autoruns*
