# Developer ::> Gehan Fernando
# Optimized Windows System Maintenance Script with Original Logic Restored

# Initialize logging
$ErrorActionPreference = "Stop"
$logFile = Join-Path $env:TEMP "MaintenanceLog.txt"
$errorLogFile = Join-Path $env:TEMP "CleanupErrors.log"
$results = @{}

# Helper Functions
function Write-Log {
    param(
        [string]$Message,
        [string]$Type = "INFO"
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logMessage = "$timestamp [$Type] - $Message"
    
    # Set console colors based on message type
    $color = switch ($Type) {
        "WARNING" { "DarkYellow" }
        "INFO" { "Green" }
        "ERROR" { "Red" }
        "SUMMARY" { "White" }
        default { "Gray" }
    }
    
    Write-Host $logMessage -ForegroundColor $color
    Add-Content -Path $logFile -Value $logMessage
}

function Write-ErrorLog {
    param(
        [string]$ErrorMessage
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Add-Content -Path $errorLogFile -Value "$timestamp - $ErrorMessage"
    Write-Log -Message $ErrorMessage -Type "ERROR"
}

function Show-Progress {
    param (
        [int]$Percent,
        [string]$Activity
    )
    Write-Progress -Activity $Activity -Status "$Percent% Complete" -PercentComplete $Percent
}

function Clear-TempFiles {
    param(
        [string]$Path
    )
    try {
        if (Test-Path $Path) {
            Get-ChildItem -Path $Path -Recurse -Force | ForEach-Object {
                try {
                    Remove-Item $_.FullName -Force -Recurse -ErrorAction Stop
                    Write-Log "Deleted: $($_.FullName)" -Type "INFO"
                } catch {
                    Write-ErrorLog "Failed to delete: $($_.FullName)"
                }
            }
        }
    } catch {
        Write-ErrorLog "Error cleaning path $Path : $_"
    }
}

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

function Delete-Logs {
    $serviceName = "TrustedInstaller"
    try {
        Stop-Service -Name $serviceName -Force -ErrorAction Stop
        Write-Log "Stopped Windows Modules Installer service." -Type "INFO"
    } catch {
        Write-ErrorLog "Failed to stop Trusted Installer service."
        return
    }

    $cbsLogPath = "C:\Windows\Logs\CBS\CBS.log"
    if (Test-Path -Path $cbsLogPath) {
        try {
            Remove-Item -Path $cbsLogPath -Force
            Write-Log "Deleted CBS.log file." -Type "INFO"
        } catch {
            Write-ErrorLog "Failed to delete CBS.log file"
        }
    } else {
        Write-Log "CBS.log file not found." -Type "WARNING"
    }

    try {
        Start-Service -Name $serviceName -ErrorAction Stop
        Write-Log "Started Windows Modules Installer service." -Type "INFO"
    } catch {
        Write-ErrorLog "Failed to start Trusted Installer service."
    }
}

function Reset-NetworkStack {
    try {
        Write-Log "Starting network stack reset..." -Type "INFO"
        
        # Get initial adapter states
        $beforeStates = Get-NetAdapter | Select-Object Name, Status, LinkSpeed
        
        # Reset network stack
        $stackCommands = @(
            @{cmd="netsh winsock reset"; desc="Winsock Reset"},
            @{cmd="netsh int ip reset"; desc="IP Stack Reset"},
            @{cmd="ipconfig /release"; desc="IP Release"},
            @{cmd="ipconfig /renew"; desc="IP Renew"},
            @{cmd="ipconfig /flushdns"; desc="DNS Flush"}
        )
        
        foreach ($command in $stackCommands) {
            Write-Log "Executing: $($command.desc)..." -Type "INFO"
            $result = Invoke-Expression $command.cmd 2>&1
            if ($LASTEXITCODE -and $LASTEXITCODE -ne 0) {
                Write-Log "Warning: $($command.desc) completed with status $LASTEXITCODE" -Type "WARNING"
            }
        }
        
        # Restart each adapter
        Get-NetAdapter | ForEach-Object {
            Write-Log "Restarting adapter: $($_.Name)" -Type "INFO"
            try {
                Restart-NetAdapter -Name $_.Name -Confirm:$false
                Start-Sleep -Seconds 2
            } catch {
                Write-ErrorLog "Failed to restart adapter $($_.Name): $_"
            }
        }
        
        # Get final adapter states and compare
        Start-Sleep -Seconds 5  # Wait for adapters to stabilize
        $afterStates = Get-NetAdapter | Select-Object Name, Status, LinkSpeed
        
        Write-Log "Network Adapter Status Report:" -Type "SUMMARY"
        foreach ($adapter in $afterStates) {
            $before = $beforeStates | Where-Object { $_.Name -eq $adapter.Name }
            $statusChange = if ($before.Status -ne $adapter.Status) { 
                "Changed: $($before.Status) -> $($adapter.Status)" 
            } else { 
                "Unchanged" 
            }
            Write-Log "Adapter: $($adapter.Name) - Status: $($adapter.Status) - Speed: $($adapter.LinkSpeed) - Change: $statusChange" -Type "INFO"
        }
        
        return $true
    } catch {
        Write-ErrorLog "Network stack reset failed: $_"
        return $false
    }
}

function Start-SystemMaintenance {
    Write-Log "Starting system maintenance tasks..." -Type "INFO"
    $results["StartTime"] = Get-Date

    # Delete CBS and DISM logs first
    Write-Log "Cleaning system logs..." -Type "INFO"
    Delete-Logs
    
    # SFC Check
    Write-Log "Running SFC Scan..." -Type "INFO"
    try {
        $process = Start-Process sfc -ArgumentList "/scannow" -PassThru -Wait -NoNewWindow
        $percent = 0
        while ($percent -le 100) {
            Start-Sleep -Milliseconds 100
            Show-Progress -Percent $percent -Activity "SFC Scan"
            $percent += 1
        }
        
        $results["SFC"] = switch ($process.ExitCode) {
            0 { "No issues found" }
            1 { "Issues found but some could not be fixed" }
            2 { "Issues found and fixed" }
            default { "Error occurred" }
        }
        Write-Log "SFC Result: $($results['SFC'])" -Type "INFO"
    } catch {
        Write-ErrorLog "SFC scan failed: $_"
    }

    # DISM Check
    Write-Log "Running DISM Repair..." -Type "INFO"
    try {
        DISM /Online /Cleanup-Image /RestoreHealth
        Write-Log "DISM repair completed successfully." -Type "INFO"
        
        Write-Log "Running DISM Component Cleanup..." -Type "INFO"
        DISM /Online /Cleanup-Image /StartComponentCleanup
        Write-Log "DISM component cleanup completed." -Type "INFO"
    } catch {
        Write-ErrorLog "DISM repair failed: $_"
    }

    # CHKDSK Check
    Write-Log "Running CHKDSK Scan..." -Type "INFO"
    try {
        Write-Log "CHKDSK may require a restart and could take time to complete." -Type "WARNING"
        chkdsk C: /f /r /x /b
        Write-Log "CHKDSK scan completed successfully." -Type "INFO"
    } catch {
        Write-ErrorLog "CHKDSK scan failed: $_"
    }

    # Driver Check
    Write-Log "Checking and Updating Drivers..." -Type "INFO"
    try {
        pnputil.exe /scan-devices
        Write-Log "Driver update check completed." -Type "INFO"
    } catch {
        Write-ErrorLog "Driver update check failed: $_"
    }

    # Windows Updates
    Write-Log "Checking for Windows Updates..." -Type "INFO"
    try {
        if (-not (Get-Module -ListAvailable -Name PSWindowsUpdate)) {
            Install-Module -Name PSWindowsUpdate -Force -Scope AllUsers
        }
        Import-Module PSWindowsUpdate
        Get-WindowsUpdate -AcceptAll -Install -AutoReboot:$false
        Write-Log "Windows update check and installation completed." -Type "INFO"
    } catch {
        Write-ErrorLog "Windows Update failed - attempting service restart..."
        try {
            Stop-Service -Name wuauserv -Force
            Start-Service -Name wuauserv
            Get-WindowsUpdate -AcceptAll -Install -AutoReboot:$false
            Write-Log "Windows update completed after service restart." -Type "INFO"
        } catch {
            Write-ErrorLog "Windows Update retry failed."
        }
    }

    # Network Reset
    Write-Log "Resetting Network Stack..." -Type "INFO"
    $results["NetworkReset"] = Reset-NetworkStack

    # Registry Backup
    Write-Log "Backing up Registry..." -Type "INFO"
    try {
        $regBackupPath = "$env:TEMP\registry_backup.reg"
        regedit /e $regBackupPath
        Write-Log "Registry backup completed." -Type "INFO"
        
        Start-Sleep -Seconds 10
        if (Test-Path $regBackupPath) {
            Remove-Item $regBackupPath -Force
            Write-Log "Registry backup file cleaned up." -Type "INFO"
        }
    } catch {
        Write-ErrorLog "Registry backup operations failed: $_"
    }

    # Critical OS Issues
    Write-Log "Checking for Critical OS Issues..." -Type "INFO"
    try {
        $criticalIssues = Get-WindowsErrorReporting
        if ($criticalIssues) {
            Write-Log "Found $($criticalIssues.Count) critical OS issues." -Type "WARNING"
        } else {
            Write-Log "No critical OS issues found." -Type "INFO"
        }

        $diskHealth = Get-PhysicalDisk | Get-StorageReliabilityCounter
        foreach ($disk in $diskHealth) {
            Write-Log "Disk $($disk.DeviceID): Status = $($disk.OperationalStatus)" -Type "INFO"
        }
    } catch {
        Write-ErrorLog "Critical OS issue check failed: $_"
    }

    # System Cleanup
    Write-Log "Cleaning Up System..." -Type "INFO"
    try {
        Clear-TempFiles -Path $env:TEMP
        Start-Process -FilePath "cleanmgr.exe" -ArgumentList "/verylowdisk" -Wait
        Write-Log "System cleanup completed." -Type "INFO"

        $dumpFiles = Find-DumpFiles
        foreach ($dumpFile in $dumpFiles) {
            Remove-Item -Path $dumpFile.FullName -Force
            Write-Log "Deleted dump file: $($dumpFile.FullName)" -Type "INFO"
        }
    } catch {
        Write-ErrorLog "System cleanup operations failed: $_"
    }

    # Generate Summary
    $results["EndTime"] = Get-Date
    $duration = $results["EndTime"] - $results["StartTime"]
    
    Write-Log "=== Maintenance Summary ===" -Type "SUMMARY"
    Write-Log "Duration: $($duration.ToString())" -Type "SUMMARY"
    Write-Log "SFC Result: $($results['SFC'])" -Type "SUMMARY"
    Write-Log "DISM Result: Completed" -Type "SUMMARY"
    Write-Log "Network Reset: $($results['NetworkReset'])" -Type "SUMMARY"
    Write-Log "Maintenance completed. Check logs for details:" -Type "SUMMARY"
    Write-Log "  Main log: $logFile" -Type "INFO"
    Write-Log "  Error log: $errorLogFile" -Type "INFO"
}

# Execute the script
Start-SystemMaintenance