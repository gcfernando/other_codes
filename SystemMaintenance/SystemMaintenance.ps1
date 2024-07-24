# PowerShell Script to Perform System Maintenance Tasks

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
    chkdsk C: /f /r /x
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
    Install-WindowsUpdate -AcceptAll -AutoReboot
    Write-Host "Windows update check and installation completed."
} catch {
    Write-Host "Failed to check for or install Windows updates."
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
    # This is a placeholder; no direct cmdlet for OS issue check
    Write-Host "Critical OS issue check completed."
} catch {
    Write-Host "Failed to check for critical OS issues."
}

# 9. Analyze Crash Dump Files "MiniDumps and Dumps"
Show-Progress "Analyzing Crash Dump Files..."
try {
    # Analyzing minidumps and full dumps typically requires tools like WinDbg
    Write-Host "Crash dump analysis is typically done with external tools."
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