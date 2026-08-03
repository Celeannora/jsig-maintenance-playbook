<#
.SYNOPSIS
    Checks SMB file share accessibility, hosting-volume disk capacity, and (optionally) the
    Print Spooler service on one or more Windows file/print server hosts.

.DESCRIPTION
    Automates MRC-OPS-031 -- File/print server share health and disk capacity check (weekly
    task, execution-plan/mrc-cards/ops/MRC-OPS-031.md).

    Uses the built-in SmbShare and Storage PowerShell modules on each -ComputerName to:
      1. Enumerate non-default SMB shares (Get-SmbShare, excluding administrative shares like
         C$, ADMIN$, IPC$, and print$) and confirm each share's underlying path is still
         reachable (Test-Path) and the share itself reports an Online ShareState.
      2. Identify the drive letters hosting those shares and check free space on each via
         Get-Volume, flagging any volume below -DiskWarnPercentFree.
      3. Optionally check the Print Spooler service (Get-Service -Name Spooler) if
         -CheckPrintSpooler is used, for hosts that also serve as print servers.

    This script is READ-ONLY. It never creates, removes, or modifies any share, never changes
    NTFS/share permissions, and never starts, stops, or restarts any service.

.PARAMETER ComputerName
    One or more computer names to check. Defaults to the local computer ($env:COMPUTERNAME).
    Remote targets are queried via Invoke-Command (requires WinRM/PSRemoting access).

.PARAMETER DiskWarnPercentFree
    Flag a share-hosting volume as Warning if its free space percentage falls at or below this
    value. Default: 10.

.PARAMETER CheckPrintSpooler
    Also check the Print Spooler service state on each target. Default: disabled ($false) --
    enable this on hosts that serve the Print Server role, per this card's Procedure.

.PARAMETER OutputPath
    Path to write the combined report file. Defaults to
    .\reports\MRC-OPS-031_<yyyyMMdd-HHmmss>.txt (created if it does not exist).

.EXAMPLE
    .\MRC-OPS-031.ps1 -ComputerName fs01.example.mil -CheckPrintSpooler
    Checks share accessibility, disk capacity, and the Print Spooler service on fs01.

.NOTES
    MRC ID     : MRC-OPS-031 -- File/print server share health and disk capacity check
    Card       : ../ops/MRC-OPS-031.md
    Frequency  : Weekly
    Baseline   : Windows Server (General) / Windows Server File and Storage Services
    Requires   : The built-in SmbShare and Storage PowerShell modules (present on all supported
                 Windows Server versions) and, for remote -ComputerName targets, WinRM/
                 PSRemoting access.
    Exit codes : 0 = every enumerated share is Online with a reachable path, every hosting
                 volume is above -DiskWarnPercentFree, and (if checked) the Print Spooler
                 service is Running. 1 = any share is offline/unreachable, any hosting volume
                 is at or below the free-space threshold, the Print Spooler service is not
                 running (when checked), or a target could not be queried.

    SAFETY DISCLAIMER: Provided as a starting point for the stated baseline environment. Not
    validated against a live production system in this repository. A human must review this
    script's logic and test it in a non-production environment before operational use, per the
    organization's own change-control process. This script never modifies any share, permission,
    or service state.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string[]] $ComputerName = @($env:COMPUTERNAME),

    [Parameter(Mandatory = $false)]
    [int] $DiskWarnPercentFree = 10,

    [Parameter(Mandatory = $false)]
    [switch] $CheckPrintSpooler,

    [Parameter(Mandatory = $false)]
    [string] $OutputPath = ".\reports\MRC-OPS-031_$(Get-Date -Format 'yyyyMMdd-HHmmss').txt"
)

$ErrorActionPreference = 'Stop'
$results = New-Object System.Collections.Generic.List[object]
$overallExitCode = 0

function Write-ReportLine {
    param([string] $Line)
    Add-Content -LiteralPath $OutputPath -Value $Line
}

$outDir = Split-Path -Path $OutputPath -Parent
if ($outDir -and -not (Test-Path -LiteralPath $outDir)) {
    New-Item -ItemType Directory -Path $outDir -Force | Out-Null
}
New-Item -ItemType File -Path $OutputPath -Force | Out-Null

$ts = Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz'

Write-ReportLine "MRC-OPS-031 -- File/print server share health and disk capacity check"
Write-ReportLine "Run timestamp : $ts"
Write-ReportLine "Run by        : $env:USERDOMAIN\$env:USERNAME on $env:COMPUTERNAME"
Write-ReportLine "Check Print Spooler: $($CheckPrintSpooler.IsPresent)"
Write-ReportLine ("=" * 78)
Write-ReportLine ""

$checkScript = {
    param($DiskWarnPct, $CheckSpooler)
    $out = [pscustomobject]@{ Shares = @(); Volumes = @(); Spooler = $null }

    $shares = Get-SmbShare | Where-Object { $_.ShareType -eq 'FileSystemDirectory' -and $_.Special -eq $false }
    $out.Shares = foreach ($s in $shares) {
        $reachable = $false
        try { $reachable = Test-Path -LiteralPath $s.Path } catch { $reachable = $false }
        [pscustomobject]@{
            Name       = $s.Name
            Path       = $s.Path
            ShareState = $s.ShareState
            Reachable  = $reachable
        }
    }

    $driveLetters = $out.Shares | ForEach-Object {
        if ($_.Path -match '^([A-Za-z]):') { $matches[1].ToUpper() }
    } | Select-Object -Unique

    $out.Volumes = foreach ($dl in $driveLetters) {
        $vol = Get-Volume -DriveLetter $dl -ErrorAction SilentlyContinue
        if ($vol -and $vol.Size -gt 0) {
            [pscustomobject]@{
                DriveLetter    = $dl
                SizeGB         = [math]::Round($vol.Size / 1GB, 2)
                FreeGB         = [math]::Round($vol.SizeRemaining / 1GB, 2)
                PercentFree    = [math]::Round(($vol.SizeRemaining / $vol.Size) * 100, 1)
                HealthStatus   = $vol.HealthStatus
            }
        }
    }

    if ($CheckSpooler) {
        try {
            $svc = Get-Service -Name Spooler -ErrorAction Stop
            $out.Spooler = $svc.Status.ToString()
        } catch {
            $out.Spooler = 'NotFound'
        }
    }

    $out
}

foreach ($comp in $ComputerName) {
    Write-ReportLine "--- $comp ---"
    try {
        $data = if ($comp -eq $env:COMPUTERNAME -or $comp -eq 'localhost') {
            & $checkScript $DiskWarnPercentFree $CheckPrintSpooler.IsPresent
        } else {
            Invoke-Command -ComputerName $comp -ScriptBlock $checkScript -ArgumentList $DiskWarnPercentFree, $CheckPrintSpooler.IsPresent -ErrorAction Stop
        }

        if (-not $data.Shares -or $data.Shares.Count -eq 0) {
            Write-ReportLine "$comp`: no non-default SMB shares found"
        }
        foreach ($s in $data.Shares) {
            if (-not $s.Reachable -or $s.ShareState -ne 'Online') {
                $overallExitCode = 1
                $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Share-Availability'; Target = "$comp : $($s.Name)"; Result = 'Fail'; Detail = "Path=$($s.Path), ShareState=$($s.ShareState), Reachable=$($s.Reachable)" })
                Write-ReportLine "Share '$($s.Name)' ($($s.Path)): ShareState=$($s.ShareState), Reachable=$($s.Reachable) (Fail)"
            } else {
                $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Share-Availability'; Target = "$comp : $($s.Name)"; Result = 'Pass'; Detail = "Path=$($s.Path), ShareState=Online, Reachable=True" })
                Write-ReportLine "Share '$($s.Name)' ($($s.Path)): Online, reachable (Pass)"
            }
        }

        foreach ($v in $data.Volumes) {
            if ($v.PercentFree -le $DiskWarnPercentFree) {
                $overallExitCode = 1
                $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Volume-FreeSpace'; Target = "$comp : $($v.DriveLetter):"; Result = 'Warning'; Detail = "$($v.PercentFree)% free ($($v.FreeGB) GB of $($v.SizeGB) GB), threshold $DiskWarnPercentFree%" })
                Write-ReportLine "Volume $($v.DriveLetter): $($v.PercentFree)% free (Warning, threshold $DiskWarnPercentFree%)"
            } else {
                $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'Volume-FreeSpace'; Target = "$comp : $($v.DriveLetter):"; Result = 'Pass'; Detail = "$($v.PercentFree)% free ($($v.FreeGB) GB of $($v.SizeGB) GB)" })
                Write-ReportLine "Volume $($v.DriveLetter): $($v.PercentFree)% free (Pass)"
            }
        }

        if ($CheckPrintSpooler) {
            if ($data.Spooler -ne 'Running') {
                $overallExitCode = 1
                $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'PrintSpooler-Service'; Target = $comp; Result = 'Fail'; Detail = "Spooler service status=$($data.Spooler)" })
                Write-ReportLine "Print Spooler service: $($data.Spooler) (Fail)"
            } else {
                $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'PrintSpooler-Service'; Target = $comp; Result = 'Pass'; Detail = 'Spooler service status=Running' })
                Write-ReportLine "Print Spooler service: Running (Pass)"
            }
        }
    } catch {
        $overallExitCode = 1
        $results.Add([pscustomobject]@{ Timestamp = $ts; CheckName = 'FilePrint-Health'; Target = $comp; Result = 'Fail'; Detail = "Could not query host: $($_.Exception.Message)" })
        Write-ReportLine "ERROR: could not query $comp`: $($_.Exception.Message)"
    }
    Write-ReportLine ""
}

Write-ReportLine ("=" * 78)
Write-ReportLine "SUMMARY"
Write-ReportLine ("=" * 78)
$summaryLines = $results | Format-Table Timestamp, Target, CheckName, Result, Detail -AutoSize | Out-String
Write-ReportLine $summaryLines

$failCount = ($results | Where-Object { $_.Result -in @('Fail', 'Warning') }).Count
$passCount = ($results | Where-Object Result -eq 'Pass').Count
Write-ReportLine "Totals: $passCount passed, $failCount failed/warning."

Write-Host "File/print server health check complete. $passCount passed / $failCount failed/warning. Report: $OutputPath"

$results
exit $overallExitCode
