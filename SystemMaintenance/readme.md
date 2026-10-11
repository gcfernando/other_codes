# Windows System Maintenance PowerShell Script — SFC, DISM, CHKDSK, Windows Update and Cleanup

`SystemMaintenance.ps1` is a PowerShell script that automates common **Windows maintenance and repair tasks** in one run: System File Checker (SFC), DISM image repair and component cleanup, a CHKDSK disk check, a driver rescan, Windows Update installation, a network stack reset, a disk health report, and cleanup of temporary files and crash dumps. Each step has its own error handling and logging, so a failure in one step does not stop the rest.

> ⚠️ **This script makes system-wide changes.** Review it before running it, save your work, back up important data, and run it only on a machine you administer.

## What the script does

The steps run in this order:

| Step | What happens |
|---|---|
| Log cleanup | Stops the `TrustedInstaller` service, deletes the CBS log, then restarts the service |
| System File Checker | Runs `sfc /scannow` |
| DISM | Runs `DISM /Online /Cleanup-Image /RestoreHealth`, then `/StartComponentCleanup` |
| CHKDSK | Runs `chkdsk C: /f /r /x /b`. Because `C:` is in use, Windows schedules the check for the next restart and may ask you to confirm |
| Driver rescan | Runs `pnputil.exe /scan-devices` to detect hardware changes |
| Windows Update | Installs the `PSWindowsUpdate` module from the PowerShell Gallery if it is missing, then installs all available updates without rebooting (`Get-WindowsUpdate -AcceptAll -Install -AutoReboot:$false`). If that fails, it restarts the Windows Update service and tries once more |
| Network reset | Runs `netsh winsock reset`, `netsh int ip reset`, `ipconfig /release`, `/renew`, and `/flushdns`, restarts the network adapters, and tries to reconnect Wi-Fi if it was disconnected |
| Registry export | Exports the registry with `regedit /e` to `%TEMP%\registry_backup.reg`, then **deletes the file about 10 seconds later** — no registry backup is kept and no registry changes are made |
| OS and disk check | Queries Windows Error Reporting and logs the status of each physical disk's reliability counters |
| Cleanup | Deletes temporary files from `%TEMP%` and crash dump files (for example from `%SystemRoot%\Minidump`) |
| Summary | Writes a summary of the results |

## Requirements

- Windows 10 or Windows 11
- An **elevated** PowerShell window (Run as administrator)
- Internet access for Windows Update and, on first run, for installing the `PSWindowsUpdate` module
- A PowerShell execution policy that allows running local scripts

## Usage

From an elevated PowerShell window in this folder:

```powershell
.\SystemMaintenance.ps1
```

If script execution is blocked, you can allow it for the current window only:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\SystemMaintenance.ps1
```

Expect the run to take a long time: SFC, DISM, and Windows Update can each take many minutes. Restart the computer afterwards so the scheduled CHKDSK and the network resets take effect.

## Logs

| File | Contents |
|---|---|
| `%TEMP%\MaintenanceLog.txt` | Every step's progress messages |
| `%TEMP%\CleanupErrors.log` | Errors, recorded once each |

The same messages are printed to the console in colour as the script runs.

## Things to know before running

- Resetting Winsock and the TCP/IP stack can remove static IP addresses, custom DNS servers, and some VPN or network-filter settings.
- Windows updates are installed automatically, but the computer is not restarted by the script.
- Crash dump files are deleted, so they are no longer available for troubleshooting a previous crash.
- Installing `PSWindowsUpdate` downloads a third-party module from the PowerShell Gallery.

## Related tools

- [FixNetwork — Python script for Windows network troubleshooting](https://github.com/gcfernando/python_codes/blob/main/FixNetwork/readme.md)
- [Developer tools and guides — repository overview](../README.md)
