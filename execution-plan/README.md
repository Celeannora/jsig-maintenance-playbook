# Execution Plan — Master Onboarding Guide

This folder turns the repository's reference material ([`reference/JSIG/`](../reference/JSIG/), [`references/JSIG-source/`](../references/JSIG-source/)) and planning document ([`MAINTENANCE-PLAN.md`](../MAINTENANCE-PLAN.md)) into **actionable, generate-and-use tooling** for running a JSIG-governed SAP program day to day: who is accountable for what, how a finding becomes a documented and signed-off variance record, when something escalates and to whom, and what evidence an auditor should expect to see. Read this file first if you are new to `execution-plan/` — it tells you what each piece is for and which command to run for the task in front of you.

**Everything here is offline, generate-don't-hand-author, and fails closed.** Structured tables (RACI matrix, reference databases) are produced by scripts from source-of-truth files, not typed by hand, so they can be regenerated and never silently drift. The tools never fabricate finding text, never silently downgrade a severity, and exit non-zero rather than produce a record they cannot fully back with real data. See [Design principles](#design-principles) below.

## Folder map

```
execution-plan/
├── README.md                          # This file
├── STATUS-2026-07-17.md               # Point-in-time session snapshot (historical — see note below)
├── ROLE-CROSSWALK.md                  # Operational job titles → the 17 JSIG §1.5 formal roles
├── RACI-MATRIX.md                     # Generated: Responsible/Accountable/Consulted/Informed for all 110
│                                       # Master Calendar tasks, plus a per-role task-count rollup
├── CONTROL-LANGUAGE-CROSSWALK.md      # Generated: every Control ID cited in the Master Calendar (127 distinct
│                                       # IDs across 110 tasks) resolved against real verbatim JSIG family text
├── templates/
│   ├── AUDIT-ARTIFACT-TEMPLATE.md     # Canonical 10-section scaffold every runbook/evidence record follows
│   ├── VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md   # Severity-scoped specialization of the scaffold for
│   │                                   # STIG or CVE/Nessus findings specifically
│   └── ESCALATION-MATRIX.md           # CAT-tiered SLA/escalation routing (CAT I→AO/DAO, CAT II→ISSM,
│                                       # CAT III→ISSO; ISSM stands as reviewer at every tier)
├── tools/
│   ├── README.md                      # Full docs for the tooling below (read before running anything)
│   ├── start_here.py                  # Interactive setup wizard — environment check, optional role
│   │                                   # assignment, guided walkthrough of workflows 1-3 below
│   ├── generate_variance.py           # Finding ID (STIG, CVE, or Nessus Plugin ID) → filled-in Variance/Risk-Acceptance record
│   ├── stig_reference_builder.py      # Builds/updates the offline STIG reference DB from XCCDF/zip imports
│   ├── cve_reference_builder.py       # Builds/updates the offline CVE reference DB from NVD (targeted or full mirror)
│   ├── nessus_reference_builder.py    # Builds/updates the offline Nessus Plugin ID reference DB from Tenable (targeted only)
│   ├── build_raci_matrix.py           # Regenerates RACI-MATRIX.md from MAINTENANCE-PLAN.md + ROLE-CROSSWALK.md
│   ├── build_role_task_index.py       # Regenerates data/role_task_index.json: per-role, deduplicated
│   │                                   # executing/accountable/consulted/informed task lists (the grounding
│   │                                   # source every runbooks/<Role>.md Task Index is built from), each task
│   │                                   # enriched with a control_titles field resolved via control_title_index.json
│   ├── build_control_title_index.py   # Regenerates data/control_title_index.json from the full verbatim JSIG
│   │                                   # family extractions (../references/JSIG-source/chapter-3-*-family.md)
│   ├── build_control_language_crosswalk.py  # Regenerates ../CONTROL-LANGUAGE-CROSSWALK.md
│   ├── build_mrc_cards.py             # Regenerates mrc-cards/master/ (all 110 Maintenance Requirement Cards + INDEX.md, which also indexes ops/ and network-infra/ -- 160 cards total)
│   ├── build_operational_tasking.py   # Regenerates ../OPERATIONAL-TASKING.md + mrc-cards/ops/ (34 tasks + INDEX.md)
│   ├── build_network_infra_tasking.py # Regenerates ../NETWORK-INFRASTRUCTURE-TASKING.md + mrc-cards/network-infra/ (16 tasks + INDEX.md)
│   ├── render_mrc_handbook.py         # Renders the 160 regenerated .md cards into 3 human-readable DOCX/PDF
│   │                                   # handbooks (cover page, clickable TOC, real Word tables, one card per
│   │                                   # page) -- one per family, saved next to each family's cards. Gitignored,
│   │                                   # pure renderer: never hand-edit the output, re-run after any card regen.
│   ├── data/stig_reference.json       # Committed: curated STIG reference DB (built from stig_intake/)
│   ├── data/cve_reference.json        # Committed when built: curated CVE reference DB (built from cve_intake/)
│   ├── data/cve_mirror.json           # Gitignored: optional full NVD mirror, local-only, can be hundreds of MB
│   ├── data/nessus_reference.json     # Committed when built: curated Nessus Plugin ID reference DB
│   ├── data/role_assignments.local.json  # Gitignored: who holds each JSIG role, captured by start_here.py
│   ├── data/role_task_index.json      # Committed: generated per-role task index (see build_role_task_index.py)
│   ├── stig_intake/                   # Drop XCCDF files or STIG zips (including nested Library Compilation
│   │                                   # zips) here before running stig_reference_builder.py
│   ├── cve_intake/                    # Drop a CVE ID list (see cve_list.example.txt) here before running
│   │                                   # cve_reference_builder.py fetch-list
│   └── nessus_intake/                 # Drop a Nessus Plugin ID list (see plugin_list.example.txt) here before
│                                       # running nessus_reference_builder.py fetch-list
├── OPERATIONAL-TASKING.md              # Generated: a SECOND, separate calendar for pure IT-operations/functional-
│                                       # health sysadmin tasking (AD/DC, Exchange, tool-stack health, general
│                                       # Windows Server) that JSIG does not drive — no row cites a Control ID.
├── NETWORK-INFRASTRUCTURE-TASKING.md   # Generated: a THIRD, separate calendar for switch/router/firewall config
│                                       # backup, firmware currency, and HA/failover health — closes the #1 gap
│                                       # identified in GAP-ANALYSIS.md. No row cites a Control ID.
├── GAP-ANALYSIS.md                    # Hand-authored critique of tasking coverage — update by hand, not generated.
├── variance-records/                  # Output directory: generated Variance/Risk-Acceptance records land here,
│                                       # sorted into STIG/, CVE/, and Nessus/ subfolders by finding type
│                                       # (.gitkeep only — this directory's contents are typically program-specific
│                                       #  and should be reviewed before committing any real finding to source control)
├── runbooks/                          # Section 6 actionable task runbooks for all 17 JSIG §1.5 roles (complete —
│                                       # see Completed deliverables below): _EXECUTION-PATTERNS.md,
│                                       # _AUTHORING-BRIEF.md, and one <Role>.md per role
└── mrc-cards/                          # Consolidated umbrella for all three generated MRC card families
    ├── master/                         # Generated: one Maintenance Requirement Card (MRC-<###>.md) per Master
    │                                   # Calendar task (110 total) + INDEX.md — a Navy-PMS-style actionable card
    │                                   # (identification, control text, RACI, tools, numbered procedure,
    │                                   # validation/escalation, sign-off) per task. Names real environment
    │                                   # tools (Windows Server/AD, Trellix/McAfee HBSS, Splunk, Nessus) —
    │                                   # the one place in execution-plan/ that isn't vendor-agnostic, by design.
    ├── ops/                            # Generated: one MRC-OPS-<###>.md per OPERATIONAL-TASKING.md task (34 total)
    │                                   # + INDEX.md, same card shape as mrc-cards/master/ but for non-JSIG operational
    │                                   # tasking (see build_operational_tasking.py).
    └── network-infra/                  # Generated: one MRC-NET-<###>.md per NETWORK-INFRASTRUCTURE-TASKING.md
                                        # task (16 total) + INDEX.md, same card shape, for switch/router/firewall
                                        # health (see build_network_infra_tasking.py).
```

## Quick-start workflows

Run these from the repository root. Each assumes Python 3 with no third-party dependencies beyond the standard library (`stig_reference_builder.py`/`cve_reference_builder.py`/`nessus_reference_builder.py` use only stdlib `urllib`, `zipfile`, `xml`, `json`).

### 0. First time here? Run the setup wizard

```bash
python3 start_here.py
```

An interactive, six-step wizard that checks your environment (Python version, network reachability, what's already cached), optionally records who holds each of the 17 JSIG §1.5 roles (saved to a local, gitignored file — never committed, per this repo's unclassified/general-framework scope), and then walks you through workflows 1–3 below against your own STIG/CVE/Nessus data, finishing with one practice Variance/Risk-Acceptance record so you can see real generated output before touching anything program-specific. It never edits `MAINTENANCE-PLAN.md` and never commits to git — it only runs the same commands documented below, printing each one before running it. Use `python3 start_here.py --check-only` for a fast, read-only status check, or `--skip-roles`/`--skip-stig`/`--skip-cve`/`--skip-nessus`/`--skip-sample` to skip individual steps. Safe to re-run any time. See `execution-plan/tools/README.md`'s [Quickstart wizard](tools/README.md#quickstart-wizard) section for full details.

### 1. Build or refresh the STIG reference database

```bash
# Auto-download the current quarterly DISA Library Compilation, then build:
python3 execution-plan/tools/stig_reference_builder.py fetch-compilation
python3 execution-plan/tools/stig_reference_builder.py build

# Or manually drop one or more XCCDF files, or a DISA quarterly Library
# Compilation zip (public.cyber.mil/stigs/compilations), into
# execution-plan/tools/stig_intake/, then run `build` the same way.
```

### 2. Build or refresh the CVE reference database

```bash
# Targeted (small, curated list — what gets committed to the repo):
python3 execution-plan/tools/cve_reference_builder.py fetch-list --file execution-plan/tools/cve_intake/cve_list.example.txt

# Full local mirror (large, gitignored, local-only cache — optional):
python3 execution-plan/tools/cve_reference_builder.py mirror
python3 execution-plan/tools/cve_reference_builder.py mirror --source community-bulk  # faster, third-party source, NVD stays default
python3 execution-plan/tools/cve_reference_builder.py mirror-update   # repeatable incremental refresh
```

See `execution-plan/tools/README.md` for the `--source community-bulk` provenance caveat and tradeoffs.

### 3. Generate a Variance/Risk-Acceptance record for a finding

`generate_variance.py` auto-detects whether you passed a STIG Vulnerability ID (`V-\d+`), a CVE ID (`CVE-\d{4}-\d{4,}`), or a bare numeric Nessus Plugin ID, and routes to the matching reference database automatically:

```bash
python3 execution-plan/tools/generate_variance.py --id V-253259
python3 execution-plan/tools/generate_variance.py --id CVE-2021-44228
python3 execution-plan/tools/generate_variance.py --id 156327
```

The tool fails closed (non-zero exit, no file written) if the ID format isn't recognized or the ID isn't in the reference database — it will never fabricate finding text to fill the gap. See `execution-plan/tools/README.md` for the full CLI reference, including `--reference-db` to point at a different database file.

### 3a. Regenerate the control-language crosswalk after editing a family extraction file

If `references/JSIG-source/chapter-3-*-family.md` changes (e.g. a correction), re-run in order:

```bash
python3 execution-plan/tools/build_control_title_index.py       # rebuilds data/control_title_index.json
python3 execution-plan/tools/build_control_language_crosswalk.py  # rebuilds CONTROL-LANGUAGE-CROSSWALK.md
python3 execution-plan/tools/build_role_task_index.py            # re-resolves each task's control_titles field
```

### 4. Regenerate the RACI matrix after editing the Master Calendar or the crosswalk

`RACI-MATRIX.md` is generated, not hand-authored. If you edit [`MAINTENANCE-PLAN.md`](../MAINTENANCE-PLAN.md) §4 (the Master Consolidated Calendar) or [`ROLE-CROSSWALK.md`](ROLE-CROSSWALK.md), re-run:

```bash
python3 execution-plan/tools/build_raci_matrix.py
```

This re-parses all 110 tasks and rewrites `RACI-MATRIX.md` in place — Part A (task-level RACI) and Part B (a reverse-index rollup of task counts per JSIG role). Do not hand-edit `RACI-MATRIX.md` directly; edit the script's `ROLE_MAP` / `FAMILY_RACI_DEFAULTS` dictionaries (documented inline) if your organization's Consulted/Informed assignments should differ, then re-run.

### 5. Escalating an overdue or contested finding

[`templates/ESCALATION-MATRIX.md`](templates/ESCALATION-MATRIX.md) defines the CAT-tiered SLA and sign-off routing that both `generate_variance.py`'s output and `RACI-MATRIX.md`'s task-level defaults are built to match: CAT I escalates to AO/DAO, CAT II to ISSM, CAT III to ISSO, with the ISSM standing as a consulted reviewer at every tier. Use it as the reference when a generated variance record's SLA is about to lapse or a sign-off is contested.

### 6. Regenerate the Maintenance Requirement Cards after editing the calendar, RACI, or a runbook's execution pattern

`mrc-cards/master/MRC-<###>.md` (one per Master Calendar task, 110 total) and `mrc-cards/master/INDEX.md` are generated, not hand-authored. `INDEX.md` also links the `mrc-cards/ops/` (34) and `mrc-cards/network-infra/` (16) family tables below the master table, so it serves as one combined 160-card index while each family still keeps its own authoritative `INDEX.md` generated by its own script. If you edit `MAINTENANCE-PLAN.md` §4, `ROLE-CROSSWALK.md`, `data/control_title_index.json`, `OPS_TASKS`/`NET_TASKS` in the other two builder scripts, or a role runbook's Pattern/Custom assignment in its "## 5. Execution Procedures" section, re-run:

```bash
python3 execution-plan/tools/build_mrc_cards.py
```

Each card resolves its Pattern (A–H) or Custom procedure from the matching role runbook where one exists (preferred — reviewed/authored data) and falls back to a keyword heuristic (`PATTERN_KEYWORD_RULES` in the script) only for a task with no runbook entry; the script prints how many of the 110 came from each source so you can see at a glance whether any card needs closer review. Do not hand-edit an individual `MRC-*.md` file — edit the source runbook, calendar, or crosswalk and regenerate.

### 7. Regenerate the Operational Tasking calendar and MRC-OPS cards

`OPERATIONAL-TASKING.md` and `mrc-cards/ops/MRC-OPS-<###>.md` (34 total) + `INDEX.md` are a second, separate, generated deliverable for non-JSIG IT-operations/functional-health sysadmin tasking (Active Directory/domain controllers, Exchange, the security-tool stack's own operational health, general Windows Server) — `MAINTENANCE-PLAN.md` is never touched by this generator. If you edit `OPS_TASKS` in the script (add/remove/re-scope a task), re-run:

```bash
python3 execution-plan/tools/build_operational_tasking.py
```

No row in this calendar cites a JSIG Control ID as its driver — see `OPERATIONAL-TASKING.md`'s "Purpose and scope" section for which tasks operationally support (without being formally required by) a nearby control family. Do not hand-edit `OPERATIONAL-TASKING.md` or an individual `MRC-OPS-*.md` file — edit `OPS_TASKS` and regenerate.

### 8. Regenerate the Network Infrastructure Tasking calendar and MRC-NET cards

`NETWORK-INFRASTRUCTURE-TASKING.md` and `mrc-cards/network-infra/MRC-NET-<###>.md` (16 total) + `INDEX.md` close the #1 gap identified in `GAP-ANALYSIS.md`: switch/router/firewall configuration backup, firmware currency, and HA/failover readiness — a layer neither the JSIG calendar nor the operational calendar covers. If you edit `NET_TASKS` in the script, re-run:

```bash
python3 execution-plan/tools/build_network_infra_tasking.py
```

No row cites a JSIG Control ID. Tool names stay generic/vendor-agnostic since no network device vendor has been established in this repository, unlike `mrc-cards/master/` and `mrc-cards/ops/`. Do not hand-edit `NETWORK-INFRASTRUCTURE-TASKING.md` or an individual `MRC-NET-*.md` file — edit `NET_TASKS` and regenerate.

### 9. Render the MRC cards into human-readable DOCX/PDF handbooks

The 160 `.md` cards across `mrc-cards/{master,ops,network-infra}/` are convenient to link and diff, but not what you hand someone to read cover-to-cover or print. `render_mrc_handbook.py` renders each family into a single bound handbook — cover page, clickable Table of Contents, real bordered/shaded Word tables, one card per page break, Nexus-palette styling — and exports both `.docx` and a companion `.pdf`. Re-run any time after regenerating cards (steps 6–8):

```bash
python3 execution-plan/tools/render_mrc_handbook.py
# then, to also refresh the PDF companions:
soffice --headless --convert-to pdf --outdir execution-plan/mrc-cards/master execution-plan/mrc-cards/master/MRC-HANDBOOK-MASTER.docx
soffice --headless --convert-to pdf --outdir execution-plan/mrc-cards/ops execution-plan/mrc-cards/ops/MRC-HANDBOOK-OPS.docx
soffice --headless --convert-to pdf --outdir execution-plan/mrc-cards/network-infra execution-plan/mrc-cards/network-infra/MRC-HANDBOOK-NETWORK-INFRA.docx
```

Outputs land inside each family's own folder (e.g. `mrc-cards/master/MRC-HANDBOOK-MASTER.docx`/`.pdf`) and are gitignored — regenerable binary artifacts, not source of truth. Do not hand-edit a handbook; edit the source `.md` cards (or their upstream calendar/runbook) and regenerate both the cards and the handbook.

## Design principles

- **Generate, don't hand-author, for anything structured.** `RACI-MATRIX.md`, the STIG/CVE reference databases, and every Variance/Risk-Acceptance record are produced by a script from a documented source of truth, so they stay internally consistent and can be regenerated on demand instead of drifting via manual edits.
- **Fail closed.** Every tool in `tools/` exits non-zero and writes nothing rather than guess at missing data, silently downgrade a severity, or mark an operation complete when it partially failed.
- **Offline-only, vendor-agnostic.** No cloud or SaaS product is referenced by name anywhere in this folder's templates or generated output — every example uses generic terms ("local ticketing/GRC system," "local vulnerability scanner") so the material stays usable on an air-gapped network. **Documented exceptions:** `mrc-cards/master/` and `mrc-cards/ops/`/`OPERATIONAL-TASKING.md` name real tools (Windows Server/Active Directory, Trellix/McAfee HBSS-style endpoint suite, Splunk, Nessus) per an explicit request to ground those specific deliverables in one organization's actual environment — see `build_mrc_cards.py`'s `TOOL_KEYWORD_RULES`/`FAMILY_TOOL_DEFAULTS` and `build_operational_tasking.py`'s `OPS_TASKS` to retarget for a different tool stack.
- **One severity model, reused everywhere.** The CAT I/II/III sign-off chain (`RACI_BY_CAT` in `generate_variance.py`) is the same one documented in `ESCALATION-MATRIX.md` and reflected in `RACI-MATRIX.md`'s task-level Accountable/Consulted/Informed assignments — there is only one escalation model in this repo, not three slightly different ones.

## Completed deliverables

- **`runbooks/`** — Section 6 actionable task runbooks for all 17 JSIG §1.5 roles: Agency/Component Head, Risk Executive Function, CIO, CISO, AO, DAO, CCP, ISO, ISSE, MBO, General Users, ISSM, ISSO, Privileged Users, PSO, Information Owner/Steward, SCA. Each `<Role>.md` follows the 10-section scaffold in `templates/AUDIT-ARTIFACT-TEMPLATE.md` (via the shared Sections 6–10 defined once in `runbooks/_EXECUTION-PATTERNS.md`) and is grounded in `tools/data/role_task_index.json`, never hand-typed against the Master Calendar. `runbooks/_AUTHORING-BRIEF.md` documents the authoring rules (never fabricate a task/control ID, never name a vendor, verify every internal link, keep procedure text proportionate to task volume) that every role file was built and reviewed against. Zero-task governance roles (Agency/Component Head, Risk Executive Function, CIO, CCP, ISO, ISSE, General Users, MBO) still get a full runbook documenting their governance/oversight actions even though they hold no Master Calendar Responsible/Accountable task.
- **`mrc-cards/master/`** — one Maintenance Requirement Card (`MRC-<###>.md`) per Master Calendar task, all 110, plus `INDEX.md`. Each card is a self-contained, sign-off-ready document: identification, real verbatim control text, RACI, primary tool(s) for this environment, a full numbered procedure (Pattern A–H or the task's own Custom steps, resolved from the authoring role's runbook — all 110 resolved from runbook-authored assignments, zero from the keyword-heuristic fallback), the standard Validation/Evidence/Findings/Escalation/Closure fields, and a blank Preparer/Reviewer sign-off block. Generated by `tools/build_mrc_cards.py`.
- **`OPERATIONAL-TASKING.md` + `mrc-cards/ops/`** — a second, separate 34-task calendar (plus one `MRC-OPS-<###>.md` card per task + `INDEX.md`) for non-JSIG IT-operations/functional-health sysadmin tasking: Active Directory/domain-controller health (replication, DCDIAG, DNS, SYSVOL, FSMO, trusts, backups, object cleanup), Exchange health (DAG, mailbox databases, transport queues, certificates, client access), the security-tool stack's own operational health (Trellix/McAfee ePO agent coverage, Splunk forwarder health, Nessus scanner/plugin health), and general Windows Server care-and-feeding (AD CS, scheduled tasks, service-account passwords, hardware/RAID, functional patching, licensing, file/print, DHCP). No row cites a JSIG Control ID; a few tasks operationally support (without being required by) a nearby control family, documented in prose only. Generated by `tools/build_operational_tasking.py`.
- **`NETWORK-INFRASTRUCTURE-TASKING.md` + `mrc-cards/network-infra/`** — a third, separate 16-task calendar (plus one `MRC-NET-<###>.md` card per task + `INDEX.md`) closing the #1 gap identified in `GAP-ANALYSIS.md`: switch/router configuration backup and firmware currency, firewall configuration backup and firmware currency, core switch/router and firewall HA/failover readiness testing, out-of-band management health, AAA (TACACS+/RADIUS) health, SNMP/syslog health, spanning-tree health, SSH host-key/management-certificate currency, network hardware environmental health, and VLAN/trunk configuration consistency. No row cites a JSIG Control ID. Tool names stay generic/vendor-agnostic (no network vendor established in this repo). Generated by `tools/build_network_infra_tasking.py`.
- **`mrc-cards/{master,ops,network-infra}/MRC-HANDBOOK-*.docx`/`.pdf`** — one bound, human-readable handbook per family (cover page, clickable Table of Contents, real Word tables, page-per-card layout) rendered straight from the same 160 `.md` cards above — nothing hand-typed. Gitignored (regenerate on demand). Generated by `tools/render_mrc_handbook.py`.

## Backlog (not yet built)

- Remaining `GAP-ANALYSIS.md` items beyond network infrastructure (now closed): virtualization-host health, database layer beyond Exchange, physical security equipment operational health, power/environmental infrastructure, personnel continuity, documentation-currency as a recurring task, cross-domain-solution/guard-specific tasking, patch-staging-tier health, wireless/RF rogue-AP scanning, hardware support-contract expiration tracking.
- `STATUS-2026-07-17.md` is a point-in-time snapshot written at the end of a specific work session — useful for historical context on what was tested when, but not an onboarding document. Treat this README, not the status file, as the current entry point.

---
*For the underlying reference material this folder operationalizes, start at the [repository root README](../README.md). For the recurring-task cadence itself, see [`MAINTENANCE-PLAN.md`](../MAINTENANCE-PLAN.md).*
