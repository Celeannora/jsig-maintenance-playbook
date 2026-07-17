# Extraction Limitations

Direct local HTTP downloads of the official DCSA JSIG PDF returned HTTP 403, while the document-aware fetcher could read the PDF text but returned only the early portion of the parsed document. [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)

The scaffold therefore treats the JSIG table of contents as authoritative for family/control inventory and uses the official NIST SP 800-53 Rev. 4 XML catalog for baseline control statements and enhancements. [NIST SP 800-53 Rev. 4 XML](https://csrc.nist.gov/CSRC/media/Projects/risk-management/800-53%20Downloads/800-53r4/800-53-rev4-controls.xml)

The following items require manual follow-up before this scaffold can be used as an authoritative database:

- Exact JSIG organization-defined parameter values for most controls and enhancements. [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- JSIG SAP-specific supplemental guidance text boxes for each family. [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- Appendix C baseline membership tables and control/enhancement applicability by impact level. [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
- Appendix B full acronym table and Appendix E full definitions. [JSIG PDF](https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf)
