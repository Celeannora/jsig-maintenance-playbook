import pplx_sdk, os
RD='/home/user/workspace/jsig-reference-scaffold/research/_intermediate'
urls=[
'https://public.cyber.mil/stigs/',
'https://public.cyber.mil/stigs/compilations/',
'https://www.marines.mil/News/Messages/Messages-Display/Article/889863/mcbul-5239-usmc-information-assurance-vulnerability-management-iavm-program/',
'https://media.defense.gov/2022/Nov/14/2003113709/-1/-1/0/CONTINUOUS%20MONITORING%20ANNEX%20V1.0%20800-53%20CONTROL%20MAPPINGS.PDF',
'https://www.dcsa.mil/portals/91/documents/ctp/nao/JSIG_2016April11_Final_(53Rev4).pdf'
]
prompt='''Extract concrete cadences and timelines from this DoD/DISA/JSIG source for operational maintenance schedules: STIG update/release cycles, SRG/STIG Library compilations frequency, IAVA/IAVM remediation timelines, continuous monitoring cadence, JSIG/RMF ongoing monitoring, annual reporting, control assessment schedules. Include control family/control ID mappings (CM, SI, CA, AU, MA) and quote closely. If exact cadence not stated, say no exact cadence.'''
raw=pplx_sdk.content.fetch_many(urls, chunk_size=5, concurrency=5, prompt=prompt, cache_enabled=True)
results, errors=pplx_sdk.utils.partition(raw, lambda r:r.ok)
rows=pplx_sdk.utils.flatten_fanout_rows(results)
out=f'{RD}/05_dod_cadence_extracts.jsonl'; err=f'{RD}/05_dod_fetch_errors.jsonl'
pplx_sdk.utils.write_jsonl(out, rows); pplx_sdk.utils.write_jsonl(err, errors)
print(out); print('rows',len(rows),'errors',len(errors)); pplx_sdk.utils.print_preview_jsonl(out,limit=8,max_chars=2500)
