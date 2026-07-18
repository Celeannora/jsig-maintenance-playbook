from pathlib import Path
import requests, openpyxl, json
urls={
 'poam':'https://www.fedramp.gov/resources/templates/FedRAMP-POAM-Template.xlsx',
 'conmon':'https://www.fedramp.gov/resources/templates/FedRAMP-Continuous-Monitoring-Deliverables-Template.xlsx',
 'sap':'https://www.fedramp.gov/resources/templates/FedRAMP-Security-Assessment-Plan-(SAP)-Template.docx',
 'ssp':'https://www.fedramp.gov/resources/templates/FedRAMP-SSP-Moderate-Baseline-Template.docx'
}
out=Path('/home/user/workspace/jsig-reference-scaffold/research/source_notes/downloads')
out.mkdir(parents=True, exist_ok=True)
summary={}
for k,u in urls.items():
    fn=out/(k+'_'+u.split('/')[-1].replace('%20','_'))
    r=requests.get(u, timeout=60)
    summary[k]={'url':u,'status':r.status_code,'content_type':r.headers.get('content-type'),'path':str(fn),'size':len(r.content)}
    if r.ok:
        fn.write_bytes(r.content)
        if fn.suffix.lower() in ['.xlsx','.xlsm']:
            wb=openpyxl.load_workbook(fn, data_only=True, read_only=True)
            sheets={}
            for ws in wb.worksheets:
                rows=[]
                for row in ws.iter_rows(min_row=1,max_row=min(ws.max_row or 1,12), values_only=True):
                    rows.append([str(x).strip() if x is not None else '' for x in row[:50]])
                # find likely header rows with many non-empty cells
                likely=[]
                for i,row in enumerate(rows, start=1):
                    if sum(bool(x) for x in row)>=4:
                        likely.append((i,row))
                sheets[ws.title]={'max_row':ws.max_row,'max_col':ws.max_column,'sample_rows':rows,'likely_header_rows':likely[:5]}
            summary[k]['sheets']=sheets
Path('/home/user/workspace/jsig-reference-scaffold/research/source_notes/fedramp_template_inspection.json').write_text(json.dumps(summary,indent=2))
print(json.dumps(summary,indent=2)[:10000])
