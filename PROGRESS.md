# Implementation Progress Tracker

Use this file to track real-world progress standing up the JSIG maintenance program described in `MAINTENANCE-PLAN.md`. Keep the plan itself (`MAINTENANCE-PLAN.md`) stable as the reference; log actual status, dates, and owners here.

Last updated: 2026-07-17 (full-scope JSIG reference re-extraction committed)

## Phase status (mirrors MAINTENANCE-PLAN.md §6 Getting-Started Sequencing)

| Phase | Description | Status | Owner | Notes |
|---|---|---|---|---|
| 0 | Roles appointed in writing (ISSM, ISSO, SA, NA, SCA, FSO, Privacy Officer, Training Manager) | Not started | | |
| 1 | Baseline configuration & account management stood up (CM-2/CM-6, AC-2) | Not started | | |
| 2 | Audit logging & retention operational (AU family) | Not started | | |
| 3 | Vulnerability/patch management cadence operational (SI-2, RA-5) | Not started | | |
| 4 | Contingency & incident response plans tested (CP, IR) | Not started | | |
| 5 | Independent assessment / continuous monitoring cadence established (CA family) | Not started | | |
| 6 | Full 110-task master calendar operational across all 26 families | Not started | | |

## Reference-completeness tracker (mirrors EXTRACTION-LOG.md / EXTRACTION-LIMITATIONS.md)

| Item | Status | Notes |
|---|---|---|
| JSIG §1.5 Roles & Responsibilities | Extracted verbatim | See `references/JSIG-source/section-1.5-roles-and-responsibilities.md` |
| JSIG Chapter 3: all 18 families (AC, AT, AU, CA, CM, CP, IA, IR, MA, MP, PE, PL, PS, RA, SA, SC, SI, PM) | Extracted verbatim, full re-extraction 2026-07-17 | See `references/JSIG-source/chapter-3-*-family.md`; superseded prior partial/NIST-boilerplate versions after full PDF access was obtained via Wayback Machine + `pdftotext -layout` — see `EXTRACTION-LOG.md` |
| JSIG Privacy chapter: all 8 sub-families (AP, AR, DI, DM, IP, SE, TR, UL) | Extracted verbatim, full re-extraction 2026-07-17 | See `references/JSIG-source/chapter-3-privacy-*-family.md`; previously used NIST 800-53 Rev.4 baseline proxy text only |
| Appendix C SAP Security Control Baselines | Extracted verbatim, full 963-row table, 2026-07-17 | See `references/JSIG-source/appendix-c-sap-security-control-baselines.md`; dedicated column-position parser with spot-check verification gate; supersedes and replaces the removed `appendix-c-baselines-partial.md` |
| Appendix A References | Extracted verbatim | See `references/JSIG-source/appendix-a-references.md` |
| Appendix B Acronyms | Extracted verbatim, re-extracted 2026-07-17 for layout-mode fidelity | |
| Appendix D Confidentiality Impact Level Flowchart | Genuine limitation, documented | Flowchart is a rendered image in the source PDF, not extractable text; see `EXTRACTION-LIMITATIONS.md` |
| Appendix E Definitions | Extracted verbatim, re-extracted 2026-07-17 for layout-mode fidelity | |
| Section 2 RMF Process | Extracted (mostly complete) | See `references/JSIG-source/section-2-rmf-process.md`; some 2.4–2.7 continuation may be incomplete |

## Open questions / decisions needed

- [ ] Confirm which GRC tool, ticketing system, or calendar will operationalize the 110-task master calendar (`MAINTENANCE-PLAN.md` §4).
- [ ] Reconcile `MAINTENANCE-PLAN.md`'s 110-task master calendar against the real JSIG ODP values now available in `references/JSIG-source/chapter-3-*-family.md` (e.g. AU-1/AT-1 "at least annually" is now confirmed verbatim) — not yet started; likely a separate phase since it may ripple into `RACI-MATRIX.md`, `role_task_index.json`, and the 17 role runbooks that cite specific ODP values. Scope with the user before starting.
- [ ] Assign real named owners to each role in `playbooks/roles/` (currently generic role titles only).

## Change log

- 2026-07-29 — Added an interactive setup wizard, `execution-plan/tools/start_here.py` (with a thin root-level `start_here.py` wrapper so `python3 start_here.py` works immediately from a fresh clone). Six steps: environment check (Python version, network reachability to NVD/Tenable, cached-entry counts for all three reference DBs), optional recording of who holds each of the 17 JSIG §1.5 roles (saved to a new local-only, gitignored `data/role_assignments.local.json` — never committed, per the repo's unclassified/general-framework scope), guided STIG import, guided CVE pre-fetch, guided Nessus Plugin ID pre-fetch, and a practice Variance/Risk-Acceptance record generation. Shells out to the existing four CLI tools rather than reimplementing logic (prints each command before running it); never edits `MAINTENANCE-PLAN.md` and never commits to git. `--check-only` and per-step `--skip-*` flags supported. Smoke-tested: `--check-only`, full interactive run with piped/empty stdin (confirmed EOF-safe graceful degradation to defaults, no crash), all `--skip-*` flags together, `--help`, and a mid-flow `Ctrl-C` (confirmed clean exit 130, no partial writes) — all left the repo clean, no leftover artifacts. Along the way, fixed a real bug the wizard's environment check surfaced: a bare-root reachability probe to NVD returned HTTP 403 (blocked without a User-Agent) even though the actual CVE API endpoint works fine, so the check now treats any HTTP response (even an error status) as "network path is up" and only flags true connection-level failures as unreachable. Wired into docs: `execution-plan/tools/README.md` (new Quickstart wizard section + files table row), `execution-plan/README.md` (new "Step 0" quick-start entry, folder map, and a Nessus Plugin ID mention added to the previously-stale Section 3 auto-detect description), and root `README.md` (new "0." quickstart pointer). Also corrected two pre-existing stale example commands found in `execution-plan/README.md`'s quick-start workflows while touching that section: `stig_reference_builder.py` was missing its required `build` subcommand, and `cve_reference_builder.py fetch-list` used a nonexistent `--input` flag instead of the real `--file` flag — both re-verified against actual `--help` output and a live run.
- 2026-07-29 — Added `nessus_reference_builder.py` and extended `generate_variance.py` to auto-detect and render a third variance-record identifier type: bare-digit Nessus Plugin IDs (e.g. `156327`), alongside the existing STIG `V-NNNNNN` and CVE `CVE-YYYY-NNNN` paths. Fetches official plugin metadata from Tenable's public plugin pages (no auth/API key needed). Added `nessus_intake/` drop zone and updated `execution-plan/tools/README.md`. Smoke-tested end-to-end same day: all three ID-type paths (STIG V-253254, CVE CVE-2021-44228, Nessus Plugin 156327) generated valid Markdown/HTML records; `build_control_title_index.py`, `build_role_task_index.py`, and `build_raci_matrix.py` re-run and confirmed byte-identical to committed output (no drift). Test artifacts discarded per the established no-test-data-in-repo convention.
- 2026-07-17 — Repository created: JSIG reference scaffold, cadence research, maintenance plan (daily-ops-focused with deep-dive domain analysis), 17 role playbooks, and full offline external-source library assembled.
- 2026-07-17 — Full-scope re-extraction: obtained complete 378-page JSIG PDF via Wayback Machine snapshot and `pdftotext -layout`; regenerated all 18 Chapter 3 families, all 8 Privacy sub-families, and Appendices A/B/D/E with real JSIG-specific text (ODP values, DoD SAP-specific supplemental guidance); built a dedicated verified parser for the full 963-row Appendix C baseline table, replacing the prior partial extraction. See `references/JSIG-source/EXTRACTION-LOG.md` for full method and known limitations. ODP reconciliation against `MAINTENANCE-PLAN.md` not yet started (see Open questions).
- 2026-07-17 — RACI/runbook control-language reconciliation (framework, not calendar): built `control_title_index.json` (949 real verbatim JSIG control titles parsed from the extracted family files) and `CONTROL-LANGUAGE-CROSSWALK.md` (audits all 127 distinct Control IDs cited in the Master Calendar — 0 mismatches found). Enriched `role_task_index.json` with resolved real titles per task (additive `control_titles` field; RACI counts per role unchanged, confirming no logic drift) and added a `CONTROL-LANGUAGE-CROSSWALK.md` pointer to `RACI-MATRIX.md`'s header and all 17 role runbooks. `MAINTENANCE-PLAN.md`'s 110-task calendar itself was intentionally left untouched per explicit scoping — this pass verified the framework's existing Control ID citations against real JSIG text rather than reworking the calendar's task/frequency structure.
