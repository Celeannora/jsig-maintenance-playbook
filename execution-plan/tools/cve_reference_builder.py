#!/usr/bin/env python3
"""
cve_reference_builder.py

Fetches authoritative CVE metadata (CVSS score/severity, CWE weakness
classes, official description, references, and CISA Known Exploited
Vulnerabilities status) from the official NIST National Vulnerability
Database (NVD) CVE API 2.0, and caches it into a local, offline JSON
reference file -- exactly the same role stig_reference_builder.py plays
for STIG findings, but for CVE-based findings (typically produced by a
Nessus vulnerability scan, as opposed to a STIG compliance-audit scan).

WHY THIS EXISTS
----------------
generate_variance.py needs authoritative metadata for a given CVE ID
(e.g. CVE-2021-44228) -- description, CVSS base score/severity, CWE
mapping, and CISA KEV status -- WITHOUT calling out to the internet at
generation time. This script is the one-time/periodic "connected" step;
everything downstream (generating variance records) requires zero
network access, per the "locally hosted only" constraint for this
environment.

TWO WORKFLOWS: TARGETED (default) AND FULL MIRROR (opt-in)
-------------------------------------------------------------
What a preparer actually has, day to day, is a short, specific list of CVE
IDs a Nessus scan flagged on a given asset -- so the default, recommended
workflow is targeted: fetch metadata for EXACTLY the CVE IDs you name, one
at a time (`fetch --id`) or as a batch (`fetch-list --file`), from the
official NVD REST API, caching each result into the small, git-friendly
`cve_reference.json`. Re-running `fetch`/`fetch-list` for an ID already in
the cache refreshes it with the latest official data (NVD scores/re-scores
CVEs over time as more information becomes available).

For sites that want a complete local/offline copy of the NVD catalog
(367,000+ records as of mid-2026) refreshed on a repeatable schedule --
e.g. to answer "is this ID even a real CVE" or browse related CVEs fully
offline, not just look up ones already reviewed -- two additional
subcommands provide that as an OPT-IN full-mirror mode, writing to a
SEPARATE, much larger output file (`cve_mirror.json` by default) so the
curated `cve_reference.json` used by generate_variance.py stays small:
  - `mirror`         : one-shot full bulk download of every CVE NVD has.
  - `mirror-update`  : repeatable incremental refresh ("give me everything
                        published or modified since the last run"), safe
                        to re-run manually on any cadence.
See the MIRROR MODE section below for full details, sizing, and the
official 120-day date-range limit this mode has to respect.

OFFICIAL SOURCE
----------------
https://services.nvd.nist.gov/rest/json/cves/2.0 -- the NVD CVE API 2.0,
operated by NIST. This is a stable, scriptable, documented REST API (unlike
the Salesforce/Shadow-DOM public.cyber.mil STIG download page) -- see
https://nvd.nist.gov/developers/vulnerabilities for the official API docs.
No API key is required for occasional, targeted lookups like this tool's;
an optional key (set the NVD_API_KEY environment variable, request one at
https://nvd.nist.gov/developers/request-an-api-key) raises the rate limit
from 5 requests/30s to 50 requests/30s for larger batch fetches.

USAGE
-----
  # Fetch ONE CVE's official metadata and cache it:
  python3 cve_reference_builder.py fetch --id CVE-2021-44228

  # Fetch a batch of CVE IDs (one per line) named in a text file,
  # e.g. everything a Nessus scan flagged on one asset:
  python3 cve_reference_builder.py fetch-list --file cve_intake/cve_list.txt

  # Look up one CVE ID after it's cached (sanity check, no network):
  python3 cve_reference_builder.py lookup --id CVE-2021-44228

  # Use a non-default cache file or slower/faster request pacing:
  python3 cve_reference_builder.py fetch --id CVE-2021-44228 \\
      --output /path/to/cve_reference.json --delay 6.5

  # MIRROR MODE (opt-in, see below): one-shot full bulk download, then
  # repeatable incremental refresh:
  python3 cve_reference_builder.py mirror
  python3 cve_reference_builder.py mirror-update

MIRROR MODE
------------
`mirror` paginates through the NVD API with NO date filter (so the
official 120-day date-range limit does not apply to it at all) at
2,000 records/page -- the maximum NVD allows. At the ~367,000 records
NVD holds as of mid-2026, that is roughly 184 pages: about 20 minutes
unauthenticated (5 req/30s) or about 2 minutes with an NVD_API_KEY
(50 req/30s, https://nvd.nist.gov/developers/request-an-api-key). If it
is interrupted (network blip, rate limit, etc.) it prints the exact
`--start-index` to resume from -- it does not silently lose progress, but
it also does not auto-retry, so re-run with that flag yourself.

`mirror-update` is the repeatable "stay current" half: it re-queries NVD
for everything published or modified since this file's last mirror/update
timestamp (or an explicit `--since <ISO8601>` you provide), using the
official `lastModStartDate`/`lastModEndDate` filter. That filter is
capped by NVD at a 120-day window per request (confirmed live: a request
spanning >120 days returns an error; one spanning <=120 days succeeds) --
so this tool automatically splits any longer elapsed span into <=119-day
chunks and pages through each one. `mirror-update` only advances its
saved timestamp after EVERY chunk succeeds; if any chunk fails, nothing is
marked as done and it is always safe to just re-run the whole command
(upserts are idempotent by CVE ID, so a repeat never double-counts).

Sizing note: a full mirror is large -- hundreds of MB, not a few KB like
the curated `cve_reference.json`. That is why it defaults to a separate
output file (`cve_mirror.json`) and is written in compact (non-indented)
JSON once it crosses a few thousand records. Treat `cve_mirror.json` as a
local cache to .gitignore, not something to commit -- the small, curated
`cve_reference.json` (built by `fetch`/`fetch-list` for CVEs actually
referenced in a variance record) remains the git-friendly, auditable file.

OUTPUT FORMAT (cve_reference.json)
------------------------------------
{
  "generated_at": "<ISO 8601 timestamp of last update>",
  "source": "NVD CVE API 2.0 (https://services.nvd.nist.gov/rest/json/cves/2.0)",
  "finding_count": 1,
  "findings": {
    "CVE-2021-44228": {
      "cve_id": "CVE-2021-44228",
      "title": "Apache Log4j2 Remote Code Execution Vulnerability",
      "description": "<official English description>",
      "cvss_version": "3.1",
      "cvss_vector": "CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:C/C:H/I:H/A:H",
      "cvss_base_score": 10.0,
      "cvss_base_severity": "CRITICAL",
      "cat": "CAT I",
      "cwe_refs": ["CWE-20", "CWE-400", "CWE-502", "CWE-917"],
      "cisa_kev_listed": true,
      "cisa_kev_date_added": "2021-12-10",
      "cisa_kev_due_date": "2021-12-24",
      "cisa_kev_required_action": "<verbatim CISA required-action text>",
      "cisa_kev_vulnerability_name": "Apache Log4j2 Remote Code Execution Vulnerability",
      "published": "2021-12-10T10:15:09.143",
      "last_modified": "2026-06-17T04:12:05.460",
      "references": ["https://...", ...],
      "source": "NVD CVE API 2.0",
      "fetched_at": "<ISO 8601 timestamp>"
    }
  }
}

CVSS SEVERITY -> CAT MAPPING, AND KEV ESCALATION FLOOR
---------------------------------------------------------
See execution-plan/templates/ESCALATION-MATRIX.md Section 1a (CVSS->CAT
mapping) and Section 6 (CISA KEV escalation rule) for the authoritative,
cited definition of the logic implemented below. Summary: CVSS
CRITICAL/HIGH -> CAT I, MEDIUM -> CAT II, LOW -> CAT III, no score yet ->
CAT I (provisional, fails closed); KEV-listed CVEs are floored to CAT I
regardless of CVSS score.
"""

import argparse
import hashlib
import json
import lzma
import os
import sys
import time
import urllib.error
import urllib.parse
import urllib.request
from datetime import datetime, timedelta, timezone

API_URL = "https://services.nvd.nist.gov/rest/json/cves/2.0"
DEFAULT_OUTPUT = os.path.join(os.path.dirname(__file__), "data", "cve_reference.json")
DEFAULT_MIRROR_OUTPUT = os.path.join(os.path.dirname(__file__), "data", "cve_mirror.json")
DEFAULT_INTAKE_LIST = os.path.join(os.path.dirname(__file__), "cve_intake", "cve_list.txt")
SOURCE_LABEL = "NVD CVE API 2.0 (https://services.nvd.nist.gov/rest/json/cves/2.0)"

# Opt-in alternative to the live NVD API for 'mirror' only: a community-
# maintained, per-year re-packaging of the same NVD CVE data, updated from
# NVD every ~2 hours. NOT an NVD-operated service -- "neither endorsed nor
# certified by the NVD" per the source repo's own README. Records are
# schema-identical to the NVD API 2.0 'cve' object, so parse_nvd_record()
# works unmodified on either source. Use this only when the live-NVD path
# (rate-limited to ~372k records over many paginated requests) is too slow
# and the provenance tradeoff (third-party redistribution vs. NVD-direct)
# is acceptable for this deployment.
COMMUNITY_FEED_REPO = "fkie-cad/nvd-json-data-feeds"
COMMUNITY_FEED_ATTRIBUTION_URL = "https://github.com/fkie-cad/nvd-json-data-feeds"
COMMUNITY_FEED_BASE_URL = "https://github.com/fkie-cad/nvd-json-data-feeds/releases/latest/download"
COMMUNITY_FEED_LABEL = f"community-bulk ({COMMUNITY_FEED_ATTRIBUTION_URL})"
# NVD's earliest published CVE year; the community feed publishes one
# CVE-<year>.json.xz (+ CVE-<year>.meta) release asset per year from here
# through the current year.
COMMUNITY_FEED_START_YEAR = 1999

# Unauthenticated NVD requests are rate-limited to 5 per rolling 30s window;
# an API key raises that to 50 per 30s. Default delay is conservative for
# the no-key case (~6s => under 5 requests per 30s).
DEFAULT_DELAY_SECONDS = 6.5
DEFAULT_MIRROR_DELAY_WITH_KEY = 1.0

# NVD's maximum page size for /cves/2.0.
RESULTS_PER_PAGE = 2000

# NVD enforces a hard 120-day maximum span between pubStartDate/pubEndDate
# or lastModStartDate/lastModEndDate on any single date-filtered request
# (confirmed live: >120 days => error, <=120 days => succeeds). Chunk at
# 119 to stay safely clear of the boundary.
MAX_DATE_RANGE_DAYS = 119

# Once a reference file holds more than this many findings, write it as
# compact JSON (no indent) instead of pretty-printed -- at full-mirror
# scale (hundreds of thousands of records) indent=2 alone can roughly
# double the file size for no operational benefit.
COMPACT_WRITE_THRESHOLD = 2000

CVSS_SEVERITY_TO_CAT = {
    "CRITICAL": "CAT I",
    "HIGH": "CAT I",
    "MEDIUM": "CAT II",
    "LOW": "CAT III",
}


def _select_cvss(metrics):
    """Pick the best available CVSS metric from an NVD 'metrics' object,
    preferring v3.1 over v3.0 over v2.0, and a 'Primary' source entry over
    'Secondary' within a version. Returns (version, vector, score, severity)
    or (None, None, None, None) if no CVSS data has been published yet --
    this happens for very recently disclosed CVEs NVD hasn't scored yet."""
    if not metrics:
        return None, None, None, None
    for key, version_label in (
        ("cvssMetricV31", "3.1"),
        ("cvssMetricV30", "3.0"),
        ("cvssMetricV2", "2.0"),
    ):
        entries = metrics.get(key)
        if not entries:
            continue
        chosen = next((e for e in entries if e.get("type") == "Primary"), entries[0])
        data = chosen.get("cvssData", {})
        vector = data.get("vectorString")
        score = data.get("baseScore")
        # CVSS v2 severity lives one level up (on the metric entry, not cvssData).
        severity = data.get("baseSeverity") or chosen.get("baseSeverity")
        if severity:
            severity = severity.upper()
        return version_label, vector, score, severity
    return None, None, None, None


def _english_description(descriptions):
    for d in descriptions or []:
        if d.get("lang") == "en":
            return d.get("value", "")
    return (descriptions or [{}])[0].get("value", "")


def _cwe_refs(weaknesses):
    refs = []
    for w in weaknesses or []:
        for d in w.get("description", []):
            val = d.get("value")
            if val and val.startswith("CWE-") and val not in refs:
                refs.append(val)
    return refs


def parse_nvd_record(vuln):
    """Convert one NVD API 2.0 'vulnerabilities[].cve' object into this
    tool's flat finding-metadata dict (mirrors the shape of a STIG finding
    from stig_reference_builder.py closely enough that generate_variance.py
    can render either type through mostly-shared logic)."""
    cve_id = vuln.get("id", "")
    version, vector, score, severity = _select_cvss(vuln.get("metrics", {}))

    base_cat = CVSS_SEVERITY_TO_CAT.get(severity, "CAT I")  # fail closed if unscored
    kev_listed = bool(vuln.get("cisaExploitAdd"))
    # KEV listing is a floor, never a downgrade -- CAT I is already the
    # ceiling of this scheme, so the "floor" is a no-op in code but stated
    # explicitly per the documented rule in ESCALATION-MATRIX.md Section 6.
    cat = "CAT I" if kev_listed else base_cat

    title = vuln.get("cisaVulnerabilityName") or ""
    description = _english_description(vuln.get("descriptions"))
    if not title:
        # No official short title exists for non-KEV CVEs -- derive a
        # clearly-labeled fallback from the description rather than
        # leaving the record's title field silently blank.
        first_sentence = description.split(". ")[0].strip()
        title = (first_sentence[:117] + "...") if len(first_sentence) > 120 else first_sentence
        title = f"{title} (derived from official description; NVD publishes no short title for this CVE)"

    references = [r.get("url") for r in vuln.get("references", []) if r.get("url")]

    return {
        "cve_id": cve_id,
        "title": title,
        "description": description,
        "cvss_version": version,
        "cvss_vector": vector,
        "cvss_base_score": score,
        "cvss_base_severity": severity or "UNSCORED",
        "cat": cat,
        "cat_basis": (
            "CISA KEV floor (see ESCALATION-MATRIX.md Section 6)" if kev_listed
            else ("CVSS Base Severity (see ESCALATION-MATRIX.md Section 1a)" if severity
                  else "No CVSS score published yet -- CAT I provisional, fails closed (see ESCALATION-MATRIX.md Section 1a)")
        ),
        "cwe_refs": _cwe_refs(vuln.get("weaknesses")),
        "cisa_kev_listed": kev_listed,
        "cisa_kev_date_added": vuln.get("cisaExploitAdd"),
        "cisa_kev_due_date": vuln.get("cisaActionDue"),
        "cisa_kev_required_action": vuln.get("cisaRequiredAction"),
        "cisa_kev_vulnerability_name": vuln.get("cisaVulnerabilityName"),
        "published": vuln.get("published"),
        "last_modified": vuln.get("lastModified"),
        "references": references,
        "source": SOURCE_LABEL,
        "fetched_at": datetime.now(timezone.utc).isoformat(),
    }


def _fetch_page(params, api_key, timeout=30):
    """Single GET against the NVD /cves/2.0 endpoint with the given query
    params (dict). Returns the parsed JSON payload. Raises
    urllib.error.HTTPError / URLError on failure -- callers decide how to
    react (single-ID fetches fail closed and return None; mirror modes
    print a resume hint and exit)."""
    url = f"{API_URL}?{urllib.parse.urlencode(params)}"
    req = urllib.request.Request(url, headers={"User-Agent": "jsig-variance-tooling/1.0"})
    if api_key:
        req.add_header("apiKey", api_key)
    with urllib.request.urlopen(req, timeout=timeout) as resp:
        return json.loads(resp.read().decode("utf-8"))


def fetch_cve(cve_id, api_key=None):
    """Query the official NVD API 2.0 for exactly one CVE ID. Returns the
    parsed finding dict, or None with a printed reason if the CVE ID does
    not resolve to a real record. Never fabricates a record for an ID NVD
    doesn't recognize -- fails closed."""
    try:
        payload = _fetch_page({"cveId": cve_id}, api_key)
    except urllib.error.HTTPError as e:
        print(f"  [ERROR] {cve_id}: NVD API returned HTTP {e.code} ({e.reason}).", file=sys.stderr)
        if e.code == 403 or e.code == 429:
            print("  This is very likely a rate limit. Wait and retry, or set NVD_API_KEY "
                  "for a higher limit (https://nvd.nist.gov/developers/request-an-api-key).",
                  file=sys.stderr)
        return None
    except urllib.error.URLError as e:
        print(f"  [ERROR] {cve_id}: could not reach the NVD API ({e.reason}). "
              f"This step requires network access to services.nvd.nist.gov; "
              f"downstream generation does not.", file=sys.stderr)
        return None

    vulns = payload.get("vulnerabilities", [])
    if not vulns:
        print(f"  [NOT FOUND] {cve_id}: NVD has no record for this ID. Double-check the "
              f"CVE number (format: CVE-YYYY-NNNN...).", file=sys.stderr)
        return None
    return parse_nvd_record(vulns[0]["cve"])


def _fmt_nvd_dt(dt):
    """Format a datetime as NVD expects for date-filter params: no 'Z'
    suffix, millisecond precision (confirmed live against the real API --
    this exact format returns 200; a trailing 'Z' is not required)."""
    return dt.strftime("%Y-%m-%dT%H:%M:%S.") + f"{dt.microsecond // 1000:03d}"


def _parse_since(value):
    """Parse a stored/user-supplied ISO 8601 timestamp into a tz-aware UTC
    datetime. Accepts a trailing 'Z' or an explicit offset; assumes UTC if
    no offset is present."""
    v = value.strip()
    if v.endswith("Z"):
        v = v[:-1] + "+00:00"
    dt = datetime.fromisoformat(v)
    if dt.tzinfo is None:
        dt = dt.replace(tzinfo=timezone.utc)
    return dt.astimezone(timezone.utc)


def _date_chunks(start_dt, end_dt, max_days=MAX_DATE_RANGE_DAYS):
    """Split [start_dt, end_dt] into a list of (chunk_start, chunk_end)
    tuples, each spanning at most max_days, to stay under NVD's 120-day
    date-filter limit regardless of how long it has been since the last
    update."""
    chunks = []
    cursor = start_dt
    step = timedelta(days=max_days)
    while cursor < end_dt:
        chunk_end = min(cursor + step, end_dt)
        chunks.append((cursor, chunk_end))
        cursor = chunk_end
    return chunks


def _mirror_paginate(extra_params, api_key, delay, results_per_page, max_pages, label, start_index=0):
    """Paginate through /cves/2.0 for the given extra_params (date filters,
    or none at all for a full mirror), yielding parsed finding dicts one at
    a time. Prints progress as it goes. On an unrecoverable HTTP/network
    error, prints a resume hint (the failing startIndex) and calls
    sys.exit(1) -- mirror modes fail closed rather than silently dropping
    a partial page. start_index lets a full mirror resume mid-catalog."""
    page_num = 0
    total_results = None
    while True:
        params = {"resultsPerPage": results_per_page, "startIndex": start_index}
        params.update(extra_params)
        try:
            payload = _fetch_page(params, api_key, timeout=60)
        except (urllib.error.HTTPError, urllib.error.URLError) as e:
            print(f"  [ERROR] {label}: request failed at startIndex={start_index} ({e}).", file=sys.stderr)
            print(f"  Resume this window with --start-index {start_index} (mirror only; "
                  f"mirror-update re-runs its whole window on failure -- see MIRROR MODE docs).",
                  file=sys.stderr)
            sys.exit(1)

        if total_results is None:
            total_results = payload.get("totalResults", 0)
            print(f"  {label}: {total_results} record(s) match this query.")
            if total_results == 0:
                return

        vulns = payload.get("vulnerabilities", [])
        for v in vulns:
            yield parse_nvd_record(v["cve"])
        page_num += 1
        seen = min(start_index + len(vulns), total_results)
        print(f"  [{label} page {page_num}] startIndex={start_index} -> +{len(vulns)} "
              f"(running total: {seen}/{total_results})")

        start_index += results_per_page
        if start_index >= total_results:
            return
        if max_pages and page_num >= max_pages:
            print(f"  Reached --max-pages ({max_pages}); stopping early. "
                  f"Resume with --start-index {start_index}.")
            return
        time.sleep(delay)


def _community_feed_years():
    """Years the community bulk feed publishes as separate release assets:
    COMMUNITY_FEED_START_YEAR (1999, NVD's earliest) through the current
    UTC year, inclusive."""
    return list(range(COMMUNITY_FEED_START_YEAR, datetime.now(timezone.utc).year + 1))


def _download_bytes(url, timeout=60, label=None):
    """Stream-download url into memory, printing progress if Content-Length
    is known. Mirrors the chunked-read pattern used by
    stig_reference_builder.py's fetch_compilation(). Raises
    urllib.error.HTTPError/URLError on failure -- callers decide how to
    handle a single-year fetch failure without aborting the whole mirror."""
    req = urllib.request.Request(url, headers={"User-Agent": "jsig-variance-tooling/1.0"})
    with urllib.request.urlopen(req, timeout=timeout) as resp:
        total = resp.headers.get("Content-Length")
        total = int(total) if total else None
        chunks = []
        downloaded = 0
        while True:
            chunk = resp.read(1024 * 1024)
            if not chunk:
                break
            chunks.append(chunk)
            downloaded += len(chunk)
        if label:
            size_mb = f"{downloaded / (1024 * 1024):.2f} MB"
            expected = f"/{total / (1024 * 1024):.2f} MB" if total else ""
            print(f"    {label}: downloaded {size_mb}{expected}")
        return b"".join(chunks)


def _parse_meta_text(meta_text):
    """Parse a CVE-<year>.meta file's simple 'key:value' lines (one per
    line -- lastModifiedDate, size, xzSize, sha256) into a dict."""
    meta = {}
    for line in meta_text.splitlines():
        line = line.strip()
        if not line or ":" not in line:
            continue
        key, _, value = line.partition(":")
        meta[key.strip()] = value.strip()
    return meta


def _fetch_community_year(year):
    """Download and decompress one CVE-<year>.json.xz + its .meta sidecar
    from the community bulk feed. Verifies the decompressed JSON's sha256
    against the value published in the .meta file (confirmed by direct
    test: the .meta 'sha256' field is over the DECOMPRESSED content, not
    the .xz archive). Returns (cve_items list, verified bool). Raises
    urllib.error.HTTPError/URLError/lzma.LZMAError on a hard failure --
    callers treat that as a skip-this-year-and-continue condition, not a
    fatal one, since a single stale/unreleased year shouldn't abort the
    whole run."""
    meta_url = f"{COMMUNITY_FEED_BASE_URL}/CVE-{year}.meta"
    xz_url = f"{COMMUNITY_FEED_BASE_URL}/CVE-{year}.json.xz"

    meta_bytes = _download_bytes(meta_url, timeout=30)
    meta = _parse_meta_text(meta_bytes.decode("utf-8", errors="replace"))
    expected_sha256 = meta.get("sha256")

    xz_bytes = _download_bytes(xz_url, timeout=120, label=f"CVE-{year}.json.xz")
    json_bytes = lzma.decompress(xz_bytes)

    verified = True
    if expected_sha256:
        actual_sha256 = hashlib.sha256(json_bytes).hexdigest()
        verified = actual_sha256.lower() == expected_sha256.lower()
    else:
        # No .meta sha256 to check against -- fail closed (treat as
        # unverified) rather than silently trusting unverified data.
        verified = False

    payload = json.loads(json_bytes)
    return payload.get("cve_items", []), verified


def cmd_mirror_community_bulk(output_path):
    """Full mirror sourced from the community bulk feed instead of the live
    NVD API. Iterates one release-asset year at a time (never the combined
    CVE-all.json.xz, which decompresses to ~3GB and is unnecessary --
    per-year files cap memory use at a few tens of MB each). Each year's
    records are schema-identical NVD API 2.0 'cve' objects, so
    parse_nvd_record() is reused unmodified. A year that fails to download
    or fails its published sha256 check is skipped (fail closed on THAT
    year only) and reported at the end so it can be retried."""
    db = load_db(output_path)
    years = _community_feed_years()
    print(f"Starting community bulk mirror -> {output_path}")
    print(f"  Source: {COMMUNITY_FEED_LABEL}")
    print("  This is an unofficial, community-maintained redistribution of NVD data")
    print("  (resynced from NVD roughly every 2 hours) -- NOT an NVD-operated service.")
    print(f"  Fetching {len(years)} yearly archives ({years[0]}-{years[-1]})...")

    added = 0
    skipped_years = []
    for year in years:
        print(f"\n  [{year}] fetching...")
        try:
            cve_items, verified = _fetch_community_year(year)
        except (urllib.error.HTTPError, urllib.error.URLError, lzma.LZMAError, json.JSONDecodeError) as e:
            print(f"    [FAIL] {year}: {e} -- skipping this year, safe to re-run the same "
                  f"command later to retry just the missing year(s).", file=sys.stderr)
            skipped_years.append(year)
            continue

        if not verified:
            print(f"    [WARN] {year}: sha256 did not match the published .meta checksum -- "
                  f"skipping this year's import rather than trusting unverified data. "
                  f"Re-run later to retry.", file=sys.stderr)
            skipped_years.append(year)
            continue

        for vuln in cve_items:
            finding = parse_nvd_record(vuln)
            db["findings"][finding["cve_id"]] = finding
            added += 1
        print(f"    [OK] {year}: {len(cve_items)} record(s) (running total this run: {added})")

    db["last_full_mirror_at"] = datetime.now(timezone.utc).isoformat()
    db["last_mirror_source"] = COMMUNITY_FEED_LABEL
    save_db(db, output_path)

    print(f"\nCommunity bulk mirror complete: {added} record(s) fetched this run, "
          f"{db['finding_count']} total cached -> {output_path}")
    if skipped_years:
        print(f"  Skipped {len(skipped_years)} year(s) due to download/verification failures: "
              f"{skipped_years}")
        print("  Re-run 'mirror --source community-bulk' to retry -- already-imported years "
              "are simply overwritten again, so this is safe to repeat.")
    print("  Note: this data came from a third-party community mirror, not NVD directly.")
    print("  For an NVD-direct mirror instead, run: python3 cve_reference_builder.py mirror --source nvd")


def load_db(output_path):
    if os.path.exists(output_path):
        with open(output_path, encoding="utf-8") as f:
            return json.load(f)
    return {"generated_at": None, "source": SOURCE_LABEL, "finding_count": 0, "findings": {}}


def save_db(db, output_path):
    db["generated_at"] = datetime.now(timezone.utc).isoformat()
    db["source"] = SOURCE_LABEL
    db["finding_count"] = len(db["findings"])
    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    with open(output_path, "w", encoding="utf-8") as f:
        if db["finding_count"] > COMPACT_WRITE_THRESHOLD:
            # Full-mirror scale: compact JSON keeps the file meaningfully
            # smaller with no loss of data (see MIRROR MODE docs above).
            json.dump(db, f, ensure_ascii=False, separators=(",", ":"))
        else:
            json.dump(db, f, indent=2, ensure_ascii=False)


def cmd_fetch(args):
    db = load_db(args.output)
    finding = fetch_cve(args.id.strip().upper(), api_key=args.api_key)
    if not finding:
        sys.exit(1)
    db["findings"][finding["cve_id"]] = finding
    save_db(db, args.output)
    print(f"Cached {finding['cve_id']} -> {args.output}")
    print(f"  Title:    {finding['title']}")
    print(f"  CVSS:     {finding['cvss_base_score']} ({finding['cvss_base_severity']})" +
          (f", version {finding['cvss_version']}" if finding["cvss_version"] else " -- unscored"))
    print(f"  CAT:      {finding['cat']} ({finding['cat_basis']})")
    if finding["cisa_kev_listed"]:
        print(f"  KEV:      listed since {finding['cisa_kev_date_added']}, "
              f"official due date {finding['cisa_kev_due_date']}")


def cmd_fetch_list(args):
    if not os.path.exists(args.file):
        print(f"No such file: {args.file}")
        print("Create a text file with one CVE ID per line (blank lines and lines "
              "starting with # are ignored), then re-run.")
        sys.exit(1)

    with open(args.file, encoding="utf-8") as f:
        ids = [line.strip().upper() for line in f
               if line.strip() and not line.strip().startswith("#")]

    if not ids:
        print(f"{args.file} contains no CVE IDs to fetch.")
        sys.exit(1)

    db = load_db(args.output)
    fetched, failed = 0, []
    for i, cve_id in enumerate(ids):
        print(f"[{i + 1}/{len(ids)}] Fetching {cve_id} ...")
        finding = fetch_cve(cve_id, api_key=args.api_key)
        if finding:
            db["findings"][finding["cve_id"]] = finding
            fetched += 1
        else:
            failed.append(cve_id)
        if i < len(ids) - 1:
            time.sleep(args.delay)

    save_db(db, args.output)
    print(f"\nFetched and cached {fetched}/{len(ids)} CVE(s) -> {args.output}")
    if failed:
        print(f"  Failed/not found: {', '.join(failed)}")


def cmd_lookup(args):
    db = load_db(args.output)
    finding = db.get("findings", {}).get(args.id.strip().upper())
    if not finding:
        print(f"'{args.id}' not found in the offline CVE reference database "
              f"({db.get('finding_count', 0)} CVE(s) cached).")
        print(f"Run: python3 cve_reference_builder.py fetch --id {args.id}")
        return 1
    print(json.dumps(finding, indent=2, ensure_ascii=False))
    return 0


def cmd_mirror(args):
    if args.source == "community-bulk":
        cmd_mirror_community_bulk(args.output)
        return

    db = load_db(args.output)
    delay = args.delay if args.delay is not None else (
        DEFAULT_MIRROR_DELAY_WITH_KEY if args.api_key else DEFAULT_DELAY_SECONDS
    )
    print(f"Starting full NVD mirror -> {args.output}")
    if args.start_index:
        print(f"  Resuming from startIndex={args.start_index}")
    added = 0
    for finding in _mirror_paginate(
        extra_params={},
        api_key=args.api_key,
        delay=delay,
        results_per_page=args.results_per_page,
        max_pages=args.max_pages,
        label="mirror",
        start_index=args.start_index,
    ):
        db["findings"][finding["cve_id"]] = finding
        added += 1

    db["last_full_mirror_at"] = datetime.now(timezone.utc).isoformat()
    db["last_mirror_source"] = SOURCE_LABEL
    save_db(db, args.output)
    print(f"\nMirror complete: {added} record(s) fetched this run, "
          f"{db['finding_count']} total cached -> {args.output}")
    print("Run 'mirror-update' any time afterward to fetch only what NVD has "
          "published or modified since this run.")


def cmd_mirror_update(args):
    db = load_db(args.output)

    since_str = args.since or db.get("last_incremental_update_at") or db.get("last_full_mirror_at")
    if not since_str:
        print(f"No baseline timestamp found in {args.output} (no prior 'mirror' or "
              f"'mirror-update' run recorded) and --since was not given.")
        print("Run 'mirror' first for a full baseline, or pass --since <ISO8601> "
              "to start incremental tracking from an explicit point (anything "
              "published/modified before that point will be missing).")
        sys.exit(1)

    start_dt = _parse_since(since_str)
    end_dt = datetime.now(timezone.utc)
    if start_dt >= end_dt:
        print(f"Nothing to do: baseline timestamp ({since_str}) is not in the past.")
        return

    delay = args.delay if args.delay is not None else (
        DEFAULT_MIRROR_DELAY_WITH_KEY if args.api_key else DEFAULT_DELAY_SECONDS
    )
    chunks = _date_chunks(start_dt, end_dt)
    print(f"Refreshing {args.output} for everything modified {since_str} -> now "
          f"({len(chunks)} window(s), max {MAX_DATE_RANGE_DAYS} days each per NVD's limit)")

    added = 0
    for i, (chunk_start, chunk_end) in enumerate(chunks):
        label = f"mirror-update window {i + 1}/{len(chunks)}"
        print(f"  {label}: {_fmt_nvd_dt(chunk_start)} -> {_fmt_nvd_dt(chunk_end)}")
        extra_params = {
            "lastModStartDate": _fmt_nvd_dt(chunk_start),
            "lastModEndDate": _fmt_nvd_dt(chunk_end),
        }
        for finding in _mirror_paginate(
            extra_params=extra_params,
            api_key=args.api_key,
            delay=delay,
            results_per_page=RESULTS_PER_PAGE,
            max_pages=args.max_pages,
            label=label,
        ):
            db["findings"][finding["cve_id"]] = finding
            added += 1
        if i < len(chunks) - 1:
            time.sleep(delay)

    # Only advance the saved baseline once every window has fully succeeded --
    # a mid-run failure calls sys.exit(1) inside _mirror_paginate before this
    # line, so a partial run never gets marked as complete.
    db["last_incremental_update_at"] = end_dt.isoformat()
    save_db(db, args.output)
    print(f"\nIncremental update complete: {added} record(s) added/refreshed, "
          f"{db['finding_count']} total cached -> {args.output}")


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = parser.add_subparsers(dest="command", required=True)

    common_output = dict(default=DEFAULT_OUTPUT, help="Path to cve_reference.json (default: tools/data/cve_reference.json)")
    common_key = dict(default=os.environ.get("NVD_API_KEY"), dest="api_key",
                       help="NVD API key (default: NVD_API_KEY env var, or none -- unauthenticated rate limit applies)")
    common_delay = dict(type=float, default=DEFAULT_DELAY_SECONDS, dest="delay",
                         help=f"Seconds to wait between requests in fetch-list (default: {DEFAULT_DELAY_SECONDS})")

    fetch_p = sub.add_parser("fetch", help="Fetch and cache ONE CVE's official metadata from NVD")
    fetch_p.add_argument("--id", required=True, help="CVE ID, e.g. CVE-2021-44228")
    fetch_p.add_argument("--output", **common_output)
    fetch_p.add_argument("--api-key", **common_key)

    fetch_list_p = sub.add_parser("fetch-list", help="Fetch and cache a batch of CVE IDs from a text file")
    fetch_list_p.add_argument("--file", default=DEFAULT_INTAKE_LIST,
                               help=f"Text file, one CVE ID per line (default: {DEFAULT_INTAKE_LIST})")
    fetch_list_p.add_argument("--output", **common_output)
    fetch_list_p.add_argument("--api-key", **common_key)
    fetch_list_p.add_argument("--delay", **common_delay)

    lookup_p = sub.add_parser("lookup", help="Look up one cached CVE (no network)")
    lookup_p.add_argument("--id", required=True, help="CVE ID, e.g. CVE-2021-44228")
    lookup_p.add_argument("--output", **common_output)

    common_mirror_output = dict(default=DEFAULT_MIRROR_OUTPUT,
                                 help=f"Path to the (large) full-mirror file, separate from "
                                      f"cve_reference.json (default: {DEFAULT_MIRROR_OUTPUT})")
    common_mirror_delay = dict(type=float, default=None, dest="delay",
                                help="Seconds between pages (default: 6.5s unauthenticated, "
                                     "1.0s with an API key)")
    common_max_pages = dict(type=int, default=None, dest="max_pages",
                             help="Stop after this many pages per window (mainly for testing; "
                                  "omit for a real run)")

    mirror_p = sub.add_parser("mirror", help="One-shot full bulk download of the ENTIRE NVD CVE catalog")
    mirror_p.add_argument("--output", **common_mirror_output)
    mirror_p.add_argument("--source", choices=["nvd", "community-bulk"], default="nvd",
                           help="Where to pull the full catalog from (default: nvd, the live paginated "
                                "NVD API 2.0 -- authoritative but rate-limited). 'community-bulk' instead "
                                f"downloads per-year archives from {COMMUNITY_FEED_ATTRIBUTION_URL}, an "
                                "unofficial community redistribution resynced from NVD every ~2 hours -- "
                                "much faster for a full catalog build, but NOT an NVD-operated source. "
                                "--api-key/--delay/--start-index/--max-pages/--results-per-page below only "
                                "apply to --source nvd.")
    mirror_p.add_argument("--api-key", **common_key)
    mirror_p.add_argument("--delay", **common_mirror_delay)
    mirror_p.add_argument("--start-index", type=int, default=0, dest="start_index",
                           help="Resume a previously-interrupted mirror from this NVD result "
                                "offset (printed on failure)")
    mirror_p.add_argument("--max-pages", **common_max_pages)
    mirror_p.add_argument("--results-per-page", type=int, default=RESULTS_PER_PAGE, dest="results_per_page",
                           help=f"Records per NVD page, max 2000 (default: {RESULTS_PER_PAGE})")

    mirror_update_p = sub.add_parser("mirror-update",
                                      help="Repeatable incremental refresh: everything NVD has "
                                           "published/modified since the last mirror/update")
    mirror_update_p.add_argument("--output", **common_mirror_output)
    mirror_update_p.add_argument("--since", default=None,
                                  help="ISO8601 UTC timestamp to refresh from (default: this "
                                       "file's last_incremental_update_at, or last_full_mirror_at)")
    mirror_update_p.add_argument("--api-key", **common_key)
    mirror_update_p.add_argument("--delay", **common_mirror_delay)
    mirror_update_p.add_argument("--max-pages", **common_max_pages)

    args = parser.parse_args()

    if args.command == "fetch":
        cmd_fetch(args)
    elif args.command == "fetch-list":
        cmd_fetch_list(args)
    elif args.command == "lookup":
        sys.exit(cmd_lookup(args))
    elif args.command == "mirror":
        cmd_mirror(args)
    elif args.command == "mirror-update":
        cmd_mirror_update(args)


if __name__ == "__main__":
    main()
