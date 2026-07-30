#!/usr/bin/env python3
"""
generate_variance.py

Generates a filled Variance / Risk-Acceptance Record (per
execution-plan/templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md) for ONE
finding, identified by ANY of three ID formats -- the format is
auto-detected, so the same command works for a STIG compliance-audit
finding or either shape of a Nessus vulnerability-scan finding:
  - STIG Vulnerability ID (e.g. "V-253259"), looked up in the offline
    database built by stig_reference_builder.py.
  - CVE ID (e.g. "CVE-2021-44228"), looked up in the offline database
    built by cve_reference_builder.py -- use this when your scan report
    names a specific CVE.
  - Nessus Plugin ID (e.g. "156327", digits only), looked up in the
    offline database built by nessus_reference_builder.py -- use this
    when your scan report's primary identifier is the numeric Plugin ID
    (common for local-check/informational plugins that cite no CVE at
    all, or when you want the record keyed on the exact ID the scan
    report shows).

This intentionally does NOT parse live Nessus/.SCC/OSCAP scan-result
files. The offline reference database (built by bulk-importing official
DISA XCCDF/.zip documents, fetching official NVD CVE metadata, or
fetching Tenable's public plugin metadata) supplies the official finding
metadata; the human preparer supplies the asset-specific, scan-specific
facts by hand in Sections 2 and 6 of the generated document. This keeps
the tool simple, reliable, and independent of any particular scan tool's
export format -- if you later want to pre-fill Section 6 from an actual
scan export, treat that as a separate, optional enhancement layered on
top of this generator, not a prerequisite for it.

OUTPUT FORMATS
--------------
By default this writes BOTH a Markdown record (the source of truth,
diff-friendly, meant to be committed to the repo) and a standalone,
self-contained HTML record (inline CSS, no external assets -- open
directly in a browser, print to PDF, or email) to the same output
directory, sharing the same record ID as the filename stem. Use
--format to restrict to just one.

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

  # CVE finding -- exact same flags, just a CVE-shaped --id:
  python3 generate_variance.py \\
      --id CVE-2021-44228 \\
      --asset LINUX-APP-017 \\
      --system-scope "Example Enclave A" \\
      --detection-method "Nessus vulnerability scan" \\
      --detection-date 2026-07-17 \\
      --preparer "J. Smith, ISSO"

  # Nessus Plugin ID finding -- same flags again, a bare-digits --id:
  python3 generate_variance.py \\
      --id 156327 \\
      --asset LINUX-APP-017 \\
      --system-scope "Example Enclave A" \\
      --detection-method "Nessus vulnerability scan" \\
      --detection-date 2026-07-17 \\
      --preparer "J. Smith, ISSO"

  # Markdown only, or HTML only:
  python3 generate_variance.py --id V-253259 --format md ...
  python3 generate_variance.py --id V-253259 --format html ...

  # Optional: override which reference DB file is used for whichever ID
  # type is detected (default: data/stig_reference.json for STIG IDs,
  # data/cve_reference.json for CVE IDs, data/nessus_reference.json for
  # Nessus Plugin IDs):
  python3 generate_variance.py --id V-253259 --reference-db /path/to/db.json ...

If --asset/--system-scope/etc. are omitted, the generated document keeps
the corresponding fields blank for the preparer to fill in by hand --
this script never fabricates asset-specific facts.
"""

import argparse
import html as html_lib
import json
import os
import re
import sys
from datetime import datetime, timedelta, timezone

DEFAULT_STIG_DB = os.path.join(os.path.dirname(__file__), "data", "stig_reference.json")
DEFAULT_CVE_DB = os.path.join(os.path.dirname(__file__), "data", "cve_reference.json")
DEFAULT_NESSUS_DB = os.path.join(os.path.dirname(__file__), "data", "nessus_reference.json")
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

# Format markers this tool recognizes. Anything that matches none of
# these is rejected rather than guessed at -- fails closed per this
# project's design principle of never fabricating or assuming
# asset/finding facts. Checked in this order (STIG, then CVE, then
# Nessus) so the bare-digits Nessus pattern -- which would otherwise be
# the most permissive -- never shadows the other two.
STIG_ID_RE = re.compile(r"^V-\d+$", re.IGNORECASE)
CVE_ID_RE = re.compile(r"^CVE-\d{4}-\d{4,}$", re.IGNORECASE)
NESSUS_ID_RE = re.compile(r"^\d+$")

# ---------------------------------------------------------------------------
# Nexus design-system colors (kept in sync with the project's other
# generated deliverables, e.g. execution-plan/../ccr-form templates), used
# only by the HTML renderer. See skills/design-foundations for the palette.
# ---------------------------------------------------------------------------
COLOR_BG = "#F7F6F2"
COLOR_SURFACE = "#FFFFFF"
COLOR_SURFACE_ALT = "#F9F8F5"
COLOR_BORDER = "#D4D1CA"
COLOR_TEXT = "#28251D"
COLOR_TEXT_MUTED = "#7A7974"
COLOR_TEXT_FAINT = "#BAB9B4"
COLOR_PRIMARY = "#01696F"
COLOR_PRIMARY_HOVER = "#0C4E54"
COLOR_WARNING = "#964219"
COLOR_WARNING_FILL = "#FBF1EA"
COLOR_HEADER_FILL = "#F2F1EC"


def detect_id_type(raw_id):
    """Return 'STIG', 'CVE', or 'NESSUS' based on the --id format, or
    None if it matches none of the three recognized patterns."""
    value = raw_id.strip()
    if STIG_ID_RE.match(value):
        return "STIG"
    if CVE_ID_RE.match(value):
        return "CVE"
    if NESSUS_ID_RE.match(value):
        return "NESSUS"
    return None


def load_db(db_path, id_type):
    if not os.path.exists(db_path):
        print(f"No reference database found at {db_path}.")
        if id_type == "STIG":
            print("Run: python3 stig_reference_builder.py build")
        elif id_type == "CVE":
            print("Run: python3 cve_reference_builder.py fetch --id <CVE-ID>")
        else:
            print("Run: python3 nessus_reference_builder.py fetch --id <PLUGIN-ID>")
        sys.exit(1)
    with open(db_path, encoding="utf-8") as f:
        return json.load(f)


def blank(value):
    return value if value else "*(fill in)*"


def md_cell(value, default=""):
    """Sanitize a dynamic (finding- or CLI-sourced) string for safe use
    inside a Markdown table cell. Table cells are delimited by literal
    '|' characters and cannot contain raw newlines -- official STIG/CVE
    description text and free-text CLI args (asset name, preparer, etc.)
    are not guaranteed to avoid either, so without this escaping a
    literal '|' or embedded newline in the source text would silently
    corrupt the rendered table (misaligned or missing columns) in
    whatever Markdown/Word/HTML renderer consumes the .md file
    downstream."""
    if value is None or value == "":
        return default
    s = str(value)
    s = s.replace("\r\n", "\n").replace("\r", "\n")
    s = s.replace("|", "\\|")
    s = s.replace("\n", "<br>")
    return s


def md_blank_cell(value):
    return md_cell(value, default="*(fill in)*")


def esc(value, default=""):
    """HTML-escape a dynamic string for safe interpolation into the
    generated HTML document. Official STIG check/fix text routinely
    contains characters like '<', '>', and '&' (registry paths,
    comparisons, ampersands in product names) that would otherwise be
    interpreted as markup and silently break or truncate the page."""
    if value is None or value == "":
        return default
    return html_lib.escape(str(value), quote=True)


def esc_multiline(value, default="<span class=\"fill-in\">(none)</span>"):
    """HTML-escape then convert newlines to <br> for multi-line official
    text (STIG check/fix text, CVE descriptions) rendered outside a
    <pre> block."""
    if value is None or value == "":
        return default
    return esc(value).replace("\n", "<br>")


def html_blank(value):
    if value:
        return esc(value)
    return "<span class=\"fill-in\">(fill in)</span>"


def build_context(finding, id_type, args):
    """Compute every value that both the Markdown and HTML renderers need
    to agree on (record ID, due date, RACI, etc.) exactly once, so the two
    output formats for the same invocation can never drift apart."""
    if id_type == "STIG":
        id_value = finding["vuln_id"]
    elif id_type == "CVE":
        id_value = finding["cve_id"]
    else:
        id_value = finding["plugin_id"]
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

    if id_type == "STIG":
        generated_note_source = "the offline STIG reference database"
        official_source_desc = finding.get("source_file", "unknown source file")
    elif id_type == "CVE":
        generated_note_source = "the offline CVE reference database"
        official_source_desc = "NVD CVE API 2.0"
    else:
        generated_note_source = "the offline Nessus plugin reference database"
        official_source_desc = "Tenable Nessus Plugin Detail Page"

    return {
        "id_value": id_value,
        "cat": cat,
        "raci": raci,
        "sla_days": sla_days,
        "detection_date_str": detection_date_str,
        "due_date": due_date,
        "record_id": record_id,
        "generated_note_source": generated_note_source,
        "official_source_desc": official_source_desc,
        "generated_at_utc": datetime.now(timezone.utc).strftime("%Y-%m-%d %H:%M UTC"),
    }


# ---------------------------------------------------------------------------
# Markdown rendering
# ---------------------------------------------------------------------------

def _section1_identity_rows_md(finding, id_type, cat):
    """Identifier-specific rows for Section 1 -- the part of the record
    that differs between a STIG finding, a CVE finding, and a Nessus
    Plugin ID finding."""
    if id_type == "STIG":
        cci_refs = ", ".join(finding.get("cci_refs", [])) or "*(none listed in benchmark)*"
        return f"""| STIG Vulnerability ID | {md_cell(finding['vuln_id'])} |
| STIG Rule ID | {md_cell(finding.get('rule_id', ''))} |
| STIG Rule Version (short ID) | {md_cell(finding.get('stig_id', ''))} |
| Benchmark / STIG Title | {md_cell(finding.get('benchmark_title', ''))} |
| Benchmark Release | {md_cell(finding.get('release', ''))} |
| Finding Title | {md_cell(finding.get('title', ''))} |
| Severity / CAT Level | {cat} (raw severity: {md_cell(finding.get('severity', ''))}) |
| CCI Reference(s) | {md_cell(cci_refs)} |"""

    if id_type == "CVE":
        cwe_refs = ", ".join(finding.get("cwe_refs", [])) or "*(none published)*"
        if finding.get("cisa_kev_listed"):
            kev_row = (
                f"\n| CISA KEV Status | **Listed** since {md_cell(finding.get('cisa_kev_date_added', ''))}"
                f" -- official due date {md_cell(finding.get('cisa_kev_due_date', ''))} "
                f"(see Section 8 for required action) |"
            )
        else:
            kev_row = "\n| CISA KEV Status | Not listed |"
        return f"""| CVE ID | {md_cell(finding['cve_id'])} |
| CVSS Version | {md_cell(finding.get('cvss_version'), '*(unscored -- see Severity below)*')} |
| CVSS Vector | {md_cell(finding.get('cvss_vector'), '*(none)*')} |
| CVSS Base Score | {finding.get('cvss_base_score') if finding.get('cvss_base_score') is not None else '*(none)*'} |
| Finding Title | {md_cell(finding.get('title', ''))} |
| Severity / CAT Level | {cat} (raw severity: {md_cell(finding.get('cvss_base_severity', ''))}; basis: {md_cell(finding.get('cat_basis', ''))}) |
| CWE Reference(s) | {md_cell(cwe_refs)} |{kev_row}"""

    # NESSUS
    cve_refs = ", ".join(finding.get("cve_refs", [])) or "*(none cited by this plugin)*"
    if finding.get("cisa_kev_listed"):
        kev_row = (
            f"\n| CISA KEV Status | **Listed**"
            + (f" since {md_cell(finding.get('cisa_kev_date_added', ''))}" if finding.get('cisa_kev_date_added') else "")
            + " -- see Section 8 for guidance |"
        )
    else:
        kev_row = "\n| CISA KEV Status | Not listed |"
    return f"""| Nessus Plugin ID | {md_cell(finding['plugin_id'])} |
| Plugin Family | {md_cell(finding.get('family', ''))} |
| Finding Title | {md_cell(finding.get('title', ''))} |
| Related CVE(s) | {md_cell(cve_refs)} |
| CVSS Version | {md_cell(finding.get('cvss_version'), '*(unscored -- see Severity below)*')} |
| CVSS Vector | {md_cell(finding.get('cvss_vector'), '*(none)*')} |
| CVSS Base Score | {finding.get('cvss_base_score') if finding.get('cvss_base_score') is not None else '*(none)*'} |
| Severity / CAT Level | {cat} (raw severity: {md_cell(finding.get('cvss_base_severity', ''))}; basis: {md_cell(finding.get('cat_basis', ''))}) |
| VPR Score (Tenable) | {finding.get('vpr_score') if finding.get('vpr_score') is not None else '*(none)*'} |{kev_row}"""


def _section8_body_md(finding, id_type):
    """Identifier-specific body for Section 8 -- STIG has official
    check/fix text from the XCCDF Rule; CVE has no equivalent concept, so
    it surfaces the NVD description, references, and (if KEV-listed) the
    verbatim CISA-required action instead."""
    if id_type == "STIG":
        return f"""| Field | Value |
|---|---|
| Official Finding Description | {md_cell(finding.get('description', ''))} |

**Official Check Text:**

{finding.get('check_text', '*(none in benchmark)*')}

**Official Fix Text:**

{finding.get('fix_text', '*(none in benchmark)*')}"""

    if id_type == "CVE":
        references = list(dict.fromkeys(finding.get("references", [])))
        ref_list = "\n".join(f"- {r}" for r in references) or "*(none published)*"
        kev_action = ""
        if finding.get("cisa_kev_listed"):
            kev_action = f"""

**CISA Required Action (KEV-listed, verbatim):**

{finding.get('cisa_kev_required_action', '*(none published)*')}"""
        return f"""| Field | Value |
|---|---|
| Official Finding Description | {md_cell(finding.get('description', ''))} |
| NVD Last Modified | {md_cell(finding.get('last_modified', ''))} |

**Official References (NVD):**

{ref_list}{kev_action}"""

    # NESSUS
    see_also = list(dict.fromkeys(finding.get("see_also", [])))
    see_also_list = "\n".join(f"- {r}" for r in see_also) or "*(none published)*"
    other_refs = finding.get("other_refs", [])
    other_refs_line = (
        ", ".join(f"{r['id_type']} {r['id']}" for r in other_refs) if other_refs else "*(none)*"
    )
    kev_note = ""
    if finding.get("cisa_kev_listed"):
        kev_note = (
            "\n\n**CISA Known Exploited Vulnerabilities (KEV):** This plugin is associated with a "
            "KEV-listed vulnerability. Tenable's plugin page does not republish CISA's verbatim "
            "required-action text -- consult the CVE-keyed record for the affected CVE (via "
            "`cve_reference_builder.py`) or the official "
            "[CISA KEV catalog](https://www.cisa.gov/known-exploited-vulnerabilities-catalog) directly "
            "for the exact required action and due date."
        )
    return f"""| Field | Value |
|---|---|
| Synopsis | {md_cell(finding.get('synopsis', ''))} |
| Official Finding Description | {md_cell(finding.get('description', ''))} |
| Other Reference ID(s) | {md_cell(other_refs_line)} |

**Official Solution / Fix Text:**

{finding.get('solution', '*(none published)*')}

**See Also (Tenable):**

{see_also_list}{kev_note}"""


def _source_citation_md(finding, id_type):
    if id_type == "STIG":
        return (f"Official content sourced from: {finding.get('source_file', 'unknown')} "
                f"(imported from https://public.cyber.mil/stigs/downloads/ "
                f"or the quarterly SRG-STIG Library Compilation into the offline reference database).")
    if id_type == "CVE":
        return (f"Official content sourced from: NVD CVE API 2.0 "
                f"(https://services.nvd.nist.gov/rest/json/cves/2.0), fetched {finding.get('fetched_at', 'unknown')} "
                f"into the offline reference database.")
    return (f"Official content sourced from: Tenable Nessus Plugin Detail Page "
            f"({finding.get('source_url', 'https://www.tenable.com/plugins/nessus/')}), "
            f"fetched {finding.get('fetched_at', 'unknown')} into the offline reference database.")


def render_variance_record_markdown(finding, id_type, args, ctx):
    cat = ctx["cat"]
    raci = ctx["raci"]
    sla_days = ctx["sla_days"]
    due_date = ctx["due_date"]
    record_id = ctx["record_id"]
    detection_date_str = ctx["detection_date_str"]

    doc = f"""# Variance / Risk-Acceptance Record \u2014 {record_id}

> Generated by `execution-plan/tools/generate_variance.py` from {ctx['generated_note_source']} on {ctx['generated_at_utc']}. Official finding text (Sections 1 and 8) is sourced verbatim from {ctx['official_source_desc']} \u2014 do not hand-edit those fields; refresh the reference database instead. Sections 2, 3, 6, 7, 9, and 10 require human input and are intentionally left as fill-in prompts below.
>
> Identifier type: **{id_type}**. Structure per `execution-plan/templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md`.

## 1. Identity

| Field | Value |
|---|---|
| Variance Record ID | {record_id} |
{_section1_identity_rows_md(finding, id_type, cat)}
| System / Enclave Scope | {md_blank_cell(args.system_scope)} |
| Document Version | v1.0 |
| Last Reviewed | {md_blank_cell(args.detection_date)} |

## 2. Trigger and Cadence

| Field | Value |
|---|---|
| Trigger Condition | Configuration/vulnerability review identified this finding as **Open** *(preparer: confirm or correct)* |
| Detection Date | {detection_date_str} |
| Detection Method | {md_blank_cell(args.detection_method)} |
| Reporting Period | *(fill in)* |
| Re-Review / Decision Due Date | **{due_date}** ({sla_days}-day SLA for {cat}, per `execution-plan/templates/ESCALATION-MATRIX.md`) |
| Repository Location | `execution-plan/variance-records/{record_id}.md` |

## 3. Preconditions

| Field | Value |
|---|---|
| Required Access | Read access to the affected asset's configuration baseline; read access to the offline reference database |
| Required Tools | Offline {"STIG" if id_type == "STIG" else ("CVE" if id_type == "CVE" else "Nessus plugin")} reference database; local ticketing/GRC system record for cross-linking |
| Preparer | {md_blank_cell(args.preparer)} |
| Input Artifacts | Official {"DISA STIG check/fix text" if id_type == "STIG" else ("NVD CVE metadata" if id_type == "CVE" else "Tenable Nessus plugin metadata")} below; prior variance record for this finding/asset pair, if this is a renewal |

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

1. Confirm the {"Vulnerability" if id_type == "STIG" else ("CVE" if id_type == "CVE" else "Nessus Plugin")} ID and affected asset(s) above are correct.
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

{_section8_body_md(finding, id_type)}

| Field | Value |
|---|---|
| Affected Asset(s) | {md_blank_cell(args.asset)} |
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
| Preparer | {md_blank_cell(args.preparer)} | | | |
| ISSM (standing reviewer, all tiers) | | | | |
| **{raci['accountable']}** (Accountable per Section 4) | | | | |

| Field | Value |
|---|---|
| Next Due Date (re-review) | {due_date}, or sooner if the Decision above requires earlier follow-up |
| Lessons Learned / Runbook Update Flag | *(fill in)* |

---
*{_source_citation_md(finding, id_type)}*
"""
    return doc


# ---------------------------------------------------------------------------
# HTML rendering
# ---------------------------------------------------------------------------

HTML_STYLE = f"""
    :root {{
      color-scheme: light;
    }}
    * {{ box-sizing: border-box; }}
    body {{
      font-family: Calibri, "Segoe UI", Arial, sans-serif;
      background: {COLOR_BG};
      color: {COLOR_TEXT};
      margin: 0;
      padding: 32px 16px;
      line-height: 1.5;
    }}
    .doc {{
      max-width: 900px;
      margin: 0 auto;
      background: {COLOR_SURFACE};
      border: 1px solid {COLOR_BORDER};
      padding: 40px 48px 32px;
    }}
    h1 {{
      font-size: 26px;
      color: {COLOR_PRIMARY};
      border-bottom: 2px solid {COLOR_PRIMARY};
      padding-bottom: 10px;
      margin: 0 0 20px;
    }}
    h2 {{
      font-size: 19px;
      color: {COLOR_PRIMARY};
      margin: 32px 0 10px;
      border-bottom: 1px solid {COLOR_BORDER};
      padding-bottom: 6px;
    }}
    h3 {{
      font-size: 15px;
      color: {COLOR_TEXT};
      margin: 16px 0 6px;
    }}
    .meta-note {{
      background: {COLOR_SURFACE_ALT};
      border-left: 4px solid {COLOR_PRIMARY};
      padding: 12px 16px;
      font-size: 13px;
      color: {COLOR_TEXT_MUTED};
      margin-bottom: 8px;
    }}
    .meta-note strong {{ color: {COLOR_TEXT}; }}
    .id-badge {{
      display: inline-block;
      font-size: 12px;
      font-weight: 700;
      letter-spacing: 0.03em;
      color: {COLOR_PRIMARY};
      background: {COLOR_SURFACE_ALT};
      border: 1px solid {COLOR_PRIMARY};
      border-radius: 3px;
      padding: 2px 8px;
      margin-bottom: 10px;
    }}
    table {{
      width: 100%;
      border-collapse: collapse;
      margin: 4px 0 22px;
      font-size: 13.5px;
    }}
    th, td {{
      text-align: left;
      padding: 8px 12px;
      border: 1px solid {COLOR_BORDER};
      vertical-align: top;
    }}
    th {{
      background: {COLOR_HEADER_FILL};
      font-weight: 600;
      width: 30%;
      white-space: nowrap;
    }}
    td.accountable {{ font-weight: 700; color: {COLOR_PRIMARY}; }}
    .fill-in {{ color: {COLOR_TEXT_FAINT}; font-style: italic; }}
    pre.official-text {{
      background: {COLOR_SURFACE_ALT};
      border: 1px solid {COLOR_BORDER};
      padding: 12px 14px;
      white-space: pre-wrap;
      word-wrap: break-word;
      font-family: Consolas, "Courier New", monospace;
      font-size: 12.5px;
      color: {COLOR_TEXT};
      margin: 6px 0 16px;
    }}
    .kev-alert {{
      background: {COLOR_WARNING_FILL};
      border: 2px solid {COLOR_WARNING};
      padding: 12px 16px;
      margin: 10px 0 18px;
      font-size: 13.5px;
    }}
    .kev-alert h3 {{ color: {COLOR_WARNING}; margin: 0 0 6px; font-size: 14px; }}
    .checklist span {{
      display: inline-block;
      margin: 0 22px 6px 0;
      white-space: nowrap;
    }}
    ol.steps {{ padding-left: 22px; font-size: 13.5px; }}
    ol.steps li {{ margin-bottom: 6px; }}
    a {{ color: {COLOR_PRIMARY}; }}
    footer {{
      margin-top: 36px;
      font-size: 11.5px;
      color: {COLOR_TEXT_MUTED};
      border-top: 1px solid {COLOR_BORDER};
      padding-top: 12px;
      font-style: italic;
    }}
    .ref-list {{ font-size: 13px; margin: 6px 0 16px; padding-left: 20px; }}
    .ref-list li {{ margin-bottom: 3px; word-break: break-all; }}
"""


def _section1_identity_rows_html(finding, id_type, cat):
    if id_type == "STIG":
        cci_refs = ", ".join(finding.get("cci_refs", [])) or "<em>(none listed in benchmark)</em>"
        return f"""<tr><th>STIG Vulnerability ID</th><td>{esc(finding['vuln_id'])}</td></tr>
<tr><th>STIG Rule ID</th><td>{esc(finding.get('rule_id', ''))}</td></tr>
<tr><th>STIG Rule Version (short ID)</th><td>{esc(finding.get('stig_id', ''))}</td></tr>
<tr><th>Benchmark / STIG Title</th><td>{esc(finding.get('benchmark_title', ''))}</td></tr>
<tr><th>Benchmark Release</th><td>{esc(finding.get('release', ''))}</td></tr>
<tr><th>Finding Title</th><td>{esc(finding.get('title', ''))}</td></tr>
<tr><th>Severity / CAT Level</th><td><strong>{esc(cat)}</strong> (raw severity: {esc(finding.get('severity', ''))})</td></tr>
<tr><th>CCI Reference(s)</th><td>{cci_refs if cci_refs.startswith('<em>') else esc(cci_refs)}</td></tr>"""

    if id_type == "CVE":
        cwe_refs = ", ".join(finding.get("cwe_refs", [])) or "<em>(none published)</em>"
        if finding.get("cisa_kev_listed"):
            kev_row = (
                f'<tr><th>CISA KEV Status</th><td><strong style="color:{COLOR_WARNING};">Listed</strong> '
                f"since {esc(finding.get('cisa_kev_date_added', ''))} "
                f"&mdash; official due date {esc(finding.get('cisa_kev_due_date', ''))} "
                f"(see Section 8 for required action)</td></tr>"
            )
        else:
            kev_row = "<tr><th>CISA KEV Status</th><td>Not listed</td></tr>"
        cvss_score = finding.get('cvss_base_score')
        cvss_score_display = esc(cvss_score) if cvss_score is not None else "<em>(none)</em>"
        return f"""<tr><th>CVE ID</th><td>{esc(finding['cve_id'])}</td></tr>
<tr><th>CVSS Version</th><td>{esc(finding.get('cvss_version')) or '<em>(unscored &mdash; see Severity below)</em>'}</td></tr>
<tr><th>CVSS Vector</th><td>{esc(finding.get('cvss_vector')) or '<em>(none)</em>'}</td></tr>
<tr><th>CVSS Base Score</th><td>{cvss_score_display}</td></tr>
<tr><th>Finding Title</th><td>{esc(finding.get('title', ''))}</td></tr>
<tr><th>Severity / CAT Level</th><td><strong>{esc(cat)}</strong> (raw severity: {esc(finding.get('cvss_base_severity', ''))}; basis: {esc(finding.get('cat_basis', ''))})</td></tr>
<tr><th>CWE Reference(s)</th><td>{cwe_refs if cwe_refs.startswith('<em>') else esc(cwe_refs)}</td></tr>
{kev_row}"""

    # NESSUS
    cve_refs = ", ".join(finding.get("cve_refs", [])) or "<em>(none cited by this plugin)</em>"
    if finding.get("cisa_kev_listed"):
        kev_row = (
            f'<tr><th>CISA KEV Status</th><td><strong style="color:{COLOR_WARNING};">Listed</strong>'
            + (f" since {esc(finding.get('cisa_kev_date_added', ''))}" if finding.get('cisa_kev_date_added') else "")
            + " &mdash; see Section 8 for guidance</td></tr>"
        )
    else:
        kev_row = "<tr><th>CISA KEV Status</th><td>Not listed</td></tr>"
    cvss_score = finding.get('cvss_base_score')
    cvss_score_display = esc(cvss_score) if cvss_score is not None else "<em>(none)</em>"
    vpr_score = finding.get('vpr_score')
    vpr_score_display = esc(vpr_score) if vpr_score is not None else "<em>(none)</em>"
    return f"""<tr><th>Nessus Plugin ID</th><td>{esc(finding['plugin_id'])}</td></tr>
<tr><th>Plugin Family</th><td>{esc(finding.get('family', ''))}</td></tr>
<tr><th>Finding Title</th><td>{esc(finding.get('title', ''))}</td></tr>
<tr><th>Related CVE(s)</th><td>{cve_refs if cve_refs.startswith('<em>') else esc(cve_refs)}</td></tr>
<tr><th>CVSS Version</th><td>{esc(finding.get('cvss_version')) or '<em>(unscored &mdash; see Severity below)</em>'}</td></tr>
<tr><th>CVSS Vector</th><td>{esc(finding.get('cvss_vector')) or '<em>(none)</em>'}</td></tr>
<tr><th>CVSS Base Score</th><td>{cvss_score_display}</td></tr>
<tr><th>Severity / CAT Level</th><td><strong>{esc(cat)}</strong> (raw severity: {esc(finding.get('cvss_base_severity', ''))}; basis: {esc(finding.get('cat_basis', ''))})</td></tr>
<tr><th>VPR Score (Tenable)</th><td>{vpr_score_display}</td></tr>
{kev_row}"""


def _section8_body_html(finding, id_type):
    if id_type == "STIG":
        return f"""<table>
<tr><th>Official Finding Description</th><td>{esc_multiline(finding.get('description', ''), '<em>(none)</em>')}</td></tr>
</table>
<h3>Official Check Text</h3>
<pre class="official-text">{esc(finding.get('check_text', '(none in benchmark)'))}</pre>
<h3>Official Fix Text</h3>
<pre class="official-text">{esc(finding.get('fix_text', '(none in benchmark)'))}</pre>"""

    if id_type == "CVE":
        references = list(dict.fromkeys(finding.get("references", [])))
        if references:
            ref_list_html = "<ul class=\"ref-list\">" + "".join(
                f'<li><a href="{esc(r)}">{esc(r)}</a></li>' for r in references
            ) + "</ul>"
        else:
            ref_list_html = "<p><em>(none published)</em></p>"

        kev_block = ""
        if finding.get("cisa_kev_listed"):
            kev_block = f"""<div class="kev-alert">
<h3>CISA Known Exploited Vulnerabilities (KEV) &mdash; Required Action (verbatim)</h3>
{esc_multiline(finding.get('cisa_kev_required_action', ''), '<em>(none published)</em>')}
</div>"""

        return f"""<table>
<tr><th>Official Finding Description</th><td>{esc_multiline(finding.get('description', ''), '<em>(none)</em>')}</td></tr>
<tr><th>NVD Last Modified</th><td>{esc(finding.get('last_modified', ''))}</td></tr>
</table>
<h3>Official References (NVD)</h3>
{ref_list_html}
{kev_block}"""

    # NESSUS
    see_also = list(dict.fromkeys(finding.get("see_also", [])))
    if see_also:
        see_also_html = "<ul class=\"ref-list\">" + "".join(
            f'<li><a href="{esc(r)}">{esc(r)}</a></li>' for r in see_also
        ) + "</ul>"
    else:
        see_also_html = "<p><em>(none published)</em></p>"

    other_refs = finding.get("other_refs", [])
    other_refs_line = (
        ", ".join(f"{esc(r['id_type'])} {esc(r['id'])}" for r in other_refs) if other_refs else "<em>(none)</em>"
    )

    kev_block = ""
    if finding.get("cisa_kev_listed"):
        kev_block = f"""<div class="kev-alert">
<h3>CISA Known Exploited Vulnerabilities (KEV)</h3>
<p>This plugin is associated with a KEV-listed vulnerability. Tenable's plugin page does not
republish CISA's verbatim required-action text &mdash; consult the CVE-keyed record for the
affected CVE (via <code>cve_reference_builder.py</code>) or the official
<a href="https://www.cisa.gov/known-exploited-vulnerabilities-catalog">CISA KEV catalog</a>
directly for the exact required action and due date.</p>
</div>"""

    return f"""<table>
<tr><th>Synopsis</th><td>{esc_multiline(finding.get('synopsis', ''), '<em>(none)</em>')}</td></tr>
<tr><th>Official Finding Description</th><td>{esc_multiline(finding.get('description', ''), '<em>(none)</em>')}</td></tr>
<tr><th>Other Reference ID(s)</th><td>{other_refs_line}</td></tr>
</table>
<h3>Official Solution / Fix Text</h3>
<pre class="official-text">{esc(finding.get('solution', '(none published)'))}</pre>
<h3>See Also (Tenable)</h3>
{see_also_html}
{kev_block}"""


def _source_citation_html(finding, id_type):
    if id_type == "STIG":
        return (f"Official content sourced from: {esc(finding.get('source_file', 'unknown'))} "
                f'(imported from <a href="https://public.cyber.mil/stigs/downloads/">'
                f"https://public.cyber.mil/stigs/downloads/</a> "
                f"or the quarterly SRG-STIG Library Compilation into the offline reference database).")
    if id_type == "CVE":
        return (f'Official content sourced from: NVD CVE API 2.0 '
                f'(<a href="https://services.nvd.nist.gov/rest/json/cves/2.0">'
                f"https://services.nvd.nist.gov/rest/json/cves/2.0</a>), "
                f"fetched {esc(finding.get('fetched_at', 'unknown'))} into the offline reference database.")
    source_url = finding.get('source_url', 'https://www.tenable.com/plugins/nessus/')
    return (f'Official content sourced from: Tenable Nessus Plugin Detail Page '
            f'(<a href="{esc(source_url)}">{esc(source_url)}</a>), '
            f"fetched {esc(finding.get('fetched_at', 'unknown'))} into the offline reference database.")


def render_variance_record_html(finding, id_type, args, ctx):
    cat = ctx["cat"]
    raci = ctx["raci"]
    sla_days = ctx["sla_days"]
    due_date = ctx["due_date"]
    record_id = ctx["record_id"]
    detection_date_str = ctx["detection_date_str"]

    doc = f"""<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Variance / Risk-Acceptance Record \u2014 {esc(record_id)}</title>
<style>
{HTML_STYLE}
</style>
</head>
<body>
<div class="doc">

<div class="id-badge">{esc(id_type)} FINDING</div>
<h1>Variance / Risk-Acceptance Record &mdash; {esc(record_id)}</h1>

<div class="meta-note">
Generated by <code>execution-plan/tools/generate_variance.py</code> from {esc(ctx['generated_note_source'])} on {esc(ctx['generated_at_utc'])}. Official finding text (Sections 1 and 8) is sourced verbatim from {esc(ctx['official_source_desc'])} &mdash; <strong>do not hand-edit those fields</strong>; refresh the reference database instead. Sections 2, 3, 6, 7, 9, and 10 require human input and are intentionally left as fill-in prompts below.<br><br>
Structure per <code>execution-plan/templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md</code>.
</div>

<h2>1. Identity</h2>
<table>
<tr><th>Variance Record ID</th><td>{esc(record_id)}</td></tr>
{_section1_identity_rows_html(finding, id_type, cat)}
<tr><th>System / Enclave Scope</th><td>{html_blank(args.system_scope)}</td></tr>
<tr><th>Document Version</th><td>v1.0</td></tr>
<tr><th>Last Reviewed</th><td>{html_blank(args.detection_date)}</td></tr>
</table>

<h2>2. Trigger and Cadence</h2>
<table>
<tr><th>Trigger Condition</th><td>Configuration/vulnerability review identified this finding as <strong>Open</strong> <em>(preparer: confirm or correct)</em></td></tr>
<tr><th>Detection Date</th><td>{esc(detection_date_str)}</td></tr>
<tr><th>Detection Method</th><td>{html_blank(args.detection_method)}</td></tr>
<tr><th>Reporting Period</th><td><span class="fill-in">(fill in)</span></td></tr>
<tr><th>Re-Review / Decision Due Date</th><td><strong>{esc(due_date)}</strong> ({sla_days}-day SLA for {esc(cat)}, per <code>execution-plan/templates/ESCALATION-MATRIX.md</code>)</td></tr>
<tr><th>Repository Location</th><td><code>execution-plan/variance-records/{esc(record_id)}.md</code></td></tr>
</table>

<h2>3. Preconditions</h2>
<table>
<tr><th>Required Access</th><td>Read access to the affected asset's configuration baseline; read access to the offline reference database</td></tr>
<tr><th>Required Tools</th><td>Offline {"STIG" if id_type == "STIG" else ("CVE" if id_type == "CVE" else "Nessus plugin")} reference database; local ticketing/GRC system record for cross-linking</td></tr>
<tr><th>Preparer</th><td>{html_blank(args.preparer)}</td></tr>
<tr><th>Input Artifacts</th><td>Official {"DISA STIG check/fix text" if id_type == "STIG" else ("NVD CVE metadata" if id_type == "CVE" else "Tenable Nessus plugin metadata")} below; prior variance record for this finding/asset pair, if this is a renewal</td></tr>
</table>

<h2>4. RACI (Severity-Tiered &mdash; {esc(cat)})</h2>
<table>
<tr><th>Responsible (prepares record)</th><td>{esc(raci['responsible'])}</td></tr>
<tr><th>Accountable (final accept/reject authority)</th><td class="accountable">{esc(raci['accountable'])}</td></tr>
<tr><th>Consulted</th><td>{esc(raci['consulted'])}</td></tr>
<tr><th>Informed</th><td>{esc(raci['informed'])}</td></tr>
<tr><th>Evidence Owner</th><td>ISSO</td></tr>
<tr><th>Escalation Owner</th><td>ISSM</td></tr>
</table>

<h2>5. Execution Steps (Preparation)</h2>
<ol class="steps">
<li>Confirm the {"Vulnerability" if id_type == "STIG" else ("CVE" if id_type == "CVE" else "Nessus Plugin")} ID and affected asset(s) above are correct.</li>
<li>Fill in Section 2's Detection Method and Reporting Period.</li>
<li>Complete Section 6 (Validation) with the actual observed state of the asset &mdash; first-person, factual, not a restatement of the official text below.</li>
<li>Route the draft to the Consulted role(s) in Section 4 for comments before requesting sign-off.</li>
<li>Route to the Accountable role in Section 4 for the risk decision. Do not proceed to Closure (Section 10) until that signature is captured.</li>
</ol>

<h2>6. Validation</h2>
<table>
<tr><th>Assessment Method</th><td><em>(Examine / Interview / Test &mdash; state which was used)</em></td></tr>
<tr><th>Expected Result (per official reference text)</th><td>See official reference text in Section 8</td></tr>
<tr><th>Actual Result Observed</th><td><span class="fill-in">(fill in &mdash; what was actually found on the asset)</span></td></tr>
<tr><th>Pass / Fail</th><td><em>(Pass = Not a Finding; Fail = Open)</em></td></tr>
<tr><th>Reviewed By</th><td><span class="fill-in">(fill in)</span></td></tr>
<tr><th>Review Date</th><td><span class="fill-in">(fill in)</span></td></tr>
</table>

<h2>7. Evidence Package</h2>
<table>
<tr><th>Artifact List</th><td><span class="fill-in">(fill in)</span></td></tr>
<tr><th>Repository Path</th><td><code>execution-plan/variance-records/evidence/{esc(record_id)}/</code></td></tr>
<tr><th>Retention Period</th><td>Per local records-retention policy (minimum: current + 1 prior accreditation cycle)</td></tr>
<tr><th>Chain-of-Custody Note</th><td><span class="fill-in">(fill in)</span></td></tr>
</table>

<h2>8. Findings and Exceptions (Official Reference &mdash; Auto-Populated)</h2>
{_section8_body_html(finding, id_type)}
<table>
<tr><th>Affected Asset(s)</th><td>{html_blank(args.asset)}</td></tr>
<tr><th>Exception Type</th><td class="checklist"><span>&#9744; Risk Acceptance</span><span>&#9744; Compensating Control</span><span>&#9744; False Positive Correction</span><span>&#9744; Remediation In Progress</span></td></tr>
<tr><th>Rationale</th><td><span class="fill-in">(fill in)</span></td></tr>
<tr><th>Compensating Controls</th><td><span class="fill-in">(fill in, if any)</span></td></tr>
<tr><th>POA&amp;M ID</th><td><span class="fill-in">(fill in, if applicable)</span></td></tr>
</table>

<h2>9. Remediation and Escalation</h2>
<table>
<tr><th>Decision</th><td class="checklist"><span>&#9744; Accept Risk</span><span>&#9744; Reject &mdash; Remediate</span><span>&#9744; Mitigate with Compensating Control</span></td></tr>
<tr><th>Remediation Plan (if not accepting as-is)</th><td><span class="fill-in">(fill in)</span></td></tr>
<tr><th>Owner</th><td><span class="fill-in">(fill in)</span></td></tr>
<tr><th>Scheduled Completion Date</th><td><span class="fill-in">(fill in &mdash; must not exceed {esc(due_date)} unless a separately approved POA&amp;M milestone applies)</span></td></tr>
<tr><th>Escalation Trigger</th><td>Automatic if {esc(due_date)} is missed &mdash; see <code>execution-plan/templates/ESCALATION-MATRIX.md</code></td></tr>
<tr><th>Escalation Owner</th><td>ISSM</td></tr>
</table>

<h2>10. Closure and Sign-Off</h2>
<table>
<tr><th>Role</th><th>Name</th><th>Signature</th><th>Date</th><th>Decision Recorded</th></tr>
<tr><td>Preparer</td><td>{html_blank(args.preparer)}</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr><td>ISSM (standing reviewer, all tiers)</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr><td class="accountable">{esc(raci['accountable'])} (Accountable per Section 4)</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
</table>
<table>
<tr><th>Next Due Date (re-review)</th><td>{esc(due_date)}, or sooner if the Decision above requires earlier follow-up</td></tr>
<tr><th>Lessons Learned / Runbook Update Flag</th><td><span class="fill-in">(fill in)</span></td></tr>
</table>

<footer>{_source_citation_html(finding, id_type)}</footer>

</div>
</body>
</html>
"""
    return doc


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--id", required=True,
                         help="Finding ID: a STIG Vulnerability ID (e.g. V-253259), a CVE ID "
                              "(e.g. CVE-2021-44228), or a Nessus Plugin ID (e.g. 156327) -- "
                              "the type is auto-detected from the format")
    parser.add_argument("--asset", default="", help="Affected asset/hostname identifier")
    parser.add_argument("--system-scope", default="", dest="system_scope", help="System/enclave name")
    parser.add_argument("--detection-method", default="", dest="detection_method")
    parser.add_argument("--detection-date", default="", dest="detection_date", help="YYYY-MM-DD")
    parser.add_argument("--preparer", default="", help="Name and role of the preparer")
    parser.add_argument("--reference-db", default=None, dest="reference_db",
                         help="Override the reference DB path for whichever ID type is detected "
                              "(default: data/stig_reference.json for STIG IDs, "
                              "data/cve_reference.json for CVE IDs, "
                              "data/nessus_reference.json for Nessus Plugin IDs)")
    parser.add_argument("--output-dir", default=DEFAULT_OUTPUT_DIR, dest="output_dir")
    parser.add_argument("--format", default="both", dest="format", choices=["md", "html", "both"],
                         help="Output format(s) to write (default: both)")
    args = parser.parse_args()

    id_type = detect_id_type(args.id)
    if id_type is None:
        print(f"'{args.id}' does not match a recognized ID format.")
        print("  STIG Vulnerability ID format: V-NNNNNN (e.g. V-253259)")
        print("  CVE ID format:                CVE-YYYY-NNNN... (e.g. CVE-2021-44228)")
        print("  Nessus Plugin ID format:      digits only (e.g. 156327)")
        sys.exit(1)

    if id_type == "STIG":
        default_db = DEFAULT_STIG_DB
    elif id_type == "CVE":
        default_db = DEFAULT_CVE_DB
    else:
        default_db = DEFAULT_NESSUS_DB
    db_path = args.reference_db or default_db
    db = load_db(db_path, id_type)

    lookup_id = args.id.strip() if id_type in ("STIG", "NESSUS") else args.id.strip().upper()
    finding = db.get("findings", {}).get(lookup_id)
    if not finding:
        if id_type == "STIG":
            print(f"'{args.id}' not found in the offline STIG reference database "
                  f"({db.get('finding_count', 0)} findings loaded from "
                  f"{len(db.get('source_files', []))} official STIG file(s)).")
            print("Import the relevant official STIG .zip/xccdf into execution-plan/tools/stig_intake/ "
                  "and re-run stig_reference_builder.py build.")
        elif id_type == "CVE":
            print(f"'{args.id}' not found in the offline CVE reference database "
                  f"({db.get('finding_count', 0)} CVE(s) cached).")
            print(f"Run: python3 cve_reference_builder.py fetch --id {args.id}")
        else:
            print(f"'{args.id}' not found in the offline Nessus plugin reference database "
                  f"({db.get('finding_count', 0)} plugin(s) cached).")
            print(f"Run: python3 nessus_reference_builder.py fetch --id {args.id}")
        sys.exit(1)

    ctx = build_context(finding, id_type, args)
    record_id = ctx["record_id"]
    cat = ctx["cat"]

    os.makedirs(args.output_dir, exist_ok=True)

    written = []
    if args.format in ("md", "both"):
        md_doc = render_variance_record_markdown(finding, id_type, args, ctx)
        md_path = os.path.join(args.output_dir, f"{record_id}.md")
        with open(md_path, "w", encoding="utf-8") as f:
            f.write(md_doc)
        written.append(md_path)

    if args.format in ("html", "both"):
        html_doc = render_variance_record_html(finding, id_type, args, ctx)
        html_path = os.path.join(args.output_dir, f"{record_id}.html")
        with open(html_path, "w", encoding="utf-8") as f:
            f.write(html_doc)
        written.append(html_path)

    print("Generated:")
    for path in written:
        print(f"  {path}")
    print(f"  ID type:  {id_type}")
    print(f"  Finding:  {finding.get('title', '')}")
    print(f"  Severity: {cat}")
    print(f"  Accountable role for final decision: {RACI_BY_CAT.get(cat, RACI_BY_CAT['CAT III'])['accountable']}")


if __name__ == "__main__":
    main()
