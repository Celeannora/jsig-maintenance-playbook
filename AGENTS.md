# Agent Instructions for This Repository

This repository is a **reference and maintenance-planning knowledge base** for a JSIG-governed system administration program. It is designed to be used by both humans and AI agents (coding assistants, planning assistants, research agents) as ground truth for follow-on implementation work. This file tells any agent how to work in this repo correctly.

## What this repo is / is not

- **Is:** an offline, unclassified, general-framework reference (JSIG control-family structure, JSIG §1.5 role definitions, cited real-world maintenance cadences, a consolidated maintenance plan, and role playbooks).
- **Is not:** an authorization package, an SSP, a POA&M, or any classified/program-specific artifact. Never add classified, controlled unclassified (CUI), or program-identifying content to this repo. If a future task asks you to fill in program-specific data, stop and confirm with the user whether that content belongs in a different, appropriately controlled repository/environment instead.

## Source-of-truth hierarchy (use in this order)

1. `reference/JSIG-source/` — verbatim/near-verbatim extractions directly from the [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf). Treat as authoritative JSIG text where present.
2. `reference/JSIG/control-families/<CODE>.md` — control inventory + NIST 800-53 Rev. 4 baseline text (proxy where JSIG-specific ODP/tailoring text wasn't extractable — check `EXTRACTION-LIMITATIONS.md` before treating any given control's text as JSIG-verified).
3. `reference/external-sources/` — offline copies of every external cadence/guidance source cited elsewhere in the repo. Cite these, don't re-fetch from the internet, when this repo is used offline.
4. `MAINTENANCE-PLAN.md` and `playbooks/roles/*.md` — synthesized/derived planning content built from #1–#3. Treat as a recommended baseline that still needs organization-specific JSIG ODP verification before operational use.

## Rules for any agent editing this repo

1. **Never fabricate JSIG control text, ODP values, or cadences.** If a specific value is not present in `reference/JSIG-source/` or `reference/external-sources/`, either cite the nearest documented analogue and flag it clearly (as the existing docs do — search for the phrase "no specific cadence documented" for the pattern to follow) or leave it as an open TODO in `PROGRESS.md`.
2. **Cite every factual claim with the actual source URL**, following the existing inline-markdown-link citation style used throughout `MAINTENANCE-PLAN.md` and the `reference/JSIG/` family files.
3. **Keep `manifest.txt` current** — when you add, rename, or remove a file, update `manifest.txt` to match.
4. **Update `PROGRESS.md`**, not `MAINTENANCE-PLAN.md`, when tracking real-world implementation status. `MAINTENANCE-PLAN.md` is the plan; `PROGRESS.md` is the execution/tracking log.
5. **Preserve extraction-limitation notes.** If you successfully extract previously-missing JSIG text (e.g. full Appendix C baseline tables, remaining chapter 3 families), add it under `reference/JSIG-source/` with a proper source citation and header, then update `reference/JSIG-source/EXTRACTION-LOG.md` and `reference/JSIG/appendices/EXTRACTION-LIMITATIONS.md` to reflect the new coverage — don't silently leave the old "not yet extracted" note in place once it's stale.
6. **This project is planning-only until a human explicitly approves implementation actions** (e.g. actually configuring a system, opening tickets in a live ticketing system, etc.). Building or expanding reference/planning content in this repo does not require re-confirmation; taking any action against a live system, live ticketing tool, or another external service on the user's behalf does.
7. **Network-agnostic language.** When adding to `playbooks/roles/` or `MAINTENANCE-PLAN.md`, keep guidance applicable regardless of specific network architecture, enclave, or toolset — describe the control objective and operational process, not vendor-specific configuration steps.

## Suggested next-implementation tasks (see `PROGRESS.md` for the live checklist)

- Verify/replace NIST-baseline-proxy control text in `reference/JSIG/control-families/` with confirmed JSIG-specific ODP values once the full source PDF is available for complete parsing.
- Complete Appendix C SAP baseline table transcription (`reference/JSIG-source/appendix-c-baselines-partial.md` is partial).
- Extract remaining Chapter 3 families not yet pulled verbatim (see `reference/JSIG-source/EXTRACTION-LOG.md` for the current gap list).
- Turn the 110-task master calendar in `MAINTENANCE-PLAN.md` §4 into whatever recurring-task/ticketing system the organization actually uses (GRC tool, ticketing system, calendar) — this repo intentionally stays tool-agnostic.
