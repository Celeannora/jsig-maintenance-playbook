# Microsoft Learn — AppLocker: Get-AppLockerPolicy -Effective and Test-AppLockerPolicy (Excerpt)

- **Source URL:** https://learn.microsoft.com/en-us/powershell/module/applocker/get-applockerpolicy?view=windowsserver2025-ps
- **Additional source URLs:** https://learn.microsoft.com/en-us/powershell/module/applocker/test-applockerpolicy?view=windowsserver2025-ps ; https://learn.microsoft.com/en-us/windows/security/application-security/application-control/app-control-for-business/applocker/test-an-applocker-policy-by-using-test-applockerpolicy
- **Retrieved:** 2026-08-05
- **Why included:** Supports CM-7 (Least Functionality) / application whitelisting evidence — `Get-AppLockerPolicy -Effective` for reviewing the effective (merged local + domain) application control policy applied on an endpoint, and `Test-AppLockerPolicy` for testing whether specific files would be allowed or denied to run under that policy.

> **NOTE — THIS IS AN EXCERPT, NOT THE COMPLETE DOCUMENT.** The Microsoft Learn AppLocker PowerShell module reference and the AppLocker conceptual documentation set contain many independent pages covering the full AppLocker cmdlet set (including `Get-AppLockerFileInformation`, `New-AppLockerPolicy`, `Set-AppLockerPolicy`) and policy design guidance. Only the `Get-AppLockerPolicy -Effective` and `Test-AppLockerPolicy` references, and the combined how-to procedure, are reproduced below. For the complete references, see the source URLs above.

---

## Get-AppLockerPolicy

`Get-AppLockerPolicy` (module: AppLocker) "gets the local, the effective, or a domain AppLocker policy."

**Syntax:**
```
# Local Policy (Default)
Get-AppLockerPolicy
    [-Local]
    [-Xml]
    [<CommonParameters>]

# Domain Policy
Get-AppLockerPolicy
    -Ldap <String>
    [-Domain]
    [-Xml]
    [<CommonParameters>]

# Effective Policy
Get-AppLockerPolicy
    [-Effective]
    [-Xml]
    [<CommonParameters>]
```

"The **Get-AppLockerPolicy** cmdlet retrieves the AppLocker policy from the local Group Policy Object (GPO), a specified GPO, or the GP-deployed effective policy on the computer. By default, the output is an **AppLockerPolicy** object. If the *Xml* parameter is used, then the output will be the AppLocker policy as an XML-formatted string."

**-Effective parameter:** "Gets the effective AppLocker policy on the local computer. The effective policy is the merge of the local AppLocker policy and any applied AppLocker domain policies on the local computer."

Note: "the Get-AppLockerPolicy cmdlet only functions with policies deployed via GP. It does not have any knowledge of the AppLocker CSP, so it will return incorrect data if the policy in place has been applied via the CSP."

**Example 3 — Get the effective policy and export it to a file:**
```
Get-AppLockerPolicy -Effective -Xml | Set-Content ('c:\temp\curr.xml')
```
"This example gets the effective policy on the computer, and then sends it in XML-format to the specified file on an existing path."

**Example 4 — Get and test an AppLocker policy in one pipeline:**
```
Get-AppLockerPolicy -Local | Test-AppLockerPolicy -Path C:\Windows\System32\*.exe -User Everyone
```
"This example gets the local AppLocker policy on the computer, and then tests the policy using the **Test-AppLockerPolicy** cmdlet to test whether the .exe files in C:\Windows\System32 will be allowed to run by the Everyone group."

*(Source: Microsoft Learn, Get-AppLockerPolicy — https://learn.microsoft.com/en-us/powershell/module/applocker/get-applockerpolicy?view=windowsserver2025-ps)*

---

## Test-AppLockerPolicy

`Test-AppLockerPolicy` "specifies the AppLocker policy to determine whether a list of files is allowed to run on the local computer for a specified user."

**Syntax (By Xml Policy — default parameter set):**
```
Test-AppLockerPolicy
    [-XmlPolicy] <String>
    -Path <System.Collections.Generic.List`1[System.String]>
    [-User <String>]
    [-Filter <System.Collections.Generic.List`1[Microsoft.Security.ApplicationId.PolicyManagement.PolicyDecision]>]
    [<CommonParameters>]
```

"To test AppLocker rules for a nested group, a representative member of the nested group should be specified for the *User* parameter." The `-Filter` parameter accepts `Allowed`, `AllowedByDefault`, `Denied`, or `DeniedByDefault`.

**Example 1 — Report if programs are allowed to run:**
```
Test-AppLockerPolicy -XMLPolicy C:\Policy.xml -Path c:\windows\system32\calc.exe, C:\windows\system32\notepad.exe -User Everyone
```
"This example reports if calc.exe and notepad.exe will be allowed to run for Everyone under the policy specified by C:\Policy.xml."

**Example 3 — List explicitly denied executables to a file:**
```
Get-AppLockerPolicy -Local | Test-AppLockerPolicy -Path C:\Windows\System32\*.exe -User contoso\saradavis -Filter Denied | Format-List -Property | Set-Content ('C:\temp\DeniedFiles.txt')
```
"This example gets the local AppLocker policy, uses the policy to determine which executables in C:\Windows\System32 that contoso\saradavis is explicitly denied access to run, and then redirects the list to a text file."

*(Source: Microsoft Learn, Test-AppLockerPolicy — https://learn.microsoft.com/en-us/powershell/module/applocker/test-applockerpolicy?view=windowsserver2025-ps)*

---

## Combined procedure: testing an AppLocker policy by using Test-AppLockerPolicy

The Microsoft Learn conceptual guide "Test an AppLocker policy by using Test-AppLockerPolicy" documents the end-to-end review workflow combining both cmdlets:

> "The **Test-AppLockerPolicy** Windows PowerShell cmdlet can be used to determine whether any of the rules in your rule collections block apps run on the local computer. Perform the following steps on any computer where the AppLocker policies are applied."

**Step 1 — Export the effective AppLocker policy:**
```
Get-AppLockerPolicy -Effective -XML > <PathofFiletoExport.XML>
```

**Step 2 — Test files in a target directory against the exported policy and export results to CSV:**
```
Get-ChildItem <DirectoryPathtoReview> -Filter <FileExtensionFilter> -Recurse | Convert-Path | Test-AppLockerPolicy -XMLPolicy <PathToExportedPolicyFile> -User <domain\username> -Filter <TypeofRuletoFilterFor> | Export-CSV <PathToExportResultsTo.CSV>
```

**Full worked example given on the page:**
```
PS C:\ Get-AppLockerPolicy -Effective -XML > C:\Effective.xml
PS C:\ Get-ChildItem 'C:\Program Files\Microsoft Office\' -filter *.exe -Recurse | Convert-Path | Test-AppLockerPolicy -XMLPolicy C:\Effective.xml -User contoso\zwie -Filter Denied,DeniedByDefault | Export-CSV C:\BlockedFiles.csv
```
"In the example, the effective AppLocker policy is exported to the file C:\Effective.xml." The second command then tests every `.exe` under the specified Microsoft Office directory against that exported effective policy for the user `contoso\zwie`, filtering to files that would be `Denied` or `DeniedByDefault`, and writes the results to `C:\BlockedFiles.csv` — this is the standard pattern for auditing whether the effective (currently enforced) policy on an endpoint behaves as intended.

*(Source: Microsoft Learn, Test an AppLocker policy by using Test-AppLockerPolicy — https://learn.microsoft.com/en-us/windows/security/application-security/application-control/app-control-for-business/applocker/test-an-applocker-policy-by-using-test-applockerpolicy)*

---

*End of excerpt. Full source: https://learn.microsoft.com/en-us/powershell/module/applocker/get-applockerpolicy?view=windowsserver2025-ps*
