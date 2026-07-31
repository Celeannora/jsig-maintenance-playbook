# Extraction Limitations

## Resolved (2026-07-17)

Direct local HTTP downloads of the official DCSA JSIG PDF returned HTTP 403,
and the document-aware fetcher could only read early/partial portions of the
parsed document. [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)

This access gap is now resolved: the complete 378-page PDF was downloaded via
its Wayback Machine snapshot and processed with `pdftotext -layout` for a
full, accurate extraction. See `reference/JSIG-source/EXTRACTION-LOG.md` for
the full method, and the following files for the extracted content, all of
which supersede the NIST-boilerplate/table-of-contents-only approach
previously used as a stand-in:

- All 18 Chapter 3 control families (AC, AT, AU, CA, CM, CP, IA, IR, MA, MP,
  PE, PL, PS, RA, SA, SC, SI, PM) — real JSIG-specific body text, ODP values,
  and DoD SAP-specific supplemental guidance, in `reference/JSIG-source/chapter-3-*-family.md`.
- All 8 Privacy chapter sub-families (AP, AR, DI, DM, IP, SE, TR, UL), in
  `reference/JSIG-source/chapter-3-privacy-*-family.md`.
- Appendix A (References), B (Acronyms), C (SAP Security Control Baselines —
  full 963-row table with baseline membership by impact level, Classified
  Overlay, and Potentially Common/Inheritable flags), and E (Definitions), in
  `reference/JSIG-source/appendix-*.md`.

## Genuine remaining limitation

- **Appendix D (Confidentiality Impact Level Flowchart)**: the flowchart is a
  rendered image in the source PDF, not extractable text. `pdftotext` (with
  or without `-layout`) returns no meaningful content for this page.
  `reference/JSIG-source/appendix-d-confidentiality-impact-level-flowchart.md`
  documents this honestly rather than fabricating flowchart content; anyone
  needing the flowchart's actual decision logic should consult the source PDF
  page images directly.
- **Minor Privacy-chapter title-text cosmetic artifact**: see the "Known
  limitation" note at the end of `reference/JSIG-source/EXTRACTION-LOG.md`
  regarding a handful of all-blank-marks Appendix C rows in the Privacy
  sub-families where a wrapped title fragment may print on the adjacent row.
  No baseline mark data is affected.
