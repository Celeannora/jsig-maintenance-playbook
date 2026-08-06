# Microsoft Learn — Native PKI/Certificate Management Tools: certutil, the PowerShell Cert: Drive, and Test-Certificate (Excerpt)

- **Source URL:** https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/certutil (certutil); https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.security/about/about_certificate_provider?view=powershell-7.6 (PowerShell Certificate provider / `Cert:` drive and `Get-ChildItem`); https://learn.microsoft.com/en-us/powershell/module/pki/test-certificate?view=windowsserver2025-ps (`Test-Certificate` cmdlet)
- **Retrieved:** 2026-08-05
- **Why included:** Supports JSIG SC-17 (public key infrastructure certificates) and IA-5 (authenticator/credential management) claims. These are Microsoft's official, currently-published Learn documentation pages for the three native, vendor-agnostic Windows tools this repository references for independently reviewing certificate store contents, expiration, and chain/revocation validity without relying on a third-party PKI console: the `certutil.exe` command-line tool, the PowerShell `Cert:` drive exposed by the Certificate provider (queried via `Get-ChildItem`), and the `Test-Certificate` cmdlet.

> **NOTE — THIS IS AN EXCERPT, NOT THE COMPLETE DOCUMENT.** `certutil` alone documents dozens of verbs covering full CA administration (backup/restore, database management, CRL publishing, key recovery, and more); only the verbs and switches relevant to inspecting certificate stores, dumping/verifying certificates and chains, and expiration/date-related functionality are reproduced below. The PowerShell Certificate-provider and `Test-Certificate` sections are limited to `Cert:`-drive navigation, `Get-ChildItem` usage for listing/filtering certificates (including expiration filtering), and `Test-Certificate` syntax/examples. Full parameter reference tables, CA-configuration verbs, and unrelated cmdlet documentation are not reproduced. For complete documentation, see the source URLs above.

---

## `certutil` — Certificate Store and Chain Verification

`Certutil.exe` is a command-line program installed as part of Certificate Services. It can display CA configuration information, configure Certificate Services, back up/restore CA components, and **verify certificates, key pairs, and certificate chains**. Available parameters can be listed with `certutil -?`; complete help including hidden options is shown with `certutil -v -uSAGE` (case-sensitive).

### Certificate store commands

| Command | Syntax | Description |
|---|---|---|
| `-store` | `certutil [options] -store [CertificateStoreName [CertId [OutputFile]]]` | Dumps the certificate store. Options: `[-f] [-Enterprise] [-user] [-GroupPolicy] [-Silent] [-split] [-dc DCName]` |
| `-viewstore` | `certutil [options] -viewstore [CertificateStoreName [CertId [OutputFile]]]` | Dumps the certificate store (view). |
| `-verifystore` | `certutil [options] -verifystore CertificateStoreName [CertId]` | Verifies a certificate in the specified store. Options: `[-Enterprise] [-user] [-GroupPolicy] [-Silent] [-split] [-dc DCName] [-t Timeout]` |
| `-enumstore` | `certutil [options] -enumstore [\\MachineName]` | Enumerates certificate stores. |
| `-addstore` / `-delstore` | `certutil [options] -addstore CertificateStoreName InFile` / `-delstore CertificateStoreName certID` | Adds/deletes a certificate from a store. |
| `-exportPFX` / `-importPFX` | `certutil [options] -exportPFX [CertificateStoreName] CertId PFXFile [Modifiers]` | Exports/imports certificates and private keys. |

Store-selection switches: `-user` (user store instead of machine store), `-enterprise`, `-service`, `-grouppolicy`, `-dc DCName`, `-f` (force overwrite), `-Silent`, `-split` (split embedded ASN.1 elements into files). Example store names include `My`, `CA` (default), `Root`. `CertId` match tokens include serial number, SHA-1 hash, numeric certificate/CRL/CTL index, public key, subject Common Name, e-mail address, UPN/DNS name, and more.

**Performance note:** `-store` performance degrades when a store has more than 10 certificates or when a `CertId` is specified (because it is matched against every listed identifier type for every certificate). Microsoft recommends PowerShell commands instead when performance matters, since they match only the specified certificate type.

### `-dump`

```text
certutil [options] [-dump]
certutil [options] [-dump] File
```

Dumps configuration information or files. If `certutil` is run on a non-CA machine with no other parameters, it defaults to `-dump`.

### `-verify` — certificate, CRL, and chain verification

```text
certutil [options] -verify CertFile [ApplicationPolicyList | - [IssuancePolicyList]] [Modifiers]
certutil [options] -verify CertFile [CACertFile [CrossedCACertFile]]
certutil [options] -verify CRLFile CACertFile [IssuedCertFile]
certutil [options] -verify CRLFile CACertFile [DeltaCRLFile]
```

Verifies a certificate, a CRL, or a certificate chain. If `CACertFile` is not specified, the full chain is built and verified against `CertFile`. Modifiers: `Strong` (strong signature verification), `MSRoot` (must chain to a Microsoft root), `MSTestRoot`, `AppRoot`, `EV` (enforce Extended Validation policy). `-urlfetch` retrieves and verifies AIA certificates and CDP CRLs; `-sslpolicy ServerName` performs SSL policy matching; `-t Timeout` sets the URL fetch timeout in milliseconds.

### Certificate/chain retrieval and key verification

- `-ca.cert OutCACertFile [Index]` — retrieves the CA's certificate.
- `-ca.chain OutCACertChainFile [Index]` — retrieves the CA's certificate chain.
- `-verifykeys [KeyContainerName CACertFile]` — verifies a public/private key set (local CA/local keys only); with no arguments, verifies each signing CA certificate against its private key.

### Expiration- and validity-related functionality

Certutil does **not** document a single dedicated "check expiration" switch. Relevant date/expiration functionality includes:

- `-view` / `-db` support `-restrict RestrictionList`, where restrictions can include date expressions such as `Date[+|-dd:hh]` or `now+dd:hh` (e.g., `-restrict requestID>=37,requestID<40 -out requestID,disposition`).
- `-deleterow RowId | Date [Request | Cert | Ext | Attrib | CRL]` — e.g., `certutil -deleterow 1/22/2001 cert` deletes all certificates that expired by that date (dates use `mm/dd/yyyy` format).
- `-sign` supports changing certificate/CRL validity periods via a `StartDate [+|-dd:hh]` argument; `never` specifies no expiration for CRLs.
- `-CRL [dd:hh | republish] [delta]` sets/republishes CRL validity periods.
- `-revoke SerialNumber [Reason]` revokes a certificate, with reasons including `CRL_REASON_KEY_COMPROMISE`, `CRL_REASON_CA_COMPROMISE`, `CRL_REASON_SUPERSEDED`, `CRL_REASON_CESSATION_OF_OPERATION`, etc.
- `-isvalid SerialNumber | CertHash` — displays the disposition of a certificate.
- `-URL InFile | URL` and `-URLcache [URL | CRL | * [delete]]` — verify certificate/CRL URLs and manage the URL cache.

### General switches relevant to certificate review

`-v` (verbose), `-out ColumnList`, `-restrict RestrictionList`, `-urlfetch`, `-t Timeout`, `-split`, `-f`, `-Silent`, `-user`, `-Enterprise`, `-service`, `-GroupPolicy`, `-dc DCName`, `-config Machine\CAName`, `-sslpolicy ServerName`, `-privatekey`, `-cert CertId`, `-seconds`, `-gmt`.

## PowerShell `Cert:` Drive and `Get-ChildItem`

The PowerShell **Certificate provider** exposes X.509 certificate stores and certificates through the `Cert:` drive, a hierarchical namespace of certificate stores and certificates on the computer. It supports `Get-Location`, `Set-Location`, `Get-Item`, `Get-ChildItem`, `Invoke-Item`, `Move-Item`, `New-Item`, `Remove-Item`, `Get-ItemProperty`, `Set-ItemProperty`, `Clear-ItemProperty`, `Get-AuthenticodeSignature`, and `Set-AuthenticodeSignature`. Store locations are `CurrentUser` and `LocalMachine`; certificates are identified by their **thumbprints**, with paths structured as `Cert:\<StoreLocation>\<StoreName>\<CertificateThumbprint>` (e.g., `Cert:\LocalMachine\My\52A149D0393CE8A8D4AF0B172ED667A9E3A1F44E`).

### Listing certificate store contents

```powershell
Set-Location Cert:
Set-Location -Path LocalMachine\Root
Get-ChildItem -Path Cert:\CurrentUser\
Get-ChildItem -Path Cert: -Recurse
```

### Filtering with `Get-ChildItem` provider parameters

| Parameter | Function |
|---|---|
| `CodeSigningCert` | Certificates with `Code Signing` in `EnhancedKeyUsageList`. |
| `DnsName` | Certificates matching a domain name/pattern in `DNSNameList` (wildcards allowed). |
| `DocumentEncryptionCert` | Certificates with `Document Encryption` in `EnhancedKeyUsageList`. |
| `EKU` | Certificates matching text/pattern in `EnhancedKeyUsageList`. |
| `ExpiringInDays` | Certificates expiring in or before the specified number of days; `0` returns already-expired certificates. |
| `SSLServerAuthentication` | Server certificates for SSL web hosting (`Server Authentication` EKU). |

**Expiration review examples:**

```powershell
# Certificates expiring within 30 days
Get-ChildItem -Path Cert:\LocalMachine\WebHosting -ExpiringInDays 30

# Already-expired certificates
Get-ChildItem -Path Cert:\* -Recurse -ExpiringInDays 0

# Expired certificates on remote computers
$invokeCommandSplat = @{
    ComputerName = 'Srv01', 'Srv02'
    ScriptBlock = { Get-ChildItem -Path Cert:\* -Recurse -ExpiringInDays 0 }
}
Invoke-Command @invokeCommandSplat
```

The `NotAfter` property stores the certificate's expiration date and can be compared directly, e.g.:

```powershell
[datetime] $ValidThrough = (Get-Date) + (New-TimeSpan -Days 30)
Get-ChildItem -Path 'Cert:\*' -Recurse -DnsName "*fabrikam*" -Eku "*Client Authentication*" |
    Where-Object { $_.SendAsTrustedIssuer -and $_.NotAfter -gt $ValidThrough }
```

Certificate objects also expose `DnsNameList` (from the SAN extension, or Subject if SAN is empty), `EnhancedKeyUsageList` (OIDs plus friendly names), and `SendAsTrustedIssuer`.

## `Test-Certificate` — Chain and Revocation Validity

`Test-Certificate` verifies a certificate according to input parameters; **revocation status is verified by default**.

```text
Test-Certificate
    [-Policy <TestCertificatePolicy>]
    [-User]
    [-EKU <String[]>]
    [-DNSName <String>]
    [-AllowUntrustedRoot]
    [-Cert] <Certificate>
    [<CommonParameters>]
```

- The `Cert` object can be supplied as a path to a certificate or as an `X509Certificate2` object.
- If verification succeeds, the cmdlet returns `True`; otherwise `False`.

**Examples from the documentation:**

```powershell
# Verify each certificate in the local machine's My store for SSL use with a given DNS name
Get-ChildItem -Path Cert:\LocalMachine\My |
    Test-Certificate -Policy SSL -DNSName 'dns=contoso.com'
```

```powershell
# Verify a specific EKU is valid for a certificate and its chain, allowing an untrusted root and skipping revocation checking
$params = @{
    Cert = 'Cert:\CurrentUser\My\191C46F680F08A9E6EF3F6783140F60A979C7D3B'
    AllowUntrustedRoot = $true
    EKU = '1.3.6.1.5.5.7.3.1'
    User = $true
}
Test-Certificate @params
```

Combined with `Get-ChildItem` against the `Cert:` drive, `Test-Certificate` provides a scriptable way to independently confirm chain-building and revocation status for certificates identified via store enumeration — for example, chaining an expiration query with a validity test across an entire store.

---

*End of excerpt. Full sources: https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/certutil, https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.security/about/about_certificate_provider?view=powershell-7.6, and https://learn.microsoft.com/en-us/powershell/module/pki/test-certificate?view=windowsserver2025-ps*
