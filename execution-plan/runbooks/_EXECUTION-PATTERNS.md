# Shared Execution Pattern Library

> **Read this before writing or using any role runbook.** Master Calendar tasks fall into a small number of recurring procedural shapes (confirm-a-monitor-ran, review-a-list, apply-an-update, run-a-test, revise-a-document, deliver-training, dispose-of-a-record, render-a-governance-decision). Rather than repeat a near-identical 6-step execution procedure dozens of times across `execution-plan/runbooks/<Role>.md` files — once per task, for every task a role touches — each role runbook's Task Index cites a **Pattern ID** (A–H) from this file, and states only the task-specific parameters that differ. This keeps the RACI matrix's [110 Master Calendar tasks](../RACI-MATRIX.md) genuinely actionable without 1,000+ lines of duplicated boilerplate. This mirrors the same "generate once, reference everywhere" principle documented in [`execution-plan/README.md`](../README.md#design-principles).
>
> Every pattern below fills in Sections 5 (Execution Steps) of the [10-section scaffold](../templates/AUDIT-ARTIFACT-TEMPLATE.md) generically. Sections 6–10 (Validation, Evidence Package, Findings and Exceptions, Remediation and Escalation, Closure) are likewise standardized once, at the bottom of this file, and referenced by every role runbook rather than repeated per task — the only things that differ per task are the Section 1–4 identity/cadence/RACI fields already captured in each role's Task Index table and in [`RACI-MATRIX.md`](../RACI-MATRIX.md).
>
> **Vendor-agnostic / locally-hosted only**, per the template: every step below uses generic terms ("local log management system," "local vulnerability scanner," "local ticketing/GRC system") — never a cloud or SaaS product name.

---

## Pattern A — Automated Monitoring / Scan Confirmation

Applies to tasks where an automated tool or sensor runs on its own schedule and the role's job is to confirm it ran and review what it found (e.g., malware scans, dashboard monitoring, audit-storage-capacity alerts, boundary-protection logs).

1. Confirm the automated tool/sensor executed on its scheduled cadence (per this task's Frequency in the Task Index). — Expected result: last-run timestamp is within one cycle of due date. — Capture: export or screenshot the tool's run-history/status view. — Stop/continue: if the tool did not run, stop and open a missed-cycle ticket in the local ticketing/GRC system before proceeding.
2. Review the tool's output/alert queue for the current cycle. — Expected result: no unreviewed alerts older than the cycle window. — Capture: export the alert list. — Stop/continue: continue to step 3 regardless of findings; findings are documented, not gated, at this step.
3. Triage each new alert/finding: confirm true positive vs. false positive using the finding's supporting log/scan data. — Expected result: every alert is dispositioned. — Capture: annotated alert list with disposition and rationale. — Stop/continue: if any true positive is CAT I, stop and escalate immediately per the Escalation block below before continuing routine triage.
4. For each true-positive finding, determine CAT (I/II/III) per the finding's own severity source (STIG CAT rating, CVSS-derived CAT per `execution-plan/templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md`, or organizational policy for non-STIG/CVE findings). — Expected result: every finding has an assigned CAT. — Capture: CAT assignment recorded in the finding record. — Stop/continue: continue.
5. File or update the corresponding POA&M/tracking entry for any open finding. — Expected result: every open finding has a tracking ID. — Capture: POA&M ID. — Stop/continue: continue.
6. Log cycle completion (date, reviewer, finding count, tracking IDs) in the repository location specified in the Task Index. — Expected result: cycle record filed. — Capture: the log entry itself. — Stop/continue: cycle complete.

## Pattern B — Manual Review of a List or Log

Applies to tasks where a person reviews an existing list, log, or record set against a baseline or policy (e.g., access lists, physical access logs, visitor records, privileged-account lists, audit records).

1. Pull the current list/log/record set for the review period. — Expected result: complete, unaltered export covering the full period since the last review. — Capture: the export file itself, with pull timestamp. — Stop/continue: if the export is incomplete (gap in coverage), stop and remediate the logging/collection gap before reviewing partial data.
2. Pull the baseline or policy the list is being reviewed against (e.g., prior-cycle approved list, personnel roster, access policy). — Expected result: current baseline in hand. — Capture: baseline document/version. — Stop/continue: continue.
3. Compare the current list against the baseline line by line; flag every addition, removal, and unexplained entry. — Expected result: a discrepancy list (may be empty). — Capture: the annotated comparison. — Stop/continue: continue regardless of discrepancy count.
4. For each discrepancy, determine whether it is expected (documented change) or unexplained (potential finding). — Expected result: every discrepancy is dispositioned with supporting justification or escalated as a finding. — Capture: disposition notes. — Stop/continue: if any unexplained discrepancy suggests unauthorized access or privilege, stop and escalate immediately per the Escalation block.
5. Update the baseline to reflect the newly reviewed-and-approved state. — Expected result: baseline version incremented. — Capture: new baseline file/version number. — Stop/continue: continue.
6. Log cycle completion in the repository location specified in the Task Index. — Expected result: cycle record filed. — Capture: the log entry. — Stop/continue: cycle complete.

## Pattern C — Update / Patch / Signature Refresh

Applies to tasks where something must be verified current against an authoritative source and updated if stale (e.g., malware-tool signatures, flaw remediation/patch status, cryptographic key rotation, security-relevant software/firmware updates).

1. Query the authoritative source (vendor/DISA/NVD advisory feed mirrored locally, or the local update-management tool) for the current required version/signature/key state. — Expected result: authoritative current-state value in hand. — Capture: the query result. — Stop/continue: continue.
2. Compare the authoritative current state against the deployed state. — Expected result: gap (if any) identified. — Capture: comparison record. — Stop/continue: if no gap, skip to step 5.
3. Apply the update through the organization's change-control process (per `execution-plan/ROLE-CROSSWALK.md`'s CCB routing where the update is configuration-relevant). — Expected result: update applied. — Capture: change-control ticket ID and applied-version confirmation. — Stop/continue: if the update requires an approved maintenance window not yet available, stop and document the compensating control/interim risk acceptance per `execution-plan/templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md` rather than leaving the gap silently open.
4. Verify the update took effect (re-query deployed state). — Expected result: deployed state now matches authoritative state. — Capture: post-update verification output. — Stop/continue: continue.
5. Log cycle completion (date, prior version, new version, verifier) in the repository location specified in the Task Index. — Expected result: cycle record filed. — Capture: the log entry. — Stop/continue: cycle complete.

## Pattern D — Test / Exercise

Applies to tasks that execute a planned test against a written procedure (e.g., backup restoration, contingency plan exercise, incident response exercise, information system recovery/reconstitution, fire-suppression test).

1. Pull the current, approved test plan/procedure for this exercise. — Expected result: current test plan in hand, version confirmed. — Capture: test plan version/date. — Stop/continue: if no current approved plan exists, stop — do not improvise an untested procedure; escalate the missing-plan gap first.
2. Execute the test plan step by step exactly as written, recording actual results against each expected result in the plan. — Expected result: every planned step executed with a recorded actual result. — Capture: step-by-step execution log. — Stop/continue: if a step fails in a way that risks the production environment, stop the test immediately and document the abort point.
3. Compare aggregate actual results against the plan's overall success criteria. — Expected result: pass/fail determination. — Capture: the comparison and determination. — Stop/continue: continue regardless of outcome.
4. Draft an after-action report: what worked, what didn't, root cause of any gap. — Expected result: AAR document. — Capture: the AAR file. — Stop/continue: continue.
5. For any gap identified, open a POA&M entry and assign a remediation owner and date. — Expected result: every gap has a tracking ID. — Capture: POA&M ID(s). — Stop/continue: continue.
6. File the test plan, execution log, and AAR in the repository location specified in the Task Index; update the plan itself if the test surfaced a procedural error in it. — Expected result: complete cycle package filed. — Capture: filed package. — Stop/continue: cycle complete.

## Pattern E — Documentation / Policy Review and Update

Applies to tasks that periodically revise a governing document (e.g., System Security Plan, Contingency Plan, Incident Response Plan, Configuration Management Plan, family policies/procedures, privacy notices/SORNs).

1. Pull the current approved version of the document and its associated control citations/ODPs. — Expected result: current version and version history in hand. — Capture: version number/date. — Stop/continue: continue.
2. Review the document against current control requirements, current system state, and any changes since the last review (organizational, technical, regulatory). — Expected result: a list of needed revisions (may be empty). — Capture: the review notes. — Stop/continue: continue regardless of whether revisions are needed — a no-change review still requires documented re-approval.
3. Draft revisions (or a no-change re-approval memo if none are needed). — Expected result: draft ready for routing. — Capture: the draft. — Stop/continue: continue.
4. Route the draft for required approval per its governing role (CCB for configuration-relevant plans; ISSM/AO/DAO per the document's own sign-off requirement). — Expected result: documented approval or rejection with rationale. — Capture: approval record/signature. — Stop/continue: if rejected, return to step 3; do not publish an unapproved revision.
5. Publish the new version and archive the superseded version per its retention requirement. — Expected result: new version live, prior version archived, not deleted. — Capture: both version files/locations. — Stop/continue: cycle complete.

## Pattern F — Training Delivery

Applies to tasks that deliver recurring training (e.g., annual security awareness refresher, role-based training, incident response training, contingency training).

1. Confirm the current-cycle training content is up to date against policy/threat landscape changes since the last delivery. — Expected result: content confirmed current or updated. — Capture: content version/date. — Stop/continue: continue.
2. Identify the full population required to complete this training cycle. — Expected result: complete roster. — Capture: roster export, with pull date. — Stop/continue: continue.
3. Schedule and deliver the training to the identified population. — Expected result: delivery completed. — Capture: delivery date(s) and method. — Stop/continue: continue.
4. Record completion status for every individual on the roster. — Expected result: completion roster with pass/incomplete status per person. — Capture: the completion roster. — Stop/continue: continue.
5. Follow up on every incomplete/non-completion with the individual's supervisor or the Personnel Security function; document the follow-up. — Expected result: every non-completion has a documented follow-up action and target date. — Capture: follow-up log. — Stop/continue: if a non-completion carries privileged-access implications, escalate per the Escalation block rather than waiting for the routine follow-up cycle.
6. File the completion roster in the repository location specified in the Task Index. — Expected result: cycle record filed. — Capture: the filed roster. — Stop/continue: cycle complete.

## Pattern G — Retention / Disposal

Applies to tasks governing record retention windows and disposal (e.g., audit record retention, incident record retention, PII retention/disposal, visitor record retention).

1. Identify all records that have passed their retention window per the applicable schedule (NARA, organizational records schedule, or the specific window cited in this task's Control ID(s)). — Expected result: a disposal candidate list (may be empty). — Capture: the candidate list with each record's age and applicable schedule citation. — Stop/continue: continue regardless of list size.
2. Verify no candidate record is under legal hold, active investigation, or open POA&M/incident reference. — Expected result: every candidate is cleared or excluded. — Capture: clearance check results. — Stop/continue: if any candidate cannot be cleared, remove it from the disposal list and re-check at the next cycle; do not dispose of anything not fully cleared.
3. Execute disposal (secure deletion or destruction per the record's classification/handling requirement) for all cleared candidates. — Expected result: disposal completed for every cleared candidate. — Capture: disposal method and confirmation. — Stop/continue: continue.
4. Log the disposal action (what, when, method, authorizer) in the repository location specified in the Task Index. — Expected result: disposal log entry filed. — Capture: the log entry. — Stop/continue: cycle complete.

## Pattern H — Governance / Authorization Decision

Applies to event-driven (not calendar-cadence) actions performed by governance-tier roles that do not appear as line items in the Master Calendar — e.g., an AO/DAO rendering an authorization decision, an Agency/Component Head issuing a SAP-establishment memorandum, a CCB rendering a change decision. See the role's own runbook section for the specific JSIG citation and trigger condition, since these vary by role and are documented individually rather than generically here.

1. Receive and log the complete decision package (assessment results, POA&M, supporting artifacts) from the submitting role. — Expected result: package logged with receipt date. — Capture: package inventory and receipt log. — Stop/continue: if the package is incomplete per its own required-artifacts list, stop and return it rather than rendering a decision on incomplete information.
2. Review the package against the decision's governing criteria (risk tolerance, control effectiveness, residual risk per NIST SP 800-37's accountability model). — Expected result: documented review findings. — Capture: review notes. — Stop/continue: continue.
3. Consult required parties per this role's RACI position (see `execution-plan/ROLE-CROSSWALK.md` and `RACI-MATRIX.md`) before finalizing. — Expected result: consultation documented. — Capture: consultation record. — Stop/continue: continue.
4. Render and document the decision (approve / approve with conditions / deny), with written rationale. — Expected result: signed decision record. — Capture: the signed decision. — Stop/continue: continue.
5. Distribute the decision to all Informed parties per the RACI position and file the decision record in the repository location specified in the role's runbook. — Expected result: decision distributed and filed. — Capture: distribution log and filed record. — Stop/continue: cycle/event complete.

---

## Standard Sections 6–10 (shared across every task in every role runbook, unless a task explicitly overrides one)

### 6. Validation

| Field | Value |
|---|---|
| Assessment Method | Examine (review the artifact/log produced by the Execution Steps above) and/or Test (re-perform a sample step independently) per NIST SP 800-53A |
| Expected Result | The cycle's artifact package (Section 7) exists, is complete per this task's Execution Steps, and is filed on or before its Due Date |
| Pass / Fail | Pass if the artifact package is complete and on time; Fail otherwise, triggering Section 9 |
| Reviewed By | The role's Reviewer/Approver per this role's RACI position (see Task Index) |

### 7. Evidence Package

| Field | Value |
|---|---|
| Artifact List | The specific capture items named in each Execution Step above for this task |
| Repository Path | The repository location specified in the Task Index for this task |
| Retention Period | Per this task's Control ID(s) citation, or the organization's records schedule if not control-specified |
| Chain-of-Custody Note | Evidence Owner (see Task Index RACI position) is responsible for the artifact package from capture through filing; no artifact is altered after filing without a logged correction |

### 8. Findings and Exceptions

Any true-positive finding identified during Execution Steps is CAT-rated and routed through `execution-plan/templates/VARIANCE-RISK-ACCEPTANCE-TEMPLATE.md` (for STIG or CVE/Nessus findings specifically) or an equivalent locally-defined exception record (for non-technical findings, e.g., a missed training completion or an unreviewed log gap) — never left undocumented. SLA days by CAT (from `execution-plan/templates/ESCALATION-MATRIX.md`): CAT I = 30 days, CAT II = 90 days, CAT III = 180 days.

### 9. Remediation and Escalation

| Field | Value |
|---|---|
| Escalation Trigger | Per `execution-plan/templates/ESCALATION-MATRIX.md` — CAT I escalates to AO/DAO, CAT II to ISSM, CAT III to ISSO, with the ISSM standing as a consulted reviewer at every tier |
| Approver | Per this role's Accountable position (see Task Index) |

### 10. Closure

| Field | Value |
|---|---|
| Reviewer Sign-Off | Recorded in the Validation record (Section 6) |
| Next Due Date | This task's Frequency (Task Index) advanced one cycle from the Actual Completion Date |
| Lessons Learned / Runbook Update Flag | If Execution Steps above did not match what was actually needed this cycle, flag this task's row in the role runbook for review and update this pattern (or the role's task-specific note) accordingly — do not silently work around a stale procedure |

---
*Referenced by every file in `execution-plan/runbooks/`. Do not duplicate these steps inside individual role runbooks — cite the Pattern ID (A–H) and this file's Standard Sections 6–10 instead.*
