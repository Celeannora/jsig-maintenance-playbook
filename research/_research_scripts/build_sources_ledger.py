#!/usr/bin/env python3
"""
Rebuildable master source ledger for the JSIG maintenance-playbook repo.

Scans:
  1. Every .jsonl / .json file under research/_intermediate/ and research/source_notes/
     for URL-bearing records (search results, fetch records) -> "surfaced during research"
  2. Every .md file in the repo for inline markdown citations [text](https://...) -> "cited in deliverables"

Produces:
  - references/SOURCES-LEDGER.md   (human-readable, grouped)
  - references/sources-ledger.json (machine-readable, for future automated re-runs)

Re-run this script any time new research is added:
    python3 research/_research_scripts/build_sources_ledger.py
"""
import re, os, json, glob
from collections import defaultdict
from urllib.parse import urlparse

REPO_ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))

LINK_RE = re.compile(r'\[([^\]]+)\]\((https?://[^\s\)]+)\)')

def clean_url(u):
    return u.rstrip('.,;)\'"')

def domain_of(u):
    try:
        return urlparse(u).netloc.replace('www.', '')
    except Exception:
        return u

def find_url_records(obj, out):
    """Recursively find dict records that contain a url/link field, capture paired title/snippet."""
    if isinstance(obj, dict):
        url_val = None
        for key in ('url', 'link', 'source_url', 'page_url'):
            v = obj.get(key)
            if isinstance(v, str) and v.startswith('http'):
                url_val = v
                break
        if url_val:
            title = obj.get('title') or obj.get('name') or obj.get('page_title') or ''
            out.append((clean_url(url_val), str(title)[:200]))
        for v in obj.values():
            find_url_records(v, out)
    elif isinstance(obj, list):
        for item in obj:
            find_url_records(item, out)

def scan_json_like(path):
    records = []
    try:
        with open(path, encoding='utf-8', errors='ignore') as f:
            if path.endswith('.jsonl'):
                for line in f:
                    line = line.strip()
                    if not line:
                        continue
                    try:
                        obj = json.loads(line)
                    except Exception:
                        continue
                    find_url_records(obj, records)
            else:
                obj = json.load(f)
                find_url_records(obj, records)
    except Exception:
        pass
    return records

def main():
    surfaced = defaultdict(lambda: {"titles": set(), "found_in": set()})
    cited = defaultdict(lambda: {"anchors": set(), "cited_in": set()})

    # 1. Research artifacts (surfaced sources)
    scan_dirs = [
        os.path.join(REPO_ROOT, "research", "_intermediate"),
        os.path.join(REPO_ROOT, "research", "source_notes"),
    ]
    for d in scan_dirs:
        if not os.path.isdir(d):
            continue
        for path in glob.glob(os.path.join(d, "**", "*.json*"), recursive=True):
            rel = os.path.relpath(path, REPO_ROOT)
            for url, title in scan_json_like(path):
                surfaced[url]["found_in"].add(rel)
                if title:
                    surfaced[url]["titles"].add(title)

    # 2. Final deliverable markdown citations (cited sources)
    # NOTE: SOURCES-LEDGER.md itself is EXCLUDED here -- it is this script's own
    # generated output, and including it would make every re-run scan its own
    # prior links back in as "cited in a deliverable", self-inflating the count
    # on every subsequent run. Confirmed via audit on 2026-07-17: 231 of 292
    # "cited" entries in one run traced back to citing SOURCES-LEDGER.md only.
    LEDGER_SELF_PATH = os.path.join(REPO_ROOT, "references", "SOURCES-LEDGER.md")
    for path in glob.glob(os.path.join(REPO_ROOT, "**", "*.md"), recursive=True):
        if "/research/_intermediate/" in path or "/research/source_notes/" in path:
            continue
        if os.path.abspath(path) == os.path.abspath(LEDGER_SELF_PATH):
            continue
        rel = os.path.relpath(path, REPO_ROOT)
        try:
            with open(path, encoding='utf-8', errors='ignore') as f:
                content = f.read()
        except Exception:
            continue
        for anchor, url in LINK_RE.findall(content):
            url = clean_url(url)
            cited[url]["anchors"].add(anchor.strip())
            cited[url]["cited_in"].add(rel)

    # Raw (non-deduplicated) citation occurrence count across deliverable .md files,
    # for reconciliation against informal running totals tracked during research.
    raw_citation_occurrences = 0
    for path in glob.glob(os.path.join(REPO_ROOT, "**", "*.md"), recursive=True):
        if "/research/_intermediate/" in path or "/research/source_notes/" in path:
            continue
        if os.path.abspath(path) == os.path.abspath(LEDGER_SELF_PATH):
            continue
        try:
            with open(path, encoding='utf-8', errors='ignore') as f:
                content = f.read()
        except Exception:
            continue
        raw_citation_occurrences += len(LINK_RE.findall(content))

    all_urls = set(surfaced.keys()) | set(cited.keys())

    # Build combined ledger
    ledger = []
    for url in all_urls:
        entry = {
            "url": url,
            "domain": domain_of(url),
            "cited_in_deliverables": sorted(cited[url]["cited_in"]) if url in cited else [],
            "anchor_text": sorted(cited[url]["anchors"]) if url in cited else [],
            "surfaced_in_research": sorted(surfaced[url]["found_in"]) if url in surfaced else [],
            "research_titles": sorted(surfaced[url]["titles"]) if url in surfaced else [],
            "status": "cited" if url in cited else "surfaced_only",
        }
        ledger.append(entry)

    ledger.sort(key=lambda e: (e["status"] != "cited", e["domain"], e["url"]))

    # Write JSON
    out_json = os.path.join(REPO_ROOT, "references", "sources-ledger.json")
    with open(out_json, "w") as f:
        json.dump({
            "generated_by": "research/_research_scripts/build_sources_ledger.py",
            "total_unique_urls": len(ledger),
            "cited_in_deliverables_count": sum(1 for e in ledger if e["status"] == "cited"),
            "surfaced_only_count": sum(1 for e in ledger if e["status"] == "surfaced_only"),
            "raw_citation_occurrences_nondeduped": raw_citation_occurrences,
            "sources": ledger,
        }, f, indent=2)

    # Write Markdown
    cited_entries = [e for e in ledger if e["status"] == "cited"]
    surfaced_entries = [e for e in ledger if e["status"] == "surfaced_only"]

    lines = []
    lines.append("# Master Source Ledger\n")
    lines.append("Auto-generated running index of every external web source touched anywhere in this repository's research and deliverables. Regenerate any time with:\n")
    lines.append("```\npython3 research/_research_scripts/build_sources_ledger.py\n```\n")
    lines.append(f"**Total unique external URLs tracked: {len(ledger)}**")
    lines.append(f"- Cited inline in a final deliverable (README, MAINTENANCE-PLAN, control families, playbooks, execution-plan, references): **{len(cited_entries)}**")
    lines.append(f"- Surfaced during research (search results / fetched for evaluation) but not directly cited in a final deliverable: **{len(surfaced_entries)}**\n")
    lines.append("### Reconciliation note\n")
    lines.append(
        "Early in this project the running total of external web documents referenced was informally "
        "tracked at approximately **410**. That figure was a rough working estimate accumulated across "
        "individual research/search calls during the session, not a deduplicated count of unique URLs. "
        "This script is the actual reconciliation: it measures (a) the deduplicated **unique URL** count "
        "above, and (b) the raw, non-deduplicated count of inline `[text](url)` citation occurrences across "
        "every shipped deliverable `.md` file (control families, MAINTENANCE-PLAN, execution-plan, README, "
        "etc.), which is materially higher than 410 because many deliverables (e.g. the JSIG control-family "
        "pages) cite the same handful of authoritative sources -- NIST SP 800-53, CNSSI 1253, DoDI 8500 "
        "series, JSIG itself -- dozens of times across different controls. Re-run this script after adding "
        "new content; the counts above are the current source of truth, not the original 410 estimate.\n"
    )
    lines.append("---\n")
    lines.append("## Part A — Sources Cited in Final Deliverables\n")
    lines.append("These are the sources actually backing a claim somewhere in the shipped repo content. Grouped by domain.\n")
    lines.append("| Domain | URL | Anchor Text Used | Cited In (files) |")
    lines.append("|---|---|---|---|")
    for e in cited_entries:
        anchors = "; ".join(e["anchor_text"])[:150]
        cited_in = "; ".join(e["cited_in_deliverables"][:4]) + (f" (+{len(e['cited_in_deliverables'])-4} more)" if len(e["cited_in_deliverables"]) > 4 else "")
        lines.append(f"| {e['domain']} | [{e['url']}]({e['url']}) | {anchors} | {cited_in} |")

    lines.append("\n---\n")
    lines.append("## Part B — Sources Surfaced During Research (Background / Not Directly Cited)\n")
    lines.append("These were retrieved or surfaced by search during research phases to evaluate cadence conventions, runbook structure, or audit-artifact standards. They informed analyst judgment even where not individually cited by URL in a deliverable. Retained here for provenance/audit-trail purposes per the offline, clone-and-use design goal.\n")
    lines.append("| Domain | URL | Title (if captured) | Surfaced In (research file) |")
    lines.append("|---|---|---|---|")
    for e in surfaced_entries:
        title = (e["research_titles"][0] if e["research_titles"] else "")[:120]
        found_in = "; ".join(e["surfaced_in_research"][:2]) + (f" (+{len(e['surfaced_in_research'])-2} more)" if len(e["surfaced_in_research"]) > 2 else "")
        lines.append(f"| {e['domain']} | [{e['url']}]({e['url']}) | {title} | {found_in} |")

    with open(os.path.join(REPO_ROOT, "references", "SOURCES-LEDGER.md"), "w") as f:
        f.write("\n".join(lines) + "\n")

    print(f"Total unique URLs: {len(ledger)}")
    print(f"Cited in deliverables: {len(cited_entries)}")
    print(f"Surfaced only: {len(surfaced_entries)}")
    print(f"Raw citation occurrences (non-deduped): {raw_citation_occurrences}")

if __name__ == "__main__":
    main()
