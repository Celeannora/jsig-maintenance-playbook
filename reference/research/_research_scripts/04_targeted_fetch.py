import pplx_sdk, os
RD='/home/user/workspace/jsig-reference-scaffold/reference/research/_intermediate'
urls=[
'https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Moderate-FedRAMP-Security-Controls.docx',
'https://www.fedramp.gov/resources/templates/SSP-Appendix-A-High-FedRAMP-Security-Controls.docx',
'https://www.fedramp.gov/resources/templates/SSP-Appendix-A-Low-FedRAMP-Security-Controls.docx',
'https://www.gsa.gov/system/files/Contingency-Planning-(CP)-%5BCIO-IT-Security-06-29-Rev-7%5D.pdf',
'https://www.irs.gov/pub/irs-pdf/p1075.pdf',
'https://www.irs.gov/privacy-disclosure/meeting-irs-safeguards-audit-requirements',
'https://www.hhs.gov/guidance/sites/default/files/hhs-guidance-documents/CMS/117_Systems_security-MAC-ARS.pdf',
'https://www.va.gov/vapubs/viewPublication.asp?Pub_ID=1504&FType=2',
'https://www.stigviewer.com/stig/zos_tss/2017-03-22/finding/V-3331',
'https://www.stigviewer.com/controls/nist-800-53/AU-6',
'https://www.stigviewer.com/controls/nist-800-53/AC-2',
'https://github.com/GSA/fedramp-tailored/blob/master/_guidance/controls/SI-3.md',
'https://github.com/GSA/fedramp-tailored/blob/master/_guidance/controls/AU-6.md',
'https://github.com/GSA/fedramp-tailored/blob/master/_guidance/controls/CP-4.md',
'https://github.com/GSA/fedramp-tailored/blob/master/_guidance/controls/IR-3.md',
'https://github.com/GSA/fedramp-tailored/blob/master/_guidance/controls/CP-9.md',
'https://github.com/GSA/fedramp-tailored/blob/master/_guidance/controls/AC-2.md',
'https://github.com/GSA/fedramp-tailored/blob/master/_guidance/controls/PE-2.md'
]
prompt='''Extract documented concrete cadences/timelines/retention periods relevant to NIST 800-53 Rev 4/RMF operational maintenance. Focus on: AU-6/AU-11 logs review and retention; AC-2 account review, disablement, temporary accounts; IA authenticators/certificates; CP-4 contingency plan test, CP-9 backup testing; IR-3 incident response testing/training; PE-2/PE-3 physical access reviews; SI-2/SI-3 vulnerability/malware; CM inventory/change reviews; MA maintenance. Include exact frequency and control ID. If source leaves frequency organization-defined, say so. Quote closely.'''
raw=pplx_sdk.content.fetch_many(urls, chunk_size=5, concurrency=5, prompt=prompt, cache_enabled=True)
results, errors=pplx_sdk.utils.partition(raw, lambda r:r.ok)
rows=pplx_sdk.utils.flatten_fanout_rows(results)
out=f'{RD}/04_targeted_cadence_extracts.jsonl'; err=f'{RD}/04_targeted_fetch_errors.jsonl'
pplx_sdk.utils.write_jsonl(out, rows); pplx_sdk.utils.write_jsonl(err, errors)
print(out); print('rows',len(rows),'errors',len(errors)); pplx_sdk.utils.print_preview_jsonl(out,limit=12,max_chars=2500)
if errors: pplx_sdk.utils.print_preview_jsonl(err,limit=5,max_chars=1000)
