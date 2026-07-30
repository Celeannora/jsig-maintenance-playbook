#!/usr/bin/env python3
"""
stig_reference_builder.py

Builds and maintains a local, offline STIG reference database from official
DISA XCCDF benchmark files (the "*-xccdf.xml" file inside every STIG .zip
package published at https://public.cyber.mil/stigs/downloads/ or
https://cyber.mil/stigs/downloads/ for CUI content).

WHY THIS EXISTS
----------------
The variance / risk-acceptance generator (generate_variance.py) needs
authoritative metadata for a given STIG finding ID (e.g. V-253259) --
title, severity/CAT level, official check text, official fix text, and
CCI mapping -- WITHOUT calling out to the internet at generation time.
This script is the one-time/periodic "connected" step that turns official
DISA content into a fully offline JSON reference file. Everything
downstream of this script (parsing scan results, generating variance
records) requires zero network access, per the "locally hosted only"
constraint for this environment.

WHERE THE SOURCE FILES COME FROM (READ THIS BEFORE AUTOMATING FURTHER)
-----------------------------------------------------------------------
An automated crawler against the per-product listing page
(https://public.cyber.mil/stigs/downloads/) was evaluated and is NOT
reliable: that page is a Salesforce Lightning Web Runtime (LWR) experience
that renders its file list inside nested Shadow DOM components and
resolves each individual STIG's actual download URL (with its own
arbitrary version/release string) only after a click inside a rendered
browser session -- there is no static HTML link, REST endpoint, or
predictable per-product URL pattern to script against safely.

The quarterly SRG-STIG LIBRARY COMPILATION is different: DISA hosts the
compiled .zip on a plain static file server (dl.dod.cyber.mil,
"wp-content/uploads/..." -- a bare WordPress media path, unauthenticated,
no query tokens, no shadow DOM) at a PREDICTABLE URL pattern:
  https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_SRG-STIG_Library_<Month>_<Year>.zip
This was confirmed directly (HEAD requests against several recent months
all returned plain HTTP 200 with normal static-file cache headers, no
auth/redirect). Because that pattern is stable and safely automatable,
`fetch-compilation` below walks backward from the current month to find
the latest published release and downloads it for you. Per-product STIGs
still require the manual, human-initiated download described below --
DO NOT attempt to guess per-product zip filenames/versions automatically.

Two ways to get source files into stig_intake/:

  A. AUTOMATED (recommended -- gets everything at once, one command):
     python3 stig_reference_builder.py fetch-compilation
     Downloads the current quarterly SRG-STIG Library Compilation (all
     unclassified STIGs/SRGs bundled together, currently ~350-400 MB)
     directly into stig_intake/. Then just run `build` as usual.

  B. MANUAL (for a single product, or CUI-marked content):
     1. A person with normal (unclassified, no-CAC-required) access visits
        https://public.cyber.mil/stigs/downloads/ , and downloads however
        many official STIG/SRG .zip packages are needed -- one at a time
        or dozens in a batch. (CUI-marked content on cyber.mil requires a
        CAC and is out of scope for this tool -- handle those manually
        per your org's CUI process.)
     2. ALL of those .zip files (unmodified, exactly as downloaded) are
        copied into execution-plan/tools/stig_intake/ -- no manual
        unzipping required, see BULK IMPORT below.

Either way, this script is then run once to import the whole batch and
(re)build the offline reference database in one pass.

This is not a limitation of laziness -- it is the correct architecture for
an air-gapped/offline environment anyway: production scan/review machines
should never need live internet access. Only the intake step (on a
separate, connected admin workstation) touches the network, and only the
official DISA domain.

BULK IMPORT
------------
The intake folder may contain any mix of:
  - Raw "*-xccdf.xml" files (already extracted), and/or
  - Official DISA .zip packages, exactly as downloaded, un-extracted --
    including a single per-product zip, OR the quarterly
    "SRG-STIG Library Compilation" zip (U_SRG-STIG_Library.zip) published
    at https://public.cyber.mil/stigs/compilations/, which bundles EVERY
    current STIG/SRG as nested per-product zips inside one outer zip.
For every .zip found, this script opens it in memory and recursively
descends into it: any member matching an XCCDF benchmark pattern
(filenames ending in "-xccdf.xml", case-insensitive) is extracted, and any
member that is itself a .zip is opened and searched the same way, up to
MAX_ZIP_DEPTH levels deep. Everything else in any zip at any level (OVAL
files, CPE dictionaries, PDFs, GPO backups, readme docs, SCC/CKL content,
SCAP comment matrices, etc.) is ignored. This means you can drop in either
a single official per-product .zip, or the one quarterly Library
Compilation .zip, with no manual unzipping either way -- "download all
STIG IDs in one shot" is satisfied by fetching that single compilation
file each quarter and re-running `build`. A single run can ingest as many
products/STIGs as are present, at any nesting depth found.

USAGE
-----
  # One-time/periodic connected step: pull the latest official quarterly
  # compilation straight into stig_intake/ (see fetch-compilation below):
  python3 stig_reference_builder.py fetch-compilation

  # Drop N official .zip packages (or already-extracted *-xccdf.xml files)
  # into stig_intake/, then bulk-import all of them in one pass:
  python3 stig_reference_builder.py build

  # Use non-default folders:
  python3 stig_reference_builder.py build --intake-dir /path/to/downloads \
      --output /path/to/stig_reference.json

  # Look up one finding ID after the database is built (sanity check):
  python3 stig_reference_builder.py lookup --id V-253259

FETCH-COMPILATION
------------------
Downloads the current quarterly SRG-STIG Library Compilation directly
into stig_intake/ (or --dest), by walking backward from the current month
(e.g. July 2026, then June 2026, ...) issuing a HEAD request against
  https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_SRG-STIG_Library_<Month>_<Year>.zip
until one resolves (HTTP 200), then streaming that file to disk. Stops
and reports failure after --max-months-back (default 6) with no hit --
it never fabricates or guesses a URL it hasn't confirmed live. Requires
network access to dl.dod.cyber.mil (unclassified, no CAC/login needed).
The downloaded file is the UNCLASSIFIED compilation only; CUI-marked
content still requires the manual CAC-gated process described above.

  python3 stig_reference_builder.py fetch-compilation
  python3 stig_reference_builder.py fetch-compilation --dest /path/to/stig_intake --max-months-back 12

OUTPUT FORMAT (stig_reference.json)
------------------------------------
{
  "generated_at": "<ISO 8601 timestamp>",
  "source_files": ["U_MS_Windows_11_STIG_V2R8_Manual-xccdf.xml", ...],
  "findings": {
    "V-253259": {
      "vuln_id": "V-253259",
      "rule_id": "SV-253259r1210282_rule",
      "stig_id": "WN11-00-000030",
      "benchmark_id": "Microsoft_Windows_11_STIG",
      "benchmark_title": "Microsoft Windows 11 Security Technical Implementation Guide",
      "release": "Release: 8 Benchmark Date: 01 Jul 2026",
      "title": "Windows 11 information systems must use BitLocker ...",
      "severity": "high",
      "cat": "CAT I",
      "description": "<VulnDiscussion text, HTML-unescaped>",
      "check_text": "<official check-content text>",
      "fix_text": "<official fixtext>",
      "cci_refs": ["CCI-002475"],
      "source_file": "U_MS_Windows_11_STIG_V2R8_Manual-xccdf.xml"
    },
    ...
  }
}

SEVERITY -> CAT MAPPING (standard DISA convention)
---------------------------------------------------
  high   -> CAT I
  medium -> CAT II
  low    -> CAT III
"""

import argparse
import glob
import html
import json
import os
import re
import sys
import urllib.error
import urllib.request
from datetime import datetime, timezone
from xml.etree import ElementTree as ET

XCCDF_NS = {"x": "http://checklists.nist.gov/xccdf/1.1"}
CCI_NS_URI = "http://cyber.mil/cci"

SEVERITY_TO_CAT = {"high": "CAT I", "medium": "CAT II", "low": "CAT III"}

DEFAULT_INTAKE_DIR = os.path.join(os.path.dirname(__file__), "stig_intake")
DEFAULT_OUTPUT = os.path.join(os.path.dirname(__file__), "data", "stig_reference.json")

COMPILATION_URL_TEMPLATE = (
    "https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/"
    "U_SRG-STIG_Library_{month}_{year}.zip"
)
DEFAULT_MAX_MONTHS_BACK = 6
_USER_AGENT = "jsig-variance-tooling/1.0"


def _compilation_candidate_urls(max_months_back):
    """Yield (month_name, year, url) tuples walking backward from the
    current month, oldest search bound = max_months_back months ago.
    Never guesses beyond that -- caller reports failure if none hit."""
    cursor = datetime.now(timezone.utc)
    for _ in range(max_months_back + 1):
        month = cursor.strftime("%B")
        year = cursor.year
        url = COMPILATION_URL_TEMPLATE.format(month=month, year=year)
        yield month, year, url
        # Step back one month (handle January -> December/year rollover).
        prev_month = cursor.month - 1 or 12
        prev_year = cursor.year - 1 if cursor.month == 1 else cursor.year
        cursor = cursor.replace(year=prev_year, month=prev_month, day=1)


def fetch_compilation(dest_dir, max_months_back=DEFAULT_MAX_MONTHS_BACK):
    """Discover and download the latest published quarterly SRG-STIG
    Library Compilation into dest_dir. Confirms each candidate URL with a
    HEAD request before downloading anything -- never fabricates a URL it
    hasn't verified live. Returns the downloaded file path, or None on
    failure (after printing a clear reason to stderr)."""
    os.makedirs(dest_dir, exist_ok=True)

    for month, year, url in _compilation_candidate_urls(max_months_back):
        req = urllib.request.Request(url, method="HEAD", headers={"User-Agent": _USER_AGENT})
        try:
            with urllib.request.urlopen(req, timeout=10) as resp:
                size = resp.headers.get("Content-Length")
        except urllib.error.HTTPError as e:
            if e.code == 404:
                print(f"  [..] {month} {year}: not published (404), trying earlier month", file=sys.stderr)
                continue
            print(f"  [FAIL] {month} {year}: HTTP {e.code} checking {url}", file=sys.stderr)
            return None
        except urllib.error.URLError as e:
            print(f"  [FAIL] network error reaching dl.dod.cyber.mil: {e.reason}", file=sys.stderr)
            print("  This intake step requires network access to dl.dod.cyber.mil.", file=sys.stderr)
            return None

        size_mb = f"{int(size) / (1024 * 1024):.0f} MB" if size else "unknown size"
        print(f"  [FOUND] {month} {year} compilation ({size_mb}) -- {url}")
        dest_path = os.path.join(dest_dir, os.path.basename(url))
        print(f"  Downloading to {dest_path} ...")
        get_req = urllib.request.Request(url, headers={"User-Agent": _USER_AGENT})
        try:
            with urllib.request.urlopen(get_req, timeout=30) as resp, open(dest_path, "wb") as out:
                downloaded = 0
                while True:
                    chunk = resp.read(1024 * 1024)
                    if not chunk:
                        break
                    out.write(chunk)
                    downloaded += len(chunk)
        except (urllib.error.HTTPError, urllib.error.URLError) as e:
            print(f"  [FAIL] download interrupted: {e}", file=sys.stderr)
            if os.path.exists(dest_path):
                os.remove(dest_path)
            return None

        print(f"  [OK] downloaded {downloaded / (1024 * 1024):.0f} MB -> {dest_path}")
        print("  Next: python3 stig_reference_builder.py build")
        return dest_path

    print(
        f"  [FAIL] no compilation found for the last {max_months_back} months. "
        "DISA may have changed the file naming pattern, or the release is delayed -- "
        "check https://public.cyber.mil/stigs/compilations/ manually.",
        file=sys.stderr,
    )
    return None


def _strip_html_entities(text):
    """XCCDF <description> fields are double-escaped (HTML entities
    wrapping an inner pseudo-XML block like <VulnDiscussion>...</VulnDiscussion>).
    Unescape once, then strip the pseudo-tags for a clean plain-text field
    while preserving the VulnDiscussion body as the primary description."""
    if not text:
        return ""
    unescaped = html.unescape(text)
    m = re.search(r"<VulnDiscussion>(.*?)</VulnDiscussion>", unescaped, re.DOTALL)
    if m:
        return m.group(1).strip()
    # Fallback: strip any remaining pseudo-XML tags entirely.
    return re.sub(r"<[^>]+>", "", unescaped).strip()


def parse_xccdf_benchmark(xml_path):
    """Parse one official DISA XCCDF benchmark file into a list of
    finding-metadata dicts. Returns [] and prints a warning if the file
    does not look like an XCCDF 1.1 Benchmark (fails closed, never
    fabricates data for an unrecognized format)."""
    try:
        tree = ET.parse(xml_path)
    except ET.ParseError as e:
        print(f"  [SKIP] {os.path.basename(xml_path)}: not well-formed XML ({e})", file=sys.stderr)
        return []

    root = tree.getroot()
    if not root.tag.endswith("Benchmark"):
        print(f"  [SKIP] {os.path.basename(xml_path)}: root element is <{root.tag}>, expected <Benchmark>", file=sys.stderr)
        return []

    benchmark_id = root.get("id", "")
    title_el = root.find("x:title", XCCDF_NS)
    benchmark_title = title_el.text.strip() if title_el is not None and title_el.text else ""
    release_el = root.find("x:plain-text[@id='release-info']", XCCDF_NS)
    release = release_el.text.strip() if release_el is not None and release_el.text else ""

    findings = []
    for group in root.iter("{http://checklists.nist.gov/xccdf/1.1}Group"):
        vuln_id = group.get("id", "")
        rule = group.find("x:Rule", XCCDF_NS)
        if rule is None or not vuln_id:
            continue

        rule_id = rule.get("id", "")
        severity = rule.get("severity", "").lower()
        version_el = rule.find("x:version", XCCDF_NS)
        stig_id = version_el.text.strip() if version_el is not None and version_el.text else ""
        rule_title_el = rule.find("x:title", XCCDF_NS)
        rule_title = rule_title_el.text.strip() if rule_title_el is not None and rule_title_el.text else ""
        desc_el = rule.find("x:description", XCCDF_NS)
        description = _strip_html_entities(desc_el.text if desc_el is not None else "")

        fixtext_el = rule.find("x:fixtext", XCCDF_NS)
        fix_text = (fixtext_el.text or "").strip() if fixtext_el is not None else ""

        check_content_el = rule.find("x:check/x:check-content", XCCDF_NS)
        check_text = (check_content_el.text or "").strip() if check_content_el is not None else ""

        cci_refs = []
        for ident in rule.findall("x:ident", XCCDF_NS):
            if ident.get("system") == CCI_NS_URI and ident.text:
                cci_refs.append(ident.text.strip())

        findings.append({
            "vuln_id": vuln_id,
            "rule_id": rule_id,
            "stig_id": stig_id,
            "benchmark_id": benchmark_id,
            "benchmark_title": benchmark_title,
            "release": release,
            "title": rule_title,
            "severity": severity,
            "cat": SEVERITY_TO_CAT.get(severity, "UNKNOWN"),
            "description": description,
            "check_text": check_text,
            "fix_text": fix_text,
            "cci_refs": cci_refs,
            "source_file": os.path.basename(xml_path),
        })

    return findings


MAX_ZIP_DEPTH = 6  # generous headroom above the one level of nesting the
                    # official quarterly Library Compilation actually uses


def _iter_xccdf_members(zip_bytes, path_label, depth=0):
    """Recursively walk a zip's contents (given as raw bytes), yielding
    (path_label, member_name, member_bytes) for every XCCDF benchmark file
    found -- descending into any member that is itself a .zip (this is how
    the official quarterly SRG-STIG Library Compilation nests hundreds of
    per-product zips inside one outer zip). Never raises on a corrupt/non-
    zip file or on exceeding MAX_ZIP_DEPTH -- logs and stops descending."""
    import zipfile
    import io
    if depth > MAX_ZIP_DEPTH:
        print(f"  [SKIP] {path_label}: exceeded max zip nesting depth ({MAX_ZIP_DEPTH})", file=sys.stderr)
        return
    try:
        zf = zipfile.ZipFile(io.BytesIO(zip_bytes))
    except zipfile.BadZipFile:
        print(f"  [SKIP] {path_label}: not a valid .zip file", file=sys.stderr)
        return
    for member in zf.namelist():
        lower = member.lower()
        if lower.endswith("-xccdf.xml"):
            yield (path_label, member, zf.read(member))
        elif lower.endswith(".zip"):
            inner_bytes = zf.read(member)
            yield from _iter_xccdf_members(inner_bytes, f"{path_label} -> {member}", depth + 1)
        # else: ignore (OVAL, CPE dictionaries, PDFs, GPO backups, readme
        # docs, SCAP comment matrices, etc.) at any nesting level.


def _extract_xccdf_from_zip(zip_path, work_dir):
    """Open an official DISA STIG .zip -- a single per-product package OR
    the quarterly SRG-STIG Library Compilation containing many nested
    per-product zips -- and extract every XCCDF benchmark file found at
    any nesting depth. Extracted files are written into work_dir (with a
    counter prefix to avoid basename collisions across products) and their
    paths returned. Never raises on a corrupt/non-zip file -- logs and
    skips."""
    with open(zip_path, "rb") as f:
        top_bytes = f.read()

    extracted = []
    for i, (path_label, member_name, data) in enumerate(
        _iter_xccdf_members(top_bytes, os.path.basename(zip_path))
    ):
        safe_name = os.path.basename(member_name) or f"member_{i}.xml"
        dest_path = os.path.join(work_dir, f"{i:04d}_{safe_name}")
        with open(dest_path, "wb") as dst_f:
            dst_f.write(data)
        extracted.append(dest_path)
        if path_label != os.path.basename(zip_path):
            print(f"    (nested inside {path_label})", file=sys.stderr)

    if not extracted:
        print("  [NOTE] " + os.path.basename(zip_path) + ": no '*-xccdf.xml' member found inside, "
              "at any nesting depth (this .zip may be a manual-only STIG with no SCAP/XCCDF "
              "benchmark, or a GPO/tool package rather than a STIG package).", file=sys.stderr)
    return extracted


def build_reference_db(intake_dir, output_path):
    import tempfile
    import shutil

    if not os.path.isdir(intake_dir):
        print("Intake directory does not exist: " + intake_dir)
        return None

    zip_files = sorted(set(
        glob.glob(os.path.join(intake_dir, "*.zip")) +
        glob.glob(os.path.join(intake_dir, "**", "*.zip"), recursive=True)
    ))

    xml_files = sorted(set(
        glob.glob(os.path.join(intake_dir, "*.xml")) +
        glob.glob(os.path.join(intake_dir, "**", "*.xml"), recursive=True)
    ))

    tmp_dir = None
    if zip_files:
        tmp_dir = tempfile.mkdtemp(prefix="stig_zip_extract_")
        print("Found " + str(len(zip_files)) + " .zip package(s) in intake folder -- extracting XCCDF files ...")
        for zip_path in zip_files:
            print("Opening " + os.path.basename(zip_path) + " ...")
            extracted = _extract_xccdf_from_zip(zip_path, tmp_dir)
            for path in extracted:
                print("  -> extracted " + os.path.basename(path))
            xml_files.extend(extracted)
        xml_files = sorted(set(xml_files))

    if not xml_files:
        print(f"No official STIG documents found in {intake_dir} (no .zip packages and no ")
        print("'*-xccdf.xml' files).")
        print("Drop official STIG .zip packages (exactly as downloaded, no manual unzipping")
        print("needed) or already-extracted '*-xccdf.xml' files from")
        print("https://public.cyber.mil/stigs/downloads/ into this folder and re-run.")
        if tmp_dir:
            shutil.rmtree(tmp_dir, ignore_errors=True)
        return None

    all_findings = {}
    source_files = []
    total_parsed = 0
    for xml_path in xml_files:
        print(f"Parsing {os.path.basename(xml_path)} ...")
        findings = parse_xccdf_benchmark(xml_path)
        if not findings:
            continue
        source_files.append(os.path.basename(xml_path))
        for f in findings:
            if f["vuln_id"] in all_findings and all_findings[f["vuln_id"]]["source_file"] != f["source_file"]:
                print(f"  [NOTE] {f['vuln_id']} already present from "
                      f"{all_findings[f['vuln_id']]['source_file']}; overwriting with "
                      f"{f['source_file']} (last file wins -- keep intake folder curated "
                      f"to one benchmark version per product).", file=sys.stderr)
            all_findings[f["vuln_id"]] = f
            total_parsed += 1
        print(f"  -> {len(findings)} findings ({findings[0]['benchmark_title']})")

    db = {
        "generated_at": datetime.now(timezone.utc).isoformat(),
        "source_files": source_files,
        "finding_count": len(all_findings),
        "findings": all_findings,
    }

    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    with open(output_path, "w", encoding="utf-8") as f:
        json.dump(db, f, indent=2, ensure_ascii=False)

    print(f"\nBuilt reference database: {output_path}")
    print(f"  .zip packages imported: {len(zip_files)}")
    print(f"  Benchmark files parsed: {len(source_files)}")
    print(f"  Unique finding IDs:     {len(all_findings)}")

    if tmp_dir:
        shutil.rmtree(tmp_dir, ignore_errors=True)

    return db


def lookup(output_path, finding_id):
    if not os.path.exists(output_path):
        print(f"No reference database at {output_path}. Run 'build' first.")
        return 1
    with open(output_path, encoding="utf-8") as f:
        db = json.load(f)
    finding = db.get("findings", {}).get(finding_id)
    if not finding:
        print(f"'{finding_id}' not found in reference database "
              f"({db.get('finding_count', 0)} findings loaded from "
              f"{len(db.get('source_files', []))} source file(s)).")
        return 1
    print(json.dumps(finding, indent=2, ensure_ascii=False))
    return 0


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = parser.add_subparsers(dest="command", required=True)

    fetch_p = sub.add_parser("fetch-compilation", help="Download the latest official quarterly SRG-STIG Library Compilation into the intake folder")
    fetch_p.add_argument("--dest", default=DEFAULT_INTAKE_DIR, help="Folder to download into (default: stig_intake/)")
    fetch_p.add_argument("--max-months-back", type=int, default=DEFAULT_MAX_MONTHS_BACK, help="How many months to search backward before giving up")

    build_p = sub.add_parser("build", help="Parse intake XCCDF files into the offline reference database")
    build_p.add_argument("--intake-dir", default=DEFAULT_INTAKE_DIR)
    build_p.add_argument("--output", default=DEFAULT_OUTPUT)

    lookup_p = sub.add_parser("lookup", help="Look up a single finding ID in the built database")
    lookup_p.add_argument("--id", required=True, help="Vulnerability ID, e.g. V-253259")
    lookup_p.add_argument("--output", default=DEFAULT_OUTPUT, help="Path to stig_reference.json")

    args = parser.parse_args()

    if args.command == "fetch-compilation":
        result = fetch_compilation(args.dest, args.max_months_back)
        sys.exit(0 if result else 1)
    elif args.command == "build":
        build_reference_db(args.intake_dir, args.output)
    elif args.command == "lookup":
        sys.exit(lookup(args.output, args.id))


if __name__ == "__main__":
    main()
