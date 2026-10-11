<div align="center">

# 🌈🚀 THE FRIENDLY AI CODING PLUGIN GUIDE 🚀🌈

### 🧸 **39 tools explained as if you are using them for the very first time**

**Claude Code CLI · OpenAI Codex CLI · GitHub Copilot CLI · VS Code**

| 🟪 **39 TOOLS** | 🟩 **BEGINNER LEVEL** | 🟧 **OCTOBER 2026** |
|:---:|:---:|:---:|

### 🟢 Discover → 🔵 Install → 🟣 Configure → 🟠 Try → ✅ Check

**💚 No coding expertise needed to understand this guide.**

</div>

> [!NOTE]
> 🌈 **About the colors:** GitHub Markdown does not allow reliable custom text/background colors. This file uses a horizontal color-keyed status bar, emojis, clear numbered steps and GitHub-friendly callouts. For **full colors, large cards, search and a dark-mode toggle**, open the companion `AI_Coding_Plugins_Visual_Guide_REDESIGNED.html` in your browser. The Markdown file is complete on its own.

> [!IMPORTANT]
> ✅ All **39 distinct tools** from our earlier Codex/Claude/Copilot lists are included. The attached engineer's note listed **OmniRoute twice**; it appears once. They are **not all native plugins**: some are skills, MCP servers, command-line tools or hosted integrations. This document does not claim to have installed or tested them on your computer.

---

<a id="-step-zero--your-60-second-start"></a>

## 🐣 STEP ZERO — Your 60-second start

Imagine your AI assistant is a helper in a workshop. 🧰

| 🧸 Simple word | 🌟 What it means | 👀 Easy example |
|---|---|---|
| **Plugin** 🧩 | A package that gives your assistant extra abilities | Adds a code-review workflow |
| **Skill** 📒 | A short recipe your assistant follows | “Write the test first” |
| **MCP server** 🌉 | A bridge from your assistant to another tool | Let AI read GitHub issues |
| **CLI** ⌨️ | A program you run in Terminal | `claude`, `codex`, `copilot` |
| **Configure** ⚙️ | Connect accounts and pick safe settings | Choose read-only access |
| **Token** 🪙 | A unit of text processed by an AI model | Long terminal logs consume tokens |
| **VS Code** 💙 | A code editor; AI chat is inside it | Copilot Agent mode |

### 🎯 What should I install first?

| If you say... 💭 | Start with... ✅ | Why? |
|---|---|---|
| “I waste tokens reading huge logs.” 💸 | [RTK](#rtk-rust-token-killer) | Filters noisy terminal output |
| “My AI cannot find the right function.” 🧭 | [Serena](#serena) | Finds code symbols precisely |
| “My AI keeps using outdated APIs.” 📚 | [Context7](#context7) | Fetches current library docs |
| “I want better engineering quality.” 🧪 | [Superpowers](#superpowers) **or** [Agent Skills](#agent-skills-addy-osmani) | Adds planning and testing recipes |
| “I restart sessions and lose context.” 🧠 | [Claude-Mem](#claude-mem) | Recalls previous project notes |
| “I need browser tests.” 🎭 | [Playwright MCP](#playwright-mcp) | Exercises real pages |

> [!TIP]
> 🌟 **The easiest starter pack is 3 tools:** Context7 + Serena + RTK. Add only the extras you actually need. More plugins ≠ automatically better performance or fewer tokens.

### 🧭 Jump straight to your assistant

**🟩 [Codex CLI plugin list](#-codex-cli-my-plugin-list) · 🟧 [Claude Code plugin list](#-claude-code-cli-my-plugin-list) · 🟪 [GitHub Copilot CLI + VS Code list](#-copilot-cli--vs-code-my-plugin-list)**

**📚 [All 39 explained](#-every-plugin-in-plain-english) · 🩹 [Troubleshooting](#-quick-fixes-when-something-goes-wrong)**

---

## 🧰 FIRST TIME: Where do I type things?

**This is the most important beginner detail:**

| 💻 You are using | ✅ To open it (in Terminal) | 📦 Where to install a marketplace plugin | 🚀 Where to ask for help |
|---|---|---|---|
| 🟧 **Claude Code CLI** | `claude` | In Claude chat: `/plugin …` | In Claude chat, ask a question |
| 🟩 **Codex CLI** | `codex` | In Codex: `/plugins` or in Terminal: `codex plugin …` | In Codex chat |
| 🟪 **Copilot CLI** | `copilot` | In Terminal: `copilot plugin …` | In Copilot chat |
| 💙 **VS Code Copilot** | Open VS Code | Extensions → search `@agentPlugins`; **Agent Customizations** → Discover | Copilot Chat → **Agent** |
| 💙 **VS Code Codex** | Open VS Code with Codex extension | Follow the **Codex** setup and extension support | Codex's own chat/editor panel |

> [!CAUTION]
> ⚠️ `gh` is the **GitHub CLI**, but `copilot` is the standalone **GitHub Copilot CLI**. They are different commands. VS Code Copilot and VS Code Codex also have different plugin capabilities.

### ✅ A safe 4-step practice run

1. 🧪 Open a **small test project** (not sensitive company code).
2. 📦 Choose **one** plugin from the lists below and follow its installation recipe.
3. ⚙️ Connect only the accounts it needs. Prefer **read-only** permissions first.
4. 🚀 Open a **fresh AI session**, paste the example prompt, and **verify the output**.

---

<a id="-codex-cli-my-plugin-list"></a>

## 🟩 Codex CLI — My plugin list

![19 tools](https://img.shields.io/badge/19_tools-16A34A?style=for-the-badge)

**Read only this list if you use Codex.** Tap a tool name to open its simple guide. 🎯

**01. 🧭 [Serena](#serena)** — Great for understanding unfamiliar projects, targeted edits and large repositories. May avoid reading whole files.

**02. 📚 [Context7](#context7)** — Reduces answers based on outdated SDK syntax and repeated rework.

**03. 🦸 [Superpowers](#superpowers)** — Helps prevent rushed implementations and untested assumptions.

**04. ⚡ [RTK / Rust Token Killer](#rtk-rust-token-killer)** — Directly reduces noisy output from common Git, test, lint and build commands.

**05. 🗜️ [Headroom](#headroom)** — May keep long sessions usable with fewer input tokens.

**06. 🪶 [Ponytail](#ponytail)** — Encourages less duplication, fewer dependencies and smaller, maintainable changes.

**07. 🕸️ [Graphify](#graphify)** — Helpful when you need an architecture map or must track how changes flow through many modules.

**08. 🧰 [Agent Skills (Addy Osmani)](#agent-skills-addy-osmani)** — Makes your quality process consistent across assistants.

**09. 🧠 [Claude-Mem](#claude-mem)** — Less re-explanation when you return to a project after a break.

**10. 🔀 [OmniRoute](#omniroute)** — Can help control model spend, provider outages and routing policies.

**11. 🐙 [GitHub MCP Server](#github-mcp-server)** — Cuts tab switching; enables repo-aware reviews and issue-to-PR workflows.

**12. 🛡️ [SonarQube MCP Server](#sonarqube-mcp-server)** — Grounds the agent in actual static-analysis results instead of guesses.

**13. 🎭 [Playwright MCP](#playwright-mcp)** — Reproduces UI bugs and checks real browser behavior.

**14. 🔍 [Chrome DevTools MCP](#chrome-devtools-mcp)** — Excellent for frontend performance issues and JavaScript errors.

**15. 🐇 [CodeRabbit](#coderabbit)** — Extra feedback on risks, complexity and review issues before a PR.

**16. 🧯 [Codex Security](#codex-security)** — Structured security review and targeted remediation.

**17. 🧪 [OpenAI Developers](#openai-developers)** — Safer development with current API behavior and code examples.

**18. 🎨 [Figma (Codex plugin)](#figma-codex-plugin)** — Less guesswork about visual details and reusable component conventions.

**19. 🏗️ [Build Web Apps (Codex)](#build-web-apps-codex)** — Convenient scaffold/workflow for web app development.

---

<a id="-claude-code-cli-my-plugin-list"></a>

## 🟧 Claude Code CLI — My plugin list

![24 tools](https://img.shields.io/badge/24_tools-EA580C?style=for-the-badge)

**Read only this list if you use Claude Code.** Tap a tool name to open its simple guide. 🎯

**01. 🛠️ [Claude Code Setup](#claude-code-setup)** — Personalized Claude setup, less guesswork.

**02. 🦸 [Superpowers](#superpowers)** — Helps prevent rushed implementations and untested assumptions.

**03. 🧭 [Serena](#serena)** — Great for understanding unfamiliar projects, targeted edits and large repositories. May avoid reading whole files.

**04. 📚 [Context7](#context7)** — Reduces answers based on outdated SDK syntax and repeated rework.

**05. ⚡ [RTK / Rust Token Killer](#rtk-rust-token-killer)** — Directly reduces noisy output from common Git, test, lint and build commands.

**06. 🗜️ [Headroom](#headroom)** — May keep long sessions usable with fewer input tokens.

**07. 🧠 [Claude-Mem](#claude-mem)** — Less re-explanation when you return to a project after a break.

**08. 🧹 [Code Simplifier](#code-simplifier)** — Readable, maintainable patches.

**09. 🪶 [Ponytail](#ponytail)** — Encourages less duplication, fewer dependencies and smaller, maintainable changes.

**10. 🕸️ [Graphify](#graphify)** — Helpful when you need an architecture map or must track how changes flow through many modules.

**11. 🧰 [Agent Skills (Addy Osmani)](#agent-skills-addy-osmani)** — Makes your quality process consistent across assistants.

**12. 👀 [Task Observer](#task-observer)** — Gradually improves a growing collection of personal skills.

**13. 🧩 [Feature Dev](#feature-dev)** — Better planning for nontrivial features.

**14. 🧐 [PR Review Toolkit](#pr-review-toolkit)** — Thorough review of important PRs.

**15. 🔐 [Security Guidance](#security-guidance)** — Catches risky patterns early.

**16. 🧬 [Claude Security](#claude-security)** — Useful for targeted AppSec reviews.

**17. 📝 [CLAUDE.md Management](#claudemd-management)** — Cleaner, reusable repo guidance.

**18. 🧠 [Language Server Plugins](#language-server-plugins)** — Higher precision for typed languages.

**19. 🐙 [GitHub MCP Server](#github-mcp-server)** — Cuts tab switching; enables repo-aware reviews and issue-to-PR workflows.

**20. 🛡️ [SonarQube MCP Server](#sonarqube-mcp-server)** — Grounds the agent in actual static-analysis results instead of guesses.

**21. 🎭 [Playwright MCP](#playwright-mcp)** — Reproduces UI bugs and checks real browser behavior.

**22. 🔍 [Chrome DevTools MCP](#chrome-devtools-mcp)** — Excellent for frontend performance issues and JavaScript errors.

**23. 🔀 [OmniRoute](#omniroute)** — Can help control model spend, provider outages and routing policies.

**24. 🕵️ [Semgrep](#semgrep)** — Deterministic findings that complement AI judgement.

---

<a id="-copilot-cli--vs-code-my-plugin-list"></a>

## 🟪 Copilot CLI + VS Code — My plugin list

![24 tools](https://img.shields.io/badge/24_tools-7C3AED?style=for-the-badge)

**Read only this list if you use Copilot.** Tap a tool name to open its simple guide. 🎯

**01. 🧠 [Context Engineering](#context-engineering)** — Keeps AI focused on the right files.

**02. 🧪 [Testing Automation](#testing-automation)** — More reliable unit, integration and E2E tests.

**03. 🔒 [Security Best Practices](#security-best-practices)** — Adds structured review criteria.

**04. 🗂️ [Project Planning](#project-planning)** — Clearer scope before implementation.

**05. 💬 [PR Review](#pr-review)** — Makes complex PRs easier to inspect.

**06. 📊 [Chronicle Stats / My AI Usage](#chronicle-stats-my-ai-usage)** — Measures token/credit patterns before optimizing.

**07. 🧭 [Serena](#serena)** — Great for understanding unfamiliar projects, targeted edits and large repositories. May avoid reading whole files.

**08. 📚 [Context7](#context7)** — Reduces answers based on outdated SDK syntax and repeated rework.

**09. ⚡ [RTK / Rust Token Killer](#rtk-rust-token-killer)** — Directly reduces noisy output from common Git, test, lint and build commands.

**10. 🗜️ [Headroom](#headroom)** — May keep long sessions usable with fewer input tokens.

**11. 🦸 [Superpowers](#superpowers)** — Helps prevent rushed implementations and untested assumptions.

**12. 🪶 [Ponytail](#ponytail)** — Encourages less duplication, fewer dependencies and smaller, maintainable changes.

**13. 🕸️ [Graphify](#graphify)** — Helpful when you need an architecture map or must track how changes flow through many modules.

**14. 🧰 [Agent Skills (Addy Osmani)](#agent-skills-addy-osmani)** — Makes your quality process consistent across assistants.

**15. 🧠 [Claude-Mem](#claude-mem)** — Less re-explanation when you return to a project after a break.

**16. 🐙 [GitHub MCP Server](#github-mcp-server)** — Cuts tab switching; enables repo-aware reviews and issue-to-PR workflows.

**17. 🛡️ [SonarQube MCP Server](#sonarqube-mcp-server)** — Grounds the agent in actual static-analysis results instead of guesses.

**18. 🎭 [Playwright MCP](#playwright-mcp)** — Reproduces UI bugs and checks real browser behavior.

**19. 🔍 [Chrome DevTools MCP](#chrome-devtools-mcp)** — Excellent for frontend performance issues and JavaScript errors.

**20. ☕ [Java Development](#java-development)** — Strong defaults for Java projects.

**21. 🟣 [C# / .NET Development](#c-net-development)** — Helps .NET teams stay consistent.

**22. 🌈 [Frontend Web Dev](#frontend-web-dev)** — Better frontend conventions and accessibility checks.

**23. 🧷 [Where Was I](#where-was-i)** — Easy resumption after interruptions.

**24. 🔀 [OmniRoute](#omniroute)** — Can help control model spend, provider outages and routing policies.

---
<a id="-every-plugin-in-plain-english"></a>

## 📖 Every plugin in plain English

Every plugin provides the **three steps you asked for, fully visible**, plus a success check:

**🧸 WHAT** = plain-English meaning  ·  **🌟 WHY** = the benefit  ·  **📦 INSTALL** = how to get it  ·  **⚙️ SET UP** = how to configure it  ·  **🚀 TRY** = a prompt you can copy

> [!TIP]
> 👇 **No hidden steps!** Read the three large headings under each plugin: 📦 **Install** → ⚙️ **Configure** → 🚀 **Use**. A fourth heading shows how to verify success. If a tool is client-specific, the other client is marked unsupported.


---

## 🟢 Save tokens & remember

![Save tokens & remember](https://img.shields.io/badge/Save_tokens_&_remember-25A65A?style=for-the-badge)

*Less context, useful history, controlled cost*


<a id="rtk-rust-token-killer"></a>

### ⚡ RTK / Rust Token Killer

**🧸 What is it?** 🧽 Like a filter that removes noisy terminal lines before AI reads them.

**🌟 Why use it?** Directly reduces noisy output from common Git, test, lint and build commands.

**🧑‍💻 Simple example:** “Run only the relevant tests and show me failures and their useful diagnostics.”

**✅ Where it fits:** 🟩 Codex · 🟧 Claude · 🟪 Copilot · 💙 VS Code via relevant extension/terminal

**🔖 Type:** Shared MCP / CLI / skill — setup differs by client · **Difficulty:** 🟢 Low-friction experiment

📎 **[Official / maintainer source](https://github.com/rtk-ai/rtk)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

**macOS / Linux with Homebrew:** `brew install rtk-ai/tap/rtk`. **Windows PowerShell:** `winget install rtk-ai.rtk`. **Linux without Homebrew:** open [the official installation page](https://www.rtk-ai.app/docs/getting-started/installation/) and choose its supported install method. **Check in Terminal:** `rtk --version` then `rtk gain` (must show the token-savings dashboard).

#### ⚙️ STEP 2 · HOW TO CONFIGURE

**Claude Code:** `rtk init --global`. **Codex / Copilot:** use the matching documented adapter (`rtk init --global --codex` or `rtk init --global --copilot`) if available in your installed release; inspect `rtk init --help` first. Preview changes with `rtk init --global --dry-run`; reopen your assistant.

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Run only the relevant tests and show me failures and their useful diagnostics.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | Run your usual tests and ask for only failures; check `rtk gain`. |
| **🟩 Codex CLI** | Inspect `rtk gain` after the agent runs a build. |
| **🟪 Copilot CLI** | Ask Copilot to run focused tests; note its CLI hook may offer suggestions instead of transparent rewriting. |
| **💙 VS Code** | With Copilot Agent, run focused commands and inspect `rtk gain` in the terminal. |

#### ✅ STEP 4 · CHECK IT WORKS

In Terminal run `rtk gain`; if it is empty, first let the agent run a supported command. Review compressed output if details disappear.

**⚠️ WATCH OUT:** Never replace full logs when details are essential. There is another unrelated `rtk` project: check `rtk gain`.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


<a id="headroom"></a>

### 🗜️ Headroom

**🧸 What is it?** 🧳 Like packing a large suitcase more tightly—less context to send.

**🌟 Why use it?** May keep long sessions usable with fewer input tokens.

**🧑‍💻 Simple example:** “Inspect one long test run and compare the compressed output with the original before using it widely.”

**✅ Where it fits:** 🟩 Codex · 🟧 Claude · 🟪 Copilot · 💙 VS Code via relevant extension/terminal

**🔖 Type:** Shared MCP / CLI / skill — setup differs by client · **Difficulty:** 🟡 Proxy / data routing

📎 **[Official / maintainer source](https://github.com/headroomlabs-ai/headroom)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

**Terminal (Python with uv):** `uv tool install --python 3.13 "headroom-ai[all]"` → `headroom --version`. Start with local/test code. The CLI is from the Python package—not the Node SDK.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

Read the [quick start](https://github.com/headroomlabs-ai/headroom/blob/main/wiki/quickstart.md). The supported wrapper workflows include `headroom wrap claude`, `headroom wrap codex` and `headroom wrap copilot` (mode/provider dependent). Compare quality **before** routing real repository data.

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Inspect one long test run and compare the compressed output with the original before using it widely.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | Launch with `headroom wrap claude`; compare long-session quality. |
| **🟩 Codex CLI** | Launch with `headroom wrap codex`; inspect whether relevant diagnostics remain. |
| **🟪 Copilot CLI** | Launch with `headroom wrap copilot`; compare output and model use. |
| **💙 VS Code** | Use supported agent CLI from VS Code terminal; VS Code Copilot integration can need separate client wiring. |

#### ✅ STEP 4 · CHECK IT WORKS

Run `headroom --version`. Try one controlled task both with and without its proxy and compare results.

**⚠️ WATCH OUT:** Proxying can affect provider policies, caching and output fidelity. Benchmark with and without it.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


<a id="claude-mem"></a>

### 🧠 Claude-Mem

**🧸 What is it?** 🧠 Like project notes that are available when you open a new AI session.

**🌟 Why use it?** Less re-explanation when you return to a project after a break.

**🧑‍💻 Simple example:** “What did we learn about this project in my previous sessions?”

**✅ Where it fits:** 🟩 Codex · 🟧 Claude · 🟪 Copilot · 💙 VS Code via relevant extension/terminal

**🔖 Type:** Shared MCP / CLI / skill — setup differs by client · **Difficulty:** 🟡 Privacy review

📎 **[Official / maintainer source](https://github.com/thedotmack/claude-mem)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

**Terminal:** `npx claude-mem install` → choose your supported host when asked. To choose explicitly, use `--ide claude-code`, `--ide codex-cli` or `--ide copilot-cli`. **Do not use** `npm install -g claude-mem` for a complete hook installation.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

Pick a permitted memory provider and storage mode. Check `npx claude-mem status` and `npx claude-mem doctor`. Memory may be local **or** use a hosted service depending on choices: inspect privacy, telemetry and retention.

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> What did we learn about this project in my previous sessions?

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | “Search previous observations about this test failure.” |
| **🟩 Codex CLI** | “Retrieve relevant memory about the earlier refactor.” |
| **🟪 Copilot CLI** | “Search memory for the last PR context.” |
| **💙 VS Code** | Use the memory through the installed coding client; extension compatibility is not identical to Copilot CLI. |

#### ✅ STEP 4 · CHECK IT WORKS

Run `npx claude-mem doctor`; complete a small session, start a new one and ask about the earlier topic.

**⚠️ WATCH OUT:** Never assume perfect memory. Avoid placing company secrets, tokens or private data into unapproved storage.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


<a id="omniroute"></a>

### 🔀 OmniRoute

**🧸 What is it?** 🚦 Like a traffic controller that sends AI requests to selected providers.

**🌟 Why use it?** Can help control model spend, provider outages and routing policies.

**🧑‍💻 Simple example:** “Route a non-sensitive test task to the approved model and show which route was selected.”

**✅ Where it fits:** 🟩 Codex · 🟧 Claude · 🟪 Copilot · 💙 VS Code via relevant extension/terminal

**🔖 Type:** Shared MCP / CLI / skill — setup differs by client · **Difficulty:** 🔴 Advanced setup

📎 **[Official / maintainer source](https://github.com/diegosouzapw/OmniRoute)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

**Terminal:** install a compatible Node.js version, then `npm install -g omniroute` and run `omniroute`. Open `http://localhost:20128` (the documented local dashboard).

#### ⚙️ STEP 2 · HOW TO CONFIGURE

Dashboard → **Providers**: connect approved model accounts. Dashboard → **Endpoints**: inspect the endpoint and credentials. Follow the [official CLI integration wiki](https://github.com/diegosouzapw/OmniRoute/wiki/CLI-Integrations) for each agent; not every model-routing mode is compatible with every account or employer policy.

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Route a non-sensitive test task to the approved model and show which route was selected.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | Run `omniroute launch` for the maintainer-supported Claude launcher after configuring providers. |
| **🟩 Codex CLI** | Run `omniroute launch-codex` where supported; verify the intended model route. |
| **🟪 Copilot CLI** | Follow OmniRoute’s Copilot integration instructions; external model routing is version-dependent. |
| **💙 VS Code** | Use the linked **OmniCopilot** VS Code extension and select its model in Copilot Chat (subject to supported versions). |

#### ✅ STEP 4 · CHECK IT WORKS

Open `http://localhost:20128`, check the provider route, then perform a non-sensitive test request.

**⚠️ WATCH OUT:** Not unlimited free usage: provider quotas, terms and expenses still apply. Treat credentials and outbound code exposure as a security review item.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


<a id="chronicle-stats-my-ai-usage"></a>

### 📊 Chronicle Stats / My AI Usage

**🧸 What is it?** 📊 Like a dashboard that shows where Copilot spends tokens.

**🌟 Why use it?** Measures token/credit patterns before optimizing.

**🧑‍💻 Simple example:** “Show my Copilot token usage trends by day and model.”

**✅ Where it fits:** 🟪 Copilot · 💙 VS Code via relevant extension/terminal

**🔖 Type:** Native plugin / specialized integration · **Difficulty:** 🟡 Copilot app-dependent

📎 **[Official / maintainer source](https://github.com/github/awesome-copilot/tree/main/plugins/chronicle-stats)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

In a terminal: `copilot plugin install chronicle-stats@awesome-copilot`. For VS Code, search `@agentPlugins` in Extensions for **chronicle-stats**.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

Install in Copilot CLI, then open its supported **usage canvas / app experience**. For quick basic numbers, you can also use Copilot CLI built-in `/usage` or `/context` without this plugin.

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Show my Copilot token usage trends by day and model.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | Not the same plugin; use equivalent Claude skills or repo instructions. |
| **🟩 Codex CLI** | Not the same plugin; use equivalent Codex skills or repo instructions. |
| **🟪 Copilot CLI** | For usage details, the extension is primarily intended for the Copilot app canvas (not an ordinary CLI command). |
| **💙 VS Code** | Open the installed Copilot app **My AI Usage** canvas; requires compatible Copilot app, Node and sign-in. |

#### ✅ STEP 4 · CHECK IT WORKS

Run `copilot plugin list`. Open a fresh session or check VS Code’s plugin list; then try the example prompt.

**⚠️ WATCH OUT:** The My AI Usage and PR Review experiences may require a Copilot app canvas and are not plain VS Code slash commands.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


---

## 🔵 Understand code & documentation

![Understand code & documentation](https://img.shields.io/badge/Understand_code_&_documentation-1582D1?style=for-the-badge)

*Find the right function; use the right APIs*


<a id="serena"></a>

### 🧭 Serena

**🧸 What is it?** 🗺️ Like GPS for functions and classes: it can find the exact place to edit.

**🌟 Why use it?** Great for understanding unfamiliar projects, targeted edits and large repositories. May avoid reading whole files.

**🧑‍💻 Simple example:** “Find the function that checks user permissions and show which files call it.”

**✅ Where it fits:** 🟩 Codex · 🟧 Claude · 🟪 Copilot · 💙 VS Code via relevant extension/terminal

**🔖 Type:** Shared MCP / CLI / skill — setup differs by client · **Difficulty:** 🟡 Setup needed

📎 **[Official / maintainer source](https://github.com/oraios/serena)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

Install **uv**, then `uv tool install -p 3.13 serena-agent` and `serena init`. Follow the [client configuration guide](https://github.com/oraios/serena) to register Serena as an MCP server in your chosen assistant.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

Choose the right language backend in Serena; make sure the repository and language-server dependencies are available. Register the server in each client you use, then reopen the repo.

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Find the function that checks user permissions and show which files call it.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | Ask: “Use Serena to find the symbol that implements authentication.” |
| **🟩 Codex CLI** | Ask: “Find callers of `validateOrder` with Serena; edit only the relevant symbols.” |
| **🟪 Copilot CLI** | Ask: “With Serena, show references to this class.” (requires its MCP registration). |
| **💙 VS Code** | Use the **Codex** or **Copilot Agent** surface after its MCP setup, then ask the same symbol-level question. |

#### ✅ STEP 4 · CHECK IT WORKS

Check the installer output for the actual installed location; restart the agent and ask the example prompt. Confirm the result against the real code/tests.

**⚠️ WATCH OUT:** Indexing and language support vary by project. Do not confuse symbol search with a guaranteed reduction in billed tokens.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


<a id="context7"></a>

### 📚 Context7

**🧸 What is it?** 📖 Like a freshly updated instruction manual for the libraries your app uses.

**🌟 Why use it?** Reduces answers based on outdated SDK syntax and repeated rework.

**🧑‍💻 Simple example:** “Check the latest documentation for the version of the library installed in this project before changing code.”

**✅ Where it fits:** 🟩 Codex · 🟧 Claude · 🟪 Copilot · 💙 VS Code via relevant extension/terminal

**🔖 Type:** Shared MCP / CLI / skill — setup differs by client · **Difficulty:** 🟢 Easy

📎 **[Official / maintainer source](https://github.com/upstash/context7)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

**Codex Terminal:** `codex plugin marketplace add upstash/context7` → `codex plugin add context7@context7-marketplace`. **Claude Code chat:** `/plugin marketplace add upstash/context7` → `/plugin install context7@context7-marketplace`. **Copilot CLI Terminal:** `npx ctx7 setup --copilot`. **VS Code Extensions:** search for `Upstash.context7-mcp` and click **Install**.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

**Claude plugin:** restart Claude, run `/mcp`, choose Context7, and sign in. **Copilot CLI:** finish the guided Context7 setup when prompted. **VS Code:** open Command Palette → `MCP: List Servers`; confirm **Context7** is listed. **Codex:** restart Codex and verify the plugin loads. Choose the correct library version before asking for API examples. [Maintainer guide](https://github.com/upstash/context7).

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Check the latest documentation for the version of the library installed in this project before changing code.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | “Use Context7 docs for the latest Spring Boot testing API.” |
| **🟩 Codex CLI** | “Use Context7 for the installed library version, then add tests.” |
| **🟪 Copilot CLI** | “Use Context7 to check the current React Router API.” |
| **💙 VS Code** | In Copilot Agent mode: “Use Context7 to verify the API before editing.” |

#### ✅ STEP 4 · CHECK IT WORKS

Check the installer output for the actual installed location; restart the agent and ask the example prompt. Confirm the result against the real code/tests.

**⚠️ WATCH OUT:** More retrieved docs can consume more context; ask targeted questions.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


<a id="graphify"></a>

### 🕸️ Graphify

**🧸 What is it?** 🕸️ Like a map of how files, functions, and modules connect.

**🌟 Why use it?** Helpful when you need an architecture map or must track how changes flow through many modules.

**🧑‍💻 Simple example:** “Show which components are affected if this order service interface changes.”

**✅ Where it fits:** 🟩 Codex · 🟧 Claude · 🟪 Copilot · 💙 VS Code via relevant extension/terminal

**🔖 Type:** Shared MCP / CLI / skill — setup differs by client · **Difficulty:** 🟡 Indexing needed

📎 **[Official / maintainer source](https://github.com/Graphify-Labs/graphify)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

**Terminal:** `uv tool install graphifyy` (**double y**), then `graphify install --platform codex` / `--platform copilot` or `graphify install` for Claude; use `graphify vscode install` for VS Code Copilot Chat. Run from the project you want to analyze.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

Its installer writes a skill to your workspace or user profile; select the intended scope (`--project` for project-only) and review changed files. Invoke `/graphify .` on Claude or `$graphify` on Codex; see its [README](https://github.com/Graphify-Labs/graphify/blob/v8/README.md).

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Show which components are affected if this order service interface changes.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | “Use Graphify to locate the order-to-invoice dependency path.” |
| **🟩 Codex CLI** | “Query Graphify before reading whole modules.” |
| **🟪 Copilot CLI** | “Use Graphify to identify impacted components.” |
| **💙 VS Code** | Use the generated skills/instructions from the right client; review `graphify-out/GRAPH_REPORT.md` as needed. |

#### ✅ STEP 4 · CHECK IT WORKS

Run `graphify --help` then try the installed Graphify skill in a test project; inspect newly created graph/report files.

**⚠️ WATCH OUT:** Graph generation adds up-front time and needs refreshing as the code changes.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


<a id="language-server-plugins"></a>

### 🧠 Language Server Plugins

**🧸 What is it?** 🔤 Like giving Claude a language-aware dictionary for your code.

**🌟 Why use it?** Higher precision for typed languages.

**🧑‍💻 Simple example:** “Use language-server diagnostics to identify why this type check fails.”

**✅ Where it fits:** 🟧 Claude

**🔖 Type:** Native plugin / specialized integration · **Difficulty:** 🟡 Setup needed

📎 **[Official / maintainer source](https://github.com/anthropics/claude-plugins-official/tree/main/plugins/typescript-lsp)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

In Claude `/plugin` → Discover, select a plugin such as `typescript-lsp` or `pyright-lsp`; an LSP plugin is a **family**, not one universal install.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

Choose the language-specific variant matching your repository and ensure the corresponding language server is installed and running.

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Use language-server diagnostics to identify why this type check fails.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | “Use LSP definitions and diagnostics to locate the type error.” |
| **🟩 Codex CLI** | Not a Codex plugin; use a corresponding Codex skill/MCP when available. |
| **🟪 Copilot CLI** | Not directly installable as the same native plugin. |
| **💙 VS Code** | Use through Claude Code in VS Code terminal, or choose an editor-native alternative. |

#### ✅ STEP 4 · CHECK IT WORKS

In Claude Code open `/plugin` to confirm installation, then try the example prompt in a fresh session.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


<a id="context-engineering"></a>

### 🧠 Context Engineering

**🧸 What is it?** 🎯 Like handing Copilot only the pages it actually needs.

**🌟 Why use it?** Keeps AI focused on the right files.

**🧑‍💻 Simple example:** “Choose the minimum files needed to change this endpoint and explain why.”

**✅ Where it fits:** 🟪 Copilot · 💙 VS Code via relevant extension/terminal

**🔖 Type:** Native plugin / specialized integration · **Difficulty:** 🟢 Easy

📎 **[Official / maintainer source](https://github.com/github/awesome-copilot/tree/main/plugins/context-engineering)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

In a terminal: `copilot plugin install context-engineering@awesome-copilot`. For VS Code, search `@agentPlugins` in Extensions for **context-engineering**.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

After installing run `copilot plugin list`; start a new Copilot session. In VS Code enable the plugin in your workspace and use **Agent** mode. Check its skills/commands in the plugin details.

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Choose the minimum files needed to change this endpoint and explain why.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | Not the same plugin; use equivalent Claude skills or repo instructions. |
| **🟩 Codex CLI** | Not the same plugin; use equivalent Codex skills or repo instructions. |
| **🟪 Copilot CLI** | “Use Context Engineering to plan a refactor across these modules.” |
| **💙 VS Code** | Open **Copilot Agent** and ask: “Use Context Engineering to plan a refactor across these modules.” |

#### ✅ STEP 4 · CHECK IT WORKS

Run `copilot plugin list`. Open a fresh session or check VS Code’s plugin list; then try the example prompt.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


---

## 🟣 Plan, build & simplify

![Plan, build & simplify](https://img.shields.io/badge/Plan,_build_&_simplify-8356DD?style=for-the-badge)

*Good habits, cleaner code, faster feature work*


<a id="superpowers"></a>

### 🦸 Superpowers

**🧸 What is it?** 🧑‍🏫 Like a careful coding coach: plan first, test, then build.

**🌟 Why use it?** Helps prevent rushed implementations and untested assumptions.

**🧑‍💻 Simple example:** “Help me plan this bug fix, write a failing test, then implement the smallest change.”

**✅ Where it fits:** 🟩 Codex · 🟧 Claude · 🟪 Copilot · 💙 VS Code via relevant extension/terminal

**🔖 Type:** Shared MCP / CLI / skill — setup differs by client · **Difficulty:** 🟢 Easy

📎 **[Official / maintainer source](https://github.com/obra/superpowers)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

**Claude:** `/plugin install superpowers@claude-plugins-official`. **Codex:** search **Superpowers** in `/plugins`. **Copilot CLI:** follow the [maintainer install guide](https://github.com/obra/superpowers); its plugin marketplace differs from the Claude one.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

After installing, start a fresh session. Allow its skills and commands; use one workflow at a time. Agree on a plan before agent-initiated changes.

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Help me plan this bug fix, write a failing test, then implement the smallest change.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | “Use Superpowers to brainstorm options, then write tests first.” |
| **🟩 Codex CLI** | “Use the Superpowers plan-and-execute workflow for this bug.” |
| **🟪 Copilot CLI** | “Apply a Superpowers TDD workflow to this endpoint.” |
| **💙 VS Code** | Use the same skill through the installed assistant extension; do not assume every slash command is shared across hosts. |

#### ✅ STEP 4 · CHECK IT WORKS

Check the installer output for the actual installed location; restart the agent and ask the example prompt. Confirm the result against the real code/tests.

**⚠️ WATCH OUT:** Extra planning, agents and review can **increase** token cost.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


<a id="ponytail"></a>

### 🪶 Ponytail

**🧸 What is it?** ✂️ Like a coach that asks: “Can we solve this with less code?”

**🌟 Why use it?** Encourages less duplication, fewer dependencies and smaller, maintainable changes.

**🧑‍💻 Simple example:** “Solve this bug with the smallest safe change; explain which extra code you avoided.”

**✅ Where it fits:** 🟩 Codex · 🟧 Claude · 🟪 Copilot · 💙 VS Code via relevant extension/terminal

**🔖 Type:** Shared MCP / CLI / skill — setup differs by client · **Difficulty:** 🟢 Easy

📎 **[Official / maintainer source](https://github.com/DietrichGebert/ponytail)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

**Claude:** `/plugin marketplace add DietrichGebert/ponytail` → `/plugin install ponytail@ponytail`. **Codex:** `codex plugin marketplace add DietrichGebert/ponytail` → `codex plugin add ponytail@ponytail`. **Copilot CLI:** `copilot plugin marketplace add DietrichGebert/ponytail` → `copilot plugin install ponytail@ponytail`.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

For Codex, review and trust hooks with `/hooks`. For editor-only Copilot Chat, copy the maintainer’s `.github/copilot-instructions.md` (it is not the same as Copilot CLI plugin hooks).

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Solve this bug with the smallest safe change; explain which extra code you avoided.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | “Apply Ponytail: choose the smallest robust fix.” |
| **🟩 Codex CLI** | “Use Ponytail and explain which code we avoided adding.” |
| **🟪 Copilot CLI** | Use a Ponytail slash command listed by your installed Copilot plugin, or ask it by name. |
| **💙 VS Code** | Open Copilot Chat with the copied rules or use Codex extension with `AGENTS.md`. |

#### ✅ STEP 4 · CHECK IT WORKS

Check the installer output for the actual installed location; restart the agent and ask the example prompt. Confirm the result against the real code/tests.

**⚠️ WATCH OUT:** “Less code” must never mean omitting validation, security or error handling.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


<a id="agent-skills-addy-osmani"></a>

### 🧰 Agent Skills (Addy Osmani)

**🧸 What is it?** 📒 Like a toolbox full of small, reusable engineering checklists.

**🌟 Why use it?** Makes your quality process consistent across assistants.

**🧑‍💻 Simple example:** “Use the test-driven-development skill to add a regression test for this bug.”

**✅ Where it fits:** 🟩 Codex · 🟧 Claude · 🟪 Copilot · 💙 VS Code via relevant extension/terminal

**🔖 Type:** Shared MCP / CLI / skill — setup differs by client · **Difficulty:** 🟢 Easy

📎 **[Official / maintainer source](https://github.com/addyosmani/agent-skills)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

**Codex terminal:** `codex plugin marketplace add addyosmani/agent-skills` → `codex plugin add agent-skills@agent-skills`. **Claude chat:** `/plugin marketplace add addyosmani/agent-skills` → `/plugin install agent-skills@addy-agent-skills`. **Copilot CLI terminal:** `copilot plugin install addyosmani/agent-skills`. **VS Code:** `npx skills add addyosmani/agent-skills` and choose your target agent.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

Start a fresh session. Install only necessary skills if you want less clutter: `npx skills add addyosmani/agent-skills --skill test-driven-development`. In Codex invoke `@test-driven-development`; in Copilot/VS Code use its discovered skill name. Do not preload all skill contents in always-on instructions.

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Use the test-driven-development skill to add a regression test for this bug.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | “Use the test-driven-development skill for this defect.” |
| **🟩 Codex CLI** | In Codex: `@test-driven-development` or ask to invoke that skill. |
| **🟪 Copilot CLI** | “Use code-review-and-quality on staged changes.” |
| **💙 VS Code** | In Copilot Agent mode invoke `/test-driven-development` if the skill is discovered; or describe it. |

#### ✅ STEP 4 · CHECK IT WORKS

Check the installer output for the actual installed location; restart the agent and ask the example prompt. Confirm the result against the real code/tests.

**⚠️ WATCH OUT:** The short `/spec` or `/review` aliases are Claude-specific; not automatically present in VS Code or Copilot CLI.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


<a id="claude-code-setup"></a>

### 🛠️ Claude Code Setup

**🧸 What is it?** 🪄 Like a setup wizard that suggests tools for your project.

**🌟 Why use it?** Personalized Claude setup, less guesswork.

**🧑‍💻 Simple example:** “Inspect this repository and suggest just three helpful Claude Code integrations.”

**✅ Where it fits:** 🟧 Claude

**🔖 Type:** Native plugin / specialized integration · **Difficulty:** 🟢 Easy

📎 **[Official / maintainer source](https://github.com/anthropics/claude-plugins-official/tree/main/plugins/claude-code-setup)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

In Claude Code run `/plugin install claude-code-setup@claude-plugins-official`.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

Review the plugin’s listed commands and settings in `/plugin`. Start a fresh session; turn on only the agents/checks required for your task.

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Inspect this repository and suggest just three helpful Claude Code integrations.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | “Analyze this repo and recommend the smallest useful Claude Code setup.” |
| **🟩 Codex CLI** | Not a Codex plugin; use a corresponding Codex skill/MCP when available. |
| **🟪 Copilot CLI** | Not directly installable as the same native plugin. |
| **💙 VS Code** | Use through Claude Code in VS Code terminal, or choose an editor-native alternative. |

#### ✅ STEP 4 · CHECK IT WORKS

Ask for just three repository-specific recommendations, and confirm it can reference the current project.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


<a id="code-simplifier"></a>

### 🧹 Code Simplifier

**🧸 What is it?** 🧹 Like a tidy-up pass that makes changed code easier to read.

**🌟 Why use it?** Readable, maintainable patches.

**🧑‍💻 Simple example:** “Simplify only the functions changed in this branch and keep behavior identical.”

**✅ Where it fits:** 🟧 Claude

**🔖 Type:** Native plugin / specialized integration · **Difficulty:** 🟢 Easy

📎 **[Official / maintainer source](https://github.com/anthropics/claude-plugins-official/tree/main/plugins/code-simplifier)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

In Claude Code run `/plugin install code-simplifier@claude-plugins-official`.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

Review the plugin’s listed commands and settings in `/plugin`. Start a fresh session; turn on only the agents/checks required for your task.

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Simplify only the functions changed in this branch and keep behavior identical.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | “Simplify these edited functions without changing behavior; run tests.” |
| **🟩 Codex CLI** | Not a Codex plugin; use a corresponding Codex skill/MCP when available. |
| **🟪 Copilot CLI** | Not directly installable as the same native plugin. |
| **💙 VS Code** | Use through Claude Code in VS Code terminal, or choose an editor-native alternative. |

#### ✅ STEP 4 · CHECK IT WORKS

In Claude Code open `/plugin` to confirm installation, then try the example prompt in a fresh session.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


<a id="feature-dev"></a>

### 🧩 Feature Dev

**🧸 What is it?** 🧩 Like a step-by-step recipe for building a complete feature.

**🌟 Why use it?** Better planning for nontrivial features.

**🧑‍💻 Simple example:** “Guide me through adding a settings page in safe, testable steps.”

**✅ Where it fits:** 🟧 Claude

**🔖 Type:** Native plugin / specialized integration · **Difficulty:** 🟢 Easy

📎 **[Official / maintainer source](https://github.com/anthropics/claude-plugins-official/tree/main/plugins/feature-dev)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

In Claude Code run `/plugin install feature-dev@claude-plugins-official`.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

Review the plugin’s listed commands and settings in `/plugin`. Start a fresh session; turn on only the agents/checks required for your task.

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Guide me through adding a settings page in safe, testable steps.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | “Use Feature Dev to add user preferences with tests.” |
| **🟩 Codex CLI** | Not a Codex plugin; use a corresponding Codex skill/MCP when available. |
| **🟪 Copilot CLI** | Not directly installable as the same native plugin. |
| **💙 VS Code** | Use through Claude Code in VS Code terminal, or choose an editor-native alternative. |

#### ✅ STEP 4 · CHECK IT WORKS

In Claude Code open `/plugin` to confirm installation, then try the example prompt in a fresh session.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


<a id="claudemd-management"></a>

### 📝 CLAUDE.md Management

**🧸 What is it?** 🗒️ Like a cleaner for the notes that tell Claude how your project works.

**🌟 Why use it?** Cleaner, reusable repo guidance.

**🧑‍💻 Simple example:** “Audit CLAUDE.md; keep only accurate project-specific instructions.”

**✅ Where it fits:** 🟧 Claude

**🔖 Type:** Native plugin / specialized integration · **Difficulty:** 🟢 Easy

📎 **[Official / maintainer source](https://github.com/anthropics/claude-plugins-official/tree/main/plugins/claude-md-management)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

In Claude Code run `/plugin install claude-md-management@claude-plugins-official`.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

After installing, say **“audit my CLAUDE.md files”** or run `/revise-claude-md` after a session. Review its changes before accepting them; instructions should stay short.

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Audit CLAUDE.md; keep only accurate project-specific instructions.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | “Audit CLAUDE.md for contradictions and unnecessary context.” |
| **🟩 Codex CLI** | Not a Codex plugin; use a corresponding Codex skill/MCP when available. |
| **🟪 Copilot CLI** | Not directly installable as the same native plugin. |
| **💙 VS Code** | Use through Claude Code in VS Code terminal, or choose an editor-native alternative. |

#### ✅ STEP 4 · CHECK IT WORKS

In Claude Code open `/plugin` to confirm installation, then try the example prompt in a fresh session.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


<a id="project-planning"></a>

### 🗂️ Project Planning

**🧸 What is it?** 🗓️ Like turning a huge feature into small, manageable tasks.

**🌟 Why use it?** Clearer scope before implementation.

**🧑‍💻 Simple example:** “Split this feature into five small steps with a test for each.”

**✅ Where it fits:** 🟪 Copilot · 💙 VS Code via relevant extension/terminal

**🔖 Type:** Native plugin / specialized integration · **Difficulty:** 🟢 Easy

📎 **[Official / maintainer source](https://github.com/github/awesome-copilot/tree/main/plugins/project-planning)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

In a terminal: `copilot plugin install project-planning@awesome-copilot`. For VS Code, search `@agentPlugins` in Extensions for **project-planning**.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

After installing run `copilot plugin list`; start a new Copilot session. In VS Code enable the plugin in your workspace and use **Agent** mode. Check its skills/commands in the plugin details.

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Split this feature into five small steps with a test for each.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | Not the same plugin; use equivalent Claude skills or repo instructions. |
| **🟩 Codex CLI** | Not the same plugin; use equivalent Codex skills or repo instructions. |
| **🟪 Copilot CLI** | “Write a 5-step implementation plan, each step testable.” |
| **💙 VS Code** | Open **Copilot Agent** and ask: “Write a 5-step implementation plan, each step testable.” |

#### ✅ STEP 4 · CHECK IT WORKS

Run `copilot plugin list`. Open a fresh session or check VS Code’s plugin list; then try the example prompt.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


<a id="java-development"></a>

### ☕ Java Development

**🧸 What is it?** ☕ Like an experienced Java teammate’s coding checklist.

**🌟 Why use it?** Strong defaults for Java projects.

**🧑‍💻 Simple example:** “Create JUnit tests for this Spring Boot service using existing project conventions.”

**✅ Where it fits:** 🟪 Copilot · 💙 VS Code via relevant extension/terminal

**🔖 Type:** Native plugin / specialized integration · **Difficulty:** 🟢 Easy

📎 **[Official / maintainer source](https://github.com/github/awesome-copilot/tree/main/plugins/java-development)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

In a terminal: `copilot plugin install java-development@awesome-copilot`. For VS Code, search `@agentPlugins` in Extensions for **java-development**.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

After installing run `copilot plugin list`; start a new Copilot session. In VS Code enable the plugin in your workspace and use **Agent** mode. Check its skills/commands in the plugin details.

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Create JUnit tests for this Spring Boot service using existing project conventions.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | Not the same plugin; use equivalent Claude skills or repo instructions. |
| **🟩 Codex CLI** | Not the same plugin; use equivalent Codex skills or repo instructions. |
| **🟪 Copilot CLI** | “Use Java Development guidance for a Spring Boot service test.” |
| **💙 VS Code** | Open **Copilot Agent** and ask: “Use Java Development guidance for a Spring Boot service test.” |

#### ✅ STEP 4 · CHECK IT WORKS

Run `copilot plugin list`. Open a fresh session or check VS Code’s plugin list; then try the example prompt.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


<a id="c-net-development"></a>

### 🟣 C# / .NET Development

**🧸 What is it?** 🟣 Like a C#/.NET teammate’s checklist for code and tests.

**🌟 Why use it?** Helps .NET teams stay consistent.

**🧑‍💻 Simple example:** “Refactor this ASP.NET controller and add xUnit tests using the existing setup.”

**✅ Where it fits:** 🟪 Copilot · 💙 VS Code via relevant extension/terminal

**🔖 Type:** Native plugin / specialized integration · **Difficulty:** 🟢 Easy

📎 **[Official / maintainer source](https://github.com/github/awesome-copilot/tree/main/plugins/csharp-dotnet-development)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

In a terminal: `copilot plugin install csharp-dotnet-development@awesome-copilot`. For VS Code, search `@agentPlugins` in Extensions for **csharp-dotnet-development**.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

After installing run `copilot plugin list`; start a new Copilot session. In VS Code enable the plugin in your workspace and use **Agent** mode. Check its skills/commands in the plugin details.

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Refactor this ASP.NET controller and add xUnit tests using the existing setup.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | Not the same plugin; use equivalent Claude skills or repo instructions. |
| **🟩 Codex CLI** | Not the same plugin; use equivalent Codex skills or repo instructions. |
| **🟪 Copilot CLI** | “Use C# .NET Development rules when refactoring this controller.” |
| **💙 VS Code** | Open **Copilot Agent** and ask: “Use C# .NET Development rules when refactoring this controller.” |

#### ✅ STEP 4 · CHECK IT WORKS

Run `copilot plugin list`. Open a fresh session or check VS Code’s plugin list; then try the example prompt.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


<a id="frontend-web-dev"></a>

### 🌈 Frontend Web Dev

**🧸 What is it?** 🌈 Like a helpful guide to polished, accessible web interfaces.

**🌟 Why use it?** Better frontend conventions and accessibility checks.

**🧑‍💻 Simple example:** “Build this responsive form with keyboard navigation and validation.”

**✅ Where it fits:** 🟪 Copilot · 💙 VS Code via relevant extension/terminal

**🔖 Type:** Native plugin / specialized integration · **Difficulty:** 🟢 Easy

📎 **[Official / maintainer source](https://github.com/github/awesome-copilot/tree/main/plugins/frontend-web-dev)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

In a terminal: `copilot plugin install frontend-web-dev@awesome-copilot`. For VS Code, search `@agentPlugins` in Extensions for **frontend-web-dev**.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

After installing run `copilot plugin list`; start a new Copilot session. In VS Code enable the plugin in your workspace and use **Agent** mode. Check its skills/commands in the plugin details.

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Build this responsive form with keyboard navigation and validation.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | Not the same plugin; use equivalent Claude skills or repo instructions. |
| **🟩 Codex CLI** | Not the same plugin; use equivalent Codex skills or repo instructions. |
| **🟪 Copilot CLI** | “Use Frontend Web Dev to implement this responsive form.” |
| **💙 VS Code** | Open **Copilot Agent** and ask: “Use Frontend Web Dev to implement this responsive form.” |

#### ✅ STEP 4 · CHECK IT WORKS

Run `copilot plugin list`. Open a fresh session or check VS Code’s plugin list; then try the example prompt.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


<a id="where-was-i"></a>

### 🧷 Where Was I

**🧸 What is it?** 📌 Like a bookmark that reminds you what you were doing yesterday.

**🌟 Why use it?** Easy resumption after interruptions.

**🧑‍💻 Simple example:** “Summarize my current branch, uncommitted changes, and likely next steps.”

**✅ Where it fits:** 🟪 Copilot · 💙 VS Code via relevant extension/terminal

**🔖 Type:** Native plugin / specialized integration · **Difficulty:** 🟢 Easy

📎 **[Official / maintainer source](https://github.com/github/awesome-copilot/tree/main/plugins/where-was-i)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

In a terminal: `copilot plugin install where-was-i@awesome-copilot`. For VS Code, search `@agentPlugins` in Extensions for **where-was-i**.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

After installing run `copilot plugin list`; start a new Copilot session. In VS Code enable the plugin in your workspace and use **Agent** mode. Check its skills/commands in the plugin details.

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Summarize my current branch, uncommitted changes, and likely next steps.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | Not the same plugin; use equivalent Claude skills or repo instructions. |
| **🟩 Codex CLI** | Not the same plugin; use equivalent Codex skills or repo instructions. |
| **🟪 Copilot CLI** | “Where was I? Summarize branch, local diffs and next steps.” |
| **💙 VS Code** | Open **Copilot Agent** and ask: “Where was I? Summarize branch, local diffs and next steps.” |

#### ✅ STEP 4 · CHECK IT WORKS

Run `copilot plugin list`. Open a fresh session or check VS Code’s plugin list; then try the example prompt.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


<a id="task-observer"></a>

### 👀 Task Observer

**🧸 What is it?** 👀 Like a notebook of repeated mistakes you can convert into better skills.

**🌟 Why use it?** Gradually improves a growing collection of personal skills.

**🧑‍💻 Simple example:** “Review repeated feedback from recent tasks and propose one reusable skill improvement.”

**✅ Where it fits:** 🟧 Claude

**🔖 Type:** Native plugin / specialized integration · **Difficulty:** 🟡 Needs activation

📎 **[Official / maintainer source](https://github.com/rebelytics/one-skill-to-rule-them-all)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

`npx skills add rebelytics/one-skill-to-rule-them-all --skill task-observer`. Preserve `SKILL.md`, `references/` and `scripts/`.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

Read `references/environments.md` in the repository and add its session-activation instruction to `CLAUDE.md`; select a stable observation-log folder. Restart and verify the log is created.

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Review repeated feedback from recent tasks and propose one reusable skill improvement.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | “Review the observation log and propose improvements; do not apply them yet.” |
| **🟩 Codex CLI** | A Codex adaptation may be needed; review the maintainer’s platform guidance. |
| **🟪 Copilot CLI** | Copilot support needs skill-path and activation adaptation. |
| **💙 VS Code** | Run through the assistant whose skill path you configured, not as a generic VS Code extension. |

#### ✅ STEP 4 · CHECK IT WORKS

In Claude Code open `/plugin` to confirm installation, then try the example prompt in a fresh session.

**⚠️ WATCH OUT:** This is not automatic self-editing; review proposed skill changes. Logs may contain sensitive context.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


---

## 🟠 Test, debug & review

![Test, debug & review](https://img.shields.io/badge/Test,_debug_&_review-EA8A19?style=for-the-badge)

*Check behavior instead of trusting guesses*


<a id="playwright-mcp"></a>

### 🎭 Playwright MCP

**🧸 What is it?** 🤖 Like letting your agent click through your website like a tester.

**🌟 Why use it?** Reproduces UI bugs and checks real browser behavior.

**🧑‍💻 Simple example:** “Open my local website and check whether the signup form works with test data.”

**✅ Where it fits:** 🟩 Codex · 🟧 Claude · 🟪 Copilot · 💙 VS Code via relevant extension/terminal

**🔖 Type:** Shared MCP / CLI / skill — setup differs by client · **Difficulty:** 🟢 Easy

📎 **[Official / maintainer source](https://github.com/microsoft/playwright-mcp)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

**Claude terminal:** `claude mcp add playwright npx @playwright/mcp@latest`. **Codex terminal:** `codex mcp add playwright -- npx @playwright/mcp@latest` (confirm local command syntax with `codex mcp add --help`). **Copilot CLI:** open `copilot`, run `/mcp add`, choose **Local / STDIO**, program `npx`, arguments `@playwright/mcp@latest`. **VS Code:** `MCP: Add Server`, choose **Command** = `npx`, args = `@playwright/mcp@latest`.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

Restart/start a new agent session; verify the **playwright** server appears in your MCP list. Keep testing in a disposable browser profile and use test credentials only.

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Open my local website and check whether the signup form works with test data.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | “Open localhost:3000 and verify login with a test account.” |
| **🟩 Codex CLI** | “Use Playwright to reproduce the button issue and propose a fix.” |
| **🟪 Copilot CLI** | “Visit the local form and report validation failures.” |
| **💙 VS Code** | Copilot Agent: “Use Playwright to check this screen on desktop width.” |

#### ✅ STEP 4 · CHECK IT WORKS

Ask the assistant to open a local test page and report its title; confirm the browser starts and that the MCP server is enabled.

**⚠️ WATCH OUT:** Browser tools can expose cookies/pages. Use test accounts, not personal sessions.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


<a id="chrome-devtools-mcp"></a>

### 🔍 Chrome DevTools MCP

**🧸 What is it?** 🔬 Like giving your agent the browser’s error console and network tab.

**🌟 Why use it?** Excellent for frontend performance issues and JavaScript errors.

**🧑‍💻 Simple example:** “Open the local web app and tell me which network request is failing.”

**✅ Where it fits:** 🟩 Codex · 🟧 Claude · 🟪 Copilot · 💙 VS Code via relevant extension/terminal

**🔖 Type:** Shared MCP / CLI / skill — setup differs by client · **Difficulty:** 🟡 Setup needed

📎 **[Official / maintainer source](https://github.com/ChromeDevTools/chrome-devtools-mcp)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

Add `npx -y chrome-devtools-mcp@latest` as a **local MCP server** in your target client. The [client guide](https://github.com/ChromeDevTools/chrome-devtools-mcp) covers VS Code and Claude.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

For a smaller tool surface use `--slim --headless`. If you attach to an existing Chrome via debugging port, bind it locally and avoid sensitive tabs.

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Open the local web app and tell me which network request is failing.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | “Use Chrome DevTools to find the failing network request.” |
| **🟩 Codex CLI** | “Investigate console errors and network timing.” |
| **🟪 Copilot CLI** | “Inspect the JavaScript console for this UI error.” |
| **💙 VS Code** | Copilot Agent: “Check slow requests in Chrome DevTools.” |

#### ✅ STEP 4 · CHECK IT WORKS

Ask the assistant to open a local test page and report its title; confirm the browser starts and that the MCP server is enabled.

**⚠️ WATCH OUT:** A live debugging port can grant broad browser control. Avoid it on sensitive sessions.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


<a id="testing-automation"></a>

### 🧪 Testing Automation

**🧸 What is it?** 🧪 Like a recipe book for writing and running better tests.

**🌟 Why use it?** More reliable unit, integration and E2E tests.

**🧑‍💻 Simple example:** “Write a failing unit test for this bug before making the fix.”

**✅ Where it fits:** 🟪 Copilot · 💙 VS Code via relevant extension/terminal

**🔖 Type:** Native plugin / specialized integration · **Difficulty:** 🟢 Easy

📎 **[Official / maintainer source](https://github.com/github/awesome-copilot/tree/main/plugins/testing-automation)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

In a terminal: `copilot plugin install testing-automation@awesome-copilot`. For VS Code, search `@agentPlugins` in Extensions for **testing-automation**.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

After installing run `copilot plugin list`; start a new Copilot session. In VS Code enable the plugin in your workspace and use **Agent** mode. Check its skills/commands in the plugin details.

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Write a failing unit test for this bug before making the fix.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | Not the same plugin; use equivalent Claude skills or repo instructions. |
| **🟩 Codex CLI** | Not the same plugin; use equivalent Codex skills or repo instructions. |
| **🟪 Copilot CLI** | “Use Testing Automation to add failing regression tests for this bug.” |
| **💙 VS Code** | Open **Copilot Agent** and ask: “Use Testing Automation to add failing regression tests for this bug.” |

#### ✅ STEP 4 · CHECK IT WORKS

Run `copilot plugin list`. Open a fresh session or check VS Code’s plugin list; then try the example prompt.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


<a id="pr-review-toolkit"></a>

### 🧐 PR Review Toolkit

**🧸 What is it?** 🧐 Like a team of reviewers checking different mistakes in a PR.

**🌟 Why use it?** Thorough review of important PRs.

**🧑‍💻 Simple example:** “Review this PR for bugs, missing tests, and risky error handling.”

**✅ Where it fits:** 🟧 Claude

**🔖 Type:** Native plugin / specialized integration · **Difficulty:** 🟢 Easy

📎 **[Official / maintainer source](https://github.com/anthropics/claude-plugins-official/tree/main/plugins/pr-review-toolkit)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

In Claude Code run `/plugin install pr-review-toolkit@claude-plugins-official`.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

Review the plugin’s listed commands and settings in `/plugin`. Start a fresh session; turn on only the agents/checks required for your task.

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Review this PR for bugs, missing tests, and risky error handling.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | “Review this PR for missing tests and correctness issues.” |
| **🟩 Codex CLI** | Not a Codex plugin; use a corresponding Codex skill/MCP when available. |
| **🟪 Copilot CLI** | Not directly installable as the same native plugin. |
| **💙 VS Code** | Use through Claude Code in VS Code terminal, or choose an editor-native alternative. |

#### ✅ STEP 4 · CHECK IT WORKS

In Claude Code open `/plugin` to confirm installation, then try the example prompt in a fresh session.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


<a id="pr-review"></a>

### 💬 PR Review

**🧸 What is it?** 🔎 Like an easier, grouped view of a GitHub pull request.

**🌟 Why use it?** Makes complex PRs easier to inspect.

**🧑‍💻 Simple example:** “Open this pull request and organize the changed files by topic.”

**✅ Where it fits:** 🟪 Copilot · 💙 VS Code via relevant extension/terminal

**🔖 Type:** Native plugin / specialized integration · **Difficulty:** 🟡 Copilot canvas-dependent

📎 **[Official / maintainer source](https://github.com/github/awesome-copilot/tree/main/plugins/pr-review)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

In a terminal: `copilot plugin install pr-review@awesome-copilot`. For VS Code, search `@agentPlugins` in Extensions for **pr-review**.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

In Copilot CLI, verify the plugin is loaded, open its **read-only PR-review canvas** where supported, and select a PR. It is an interactive extension—not simply a generic chat slash command in every VS Code build.

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Open this pull request and organize the changed files by topic.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | Not the same plugin; use equivalent Claude skills or repo instructions. |
| **🟩 Codex CLI** | Not the same plugin; use equivalent Codex skills or repo instructions. |
| **🟪 Copilot CLI** | “Open the PR Review interface for this pull request.” |
| **💙 VS Code** | Open the Copilot plugin/extension surface for a read-only diff canvas. |

#### ✅ STEP 4 · CHECK IT WORKS

Run `copilot plugin list`. Open a fresh session or check VS Code’s plugin list; then try the example prompt.

**⚠️ WATCH OUT:** The My AI Usage and PR Review experiences may require a Copilot app canvas and are not plain VS Code slash commands.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


<a id="coderabbit"></a>

### 🐇 CodeRabbit

**🧸 What is it?** 🐰 Like a second reviewer that checks your changes before you share them.

**🌟 Why use it?** Extra feedback on risks, complexity and review issues before a PR.

**🧑‍💻 Simple example:** “Review my uncommitted changes and report only actionable findings.”

**✅ Where it fits:** 🟩 Codex · 💙 VS Code via relevant extension/terminal

**🔖 Type:** Native plugin / specialized integration · **Difficulty:** 🟡 External review service

📎 **[Official / maintainer source](https://github.com/openai/plugins/blob/main/plugins/coderabbit/skills/coderabbit-review/SKILL.md)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

**Inside Codex:** `/plugins` → search **CodeRabbit** → install if available. The underlying [review skill](https://github.com/openai/plugins/blob/main/plugins/coderabbit/skills/coderabbit-review/SKILL.md) relies on the **CodeRabbit CLI**, which may need a separate install and sign-in.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

Before a review, confirm CLI authentication and check which diff/files will be sent to CodeRabbit. Ask for review only—fixes must be explicitly reviewed.

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Review my uncommitted changes and report only actionable findings.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | Not a Claude-native plugin; use a separately approved CodeRabbit integration if available. |
| **🟩 Codex CLI** | “Run a CodeRabbit review on my uncommitted diff.” |
| **🟪 Copilot CLI** | Not a standard Awesome Copilot plugin; use CodeRabbit separately if enabled. |
| **💙 VS Code** | With the Codex extension, invoke the Codex CodeRabbit plugin; do not assume Copilot Chat has it. |

#### ✅ STEP 4 · CHECK IT WORKS

In Codex open `/plugins` to confirm the plugin appears; then try a harmless test task.

**⚠️ WATCH OUT:** Code review may be processed by an external vendor.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


---

## 🔴 Security & quality gates

![Security & quality gates](https://img.shields.io/badge/Security_&_quality_gates-D54D5C?style=for-the-badge)

*Protect data and catch real code issues*


<a id="sonarqube-mcp-server"></a>

### 🛡️ SonarQube MCP Server

**🧸 What is it?** 🩺 Like bringing a real code-quality report into the AI conversation.

**🌟 Why use it?** Grounds the agent in actual static-analysis results instead of guesses.

**🧑‍💻 Simple example:** “List the critical SonarQube issues in this project and explain the top one.”

**✅ Where it fits:** 🟩 Codex · 🟧 Claude · 🟪 Copilot · 💙 VS Code via relevant extension/terminal

**🔖 Type:** Shared MCP / CLI / skill — setup differs by client · **Difficulty:** 🟡 SonarQube account needed

📎 **[Official / maintainer source](https://github.com/SonarSource/sonarqube-mcp-server)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

Needs Docker and a SonarQube Cloud/Server account. In **Copilot CLI**, run `/mcp add`; **Claude** and **Codex** have dedicated config examples in the official repository.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

Provide `SONARQUBE_TOKEN` and either `SONARQUBE_ORG` (Cloud) or `SONARQUBE_URL` (Server). Prefer read-only toolsets at first; keep token in a secret store/environment rather than Git.

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> List the critical SonarQube issues in this project and explain the top one.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | “Show critical SonarQube findings for this repo and suggest a fix plan.” |
| **🟩 Codex CLI** | “Investigate why our SonarQube quality gate failed.” |
| **🟪 Copilot CLI** | “List major maintainability issues from SonarQube, read-only.” |
| **💙 VS Code** | In Copilot Agent mode, ask for project quality gate and issue details after MCP setup. |

#### ✅ STEP 4 · CHECK IT WORKS

Ask for the project’s latest quality gate status and check it against the SonarQube UI.

**⚠️ WATCH OUT:** Requires an existing SonarQube deployment; may not support older self-hosted server versions.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


<a id="codex-security"></a>

### 🧯 Codex Security

**🧸 What is it?** 🧯 Like a security inspector that investigates suspicious changes.

**🌟 Why use it?** Structured security review and targeted remediation.

**🧑‍💻 Simple example:** “Scan my current diff for security issues; show evidence before suggesting changes.”

**✅ Where it fits:** 🟩 Codex · 💙 VS Code via relevant extension/terminal

**🔖 Type:** Native plugin / specialized integration · **Difficulty:** 🟡 Availability varies

📎 **[Official / maintainer source](https://github.com/openai/plugins/blob/main/plugins/codex-security/.codex-plugin/plugin.json)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

**Inside Codex:** `/plugins` → search **Codex Security** → install if offered. **Alternative standalone security CLI:** see the [Codex Security SDK and CLI](https://github.com/openai/codex-security) if your environment supports it.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

Connect required scanning access and restrict the scan to a repo you are authorized to inspect. Verify findings before changing security-sensitive code.

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Scan my current diff for security issues; show evidence before suggesting changes.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | Not an Anthropic plugin; use the Claude Security alternative below. |
| **🟩 Codex CLI** | “Run a Codex Security diff scan on my staged changes.” |
| **🟪 Copilot CLI** | Not a native Copilot plugin; consider SonarQube/Semgrep or GitHub scanning. |
| **💙 VS Code** | Use through the Codex integration where its plugin is offered. |

#### ✅ STEP 4 · CHECK IT WORKS

In Codex open `/plugins` to confirm the plugin appears; then try a harmless test task.

**⚠️ WATCH OUT:** Availability and backend access can depend on your account/organization.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


<a id="security-guidance"></a>

### 🔐 Security Guidance

**🧸 What is it?** 🚨 Like guardrails that warn when new code looks risky.

**🌟 Why use it?** Catches risky patterns early.

**🧑‍💻 Simple example:** “Check the newly edited authentication code for security mistakes.”

**✅ Where it fits:** 🟧 Claude

**🔖 Type:** Native plugin / specialized integration · **Difficulty:** 🟢 Easy

📎 **[Official / maintainer source](https://github.com/anthropics/claude-plugins-official/tree/main/plugins/security-guidance)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

In Claude Code run `/plugin install security-guidance@claude-plugins-official`.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

After enabling, code edits may trigger pattern checks and additional model-powered diff reviews. This can **raise API usage** and sends diff context to your configured model provider. Check the [README](https://github.com/anthropics/claude-plugins-official/blob/main/plugins/security-guidance/README.md) to disable review layers when not needed.

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Check the newly edited authentication code for security mistakes.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | “Use Security Guidance to review auth and input validation changes.” |
| **🟩 Codex CLI** | Not a Codex plugin; use a corresponding Codex skill/MCP when available. |
| **🟪 Copilot CLI** | Not directly installable as the same native plugin. |
| **💙 VS Code** | Use through Claude Code in VS Code terminal, or choose an editor-native alternative. |

#### ✅ STEP 4 · CHECK IT WORKS

In Claude Code open `/plugin` to confirm installation, then try the example prompt in a fresh session.

**⚠️ WATCH OUT:** Availability and command names can vary across marketplace revisions; check `/plugin` before trying a suggested command.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


<a id="claude-security"></a>

### 🧬 Claude Security

**🧸 What is it?** 🕵️ Like a deeper security investigation team for authorized repositories.

**🌟 Why use it?** Useful for targeted AppSec reviews.

**🧑‍💻 Simple example:** “Run a scoped security review of my authorized payment module.”

**✅ Where it fits:** 🟧 Claude · 🔒 Anthropic-host only

**🔖 Type:** Native plugin / specialized integration · **Difficulty:** 🔒 Claude-only license

📎 **[Official / maintainer source](https://github.com/anthropics/claude-plugins-official/tree/main/plugins/claude-security)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

**Inside Claude Code:** `/plugin install claude-security@claude-plugins-official` → `/reload-plugins`.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

Inside Claude use `/claude-security` to select **Scan codebase**, **Scan changes**, or **Suggest patches**. Scans have meaningful time/token cost and should target **authorized repositories**.

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Run a scoped security review of my authorized payment module.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | “Scan this authorized module for exploitable issues; verify each finding.” |
| **🟩 Codex CLI** | Not a Codex plugin; use a corresponding Codex skill/MCP when available. |
| **🟪 Copilot CLI** | Not directly installable as the same native plugin. |
| **💙 VS Code** | Use through Claude Code in VS Code terminal, or choose an editor-native alternative. |

#### ✅ STEP 4 · CHECK IT WORKS

Run `/claude-security` and choose a **small, authorized** scan. Review output before accepting patch files.

**⚠️ WATCH OUT:** Availability and command names can vary across marketplace revisions; check `/plugin` before trying a suggested command.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


<a id="semgrep"></a>

### 🕵️ Semgrep

**🧸 What is it?** 🔐 Like a security scanner that follows explicit matching rules.

**🌟 Why use it?** Deterministic findings that complement AI judgement.

**🧑‍💻 Simple example:** “Show confirmed Semgrep findings for this change and how to reproduce them.”

**✅ Where it fits:** 🟧 Claude

**🔖 Type:** Native plugin / specialized integration · **Difficulty:** 🟡 Setup needed

📎 **[Official / maintainer source](https://claude.com/marketplace/plugins/semgrep)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

**Claude Code:** open `/plugin` → Discover → search **Semgrep**, then follow the listed publisher’s installation instructions. **Alternative scanner:** see [Semgrep CLI](https://semgrep.dev/docs/getting-started/) for local/CI use.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

Choose the ruleset and repository scope, connect a team account only if necessary, and prefer read-only findings first. Do not confuse a Semgrep scan with a generative AI review.

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Show confirmed Semgrep findings for this change and how to reproduce them.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | “Review confirmed Semgrep findings and propose narrow fixes.” |
| **🟩 Codex CLI** | Not a Codex plugin; use a corresponding Codex skill/MCP when available. |
| **🟪 Copilot CLI** | Not directly installable as the same native plugin. |
| **💙 VS Code** | Use through Claude Code in VS Code terminal, or choose an editor-native alternative. |

#### ✅ STEP 4 · CHECK IT WORKS

In Claude Code open `/plugin` to confirm installation, then try the example prompt in a fresh session.

**⚠️ WATCH OUT:** Availability and command names can vary across marketplace revisions; check `/plugin` before trying a suggested command.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


<a id="security-best-practices"></a>

### 🔒 Security Best Practices

**🧸 What is it?** 🛡️ Like a checklist for avoiding common coding security mistakes.

**🌟 Why use it?** Adds structured review criteria.

**🧑‍💻 Simple example:** “Review this input handler against the project’s security checklist.”

**✅ Where it fits:** 🟪 Copilot · 💙 VS Code via relevant extension/terminal

**🔖 Type:** Native plugin / specialized integration · **Difficulty:** 🟢 Easy

📎 **[Official / maintainer source](https://github.com/github/awesome-copilot/tree/main/plugins/security-best-practices)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

In a terminal: `copilot plugin install security-best-practices@awesome-copilot`. For VS Code, search `@agentPlugins` in Extensions for **security-best-practices**.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

After installing run `copilot plugin list`; start a new Copilot session. In VS Code enable the plugin in your workspace and use **Agent** mode. Check its skills/commands in the plugin details.

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Review this input handler against the project’s security checklist.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | Not the same plugin; use equivalent Claude skills or repo instructions. |
| **🟩 Codex CLI** | Not the same plugin; use equivalent Codex skills or repo instructions. |
| **🟪 Copilot CLI** | “Audit this API handler against Security Best Practices.” |
| **💙 VS Code** | Open **Copilot Agent** and ask: “Audit this API handler against Security Best Practices.” |

#### ✅ STEP 4 · CHECK IT WORKS

Run `copilot plugin list`. Open a fresh session or check VS Code’s plugin list; then try the example prompt.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


---

## 🟡 Connect & specialize

![Connect & specialize](https://img.shields.io/badge/Connect_&_specialize-E5A423?style=for-the-badge)

*Repositories, APIs, design, and web-app building*


<a id="github-mcp-server"></a>

### 🐙 GitHub MCP Server

**🧸 What is it?** 🌉 Like a bridge from your coding assistant to GitHub issues and PRs.

**🌟 Why use it?** Cuts tab switching; enables repo-aware reviews and issue-to-PR workflows.

**🧑‍💻 Simple example:** “Summarize open pull requests in this repository. Do not modify anything.”

**✅ Where it fits:** 🟩 Codex · 🟧 Claude · 🟪 Copilot · 💙 VS Code via relevant extension/terminal

**🔖 Type:** Shared MCP / CLI / skill — setup differs by client · **Difficulty:** 🟢 Easy

📎 **[Official / maintainer source](https://github.com/github/github-mcp-server)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

**Copilot CLI:** GitHub MCP is already bundled, so try it before installing anything. **Codex / Claude / VS Code:** follow the [GitHub MCP readme](https://github.com/github/github-mcp-server) and register the supported server for your client.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

Choose **read-only** and the smallest necessary toolsets first. Prefer supported OAuth flows; otherwise store a least-privilege token in approved environment/secret storage (never in a committed file).

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Summarize open pull requests in this repository. Do not modify anything.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | “Summarize the open PRs in this repository; do not modify anything.” |
| **🟩 Codex CLI** | “Compare issue acceptance criteria with this patch.” |
| **🟪 Copilot CLI** | “List failing Actions checks on PR #123.” |
| **💙 VS Code** | In Copilot Agent: “Summarize unresolved review comments on the current PR.” |

#### ✅ STEP 4 · CHECK IT WORKS

Ask it to list two open PRs **read-only**; if nothing appears, verify authorization and MCP connection.

**⚠️ WATCH OUT:** Approval is needed before merge/write operations. Never put a PAT inside a tracked configuration file.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


<a id="openai-developers"></a>

### 🧪 OpenAI Developers

**🧸 What is it?** 🧑‍💻 Like a guide for building and debugging apps using OpenAI APIs.

**🌟 Why use it?** Safer development with current API behavior and code examples.

**🧑‍💻 Simple example:** “Check the documented OpenAI Responses API usage before editing this integration.”

**✅ Where it fits:** 🟩 Codex · 💙 VS Code via relevant extension/terminal

**🔖 Type:** Native plugin / specialized integration · **Difficulty:** 🟢 Easy

📎 **[Official / maintainer source](https://developers.openai.com/learn/developers-codex-plugin)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

In Codex run `/plugins`, select **OpenAI Developers**, install, and start a new session.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

Follow the OpenAI Platform connection flow if asked. Use the documentation MCP at `https://developers.openai.com/mcp` if documentation only is required.

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Check the documented OpenAI Responses API usage before editing this integration.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | Use OpenAI docs MCP as an alternative to this native Codex plugin. |
| **🟩 Codex CLI** | “Show the correct Responses API pattern and add a test.” |
| **🟪 Copilot CLI** | Use docs MCP or Context7 instead of assuming the Codex plugin exists. |
| **💙 VS Code** | Use Codex extension; the MCP server is shared between Codex CLI and extension. |

#### ✅ STEP 4 · CHECK IT WORKS

In Codex open `/plugins` to confirm the plugin appears; then try a harmless test task.

**⚠️ WATCH OUT:** API-related examples should be checked against current model and project settings.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


<a id="figma-codex-plugin"></a>

### 🎨 Figma (Codex plugin)

**🧸 What is it?** 🎨 Like letting the coding assistant read your actual design reference.

**🌟 Why use it?** Less guesswork about visual details and reusable component conventions.

**🧑‍💻 Simple example:** “Use this permitted Figma design to build the matching component and check accessibility.”

**✅ Where it fits:** 🟩 Codex · 💙 VS Code via relevant extension/terminal

**🔖 Type:** Native plugin / specialized integration · **Difficulty:** 🟡 Setup needed

📎 **[Official / maintainer source](https://github.com/openai/plugins/tree/main/plugins/figma)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

In Codex use `/plugins`, search **Figma** and follow the connection prompt.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

Sign in to the right Figma workspace and grant only necessary file access. Provide a specific file/node URL.

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Use this permitted Figma design to build the matching component and check accessibility.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | Figma integration differs by client; use an approved Figma MCP server when available. |
| **🟩 Codex CLI** | “Use the Figma design for this component; follow the project design system.” |
| **🟪 Copilot CLI** | Requires an appropriate Figma integration; not the Codex plugin itself. |
| **💙 VS Code** | Use the Codex extension with the Figma plugin, or a separate Copilot-compatible Figma MCP. |

#### ✅ STEP 4 · CHECK IT WORKS

In Codex open `/plugins` to confirm the plugin appears; then try a harmless test task.

**⚠️ WATCH OUT:** Generated UI still needs responsive and accessibility verification.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)


<a id="build-web-apps-codex"></a>

### 🏗️ Build Web Apps (Codex)

**🧸 What is it?** 🏗️ Like a starter toolkit for building and testing web applications.

**🌟 Why use it?** Convenient scaffold/workflow for web app development.

**🧑‍💻 Simple example:** “Create a small accessible dashboard in the existing stack and run tests.”

**✅ Where it fits:** 🟩 Codex · 💙 VS Code via relevant extension/terminal

**🔖 Type:** Native plugin / specialized integration · **Difficulty:** 🟢 Easy

📎 **[Official / maintainer source](https://github.com/openai/plugins/tree/main/plugins/build-web-apps)**


---

**🟦 HOW-TO GUIDE · 📦 INSTALL → ⚙️ CONFIGURE → 🚀 USE → ✅ CHECK**

#### 📦 STEP 1 · HOW TO INSTALL

Open Codex `/plugins`, search **Build Web Apps** and install if available.

#### ⚙️ STEP 2 · HOW TO CONFIGURE

Connect only the relevant optional services, and confirm frameworks and deployment targets before allowing changes.

#### 🚀 STEP 3 · HOW TO USE (CLAUDE / CODEX / COPILOT / VS CODE)

**First prompt to try:**

> Create a small accessible dashboard in the existing stack and run tests.

| 🖥️ Assistant | 💬 What to type / where to use it |
|---|---|
| **🟧 Claude Code CLI** | Not a Claude plugin; use Feature Dev or relevant web skills. |
| **🟩 Codex CLI** | “Build an accessible dashboard using our existing stack; add tests.” |
| **🟪 Copilot CLI** | Not native; use Frontend Web Dev from Awesome Copilot. |
| **💙 VS Code** | Use through Codex extension after installation. |

#### ✅ STEP 4 · CHECK IT WORKS

In Codex open `/plugins` to confirm the plugin appears; then try a harmless test task.

**⚠️ WATCH OUT:** Treat service deployment/payment actions as separate approvals.


---

[⬆️ Back to the 60-second start](#-step-zero--your-60-second-start) · [🧭 All plugin lists](#-codex-cli-my-plugin-list)

---

## 🎮 3 mini-projects to learn by doing

### 🐞 Project 1 — Fix a bug safely (10-minute practice)

1. 🧭 Use **Serena** to locate the function.
2. 🧪 Use **Superpowers** *or* **Testing Automation** to write a failing regression test.
3. ✂️ Use **Ponytail** or **Code Simplifier** to make the smallest sensible change.
4. ✅ Run real tests; if RTK is installed, check `rtk gain` for output savings.

**Copy into any agent that has those tools connected:**

```text
I have a bug in this test project.
1. Find the exact function involved.
2. Explain the cause in simple language.
3. Write a failing test first.
4. Make the smallest safe code change.
5. Run the test and show evidence that it passes.
Do not modify unrelated files.
```

### 🌐 Project 2 — Check a web page

1. 🎭 Start your local web app.
2. 🔎 Use **Playwright MCP** to open it and reproduce the issue.
3. 🔬 Use **Chrome DevTools MCP** if a network error or slow page is involved.
4. ✅ Save or describe the test steps so a teammate can repeat them.

```text
Use the connected browser tools to open my local test site.
Reproduce the login form error with test credentials only.
Show the exact steps, console/network evidence, and a safe fix.
Do not access personal browser accounts or production data.
```

### 🔐 Project 3 — Review a pull request

1. 🐙 Ask **GitHub MCP** for the pull request summary (read-only).
2. 🛡️ Get existing **SonarQube / Semgrep** findings, if your repo uses them.
3. 🧐 Ask the relevant review plugin to look for correctness and test gaps.
4. ✅ Confirm findings by reading the code and running tests. **Never auto-merge** because an AI said it was good.

---

## 🪙 Want fewer tokens? Here is the plain-English truth

| Tool | What it can reduce | What it **does not** guarantee |
|---|---|---|
| ⚡ **RTK** | Long terminal outputs | Lower total bill in every task |
| 🗜️ **Headroom** | Some model-bound context / tool output | No quality loss or cache effect |
| 🧭 **Serena** | Unnecessary whole-file reads | Savings on every query |
| 🕸️ **Graphify** | Repeat repo exploration after indexing | No indexing/storage cost |
| 🧠 **Claude-Mem** | Repeating earlier explanations | Perfect memory; zero injected tokens |
| 🔀 **OmniRoute** | Model/provider routing cost where policies permit | Unlimited free usage or identical model quality |

✅ **Measure before celebrating:** compare the same small coding task **without and with** a plugin: number of retries, relevant tests passing, total tokens/credits, and how long the task takes.

---

<a id="-quick-fixes-when-something-goes-wrong"></a>

## 🩹 Quick fixes when something goes wrong

<details>
<summary><strong>❓ “command not found”</strong></summary>

- Check you installed the **CLI** on your computer and restarted Terminal.
- Use `claude --version`, `codex --version`, or `copilot --version` for your chosen client.
- Node tools use `node --version` / `npx --version`; Python CLI tools commonly need `uv --version`.
- See the **exact package name** in the source; Graphify's official PyPI name is `graphifyy` (double y).

</details>

<details>
<summary><strong>❓ Plugin installed but nothing happens</strong></summary>

- Reopen your AI session. Some agents discover skills only when a new session starts.
- Check your marketplace/plugin browser (Claude `/plugin`; Codex `/plugins`; Copilot `copilot plugin list`).
- For MCP, confirm the server is **enabled and trusted**, and that its process/authentication actually works.
- Try the exact example under the plugin first, in a harmless test project.

</details>

<details>
<summary><strong>❓ I get a permission or organization-policy error</strong></summary>

- Do not bypass the organization's controls. Ask the admin which extensions/MCP servers are approved.
- Prefer **read-only** capabilities for your first test.
- Never copy private code to a third-party model gateway, memory service, or code-review service without authorization.

</details>

<details>
<summary><strong>❓ It suddenly uses MORE tokens or gets worse answers</strong></summary>

- Disable one extra plugin at a time and repeat the same test.
- Turn off noisy automatic scans and parallel review agents during simple edits.
- Use **one** general process pack: Superpowers **or** Agent Skills for a given workflow.
- Inspect original logs when a compressor removes an important error line.

</details>

---

## 🔐 The five rules for company repositories

1. 🛡️ **Check approval first:** MCP servers, hooks, proxies, hosted memories and model routers can move code or data.
2. 🔑 **Never paste credentials:** use the service’s login mechanism or approved secret store, not committed config files.
3. 👀 **Review hooks and scopes:** they can execute scripts in your development environment.
4. ✅ **Verify code changes:** test and static-analysis results matter more than confident AI prose.
5. 💵 **Check costs and permissions:** parallel security scans and long browser sessions can be expensive.

---

## 📚 Official starting points (maintainer and vendor docs)

| 🧭 Help center | 🔗 Source |
|---|---|
| 🟩 OpenAI Codex plugin examples | [OpenAI Plugins](https://github.com/openai/plugins) |
| 🟩 Codex marketplace creation & configuration | [OpenAI developer docs](https://developers.openai.com/plugins/build/plugins) |
| 🟧 Claude Code plugin marketplace | [Anthropic's official plugin directory](https://github.com/anthropics/claude-plugins-official) |
| 🟪 GitHub Copilot CLI plugin installation | [GitHub Docs](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/plugins-finding-installing) |
| 🟪 GitHub Copilot CLI built-in MCP and usage | [GitHub Docs: Using Copilot CLI](https://docs.github.com/en/copilot/how-tos/copilot-cli/use-copilot-cli/overview) |
| 💙 VS Code agents, MCP and plugin discovery | [VS Code Docs: Agent customizations](https://code.visualstudio.com/docs/agent-customization/overview) |
| 🧪 Testing and code quality plugin collection | [Awesome Copilot](https://github.com/github/awesome-copilot) |
| 🧰 Shared coding skills | [Addy Osmani's agent-skills](https://github.com/addyosmani/agent-skills) |
| ⚡ Reducing command-output noise | [RTK quick start](https://github.com/rtk-ai/rtk/blob/develop/docs/guide/getting-started/quick-start.md) |
| 🗜️ Context compression | [Headroom quick start](https://github.com/headroomlabs-ai/headroom/blob/main/wiki/getting-started.md) |
| 🕸️ Project graph setup | [Graphify documentation](https://github.com/Graphify-Labs/graphify/blob/v8/README.md) |
| 🧠 Persistent memory install | [Claude-Mem installation guide](https://github.com/thedotmack/claude-mem/blob/main/docs/public/installation.mdx) |

---

<div align="center">

### 🌈 You do not need all 39. Start with one small win. 🏆

**🧭 Find it → 🧪 Test it → ✂️ Simplify it → ✅ Verify it.**

*Guide updated October 11, 2026. Vendor tools and commands may change; inspect current source instructions before installation.*

</div>
