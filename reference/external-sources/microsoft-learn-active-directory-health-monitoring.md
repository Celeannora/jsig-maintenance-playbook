# Microsoft Learn — Active Directory Domain Services Health Monitoring: dcdiag and repadmin (Excerpt)

- **Source URL:** https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/dcdiag
- **Retrieved:** 2026-08-05
- **Why included:** Supports CM-6 (Configuration Settings) / SI-4 (System Monitoring) / AU-6 (Audit Review) evidence for Active Directory Domain Services health verification — `dcdiag` and `repadmin` command usage and output interpretation used to demonstrate ongoing domain controller replication health monitoring.

> **NOTE — THIS IS AN EXCERPT, NOT THE COMPLETE DOCUMENT.** The Microsoft Learn Windows Commands reference and the Active Directory administration documentation set span many independent command reference pages. Only the `dcdiag` and `repadmin` command references relevant to AD DS replication/health monitoring are reproduced below. For the complete Windows Commands reference, see the source URLs below.

---

## dcdiag

`dcdiag` analyzes the state of domain controllers in a forest or enterprise and reports problems to assist in troubleshooting.

**Syntax:**
```
dcdiag [/s:<DomainController>] [/n:<NamingContext>] [/u:<Domain>\<UserName> /p:{<Password>|*|""}]
       [/a] [/e] [/q] [/v] [/i] [/fix] [/f:<LogFile>] [/x:<XMLLogFile>] [/c] [/test:<TestName>]
       [/skip:<TestName>] [/ReplSource:<SourceDCName>]
```

**Key parameters:**
| Parameter | Description |
|---|---|
| `/s:<DomainController>` | Specifies the DC to test (default is the local computer). |
| `/n:<NamingContext>` | Tests a specific naming context (given by NetBIOS, DNS, or distinguished name). |
| `/u` / `/p` | Supply alternate user credentials and password for the test connection. |
| `/a` | Tests all the DCs in the current site. |
| `/e` | Tests all the DCs in the entire enterprise (overrides `/a`). |
| `/q` | Quiet mode — reports only errors, not passing test messages. |
| `/v` | Verbose mode — prints extended information. |
| `/fix` | Fixes minor problems found (e.g., missing SPNs). |
| `/f:<LogFile>` | Redirects output to a log file. |
| `/c` | Runs a comprehensive set of tests, including non-default tests. |
| `/test:<TestName>` | Runs only the specified test. |
| `/ReplSource:<SourceDCName>` | Used with the Replications test to check replication with a specific source DC. |

**Known dcdiag tests (selected):**
| Test | Description |
|---|---|
| `Advertising` | Checks whether each DC is advertising itself and its available services correctly, e.g. via the Netlogon service. |
| `Connectivity` | Verifies that DNS registration for a DC is correct and that the DC can be located via LDAP/RPC. |
| `Replications` | Checks all Active Directory replication connection objects for all naming contexts on the specified DCs to determine whether the last replication attempt succeeded or returned an error, whether replication is disabled, and whether replication latency exceeds 12 hours. |
| `CutoffServers` | Checks whether any DCs are not receiving replication because their partners have been cut off. |
| `Intersite` | Checks for failures that would prevent or delay intersite replication. |
| `KccEvent` | Checks that the Knowledge Consistency Checker (KCC) is running without errors. |
| `Services` | Checks that key AD DS-related services are running and their startup mode is correct on the DC. |
| `SysVolCheck` | Checks that the SYSVOL is shared correctly. |
| `RidManager` | Checks that the RID Master is accessible and its RID pool status is healthy. |

**Example output (abridged):**
```
Doing primary tests

   Testing server: Default-First-Site-Name\DC1
      Starting test: Connectivity
         ......................... DC1 passed test Connectivity

   Doing primary tests

      Testing server: Default-First-Site-Name\DC1
         Starting test: Advertising
            ......................... DC1 passed test Advertising
         Starting test: Replications
            ......................... DC1 passed test Replications
         Starting test: Intersite
            ......................... DC1 passed test Intersite
```
A `passed test` line for each check confirms healthy status; a `failed test` line, or output flagging replication latency, disabled links, or errors, indicates a problem requiring remediation.

*(Source: Microsoft Learn, Windows Commands — dcdiag — https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/dcdiag)*

## repadmin

`repadmin.exe` is used to diagnose Active Directory replication problems between domain controllers.

**Syntax:**
```
repadmin <cmd> <args> [/u:<domain>\<user>] [/pw:{<password>|*}] [/retry:[<retryTime>][:<totalDuration>]] [/csv]
```

**Selected commands:**
| Command | Description |
|---|---|
| `/showrepl` | Displays the replication status for the specified DC's last attempted inbound replication on each Active Directory partition, including partner, timestamp, and result. |
| `/replsummary` | Displays a summary of replication state and relative health for all DCs, including maximum replication latency and any failures. |
| `/kcc` | Forces the KCC on the specified server(s) to immediately recalculate the replication topology. |
| `/queue` | Displays the replication queue for the specified DC. |
| `/showobjmeta` | Displays replication metadata for a specific object's attributes. |
| `/showutdvec` | Displays the up-to-dateness vector for the specified DC and naming context. |
| `/syncall` | Synchronizes the specified DC with all replication partners. |

### repadmin /replsummary

Displays a summarized view of replication health.

**Syntax:**
```
repadmin /replsummary [<DC_list>|*] [/bysrc] [/bydest] [/errorsonly] [/sort:{delta|partners|failures|error|percent|unresponsive}]
```

**Parameters:**
- `/bysrc` — groups output by source DC.
- `/bydest` — groups output by destination DC.
- `/errorsonly` — displays only entries where replication has failed.
- `/sort:delta` — sorts by the time since the last successful replication.
- `/sort:partners` — sorts by the number of replication partners.
- `/sort:failures` — sorts by the number of replication failures.
- `/sort:error` — sorts by the most recent error code.
- `/sort:percent` — sorts by percentage of replication failures.
- `/sort:unresponsive` — sorts by number of unresponsive partners.

**Example:**
```
repadmin /replsum * /bysrc /bydest /sort:delta
```
This produces a summary of replication status across every DC in the forest, grouped by both source and destination, sorted by how long it has been since each DC last successfully replicated — the largest deltas (longest time since successful replication) surface first, highlighting DCs most likely to have a replication health problem.

*(Source: Microsoft Learn, repadmin — https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/cc770963(v=ws.11); repadmin /replsummary — https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/cc835092(v=ws.11))*

---

*End of excerpt. Full source: https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/dcdiag*
