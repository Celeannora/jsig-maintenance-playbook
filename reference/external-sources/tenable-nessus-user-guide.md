# Tenable Nessus User Guide — Credentialed Scanning, Compliance/Audit-File (STIG) Scanning, and Scan Results Review (Excerpt)

- **Source URL:** https://docs.tenable.com/nessus/10_12/Content/PDF/Nessus_10_12.pdf (credentialed scanning); https://docs.tenable.com/nessus/compliance-checks-reference/Content/PDF/NessusComplianceChecksReference.pdf (compliance/audit-file and STIG scanning, results reporting)
- **Retrieved:** 2026-08-05
- **Why included:** Supports JSIG RA-5 (vulnerability scanning) and CM-6/CA-2 (configuration/compliance auditing against a STIG or other security baseline) claims. These are Tenable's official, currently-published Nessus User Guide and Compliance Checks Reference documents, describing how to configure credentialed vulnerability scans, how to run compliance/audit-file scans (including DISA STIG audits and XCCDF results export), and how plugin-based compliance results (Pass/Fail/Warning) are reported and reviewed.

> **NOTE — THIS IS AN EXCERPT, NOT THE COMPLETE DOCUMENT.** The full Nessus 10.12 User Guide runs to 800+ pages and covers installation, licensing, scanner/agent architecture, the complete scan-template catalog, all credential types, plugin management, user/role administration, and the Nessus API. The Compliance Checks Reference is a similarly long standalone manual covering the full Tenable Audit Language used to write custom `.audit` files for dozens of platforms. Only the sections on configuring credentialed scans, configuring compliance/audit-file (including DISA STIG) scans, and reviewing/exporting compliance scan results are reproduced below. For the complete documents, see the source URLs above.

---

## Configuring a Credentialed Vulnerability Scan

**Credentialed Scan Overview** — Credentialed scans grant the Tenable Nessus scanner local access to scan target systems without requiring an agent. Credentialed scanning can facilitate scanning a large network to determine local exposures, compliance violations, missing security patches, and configuration issues. Credentialed scans can perform any operation that a local user can perform; the level of scanning depends on the privileges granted to the configured user account. The more privileges the scanner has through the login account, such as root or administrator access, the more thorough the scan results.

- Tenable Nessus opens several concurrent authenticated connections. The host being audited should not have a strict account lockout policy based on concurrent sessions.
- If a scan contains multiple credentials of one type, Tenable Nessus attempts the credentials on each scan target in the order in which they were added, and uses the first credential that allows a successful login. Nessus does not try other credentials once one succeeds, even if another credential has greater privileges.
- Scan credentials are stored in `global.db`; Tenable Nessus encrypts credentials stored in policies.

**Credential Types** — Tenable Nessus supports credentials for Cloud Services; Databases (MongoDB, Oracle, MySQL, DB2, PostgreSQL, SQL Server); Host credentials (Windows logins, SSH, SNMPv3); Miscellaneous services (VMware, Red Hat Enterprise Virtualization, IBM iSeries, Palo Alto Networks PAN-OS, ADSI, X.509); Mobile Device Management; Patch Management servers; and plaintext authentication mechanisms (FTP, HTTP, POP3, and others).

**General credentialed-scan workflow** (from the Get Started section):
1. Ensure your setup meets the minimum hardware/software requirements and obtain your activation code.
2. Install and perform initial configuration of Tenable Nessus.
3. Run a host discovery scan to identify assets on your network.
4. Create a scan and select a scan template (a Tenable-provided scanner template, an Agent template, or a user-defined template created via a policy).
5. Configure the scan settings, including scan targets.
6. If running a credentialed scan, configure credentials under the scan/policy's Credentials tab.
7. If running a compliance scan, select the compliance audits the scan includes.
8. If using an advanced scan template, select the plugins to include, then save and launch the scan.

## Configuring a Compliance / Audit-File (STIG) Scan

Compliance/audit-file scanning lets Nessus log in to Unix, Windows, Cisco, SCADA, IBM iSeries, and database systems and evaluate their configuration against a local site security policy (an "audit"), in addition to searching hard drives for unauthorized content. Credentialed access is required, and Tenable recommends administrator/root-equivalent scanning accounts — scans run with insufficient privileges may return incomplete, erroneous, or missing results.

**Selecting/adding compliance audits in a scan or policy:**
1. In a scan or policy, open the **Compliance** tab.
2. In the **Categories** drop-down, select the relevant platform category (for example, Windows, Unix, or Windows File Contents).
3. Nessus displays the available audit files for that category (Tenable-provided, including DISA STIG audits) or allows a custom audit file to be uploaded.
4. Select the audit file(s) to add to the scan or policy. A single audit file is a container for one or more policies that the scan evaluates.
5. Edit any Global Settings as required, then save the policy.

**Running Audits Such as DISA STIG:** DISA STIGs are among the compliance regulations/guides supported by Nessus compliance checks. A dedicated **Compliance Export XCCDF** feature (plugin ID **174792**) is available specifically for DISA STIG audits, letting XCCDF-format results be exported after a scan completes.

To enable XCCDF results for a DISA STIG audit (disabled by default for Policy Configuration Auditing, though enabled by default for SCAP scanning):
1. Select the **Policy Compliance Auditing** scan template.
2. On the **Settings** tab, select **Advanced**, then select **Custom** from the Scan Type drop-down.
3. Select **General**, then under **Compliance Output Settings**, check **Generate XCCDF result file**.
4. This option is also available on any scan template that allows audit-file selection, including **Advanced Scan**.

XCCDF (Extensible Configuration Checklist Description Format) is a component of the SCAP (Security Content Automation Protocol) standards family used to describe security checklists and provide a standardized results-reporting format, including target details, per-check results, and the XCCDF default score. Exported XCCDF files (named `xccdf_<host_address>_<audit_file>.xml`) can be imported into tools such as the DISA STIG Viewer for review.

## Exporting / Reviewing Scan Results and Plugin-Based Findings

**Compliance result states** — when an audit runs, Nessus determines whether a host is Compliant, Non-Compliant, or Inconclusive, and logs each individual check result as:

- **Pass**
- **Fail**
- **Warning**

(Tenable Security Center maps these to severities: Passed → **Info**, Failed → **High**, Inconclusive → **Medium**. An inconclusive result example is a permissions check for a file that isn't found on the target.) Unlike a vulnerability check — which reports only whether a vulnerability is present — a compliance check always reports a result, so compliance data can form the basis of an audit report showing that a host passed, failed, or could not be properly tested against a given control.

**Compliance export formats available as scan plugins:**

| Export type | Plugin ID | Plugin name | Notes |
|---|---|---|---|
| Gold Image Audit | 174791 | Compliance Export Gold Image Audit | Creates a "known-good" baseline audit file from scan results |
| JSON | 174790 | Compliance Export JSON | JSON-formatted results equivalent to the `.nessus` XML export, including `check_name`, `result` (PASSED/WARNING/FAILED/ERROR), `actual_value`, `policy_value`, `benchmark_name`, `benchmark_version`, and `see_also` reference link |
| XCCDF | 174792 | Compliance Export XCCDF | Only available when scanning with a DISA STIG audit |

To enable JSON or Gold Image Audit output, follow the same Settings → Advanced → Custom Scan Type → General → Compliance Output Settings path described above, selecting **Generate JSON result file** or **Generate Gold Image Audit file** respectively.

**Retrieving exported compliance results:**
1. Navigate to the scan's vulnerabilities/findings list.
2. Locate the relevant Compliance Export plugin (Gold Image Audit, JSON, or XCCDF) in the plugin output.
3. Find the file attachment(s) — one results file is generated per audit file used, named `results_<host_address>_<audit_file>.json`, `gold_<host_address>_<audit_file>.json`, or `xccdf_<host_address>_<audit_file>.xml` as applicable.
4. Click to download the attachment(s) for offline review or import into external GRC/STIG-review tooling.

Note: enabling any of these export plugins increases the storage size of scan results, and each plugin runs once per audit file per scan.

---

*End of excerpt. Full sources: https://docs.tenable.com/nessus/10_12/Content/PDF/Nessus_10_12.pdf and https://docs.tenable.com/nessus/compliance-checks-reference/Content/PDF/NessusComplianceChecksReference.pdf*
