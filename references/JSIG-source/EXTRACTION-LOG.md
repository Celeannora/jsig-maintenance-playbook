# JSIG Extraction Log

Source PDF URLs used:
- Primary: https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf
- Alternate DCSA mirror path: https://www.dcsa.mil/Portals/69/documents/io/rmf/JSIG_2016April11_Final_(53Rev4).pdf
- Mirror-discovery page: https://www.formalu.com/forms/196328/department-of-defense-dod-joint-special-access-program-sap-implementation-guide-jsig

Retrieval date: 2026-07-17

Method: document-aware URL fetch with targeted prompts. Files contain only text returned by successful targeted fetches plus a source/retrieval header.

## Successful extractions saved

- `chapter-3-MA-family.md` — Chapter 3 Maintenance (MA) family body returned after page-specific retry.
- `chapter-3-AU-family.md` — Chapter 3 Audit and Accountability (AU) family body returned after exact-heading retry; a later AU-specific tailoring/baseline prompt failed, so this should be treated as the body text returned, not a complete verified JSIG baseline/tailoring capture.
- `chapter-3-CM-family.md` — Chapter 3 Configuration Management (CM) family body returned after exact-heading retry.
- `chapter-3-SI-family.md` — Chapter 3 System and Information Integrity (SI) family body returned after exact-heading retry.
- `chapter-3-CA-family.md` — Chapter 3 Security Assessment and Authorization (CA) family body returned after page-specific retry.
- `chapter-3-CP-family.md` — Chapter 3 Contingency Planning (CP) family body returned after exact-heading retry.
- `chapter-3-IR-family.md` — Chapter 3 Incident Response (IR) family body returned after family prompt.
- `chapter-3-PE-family.md` — Chapter 3 Physical and Environmental Protection (PE) family body returned after exact-heading retry.
- `chapter-3-AC-family.md` — Chapter 3 Access Control (AC) family body returned after exact-heading retry.
- `appendix-b-acronyms.md` — Appendix B acronym list returned by appendix prompt.
- `appendix-e-definitions.md` — Appendix E definitions list returned by appendix prompt.
- `appendix-c-baselines-partial.md` — Partial Appendix C baseline rows returned by targeted family prompts for AC/AU, CM/CP, and IR/MA; full Appendix C did not extract.
- `section-2-rmf-process.md` — Section 2 partial RMF extraction: primary URL returned 2.1 and 2.2.1-2.2.2 ending mid-sentence; alternate URL returned Sections 2.3 through 2.3.6 including RMF Step 6 Monitor.
- `section-1.6-document-organization-and-use.md` — Section 1.6 Document Organization and Use.

## Failed or incomplete despite attempts

- Full Appendix C SAP Security Control Baselines: multiple prompts against the primary URL and alternate DCSA URL returned only the table-of-contents entry or partial family rows. Full tables, all columns, legends, and footnotes remain incomplete.
- Appendix C PE/SI baseline rows: targeted PE/SI prompt returned Chapter 3 page-list style entries, not actual Appendix C baseline rows.
- AU JSIG-specific tailoring/ODP and baseline allocation lines: a targeted prompt for AU tailoring/baseline lines returned a failure stating no Chapter 3 body-page text was available, even though a broader AU body extraction succeeded earlier.
- Section 2.2.2 SDLC continuation and any Sections 2.4-2.7 if they exist as separate headings: primary URL returned Section 2.2.2 ending mid-sentence; alternate URL returned 2.3.1-2.3.6 but not separate 2.4-2.7 headings.
- Full Chapter 3 control-family bodies for families outside the prioritized set were not attempted in this pass.

## Alternate URL discovery

A web search found an official alternate DCSA path referenced by Formalu: `https://www.dcsa.mil/Portals/69/documents/io/rmf/JSIG_2016April11_Final_(53Rev4).pdf`. This alternate URL produced the successful RMF Sections 2.3-2.3.6 extraction and partial Appendix C family-row extractions.

## 2026-07-17: Full-scope re-extraction superseding all entries above

The original document-aware URL fetch approach above hit persistent HTTP 403s
against both the primary and alternate DCSA URLs and could only return partial,
low-fidelity, NIST-boilerplate text for most families. This was resolved by
downloading the full 378-page PDF via its Wayback Machine snapshot
(`http://web.archive.org/web/20260405054539/https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf`)
and running `pdftotext -layout` locally against it, producing
`raw/JSIG_2016April11_Final_53Rev4_layout.txt` (19,972 lines).

Key discovery: pdftotext's default (non-layout) mode reorders hanging-indent
lettered/numbered sub-items, decoupling list markers from their paragraph
content by several lines. This had silently corrupted the earlier low-fidelity
extractions and hidden genuine DoD SAP-specific supplemental guidance blocks
(e.g. AU-1's "DoD SAP-specific policy and procedures related to audit and
accountability are defined in the remainder of this section"). Layout mode
preserves correct reading order and reveals this text.

Using `raw/extract_sections.py` (v2, layout-mode-based), all of the following
were regenerated/added, replacing every prior partial/boilerplate version:

- All 18 Chapter 3 control families: AC, AT, AU, CA, CM, CP, IA, IR, MA, MP,
  PE, PL, PS, RA, SA, SC, SI, PM.
- All 8 Privacy chapter sub-families: AP, AR, DI, DM, IP, SE, TR, UL.
- Appendix A (References), Appendix B (Acronyms), Appendix D (Confidentiality
  Impact Level Flowchart — genuinely near-empty; the flowchart is an image, not
  extractable text, and the file says so), Appendix E (Definitions).

Appendix C (SAP Security Control Baselines) required a dedicated parser,
`raw/parse_appendix_c.py`, because the table's header-row letters ("L M H L M
H L M H") are not reliably character-aligned with where the data rows' actual
X/S/+ marks land on the same page (header text and data values are separate
PDF text runs, positioned independently by pdftotext). The parser instead:

1. Collects every isolated X/S/+ character position across all data rows on
   each page (isolated = flanked by non-alphanumeric characters, so letters
   embedded in title words like the "S" in "SYSTEM" are correctly excluded —
   an earlier version of this parser lacked this check and produced spurious
   extra columns from title text).
2. Clusters those positions into columns (real spacing was measured at
   exactly 4 characters with zero jitter across rows).
3. Assigns clusters to the 9 baseline columns (C-L/M/H, I-L/M/H, A-L/M/H) by
   dividing each cluster's offset from the first cluster by the page's
   pitch and rounding to the nearest integer slot — this correctly handles
   pages where a given sub-column has zero marks anywhere on that page
   (legitimate source gap) without shifting later columns.
4. Classifies any remaining cluster(s) as Classified Overlay vs. Potentially
   Common/Inheritable by distance from the (possibly interpolated) A-H
   position, since many pages have marks in only one of these two trailing
   columns and naive left-to-right order assignment mislabels them.

A `verify_samples()` gate checks known rows (AC-1, AC-2(1), AC-3(2), SI-7(14))
against manually-verified raw-text readings before the output file is trusted
or written; the script aborts the write if any check fails. This caught two
real bugs during development (a header-position-based v1 approach, and a
false-positive letter-matching issue) before producing the final, verified
963-row table in `appendix-c-sap-security-control-baselines.md`, which
supersedes and replaces `appendix-c-baselines-partial.md` (removed).

Known limitation (title text only, not baseline data): a handful of
all-blank-marks rows within the Privacy sub-families (AP/AR/DI/DM/IP/SE/TR/UL)
have wrapped title-continuation lines that, per manual cross-check against
known real NIST 800-53 Appendix J control titles, actually belong to the
*adjacent* row rather than their own row in a few cases (confirmed for
AR-2/AR-3, DI-2(1), DM-1, DM-3 — these came out correct after investigation).
One residual case, DI-2, still prints as "Data Integrity And Data Integrity
Board" instead of the correct "Data Integrity Board" — a one-off duplicated
text-run artifact in the source rendering. No reliable position-based rule
was found to generalize the adjacent-row-prefix correction without breaking
the far more common default case (e.g. AC-2(6)/(7), where each all-blank
row's own continuation line genuinely is its own title), so simple
self-attachment was kept as the universal default and this is documented as
a known cosmetic limitation rather than "fixed" with an unreliable heuristic.
Baseline mark data (X/S/+ values) is unaffected in all cases since these rows
carry no marks at all.

## 2026-07-17 (later same day): Downstream reconciliation use of this extraction

The verbatim family extractions above were used to build
`execution-plan/tools/build_control_title_index.py`, which parses all 26
family files for real control/enhancement titles, and
`execution-plan/tools/build_control_language_crosswalk.py`, which cross-
checks every Control ID cited in `MAINTENANCE-PLAN.md`'s Master Calendar
against those real titles. Result: all 127 distinct Control IDs cited
resolved cleanly with zero mismatches (see
`execution-plan/CONTROL-LANGUAGE-CROSSWALK.md`). `role_task_index.json` and
the 17 role runbooks now carry pointers to real verbatim JSIG control
language via this crosswalk. The Master Calendar's task list, frequencies,
and Control ID assignments themselves were intentionally left unmodified in
this pass -- reconciling those against real JSIG ODP values (as opposed to
just verifying the Control IDs already assigned) remains an explicitly
out-of-scope, unstarted future phase (see `PROGRESS.md` Open Questions).
