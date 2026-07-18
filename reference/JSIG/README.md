# JSIG Reference Scaffold

This folder is a Markdown scaffold for the **Department of Defense Joint Special Access Program (SAP) Implementation Guide (JSIG), 11 April 2016**, based on NIST SP 800-53 Rev. 4 and CNSSI 1253. [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)

The JSIG states that it provides policy and guidance for implementing the Risk Management Framework (RMF), serves as a technical supplement to NIST SP 800-53 and CNSSI 1253, and is used with DoDM 5205.07 for DoD SAP information systems. [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)

## Extraction status

**This folder's `control-families/<CODE>.md` files are the original TOC-only/NIST-boilerplate scaffold and are now superseded.** The access gap described below is resolved -- the complete 378-page JSIG PDF was obtained via its Wayback Machine snapshot and processed with `pdftotext -layout`, yielding full verbatim JSIG family text (real ODP values, DoD SAP-specific supplemental guidance) for all 26 families plus Appendices A, B, C (963-row baseline table), D, and E. That full extraction lives in `../../references/JSIG-source/chapter-3-*-family.md` -- use it instead of this folder's family files wherever JSIG-specific (not NIST-generic) text is needed. See `appendices/EXTRACTION-LIMITATIONS.md` and `../../references/JSIG-source/EXTRACTION-LOG.md` for the full method and status.

- **Control family inventory:** extracted from the official JSIG PDF table of contents, including 26 families and 274 control entries. [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **Control body text:** *(historical, resolved)* the local environment initially could not directly download the DCSA PDF bytes because DCSA returned HTTP 403 to local HTTP clients, so this folder's family files were populated from NIST boilerplate as a stand-in. That gap is now closed via the Wayback Machine method above. [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **Baseline control statements and enhancements (this folder only):** populated from the official NIST SP 800-53 Rev. 4 XML catalog because JSIG Chapter 3 states that the original NIST text is preserved except where organization-defined parameter values are assigned for the DoD SAP Community -- **for the real JSIG-specific text itself, use `references/JSIG-source/` instead.** [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **JSIG-specific tailoring notes:** included where the fetched JSIG snippets exposed specific text, especially the three non-tailorable controls AC-6(1), SA-22, and SC-28. [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)

## Folder organization

- `control-families/INDEX.md` — master index of all JSIG families and control counts.
- `control-families/<FAMILY-CODE>.md` — one Markdown file per family with JSIG TOC inventory, NIST Rev. 4 baseline control statements, enhancements, and known JSIG-specific notes.
- `appendices/` — appendix scaffold files for references, acronyms, SAP baselines, confidentiality impact guidance, and definitions.

## Manual follow-up needed

**Resolved** -- the exact JSIG Chapter 3 organization-defined values, SAP guidance text, and the full Appendix C baseline table (pages 341-374, 963 rows) have been transcribed and now live in `../../references/JSIG-source/`. This folder's own family files were intentionally left as-is (not rewritten in place) so the original TOC/NIST-boilerplate scaffold and the full verbatim extraction remain independently inspectable; treat `references/JSIG-source/` as authoritative going forward. [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
