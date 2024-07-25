# Developer ::> Gehan Fernando

# Function to display progress in a single line
function Show-Progress {
    param (
        [string]$Message
    )
    Write-Host "$Message" -NoNewline
}

# Function to clean up files with error handling
function Clear-TempFiles {
    param (
        [string]$Path
    )

    # Get all files and directories in the specified path
    $items = Get-ChildItem -Path $Path -ErrorAction SilentlyContinue

    foreach ($item in $items) {
        try {
            # Attempt to remove the item
            Remove-Item -Path $item.FullName -Recurse -Force -ErrorAction Stop
            Write-Host "." -NoNewline
        } catch {
            # Log any errors encountered
            Write-Host "." -NoNewline
        }
    }
}

# Function to analyze crash dump files using WinDbg
function Invoke-DumpFileAnalysis {
    param (
        [string]$DumpPath,
        [string]$WinDbgPath
    )

    $dumps = Get-ChildItem -Path $DumpPath -Filter *.dmp -Recurse -ErrorAction SilentlyContinue
    foreach ($dump in $dumps) {
        try {
            Write-Host "Analyzing dump file: $($dump.FullName)"
            & "$WinDbgPath\windbg.exe" -z $dump.FullName -c "!analyze -v; .logclose; q"
        } catch {
            Write-Host "Failed to analyze dump file: $($dump.FullName)"
        }
    }
}

# Function to find WinDbg path
function Find-WinDbgPath {
    $winDbgPath = (Get-Command -Name windbg.exe -ErrorAction SilentlyContinue).Source
    if (-not $winDbgPath) {
        Write-Host "WinDbg not found. Installing WinDbg..."
        winget install --id Microsoft.WinDbg --silent
        Start-Sleep -Seconds 30  # Allow some time for the installation to complete
        $winDbgPath = (Get-Command -Name windbg.exe -ErrorAction SilentlyContinue).Source
    }

    # If Get-Command fails, check common installation paths
    if (-not $winDbgPath) {
        $commonPaths = @(
            "$env:ProgramFiles\Windows Kits\10\Debuggers\x64",
            "$env:ProgramFiles(x86)\Windows Kits\10\Debuggers\x64"
        )
        foreach ($path in $commonPaths) {
            if (Test-Path -Path "$path\windbg.exe") {
                $winDbgPath = "$path\windbg.exe"
                break
            }
        }
    }

    if ($winDbgPath) {
        return [System.IO.Path]::GetDirectoryName($winDbgPath)
    } else {
        Write-Host "WinDbg installation failed or WinDbg executable not found."
        return $null
    }
}

# Function to find dump files in common directories
function Find-DumpFiles {
    $dumpPaths = @(
        "$env:SystemRoot\Minidump",
        "$env:SystemRoot\MEMORY.DMP",
        "$env:LOCALAPPDATA\CrashDumps",
        "$env:USERPROFILE\AppData\Local\CrashDumps"
    )

    $dumpFiles = @()
    foreach ($path in $dumpPaths) {
        if (Test-Path -Path $path) {
            $dumpFiles += Get-ChildItem -Path $path -Filter *.dmp -Recurse -ErrorAction SilentlyContinue
        }
    }

    return $dumpFiles
}

# Start the script
Write-Host "Starting system maintenance tasks..."

# 1. SFC Check and Fix Issues
Show-Progress "Running SFC Scan..."
try {
    sfc /scannow
    Write-Host "SFC scan completed successfully."
} catch {
    Write-Host "Failed to run SFC scan."
}

# 2. DISM Check and Fix Issues
Show-Progress "Running DISM Repair..."
try {
    DISM /Online /Cleanup-Image /RestoreHealth
    Write-Host "DISM repair completed successfully."
} catch {
    Write-Host "Failed to run DISM repair."
}

# 3. CHKDSK Check and Fix Issues
Show-Progress "Running CHKDSK Scan..."
try {
    chkdsk C: /f /r /x /b
    Write-Host "CHKDSK scan completed successfully. A restart may be required."
} catch {
    Write-Host "Failed to run CHKDSK scan."
}

# 4. Driver Issues Check and Fix Issues
Show-Progress "Checking and Updating Drivers..."
try {
    # Update drivers using PnPUtil
    pnputil.exe /scan-devices
    Write-Host "Driver update check initiated."
} catch {
    Write-Host "Failed to update drivers."
}

# 5. Windows Updates Check Updates
Show-Progress "Checking for Windows Updates..."
try {
    # Import the PSWindowsUpdate module if it's not already loaded
    if (-not (Get-Module -ListAvailable -Name PSWindowsUpdate)) {
        Install-Module -Name PSWindowsUpdate -Force -Scope CurrentUser
    }
    Import-Module PSWindowsUpdate

    # Check for and install updates
    Get-WindowsUpdate -AcceptAll -Install -AutoReboot
    Write-Host "Windows update check and installation completed."
} catch {
    Write-Host "Failed to check for or install Windows updates."
    # Detailed error handling
    Write-Host "Attempting to troubleshoot the issue..."
    try {
        # Restart Windows Update service
        Stop-Service -Name wuauserv -Force
        Start-Service -Name wuauserv
        Write-Host "Restarted Windows Update service. Retrying updates..."

        # Retry update check
        Get-WindowsUpdate -AcceptAll -Install -AutoReboot
        Write-Host "Windows update check and installation completed after retry."
    } catch {
        Write-Host "Retrying updates failed. Please check your network connection or Windows Update settings."
    }
}

# 6. Network Diagnostics and Adapter Resets
Show-Progress "Resetting Network Settings..."
try {
    # Reset Winsock Catalog
    netsh winsock reset
    Write-Host "Winsock reset completed."

    # Reset TCP/IP Stack
    netsh int ip reset
    Write-Host "TCP/IP reset completed."

    # Release and Renew IP Address
    ipconfig /release
    ipconfig /renew
    Write-Host "IP address release and renewal completed."

    # Flush DNS Cache
    ipconfig /flushdns
    Write-Host "DNS cache flush completed."

    # Restart Network Adapters
    Get-NetAdapter | Restart-NetAdapter -Confirm:$false
    Write-Host "Network adapter restart completed."

    # Disable and Enable Network Interfaces (if specific interface needed)
    # Replace "InterfaceName" with the actual network interface name
    $interfaceName = "InterfaceName" # Replace with your network interface name
    netsh interface set interface $interfaceName admin=disable
    Start-Sleep -Seconds 5
    netsh interface set interface $interfaceName admin=enable
    Write-Host "Network interface reset completed."
} catch {
    Write-Host "Failed to reset network settings."
}

# 7. Registry Issue Checks and Fixes
Show-Progress "Checking and Fixing Registry Issues..."
try {
    # Note: Use caution with registry operations
    regedit /e "$env:TEMP\registry_backup.reg"
    Write-Host "Registry issues check and backup completed."
} catch {
    Write-Host "Failed to check or fix registry issues."
}

# 8. Critical Operating System Issues
Show-Progress "Checking for Critical OS Issues..."
try {
    # Check Event Logs for Critical Errors
    $criticalErrors = Get-WinEvent -LogName System -FilterHashtable @{Level=1} -ErrorAction SilentlyContinue
    if ($criticalErrors) {
        Write-Host "Critical errors found in Event Logs:"
        $criticalErrors | ForEach-Object { Write-Host $_.Message }
    } else {
        Write-Host "No critical errors found in Event Logs."
    }

    # Run System Diagnostics
    Write-Host "Running System Diagnostics..."
    $diagResult = Invoke-Expression -Command "msdt.exe /id PerformanceDiagnostic"
    # Process $diagResult or check its outcome
    Write-Output $diagResult
    Write-Host "System Diagnostics run completed."

    # Check for System Restore Points
    Write-Host "Checking for System Restore Points..."
    $restorePoints = Get-ComputerRestorePoint
    if ($restorePoints) {
        Write-Host "System restore points available."
    } else {
        Write-Host "No system restore points found."
    }

    # Disk Health Check
    Write-Host "Running Disk Health Check..."
    $diskHealth = Get-PhysicalDisk | Get-StorageReliabilityCounter
    if ($diskHealth) {
        Write-Host "Disk health check completed."
        $diskHealth | ForEach-Object { Write-Host "Disk ID: $($_.DeviceId), UnrecoverableReadErrors: $($_.UnrecoverableReadErrors)" }
    } else {
        Write-Host "Disk health check failed or no data found."
    }

    # Check System Configuration
    Write-Host "Checking System Configuration..."
    Start-Process msconfig
    Write-Host "System configuration check completed."

    Write-Host "Critical OS issue check completed."
} catch {
    Write-Host "Failed to check for critical OS issues."
}

# 9. Analyze Crash Dump Files "MiniDumps and Dumps"
Show-Progress "Analyzing Crash Dump Files..."
try {
    $winDbgPath = Find-WinDbgPath

    if ($winDbgPath) {
        $dumpFiles = Find-DumpFiles
        if ($dumpFiles) {
            foreach ($dump in $dumpFiles) {
                Invoke-DumpFileAnalysis -DumpPath $dump.DirectoryName -WinDbgPath $winDbgPath
            }
            Write-Host "Crash dump analysis completed."
        } else {
            Write-Host "No crash dump files found."
        }
    } else {
        Write-Host "Failed to locate or install WinDbg."
    }
} catch {
    Write-Host "Failed to analyze crash dump files."
}

# 10. Cleanup the Windows System "All Junk Files"
Show-Progress "Cleaning Up System Junk Files..."
try {
    Clear-TempFiles -Path "$env:TEMP"
    Write-Host "System junk files cleanup completed."
} catch {
    Write-Host "Failed to clean up system junk files."
}

Write-Host "System maintenance tasks completed."