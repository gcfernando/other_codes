<div align="center">

# ✨ Gehan's Project Lab ✨

### A colorful collection of practical tools, references, and local dev environments

Explore Linux commands, maintain a Windows machine, or spin up a multi-database sandbox—all from one repository.

[![Windows](https://img.shields.io/badge/Windows-PowerShell-5391FE?style=for-the-badge&logo=windows&logoColor=white)](SystemMaintenance/)
[![Linux](https://img.shields.io/badge/Linux-Command%20Reference-FCC624?style=for-the-badge&logo=linux&logoColor=black)](Linux_Commands/)
[![Containers](https://img.shields.io/badge/Containers-Podman-892CA0?style=for-the-badge&logo=podman&logoColor=white)](Files/compose.yml)
[![Offline](https://img.shields.io/badge/Linux%20reference-works%20offline-00A86B?style=for-the-badge&logo=googlechrome&logoColor=white)](Linux_Commands/)

</div>

---

## 🧭 What's in the lab?

| Project | What it does | Start here |
| --- | --- | --- |
| 🐧 **Linux Commands** | Searchable, offline-friendly browser reference with 361 commands across 16 cybersecurity-focused categories. | [`Linux_Commands/`](Linux_Commands/) |
| 🪟 **System Maintenance** | PowerShell script for Windows health checks, repairs, updates, network reset, and cleanup. | [`SystemMaintenance/`](SystemMaintenance/) |
| 🧰 **Local Services Stack** | Podman Compose setup for seven databases and developer tools with persistent volumes and health checks. | [`Files/compose.yml`](Files/compose.yml) |

## 🚀 Get started

### 🐧 Linux Commands

Open [`Linux_Commands/index.html`](Linux_Commands/index.html) in a browser—no build step or web server required. Search and filter commands by name, category, description, or example. The core reference works offline; Google Fonts are an optional online enhancement.

### 🪟 System Maintenance

Review [`SystemMaintenance/SystemMaintenance.ps1`](SystemMaintenance/SystemMaintenance.ps1) before running. From an **elevated PowerShell** window at the repository root:

```powershell
.\SystemMaintenance\SystemMaintenance.ps1
```

> ⚠️ **This script makes system-wide changes.** It may install Windows updates, repair the system image, schedule disk repairs, reset network settings and adapters, remove temporary files and crash dumps, and stop and restart a Windows service. Back up important data, save your work, and understand the script before execution. Run it only on a machine you administer.

### 🧰 Local Services Stack

Requires Podman with Compose support. From the repository root:

```powershell
podman compose -f Files/compose.yml up -d
podman compose -f Files/compose.yml ps
```

To stop the services while keeping their data:

```powershell
podman compose -f Files/compose.yml down
```

To also remove the stack's persistent data volumes:

```powershell
podman compose -f Files/compose.yml down -v
```

> 🔐 **Local development only.** The compose file contains default credentials and disables Elasticsearch security. Change the credentials before starting the stack, and do not expose these services to untrusted networks or use the configuration in production.

## 🧩 Services at a glance

| Service | Port(s) | Notes |
| --- | --- | --- |
| Microsoft SQL Server 2025 | `1433` | Persistent database volume |
| Elasticsearch 9.5 | `9200` | Security disabled in this local setup |
| Kibana 9.5 | `5601` | Connects to Elasticsearch |
| Oracle Database XE 21c | `1521` | Express Edition |
| MongoDB 8.0 | `27017` | Root authentication enabled |
| RabbitMQ 4.3 | `5672`, `15672` | AMQP and management UI |
| MySQL 8.4 | `3306` | Root account configured for local development |

The services use the `database_network` bridge network and named volumes so their data survives a normal `down`. The RabbitMQ management interface is available at [http://localhost:15672](http://localhost:15672) while the stack is running.

## 🌈 Linux reference highlights

- 🔎 Live search across commands, categories, descriptions, and usage examples
- 🏷️ Category dropdown and clickable filters
- 💻 Real-world examples in a terminal-inspired interface
- 📡 Static HTML, CSS, and JavaScript—no install or build required

Browse the [Linux Commands README](Linux_Commands/readme.md) for its category breakdown and examples.

## 📁 Repository layout

```text
.
├── Files/
│   └── compose.yml                  # Local development services
├── Linux_Commands/
│   ├── index.html                   # Open this in a browser
│   ├── styles.css                   # Terminal-inspired UI
│   ├── data.js                      # Command reference data
│   ├── app.js                       # Search, filters, and rendering
│   └── readme.md                    # Project details
├── SystemMaintenance/
│   ├── SystemMaintenance.ps1        # Windows maintenance script
│   └── readme.md                    # Script overview
└── README.md
```

## ⚖️ Responsible use

Use security-related command examples only in systems you own or are explicitly authorized to test. Treat the maintenance script and container stack as powerful tools: review their configuration, understand what they change, and keep development credentials and services away from production and untrusted networks.

---

<div align="center">

**Learn something. Build something. Keep it safe.** 💡

</div>
