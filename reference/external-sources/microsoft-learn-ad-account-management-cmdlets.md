# Microsoft Learn — Active Directory PowerShell Cmdlets for Account Lifecycle Management: Get-ADUser, Disable-ADAccount, Set-ADUser, Remove-ADUser (Excerpt)

- **Source URL:** https://learn.microsoft.com/en-us/powershell/module/activedirectory/get-aduser?view=windowsserver2025-ps
- **Additional source URLs:** https://learn.microsoft.com/en-us/powershell/module/activedirectory/disable-adaccount?view=windowsserver2025-ps ; https://learn.microsoft.com/en-us/powershell/module/activedirectory/set-aduser?view=windowsserver2025-ps ; https://learn.microsoft.com/en-us/powershell/module/activedirectory/remove-aduser?view=windowsserver2025-ps
- **Retrieved:** 2026-08-05
- **Why included:** Supports AC-2 (Account Management) evidence for the native Active Directory PowerShell cmdlets used to review, disable, modify, and remove user accounts within required timeframes — `Get-ADUser` for account review/inventory, `Disable-ADAccount` for disabling accounts, `Set-ADUser` for modifying account attributes, and `Remove-ADUser` for account deletion.

> **NOTE — THIS IS AN EXCERPT, NOT THE COMPLETE DOCUMENT.** The Microsoft Learn ActiveDirectory PowerShell module reference contains many independent cmdlet pages covering the full account/object lifecycle (including `New-ADUser`, `Search-ADAccount`, `Enable-ADAccount`, `Set-ADAccountControl`, and more). Only the four cmdlets used for account review, disable, modify, and remove actions are reproduced below. For the complete references, see the source URLs above.

---

## Get-ADUser

`Get-ADUser` (module: ActiveDirectory) "gets a specified user object or performs a search to get multiple user objects."

**Syntax (Filter parameter set):**
```
Get-ADUser
    -Filter <String>
    [-AuthType <ADAuthType>]
    [-Credential <PSCredential>]
    [-Properties <String[]>]
    [-ResultPageSize <Int32>]
    [-ResultSetSize <Int32>]
    [-SearchBase <String>]
    [-SearchScope <ADSearchScope>]
    [-Server <String>]
    [<CommonParameters>]
```

**Syntax (Identity parameter set):**
```
Get-ADUser
    [-Identity] <ADUser>
    [-AuthType <ADAuthType>]
    [-Credential <PSCredential>]
    [-Partition <String>]
    [-Properties <String[]>]
    [-Server <String>]
    [<CommonParameters>]
```

"The *Identity* parameter specifies the Active Directory user to get. You can identify a user by its distinguished name (DN), GUID, security identifier (SID), or Security Account Manager (SAM) account name... To search for and retrieve more than one user, use the *Filter* or *LDAPFilter* parameters." By default, `Get-ADUser` "retrieves a default set of user object properties"; use `-Properties` (or `-Properties *`) to retrieve additional attributes needed for account review (e.g., `LastLogonDate`, `PasswordLastSet`, `Enabled`).

**Example 1 — Get all users in a container (account inventory/review):**
```
Get-ADUser -Filter * -SearchBase "OU=Finance,OU=UserAccounts,DC=FABRIKAM,DC=COM"
```
"This command gets all users in the container OU=Finance,OU=UserAccounts,DC=FABRIKAM,DC=COM."

**Example 5 — Get all enabled user accounts using an LDAP filter:**
```
Get-ADUser -LDAPFilter '(!userAccountControl:1.2.840.113556.1.4.803:=2)'
```
"This command gets all enabled user accounts in Active Directory using an LDAP filter." This pattern is used to enumerate currently-enabled accounts for periodic access review.

**Example 3 — Get all properties for a specified user:**
```
Get-ADUser -Identity ChewDavid -Properties *
```
Returns the full property set, including `Enabled`, for the specified user — used to confirm current account status during a review.

*(Source: Microsoft Learn, Get-ADUser — https://learn.microsoft.com/en-us/powershell/module/activedirectory/get-aduser?view=windowsserver2025-ps)*

---

## Disable-ADAccount

`Disable-ADAccount` "disables an Active Directory user, computer, or service account."

**Syntax:**
```
Disable-ADAccount
    [-WhatIf]
    [-Confirm]
    [-AuthType <ADAuthType>]
    [-Credential <PSCredential>]
    [-Identity] <ADAccount>
    [-Partition <String>]
    [-PassThru]
    [-Server <String>]
    [<CommonParameters>]
```

"The **Identity** parameter specifies the Active Directory user, computer service account, or other service account that you want to disable. You can identify an account by its distinguished name, GUID, security identifier (SID), or Security Accounts Manager (SAM) account name... For example, you can use the `Get-ADUser` cmdlet to retrieve a user account object and then pass the object through the pipeline to the `Disable-ADAccount` cmdlet."

**Example 1 — Disable an account by identity:**
```
Disable-ADAccount -Identity PattiFul
```
"This command disables the account with identity SAMAccountName `PattiFul`."

**Example 3 — Disable all accounts in an organizational unit (bulk disable, e.g. for timely offboarding):**
```
Get-ADUser -Filter 'Name -like "*"' -SearchBase "OU=Finance,OU=Users,DC=FABRIKAM,DC=COM" |
    Disable-ADAccount
```
"This command disables all accounts in the organizational unit `OU=Finance,OU=Users,DC=FABRIKAM,DC=COM`."

*(Source: Microsoft Learn, Disable-ADAccount — https://learn.microsoft.com/en-us/powershell/module/activedirectory/disable-adaccount?view=windowsserver2025-ps)*

---

## Set-ADUser

`Set-ADUser` "modifies the properties of an Active Directory user. You can modify commonly used property values by using the cmdlet parameters. You can set property values that are not associated with cmdlet parameters by using the **Add**, **Remove**, **Replace**, and **Clear** parameters."

**Syntax (selected, Identity parameter set — abridged to account-management-relevant parameters):**
```
Set-ADUser
    [-Identity] <ADUser>
    [-WhatIf]
    [-Confirm]
    [-AccountExpirationDate <DateTime>]
    [-Enabled <Boolean>]
    [-CannotChangePassword <Boolean>]
    [-ChangePasswordAtLogon <Boolean>]
    [-PasswordNeverExpires <Boolean>]
    [-Add <Hashtable>]
    [-Remove <Hashtable>]
    [-Replace <Hashtable>]
    [-Clear <String[]>]
    [-Credential <PSCredential>]
    [-Server <String>]
    [<CommonParameters>]
```

"The *Identity* parameter specifies the Active Directory user to modify... You can also use the **Get-ADUser** cmdlet to retrieve a user object and then pass the object through the pipeline to the **Set-ADUser** cmdlet." The **Enabled** parameter "Indicates whether an account is enabled... This parameter also sets the **ADS_UF_ACCOUNTDISABLE** flag of the Active Directory User Account Control (UAC) attribute."

**Example 3 — Set properties (attribute modification):**
```
Set-ADUser -Identity GlenJohn -Replace @{title="director";mail="glenjohn@fabrikam.com"}
```
"This command sets the specified user's **title** property to director and the **mail** property to glenjohn@fabrikam.com."

**Example 8 — Get a user and set a property via the pipeline:**
```
Get-ADUser -Identity "DavidChew" | Set-ADUser -Manager "ElisaDaugherty"
```
"This command modifies the **Manager** property for the DavidChew user. The command uses the **Get-ADUser** cmdlet to get the user DavidChew, and then passes the object to the current cmdlet by using the pipeline operator." This get-then-modify pipeline pattern is the standard approach for reviewing an account (`Get-ADUser`) and then applying required changes (`Set-ADUser`) within a single operation.

*(Source: Microsoft Learn, Set-ADUser — https://learn.microsoft.com/en-us/powershell/module/activedirectory/set-aduser?view=windowsserver2025-ps)*

---

## Remove-ADUser

`Remove-ADUser` "removes an Active Directory user."

**Syntax:**
```
Remove-ADUser
    [-WhatIf]
    [-Confirm]
    [-AuthType <ADAuthType>]
    [-Credential <PSCredential>]
    [-Identity] <ADUser>
    [-Partition <String>]
    [-Server <String>]
    [<CommonParameters>]
```

"The *Identity* parameter specifies the Active Directory user to remove. You can identify a user by its distinguished name (DN), GUID, security identifier (SID), or Security Account Manager (SAM) account name... For example, you can use the **Get-ADUser** cmdlet to retrieve a user object and then pass the object through the pipeline to the Remove-ADUser cmdlet."

**Example 1 — Remove a specified user:**
```
Remove-ADUser -Identity GlenJohn
```
"This command removes the user with SAM account name GlenJohn."

**Example 2 — Remove a filtered list of users (bulk cleanup of already-disabled accounts):**
```
Search-ADAccount -AccountDisabled | where {$_.ObjectClass -eq 'user'} | Remove-ADUser
```
"This command searches for any users that have disabled accounts and removes them."

**Note on confirmation prompting:** "By default, this cmdlet prompts for confirmation as it is defined with **High impact** and the default value of the **$ConfirmPreference** variable is **High**. To bypass prompting for confirmation before removal, you can specify `-Confirm:$False` when using this cmdlet."

*(Source: Microsoft Learn, Remove-ADUser — https://learn.microsoft.com/en-us/powershell/module/activedirectory/remove-aduser?view=windowsserver2025-ps)*

---

*End of excerpt. Full source: https://learn.microsoft.com/en-us/powershell/module/activedirectory/get-aduser?view=windowsserver2025-ps*
