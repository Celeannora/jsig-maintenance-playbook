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
