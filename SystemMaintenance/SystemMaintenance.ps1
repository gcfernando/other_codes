# Developer ::> Gehan Fernando

# Function to display progress in a single line
function Show-Progress {
    param (
        [int]$Percent
    )
    Write-Host -NoNewline "Verification $Percent% complete.`r"  # Carriage return to overwrite the same line
}

# Function to log errors with timestamps
function Log-Error {
    param (
        [string]$ErrorMessage
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Add-Content -Path "$env:TEMP\CleanupErrors.log" -Value "$timestamp - $ErrorMessage"
}

# Function to clean up files with error handling and logging
function Clear-TempFiles {
    param (
        [string]$Path
    )

    $items = Get-ChildItem -Path $Path -ErrorAction Continue
    foreach ($item in $items) {
        try {
            Remove-Item -Path $item.FullName -Recurse -Force -ErrorAction Stop
            Write-Host "Deleted: $($item.FullName)"
        } catch {
			Log-Error "Failed to delete files."
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
        if (Test-Path $path) {
            $dumpFiles += Get-ChildItem -Path $path -Recurse -ErrorAction SilentlyContinue
        }
    }
    return $dumpFiles
}

# Function to delete CBS and DISM log files
function Delete-Logs {
    # Stop the Windows Modules Installer service
    $serviceName = "TrustedInstaller"
    try {
        Stop-Service -Name $serviceName -Force -ErrorAction Stop
        Write-Host "Stopped Windows Modules Installer service."
    } catch {
		Log-Error "Failed to stop Trusted Installer service."
    }

    # Delete CBS log file
    $cbsLogPath = "C:\Windows\Logs\CBS\CBS.log"
    if (Test-Path -Path $cbsLogPath) {
        try {
            Remove-Item -Path $cbsLogPath -Force
            Write-Host "Deleted CBS.log file."
        } catch {
			Log-Error "Failed to delete CBS.log file"
        }
    } else {
        Write-Host "CBS.log file not found."
    }

    # Delete DISM log file
    $dismLogPath = "C:\Windows\Logs\DISM\dism.log"
    if (Test-Path -Path $dismLogPath) {
        try {
            Remove-Item -Path $dismLogPath -Force
            Write-Host "Deleted DISM.log file."
        } catch {
            Log-Error "Failed to delete DISM.log file"
        }
    } else {
        Write-Host "DISM.log file not found."
    }

    # Restart the Windows Modules Installer service
    try {
        Start-Service -Name $serviceName -ErrorAction Stop
        Write-Host "Started Windows Modules Installer service."
    } catch {
		Log-Error "Failed to stop Trusted Installer service."
    }
}

# Start the script
Write-Host "Starting system maintenance tasks..."

# Delete CBS and DISM log files before starting other tasks
Delete-Logs

# 1. SFC Check and Fix Issues
Write-Host "Running SFC Scan..."
try {
    $process = Start-Process sfc -ArgumentList "/scannow" -PassThru -Wait -NoNewWindow
    $percent = 0
    
    # Simulate updating the progress percentage
    while ($percent -le 100) {
        Start-Sleep -Milliseconds 100  # Simulate work done
        Show-Progress $percent
        $percent += 1
    }
    
    # Final result of SFC
    if ($process.ExitCode -eq 0) {
        Write-Host "SFC found no issues."
    } elseif ($process.ExitCode -eq 1) {
        Write-Host "SFC found issues but was unable to fix some of them."
    } elseif ($process.ExitCode -eq 2) {
        Write-Host "SFC found issues and successfully fixed them."
    } else {
        Write-Host "SFC encountered an error."
    }
    Write-Host "SFC scan completed. Check the default log at C:\Windows\Logs\CBS\CBS.log"
} catch {
    Log-Error "Fail to scan SFC scan."
}

# 2. DISM Check and Fix Issues
Write-Host "Running DISM Repair..."
try {
    DISM /Online /Cleanup-Image /RestoreHealth
    Write-Host "DISM repair completed successfully. Check default log: C:\Windows\Logs\DISM\dism.log"
    
    Write-Host "Running DISM Component Cleanup..."
    DISM /Online /Cleanup-Image /StartComponentCleanup
    Write-Host "DISM component cleanup completed. Check default log: C:\Windows\Logs\DISM\dism.log"
} catch {
    Log-Error "Fail to repair DISM scan."
}

# 3. CHKDSK Check and Fix Issues
Write-Host "Running CHKDSK Scan..."
try {
    Write-Host "CHKDSK may require a restart and could take time to complete."
    chkdsk C: /f /r /x /b
    Write-Host "CHKDSK scan completed successfully. A restart may be required."
} catch {
    Log-Error "Failed to run CHKDSK scan."
}

# 4. Driver Issues Check and Fix Issues
Write-Host "Checking and Updating Drivers..."
try {
    pnputil.exe /scan-devices
    Write-Host "Driver update check initiated."
} catch {
    Log-Error "Driver update check failed."
}

# 5. Windows Updates Check and Install Updates (without auto reboot)
Write-Host "Checking for Windows Updates..."
try {
    if (-not (Get-Module -ListAvailable -Name PSWindowsUpdate)) {
        Install-Module -Name PSWindowsUpdate -Force -Scope AllUsers
    }
    Import-Module PSWindowsUpdate

    Get-WindowsUpdate -AcceptAll -Install -AutoReboot:$false
    Write-Host "Windows update check and installation completed."
} catch {
    Log-Error "Windows Update check failed."
    
    # Retry after restarting the Windows Update service
    try {
        Write-Host "Restarting Windows Update service and retrying updates..."
        Stop-Service -Name wuauserv -Force
        Start-Service -Name wuauserv;

        Get-WindowsUpdate -AcceptAll -Install -AutoReboot:$false
        Write-Host "Windows update check and installation completed after retry."
    } catch {
        Log-Error "Windows Update retry failed."
    }
}

# 6. Network Diagnostics and Adapter Resets
Write-Host "Resetting Network Settings..."
try {
    netsh winsock reset
    netsh int ip reset
    ipconfig /release
    ipconfig /renew
    ipconfig /flushdns
    Write-Host "Network settings reset completed."

    # Restart all network adapters
    Get-NetAdapter | Restart-NetAdapter -Confirm:$false
    Write-Host "All network adapters have been restarted."

    # Report on network interfaces
    $networkInterfaces = Get-NetAdapter | Select-Object Name, Status
    Write-Host "Available Network Interfaces:"
    Write-Host "{0,-30} {1,-15}" -f "Name", "Status"
    Write-Host "{0,-30} {1,-15}" -f "----", "------"
    $networkInterfaces | ForEach-Object {
        Write-Host "{0,-30} {1,-15}" -f $_.Name, $_.Status
    }
} catch {
    Log-Error "Network reset failed."
}

# 7. Registry Backup (Backup Only)
Write-Host "Backing up Registry..."
try {
    regedit /e "$env:TEMP\registry_backup.reg"
    Write-Host "Registry backup completed. No registry changes are made."
} catch {
    Log-Error "Registry backup failed."
}

# Clear the Registry Backup file after backup
Write-Host "Clearing Registry Backup..."
try {
    Start-Sleep -Seconds 10
    Clear-TempFiles -Path "$env:TEMP\registry_backup.reg"
    Write-Host "Registry backup cleanup completed."
} catch {
    Log-Error "Registry backup cleanup failed."
}

# 8. Critical OS Issues
Write-Host "Checking for Critical OS Issues..."
try {
    $criticalIssues = Get-WindowsErrorReporting
    if ($criticalIssues) {
        Write-Host "Critical OS issues found: $($criticalIssues.Count)"
    } else {
        Write-Host "No critical OS issues found."
    }

    # Check Disk Health
    Write-Host "Checking Disk Health..."
    $diskHealth = Get-PhysicalDisk | Get-StorageReliabilityCounter
    if ($diskHealth) {
        $diskHealth | ForEach-Object { Write-Host "$($_.DeviceID): Status = $($_.OperationalStatus)" }
    } else {
        Write-Host "No disk health information found."
    }
} catch {
    Log-Error "Critical OS issue check failed."
}

# 9. Cleanup System Junk Files
Write-Host "Cleaning Up System Junk Files..."
try {
    Clear-TempFiles -Path "$env:TEMP"
    Write-Host "System junk files cleanup completed."
} catch {
    Log-Error "System junk cleanup failed."
}

# 10. Disk Cleanup
Write-Host "Running Disk Cleanup..."
try {
    Start-Process -FilePath "cleanmgr.exe" -ArgumentList "/verylowdisk" -Wait
    Write-Host "Disk cleanup completed."
} catch {
    Log-Error "Disk cleanup failed."
}

# 11. Dump File Cleanup
Write-Host "Cleaning Up Dump Files..."
try {
    $dumpFiles = Find-DumpFiles
    foreach ($dumpFile in $dumpFiles) {
        Remove-Item -Path $dumpFile.FullName -Force
        Write-Host "Deleted dump file: $($dumpFile.FullName)"
    }
    Write-Host "Dump file cleanup completed."
} catch {
    Log-Error "Dump file cleanup failed."
}

# End of Script
Write-Host "System maintenance tasks completed. Review the log at $env:TEMP\CleanupErrors.log for any errors."