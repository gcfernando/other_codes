<#
Developer ::> Gehan Fernando

Usage examples:
Convert one file from LF to CRLF:
.\Convert-LineEndings.ps1 "C:\Projects\Nilog\README.md" LF

Convert one file from CRLF to LF:
.\Convert-LineEndings.ps1 "C:\Projects\Nilog\README.md" CRLF

Convert an entire folder from LF to CRLF:
.\Convert-LineEndings.ps1 "C:\Projects\Nilog" LF

Convert an entire folder from CRLF to LF:
.\Convert-LineEndings.ps1 "C:\Projects\Nilog" CRLF

Verify the result:
git ls-files --eol
#>

param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$Path,

    [Parameter(Mandatory = $true, Position = 1)]
    [ValidateSet('LF', 'CRLF')]
    [string]$LineEnding
)

$ErrorActionPreference = 'Stop'

$target = if ($LineEnding -eq 'LF') { "`r`n" } else { "`n" }
$utf8 = [System.Text.UTF8Encoding]::new($false)

$item = Get-Item -LiteralPath $Path

if ($item.PSIsContainer) {
    $files = @(Get-ChildItem -LiteralPath $item.FullName -File -Recurse |
        Where-Object {
            $_.FullName -notmatch '[\\/](\.git|bin|obj|node_modules)[\\/]'
        })
} else {
    $files = @($item)
}

$converted = 0
$skipped = 0

foreach ($file in $files) {
    try {
        $bytes = [System.IO.File]::ReadAllBytes($file.FullName)

        # Skip binary files and UTF-16/UTF-32 files.
        if ($bytes.Length -eq 0 -or
            $bytes -contains 0 -or
            ($bytes.Length -ge 3 -and
             $bytes[0] -eq 0xEF -and
             $bytes[1] -eq 0xBB -and
             $bytes[2] -eq 0xBF)) {
            $skipped++
            Write-Host "Skipped (unsupported/empty): $($file.FullName)"
            continue
        }

        # Reject invalid UTF-8 rather than corrupting other encodings.
        $strictUtf8 = [System.Text.UTF8Encoding]::new($false, $true)
        $content = $strictUtf8.GetString($bytes)

        if ($LineEnding -eq 'LF') {
            $updated = [regex]::Replace($content, '(?<!\r)\n', $target)
        } else {
            $updated = $content.Replace("`r`n", $target)
        }

        if ($content -cne $updated) {
            [System.IO.File]::WriteAllText(
                $file.FullName, $updated, $utf8
            )
            $converted++
            Write-Host "Converted: $($file.FullName)" -ForegroundColor Green
        } else {
            $skipped++
        }
    }
    catch {
        Write-Warning "Failed: $($file.FullName) - $_"
        $skipped++
    }
}

Write-Host "`nCompleted. Converted: $converted | Skipped: $skipped"