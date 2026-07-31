import json, os, pplx_sdk
urls=[
 'https://www.fedramp.gov/legacy/playbook/csp/authorization/roles/',
 'https://www.fedramp.gov/resources/documents/rev4/REV_4_FedRAMP-SSP-Moderate-Baseline-Template.docx',
 'https://csrc.nist.gov/csrc/media/Projects/risk-management/documents/Additional%20Resources/NIST%20RMF%20Roles%20and%20Responsibilities%20Crosswalk.pdf',
 'https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-37r2.pdf',
 'https://advisera.com/27001academy/blog/2018/11/05/raci-matrix-for-iso-27001-implementation-project/',
 'https://www.tcsa.in/frameworks/iso-27001/clauses/5-3-organizational-roles-responsibilities-and-authorities',
 'https://www.tcsa.in/frameworks/iso-27001/controls/5-2-information-security-roles-and-responsibilities',
 'https://support.atlassian.com/jira-service-management-cloud/docs/get-started-with-playbooks/',
 'https://support.atlassian.com/jira-service-management-cloud/docs/set-up-an-approval-stage-for-a-request/',
 'https://www.servicenow.com/docs/r/security-management/vulnerability-response/t_CreateVulnSLA.html',
 'https://www.servicenow.com/docs/r/security-management/vulnerability-response/vulnerability-groups.html'
]
prompt='''Extract facts about role-assignment/RACI/responsibility matrices, security operations roles, task ownership, approvals, ticket fields, playbooks, SLAs, and reviewer/authorization responsibilities. Preserve exact role names, RACI definitions, template field names, and approval/escalation conventions. Concise bullets only.'''
res=pplx_sdk.content.fetch_many(urls, prompt=prompt)
records=[]
for row in res:
    d=dict(row.result) if getattr(row,'result',None) else {'url':str(row.spec),'error':str(row.error),'content':''}
    records.append(d)
out='/home/user/workspace/jsig-reference-scaffold/reference/research/source_notes/raci_notes.json'
open(out,'w').write(json.dumps(records,indent=2))
print(json.dumps({'count':len(records),'out':out},indent=2))
