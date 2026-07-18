import json, os
import pplx_sdk

outdir='/home/user/workspace/jsig-reference-scaffold/research/source_notes'
os.makedirs(outdir, exist_ok=True)
urls=[
 'https://sre.google/workbook/on-call/',
 'https://sre.google/sre-book/introduction/',
 'https://sre.google/workbook/part-II-practices/',
 'https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/ops_ready_to_support_use_runbooks.html',
 'https://response.pagerduty.com/',
 'https://github.com/PagerDuty/incident-response-docs/blob/master/docs/during/security_incident_response.md',
 'https://github.com/PagerDuty/incident-response-docs/blob/master/docs/about.md',
 'https://www.atlassian.com/incident-management/incident-response/how-to-create-an-incident-response-playbook',
 'https://support.atlassian.com/jira-service-management-cloud/docs/playbook-templates-for-jira-service-management/',
 'https://www.servicenow.com/docs/r/security-management/security-incident-response/use-the-playbook.html',
 'https://learn.microsoft.com/en-us/security/operations/incident-response-playbooks',
 'https://learn.microsoft.com/en-us/security/operations/incident-response-planning',
 'https://csrc.nist.gov/pubs/sp/800/53/a/r5/final',
 'https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-53Ar5.pdf',
 'https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-53r5.pdf',
 'https://nvlpubs.nist.gov/nistpubs/legacy/sp/nistspecialpublication800-137.pdf',
 'https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-128.pdf',
 'https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-40r4.pdf',
 'https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-61r2.pdf',
 'https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-34r1.pdf',
 'https://www.fedramp.gov/resources/documents/Continuous_Monitoring_Playbook.pdf',
 'https://www.fedramp.gov/resources/documents/CSP_POAM_Template_Completion_Guide.pdf',
 'https://www.fedramp.gov/resources/documents/rev4/REV_4_CSP_Annual_Assessment_Guidance.pdf',
 'https://www.irs.gov/pub/irs-pdf/p1075.pdf',
 'https://www.irs.gov/privacy-disclosure/meeting-irs-safeguards-audit-requirements',
 'https://www.irs.gov/pub/safeguard/iir-template.pdf',
 'https://www.irs.gov/privacy-disclosure/safeguards-technical-assistance-memorandum-stax-audit-logs',
 'https://dl.dod.cyber.mil/wp-content/uploads/stigs/pdf/U_STIG_Viewer_3-x_User_Guide_V1R5.pdf',
 'https://www.dcsa.mil/Portals/91/Documents/CTP/special/DoD_SAP_PM_Handbook_JSIG_RMF_2015Aug11.pdf',
 'https://www.dcsa.mil/Portals/91/Documents/CTP/special/SAP_RMF_Checklist_17Nov2017.docx',
 'https://www.esd.whs.mil/Portals/54/Documents/DD/issuances/dodi/851001p.pdf',
 'https://dodcio.defense.gov/Portals/0/Documents/Library/DoDCIO-ContinuousAuthorizationImplementationGuide.pdf'
]
prompt='''Extract only information relevant to operational runbook/SOP structure, recurring security/compliance task execution, audit evidence/artifacts, POA&M or remediation records, RACI/role responsibilities, task/ticket/playbook templates, escalation/exception handling, cadence, and fields captured. Use concise bullets. Preserve named fields, phases, roles, tables, frequencies, severity/SLA values, and template headings when present. Include no unsupported commentary.'''
res = pplx_sdk.content.fetch_many(urls, prompt=prompt)
records=[]
for row in res:
    if isinstance(row, dict):
        ok=row.get('ok'); result=row.get('result'); err=row.get('error')
    else:
        ok=getattr(row,'ok',None); result=getattr(row,'result',None); err=getattr(row,'error',None)
    if result is None:
        d={'url': str(getattr(row,'spec',{})), 'title': None, 'content': '', 'hostname': 'error', 'error': str(err)}
    else:
        d=result if isinstance(result, dict) else dict(result)
        d['_fanout_ok']=ok
        d['_fanout_error']=str(err)
    records.append(d)
with open(os.path.join(outdir,'fetched_source_notes.json'),'w') as f:
    json.dump(records,f,indent=2)
for i,d in enumerate(records):
    safe=''.join(c if c.isalnum() else '_' for c in (d.get('hostname') or 'source')+'_'+str(i))[:80]
    with open(os.path.join(outdir,safe+'.txt'),'w') as f:
        f.write('URL: '+d.get('url','')+'\nTITLE: '+str(d.get('title',''))+'\nERROR: '+str(d.get('error',''))+'\n\n')
        f.write(d.get('content') or '')
print(json.dumps({'count':len(records),'out':os.path.join(outdir,'fetched_source_notes.json')}, indent=2))
