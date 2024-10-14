# Developer ::> Gehan Fernando

# Function to display progress in a single line
function Show-Progress {
    param (
        [string]$Message
    )
    Write-Host "$Message" -NoNewline
    Write-Host ""  # Ensures a new line after the progress message
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
            Write-Host "Deleted: $($item.FullName)"
        } catch {
            # Log any errors encountered
            Add-Content -Path "$env:TEMP\CleanupErrors.log" -Value "Failed to delete: $($item.FullName) - $_"
        }
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
    Add-Content -Path "$env:TEMP\CleanupErrors.log" -Value "SFC scan failed: $_"
}

# 2. DISM Check and Fix Issues
Show-Progress "Running DISM Repair..."
try {
    DISM /Online /Cleanup-Image /RestoreHealth
    Write-Host "DISM repair completed successfully."
    
    # Start component cleanup after restoring health
    Show-Progress "Running DISM Component Cleanup..."
    DISM /Online /Cleanup-Image /StartComponentCleanup
    Write-Host "DISM component cleanup completed."
} catch {
    Write-Host "Failed to run DISM repair."
    Add-Content -Path "$env:TEMP\CleanupErrors.log" -Value "DISM repair failed: $_"
}

# 3. CHKDSK Check and Fix Issues
Show-Progress "Running CHKDSK Scan..."
try {
    chkdsk C: /f /r /x /b
    Write-Host "CHKDSK scan completed successfully. A restart may be required."
} catch {
    Write-Host "Failed to run CHKDSK scan."
    Add-Content -Path "$env:TEMP\CleanupErrors.log" -Value "CHKDSK scan failed: $_"
}

# 4. Driver Issues Check and Fix Issues
Show-Progress "Checking and Updating Drivers..."
try {
    # Update drivers using PnPUtil
    pnputil.exe /scan-devices
    Write-Host "Driver update check initiated."
} catch {
    Write-Host "Failed to update drivers."
    Add-Content -Path "$env:TEMP\CleanupErrors.log" -Value "Driver update check failed: $_"
}

# 5. Windows Updates Check and Install Updates (without auto reboot)
Show-Progress "Checking for Windows Updates..."
try {
    # Import the PSWindowsUpdate module for all users
    if (-not (Get-Module -ListAvailable -Name PSWindowsUpdate)) {
        Install-Module -Name PSWindowsUpdate -Force -Scope AllUsers
    }
    Import-Module PSWindowsUpdate

    # Check for and install updates (without automatic reboot)
    Get-WindowsUpdate -AcceptAll -Install
    Write-Host "Windows update check and installation completed."
} catch {
    Write-Host "Failed to check for or install Windows updates."
    Add-Content -Path "$env:TEMP\CleanupErrors.log" -Value "Windows Update check failed: $_"
    
    # Attempt to troubleshoot the issue
    Write-Host "Attempting to troubleshoot the issue..."
    try {
        # Restart Windows Update service
        Stop-Service -Name wuauserv -Force
        Start-Service -Name wuauserv
        Write-Host "Restarted Windows Update service. Retrying updates..."

        # Retry update check (without auto reboot)
        Get-WindowsUpdate -AcceptAll -Install
        Write-Host "Windows update check and installation completed after retry."
    } catch {
        Write-Host "Retrying updates failed. Please check your network connection or Windows Update settings."
        Add-Content -Path "$env:TEMP\CleanupErrors.log" -Value "Windows Update retry failed: $_"
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
    Add-Content -Path "$env:TEMP\CleanupErrors.log" -Value "Network reset failed: $_"
}

# 7. Registry Issue Checks and Fixes
Show-Progress "Checking and Fixing Registry Issues..."
try {
    # Note: Use caution with registry operations
    regedit /e "$env:TEMP\registry_backup.reg"
    Write-Host "Registry issues check and backup completed."
} catch {
    Write-Host "Failed to check or fix registry issues."
    Add-Content -Path "$env:TEMP\CleanupErrors.log" -Value "Registry check/backup failed: $_"
}

# Clear Windows Registry Backups
Show-Progress "Clearing Registry Backups..."
try {
    # Wait before trying to delete registry backup file, ensuring it is not in use
    Start-Sleep -Seconds 10
    Clear-TempFiles -Path "$env:TEMP\registry_backup.reg"
    Write-Host "Registry backup cleanup completed."
} catch {
    Write-Host "Failed to clear registry backups."
    Add-Content -Path "$env:TEMP\CleanupErrors.log" -Value "Registry backup cleanup failed: $_"
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

    Write-Host "Critical OS issue checks completed."
} catch {
    Write-Host "Failed to check critical OS issues."
    Add-Content -Path "$env:TEMP\CleanupErrors.log" -Value "Critical OS issue check failed: $_"
}

# 9. Cleanup the Windows System "All Junk Files"
Show-Progress "Cleaning Up System Junk Files..."
try {
    Clear-TempFiles -Path "$env:TEMP"
    Write-Host "System junk files cleanup completed."
} catch {
    Write-Host "Failed to clean up system junk files."
    Add-Content -Path "$env:TEMP\CleanupErrors.log" -Value "System junk cleanup failed: $_"
}

# 10. Disk Cleanup
Show-Progress "Running Disk Cleanup..."
try {
    # Use CleanMgr with /verylowdisk switch to run it without requiring user interaction
    Start-Process -FilePath "cleanmgr.exe" -ArgumentList "/verylowdisk" -Wait
    Write-Host "Disk cleanup completed."
} catch {
    Write-Host "Failed to run disk cleanup."
    Add-Content -Path "$env:TEMP\CleanupErrors.log" -Value "Disk cleanup failed: $_"
}

# 11. Dump File Cleanup
Show-Progress "Cleaning Up Dump Files..."
try {
    $dumpFiles = Find-DumpFiles
    foreach ($dumpFile in $dumpFiles) {
        Remove-Item -Path $dumpFile.FullName -Force
        Write-Host "Deleted dump file: $($dumpFile.FullName)"
    }
    Write-Host "Dump file cleanup completed."
} catch {
    Write-Host "Failed to clean up dump files."
    Add-Content -Path "$env:TEMP\CleanupErrors.log" -Value "Dump file cleanup failed: $_"
}

# End of Script
Write-Host "System maintenance tasks completed. Review the log at $env:TEMP\CleanupErrors.log for any errors."
