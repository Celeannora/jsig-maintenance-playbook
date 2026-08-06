# Veritas NetBackup — Job Monitoring, Catalog Verification, Restore, and Retention/Expiration (Excerpt)

- **Source URL:** https://www.veritas.com/support/en_US/doc/150157642-165935937-0/v130722414-165935937
- **Retrieved:** 2026-08-05
- **Why included:** Supports CP-9 (System Backup) backup-verification and test-restore evidence requirements — NetBackup job/status monitoring, `bpverify` catalog-integrity checks, restore-verification procedure, and `bpexpdate`/retention-level configuration used to demonstrate CP-9(1) reliability/integrity testing and CP-9(2) sampled test restoration.

> **NOTE — THIS IS AN EXCERPT, NOT THE COMPLETE DOCUMENT.** The official NetBackup documentation set spans multiple full manuals (Administrator's Guide Volumes I & II, Web UI Administrator's Guide, Commands Reference Guide, Security and Encryption Guide) totaling thousands of pages across many product versions. Only the sections relevant to job monitoring, catalog/image verification, restore verification, and retention/expiration are reproduced below, drawn from several official Veritas support pages. For the complete documentation set, see the Veritas NetBackup documentation portal at the source URLs below.

---

## Monitoring Backup Jobs (Activity Monitor / Jobs)

The NetBackup Activity Monitor (Admin Console) and the Jobs node (Web UI) let an administrator monitor all NetBackup job activity, including backup, restore, duplication, and verification jobs.

- The **Jobs** list view displays one row per job with columns such as Job ID, Job Type, State, Status, Policy, Schedule, Client, and Start/End time.
- **Job States** include: `Queued`, `Active`, `Re-Queued`, and `Done`. A job that is `Done` has finished processing; its outcome is reflected in the **Status** field.
- The **Status** field returns a numeric NetBackup status code: `0` indicates the job completed **successfully**; a non-zero status indicates a problem occurred. A status of `1` indicates the job was **partially successful** (for example, some files were not backed up due to being in use).
- Double-clicking a job opens the **Job Details** dialog, which has an **Job Overview** tab (summary information) and a **Detailed Status** tab (the full log of job activity, useful for diagnosing non-zero status codes). NetBackup's status-code reference (accessible via the Troubleshooter) documents the meaning of each non-zero status and recommended remediation steps.
- Role-based access control (RBAC) determines which jobs a given operator/administrator role can see in the Jobs list.

*(Source: NetBackup Web UI Administrator's Guide, "Monitoring NetBackup activity" — https://www.veritas.com/support/en_US/doc/150157642-165935937-0/v130722414-165935937)*

## Verifying the Backup Catalog / Image List

NetBackup maintains a catalog of all backup images. Administrators can search this catalog and run a **Verify** action against specific images to confirm that the data on the backup media matches what NetBackup's catalog expects.

**Procedure (NetBackup Web UI / Admin Console):**
1. In the NetBackup web UI, go to the **Catalog** page (or, in the Admin Console, expand **NetBackup Management > Catalog**).
2. Set search criteria — Policy type, Client, Backup ID, date range — and select **Search Now** to populate the image list.
3. Select one or more backup images from the results.
4. From the **Action** list, choose **Verify** (other available catalog actions include Duplicate, Phase 1 Import, and Phase 2 Import).
5. Review verification results on the **Results** tab of the job.

*(Source: NetBackup Web UI Administrator's Guide, Catalog topic — https://origin-www.veritas.com/support/en_US/doc/150157642-150157673-0/v152563930-150157673)*

### `bpverify` command

`bpverify` is the underlying command used to verify backups by reading the backup volume/image and comparing its contents against the NetBackup catalog. It confirms that catalog information matches what is on the backup media and that the media is readable — **it does not compare the data on the volume against the original files on the client disk.**

```
bpverify -hoursago hours | -pt policy_type | -policy policy_name |
         -client client_name | -backupid backup_id | -Bidfile file_name
         [-p policy_name] [-s sched_name] [-t sched_type]
         [-M master_server,...] [-verbose] [-l | -L]
```

Example:
```
bpverify -hoursago 36
```
This verifies all backups created in the last 36 hours. Verification reads each block on the backup media to confirm the volume is readable, and reports success/failure per image. `bpverify` returns exit status `0` on success and a non-zero NetBackup status code on failure — the same status-code space used by backup jobs.

*(Source: NetBackup Commands Reference Guide, `bpverify` — https://www.veritas.com/support/en_US/doc/123533878-127136857-0/v123545982-127136857)*

## Performing and Verifying a Test Restore

Restore/recovery testing is performed from the **Recovery** page of the NetBackup web UI:

1. Go to **Recovery** and select **Start recovery**.
2. Choose the **Regular recovery** wizard, then select the Policy type and the source Client.
3. On the **Recovery details** tab, use **Preview media** to confirm which media/images will be used to satisfy the restore, then select the backup image and files/folders to restore.
4. On the **Recovery options** tab, choose the restore target (original location or an alternate client/path) and any special recovery options, such as recovery of malware-infected files.
5. Set the **Job priority** (default `90000`; valid range `0–99999`) to control scheduling relative to other jobs.
6. Review all selections on the **Review** tab, then select **Start recovery** to launch the restore job.
7. Monitor the resulting restore job in the Activity Monitor/Jobs list; a completed status of `0` confirms a successful test restore. Detailed Status logs provide file-level confirmation of what was restored.

*(Source: NetBackup Web UI Administrator's Guide, Recovery — https://www.veritas.com/support/en_US/doc/150157642-170198590-0/v170206703-170198590)*

## Retention and Expiration Policy Configuration

NetBackup assigns each backup image a **retention level** (0–100) that determines how long the image is retained before it expires and can be reused/overwritten. Two levels are fixed and cannot be edited:

- **Level 9 = Infinite** — the backup never expires.
- **Level 25 = Expire immediately** — the backup expires as soon as it completes.

Administrators configure the retention period (e.g., 1 week, 2 weeks, 1 month, 1 year) associated with each of the other numbered levels in the Master Server's **Retention Periods** host properties, and then assign a retention level to each backup policy schedule.

**Recommended retention guidance:** full backups should generally be retained longer than the backup frequency (for example, a weekly full-backup schedule should retain full backups for 2–4 weeks), and incremental backups should be retained longer than the interval between full backups, so that a complete restore chain remains available.

### `bpexpdate` command

`bpexpdate` changes the expiration date of existing backups or media directly, independent of the original retention level assigned at backup time:

```
bpexpdate -backupid backup_id -d date | -d 0 | -d infinity
          [-copy copy_number]
bpexpdate -recalculate -backupid backup_id -ret retention_level
bpexpdate -m media_id -d date | -d 0 | -d infinity
```

- `-d 0` expires the backup **immediately**.
- `-d infinity` sets the backup to **never expire**.
- `-recalculate -ret retention_level` recalculates and resets the expiration date based on a specified retention level (0–100); level 25 (expire immediately) cannot be used with `-recalculate`.

Examples:
```
bpexpdate -m BU0002 -d 0
bpexpdate -recalculate -backupid 1234 -ret 4
```

*(Source: NetBackup Commands Reference Guide, `bpexpdate` — https://www.veritas.com/support/en_US/doc/123533878-127136857-0/v123537795-127136857; Retention Periods host properties — https://www.veritas.com/support/en_US/doc/18716246-126559472-0/v40229538-126559472)*

---

*End of excerpt. Full source: https://www.veritas.com/support/en_US/doc/150157642-165935937-0/v130722414-165935937*
