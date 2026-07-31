import pplx_sdk, os
RD='/home/user/workspace/jsig-reference-scaffold/reference/research/_intermediate'
queries = [
    'CMS ARS AU-6 audit logs weekly daily review',
    'CMS ARS AU-11 audit retention 90 days one year',
    'CMS ARS AC-2 privileged accounts 90 days review',
    'CMS ARS IA authenticator certificate rotation frequency',
    'IRS Publication 1075 log review daily weekly audit retention',
    'IRS Publication 1075 account review quarterly annual',
    'IRS Publication 1075 contingency plan test backup frequency',
    'VA 6500 audit log review weekly vulnerability scans monthly',
    'federal SSP template audit log review weekly monthly',
    'NIST 800-53 audit log review daily weekly implemented controls',
    'DoD STIG account review every 30 days audit log retention',
    'STIG certificate revocation check frequency account review quarterly',
    'FedRAMP SSP AU-6 audit review frequency',
    'FedRAMP CP-4 contingency plan test annual',
    'FedRAMP IR-3 incident response test annual',
    'FedRAMP AC-2 account review monthly annually',
    'FedRAMP PE-2 physical access review annual',
    'FedRAMP backup test frequency CP-9',
    'FedRAMP malicious code protection updates frequency SI-3',
    'NIST 800-53 MA-6 timely maintenance mean time repair'
]
raw=pplx_sdk.search.web_many(queries, limit_per_query=8, concurrency=5)
results, errors = pplx_sdk.utils.partition(raw, lambda r: r.ok)
rows=pplx_sdk.utils.flatten_fanout_rows(results)
rows=pplx_sdk.utils.dedup_by_url(sorted(rows, key=lambda x: len(x.get('summary') or x.get('snippet') or ''), reverse=True))
out=f'{RD}/03_targeted_search_results.jsonl'; err=f'{RD}/03_targeted_search_errors.jsonl'
pplx_sdk.utils.write_jsonl(out, rows); pplx_sdk.utils.write_jsonl(err, errors)
print(out); print('rows',len(rows),'errors',len(errors)); pplx_sdk.utils.print_preview_jsonl(out,limit=15,max_chars=1200)
