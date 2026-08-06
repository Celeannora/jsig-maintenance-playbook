# Microsoft Learn — Network Policy Server (NPS) as a RADIUS Server for 802.1X Authentication: Accounting Logs and Security Event IDs 6272/6273 (Excerpt)

- **Source URL:** https://learn.microsoft.com/en-us/troubleshoot/windows-client/networking/802-1x-authentication-issues-troubleshooting
- **Additional source URLs:** https://learn.microsoft.com/en-us/windows-server/networking/technologies/nps/nps-top
- **Retrieved:** 2026-08-05
- **Why included:** Supports AC-17 (Remote Access) / IA-2 / AU-6 (Audit Review) evidence for Windows Server Network Policy Server (NPS) acting as a RADIUS server for 802.1X device/wireless authentication — documents how NPS logs authentication outcomes to the Windows Security event log via Event ID 6272 (access granted) and Event ID 6273 (access denied), and how NPS RADIUS accounting logging is configured, for use in authentication review.

> **NOTE — THIS IS AN EXCERPT, NOT THE COMPLETE DOCUMENT.** The Microsoft Learn Network Policy Server documentation set spans many independent pages covering NPS deployment, RADIUS proxy configuration, connection/network policy configuration, and detailed accounting/log-file-format references. Only the sections describing NPS as a RADIUS server, its accounting/logging feature, and the Security-log Event ID 6272/6273 authentication review workflow are reproduced below. For the complete references, see the source URLs above.

---

## NPS as a RADIUS server

The Microsoft Learn "Network Policy Server overview" page describes the RADIUS server role directly:

> "**RADIUS server**. NPS performs centralized authentication, authorization, and accounting for wireless, authenticating switch, remote access dial-up, and virtual private network (VPN) connections. When you use NPS as a RADIUS server, you configure the following components:
> - Network access servers, such as wireless access points and VPN servers. You configure them as RADIUS clients in NPS.
> - Network policies that NPS uses to authorize connection requests.
> - RADIUS accounting. This component is optional. If you configure it, NPS logs accounting information to log files on the local hard disk or in a Microsoft SQL Server database."

On NPS as the Microsoft RADIUS implementation:

> "NPS is the Microsoft implementation of the RADIUS standard specified by the Internet Engineering Task Force (IETF) in Request for Comments (RFCs) 2865 and 2866. As a RADIUS server, NPS performs centralized connection authentication, authorization, and accounting for many types of network access. Examples of network access types include wireless, authenticating switch, dial-up, and VPN remote access, and router-to-router connections."

On the standard configuration wizard specifically for 802.1X:

> "With the standard configuration, wizards are provided to help you configure NPS for the following scenarios: ... RADIUS server for 802.1X wireless or wired connections."

## NPS logging (RADIUS accounting)

> "NPS logging is also called RADIUS accounting. You can configure NPS logging to meet your requirements whether NPS is used as a RADIUS server, proxy, or any combination of these configurations. To configure NPS logging, you must configure the events that you want to log and view with Event Viewer, and then determine which other information you want to log. Also, you must decide where to store user authentication and accounting information logs. The following options are available:
> - Text log files stored on the local computer
> - A SQL Server database on either the local computer or a remote computer"

*(Source: Microsoft Learn, Network Policy Server overview — https://learn.microsoft.com/en-us/windows-server/networking/technologies/nps/nps-top)*

---

## Reviewing NPS authentication outcomes: Security event log and Event IDs 6272 / 6273

The Microsoft Learn 802.1X authentication troubleshooting guide documents using the Windows Security event log on the NPS server as the primary source for reviewing authentication attempts:

> "Viewing NPS authentication status events in the Windows Security event log is one of the most useful troubleshooting methods to obtain information about failed authentications. NPS event log entries contain information about the connection attempt, including the name of the connection request policy that matched the connection attempt and the network policy that accepted or rejected the connection attempt."

**Specific event IDs for access review:**

> "Check the Windows Security event log on the NPS Server for NPS events that correspond to the rejected (event ID 6273) or the accepted (event ID 6272) connection attempts. In the event message, scroll to the bottom, and then check the Reason Code field and the text that's associated with it."

This confirms:
- **Event ID 6272** — logged in the Security event log on the NPS server for an **accepted**/granted connection attempt.
- **Event ID 6273** — logged in the Security event log on the NPS server for a **rejected**/denied connection attempt.

Both event types include a **Reason Code** field (with associated descriptive text) that explains why the connection attempt was accepted or rejected — this is the field reviewed when auditing 802.1X authentication activity.

### Confirming NPS audit policy is enabled (prerequisite for seeing both event types)

> "By default, NPS audit policy (event logging) for connection success and failure is enabled. If you find that one or both types of logging are disabled, use the following steps to troubleshoot."

**View current audit policy settings (run on the NPS server):**
```
auditpol /get /subcategory:"Network Policy Server"
```
"If both success and failure events are enabled, the output should be:"
```
System audit policy
Category/Subcategory Setting
Logon/Logoff
  Network Policy Server Success and Failure
```

**Enable NPS audit logging if disabled:**
```
auditpol /set /subcategory:"Network Policy Server" /success:enable /failure:enable
```

The same setting can also be managed via Group Policy: "Computer Configuration > Policies > Windows Settings > Security Settings > Advanced Audit Policy Configuration > Audit Policies > Logon/Logoff > Audit Network Policy Server."

### Related client-side and certificate logs

For wireless 802.1X clients, the guide also notes: "The WLAN AutoConfig operational log lists information and error events based on conditions detected by or reported to the WLAN AutoConfig service... On the client side, go to *Event Viewer (Local)\Applications and Services Logs\Microsoft\Windows\WLAN-AutoConfig/Operational* for wireless issues. For wired network access issues, go to *..\Wired-AutoConfig/Operational*." Most 802.1X failures are certificate-related, and "The CAPI2 event log is useful for troubleshooting certificate-related issues," though it is not enabled by default.

*(Source: Microsoft Learn, 802.1X authentication issues troubleshooting — https://learn.microsoft.com/en-us/troubleshoot/windows-client/networking/802-1x-authentication-issues-troubleshooting)*

---

*End of excerpt. Full source: https://learn.microsoft.com/en-us/troubleshoot/windows-client/networking/802-1x-authentication-issues-troubleshooting*
