<#
Developer ::> Gehan Fernando

The second argument specifies the EXISTING line ending to convert:
LF   -> CRLF
CRLF -> LF

Usage examples:
Convert one file from LF to CRLF:
.\Convert-LineEndings.ps1 "C:\Projects\Nilog\README.md" LF

Convert one file from CRLF to LF:
.\Convert-LineEndings.ps1 "C:\Projects\Nilog\README.md" CRLF

Convert all files in a folder and its subfolders from LF to CRLF:
.\Convert-LineEndings.ps1 "C:\Projects\Nilog" LF

Convert all files in a folder and its subfolders from CRLF to LF:
.\Convert-LineEndings.ps1 "C:\Projects\Nilog" CRLF

Folder mode includes hidden files but skips .git, bin, obj, node_modules,
and symbolic links/reparse points. Explicitly supplied files are processed.

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
$strictUtf8 = [System.Text.UTF8Encoding]::new($false, $true)

$item = Get-Item -LiteralPath $Path -Force
$failed = 0

if ($item.PSIsContainer) {
    $excludedDirectories = @('.git', 'bin', 'obj', 'node_modules')
    $pendingDirectories = [System.Collections.Generic.Stack[string]]::new()
    $pendingDirectories.Push($item.FullName)
    $files = [System.Collections.Generic.List[System.IO.FileInfo]]::new()

    # Enumerate every subfolder, pruning excluded folders before entering them.
    while ($pendingDirectories.Count -gt 0) {
        $directory = $pendingDirectories.Pop()

        try {
            $children = @(Get-ChildItem -LiteralPath $directory -Force -ErrorAction Stop)
        }
        catch {
            Write-Warning "Failed to read folder: $directory - $_"
            $failed++
            continue
        }

        foreach ($child in $children) {
            # Do not follow junctions or symbolic links outside the chosen tree.
            if ($child.Attributes -band [System.IO.FileAttributes]::ReparsePoint) {
                continue
            }

            if ($child.PSIsContainer) {
                if ($excludedDirectories -notcontains $child.Name) {
                    $pendingDirectories.Push($child.FullName)
                }
            }
            else {
                $files.Add($child)
            }
        }
    }
}
else {
    $files = @($item)
}

$converted = 0
$skipped = 0

foreach ($file in $files) {
    try {
        $bytes = [System.IO.File]::ReadAllBytes($file.FullName)

        # Skip binary files and UTF-16/UTF-32 files, as in the original script.
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
        $content = $strictUtf8.GetString($bytes)

        if ($LineEnding -eq 'LF') {
            $updated = [regex]::Replace($content, '(?<!\r)\n', $target)
        }
        else {
            $updated = $content.Replace("`r`n", $target)
        }

        if ($content -cne $updated) {
            [System.IO.File]::WriteAllText($file.FullName, $updated, $utf8)
            $converted++
            Write-Host "Converted: $($file.FullName)" -ForegroundColor Green
        }
        else {
            $skipped++
        }
    }
    catch {
        Write-Warning "Failed: $($file.FullName) - $_"
        $failed++
    }
}

Write-Host "`nCompleted. Converted: $converted | Skipped: $skipped | Failed: $failed"
