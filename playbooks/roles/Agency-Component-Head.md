# Agency/Component Head — Operational Playbook

> Network-agnostic role playbook. Applies regardless of network architecture, classification enclave, or technology stack. Source: [JSIG §1.5.1](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md), cross-referenced to [MAINTENANCE-PLAN.md](../../MAINTENANCE-PLAN.md) and the [JSIG control-families INDEX](../../reference/JSIG/control-families/INDEX.md).

## 1. Role Summary

The Agency/Component Head (DoD SAP Component Head) bears ultimate responsibility for mission accomplishment and execution of business functions, and hence for adequately mitigating risks to the element, its individuals, and the Nation. The Component Head appoints an Authorizing Official (AO/DAA) for all DoD Information Systems (IS) and Platform IT (PIT) systems under their purview and ensures all such systems are authorized in accordance with DoDM 5205.07-V1 and the JSIG. Each component also establishes, in writing, a SAP senior authorizing official who serves as the component's lead in DoD-level SAP cybersecurity strategy, policy, and investment forums, and who is the only authorized waiver authority for non-tailorable controls ([JSIG §1.5.1](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).

## 2. JSIG-Defined Responsibilities (near-verbatim, JSIG §1.5.1)

- Bears ultimate responsibility for mission accomplishment and execution of business functions, and for adequately mitigating risks to the element, its individuals, and the Nation.
- Establishes priorities to ensure collaboration and information-sharing sufficient to ensure both element and DoD SAP Community-wide mission accomplishment.
- Appoints a DAA [AO] for all DoD IS and PIT systems under their purview (per DoDD 5205.07 Enclosure 5) and ensures all DoD IS and PIT systems are authorized.
- Ensures DoD SAP systems are authorized in accordance with DoDM 5205.07-V1 and the JSIG.
- Establishes in writing the component's SAP senior authorizing official, who serves as the component lead at DoD-level SAP cybersecurity strategy, policy, and (as appropriate) investment forums.
- The SAP senior authorizing official (designated by the Component Head) is the only authorized waiver authority for non-tailorable controls.
- Reference: DoDM 5205.07-V1, Enclosure 2, for responsibilities of DoD Component Heads and OSD Principal Staff Assistants (PSA) with cognizant authority (CA) and oversight authority (OA) over SAPs.

*(JSIG §1.5.1 is a narrative paragraph rather than a lettered list; the bullets above preserve its content in near-verbatim form.)*

## 3. Daily/Recurring Operational Duties

The Component Head does not perform day-to-day control operations; its recurring duties are executive/appointment and program-oversight actions that anchor the entire control structure. The following is derived/synthesized from the [MAINTENANCE-PLAN.md roles table](../../MAINTENANCE-PLAN.md#2-roles--responsibilities) and family cadence tables — it is not verbatim JSIG text.

| Recurring Duty | Cadence | Related Control Family/ID(s) | Basis |
|---|---|---|---|
| Confirm AO appointment(s) remain current and properly documented for every IS/PIT system under purview | Annual, or upon AO turnover | Program-level; underlies CA-6 authorization decisions | Derived from JSIG §1.5.1 AO-appointment duty; no numeric cadence in JSIG, annual default per [MAINTENANCE-PLAN §1](../../MAINTENANCE-PLAN.md#1-executive-summary) documentation-review pattern |
| Reaffirm/designate the component SAP senior authorizing official and non-tailorable-control waiver authority | Annual, or upon personnel change | Governs waivers to non-tailorable controls (e.g., AC-6(1), SA-22, SC-28) | [Control-families INDEX — non-tailorable controls](../../reference/JSIG/control-families/INDEX.md) |
| Review component-wide authorization status roll-up (systems authorized vs. pending/expired) | Aligned with PM-5 monthly inventory / PM-4 monthly POA&M rollup cadence, escalated to Component Head periodically (recommend quarterly executive briefing) | PM-4, PM-5 | [MAINTENANCE-PLAN §3.18 PM](../../MAINTENANCE-PLAN.md) |
| Set/refresh component risk-management and resourcing priorities for SAP cybersecurity | Annual, aligned with RA-3 organizational risk assessment cycle and PM-9 risk management strategy review | RA-3, PM-9 | [MAINTENANCE-PLAN §3.14 RA](../../MAINTENANCE-PLAN.md), [§3.18 PM](../../MAINTENANCE-PLAN.md) |
| Ensure adequate resourcing/budget for IS security is planned and allocated across the component | Annual budget cycle | Feeds AO responsibility "ensure organizations plan, budget, allocate, and spend adequate resources" ([JSIG §1.5.5](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)) | Derived; no JSIG numeric cadence |

## 4. Coordination Interfaces

- **Authorizing Official (AO):** appoints the AO for every DoD IS/PIT system; receives escalations on unacceptable-risk determinations and non-tailorable-control waiver requests ([JSIG §1.5.1](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md), [§1.5.5](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **Risk Executive (Function) (REF):** relies on the REF for organization-wide, aggregated risk visibility that informs component priorities ([JSIG §1.5.2](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **CIO:** receives the CIO's annual report on overall information security program effectiveness, including remedial-action progress ([JSIG §1.5.3](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- **OSD Principal Staff Assistants (PSA) with cognizant/oversight authority:** coordinates on SAP cybersecurity strategy, policy, and investment per DoDM 5205.07-V1 Enclosure 2.
- **SAP senior authorizing official (designated by the Component Head):** the sole waiver authority for non-tailorable controls; Component Head appoints and holds this individual accountable.

## 5. Key Artifacts Owned/Produced

- Written appointment memoranda for the AO(s) and the component SAP senior authorizing official ([JSIG §1.5.1](../../reference/JSIG-source/section-1.5-roles-and-responsibilities.md)).
- Component-level SAP cybersecurity strategy, policy, and investment planning documentation.
- Non-tailorable-control waiver determinations issued through the designated senior authorizing official.
- Component-wide authorization status roll-up (consumes PM-4/PM-5 outputs; see [MAINTENANCE-PLAN §3.18](../../MAINTENANCE-PLAN.md)).
- Resourcing/budget decisions supporting IS security across the component.
