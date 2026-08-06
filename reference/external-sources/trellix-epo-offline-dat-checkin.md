# Trellix (McAfee) ePolicy Orchestrator — Manual/Offline DAT and Engine Package Check-In to the Master Repository (Excerpt)

- **Source URL:** https://docs.trellix.com/bundle/trellix-epolicy-orchestrator-on-prem-5.10.0-product-guide/page/UUID-de204866-2a8c-bc4a-3422-ea899abe1dd9.html (current ePO On-Prem 5.10.0 Product Guide — "Check in packages manually"); http://b2b-download.trellix.com/PRODUCTS/naibeta-download/epo_460/previous%20postings/epo_460_beta2_productguide.pdf (legacy ePO 4.6 Product Guide — Master Repository / Source Sites / manual DAT-engine check-in chapters)
- **Retrieved:** 2026-08-05
- **Why included:** Supports JSIG SI-3 (malicious code protection) and CM-3/CM-8 (configuration/change management, software inventory currency) claims for an air-gapped ePO deployment. These are Trellix's (formerly McAfee's) official, currently-hosted ePolicy Orchestrator product documentation pages describing how DAT (virus-definition) and engine update packages are normally pulled automatically from an internet-based source site, and — critically for a disconnected/air-gapped ePO server — how to manually check those same packages into the ePO Master Repository from a locally downloaded file instead, with no outbound internet access required by the ePO server itself.

> **NOTE — THIS IS AN EXCERPT, NOT THE COMPLETE DOCUMENT.** The current Trellix ePO On-Prem 5.10.0 Product Guide is a large, multi-chapter bundle covering full repository architecture (Master, Distributed, and Source Repositories of type HTTP/FTP/UNC/SuperAgent), the Software Catalog, extensions, policies, and client tasks. The legacy ePO 4.6 Product Guide PDF (also cited in `trellix-epo-product-guide.md` in this repository) is used here for its detailed Source Site / Master Repository background because it explicitly documents pull-task automation versus fully manual check-in for DAT/engine files. Only the manual package check-in procedure, the Source Site / distributed-repository (UNC and HTTP) background explaining why manual check-in is the air-gapped alternative, and the specific "checking in engine, DAT and ExtraDAT update packages manually" task are reproduced below. For the complete, current documentation, see the current-guide source URL above.

---

## Background: Source Sites vs. Manual Check-In

The **Master Repository** maintains the latest versions of security software and updates for the environment and is the source for the rest of the deployment. The **Source Site** provides updates to the Master Repository; the default source site is the internet-based `McAfeeHttp` update site.

- Source sites are **not required**. Updates can instead be **downloaded manually and checked in to the Master Repository** — using a source site simply automates that process.
- McAfee/Trellix update sites regularly post DAT and engine files (DAT files are posted daily) as well as some language packs.
- **All other packages and updates — including service packs, patches, and supplemental virus-definition (ExtraDAT) files — must be checked in to the Master Repository manually**, regardless of whether a source site is configured, because the update sites do not distribute them.
- **Distributed repositories** that host copies of the Master Repository's contents can be built on an **HTTP server** (for example, Microsoft IIS hosting a new folder/site location) or a **UNC share** (a folder created on the system with sharing enabled). Source Sites can likewise be configured as type **HTTP**, **UNC**, or **FTP** via **Menu | Software | Source Sites | Actions | New Source Site**, entering the web address/port (HTTP/FTP) or the network path in `\\<COMPUTER>\<FOLDER>` format (UNC).

For an air-gapped ePO deployment with no route to the internet-based `McAfeeHttp`/`McAfeeFtp` sites, the manual check-in path — downloading the DAT/engine/ExtraDAT package on a separate internet-connected machine, transferring it to the ePO server, and checking it in directly — is the applicable update mechanism in place of an automated pull task.

## Checking In Packages Manually (Current ePO On-Prem 5.10.0 Product Guide)

Use this task to manually check in deployment packages to the Main Repository so the software can deploy them.

1. Select **Menu | Software | Master Repository**, then click **Check In Package**.
2. Select the **Package type**, browse to and select the package file, then click **Next**.
3. Confirm or configure:
   - **Package info** — confirm this is the correct package.
   - **Branch** — select the branch to check the package into. If your environment requires testing new packages before deploying them broadly, use the **Evaluation** branch when checking in packages; after testing, move packages from **Evaluation** to the **Current** branch.
   - **Options** — optionally select **Move the existing package to the Previous branch**, which moves the existing package of the same type from **Current** to **Previous** when the newer package is checked in (available only when **Current** is selected as the branch).
   - **Package signing** — specifies whether the package is a Trellix or third-party package.
4. Click **Save** to begin checking in the package, then wait while the package is checked in.

The new package appears in the **Packages in Main Repository** list.

## Checking In Engine, DAT, and ExtraDAT Update Packages Manually (Legacy ePO 4.6 Product Guide)

Use this task to manually check in update packages to the master repository for deployment via the ePolicy Orchestrator software. Some packages — such as service packs, patches, and supplemental virus-definition (ExtraDAT) files — **can only be checked in manually**, even when a pull task from a source site is otherwise configured, because McAfee's update sites do not retrieve ExtraDAT files.

**Task:**

1. Click **Menu | Software | Master Repository**, then click **Actions | Check In Package**. The **Check In Package** wizard opens.
2. Select the package type, then browse to and select the desired package file.
3. Click **Next**. The **Package Options** page appears.
4. Select a branch:
   - **Current** — use the packages without testing them first.
   - **Evaluation** — used to test the packages in a lab environment first. Once testing is finished, move them to the **Current** branch via **Menu | Software | Master Repository**.
   - **Previous** — use the previous version to receive the package.
5. Next to **Options**, select whether to **Move the existing package to the Previous branch** (moves the existing package of the same type being checked in to the Previous branch).
6. Click **Save** to begin checking in the package. Wait while the package is checked in.

**Distributing DAT and engine update packages — high-level process:** Check in the update package to the master repository with a pull task, **or manually**; the manual method is the applicable path when the master repository (and the ePO server) has no source-site connectivity.

## Confirming DAT Currency After Check-In

Use this task to check the version of DAT files on managed systems after a manual (or pull-task) update:

- Click **Menu | Reporting | Queries**, select **VSE: DAT Deployment** in the Queries list, then click **Actions | Run**.

This built-in query reports DAT-version compliance across managed endpoints regardless of whether the DAT package reached the Master Repository via an automated source-site pull or a manual offline check-in.

---

*End of excerpt. Full sources: https://docs.trellix.com/bundle/trellix-epolicy-orchestrator-on-prem-5.10.0-product-guide/page/UUID-de204866-2a8c-bc4a-3422-ea899abe1dd9.html and http://b2b-download.trellix.com/PRODUCTS/naibeta-download/epo_460/previous%20postings/epo_460_beta2_productguide.pdf — current-version product documentation index: https://docs.trellix.com/bundle/epolicy-orchestrator-5.10.0-product-guide*
