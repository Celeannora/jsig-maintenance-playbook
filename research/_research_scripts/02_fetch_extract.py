import pplx_sdk, os, json
RD='/home/user/workspace/jsig-reference-scaffold/research/_intermediate'
os.makedirs(RD, exist_ok=True)
urls = [
'https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf',
'https://nvlpubs.nist.gov/nistpubs/specialpublications/nist.sp.800-53r4.pdf',
'https://nvlpubs.nist.gov/nistpubs/legacy/sp/nistspecialpublication800-137.pdf',
'https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-137A.pdf',
'https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-40r4.pdf',
'https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf',
'https://www.fedramp.gov/resources/templates/FedRAMP-Continuous-Monitoring-Deliverables-Template.xlsx',
'https://www.fedramp.gov/rfcs/0012/',
'https://www.fedramp.gov/rfcs/0026/',
'https://help.fedramp.gov/hc/en-us/articles/29975368259867-Vulnerability-Scanning',
'https://www.fedramp.gov/legacy/playbook/csp/continuous-monitoring/annual-assessment/',
'https://www.cms.gov/regulations-and-guidance/guidance/manuals/downloads/117_systems_security_mac_ars.pdf',
'https://www.cms.gov/files/document/acceptable-risk-safeguards-v51.xlsx',
'https://security.cms.gov/policy-guidance/audit-and-accountability-au',
'https://security.cms.gov/policy-guidance/cms-acceptable-risk-safeguards-ars',
'https://security.cms.gov/learn/cms-plan-action-and-milestones-poam-handbook',
'https://www.cms.gov/regulations-and-guidance/guidance/manuals/downloads/117_systems_security.pdf',
'https://www.irs.gov/pub/irs-pdf/p1075.pdf',
'https://www.irs.gov/privacy-disclosure/meeting-irs-safeguards-audit-requirements',
'https://public.cyber.mil/stigs/',
'https://public.cyber.mil/stigs/compilations/',
'https://www.marines.mil/News/Messages/Messages-Display/Article/889863/mcbul-5239-usmc-information-assurance-vulnerability-management-iavm-program/',
'https://media.defense.gov/2022/Nov/14/2003113709/-1/-1/0/CONTINUOUS%20MONITORING%20ANNEX%20V1.0%20800-53%20CONTROL%20MAPPINGS.PDF',
'https://nvlpubs.nist.gov/nistpubs/legacy/sp/nistspecialpublication800-34r1.pdf',
'https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-61r2.pdf'
]
prompt = '''Extract every documented operational cadence/frequency/timeline relevant to NIST SP 800-53 Rev 4 / RMF / JSIG style maintenance schedules. Include specific frequencies like daily, weekly, monthly, quarterly, annually, every 30/60/90/365 days, within X days, retention period. Map each cadence to likely control family/control ID (MA, CM, AU, SI, CA, CP, IR, PE, AC, IA) when possible. Quote or closely paraphrase the exact requirement. If this source gives only general risk-based/org-defined frequency and no specific cadence, state that. Return compact bullets with source section names if visible.'''
raw = pplx_sdk.content.fetch_many(urls, chunk_size=5, concurrency=5, prompt=prompt, cache_enabled=True)
results, errors = pplx_sdk.utils.partition(raw, lambda r: r.ok)
rows = pplx_sdk.utils.flatten_fanout_rows(results)
out=f'{RD}/02_fetched_cadence_extracts.jsonl'
err=f'{RD}/02_fetch_errors.jsonl'
pplx_sdk.utils.write_jsonl(out, rows)
pplx_sdk.utils.write_jsonl(err, errors)
print(out)
print('rows', len(rows), 'errors', len(errors))
pplx_sdk.utils.print_preview_jsonl(out, limit=8, max_chars=2500)
if errors:
    pplx_sdk.utils.print_preview_jsonl(err, limit=5, max_chars=1000)
