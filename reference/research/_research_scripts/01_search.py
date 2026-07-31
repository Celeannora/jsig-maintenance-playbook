import pplx_sdk, json, os
RD='/home/user/workspace/jsig-reference-scaffold/reference/research/_intermediate'
os.makedirs(RD, exist_ok=True)
queries = [
    'JSIG 2016 NIST 800-53 maintenance controls',
    'NIST SP 800-137 continuous monitoring frequencies',
    'NIST SP 800-40 patch management remediation timelines',
    'DISA STIG release quarterly schedule',
    'DISA IAVM vulnerability compliance timelines Category I II',
    'FedRAMP continuous monitoring monthly vulnerability scans POA&M',
    'FedRAMP continuous monitoring annual assessment contingency incident response testing',
    'CMS ARS audit log review frequency account review',
    'CMS ARS vulnerability scan frequency POA&M review',
    'IRS Publication 1075 audit log review frequency access review',
    'DoD STIG audit log review weekly monthly',
    'RMF continuous monitoring strategy schedule template NIST 800-53',
    'system security plan maintenance schedule NIST 800-53 template',
    'NIST 800-53 control AU-6 audit review frequency implementation',
    'NIST 800-53 CP-4 contingency plan testing frequency annual',
    'NIST 800-53 IR-3 incident response testing frequency annual',
    'NIST 800-53 CA-7 continuous monitoring schedule',
    'NIST 800-53 CM-6 configuration settings STIG quarterly',
    'NIST 800-53 MA-2 controlled maintenance schedule plan',
    'NIST 800-53 PE physical access review frequency'
]
raw = pplx_sdk.search.web_many(queries, limit_per_query=8, concurrency=5)
results, errors = pplx_sdk.utils.partition(raw, lambda r: r.ok)
rows = pplx_sdk.utils.flatten_fanout_rows(results)
rows = pplx_sdk.utils.dedup_by_url(sorted(rows, key=lambda x: len(x.get('summary') or x.get('snippet') or ''), reverse=True))
out=f'{RD}/01_web_search_results.jsonl'
err=f'{RD}/01_web_search_errors.jsonl'
pplx_sdk.utils.write_jsonl(out, rows)
pplx_sdk.utils.write_jsonl(err, errors)
print(out)
print('rows', len(rows), 'errors', len(errors))
pplx_sdk.utils.print_preview_jsonl(out, limit=10, max_chars=1200)
