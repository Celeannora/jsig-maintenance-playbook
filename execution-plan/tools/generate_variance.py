#!/usr/bin/env python3
"""
generate_variance.py

Generates a filled Variance / Risk-Acceptance Record (per
execution-plan/templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md) for ONE
finding, identified by EITHER a STIG Vulnerability ID (e.g. "V-253259",
looked up in the offline database built by stig_reference_builder.py) OR
a CVE ID (e.g. "CVE-2021-44228", looked up in the offline database built
by cve_reference_builder.py) -- the identifier's format is auto-detected,
so the same command works for either a STIG compliance-audit finding or a
Nessus vulnerability-scan finding.

This intentionally does NOT parse live Nessus/.SCC/OSCAP scan-result
files. The offline reference database (built by bulk-importing official
DISA XCCDF/.zip documents, or by fetching official NVD CVE metadata)
supplies the official finding metadata; the human preparer supplies the
asset-specific, scan-specific facts by hand in Sections 2 and 6 of the
generated document. This keeps the tool simple, reliable, and independent
of any particular scan tool's export format -- if you later want to
pre-fill Section 6 from an actual scan export, treat that as a separate,
optional enhancement layered on top of this generator, not a prerequisite
for it.

USAGE
-----
  # STIG finding:
  python3 generate_variance.py \\
      --id V-253259 \\
      --asset WIN11-WKSTN-042 \\
      --system-scope "Example Enclave A" \\
      --detection-method "Manual STIG checklist review" \\
      --detection-date 2026-07-17 \\
      --preparer "J. Smith, ISSO"

  # CVE / Nessus finding -- exact same flags, just a CVE-shaped --id:
  python3 generate_variance.py \\
      --id CVE-2021-44228 \\
      --asset LINUX-APP-017 \\
      --system-scope "Example Enclave A" \\
      --detection-method "Nessus vulnerability scan" \\
      --detection-date 2026-07-17 \\
      --preparer "J. Smith, ISSO"

  # Optional: override which reference DB file is used for whichever ID
  # type is detected (default: data/stig_reference.json for STIG IDs,
  # data/cve_reference.json for CVE IDs):
  python3 generate_variance.py --id V-253259 --reference-db /path/to/db.json ...

If --asset/--system-scope/etc. are omitted, the generated document keeps
the corresponding fields blank for the preparer to fill in by hand --
this script never fabricates asset-specific facts.
"""

import argparse
import json
import os
import re
import sys
from datetime import datetime, timedelta, timezone

DEFAULT_STIG_DB = os.path.join(os.path.dirname(__file__), "data", "stig_reference.json")
DEFAULT_CVE_DB = os.path.join(os.path.dirname(__file__), "data", "cve_reference.json")
DEFAULT_OUTPUT_DIR = os.path.normpath(
    os.path.join(os.path.dirname(__file__), "..", "variance-records")
)

SLA_DAYS_BY_CAT = {"CAT I": 30, "CAT II": 90, "CAT III": 180}

RACI_BY_CAT = {
    "CAT I": {
        "responsible": "ISSO or Privileged User who identified the finding",
        "accountable": "AO / DAO",
        "consulted": "ISSM, Information Owner/Steward",
        "informed": "Risk Executive Function, CISO",
    },
    "CAT II": {
        "responsible": "ISSO or Privileged User who identified the finding",
        "accountable": "ISSM",
        "consulted": "Information Owner/Steward",
        "informed": "AO/DAO (Informed only)",
    },
    "CAT III": {
        "responsible": "ISSO or Privileged User who identified the finding",
        "accountable": "ISSO",
        "consulted": "ISSM",
        "informed": "\u2014",
    },
}

# Format markers this tool recognizes. Anything that matches neither is
# rejected rather than guessed at -- fails closed per this project's
# design principle of never fabricating or assuming asset/finding facts.
STIG_ID_RE = re.compile(r"^V-\d+$", re.IGNORECASE)
CVE_ID_RE = re.compile(r"^CVE-\d{4}-\d{4,}$", re.IGNORECASE)


def detect_id_type(raw_id):
    """Return 'STIG' or 'CVE' based on the --id format, or None if it
    matches neither recognized pattern."""
    value = raw_id.strip()
    if STIG_ID_RE.match(value):
        return "STIG"
    if CVE_ID_RE.match(value):
        return "CVE"
    return None


def load_db(db_path, id_type):
    if not os.path.exists(db_path):
        print(f"No reference database found at {db_path}.")
        if id_type == "STIG":
            print("Run: python3 stig_reference_builder.py build")
        else:
            print("Run: python3 cve_reference_builder.py fetch --id <CVE-ID>")
        sys.exit(1)
    with open(db_path, encoding="utf-8") as f:
        return json.load(f)


def blank(value):
    return value if value else "*(fill in)*"


def _section1_identity_rows(finding, id_type, cat):
    """Identifier-specific rows for Section 1 -- the part of the record
    that differs between a STIG finding and a CVE finding."""
    if id_type == "STIG":
        cci_refs = ", ".join(finding.get("cci_refs", [])) or "*(none listed in benchmark)*"
        return f"""| STIG Vulnerability ID | {finding['vuln_id']} |
| STIG Rule ID | {finding.get('rule_id', '')} |
| STIG Rule Version (short ID) | {finding.get('stig_id', '')} |
| Benchmark / STIG Title | {finding.get('benchmark_title', '')} |
| Benchmark Release | {finding.get('release', '')} |
| Finding Title | {finding.get('title', '')} |
| Severity / CAT Level | {cat} (raw severity: {finding.get('severity', '')}) |
| CCI Reference(s) | {cci_refs} |"""

    # CVE
    cwe_refs = ", ".join(finding.get("cwe_refs", [])) or "*(none published)*"
    kev_row = ""
    if finding.get("cisa_kev_listed"):
        kev_row = (
            f"\n| CISA KEV Status | **Listed** since {finding.get('cisa_kev_date_added', '')}"
            f" -- official due date {finding.get('cisa_kev_due_date', '')} "
            f"(see Section 8 for required action) |"
        )
    else:
        kev_row = "\n| CISA KEV Status | Not listed |"
    return f"""| CVE ID | {finding['cve_id']} |
| CVSS Version | {finding.get('cvss_version') or '*(unscored -- see Severity below)*'} |
| CVSS Vector | {finding.get('cvss_vector') or '*(none)*'} |
| CVSS Base Score | {finding.get('cvss_base_score') if finding.get('cvss_base_score') is not None else '*(none)*'} |
| Finding Title | {finding.get('title', '')} |
| Severity / CAT Level | {cat} (raw severity: {finding.get('cvss_base_severity', '')}; basis: {finding.get('cat_basis', '')}) |
| CWE Reference(s) | {cwe_refs} |{kev_row}"""


def _section8_body(finding, id_type):
    """Identifier-specific body for Section 8 -- STIG has official
    check/fix text from the XCCDF Rule; CVE has no equivalent concept, so
    it surfaces the NVD description, references, and (if KEV-listed) the
    verbatim CISA-required action instead."""
    if id_type == "STIG":
        return f"""| Field | Value |
|---|---|
| Official Finding Description | {finding.get('description', '')} |

**Official Check Text:**

{finding.get('check_text', '*(none in benchmark)*')}

**Official Fix Text:**

{finding.get('fix_text', '*(none in benchmark)*')}"""

    # CVE
    references = list(dict.fromkeys(finding.get("references", [])))
    ref_list = "\n".join(f"- {r}" for r in references) or "*(none published)*"
    kev_action = ""
    if finding.get("cisa_kev_listed"):
        kev_action = f"""

**CISA Required Action (KEV-listed, verbatim):**

{finding.get('cisa_kev_required_action', '*(none published)*')}"""
    return f"""| Field | Value |
|---|---|
| Official Finding Description | {finding.get('description', '')} |
| NVD Last Modified | {finding.get('last_modified', '')} |

**Official References (NVD):**

{ref_list}{kev_action}"""


def _source_citation(finding, id_type):
    if id_type == "STIG":
        return (f"Official content sourced from: {finding.get('source_file', 'unknown')} "
                f"(imported from https://public.cyber.mil/stigs/downloads/ "
                f"or the quarterly SRG-STIG Library Compilation into the offline reference database).")
    return (f"Official content sourced from: NVD CVE API 2.0 "
            f"(https://services.nvd.nist.gov/rest/json/cves/2.0), fetched {finding.get('fetched_at', 'unknown')} "
            f"into the offline reference database.")


def render_variance_record(finding, id_type, args):
    id_value = finding["vuln_id"] if id_type == "STIG" else finding["cve_id"]
    cat = finding.get("cat", "UNKNOWN")
    raci = RACI_BY_CAT.get(cat, RACI_BY_CAT["CAT III"])
    sla_days = SLA_DAYS_BY_CAT.get(cat, 180)

    detection_date_str = args.detection_date or datetime.now().strftime("%Y-%m-%d")
    try:
        detection_date = datetime.strptime(detection_date_str, "%Y-%m-%d")
    except ValueError:
        detection_date = datetime.now()
    due_date = (detection_date + timedelta(days=sla_days)).strftime("%Y-%m-%d")

    asset_safe = re.sub(r"[^A-Za-z0-9_-]", "_", args.asset) if args.asset else "UNSPECIFIED-ASSET"
    record_id = f"VAR-{id_value}-{asset_safe}-{detection_date.strftime('%Y%m%d')}"

    generated_note_source = (
        "the offline STIG reference database" if id_type == "STIG" else "the offline CVE reference database"
    )
    official_source_desc = (
        finding.get("source_file", "unknown source file") if id_type == "STIG"
        else "NVD CVE API 2.0"
    )

    doc = f"""# Variance / Risk-Acceptance Record \u2014 {record_id}

> Generated by `execution-plan/tools/generate_variance.py` from {generated_note_source} on {datetime.now(timezone.utc).strftime('%Y-%m-%d %H:%M UTC')}. Official finding text (Sections 1 and 8) is sourced verbatim from {official_source_desc} \u2014 do not hand-edit those fields; refresh the reference database instead. Sections 2, 3, 6, 7, 9, and 10 require human input and are intentionally left as fill-in prompts below.
>
> Identifier type: **{id_type}**. Structure per `execution-plan/templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md`.

## 1. Identity

| Field | Value |
|---|---|
| Variance Record ID | {record_id} |
{_section1_identity_rows(finding, id_type, cat)}
| System / Enclave Scope | {blank(args.system_scope)} |
| Document Version | v1.0 |
| Last Reviewed | {blank(args.detection_date)} |

## 2. Trigger and Cadence

| Field | Value |
|---|---|
| Trigger Condition | Configuration/vulnerability review identified this finding as **Open** *(preparer: confirm or correct)* |
| Detection Date | {detection_date_str} |
| Detection Method | {blank(args.detection_method)} |
| Reporting Period | *(fill in)* |
| Re-Review / Decision Due Date | **{due_date}** ({sla_days}-day SLA for {cat}, per `execution-plan/templates/ESCALATION-MATRIX.md`) |
| Repository Location | `execution-plan/variance-records/{record_id}.md` |

## 3. Preconditions

| Field | Value |
|---|---|
| Required Access | Read access to the affected asset's configuration baseline; read access to the offline reference database |
| Required Tools | Offline {"STIG" if id_type == "STIG" else "CVE"} reference database; local ticketing/GRC system record for cross-linking |
| Preparer | {blank(args.preparer)} |
| Input Artifacts | Official {"DISA STIG check/fix text" if id_type == "STIG" else "NVD CVE metadata"} below; prior variance record for this finding/asset pair, if this is a renewal |

## 4. RACI (Severity-Tiered \u2014 {cat})

| Role | Assignment |
|---|---|
| Responsible (prepares record) | {raci['responsible']} |
| **Accountable (final accept/reject authority)** | **{raci['accountable']}** |
| Consulted | {raci['consulted']} |
| Informed | {raci['informed']} |
| Evidence Owner | ISSO |
| Escalation Owner | ISSM |

## 5. Execution Steps (Preparation)

1. Confirm the {"Vulnerability" if id_type == "STIG" else "CVE"} ID and affected asset(s) above are correct.
2. Fill in Section 2's Detection Method and Reporting Period.
3. Complete Section 6 (Validation) with the actual observed state of the asset \u2014 first-person, factual, not a restatement of the official text below.
4. Route the draft to the Consulted role(s) in Section 4 for comments before requesting sign-off.
5. Route to the Accountable role in Section 4 for the risk decision. Do not proceed to Closure (Section 10) until that signature is captured.

## 6. Validation

| Field | Value |
|---|---|
| Assessment Method | *(Examine / Interview / Test \u2014 state which was used)* |
| Expected Result (per official reference text) | See official reference text in Section 8 |
| Actual Result Observed | *(fill in \u2014 what was actually found on the asset)* |
| Pass / Fail | *(Pass = Not a Finding; Fail = Open)* |
| Reviewed By | *(fill in)* |
| Review Date | *(fill in)* |

## 7. Evidence Package

| Field | Value |
|---|---|
| Artifact List | *(fill in)* |
| Repository Path | `execution-plan/variance-records/evidence/{record_id}/` |
| Retention Period | Per local records-retention policy (minimum: current + 1 prior accreditation cycle) |
| Chain-of-Custody Note | *(fill in)* |

## 8. Findings and Exceptions (Official Reference \u2014 Auto-Populated)

{_section8_body(finding, id_type)}

| Field | Value |
|---|---|
| Affected Asset(s) | {blank(args.asset)} |
| Exception Type | \u2610 Risk Acceptance &nbsp;&nbsp; \u2610 Compensating Control &nbsp;&nbsp; \u2610 False Positive Correction &nbsp;&nbsp; \u2610 Remediation In Progress |
| Rationale | *(fill in)* |
| Compensating Controls | *(fill in, if any)* |
| POA&M ID | *(fill in, if applicable)* |

## 9. Remediation and Escalation

| Field | Value |
|---|---|
| Decision | \u2610 Accept Risk &nbsp;&nbsp; \u2610 Reject \u2014 Remediate &nbsp;&nbsp; \u2610 Mitigate with Compensating Control |
| Remediation Plan (if not accepting as-is) | *(fill in)* |
| Owner | *(fill in)* |
| Scheduled Completion Date | *(fill in \u2014 must not exceed {due_date} unless a separately approved POA&M milestone applies)* |
| Escalation Trigger | Automatic if {due_date} is missed \u2014 see `execution-plan/templates/ESCALATION-MATRIX.md` |
| Escalation Owner | ISSM |

## 10. Closure and Sign-Off

| Role | Name | Signature | Date | Decision Recorded |
|---|---|---|---|---|
| Preparer | {blank(args.preparer)} | | | |
| ISSM (standing reviewer, all tiers) | | | | |
| **{raci['accountable']}** (Accountable per Section 4) | | | | |

| Field | Value |
|---|---|
| Next Due Date (re-review) | {due_date}, or sooner if the Decision above requires earlier follow-up |
| Lessons Learned / Runbook Update Flag | *(fill in)* |

---
*{_source_citation(finding, id_type)}*
"""
    return record_id, doc


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--id", required=True,
                         help="Finding ID: a STIG Vulnerability ID (e.g. V-253259) or a CVE ID "
                              "(e.g. CVE-2021-44228) -- the type is auto-detected from the format")
    parser.add_argument("--asset", default="", help="Affected asset/hostname identifier")
    parser.add_argument("--system-scope", default="", dest="system_scope", help="System/enclave name")
    parser.add_argument("--detection-method", default="", dest="detection_method")
    parser.add_argument("--detection-date", default="", dest="detection_date", help="YYYY-MM-DD")
    parser.add_argument("--preparer", default="", help="Name and role of the preparer")
    parser.add_argument("--reference-db", default=None, dest="reference_db",
                         help="Override the reference DB path for whichever ID type is detected "
                              "(default: data/stig_reference.json for STIG IDs, "
                              "data/cve_reference.json for CVE IDs)")
    parser.add_argument("--output-dir", default=DEFAULT_OUTPUT_DIR, dest="output_dir")
    args = parser.parse_args()

    id_type = detect_id_type(args.id)
    if id_type is None:
        print(f"'{args.id}' does not match a recognized ID format.")
        print("  STIG Vulnerability ID format: V-NNNNNN (e.g. V-253259)")
        print("  CVE ID format:                CVE-YYYY-NNNN... (e.g. CVE-2021-44228)")
        sys.exit(1)

    db_path = args.reference_db or (DEFAULT_STIG_DB if id_type == "STIG" else DEFAULT_CVE_DB)
    db = load_db(db_path, id_type)

    lookup_id = args.id.strip() if id_type == "STIG" else args.id.strip().upper()
    finding = db.get("findings", {}).get(lookup_id)
    if not finding:
        if id_type == "STIG":
            print(f"'{args.id}' not found in the offline STIG reference database "
                  f"({db.get('finding_count', 0)} findings loaded from "
                  f"{len(db.get('source_files', []))} official STIG file(s)).")
            print("Import the relevant official STIG .zip/xccdf into execution-plan/tools/stig_intake/ "
                  "and re-run stig_reference_builder.py build.")
        else:
            print(f"'{args.id}' not found in the offline CVE reference database "
                  f"({db.get('finding_count', 0)} CVE(s) cached).")
            print(f"Run: python3 cve_reference_builder.py fetch --id {args.id}")
        sys.exit(1)

    record_id, doc = render_variance_record(finding, id_type, args)

    os.makedirs(args.output_dir, exist_ok=True)
    out_path = os.path.join(args.output_dir, f"{record_id}.md")
    with open(out_path, "w", encoding="utf-8") as f:
        f.write(doc)

    cat = finding.get("cat", "UNKNOWN")
    print(f"Generated: {out_path}")
    print(f"  ID type:  {id_type}")
    print(f"  Finding:  {finding.get('title', '')}")
    print(f"  Severity: {cat}")
    print(f"  Accountable role for final decision: {RACI_BY_CAT.get(cat, RACI_BY_CAT['CAT III'])['accountable']}")


if __name__ == "__main__":
    main()
