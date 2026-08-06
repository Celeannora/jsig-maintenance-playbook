# Trellix (McAfee) ePolicy Orchestrator (ePO) Product Guide — Queries, Reports, Policy Compliance, DAT/Engine Status, and Threat Event Log (Excerpt)

- **Source URL:** http://b2b-download.trellix.com/PRODUCTS/naibeta-download/epo_460/previous%20postings/epo_460_beta2_productguide.pdf
- **Retrieved:** 2026-08-05
- **Why included:** Supports JSIG asset/software inventory reporting, policy compliance monitoring, malware signature (DAT/engine) currency verification, and security-relevant event logging claims. This ePolicy Orchestrator Product Guide is Trellix's (formerly McAfee's) official, currently-hosted vendor documentation describing the built-in Queries & Reports engine used to build asset/software inventory and policy-compliance dashboards, the standard query used to confirm DAT (virus definition) file currency across managed endpoints, and the Threat Event Log used to review malware detection/response events — supporting controls such as CM-8 (component inventory), CA-7/RA-5 (continuous monitoring and compliance reporting), SI-3 (malicious code protection / signature updates), and AU-6 (audit review, analysis, and reporting).

> **NOTE — THIS IS AN EXCERPT, NOT THE COMPLETE DOCUMENT.** The full ePolicy Orchestrator Product Guide runs to several hundred pages and covers installation, System Tree management, Policy Catalog administration, Master Repository/software deployment, permission sets, server tasks, and the complete query/reporting and event-management subsystems for all managed product extensions. Only the sections on the Queries & Reports engine (query types, the Query Builder wizard, and query sharing/export), the built-in DAT-deployment compliance query, Policy Management (policy compliance) queries, and the Threat Event Log (viewing, common event fields, and purging) are reproduced below. Field/menu labels below reflect the ePO 4.6 generation of the console; current Trellix ePO – On-prem 5.x releases use the same Queries & Reports / Threat Event Log architecture with an updated UI (Menu > Reporting > Queries & Reports; Menu > Reporting > Threat Event Log). For the complete, current-version document set, see https://docs.trellix.com/bundle/epolicy-orchestrator-5.10.0-product-guide.

---

## Reporting with Queries — Overview

ePolicy Orchestrator ships with its own querying and reporting capabilities. These are highly customizable, flexible, and easy to use. Included are the Query Builder wizard and Report Builder, which create and run queries and reports that result in user-configured data in user-configured charts and tables. The data for these queries and reports can be obtained from any registered internal or external database used with your McAfee (Trellix) ePO system.

**Queries** are essentially questions you ask ePolicy Orchestrator; answers are returned in various forms of charts and tables.

- A query can be used individually to get an answer right now. Any query's results can be exported to a variety of formats, any of which can be downloaded or sent as an attachment to an email message.
- Most queries can also be used as dashboard monitors, enabling near real-time system monitoring (refreshed automatically on a user-configured interval, five minutes by default).
- Queries can also be combined into **Reports**, giving a more broad and systematic look at your ePolicy Orchestrator system. Reports combine queries and other elements — including images and static text — into PDF documents, enabling focused, offline analysis, and can be run on-demand or on a regular schedule.
- Any query can be imported and exported, allowing queries to be shared between servers.
- Queries can retrieve data from any registered server, including databases external to ePolicy Orchestrator.

Exported query results are available in four formats: **CSV** (for use in a spreadsheet application), **XML** (to transform data for other purposes), **HTML** (viewable as a web page), and **PDF** (for printing).

### Creating custom queries (Query Builder wizard)

You create new queries with the four-step Query Builder wizard. Queries can access system properties, product properties, many of the log files, repositories, and more.

1. Click **Menu | Reporting | Queries**, then click **Actions | New Query**.
2. On the **Result Type** page, select the **Schema** to run the query against, then the **Feature Group** and **Result Type** for this query, then click **Next**. This choice determines the options available on subsequent pages of the wizard.
3. Select the type of chart or table to display the primary results of the query (Bar, Pie, Bubble, Summary Table, Line, or List/Table), then click **Next**.
4. Select the columns to be included in the query, then click **Next**.
5. Select properties to narrow the search results (filters), then click **Run**. The results are actionable — for example, you can deploy or wake up agents directly from a table of query results.
6. Click **Save**, name the query, choose a Private (My Groups) or Public (Shared Groups) group, then click **Save**.

## Asset / Software Inventory Reporting

ePO's System Management feature group includes Managed Systems result types that back asset-inventory queries — these can report installed software, product versions, and system properties across the managed estate, and can be filtered and exported the same way as any other query (CSV/XML/HTML/PDF). Query results in table form are actionable; for example, an inventory query populated with systems lets an administrator deploy agents or trigger tasks directly from the results table.

## Policy Compliance Queries and Dashboards

**Creating Policy Management queries** — use this task to create either of the following Policy Management queries:

- **Applied Policies** query — retrieves policies assigned to specified managed systems.
- **Broken Inheritance** query — retrieves information on policies that are broken in the system hierarchy.

Task:
1. Click **Menu | Reporting | Queries**, then click **Actions | New Query**.
2. On the **Result Type** page, select **Policy Management** from the **Feature Group** list.
3. Under **Result Types**, select **Applied Policies** or **Broken Inheritance**, then click **Next**.
4. Select the chart/table type, click **Next**; select columns, click **Next**; select filter properties, click **Run**.
5. Save the query to a private or public/shared group.

**Creating a query to define compliance** — compliance queries are required on ePO servers whose data is used in rollup (aggregate, multi-server) compliance queries.

1. Click **Menu | Reporting | Queries**, then click **Actions | New Query**.
2. On the **Result Type** page, select **System Management** as the Feature Group and **Managed Systems** as the Result Type, then click **Next**.
3. Select **Boolean Pie Chart** from the Display Result As list, then click **Configure Criteria**.
4. Select the properties that define what is "compliant" for systems managed by this server, set operators and values for each property, then click OK.
5. Select columns, click Next; select filters, click Run, then Save.

## DAT / Engine Signature-Version Status Reporting

**Confirming that clients are using the latest DAT files** — use this task to check the version of DAT (virus-definition signature) files on managed systems:

- Click **Menu | Reporting | Queries**, select **VSE: DAT Deployment** in the Queries list, then click **Actions | Run**.

This built-in query reports DAT version compliance across all managed endpoints and is the standard mechanism referenced by Trellix's own License Management Services process for producing "DAT Deployment Reports," which list all deployed DAT versions along with the number of systems reporting each version (see the related Trellix ePO Instructions documentation at https://www.trellix.com/downloads/epo-instructions/). Engine version and DAT currency are also exposed as standard columns/properties available to the Query Builder for custom compliance and inventory queries.

## The Threat Event Log

Use the **Threat Event Log** to quickly view and sort through malware/threat detection events in the ePO database. The log can be purged only by age. You can choose which columns are displayed in the sortable table from a variety of event data fields, and — depending on which products are managed — take certain actions on the events from the Actions menu.

Most managed products use a common event format. Fields of this format usable as Threat Event Log columns include (selected):

- **Action Taken** — action taken by the product in response to the threat.
- **DAT Version** — DAT version on the system that sent the event.
- **Engine Version** — version number of the detecting product's engine (if applicable).
- **Detecting Product Name / Version** — name and version of the managed product that detected the threat.
- **Event Generated Time (UTC)** / **Event Received Time (UTC)** — when the event was detected vs. received by the ePO server.
- **Threat Name**, **Threat Type**, **Threat Source Host Name / IPv4 / IPv6 / MAC / URL / User Name** — details of the detected threat and its origin.
- **Host Name**, **IPv4/IPv6/MAC Address** — identity of the reporting (target) system.

**Viewing the Threat Event Log:**
1. Click **Menu | Reporting | Threat Event Log**.
2. Click any column title to sort events, or click **Actions | Choose Columns** to select which table columns to display, then click Save.
3. Select events in the table, then click **Actions | Show Related Systems** to see details of the systems that sent the selected events.

**Purging Threat Events** (manual): Menu | Reporting | Threat Event Log → **Actions | Purge** → specify "Purge records older than" a number and time unit → OK. Purged records are deleted permanently.

**Purging the Threat Event Log on a schedule:** Menu | Automation | Server Tasks → New Task → name/enable the task → on the Actions page select **Purge Threat Event Log** → choose to purge by age or by a query's results → schedule the task → Save.

---

*End of excerpt. Full source: http://b2b-download.trellix.com/PRODUCTS/naibeta-download/epo_460/previous%20postings/epo_460_beta2_productguide.pdf — current-version product documentation index: https://docs.trellix.com/bundle/epolicy-orchestrator-5.10.0-product-guide*
