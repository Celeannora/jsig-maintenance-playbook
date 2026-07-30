#!/usr/bin/env python3
"""
nessus_reference_builder.py

Fetches authoritative plugin metadata (title, family, synopsis,
description, solution/fix text, CVSS score/vector, related CVE IDs, VPR
score, and CISA Known Exploited Vulnerabilities status) for a Nessus
**Plugin ID** (e.g. "156327", as printed on a Nessus scan report) from
Tenable's public plugin detail pages, and caches it into a local, offline
JSON reference file -- the same role stig_reference_builder.py plays for
STIG findings and cve_reference_builder.py plays for CVE-keyed findings.

WHY THIS EXISTS / HOW IT DIFFERS FROM cve_reference_builder.py
----------------------------------------------------------------
A Nessus scan report identifies every finding by a numeric **Plugin ID**
first and foremost -- the CVE(s) a plugin cites (if any) are secondary
metadata on that plugin, and many plugins (local version checks,
informational checks, misconfigurations) cite NO CVE at all. If your scan
output gives you a clean CVE ID, prefer cve_reference_builder.py (the
official NVD source of record for CVE metadata). Use THIS tool when what
you actually have in hand is a bare Plugin ID and you want a Variance
Record keyed on that ID directly, exactly as the scan report names it.

OFFICIAL SOURCE
----------------
https://www.tenable.com/plugins/nessus/<plugin_id> -- Tenable's public
plugin detail page. This is Tenable's own first-party plugin catalog
(417,000+ published plugins as of mid-2026 per https://www.tenable.com/plugins),
publicly browsable with no login or API key required. Each page embeds a
structured JSON payload (Next.js `__NEXT_DATA__` page-data block) holding
every field this tool needs -- confirmed by directly inspecting a live
page's HTML. This is a product page, not a versioned/documented REST API
like NVD's, so its exact JSON shape could change if Tenable redesigns the
page; this tool fails closed (prints an error, fabricates nothing) if the
expected structure is not found, per this project's standing rule against
guessing at official content.

There is no public bulk/mirror feed for the full plugin catalog (unlike
NVD's paginated CVE API), so unlike cve_reference_builder.py, this tool
has no `mirror`/`mirror-update` mode -- only targeted, per-ID fetches.

USAGE
-----
  # Fetch ONE plugin's official metadata and cache it:
  python3 nessus_reference_builder.py fetch --id 156327

  # Fetch a batch of Plugin IDs (one per line) named in a text file,
  # e.g. everything a Nessus scan flagged on one asset:
  python3 nessus_reference_builder.py fetch-list --file nessus_intake/plugin_list.txt

  # Look up one Plugin ID after it's cached (sanity check, no network):
  python3 nessus_reference_builder.py lookup --id 156327

  # Use a non-default cache file or slower/faster request pacing:
  python3 nessus_reference_builder.py fetch --id 156327 \\
      --output /path/to/nessus_reference.json --delay 4

OUTPUT FORMAT (nessus_reference.json)
------------------------------------
{
  "generated_at": "<ISO 8601 timestamp of last update>",
  "source": "Tenable Nessus Plugin Detail Pages (https://www.tenable.com/plugins/nessus/<id>)",
  "finding_count": 1,
  "findings": {
    "156327": {
      "plugin_id": "156327",
      "title": "Apache Log4j 2.0 < 2.3.2 / 2.4 < 2.12.4 / 2.13 < 2.17.1 RCE",
      "family": "Misc.",
      "synopsis": "<one-line summary>",
      "description": "<full official description>",
      "solution": "<official remediation text>",
      "see_also": ["https://..."],
      "cve_refs": ["CVE-2021-44832"],
      "other_refs": [{"id_type": "IAVA", "id": "0001-A-0650"}, ...],
      "cvss_version": "3.0",
      "cvss_vector": "AV:N/AC:H/PR:H/UI:N/S:U/C:H/I:H/A:H",
      "cvss_base_score": 6.6,
      "cvss_base_severity": "MEDIUM",
      "cat": "CAT II",
      "cat_basis": "CVSS Base Severity (see ESCALATION-MATRIX.md Section 1a)",
      "vpr_score": 6.9,
      "risk_factor": "High",
      "exploit_available": true,
      "plugin_publication_date": "12/28/2021",
      "plugin_modification_date": "1/21/2026",
      "cisa_kev_listed": false,
      "cisa_kev_date_added": null,
      "source": "Tenable Nessus Plugin Detail Page",
      "source_url": "https://www.tenable.com/plugins/nessus/156327",
      "fetched_at": "<ISO 8601 timestamp>"
    }
  }
}

CVSS SEVERITY -> CAT MAPPING, AND KEV ESCALATION FLOOR
---------------------------------------------------------
Uses the SAME mapping cve_reference_builder.py uses -- see
execution-plan/templates/ESCALATION-MATRIX.md Section 1a (explicitly
titled "CVE / CVSS Severity Mapping (Nessus and other CVE-based
findings)") and Section 6 (CISA KEV escalation rule). Summary: CVSS
CRITICAL/HIGH -> CAT I, MEDIUM -> CAT II, LOW -> CAT III, no score yet ->
CAT I (provisional, fails closed); KEV-listed plugins are floored to
CAT I regardless of CVSS score. Prefers the plugin's published CVSS v3
score/vector over v2 when both are present (Tenable plugin pages do not
generally publish CVSS v4 as of mid-2026).

Unlike NVD, Tenable's plugin page does not republish CISA's verbatim
`cisaRequiredAction` text -- only a KEV-listed boolean/date. The generated
Variance Record surfaces the listed status and points the preparer to the
CVE-keyed record (via cve_reference_builder.py, if the plugin cites a
CVE) or the official CISA KEV catalog for the verbatim required action.

FAIR USE / COURTESY
----------------------
This fetches ONE public page per Plugin ID via a normal HTTP GET, exactly
as a person's browser would. There is no documented rate limit for this
consumer-facing page (unlike NVD's published 5-req/30s), so this tool
defaults to a conservative delay between requests in fetch-list and
identifies itself with a descriptive User-Agent string. Treat this as an
occasional, targeted lookup tool, not a bulk harvester.
"""

import argparse
import json
import os
import re
import sys
import time
import urllib.error
import urllib.request
from datetime import datetime, timezone

PLUGIN_URL_TEMPLATE = "https://www.tenable.com/plugins/nessus/{id}"
DEFAULT_OUTPUT = os.path.join(os.path.dirname(__file__), "data", "nessus_reference.json")
DEFAULT_INTAKE_LIST = os.path.join(os.path.dirname(__file__), "nessus_intake", "plugin_list.txt")
SOURCE_LABEL = "Tenable Nessus Plugin Detail Pages (https://www.tenable.com/plugins/nessus/<id>)"
USER_AGENT = "jsig-variance-tooling/1.0 (offline reference cache builder; targeted per-ID lookups only)"

# No official rate limit is published for this page (unlike NVD's 5/30s);
# this default is a deliberately conservative courtesy delay.
DEFAULT_DELAY_SECONDS = 3.0

CVSS_SEVERITY_TO_CAT = {
    "CRITICAL": "CAT I",
    "HIGH": "CAT I",
    "MEDIUM": "CAT II",
    "LOW": "CAT III",
}

PLUGIN_ID_RE = re.compile(r"^\d+$")


def _severity_from_score(score, is_v2=False):
    """Bucket a numeric CVSS base score into the same CRITICAL/HIGH/
    MEDIUM/LOW labels ESCALATION-MATRIX.md Section 1a defines, so this
    tool's CAT mapping stays identical to cve_reference_builder.py's even
    though Tenable's page doesn't publish NVD's own baseSeverity string
    directly for every CVSS version. CVSS v2 has no CRITICAL band."""
    if score is None:
        return None
    if not is_v2 and score >= 9.0:
        return "CRITICAL"
    if score >= 7.0:
        return "HIGH"
    if score >= 4.0:
        return "MEDIUM"
    return "LOW"


def _select_cvss(plugin):
    """Pick the best available CVSS metric from a Tenable plugin payload's
    nested 'cvss' object, preferring v3 over v2. Returns
    (version, vector, score, severity) or (None, None, None, None) if the
    plugin has no CVSS score at all (common for purely informational
    plugins)."""
    cvss = plugin.get("cvss") or {}

    v3_score = cvss.get("cvssv3_score")
    if v3_score is not None:
        vector = cvss.get("cvssv3_vector_base") or cvss.get("cvssv3_vector")
        version = cvss.get("cvssv3_version") or "3.x"
        return version, vector, v3_score, _severity_from_score(v3_score, is_v2=False)

    v2_score = cvss.get("cvssv2_score")
    if v2_score is not None:
        vector = cvss.get("cvssv2_vector_base") or cvss.get("cvssv2_vector")
        return "2.0", vector, v2_score, _severity_from_score(v2_score, is_v2=True)

    return None, None, None, None


def parse_tenable_plugin(plugin, plugin_id, source_url):
    """Convert one Tenable plugin JSON payload into this tool's flat
    finding-metadata dict (mirrors the shape cve_reference_builder.py
    produces closely enough that generate_variance.py can render either
    type through mostly-shared logic)."""
    version, vector, score, severity = _select_cvss(plugin)

    base_cat = CVSS_SEVERITY_TO_CAT.get(severity, "CAT I")  # fail closed if unscored
    kev_date = plugin.get("cisaKnownExploitedDate")
    vpr_v2 = plugin.get("vpr_v2_metrics") or {}
    kev_listed = bool(kev_date) or bool(vpr_v2.get("on_cisa_kev"))
    # KEV listing is a floor, never a downgrade -- CAT I is already the
    # ceiling of this scheme, so the "floor" is a no-op in code but stated
    # explicitly per the documented rule in ESCALATION-MATRIX.md Section 6.
    cat = "CAT I" if kev_listed else base_cat

    cve_refs = list(dict.fromkeys(plugin.get("cves") or []))
    other_refs = []
    for r in plugin.get("references") or []:
        id_type = r.get("id_type")
        if id_type and id_type.lower() != "cve" and r.get("id"):
            other_refs.append({"id_type": id_type, "id": r["id"]})

    return {
        "plugin_id": str(plugin_id),
        "title": plugin.get("script_name", ""),
        "family": plugin.get("script_family", ""),
        "synopsis": plugin.get("synopsis", ""),
        "description": plugin.get("description", ""),
        "solution": plugin.get("solution", ""),
        "see_also": list(dict.fromkeys(plugin.get("see_also") or [])),
        "cve_refs": cve_refs,
        "other_refs": other_refs,
        "cvss_version": version,
        "cvss_vector": vector,
        "cvss_base_score": score,
        "cvss_base_severity": severity or "UNSCORED",
        "cat": cat,
        "cat_basis": (
            "CISA KEV floor (see ESCALATION-MATRIX.md Section 6)" if kev_listed
            else ("CVSS Base Severity (see ESCALATION-MATRIX.md Section 1a)" if severity
                  else "No CVSS score published for this plugin -- CAT I provisional, fails closed "
                       "(see ESCALATION-MATRIX.md Section 1a)")
        ),
        "vpr_score": plugin.get("vpr_score"),
        "risk_factor": plugin.get("risk_factor"),
        "exploit_available": bool(plugin.get("exploit_available")),
        "plugin_publication_date": plugin.get("pluginPublicationDate") or plugin.get("plugin_publication_date"),
        "plugin_modification_date": plugin.get("pluginModificationDate") or plugin.get("plugin_modification_date"),
        "cisa_kev_listed": kev_listed,
        "cisa_kev_date_added": kev_date,
        "source": "Tenable Nessus Plugin Detail Page",
        "source_url": source_url,
        "fetched_at": datetime.now(timezone.utc).isoformat(),
    }


def _extract_next_data(html_text):
    """Locate and parse the embedded '<script id="__NEXT_DATA__">' JSON
    block from a Tenable plugin page's raw HTML. Returns the parsed dict,
    or None if the tag isn't found or doesn't parse -- callers must fail
    closed rather than guess at fields from a page that doesn't match the
    expected structure."""
    start_tag = html_text.find('<script id="__NEXT_DATA__"')
    if start_tag == -1:
        return None
    start = html_text.find(">", start_tag)
    if start == -1:
        return None
    start += 1
    end = html_text.find("</script>", start)
    if end == -1:
        return None
    try:
        return json.loads(html_text[start:end])
    except json.JSONDecodeError:
        return None


def fetch_plugin(plugin_id, timeout=30):
    """Fetch and parse ONE Nessus Plugin ID's official metadata from
    Tenable's public plugin page. Returns the parsed finding dict, or
    None with a printed reason if the page doesn't exist or doesn't
    parse as expected. Never fabricates a record -- fails closed."""
    plugin_id = str(plugin_id).strip()
    url = PLUGIN_URL_TEMPLATE.format(id=plugin_id)
    req = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
    try:
        with urllib.request.urlopen(req, timeout=timeout) as resp:
            html_text = resp.read().decode("utf-8")
    except urllib.error.HTTPError as e:
        if e.code == 404:
            print(f"  [NOT FOUND] Plugin {plugin_id}: Tenable has no page at {url}. "
                  f"Double-check the Plugin ID from your scan report.", file=sys.stderr)
        else:
            print(f"  [ERROR] Plugin {plugin_id}: Tenable returned HTTP {e.code} ({e.reason}).", file=sys.stderr)
        return None
    except urllib.error.URLError as e:
        print(f"  [ERROR] Plugin {plugin_id}: could not reach tenable.com ({e.reason}). "
              f"This step requires network access; downstream generation does not.", file=sys.stderr)
        return None

    data = _extract_next_data(html_text)
    if data is None:
        print(f"  [ERROR] Plugin {plugin_id}: could not locate/parse the embedded plugin data on the "
              f"page at {url}. Tenable may have changed their page structure -- this tool fails closed "
              f"rather than guessing at fields.", file=sys.stderr)
        return None

    try:
        plugin = data["props"]["pageProps"]["plugin"]
    except (KeyError, TypeError):
        plugin = None
    if not plugin or not plugin.get("script_name"):
        print(f"  [NOT FOUND] Plugin {plugin_id}: no plugin metadata found in the page payload at {url}.",
              file=sys.stderr)
        return None

    return parse_tenable_plugin(plugin, plugin_id, url)


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
        json.dump(db, f, indent=2, ensure_ascii=False)


def cmd_fetch(args):
    plugin_id = args.id.strip()
    if not PLUGIN_ID_RE.match(plugin_id):
        print(f"'{args.id}' does not look like a Nessus Plugin ID (expected: digits only, e.g. 156327).")
        sys.exit(1)
    db = load_db(args.output)
    finding = fetch_plugin(plugin_id)
    if not finding:
        sys.exit(1)
    db["findings"][finding["plugin_id"]] = finding
    save_db(db, args.output)
    print(f"Cached Plugin {finding['plugin_id']} -> {args.output}")
    print(f"  Title:    {finding['title']}")
    print(f"  Family:   {finding['family']}")
    print(f"  CVSS:     {finding['cvss_base_score']} ({finding['cvss_base_severity']})" +
          (f", version {finding['cvss_version']}" if finding["cvss_version"] else " -- unscored"))
    print(f"  CAT:      {finding['cat']} ({finding['cat_basis']})")
    if finding["cve_refs"]:
        print(f"  CVE(s):   {', '.join(finding['cve_refs'])}")
    if finding["cisa_kev_listed"]:
        print(f"  KEV:      listed" + (f" since {finding['cisa_kev_date_added']}" if finding['cisa_kev_date_added'] else ""))


def cmd_fetch_list(args):
    if not os.path.exists(args.file):
        print(f"No such file: {args.file}")
        print("Create a text file with one Nessus Plugin ID per line (blank lines and lines "
              "starting with # are ignored), then re-run.")
        sys.exit(1)

    with open(args.file, encoding="utf-8") as f:
        ids = [line.strip() for line in f if line.strip() and not line.strip().startswith("#")]

    if not ids:
        print(f"{args.file} contains no Plugin IDs to fetch.")
        sys.exit(1)

    db = load_db(args.output)
    fetched, failed = 0, []
    for i, plugin_id in enumerate(ids):
        if not PLUGIN_ID_RE.match(plugin_id):
            print(f"[{i + 1}/{len(ids)}] Skipping '{plugin_id}': not a valid Plugin ID (digits only).")
            failed.append(plugin_id)
            continue
        print(f"[{i + 1}/{len(ids)}] Fetching Plugin {plugin_id} ...")
        finding = fetch_plugin(plugin_id)
        if finding:
            db["findings"][finding["plugin_id"]] = finding
            fetched += 1
        else:
            failed.append(plugin_id)
        if i < len(ids) - 1:
            time.sleep(args.delay)

    save_db(db, args.output)
    print(f"\nFetched and cached {fetched}/{len(ids)} plugin(s) -> {args.output}")
    if failed:
        print(f"  Failed/not found/invalid: {', '.join(failed)}")


def cmd_lookup(args):
    db = load_db(args.output)
    finding = db.get("findings", {}).get(args.id.strip())
    if not finding:
        print(f"'{args.id}' not found in the offline Nessus reference database "
              f"({db.get('finding_count', 0)} plugin(s) cached).")
        print(f"Run: python3 nessus_reference_builder.py fetch --id {args.id}")
        return 1
    print(json.dumps(finding, indent=2, ensure_ascii=False))
    return 0


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = parser.add_subparsers(dest="command", required=True)

    common_output = dict(default=DEFAULT_OUTPUT,
                          help="Path to nessus_reference.json (default: tools/data/nessus_reference.json)")
    common_delay = dict(type=float, default=DEFAULT_DELAY_SECONDS, dest="delay",
                         help=f"Seconds to wait between requests in fetch-list (default: {DEFAULT_DELAY_SECONDS})")

    fetch_p = sub.add_parser("fetch", help="Fetch and cache ONE Nessus Plugin ID's official metadata from Tenable")
    fetch_p.add_argument("--id", required=True, help="Nessus Plugin ID, e.g. 156327")
    fetch_p.add_argument("--output", **common_output)

    fetch_list_p = sub.add_parser("fetch-list", help="Fetch and cache a batch of Plugin IDs from a text file")
    fetch_list_p.add_argument("--file", default=DEFAULT_INTAKE_LIST,
                               help=f"Text file, one Plugin ID per line (default: {DEFAULT_INTAKE_LIST})")
    fetch_list_p.add_argument("--output", **common_output)
    fetch_list_p.add_argument("--delay", **common_delay)

    lookup_p = sub.add_parser("lookup", help="Look up one cached Plugin ID (no network)")
    lookup_p.add_argument("--id", required=True, help="Nessus Plugin ID, e.g. 156327")
    lookup_p.add_argument("--output", **common_output)

    args = parser.parse_args()

    if args.command == "fetch":
        cmd_fetch(args)
    elif args.command == "fetch-list":
        cmd_fetch_list(args)
    elif args.command == "lookup":
        sys.exit(cmd_lookup(args))


if __name__ == "__main__":
    main()
