# Veeam Backup & Replication User Guide — Session Results, SureBackup Verification, and Backup Copy Retention (Excerpt)

- **Source URL:** https://helpcenter.veeam.com/docs/vbr/userguide/session_results_web.html
- **Retrieved:** 2026-08-05
- **Why included:** Supports CP-9 (System Backup) backup-monitoring and restore-verification evidence — Veeam job/session history review, SureBackup automated restore-verification testing, and backup copy job retention configuration used to demonstrate CP-9(1) reliability/integrity testing and CP-9(2) sampled test restoration.

> **NOTE — THIS IS AN EXCERPT, NOT THE COMPLETE DOCUMENT.** The full Veeam Backup & Replication User Guide (helpcenter.veeam.com) contains hundreds of topics covering installation, infrastructure configuration, all job types, replication, tape, cloud tiering, and troubleshooting. Only the topics on job session results, SureBackup verification, and backup copy job retention are reproduced below, drawn from several official Veeam Help Center pages. For the complete guide, see the Veeam Help Center at the source URLs below.

---

## Viewing Job Session Results

To review the results of a backup, replication, or copy job session, open the job's statistics:

- In the Veeam console, select the **Jobs** node in the inventory pane, then open **Details** or the **History** box to see the list of job sessions.
- Alternatively, session results can be reviewed from the **Logs and Events** node.

The session statistics window provides:

- **History** — a timeline of past sessions shown as colored dots (green = successful backups); results can be filtered to show **All**, **Success**, **Warning**, or **Error** sessions only.
- **Protection Overview** — a summary of how well the protected workloads are currently covered.
- **Session Details** — presented in two views: **Job View** (per-job summary) and **Workload View** (per-VM/per-object results within the job).
- **Status box** — shows per-task status (Success / Warning / Failed); one task typically corresponds to one VM or workload in the job.
- **Job Session Results box** — reports session **Duration**, the detected **Bottleneck** (Source, Proxy, Network, or Target), **Processing rate**, amount **Read**, amount **Processed**, and amount **Transferred**.
- A colored **Throughput graph** distinguishes data **Processed** (light blue) from data actually **Transferred** (dark blue), which helps identify the impact of deduplication/compression and incremental-only processing.

*(Source: Veeam Backup & Replication User Guide — "Viewing Job Session Results" — https://helpcenter.veeam.com/docs/vbr/userguide/session_results_web.html)*

## SureBackup — Automated Restore Verification Testing

SureBackup automatically verifies that VM backups are recoverable, without requiring an administrator to manually perform a full restore. It supports two verification modes:

1. **Full recoverability testing** — Veeam Backup & Replication starts the VM directly from the backup file in an isolated **virtual lab** (so production is not affected) and runs a series of tests: a heartbeat test, a ping test, and, if the VMware Tools/Veeam application-aware component supports it, application-specific tests performed via the vPower NFS service. An optional malware scan and CRC-based backup file validation can also run as part of this mode. Results are compiled into a report that can be emailed to the administrator.
2. **Backup verification and content scan only** — a lighter-weight mode that does not require a virtual lab; it performs only the malware scan and CRC validation of the backup file contents, without booting the VM.

SureBackup relies on three configured objects: an **Application Group** (VMs required for dependent services, e.g., a DC or DNS server), a **Virtual Lab** (isolated network environment), and the **SureBackup job** itself (which ties the application group, virtual lab, and backup jobs/VMs to test together).

During verification, the backup image itself remains **read-only** — any changes made while the VM runs in the virtual lab are written to redo logs (AVHD/AVHDX differencing disks) that are discarded once the SureBackup job finishes, leaving the original backup file unmodified.

*(Source: Veeam Backup & Replication User Guide — "How SureBackup Works" — https://helpcenter.veeam.com/docs/vbr/userguide/surebackup_hiw.html)*

## Backup Copy Job Retention Settings

Veeam Backup & Replication supports two retention schemes for **backup copy jobs**, configured independently of the retention policy on the source backup job:

1. **Short-Term Retention Policy** — retains a rolling window of restore points measured in days.
2. **GFS (Grandfather-Father-Son) Retention Policy** — retains additional long-term restore points on a Weekly, Monthly, and Yearly basis, layered on top of the short-term policy.

### Short-Term Retention Policy details

- The minimum configurable short-term retention is **2 days**.
- The **first** backup copy session produces a full backup; subsequent sessions produce incrementals, forming a forever-forward incremental chain.
- Regardless of the configured number of retention days, Veeam Backup & Replication always keeps a **minimum of 3 restore points**.
- Retention is effectively counted as **N+1 days** of restore points.
- Example: with a 7-day retention policy starting on Sunday, a full backup is created that Sunday, followed by 6 incremental restore points (Monday–Saturday); the oldest restore point is merged into the full backup on the following Sunday when the new copy interval begins.

### GFS Retention Policy

The GFS scheme layers **Weekly**, **Monthly**, and **Yearly** full backups on top of the short-term policy, allowing long-term retention points to be kept for compliance or audit purposes without retaining every daily incremental for the full retention period.

*(Source: Veeam Backup & Replication User Guide — "Short-Term Retention Policy" — https://helpcenter.veeam.com/docs/vbr/userguide/backup_copy_simple_retention.html; "Retention Policy for Backup Copy Jobs" — https://helpcenter.veeam.com/docs/vbr/userguide/backup_copy_retention.html)*

---

*End of excerpt. Full source: https://helpcenter.veeam.com/docs/vbr/userguide/session_results_web.html*
