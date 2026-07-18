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
An automated crawler against https://public.cyber.mil/stigs/downloads/ was
evaluated and is NOT reliable: the page is a Salesforce Lightning Web
Runtime (LWR) experience that renders its file list inside nested Shadow
DOM components and resolves the actual download URL only after a click
inside an authenticated browser session -- there is no static HTML link,
REST endpoint, or predictable URL pattern to script against safely. Rather
than ship a brittle scraper that will silently break (or look like it
works while quietly returning stale/empty data -- unacceptable for a
compliance system), this tool is built around BULK, HUMAN-INITIATED IMPORT
of the official documents instead:

  1. A person with normal (unclassified, no-CAC-required) access visits
     https://public.cyber.mil/stigs/downloads/ , and downloads however
     many official STIG/SRG .zip packages are needed -- one at a time or
     dozens in a batch. (CUI-marked content on cyber.mil requires a CAC
     and is out of scope for this tool -- handle those manually per your
     org's CUI process.)
  2. ALL of those .zip files (unmodified, exactly as downloaded) are
     copied into execution-plan/tools/stig_intake/ -- no manual
     unzipping required, see BULK IMPORT below.
  3. This script is run once to import the whole batch and (re)build the
     offline reference database in one pass.

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
  # Drop N official .zip packages (or already-extracted *-xccdf.xml files)
  # into stig_intake/, then bulk-import all of them in one pass:
  python3 stig_reference_builder.py build

  # Use non-default folders:
  python3 stig_reference_builder.py build --intake-dir /path/to/downloads \
      --output /path/to/stig_reference.json

  # Look up one finding ID after the database is built (sanity check):
  python3 stig_reference_builder.py lookup --id V-253259

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
from datetime import datetime, timezone
from xml.etree import ElementTree as ET

XCCDF_NS = {"x": "http://checklists.nist.gov/xccdf/1.1"}
CCI_NS_URI = "http://cyber.mil/cci"

SEVERITY_TO_CAT = {"high": "CAT I", "medium": "CAT II", "low": "CAT III"}

DEFAULT_INTAKE_DIR = os.path.join(os.path.dirname(__file__), "stig_intake")
DEFAULT_OUTPUT = os.path.join(os.path.dirname(__file__), "data", "stig_reference.json")


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

    build_p = sub.add_parser("build", help="Parse intake XCCDF files into the offline reference database")
    build_p.add_argument("--intake-dir", default=DEFAULT_INTAKE_DIR)
    build_p.add_argument("--output", default=DEFAULT_OUTPUT)

    lookup_p = sub.add_parser("lookup", help="Look up a single finding ID in the built database")
    lookup_p.add_argument("--id", required=True, help="Vulnerability ID, e.g. V-253259")
    lookup_p.add_argument("--output", default=DEFAULT_OUTPUT, help="Path to stig_reference.json")

    args = parser.parse_args()

    if args.command == "build":
        build_reference_db(args.intake_dir, args.output)
    elif args.command == "lookup":
        sys.exit(lookup(args.output, args.id))


if __name__ == "__main__":
    main()
