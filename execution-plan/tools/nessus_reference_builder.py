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

There is no public THIRD-PARTY bulk/mirror feed for the full plugin
catalog the way there is for CVE/NVD (see execution-plan/tools/README.md's
"Nessus Plugin ID reference tooling" section for exactly why -- in short,
NVD is US-government public domain and freely bulk-redistributable, while
Tenable's plugin text is proprietary vendor content that no legitimate
third party can legally redistribute in bulk for free). What DOES exist is
Tenable's own official offline-activation mechanism for its free Nessus
Essentials tier: sign up for a free activation code, then use that code
with `nessuscli fetch --challenge` against https://plugins.nessus.org/v2/
offline.php to download the full plugin feed archive (`all-2.0.tar.gz`)
yourself, under your own Tenable account/license. This tool's `import-bulk`
command (see USAGE) parses that already-downloaded archive -- it does NOT
automate signup, activation, or any part of obtaining the code/feed; you
must do that yourself, directly with Tenable, first.

IMPORTANT CAVEAT -- the feed is a MIX of file types, and only one kind is
parseable here: `*.nasl` files ship with readable NASL source text (this
is what `import-bulk` parses); `*.nbin` files are Tenable-compiled binary
plugins with no offline-recoverable text (skipped, counted, and reported --
never decompiled); `*.inc` files are shared include libraries, not
individual plugins (skipped). Depending on the feed snapshot, a large
share of modern plugins may ship as `.nbin`, so `import-bulk` coverage is
partial by nature, not a bug -- use `fetch --id <ID>` for any specific
plugin `import-bulk` couldn't cover. Also, VPR score and CISA KEV status
are Tenable-maintained metadata that live on tenable.com, not inside a
plugin's own `.nasl` text, so bulk-imported entries always leave those two
fields blank -- `fetch --id` (network) is the only way to get them.

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

  # Bulk-import a plugin feed YOU already obtained yourself (see the
  # caveat above) -- accepts either the raw archive or an already-
  # extracted plugin directory:
  python3 nessus_reference_builder.py import-bulk --source /path/to/all-2.0.tar.gz
  python3 nessus_reference_builder.py import-bulk --source /opt/nessus/lib/nessus/plugins

  # Use a non-default output file for the bulk import (kept separate from
  # nessus_reference.json by default -- see nessus_mirror.json below):
  python3 nessus_reference_builder.py import-bulk --source all-2.0.tar.gz \\
      --output /path/to/nessus_mirror.json

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

OUTPUT FORMAT (nessus_mirror.json, from `import-bulk`)
-------------------------------------------------------
Same {"generated_at", "source", "finding_count", "findings": {...}} shape
as above, so generate_variance.py's Nessus rendering works unchanged on
either file. Each bulk-imported finding carries the exact same keys as a
`fetch`-produced one (with "vpr_score", "cisa_kev_listed", and
"cisa_kev_date_added" always blank/false -- see the caveat above), plus
two extra informational keys `fetch`-produced entries don't have:
  "source_file": "<the .nasl filename this entry was parsed from>",
  "bulk_import_note": "<human-readable reminder of the VPR/KEV gap>"
generate_variance.py only ever reads known keys via .get(), so these two
extra keys are informational/for-humans-reading-the-JSON only.

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
import shutil
import sys
import tarfile
import tempfile
import time
import urllib.error
import urllib.request
from datetime import datetime, timezone

PLUGIN_URL_TEMPLATE = "https://www.tenable.com/plugins/nessus/{id}"
DEFAULT_OUTPUT = os.path.join(os.path.dirname(__file__), "data", "nessus_reference.json")
# import-bulk's output -- deliberately a DIFFERENT default file than
# DEFAULT_OUTPUT above (mirrors cve_reference_builder.py's cve_reference.json
# vs cve_mirror.json split), so a bulk import never silently overwrites
# individually `fetch`ed, network-sourced entries. generate_variance.py
# checks this file as a fallback -- see _lookup_nessus_in_mirror() there.
DEFAULT_MIRROR_OUTPUT = os.path.join(os.path.dirname(__file__), "data", "nessus_mirror.json")
DEFAULT_INTAKE_LIST = os.path.join(os.path.dirname(__file__), "nessus_intake", "plugin_list.txt")
SOURCE_LABEL = "Tenable Nessus Plugin Detail Pages (https://www.tenable.com/plugins/nessus/<id>)"
BULK_SOURCE_LABEL = (
    "Locally imported Nessus plugin feed (.nasl source files) -- obtained by the user "
    "themselves via their own free Nessus Essentials activation code and Tenable's official "
    "offline-update mechanism, then parsed by this tool's import-bulk command. Not fetched "
    "live from tenable.com and not a redistributed third-party mirror."
)
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


NASL_SCRIPT_ID_RE = re.compile(r"script_id\s*\(\s*(\d+)\s*\)")
NASL_SCRIPT_NAME_RE = re.compile(r'script_name\s*\(\s*(?:english\s*:\s*)?"((?:[^"\\]|\\.)*)"', re.DOTALL)
NASL_SCRIPT_FAMILY_RE = re.compile(r'script_family\s*\(\s*(?:english\s*:\s*)?"((?:[^"\\]|\\.)*)"', re.DOTALL)
NASL_ATTR_RE = re.compile(
    r'script_set_attribute\s*\(\s*attribute\s*:\s*"([A-Za-z0-9_]+)"\s*,\s*value\s*:\s*"((?:[^"\\]|\\.)*)"',
    re.DOTALL,
)
NASL_CVE_ID_RE = re.compile(r"script_cve_id\s*\(([^)]*)\)", re.DOTALL)
NASL_XREF_RE = re.compile(
    r'script_xref\s*\(\s*name\s*:\s*"([^"]+)"\s*,\s*value\s*:\s*"((?:[^"\\]|\\.)*)"',
    re.DOTALL,
)
# Older plugins publish CVSS via a direct function call rather than a
# script_set_attribute(...) pair -- script_set_cvss_base_vector(...) for
# CVSS v2, script_set_cvss3_base_vector(...) for CVSS v3. _select_cvss_from_nasl
# below checks both forms.
NASL_CVSS_FUNC_RE = re.compile(r'script_set_cvss(\d*)_base_vector\s*\(\s*"([^"]*)"')
NASL_ESCAPE_RE = re.compile(r"\\(.)")


def _nasl_unescape(s):
    """Undo simple backslash escaping in an extracted .nasl string literal
    (\\" -> ", \\n -> newline, \\t -> tab, \\\\ -> backslash; any other
    escaped character is passed through with the backslash dropped)."""
    if s is None:
        return s
    mapping = {"n": "\n", "t": "\t", '"': '"', "\\": "\\"}
    return NASL_ESCAPE_RE.sub(lambda m: mapping.get(m.group(1), m.group(1)), s)


def _parse_nasl_attributes(text):
    """Collect every script_set_attribute(attribute:"...", value:"...")
    pair in a plugin's .nasl text into {attribute_name: [value, ...]} --
    a list per name because some attributes (e.g. see_also) legitimately
    repeat across multiple calls in the same plugin."""
    attrs = {}
    for name, raw_value in NASL_ATTR_RE.findall(text):
        attrs.setdefault(name, []).append(_nasl_unescape(raw_value))
    return attrs


def _select_cvss_from_nasl(attrs, text):
    """Best-effort CVSS extraction from a .nasl plugin's text. Modern
    plugins publish CVSS via script_set_attribute(attribute:"cvss3_vector"
    |"cvss3_base_score", ...) (or the CVSS2-era "cvss_vector"/
    "cvss_base_score" attribute names); older plugins instead call
    script_set_cvss_base_vector("CVSS2#...") / script_set_cvss3_base_vector
    ("CVSS:3.0/...") directly. This checks both forms and prefers CVSS v3
    over v2. Unlike parse_tenable_plugin() (which reads Tenable's own
    precomputed base score straight off the live page), this offline
    parser does NOT compute a numeric score from a bare vector string --
    if only a vector is present with no separate score attribute/value,
    cvss_base_score is left None rather than guessing at one."""

    def _num(v):
        try:
            return float(v)
        except (TypeError, ValueError):
            return None

    v3_score = _num((attrs.get("cvss3_base_score") or [None])[0])
    v3_vector = (attrs.get("cvss3_vector") or [None])[0]
    v2_score = _num((attrs.get("cvss_base_score") or [None])[0])
    v2_vector = (attrs.get("cvss_vector") or [None])[0]

    for version_digits, raw_vector in NASL_CVSS_FUNC_RE.findall(text):
        if version_digits == "3" and not v3_vector:
            v3_vector = raw_vector
        elif version_digits in ("", "2") and not v2_vector:
            v2_vector = raw_vector

    if v3_vector or v3_score is not None:
        severity = _severity_from_score(v3_score, is_v2=False) if v3_score is not None else None
        return "3.x", v3_vector, v3_score, severity
    if v2_vector or v2_score is not None:
        severity = _severity_from_score(v2_score, is_v2=True) if v2_score is not None else None
        return "2.0", v2_vector, v2_score, severity
    return None, None, None, None


def parse_nasl_text(text, source_filename):
    """Parse ONE plugin's already-read .nasl source text into this tool's
    standard finding-metadata dict (same shape parse_tenable_plugin()
    produces, so generate_variance.py's Nessus rendering works unchanged
    on either source). Returns (finding_dict, None) on success, or
    (None, reason_str) if this doesn't look like an individual plugin --
    fails closed rather than fabricating a record from a file that
    doesn't match the expected structure (e.g. a mis-suffixed include
    file with no script_id() at all).

    KNOWN, DOCUMENTED GAP: VPR score and CISA Known Exploited
    Vulnerabilities (KEV) status are metadata Tenable computes and
    maintains on tenable.com -- they are NOT stored inside a plugin's own
    .nasl script text, so every finding this function produces leaves
    vpr_score/cisa_kev_listed/cisa_kev_date_added blank/false. Run
    `fetch --id <ID>` (network) against Tenable's live page instead if
    that status matters for a specific plugin."""
    id_match = NASL_SCRIPT_ID_RE.search(text)
    if not id_match:
        return None, "no script_id(...) found -- not an individual plugin script"
    plugin_id = id_match.group(1)

    name_match = NASL_SCRIPT_NAME_RE.search(text)
    title = _nasl_unescape(name_match.group(1)) if name_match else ""

    family_match = NASL_SCRIPT_FAMILY_RE.search(text)
    family = _nasl_unescape(family_match.group(1)) if family_match else ""

    attrs = _parse_nasl_attributes(text)

    def first(name, default=None):
        vals = attrs.get(name)
        return vals[0] if vals else default

    synopsis = first("synopsis", "")
    description = "\n".join(attrs.get("description", [])) or first("description", "")
    solution = first("solution", "")
    see_also = list(dict.fromkeys(attrs.get("see_also", [])))

    cve_refs = []
    cve_match = NASL_CVE_ID_RE.search(text)
    if cve_match:
        for piece in cve_match.group(1).split(","):
            piece = piece.strip().strip('"').strip("'")
            if piece:
                cve_refs.append(piece)
    cve_refs = list(dict.fromkeys(cve_refs))

    other_refs = [
        {"id_type": id_type, "id": _nasl_unescape(ref_id)}
        for id_type, ref_id in NASL_XREF_RE.findall(text)
    ]

    version, vector, score, severity = _select_cvss_from_nasl(attrs, text)

    risk_factor_raw = first("risk_factor")
    if severity is None and risk_factor_raw:
        risk_map = {"critical": "CRITICAL", "high": "HIGH", "medium": "MEDIUM", "low": "LOW"}
        severity = risk_map.get(risk_factor_raw.strip().lower())

    base_cat = CVSS_SEVERITY_TO_CAT.get(severity, "CAT I")  # fail closed if unscored

    if severity and score is not None:
        cat_basis = "CVSS Base Severity (see ESCALATION-MATRIX.md Section 1a)"
    elif severity:
        cat_basis = (
            f"Tenable risk_factor attribute ('{risk_factor_raw}') used as fallback severity -- "
            f"no CVSS score published in this plugin's local .nasl text "
            f"(see ESCALATION-MATRIX.md Section 1a)"
        )
    else:
        cat_basis = (
            "No CVSS score or risk_factor published in this plugin's local .nasl text -- "
            "CAT I provisional, fails closed (see ESCALATION-MATRIX.md Section 1a)"
        )

    exploit_available_raw = (first("exploit_available") or "").strip().lower()

    return {
        "plugin_id": plugin_id,
        "title": title,
        "family": family,
        "synopsis": synopsis,
        "description": description,
        "solution": solution,
        "see_also": see_also,
        "cve_refs": cve_refs,
        "other_refs": other_refs,
        "cvss_version": version,
        "cvss_vector": vector,
        "cvss_base_score": score,
        "cvss_base_severity": severity or "UNSCORED",
        "cat": base_cat,
        "cat_basis": cat_basis,
        "vpr_score": None,
        "risk_factor": risk_factor_raw,
        "exploit_available": exploit_available_raw == "true",
        "plugin_publication_date": first("plugin_publication_date"),
        "plugin_modification_date": first("plugin_modification_date"),
        "cisa_kev_listed": False,
        "cisa_kev_date_added": None,
        "source": BULK_SOURCE_LABEL,
        "source_url": None,
        "source_file": source_filename,
        "bulk_import_note": (
            "Imported from a locally obtained Nessus plugin feed (.nasl source text), not "
            "fetched live from tenable.com. VPR score and CISA KEV status are Tenable-maintained "
            "and are NOT present in the plugin's own script text, so they are always blank here -- "
            f"run 'nessus_reference_builder.py fetch --id {plugin_id}' (network) or check the "
            "official CISA KEV catalog directly if that status matters for this finding."
        ),
        "fetched_at": datetime.now(timezone.utc).isoformat(),
    }, None


def _safe_extract_tar(tar, dest_dir):
    """Extract a tar archive while refusing any member whose resolved path
    would land outside dest_dir (defends against a maliciously crafted
    archive using '../' path traversal in member names) -- stdlib-only,
    no dependency on Python-version-specific tarfile extraction filters."""
    dest_real = os.path.realpath(dest_dir)
    for member in tar.getmembers():
        member_path = os.path.realpath(os.path.join(dest_dir, member.name))
        if not (member_path == dest_real or member_path.startswith(dest_real + os.sep)):
            raise RuntimeError(f"Refusing to extract unsafe archive member path: {member.name}")
    tar.extractall(dest_dir)


def cmd_import_bulk(args):
    """Walk an extracted Nessus plugin feed directory (or a .tar.gz/.tgz
    of one, auto-extracted to a temp dir that's cleaned up afterward) and
    parse every readable .nasl plugin into a local bulk-import file,
    skipping compiled .nbin plugins (their text isn't recoverable
    offline) and .inc include libraries (shared code, not individual
    plugins) -- see the module docstring for how to legitimately obtain
    this feed yourself, and why the split exists."""
    source = args.source
    tmp_extract_dir = None
    try:
        if os.path.isfile(source):
            if not (source.endswith(".tar.gz") or source.endswith(".tgz")):
                print(f"'{source}' is a file but not a .tar.gz/.tgz archive -- pass the already-"
                      f"extracted plugin directory instead, or point --source at the real "
                      f"all-2.0.tar.gz you downloaded from Tenable.")
                sys.exit(1)
            print(f"Extracting {source} ...")
            tmp_extract_dir = tempfile.mkdtemp(prefix="nessus-feed-")
            try:
                with tarfile.open(source, "r:gz") as tf:
                    _safe_extract_tar(tf, tmp_extract_dir)
            except (tarfile.TarError, RuntimeError) as exc:
                print(f"Could not extract {source}: {exc}")
                sys.exit(1)
            plugin_dir = tmp_extract_dir
        elif os.path.isdir(source):
            plugin_dir = source
        else:
            print(f"No such file or directory: {source}")
            sys.exit(1)

        nasl_files, nbin_count, inc_count = [], 0, 0
        for root, _dirs, files in os.walk(plugin_dir):
            for fname in files:
                lower = fname.lower()
                if lower.endswith(".nasl"):
                    nasl_files.append(os.path.join(root, fname))
                elif lower.endswith(".nbin"):
                    nbin_count += 1
                elif lower.endswith(".inc"):
                    inc_count += 1

        if not nasl_files:
            print(f"No .nasl files found under {plugin_dir}.")
            if nbin_count:
                print(f"Found {nbin_count} compiled .nbin plugin(s) instead -- their text is not "
                      f"available offline (see this tool's module docstring for why). Use "
                      f"'fetch --id <ID>' to pull a specific one from Tenable's public page instead.")
            sys.exit(1)

        db = load_db(args.output)
        db["source"] = BULK_SOURCE_LABEL
        parsed, skipped = 0, []
        for i, path in enumerate(nasl_files):
            if i == 0 or (i + 1) % 2000 == 0 or i == len(nasl_files) - 1:
                print(f"  [{i + 1}/{len(nasl_files)}] parsing {os.path.basename(path)} ...")
            try:
                with open(path, encoding="utf-8", errors="replace") as f:
                    text = f.read()
            except OSError as exc:
                skipped.append((os.path.basename(path), str(exc)))
                continue
            finding, err = parse_nasl_text(text, os.path.basename(path))
            if finding is None:
                skipped.append((os.path.basename(path), err))
                continue
            db["findings"][finding["plugin_id"]] = finding
            parsed += 1

        # Write directly rather than via save_db() -- save_db() stamps a
        # fixed SOURCE_LABEL (the per-ID fetch's source description), but
        # this file's provenance is BULK_SOURCE_LABEL instead.
        db["generated_at"] = datetime.now(timezone.utc).isoformat()
        db["source"] = BULK_SOURCE_LABEL
        db["finding_count"] = len(db["findings"])
        os.makedirs(os.path.dirname(args.output), exist_ok=True)
        with open(args.output, "w", encoding="utf-8") as f:
            json.dump(db, f, indent=2, ensure_ascii=False)

        print(f"\nParsed {parsed}/{len(nasl_files)} readable .nasl plugin(s) -> {args.output}")
        print(f"  Skipped {nbin_count} compiled .nbin plugin(s) -- their text is not available "
              f"offline (see this tool's module docstring for why). Use 'fetch --id <ID>' for any "
              f"specific one you need.")
        print(f"  Skipped {inc_count} .inc include file(s) -- shared library code, not individual "
              f"plugins.")
        if skipped:
            print(f"  {len(skipped)} .nasl file(s) did not parse as an individual plugin and were "
                  f"skipped:")
            for fname, reason in skipped[:10]:
                print(f"    - {fname}: {reason}")
            if len(skipped) > 10:
                print(f"    ... and {len(skipped) - 10} more.")
        print(f"\nNOTE: VPR score and CISA KEV status are Tenable-maintained metadata, not stored "
              f"in a plugin's own .nasl text -- every entry imported this way has those fields "
              f"blank. Use 'fetch --id <ID>' (network) for a specific plugin if that status "
              f"matters, or check the official CISA KEV catalog directly.")
    finally:
        if tmp_extract_dir:
            shutil.rmtree(tmp_extract_dir, ignore_errors=True)


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

    import_bulk_p = sub.add_parser(
        "import-bulk",
        help="Bulk-import a Nessus plugin feed YOU already obtained yourself (readable .nasl "
             "plugins only -- see module docstring) into a local mirror file",
    )
    import_bulk_p.add_argument(
        "--source", required=True,
        help="Path to either the downloaded all-2.0.tar.gz plugin feed archive, or an "
             "already-extracted Nessus plugins directory (e.g. /opt/nessus/lib/nessus/plugins)",
    )
    import_bulk_p.add_argument(
        "--output", default=DEFAULT_MIRROR_OUTPUT,
        help=f"Path to the local bulk-import file (default: {DEFAULT_MIRROR_OUTPUT}). Kept "
             f"separate from nessus_reference.json so a bulk import never overwrites "
             f"individually fetch()ed, network-sourced entries -- generate_variance.py checks "
             f"both.",
    )

    args = parser.parse_args()

    if args.command == "fetch":
        cmd_fetch(args)
    elif args.command == "fetch-list":
        cmd_fetch_list(args)
    elif args.command == "lookup":
        sys.exit(cmd_lookup(args))
    elif args.command == "import-bulk":
        cmd_import_bulk(args)


if __name__ == "__main__":
    main()
