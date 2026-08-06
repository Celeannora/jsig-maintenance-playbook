# Splunk Enterprise — Scheduled Alerts, SPL Search Syntax for Event Review, and Index Data Retention (Excerpt)

- **Source URL:** https://help.splunk.com/en/splunk-enterprise/alert-and-respond/alerting-manual/9.1/create-alerts/create-scheduled-alerts (scheduled alerts); https://help.splunk.com/en/splunk-enterprise/search/search-manual/9.4/save-and-schedule-searches/scheduling-searches (scheduling searches); https://help.splunk.com/en?resourceId=Splunk_SearchReference_Search&version=splunk-9_4 (SPL `search` command syntax); https://help.splunk.com/en/splunk-enterprise/search/search-manual/9.4/search-overview/types-of-searches (types of searches); https://help.splunk.com/en/data-management/manage-splunk-enterprise-indexers/9.1/back-up-and-archive-your-indexes/set-a-retirement-and-archiving-policy (index retention/archiving)
- **Retrieved:** 2026-08-05
- **Why included:** Supports JSIG AU-6 (audit review, analysis, and reporting) and AU-11 (audit record retention) claims. These are Splunk's official, currently-published Splunk Enterprise documentation pages (docs.splunk.com content, served via help.splunk.com) describing how to schedule saved searches/alerts for recurring log review, the basic Search Processing Language (SPL) syntax used to query security/audit event logs, and how index data-retention (hot/warm/cold/frozen bucket lifecycle) is configured.

> **NOTE — THIS IS AN EXCERPT, NOT THE COMPLETE DOCUMENT SET.** The full Splunk Enterprise documentation spans multiple manuals (Admin Manual, Search Manual, Search Reference, Alerting Manual, Managing Indexers and Clusters of Indexers) totaling thousands of pages covering deployment topology, index-time and search-time field extraction, knowledge objects, clustering/replication, and the complete SPL command catalog. Only the sections on creating/scheduling a saved search and alert, core `search` command syntax relevant to reviewing security/audit events, the distinction between raw-event and transforming searches, and index retirement/archiving basics are reproduced below. For the complete manuals, see the source URLs above.

---

## Creating and Scheduling a Saved Search and Alert

Splunk Enterprise supports scheduling searches to run on a regular basis via three mechanisms:

| Option | Description |
|---|---|
| **Report** | After saving a search as a report, it can be converted into a scheduled report — a report that runs on a scheduled interval and can trigger an action (send email or run a script) each time it runs. |
| **Dashboard panel** | An ad hoc search saved as a dashboard panel can be edited and converted into a scheduled report. |
| **Alert** | A scheduled alert searches for events on a regular schedule; scheduling, trigger conditions, and throttling are all configurable. |

### Creating a scheduled alert

1. Navigate to the **Search** page in the **Search and Reporting** app.
2. Create a search.
3. Select the option to save the search as an alert.
4. Enter a title and optional description.
5. Specify permissions.
6. Configure alert scheduling. There are two scheduling approaches:
   - Select one of the available preset scheduling options and set a time; or
   - For finer-grained control, select **Run on Cron Schedule**, which uses a search time range plus a cron expression:
     - Enter **Earliest** and **Latest** values for the search time range (these override the original search time range). To avoid overlaps or gaps, the execution schedule should match the search time range — for example, to run a search every 20 minutes, the search time range should also be `-20m`.
     - Enter a cron expression to schedule the search.
7. (Optional) Adjust the **Expires** setting, which controls how long triggered alert records persist on the **Triggered Alerts** page.
8. Configure trigger conditions (the criteria that determine when the alert fires).
9. (Optional) Configure a trigger throttling period to suppress repeated firing.
10. Select one or more alert actions to occur when the alert triggers (for example, send email, run a script, or other configured actions).
11. Click **Save**.

This scheduled-alert mechanism is the standard Splunk Enterprise pattern for recurring, automated review of security- and audit-relevant event data (e.g., a saved search over an authentication or access-control index that alerts when a threshold of failed-login or privilege-escalation events is exceeded within a scheduled window).

## Basic SPL Search Syntax for Reviewing Security/Audit Event Logs

### Types of searches

Splunk searches fall into two general categories:

- **Raw event searches** — retrieve events from an index or indexes and are typically used to investigate a problem (checking error codes, correlating events, investigating security issues, analyzing failures). These typically use only the implied `search` command and return a list of raw events.
- **Transforming searches** — retrieve events and then pass them into one or more search commands to perform a statistical calculation (for example, a daily count of error events, or counting logins per user). Transforming searches always require fields and at least one statistical command.

Searches can also be described by information density: **sparse** ("needle in a haystack") searches look for a single or infrequent event (e.g., a specific IP address or error code), while **dense** searches scan and report on many events (e.g., counting all errors from a host).

### The `search` command

The `search` command retrieves events from indexes (or filters results already in the pipeline) using keywords, quoted phrases, wildcards, and field-value expressions, and is implied at the start of every search. The pipe character (`|`) applies subsequent commands to retrieved events.

**Syntax:** `search <logical-expression>`, where a logical expression may combine comparison expressions (`<field><comparison-operator><value>` or `<field> IN (<value-list>)`), Boolean operators (`AND`/`OR`/`NOT` — `XOR` is not supported), time modifiers (`earliest=`, `latest=`, `starttime=`, `endtime=`), and search modifiers (`sourcetype=`, `host=`, `source=`, `eventtype=`, `splunk_server=`).

The `AND` operator is implied between terms — `web error` is equivalent to `web AND error`.

**Representative examples relevant to security/audit event review:**

```spl
src="10.9.165.*" OR dst="10.9.165.8"
```
Field-value pair matching on source/destination IP.

```spl
(code=10 OR code=29) host!="localhost" xqp>5
```
Boolean and comparison operators combined; equivalent using `IN`:
```spl
code IN(10, 29) host!="localhost" xqp>5
```

```spl
host=webserver* (status=4* OR status=5*)
```
Wildcards to find client/server error status codes across a host pattern; equivalent using `IN`:
```spl
host=webserver* status IN(4*, 5*)
```

```spl
sourcetype=access_combined_wcookie action IN (addtocart, purchase)
```
Filtering a log's `action` field to one of several values using `IN`.

```spl
eventtype=web-traffic | transaction clientip startswith="login" endswith="logout" | search eventcount>3
```
Defining a session/transaction and filtering to sessions with more than three events — a pattern applicable to reviewing multi-event sequences such as repeated authentication attempts.

```spl
NOT clientip IN (211.166.11.101, 182.236.164.11, 128.241.220.82)
```
Excluding a list of known/allowed source addresses (`NOT` with `IN`).

```spl
ip="10.10.10.0/24"
```
CIDR matching to find events with source/destination addresses inside a given subnet (both IPv4 and IPv6 CIDR notation are supported).

For comparing two fields to each other (not a field to a literal), the `search` command cannot be used directly — the `where` command is required instead, e.g. `index=myindex | where fieldA=fieldB`.

Field values that are also Boolean-operator keywords (`AND`, `OR`, `IN`, `AS`) must be quoted, e.g. `country="IN"`.

## Data Retention and Index Management Basics

Splunk Enterprise indexers store indexed data in directories called **buckets**, which move through four retirement stages:

| Bucket stage | Description | Searchable? |
|---|---|---|
| Hot | Newly indexed data; open for writing. One or more hot buckets per index. | Yes |
| Warm | Data rolled from hot; many warm buckets. | Yes |
| Cold | Data rolled from warm; many cold buckets. | Yes |
| Frozen | Data rolled from cold. Deleted by default, but can instead be archived (and later restored/"thawed"). | No |

Data retirement/archiving policy is configured by controlling **index size** and **data age**, via attributes in `indexes.conf`:

- **`maxTotalDataSizeMB`** — the maximum size an index may grow to before the oldest data rolls to frozen. Default is 500,000 MB. Example, capping an index at 250,000 MB:
  ```ini
  [main]
  maxTotalDataSizeMB = 250000
  ```
- **`frozenTimePeriodInSecs`** — the age (in seconds) at which a bucket's most recent data triggers rolling the entire bucket to frozen. Default is 188,697,600 seconds (~6 years). Example, freezing data older than 180 days (15,552,000 seconds):
  ```ini
  [main]
  frozenTimePeriodInSecs = 15552000
  ```

Data rolls to frozen when *either* threshold is reached first; if `maxTotalDataSizeMB` is reached before the configured time period elapses, data will be rolled to frozen early, so both settings should be configured deliberately to avoid unintended audit-log loss. Changing retirement/archiving settings can cause the indexer to delete old data without prompting, and applying a new policy can take time to fully take effect (with possible high CPU usage while buckets are moved/rolled).

To retain frozen data instead of deleting it, the indexer must be explicitly configured to archive on freeze; archived data can later be restored ("thawed"). Other conditions (e.g., a bucket reaching its configured maximum size, `maxDataSize`) can also cause buckets to roll and are documented under index storage configuration.

---

*End of excerpt. Full sources: https://help.splunk.com/en/splunk-enterprise/alert-and-respond/alerting-manual/9.1/create-alerts/create-scheduled-alerts, https://help.splunk.com/en/splunk-enterprise/search/search-manual/9.4/save-and-schedule-searches/scheduling-searches, https://help.splunk.com/en?resourceId=Splunk_SearchReference_Search&version=splunk-9_4, https://help.splunk.com/en/splunk-enterprise/search/search-manual/9.4/search-overview/types-of-searches, and https://help.splunk.com/en/data-management/manage-splunk-enterprise-indexers/9.1/back-up-and-archive-your-indexes/set-a-retirement-and-archiving-policy*
