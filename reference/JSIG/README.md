# JSIG Reference Scaffold

This folder is a Markdown scaffold for the **Department of Defense Joint Special Access Program (SAP) Implementation Guide (JSIG), 11 April 2016**, based on NIST SP 800-53 Rev. 4 and CNSSI 1253. [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)

The JSIG states that it provides policy and guidance for implementing the Risk Management Framework (RMF), serves as a technical supplement to NIST SP 800-53 and CNSSI 1253, and is used with DoDM 5205.07 for DoD SAP information systems. [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)

## Extraction status

- **Control family inventory:** extracted from the official JSIG PDF table of contents, including 26 families and 274 control entries. [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **Control body text:** the local environment could not directly download the DCSA PDF bytes because DCSA returned HTTP 403 to local HTTP clients; the PDF was readable through a document-aware fetcher, but the full parsed body was truncated after the early chapters. [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- **Baseline control statements and enhancements:** populated from the official NIST SP 800-53 Rev. 4 XML catalog because JSIG Chapter 3 states that the original NIST text is preserved except where organization-defined parameter values are assigned for the DoD SAP Community. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)
- **JSIG-specific tailoring notes:** included where the fetched JSIG snippets exposed specific text, especially the three non-tailorable controls AC-6(1), SA-22, and SC-28. [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)

## Folder organization

- `control-families/INDEX.md` — master index of all JSIG families and control counts.
- `control-families/<FAMILY-CODE>.md` — one Markdown file per family with JSIG TOC inventory, NIST Rev. 4 baseline control statements, enhancements, and known JSIG-specific notes.
- `appendices/` — appendix scaffold files for references, acronyms, SAP baselines, confidentiality impact guidance, and definitions.

## Manual follow-up needed

Manual follow-up is needed to replace NIST baseline placeholders with the exact JSIG Chapter 3 organization-defined values and SAP guidance text for most controls, and to transcribe Appendix C baseline tables from pages 341-374. [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
