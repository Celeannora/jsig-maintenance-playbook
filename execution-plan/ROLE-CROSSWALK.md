# Role Crosswalk: Operational Titles → JSIG §1.5 Formal Roles

## Purpose

[MAINTENANCE-PLAN.md §4](../MAINTENANCE-PLAN.md#4-master-consolidated-calendar) assigns each of the 110 recurring tasks to a **operational job title** (e.g., "System Administrator," "Facility Security Officer") because that is how real DoD/IC SAP programs actually staff these functions day to day. [JSIG §1.5](../reference/JSIG-source/section-1.5-roles-and-responsibilities.md), however, formally enumerates only **17 named roles**. This document is the audit-defensible bridge between the two: it states, for every operational title used in the master calendar, which JSIG-formal role is accountable for it being done, and which role typically executes it hands-on. Every task runbook in `execution-plan/runbooks/` cites this crosswalk instead of re-deriving the mapping.

This mapping reflects standard DoD/IC SAP staffing practice and is **not itself a verbatim JSIG requirement** — organizations may assign these functions differently in their appointment letters. Treat this as the default assumption; if your organization's appointment letters differ, update this file first, then propagate the change to affected runbooks.

## Crosswalk table

| Operational Title (used in master calendar) | JSIG §1.5 Formal Role (Accountable) | JSIG §1.5 Formal Role (Typically Executes) | Basis |
|---|---|---|---|
| System Administrator (SA) | ISSM | Privileged User (acting as SA under ISSO technical supervision) | JSIG explicitly names "System Administrators (SA)" as a defined acronym/operational role the ISSM must ensure performs monitoring duties ([JSIG §1.5.14(g)](../reference/JSIG-source/section-1.5-roles-and-responsibilities.md); [Appendix B](../reference/JSIG/appendices/APPENDIX-B-ACRONYMS.md)). SAs hold elevated/privileged access, so they fall under the JSIG "Privileged Users" role definition for day-to-day execution, with the ISSO providing direct technical oversight and the ISSM holding ultimate accountability. |
| Network Administrator | ISSM | Privileged User (acting as NA under ISSO technical supervision) | Same reasoning as System Administrator — network administration is a privileged technical function performed under ISSO/ISSM security oversight; JSIG does not separately enumerate "Network Administrator" but treats network-security-relevant duties as ISSO/ISSM responsibilities delegated to privileged technical staff. |
| ISSO / SOC analyst | ISSO | ISSO | Direct JSIG role ([JSIG §1.5.15](../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)). "SOC analyst" denotes the individual contributor performing ISSO-delegated continuous-monitoring tasks where staffing includes a security operations center. |
| Facility Security Officer (FSO) | PSO | PSO (or ISSM where no separate FSO/PSO billet exists) | JSIG assigns physical/environmental and facility-security coordination to the [Program Security Officer (PSO)](../reference/JSIG-source/section-1.5-roles-and-responsibilities.md) role, which per [DoDM 5205.07](../reference/JSIG-source/section-1.5-roles-and-responsibilities.md) is the SAPF/facility security authority. "FSO" is the common personnel-security/industrial-security title for this function; where a program has no dedicated PSO billet, the ISSM inherits PE-family duties. |
| Personnel Security Officer | PSO | PSO | Personnel security (clearance verification, need-to-know, access agreements) is a core PSO function under DoDM 5205.07 SAP personnel security policy, coordinated with the ISSM/ISSO per [JSIG §1.5.15(e)](../reference/JSIG-source/section-1.5-roles-and-responsibilities.md). |
| Privacy Officer | Information Owner/Steward | Information Owner/Steward (or a dedicated privacy office where the organization has one) | JSIG Appendix J privacy control families (AP, AR, DI, DM, IP, SE, TR, UL) place data-lifecycle and privacy-notice responsibilities with the party who establishes policy governing specific information — the [Information Owner/Steward](../reference/JSIG-source/section-1.5-roles-and-responsibilities.md) role. Larger organizations frequently formalize this as a dedicated Privacy Officer / Senior Agency Official for Privacy (SAOP)-equivalent billet; where none exists, the Information Owner/Steward is accountable by default. |
| Training Manager | ISSM | ISSM (or a delegated training-office function) | Development and implementation of the security education/training/awareness program is an explicit ISSM duty ([JSIG §1.5.14(o)](../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)). "Training Manager" denotes the individual contributor to whom the ISSM delegates day-to-day training-program administration. |
| CCB Chair | ISSM | ISSM or ISO (organization-dependent) | JSIG makes the ISSM a voting CCB member with veto authority ([JSIG §1.5.14(q)](../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)); the ISSO may also serve if the ISSM delegates that seat ([JSIG §1.5.15(h)](../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)). Many organizations designate the ISO as CCB chair since the ISO owns overall system lifecycle; this crosswalk defaults CCB-chair accountability to the ISSM given its explicit veto authority, but organizations should record their actual designation in their CCB charter. |
| IR Team Lead | ISSM | ISSO (day-to-day) / ISSM (escalation and reporting authority) | Incident handling and reporting to the ISSM is an explicit ISSO duty ([JSIG §1.5.15(f)](../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)); the ISSM ensures proper measures are taken when an incident is discovered ([JSIG §1.5.14(m)](../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)). "IR Team Lead" denotes whoever the ISSO/ISSM designates to run the day-to-day incident-response function, which may be the ISSO personally on smaller programs. |
| Data Owner | Information Owner/Steward | Information Owner/Steward | Direct JSIG role — "Data Owner" is the common shorthand for [Information Owner/Steward](../reference/JSIG-source/section-1.5-roles-and-responsibilities.md). |
| SCA / SCAR | SCA | SCA | Direct JSIG role, Security Control Assessor ([JSIG §1.5](../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)). "SCAR" (Security Control Assessor Representative) denotes an SCA team member acting under the lead SCA's authority. |

## Which of the 17 role playbooks absorbs which operational-title tasks

| JSIG §1.5 Role Playbook | Operational titles it absorbs for task-runbook purposes |
|---|---|
| [ISSM](../playbooks/roles/ISSM.md) | Training Manager, CCB Chair (default), IR Team Lead (escalation authority), ISSM-direct tasks, accountability for System/Network Administrator and Facility/Personnel Security Officer output |
| [ISSO](../playbooks/roles/ISSO.md) | ISSO / SOC analyst, IR Team Lead (day-to-day execution) |
| [Privileged Users](../playbooks/roles/Privileged-Users.md) | System Administrator (SA), Network Administrator |
| [PSO](../playbooks/roles/PSO.md) | Facility Security Officer, Personnel Security Officer |
| [Information Owner/Steward](../playbooks/roles/Information-Owner-Steward.md) | Data Owner, Privacy Officer (default, absent a dedicated privacy office) |
| [SCA](../playbooks/roles/SCA.md) | SCA / SCAR |
| All other roles (Agency/Component Head, Risk Executive Function, CIO, CISO, AO, DAO, CCP, ISO, ISSE, MBO, General Users) | No operational-title absorption needed — task ownership maps directly to the JSIG-named role. |

## How to use this file

1. Every task runbook in `execution-plan/runbooks/<Role>.md` states its **JSIG-formal Accountable role** and **typical Executing role** using this table.
2. If your organization staffs these functions differently (e.g., a dedicated Privacy Officer billet, a separate CCB Secretariat), update this file's mapping and note the change in [PROGRESS.md](../PROGRESS.md) — do not silently diverge in individual runbooks.
3. The [Master RACI Matrix](RACI-MATRIX.md) is generated directly from this crosswalk plus the master calendar; regenerate it if you change this mapping.
