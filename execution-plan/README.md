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
├── templates/
│   ├── AUDIT-ARTIFACT-TEMPLATE.md     # Canonical 10-section scaffold every runbook/evidence record follows
│   ├── VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md   # Severity-scoped specialization of the scaffold for
│   │                                   # STIG or CVE/Nessus findings specifically
│   └── ESCALATION-MATRIX.md           # CAT-tiered SLA/escalation routing (CAT I→AO/DAO, CAT II→ISSM,
│                                       # CAT III→ISSO; ISSM stands as reviewer at every tier)
├── tools/
│   ├── README.md                      # Full docs for the tooling below (read before running anything)
│   ├── generate_variance.py           # Finding ID (STIG or CVE) → filled-in Variance/Risk-Acceptance record
│   ├── stig_reference_builder.py      # Builds/updates the offline STIG reference DB from XCCDF/zip imports
│   ├── cve_reference_builder.py       # Builds/updates the offline CVE reference DB from NVD (targeted or full mirror)
│   ├── build_raci_matrix.py           # Regenerates RACI-MATRIX.md from MAINTENANCE-PLAN.md + ROLE-CROSSWALK.md
│   ├── data/stig_reference.json       # Committed: curated STIG reference DB (built from stig_intake/)
│   ├── data/cve_reference.json        # Committed when built: curated CVE reference DB (built from cve_intake/)
│   ├── data/cve_mirror.json           # Gitignored: optional full NVD mirror, local-only, can be hundreds of MB
│   ├── stig_intake/                   # Drop XCCDF files or STIG zips (including nested Library Compilation
│   │                                   # zips) here before running stig_reference_builder.py
│   └── cve_intake/                    # Drop a CVE ID list (see cve_list.example.txt) here before running
│                                       # cve_reference_builder.py fetch-list
├── variance-records/                  # Output directory: generated Variance/Risk-Acceptance records land here
│                                       # (.gitkeep only — this directory's contents are typically program-specific
│                                       #  and should be reviewed before committing any real finding to source control)
└── runbooks/                          # NOT YET BUILT — see Backlog below (.gitkeep placeholder only)
```

## Quick-start workflows

Run these from the repository root. Each assumes Python 3 with no third-party dependencies beyond the standard library (`stig_reference_builder.py`/`cve_reference_builder.py` use only stdlib `urllib`, `zipfile`, `xml`, `json`).

### 1. Build or refresh the STIG reference database

```bash
# Drop one or more XCCDF files, or a DISA quarterly Library Compilation zip
# (public.cyber.mil/stigs/compilations), into execution-plan/tools/stig_intake/, then:
python3 execution-plan/tools/stig_reference_builder.py --intake-dir execution-plan/tools/stig_intake
```

### 2. Build or refresh the CVE reference database

```bash
# Targeted (small, curated list — what gets committed to the repo):
python3 execution-plan/tools/cve_reference_builder.py fetch-list --input execution-plan/tools/cve_intake/cve_list.example.txt

# Full local mirror (large, gitignored, local-only cache — optional):
python3 execution-plan/tools/cve_reference_builder.py mirror
python3 execution-plan/tools/cve_reference_builder.py mirror-update   # repeatable incremental refresh
```

### 3. Generate a Variance/Risk-Acceptance record for a finding

`generate_variance.py` auto-detects whether you passed a STIG Vulnerability ID (`V-\d+`) or a CVE ID (`CVE-\d{4}-\d{4,}`) and routes to the matching reference database automatically:

```bash
python3 execution-plan/tools/generate_variance.py V-253259
python3 execution-plan/tools/generate_variance.py CVE-2021-44228
```

The tool fails closed (non-zero exit, no file written) if the ID format isn't recognized or the ID isn't in the reference database — it will never fabricate finding text to fill the gap. See `execution-plan/tools/README.md` for the full CLI reference, including `--reference-db` to point at a different database file.

### 4. Regenerate the RACI matrix after editing the Master Calendar or the crosswalk

`RACI-MATRIX.md` is generated, not hand-authored. If you edit [`MAINTENANCE-PLAN.md`](../MAINTENANCE-PLAN.md) §4 (the Master Consolidated Calendar) or [`ROLE-CROSSWALK.md`](ROLE-CROSSWALK.md), re-run:

```bash
python3 execution-plan/tools/build_raci_matrix.py
```

This re-parses all 110 tasks and rewrites `RACI-MATRIX.md` in place — Part A (task-level RACI) and Part B (a reverse-index rollup of task counts per JSIG role). Do not hand-edit `RACI-MATRIX.md` directly; edit the script's `ROLE_MAP` / `FAMILY_RACI_DEFAULTS` dictionaries (documented inline) if your organization's Consulted/Informed assignments should differ, then re-run.

### 5. Escalating an overdue or contested finding

[`templates/ESCALATION-MATRIX.md`](templates/ESCALATION-MATRIX.md) defines the CAT-tiered SLA and sign-off routing that both `generate_variance.py`'s output and `RACI-MATRIX.md`'s task-level defaults are built to match: CAT I escalates to AO/DAO, CAT II to ISSM, CAT III to ISSO, with the ISSM standing as a consulted reviewer at every tier. Use it as the reference when a generated variance record's SLA is about to lapse or a sign-off is contested.

## Design principles

- **Generate, don't hand-author, for anything structured.** `RACI-MATRIX.md`, the STIG/CVE reference databases, and every Variance/Risk-Acceptance record are produced by a script from a documented source of truth, so they stay internally consistent and can be regenerated on demand instead of drifting via manual edits.
- **Fail closed.** Every tool in `tools/` exits non-zero and writes nothing rather than guess at missing data, silently downgrade a severity, or mark an operation complete when it partially failed.
- **Offline-only, vendor-agnostic.** No cloud or SaaS product is referenced by name anywhere in this folder's templates or generated output — every example uses generic terms ("local ticketing/GRC system," "local vulnerability scanner") so the material stays usable on an air-gapped network.
- **One severity model, reused everywhere.** The CAT I/II/III sign-off chain (`RACI_BY_CAT` in `generate_variance.py`) is the same one documented in `ESCALATION-MATRIX.md` and reflected in `RACI-MATRIX.md`'s task-level Accountable/Consulted/Informed assignments — there is only one escalation model in this repo, not three slightly different ones.

## Backlog (not yet built)

- **`runbooks/`** — Section 6 actionable task runbooks for all 17 JSIG §1.5 roles, following the 10-section scaffold in `templates/AUDIT-ARTIFACT-TEMPLATE.md`. Currently only a `.gitkeep` placeholder. This is the largest remaining deliverable in the execution plan.
- `STATUS-2026-07-17.md` is a point-in-time snapshot written at the end of a specific work session — useful for historical context on what was tested when, but not an onboarding document. Treat this README, not the status file, as the current entry point.

---
*For the underlying reference material this folder operationalizes, start at the [repository root README](../README.md). For the recurring-task cadence itself, see [`MAINTENANCE-PLAN.md`](../MAINTENANCE-PLAN.md).*
