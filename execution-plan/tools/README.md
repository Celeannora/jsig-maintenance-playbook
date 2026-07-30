# Variance / Risk-Acceptance Tooling

Turns an official DISA STIG finding ID (e.g. `V-253259`) into a ready-to-review, ready-to-sign Variance/Risk-Acceptance Record — without any live scan-tool integration and without any internet access at generation time.

This folder also builds and maintains matching offline reference databases for two other identifier types a Nessus scan report can hand you: **CVE IDs** (e.g. `CVE-2021-44228`) — see [CVE reference tooling](#cve-reference-tooling-nessus-findings) below — and bare numeric **Nessus Plugin IDs** (e.g. `156327`) — see [Nessus Plugin ID reference tooling](#nessus-plugin-id-reference-tooling) below. Prefer the CVE path when your scan output names a specific CVE (NVD is the official source of record for CVE metadata); use the Plugin ID path when what you have is the scan report's numeric Plugin ID itself, or when the plugin cites no CVE at all (common for local version-check and informational plugins). `generate_variance.py` accepts all three identifier types in the same `--id` flag (STIG `V-NNNNNN`, CVE `CVE-YYYY-NNNN...`, or a bare-digits Plugin ID) and auto-detects which one you passed, so the same command renders a variance record from a STIG compliance-audit finding or either shape of a Nessus vulnerability-scan finding. It writes both a Markdown record (source of truth, meant to be committed) and a standalone HTML record (inline CSS, opens in any browser, no external assets) by default — see [Step 2](#step-2--generate-a-variancerisk-acceptance-record) below.

## Why this exists

When a configuration/vulnerability review turns up a finding, someone has to formally document what it is, what the official requirement actually says, and who accepts or rejects the risk. Doing that by hand invites transcription errors in check text, fix text, and CCI mappings, and inconsistent sign-off routing. This tool set removes both problems:

- Official finding text is pulled verbatim from DISA-published content, never retyped.
- The sign-off chain is derived automatically from the finding's severity (CAT I/II/III), per the severity-tiered RACI in `execution-plan/templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md`.

## Why there is no Nessus / SCC / OpenSCAP result parser here

An earlier iteration of this tool set planned to parse live scan-tool export files (`.nessus`, SCC `.ckl`, OpenSCAP XCCDF-results) to auto-detect findings. That was deliberately set aside in favor of a simpler, more robust design: **bulk-import the official reference documents themselves**, and let a human name the specific finding ID they're documenting. This avoids maintaining three separate, brittle XML parsers for tool-specific export formats that change across tool versions, and keeps the system's only input format tied to one stable, versioned, DISA-controlled standard (XCCDF). If a future need justifies re-adding scan-export parsing, it should sit as an optional layer that feeds finding IDs into `generate_variance.py` — it should not replace the reference database approach below.

## How the pieces fit together

```
 official DISA STIG .zip packages           (downloaded by a person, in bulk)
            |
            v
   stig_intake/  (drop zips or extracted *-xccdf.xml files here, unmodified)
            |
            v
   stig_reference_builder.py build   -->  data/stig_reference.json
            |                              (the offline reference database)
            v
   generate_variance.py --id V-253259 --asset ... --preparer ...
            |
            v
   ../variance-records/VAR-V-253259-<asset>-<date>.md   (source of truth, commit this)
   ../variance-records/VAR-V-253259-<asset>-<date>.html  (standalone, browser-ready copy)
            |
            v
   routed for peer review + severity-tiered sign-off (Section 4/10 of the record)
```

The same pipeline works for a CVE ID (e.g. `CVE-2021-44228`) once it's been fetched into `data/cve_reference.json` by `cve_reference_builder.py` — see [CVE reference tooling](#cve-reference-tooling-nessus-findings) below — or for a bare Nessus Plugin ID (e.g. `156327`) once it's been fetched into `data/nessus_reference.json` by `nessus_reference_builder.py` — see [Nessus Plugin ID reference tooling](#nessus-plugin-id-reference-tooling) below.

## Step 1 — Bulk import official STIG documents

You have two official options, both supported by the same command — pick whichever fits how much you want to import at once:

**Option A — targeted, one/few products at a time.** From a normal (unclassified, no-CAC-required) connected workstation, visit [public.cyber.mil/stigs/downloads](https://public.cyber.mil/stigs/downloads/) and download the specific official STIG/SRG `.zip` package(s) you need.
   - CUI-marked content on `cyber.mil` requires a CAC. This tool only handles unclassified content; CUI STIGs are out of scope and should be handled per your organization's CUI process.
   - A live automated crawler against this page was evaluated and rejected: the page is a dynamic, shadow-DOM-based experience with no stable link pattern to script against safely. Manual download of the `.zip` is the reliable path — this is a one-time or periodic action on a connected admin workstation, not a runtime dependency.

**Option B — everything in one shot.** DISA also publishes a quarterly **SRG-STIG Library Compilation** `.zip` at [public.cyber.mil/stigs/compilations](https://public.cyber.mil/stigs/compilations/) bundling *every* current STIG/SRG as nested per-product `.zip` files inside one outer `.zip`. This is the repeatable "download all STIG IDs at once" mechanism: re-download this single file each quarter and re-run `build` to refresh the entire database in one step.

1. Copy the `.zip` file(s) — exactly as downloaded, no need to unzip, and no need to unpack the nested per-product zips inside a Library Compilation either — into `execution-plan/tools/stig_intake/`. You can also drop in already-extracted `*-xccdf.xml` files directly if you have them.
2. Run:
   ```
   python3 stig_reference_builder.py build
   ```
   This opens every `.zip` in the intake folder and **recursively** extracts only the `*-xccdf.xml` benchmark file(s) inside, at any nesting depth (so a single-product zip, or the one outer Library Compilation zip full of nested per-product zips, both work identically) — ignoring OVAL files, CPE dictionaries, PDFs, readme docs, etc. at every level. It then parses every `Group`/`Rule` pair in every benchmark found, and writes the consolidated offline database to `data/stig_reference.json`.
3. Sanity-check with:
   ```
   python3 stig_reference_builder.py lookup --id V-253259
   ```

Repeat this step periodically (e.g. each DISA quarterly SRG-STIG release cycle) to keep the reference database current — re-run with the same intake folder; matching finding IDs are simply overwritten with the latest official text. Everything downstream of this step requires zero network access.

## CVE reference tooling (Nessus findings)

A Nessus scan flags CVE IDs (e.g. `CVE-2021-44228`), not STIG IDs, so a parallel tool builds the equivalent offline reference database for that identifier type: `cve_reference_builder.py`, fetching authoritative metadata (CVSS score/severity, CWE weakness class, CISA Known Exploited Vulnerabilities status) from the official NIST NVD CVE API 2.0.

There are two workflows, same as the STIG side:

### Targeted (default, recommended)

Fetch exactly the CVE ID(s) you're actually documenting, and cache them into a small, git-friendly file:

```
# One CVE:
python3 cve_reference_builder.py fetch --id CVE-2021-44228

# A batch (e.g. everything a Nessus scan flagged on one asset), one ID per line in a text file:
python3 cve_reference_builder.py fetch-list --file cve_intake/cve_list.txt

# Sanity-check after fetching (no network):
python3 cve_reference_builder.py lookup --id CVE-2021-44228
```

This writes to `data/cve_reference.json` by default. Re-running `fetch`/`fetch-list` for an ID already cached refreshes it with NVD's latest score/description (NVD re-scores CVEs over time as more information becomes available).

### Full mirror (opt-in, for offline browsing beyond what's been reviewed)

If you want a complete local copy of the entire NVD catalog rather than only the CVEs you've specifically looked up:

```
# One-shot full bulk download of every CVE NVD has (~367,000 records as of mid-2026;
# ~20 min unauthenticated, ~2 min with an NVD_API_KEY):
python3 cve_reference_builder.py mirror

# Repeatable refresh -- fetches only what's been published/modified since the last
# mirror or mirror-update run. Safe to re-run manually on any cadence:
python3 cve_reference_builder.py mirror-update
```

These write to a **separate** file, `data/cve_mirror.json`, by default -- it is expected to be hundreds of MB at full scale, so treat it as a local cache to `.gitignore`, not something to commit. The small, curated `cve_reference.json` from the targeted workflow above stays the git-friendly, auditable file. `mirror-update` automatically respects NVD's 120-day maximum date-range-per-request limit by splitting any longer gap into multiple chunked requests, and only marks itself complete once every chunk succeeds.

An optional `NVD_API_KEY` environment variable (free, [request one here](https://nvd.nist.gov/developers/request-an-api-key)) raises NVD's rate limit from 5 requests/30s to 50 requests/30s -- worth it for `mirror`/`fetch-list`, unnecessary for one-off `fetch` calls.

CVSS severity is mapped to CAT level (CRITICAL/HIGH -> CAT I, MEDIUM -> CAT II, LOW -> CAT III, unscored -> CAT I provisional/fail-closed), and any CISA KEV-listed CVE is floored to CAT I regardless of CVSS score -- see `execution-plan/templates/ESCALATION-MATRIX.md` Sections 1a and 6 for the authoritative, cited definitions this logic implements.

## Nessus Plugin ID reference tooling

A Nessus scan report's *primary* identifier for every finding is a numeric **Plugin ID** (e.g. `156327`) — the CVE(s) a plugin cites, if any, are secondary metadata on that plugin, and many plugins (local version checks, informational checks, misconfigurations) cite no CVE at all. `nessus_reference_builder.py` builds the offline reference database for this identifier type, fetching authoritative plugin metadata (title, family, synopsis, description, solution/fix text, CVSS score/vector, related CVE IDs, VPR score, CISA KEV status) from Tenable's public [plugin detail pages](https://www.tenable.com/plugins) — no login or API key required.

Unlike the CVE side, there is no public bulk/mirror feed for the full plugin catalog, so there is only one workflow (targeted, per-ID):

```
# One plugin:
python3 nessus_reference_builder.py fetch --id 156327

# A batch (e.g. everything a Nessus scan flagged on one asset), one Plugin ID per line in a text file:
python3 nessus_reference_builder.py fetch-list --file nessus_intake/plugin_list.txt

# Sanity-check after fetching (no network):
python3 nessus_reference_builder.py lookup --id 156327
```

This writes to `data/nessus_reference.json` by default. Re-running `fetch`/`fetch-list` for an ID already cached refreshes it with Tenable's latest plugin text (plugins are periodically revised as Tenable improves detection logic or updates references).

The same CVSS-severity-to-CAT mapping and CISA KEV escalation floor described above apply here too (see `execution-plan/templates/ESCALATION-MATRIX.md` Sections 1a and 6) — a plugin's own CVSS v3 score/vector is preferred over v2 when both are published, and KEV status is read from Tenable's own `cisaKnownExploitedDate`/`on_cisa_kev` fields. Unlike NVD, Tenable's plugin page does not republish CISA's verbatim required-action text, so a KEV-listed plugin's generated record points the preparer to the CVE-keyed record (via `cve_reference_builder.py`, if the plugin cites a CVE) or the official [CISA KEV catalog](https://www.cisa.gov/known-exploited-vulnerabilities-catalog) directly, rather than fabricating that text.

## Step 2 — Generate a Variance/Risk-Acceptance Record

```
python3 generate_variance.py \
    --id V-253259 \
    --asset WIN11-WKSTN-042 \
    --system-scope "Example Enclave A" \
    --detection-method "Manual STIG checklist review" \
    --detection-date 2026-07-17 \
    --preparer "J. Smith, ISSO"
```

This looks up `V-253259` in the offline database, determines its CAT level, computes the correct SLA due date from `execution-plan/templates/ESCALATION-MATRIX.md`, assigns the correct severity-tiered sign-off chain, and writes filled records to `execution-plan/variance-records/`. By default it writes **both**:

- `VAR-V-253259-WIN11-WKSTN-042-20260717.md` — Markdown, diff-friendly, the source of truth meant to be committed to the repo.
- `VAR-V-253259-WIN11-WKSTN-042-20260717.html` — a standalone HTML record with inline CSS and no external assets, so it opens directly in any browser, prints cleanly to PDF, or can be emailed/attached as-is. Official check/fix text, CVE descriptions, and NVD reference links are rendered read-only; a CISA KEV-listed CVE gets a highlighted "Required Action" callout in Section 8.

Same `--id` flag works for a CVE ID (e.g. `--id CVE-2021-44228`) once it's cached via `cve_reference_builder.py`, or a bare Nessus Plugin ID (e.g. `--id 156327`) once it's cached via `nessus_reference_builder.py` — the identifier format is auto-detected, so no separate flag is needed to switch between a STIG finding, a CVE finding, or a Nessus Plugin ID finding.

Use `--format md` or `--format html` to restrict output to just one format; the default is `both`.

Any asset-specific flags you omit are left as explicit `*(fill in)*` prompts in the output — the tool never fabricates asset-specific facts, only official reference content.

## Step 3 — Route for peer review and sign-off

The generated record's Section 4 (RACI) states exactly who must review and who holds final accept/reject authority, based on severity:

| CAT Level | Final Accept/Reject Authority |
|---|---|
| CAT I | AO / DAO |
| CAT II | ISSM |
| CAT III | ISSO |

ISSM is a standing reviewer at every tier. Complete Sections 6–7 (actual observed state and evidence) by hand, route for the Consulted role's comments, then obtain the signatures in Section 10.

## Files in this folder

| File | Purpose |
|---|---|
| `stig_reference_builder.py` | Bulk-imports official DISA `.zip`/XCCDF documents (single products or the full quarterly Library Compilation, nested zips included) into the offline STIG reference database |
| `generate_variance.py` | Generates one Variance/Risk-Acceptance Record (Markdown + standalone HTML, `--format` to restrict) from a STIG or CVE finding ID + the matching offline reference database |
| `stig_intake/` | Drop zone for official `.zip` packages or extracted `*-xccdf.xml` files |
| `cve_reference_builder.py` | Fetches/mirrors official NVD CVE metadata into an offline CVE reference database (`fetch`, `fetch-list`, `lookup`, `mirror`, `mirror-update`) |
| `cve_intake/` | Drop zone for a text file of CVE IDs, one per line, for `fetch-list` |
| `data/cve_reference.json` | Small, curated CVE database (built by `fetch`/`fetch-list`) — git-friendly, meant to be committed |
| `data/cve_mirror.json` | Full-catalog CVE mirror (built by `mirror`/`mirror-update`) — large, local-only, .gitignore this |
| `nessus_reference_builder.py` | Fetches official Tenable Nessus Plugin ID metadata into an offline Nessus plugin reference database (`fetch`, `fetch-list`, `lookup` — no bulk mirror mode, Tenable publishes no bulk feed) |
| `nessus_intake/` | Drop zone for a text file of Nessus Plugin IDs, one per line, for `fetch-list` |
| `data/nessus_reference.json` | Small, curated Nessus plugin database (built by `fetch`/`fetch-list`) — git-friendly, meant to be committed |
| `data/stig_reference.json` | The built offline reference database (regenerate any time by re-running Step 1) |
