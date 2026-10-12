# AI Coding Add-ons — Beginner's Project Guide

**Updated:** 11 October 2026  
**Works with:** Claude Code CLI · Codex CLI · GitHub Copilot CLI · Visual Studio Code (Copilot Chat)

**Your goal:** Pick one add-on and follow only the setup for the coding tool you actually use. Each supported tool has **How to install**, **How to configure**, and **How to use it in your project**. You do not need all 39.

## Start here — read this once

1. **Open your project:** In VS Code click **File → Open Folder** and select your project directory. Start with a *non-confidential practice project*.
2. **Open normal Terminal:** In VS Code click **Terminal → New Terminal**. This is where you type setup commands such as `rtk --version` or `npx ...` and press **Enter**.
3. **Open AI chat:** Inside that Terminal type `claude`, `codex`, or `copilot` and press Enter. Once its chat opens, type **English questions** or supported `/commands` there, not in the normal Terminal.
4. **VS Code Copilot Chat is different:** Click the Chat icon, select **Agent**, then type English in the message box. Commands like `npx`, `rtk`, and `docker` still belong in **Terminal**, not the message box.
5. **Only one setup at a time:** Do not combine Claude and Codex instructions unless you truly use both. Installation for one client does not automatically install for another.

### Small dictionary

| Word | Very simple meaning |
|---|---|
| Plugin | An extra feature you install, similar to an app. |
| Skill | A set of instructions that tells AI how to carry out a task. |
| MCP server | A connector that lets AI access another tool, such as documentation or GitHub. |
| Hook | A helper that runs automatically when the coding assistant performs a particular action. |
| Token | A small unit of text the AI model processes (not an account password). |
| `npx` | A Node.js command used to run a package. |
| `uv` | A tool for installing and running Python-based programs. |
| Proxy / provider | A service between your assistant and an AI model / the company serving that model. |
| Credential / API key | A secret used to sign in. Never paste secrets into AI chat or source control. |
| PR | Pull request: proposed changes to a Git repository. |

**Before trying any add-on:** Check your employer's rules. Third-party plugins may execute commands, access source code, store session history or send data to outside servers. Start with read-only requests. Do not weaken approvals, share credentials or run unreviewed installers in a company repository.

**Prerequisites (install only if the guide asks for one):** [Node.js](https://nodejs.org/en/download) (`node --version`, `npx --version`), [uv](https://docs.astral.sh/uv/getting-started/installation/) (`uv --version`), [Docker](https://docs.docker.com/get-docker/) (`docker --version`). If a check fails, use the official link and choose your operating system. Reopen Terminal after an installation.

> **How to know it worked:** A successful AI answer alone does **not** prove a plugin ran. Look for an installed plugin in the tool's manager, a connected MCP server, a created report, a trace of tool use or real output from a project test.

## Find an add-on
- [01. RTK / Rust Token Killer](#rtk-rust-token-killer)
- [02. Headroom](#headroom)
- [03. Claude-Mem](#claude-mem)
- [04. OmniRoute](#omniroute)
- [05. Chronicle Stats / My AI Usage](#chronicle-stats-my-ai-usage)
- [06. Serena](#serena)
- [07. Context7](#context7)
- [08. Graphify](#graphify)
- [09. Language Server Plugins](#language-server-plugins)
- [10. Context Engineering](#context-engineering)
- [11. Superpowers](#superpowers)
- [12. Ponytail](#ponytail)
- [13. Agent Skills (Addy Osmani)](#agent-skills-addy-osmani)
- [14. Claude Code Setup](#claude-code-setup)
- [15. Code Simplifier](#code-simplifier)
- [16. Feature Dev](#feature-dev)
- [17. CLAUDE.md Management](#claudemd-management)
- [18. Project Planning](#project-planning)
- [19. Java Development](#java-development)
- [20. C# / .NET Development](#c-net-development)
- [21. Frontend Web Dev](#frontend-web-dev)
- [22. Where Was I](#where-was-i)
- [23. Task Observer](#task-observer)
- [24. Playwright MCP](#playwright-mcp)
- [25. Chrome DevTools MCP](#chrome-devtools-mcp)
- [26. Testing Automation](#testing-automation)
- [27. PR Review Toolkit](#pr-review-toolkit)
- [28. PR Review](#pr-review)
- [29. CodeRabbit](#coderabbit)
- [30. SonarQube MCP Server](#sonarqube-mcp-server)
- [31. Codex Security](#codex-security)
- [32. Security Guidance](#security-guidance)
- [33. Claude Security](#claude-security)
- [34. Semgrep](#semgrep)
- [35. Security Best Practices](#security-best-practices)
- [36. GitHub MCP Server](#github-mcp-server)
- [37. OpenAI Developers](#openai-developers)
- [38. Figma (Codex plugin)](#figma-codex-plugin)
- [39. Build Web Apps (Codex)](#build-web-apps-codex)

---

<a id="rtk-rust-token-killer"></a>
## 01. RTK / Rust Token Killer

**Type:** Terminal output filter  
**In simple words:** Like a filter that removes noisy terminal lines before AI reads them. Directly reduces noisy output from common Git, test, lint and build commands.

**Publisher instructions:** [https://github.com/rtk-ai/rtk](https://github.com/rtk-ai/rtk)

### 📦 Install on your computer (once)

1. Open **normal Terminal** (VS Code: **Terminal → New Terminal**). Run `rtk --version` and `rtk gain` to see whether the correct RTK is already installed.
2. If RTK is missing, choose **one**: Windows PowerShell: `winget install rtk-ai.rtk`; macOS/Linux with Homebrew: `brew install rtk-ai/tap/rtk`. For other systems see the [official installation page](https://www.rtk-ai.app/docs/getting-started/installation/).
3. Close and reopen Terminal. Run `rtk --version` and `rtk gain` again. The first should show a version; the second should show an RTK usage/savings screen. If only the first works, you may have the unrelated RTK package.

### Claude Code CLI

**📦 How to install**

Follow the one-time installation above. No second copy of RTK / Rust Token Killer is needed for this computer.

**⚙️ How to configure**

1. Open your **practice project folder** in VS Code (**File → Open Folder**). Open **Terminal → New Terminal**.
2. Run `rtk init --dry-run` to **preview** the RTK settings/files it would create. Nothing is changed yet.
3. If permitted, run `rtk init` without `--dry-run`. This sets up RTK for **this folder** and Claude Code. Review any hook/instruction files it writes (a hook is an automatic command helper).
4. Close and reopen your Claude Code session. Never override an organization policy to enable hooks.

**🚀 How to use it in your project**

1. In the same project Terminal, type `claude` to open Claude Code chat.
2. In the **AI chat box**, paste: “Run `git status` in this project. Do not edit files. Show the result.” Approve only the read-only command if prompted.
3. Open a **second normal Terminal** and run `rtk gain`; compare the usage screen with its earlier value. RTK should have recorded activity **if the command was eligible for rewriting**. If not, check the hook setup or try a supported test/build command.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### Codex CLI

**📦 How to install**

Follow the one-time installation above. No second copy of RTK / Rust Token Killer is needed for this computer.

**⚙️ How to configure**

1. Open your **practice project folder** in VS Code (**File → Open Folder**). Open **Terminal → New Terminal**.
2. Run `rtk init --codex --dry-run` to **preview** the RTK settings/files it would create. Nothing is changed yet.
3. If permitted, run `rtk init --codex` without `--dry-run`. This sets up RTK for **this folder** and Codex. Review any hook/instruction files it writes (a hook is an automatic command helper).
4. Close and reopen your Codex session. Never override an organization policy to enable hooks.

**🚀 How to use it in your project**

1. In the same project Terminal, type `codex` to open Codex chat.
2. In the **AI chat box**, paste: “Run `git status` in this project. Do not edit files. Show the result.” Approve only the read-only command if prompted.
3. Open a **second normal Terminal** and run `rtk gain`; compare the usage screen with its earlier value. RTK should have recorded activity **if the command was eligible for rewriting**. If not, check the hook setup or try a supported test/build command.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### GitHub Copilot CLI

**📦 How to install**

Follow the one-time installation above. No second copy of RTK / Rust Token Killer is needed for this computer.

**⚙️ How to configure**

1. Open your **practice project folder** in VS Code (**File → Open Folder**). Open **Terminal → New Terminal**.
2. Run `rtk init --copilot --dry-run` to **preview** the RTK settings/files it would create. Nothing is changed yet.
3. If permitted, run `rtk init --copilot` without `--dry-run`. This sets up RTK for **this folder** and Copilot CLI. Review any hook/instruction files it writes (a hook is an automatic command helper).
4. Close and reopen your Copilot CLI session. Never override an organization policy to enable hooks.

**🚀 How to use it in your project**

1. In the same project Terminal, type `copilot` to open Copilot CLI chat.
2. In the **AI chat box**, paste: “Run `git status` in this project. Do not edit files. Show the result.” Approve only the read-only command if prompted.
3. Open a **second normal Terminal** and run `rtk gain`; compare the usage screen with its earlier value. RTK should have recorded activity **if the command was eligible for rewriting**. If not, check the hook setup or try a supported test/build command.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### Visual Studio Code (Copilot Chat)

**📦 How to install**

Follow the one-time installation above. No second copy of RTK / Rust Token Killer is needed for this computer.

**⚙️ How to configure**

1. Open your **practice project folder** in VS Code (**File → Open Folder**). Open **Terminal → New Terminal**.
2. Run `rtk init --copilot --dry-run` to **preview** the RTK settings/files it would create. Nothing is changed yet.
3. If permitted, run `rtk init --copilot` without `--dry-run`. This sets up RTK for **this folder** and VS Code Copilot Chat. Review any hook/instruction files it writes (a hook is an automatic command helper).
4. Close and reopen your VS Code Copilot Chat session. Never override an organization policy to enable hooks.

**🚀 How to use it in your project**

1. Open **Copilot Chat → Agent** in the same VS Code folder.
2. In the **AI chat box**, paste: “Run `git status` in this project. Do not edit files. Show the result.” Approve only the read-only command if prompted.
3. Open a **second normal Terminal** and run `rtk gain`; compare the usage screen with its earlier value. RTK should have recorded activity **if the command was eligible for rewriting**. If not, check the hook setup or try a supported test/build command.

**Check:** Check Copilot Chat’s agent/tool activity, not just the wording of the answer.

**Be careful:** Never replace full logs when details are essential. There is another unrelated `rtk` project: check `rtk gain`.

---

<a id="headroom"></a>
## 02. Headroom

**Type:** Advanced AI traffic proxy  
**In simple words:** Like packing a large suitcase more tightly—less context to send. May keep long sessions usable with fewer input tokens.

**Publisher instructions:** [https://github.com/headroomlabs-ai/headroom](https://github.com/headroomlabs-ai/headroom)

### 📦 Install on your computer (once)

1. **Advanced: approval required.** Headroom can reroute AI requests through a local proxy. Do not use it with company code until the destination, authentication, and retention rules are approved.
2. Install **uv** using [its official OS instructions](https://docs.astral.sh/uv/getting-started/installation/). In Terminal check `uv --version`.
3. In Terminal run `uv tool install --python 3.13 "headroom-ai[all]"`. Then run `headroom --version`. If the command is missing after installation, try `uv tool update-shell` and reopen Terminal.

### Claude Code CLI

**📦 How to install**

Follow the one-time installation above. No second copy of Headroom is needed for this computer.

**⚙️ How to configure**

1. Read the [Headroom wrapper quickstart](https://github.com/headroomlabs-ai/headroom/blob/main/wiki/quickstart.md). Confirm your normal coding assistant sign-in still works and which provider/data path the proxy uses.
2. Run `headroom wrap --help` and check your installed version supports `headroom wrap claude`. Stop if it cannot use your approved authentication.

**🚀 How to use it in your project**

1. From a **non-confidential practice project** open Terminal and start `headroom wrap claude`.
2. Ask: “Run the existing tests without editing files. Summarize failures.” Check the Headroom proxy log or savings view and compare with a normal, unwrapped session.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### Codex CLI

**📦 How to install**

Follow the one-time installation above. No second copy of Headroom is needed for this computer.

**⚙️ How to configure**

1. Read the [Headroom wrapper quickstart](https://github.com/headroomlabs-ai/headroom/blob/main/wiki/quickstart.md). Confirm your normal coding assistant sign-in still works and which provider/data path the proxy uses.
2. Run `headroom wrap --help` and check your installed version supports `headroom wrap codex`. Stop if it cannot use your approved authentication.

**🚀 How to use it in your project**

1. From a **non-confidential practice project** open Terminal and start `headroom wrap codex`.
2. Ask: “Run the existing tests without editing files. Summarize failures.” Check the Headroom proxy log or savings view and compare with a normal, unwrapped session.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### GitHub Copilot CLI

**📦 How to install**

Follow the one-time installation above. No second copy of Headroom is needed for this computer.

**⚙️ How to configure**

1. Read the [Headroom wrapper quickstart](https://github.com/headroomlabs-ai/headroom/blob/main/wiki/quickstart.md). Confirm your normal coding assistant sign-in still works and which provider/data path the proxy uses.
2. Run `headroom wrap --help` and check your installed version supports `headroom wrap copilot`. Stop if it cannot use your approved authentication.

**🚀 How to use it in your project**

1. From a **non-confidential practice project** open Terminal and start `headroom wrap copilot`.
2. Ask: “Run the existing tests without editing files. Summarize failures.” Check the Headroom proxy log or savings view and compare with a normal, unwrapped session.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### Visual Studio Code (Copilot Chat)

**📦 How to install**

Follow the one-time installation above. No second copy of Headroom is needed for this computer.

**⚙️ How to configure**

1. In normal Terminal run `headroom copilot-auth login`. Follow the browser authorization if offered and permitted.
2. Run `headroom wrap vscode` and **leave its terminal running**. This launches the local proxy; it is not a VS Code theme or standard extension.

**🚀 How to use it in your project**

1. Open your project in VS Code and use **Copilot Chat → Agent** while the Headroom terminal remains open.
2. Ask it to inspect test output. Look for request activity in the Headroom proxy window; compare the answer with ordinary Copilot use. Stop the proxy with Ctrl+C when finished.

**Check:** Check Copilot Chat’s agent/tool activity, not just the wording of the answer.

**Be careful:** Proxying can affect provider policies, caching and output fidelity. Benchmark with and without it.

---

<a id="claude-mem"></a>
## 03. Claude-Mem

**Type:** Session memory  
**In simple words:** Like project notes that are available when you open a new AI session. Less re-explanation when you return to a project after a break.

**Publisher instructions:** [https://github.com/thedotmack/claude-mem](https://github.com/thedotmack/claude-mem)

### 📦 Install on your computer (once)

1. **Privacy check first:** Claude-Mem keeps information from AI sessions. Check whether the selected storage provider, telemetry, and retention are allowed for your project.
2. Install a supported Node.js version from [nodejs.org](https://nodejs.org/en/download) if `npx --version` fails. Then in Terminal run `npx claude-mem install`.
3. In the installer **select only the coding tool you use**; choose the permitted memory provider and approve only the requested hooks. The hosted observer may involve a trial or subscription.
4. In Terminal run `npx claude-mem doctor` and `npx claude-mem status` to see whether the service is healthy.

### Claude Code CLI

**📦 How to install**

Follow the one-time installation above. No second copy of Claude-Mem is needed for this computer.

**⚙️ How to configure**

1. Select this assistant in the `npx claude-mem install` installer; if not listed, **do not force another assistant’s installation files**.
2. Restart Claude and use a small non-sensitive test project.

**🚀 How to use it in your project**

1. In your project Terminal, start `claude`. Tell it: “For this project, remember that our example decision is to name the test `sample-check`.”
2. End the session, start a new one, and ask what the project decision was. Check whether the memory is actually available. Do not treat generated recollections as guaranteed facts.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### Codex CLI

**📦 How to install**

Follow the one-time installation above. No second copy of Claude-Mem is needed for this computer.

**⚙️ How to configure**

1. Select this assistant in the `npx claude-mem install` installer; if not listed, **do not force another assistant’s installation files**.
2. Restart Codex and use a small non-sensitive test project.

**🚀 How to use it in your project**

1. In your project Terminal, start `codex`. Tell it: “For this project, remember that our example decision is to name the test `sample-check`.”
2. End the session, start a new one, and ask what the project decision was. Check whether the memory is actually available. Do not treat generated recollections as guaranteed facts.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### GitHub Copilot CLI

**📦 How to install**

Follow the one-time installation above. No second copy of Claude-Mem is needed for this computer.

**⚙️ How to configure**

1. Select this assistant in the `npx claude-mem install` installer; if not listed, **do not force another assistant’s installation files**.
2. Restart Copilot CLI and use a small non-sensitive test project.

**🚀 How to use it in your project**

1. In your project Terminal, start `copilot`. Tell it: “For this project, remember that our example decision is to name the test `sample-check`.”
2. End the session, start a new one, and ask what the project decision was. Check whether the memory is actually available. Do not treat generated recollections as guaranteed facts.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### Visual Studio Code (Copilot Chat)

**Terminal only, not a Copilot Chat add-on.** In VS Code open **Terminal → New Terminal**, then use the Claude/Codex/Copilot CLI instructions above.

**Be careful:** Never assume perfect memory. Avoid placing company secrets, tokens or private data into unapproved storage.

---

<a id="omniroute"></a>
## 04. OmniRoute

**Type:** Advanced model router  
**In simple words:** Like a traffic controller that sends AI requests to selected providers. Can help control model spend, provider outages and routing policies.

**Publisher instructions:** [https://github.com/diegosouzapw/OmniRoute](https://github.com/diegosouzapw/OmniRoute)

### 📦 Install on your computer (once)

1. **Advanced: approval required.** This changes where AI requests are sent. Use it only with providers/credentials approved by your organization.
2. Install Node.js if `node --version` and `npm --version` do not work. In normal Terminal run `npm install -g omniroute`.
3. Run `omniroute` and open the local dashboard URL printed in Terminal (commonly `http://localhost:20128`).

### Claude Code CLI

**📦 How to install**

Follow the one-time installation above. No second copy of OmniRoute is needed for this computer.

**⚙️ How to configure**

1. In the dashboard open **Providers**. Add an authorized provider using credentials from your organization. Do not paste API keys into chat.
2. Open **Endpoints** and confirm the chosen model destination. Consult the [maintainer integration guide](https://github.com/diegosouzapw/OmniRoute/wiki/CLI-Integrations) if your installed release differs.

**🚀 How to use it in your project**

1. Inside a practice project in normal Terminal run `omniroute launch`.
2. Send: “Explain what this test project contains; do not edit files.” In the OmniRoute dashboard confirm which provider handled the request.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### Codex CLI

**📦 How to install**

Follow the one-time installation above. No second copy of OmniRoute is needed for this computer.

**⚙️ How to configure**

1. In the dashboard open **Providers**. Add an authorized provider using credentials from your organization. Do not paste API keys into chat.
2. Open **Endpoints** and confirm the chosen model destination. Consult the [maintainer integration guide](https://github.com/diegosouzapw/OmniRoute/wiki/CLI-Integrations) if your installed release differs.

**🚀 How to use it in your project**

1. Inside a practice project in normal Terminal run `omniroute launch-codex`.
2. Send: “Explain what this test project contains; do not edit files.” In the OmniRoute dashboard confirm which provider handled the request.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### GitHub Copilot CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### Visual Studio Code (Copilot Chat)

**Terminal only, not a Copilot Chat add-on.** In VS Code open **Terminal → New Terminal**, then use the Claude/Codex/Copilot CLI instructions above.

**Be careful:** Not unlimited free usage: provider quotas, terms and expenses still apply. Treat credentials and outbound code exposure as a security review item.

---

<a id="chronicle-stats-my-ai-usage"></a>
## 05. Chronicle Stats / My AI Usage

**Type:** Usage viewer  
**In simple words:** Like a dashboard that shows where Copilot spends tokens. Measures token/credit patterns before optimizing.

**Publisher instructions:** [https://github.com/github/awesome-copilot/tree/main/plugins/chronicle-stats](https://github.com/github/awesome-copilot/tree/main/plugins/chronicle-stats)

### Claude Code CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### Codex CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### GitHub Copilot CLI

**📦 How to install**

1. In normal Terminal run `copilot plugin marketplace browse awesome-copilot` and check the plugin name is listed.
2. If `chronicle-stats` appears, run `copilot plugin install chronicle-stats@awesome-copilot`. If not listed, stop; the plugin may have been renamed or removed.

**⚙️ How to configure**

1. Run `copilot plugin list` and check `chronicle-stats` appears, then start a new Copilot session.

**🚀 How to use it in your project**

1. In `copilot` chat inside your project, ask: “Show session usage for the current Copilot session.”
2. **Expected:** Built-in usage numbers or a supported usage dashboard—not fabricated usage statistics.

### Visual Studio Code (Copilot Chat)

**📦 How to install**

1. Open **VS Code → Extensions**. Search `@agentPlugins chronicle-stats`.
2. Open the matching publisher entry. Choose **Install** if available; if not shown, do not assume the CLI plugin is identical.

**⚙️ How to configure**

1. Check the installed **Agent Plugins** list, then open the project in **Copilot Chat → Agent**.

**🚀 How to use it in your project**

1. In **VS Code → Copilot Chat → Agent** with your project open, ask: “Show session usage for the current Copilot session.”
2. **Expected:** Built-in usage numbers or a supported usage dashboard—not fabricated usage statistics.

**Be careful:** The My AI Usage and PR Review experiences may require a Copilot app canvas and are not plain VS Code slash commands.

---

<a id="serena"></a>
## 06. Serena

**Type:** Code navigation server  
**In simple words:** Like GPS for functions and classes: it can find the exact place to edit. Great for understanding unfamiliar projects, targeted edits and large repositories. May avoid reading whole files.

**Publisher instructions:** [https://github.com/oraios/serena](https://github.com/oraios/serena)

### 📦 Install on your computer (once)

1. Install `uv` using the [official Windows/macOS/Linux instructions](https://docs.astral.sh/uv/getting-started/installation/) if `uv --version` does not work.
2. Open normal Terminal. Run `uv tool install -p 3.13 serena-agent` and then `serena init`. You should see a successful initialization message.
3. Run `serena --help` to check that the command is available. Some projects also need a language server; Serena will report if a dependency is missing.

### Claude Code CLI

**📦 How to install**

Follow the one-time installation above. No second copy of Serena is needed for this computer.

**⚙️ How to configure**

1. In your project Terminal run `claude mcp add --scope user serena -- serena start-mcp-server --context claude-code --project-from-cwd`.
2. Start Claude with `claude`, then type `/mcp`. Look for a connected `serena` server.

**🚀 How to use it in your project**

1. Ask: “Use Serena to find the function that handles user login and show the names of its callers. Do not edit files.”
2. You should see file paths and function/class names matching actual project code.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### Codex CLI

**📦 How to install**

Follow the one-time installation above. No second copy of Serena is needed for this computer.

**⚙️ How to configure**

1. In your project Terminal run `serena setup codex`.
2. Start `codex` and type `/mcp` to look for the `serena` connection.

**🚀 How to use it in your project**

1. Ask: “Use Serena to find the method responsible for saving an order and list its callers. Do not edit files.”
2. Check the file paths against the project.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### GitHub Copilot CLI

**📦 How to install**

Follow the one-time installation above. No second copy of Serena is needed for this computer.

**⚙️ How to configure**

1. Start `copilot`, type `/mcp add` inside Copilot chat, choose **Local / STDIO**, and enter server name `serena`.
2. Use the command `serena start-mcp-server --context=copilot-cli --project-from-cwd`. Save; Copilot should report whether Serena started.

**🚀 How to use it in your project**

1. Ask: “Use Serena to find the references to the OrderService class. Do not edit anything.”
2. Look for symbol references and file paths.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### Visual Studio Code (Copilot Chat)

**📦 How to install**

Follow the one-time installation above. No second copy of Serena is needed for this computer.

**⚙️ How to configure**

1. Open your project in VS Code. Open Command Palette → **MCP: Add Server** → **Command (stdio)**.
2. Name it `serena` and use command `serena` with arguments `start-mcp-server --context=ide --project-from-cwd` if supported by your installed Serena release. Confirm the exact editor context in the [maintainer client guide](https://github.com/oraios/serena/blob/main/docs/02-usage/030_clients.md).
3. Check **MCP: List Servers** for a running Serena entry.

**🚀 How to use it in your project**

1. In **Copilot Chat → Agent**, ask Serena to find callers of a class that exists in your project.
2. Check that the response references real files.

**Check:** Check Copilot Chat’s agent/tool activity, not just the wording of the answer.

**Be careful:** Indexing and language support vary by project. Do not confuse symbol search with a guaranteed reduction in billed tokens.

---

<a id="context7"></a>
## 07. Context7

**Type:** Current documentation  
**In simple words:** Like a freshly updated instruction manual for the libraries your app uses. Reduces answers based on outdated SDK syntax and repeated rework.

**Publisher instructions:** [https://github.com/upstash/context7](https://github.com/upstash/context7)

### Claude Code CLI

**📦 How to install**

1. Open **normal Terminal**. Check `npx --version`; if unavailable install Node.js from [nodejs.org](https://nodejs.org/en/download).
2. Run `npx ctx7 setup --claude` and follow its guided prompts.

**⚙️ How to configure**

1. Choose the offered **MCP** or **CLI + skill** integration. When a web address and short code appear, open the address in your browser and sign in.
2. Restart Claude; ask it to check documentation for your project library. You should see a Context7-provided docs lookup, not just a generic answer.

**🚀 How to use it in your project**

1. In your project, open `claude` and ask: “Use Context7 to check the current official API for the version of our HTTP library. Show the source and do not edit code.”
2. Confirm the answer includes relevant library docs and version details.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### Codex CLI

**📦 How to install**

1. Open **normal Terminal**. Check `npx --version`; if unavailable install Node.js from [nodejs.org](https://nodejs.org/en/download).
2. Run `npx ctx7 setup --codex` and follow its guided prompts.

**⚙️ How to configure**

1. Choose the offered **MCP** or **CLI + skill** integration. When a web address and short code appear, open the address in your browser and sign in.
2. Restart Codex; ask it to check documentation for your project library. You should see a Context7-provided docs lookup, not just a generic answer.

**🚀 How to use it in your project**

1. In your project, open `codex` and ask: “Use Context7 to check the current official API for the version of our HTTP library. Show the source and do not edit code.”
2. Confirm the answer includes relevant library docs and version details.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### GitHub Copilot CLI

**📦 How to install**

1. Start `copilot` in a normal Terminal and open `/mcp add` inside its chat.
2. Choose a **remote HTTP MCP server** and enter `https://mcp.context7.com/mcp` as the URL. Give it the name `context7`.

**⚙️ How to configure**

1. Complete any Context7 authorization requested by the client. Use Copilot’s `/mcp` view to check that the server is connected.

**🚀 How to use it in your project**

1. Ask in Copilot CLI: “Use Context7 to find the official docs for the version of our routing library. Do not edit files.”
2. Check that an MCP documentation lookup occurs.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### Visual Studio Code (Copilot Chat)

**📦 How to install**

1. Open VS Code and your project folder. Open the Command Palette (**Ctrl+Shift+P** on Windows/Linux; **Cmd+Shift+P** on macOS).
2. Choose **MCP: Add Server** → remote **HTTP** (name may vary by VS Code version). Enter `https://mcp.context7.com/mcp` and name it `context7`.

**⚙️ How to configure**

1. Use **MCP: List Servers** to confirm Context7 exists. Approve trust and complete browser sign-in if prompted.

**🚀 How to use it in your project**

1. Open **Copilot Chat → Agent**. Ask: “Use Context7 to verify the API used by this project. Show which documentation you found; do not edit code.”
2. Look for a Context7 server/tool call in the agent activity.

**Check:** Check Copilot Chat’s agent/tool activity, not just the wording of the answer.

**Be careful:** More retrieved docs can consume more context; ask targeted questions.

---

<a id="graphify"></a>
## 08. Graphify

**Type:** Codebase map  
**In simple words:** Like a map of how files, functions, and modules connect. Helpful when you need an architecture map or must track how changes flow through many modules.

**Publisher instructions:** [https://github.com/Graphify-Labs/graphify](https://github.com/Graphify-Labs/graphify)

### 📦 Install on your computer (once)

1. Install `uv` from [Astral’s OS instructions](https://docs.astral.sh/uv/getting-started/installation/) if `uv --version` fails.
2. Run `uv tool install graphifyy` (**two `y` letters**), then `graphify --help`. This installs Graphify once on the computer.

### Claude Code CLI

**📦 How to install**

Follow the one-time installation above. No second copy of Graphify is needed for this computer.

**⚙️ How to configure**

1. Open a small project in VS Code. In its Terminal run `graphify claude install --project`.
2. Review any new instructions or hook files before using them.

**🚀 How to use it in your project**

1. Open your project in `claude` chat and ask: “Use Graphify to map this repository. Show how the API calls the database; do not edit code.”
2. Check for a generated `graphify-out/GRAPH_REPORT.md` or the report path printed by Graphify.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### Codex CLI

**📦 How to install**

Follow the one-time installation above. No second copy of Graphify is needed for this computer.

**⚙️ How to configure**

1. Open a small project in VS Code. In its Terminal run `graphify codex install --project`.
2. Review any new instructions or hook files before using them.

**🚀 How to use it in your project**

1. Open your project in `codex` chat and ask: “Use Graphify to map this repository. Show how the API calls the database; do not edit code.”
2. Check for a generated `graphify-out/GRAPH_REPORT.md` or the report path printed by Graphify.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### GitHub Copilot CLI

**📦 How to install**

Follow the one-time installation above. No second copy of Graphify is needed for this computer.

**⚙️ How to configure**

1. Open a small project in VS Code. In its Terminal run `graphify install --platform copilot --project`.
2. Review any new instructions or hook files before using them.

**🚀 How to use it in your project**

1. Open your project in `copilot` chat and ask: “Use Graphify to map this repository. Show how the API calls the database; do not edit code.”
2. Check for a generated `graphify-out/GRAPH_REPORT.md` or the report path printed by Graphify.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### Visual Studio Code (Copilot Chat)

**📦 How to install**

Follow the one-time installation above. No second copy of Graphify is needed for this computer.

**⚙️ How to configure**

1. Open a small project in VS Code. In its Terminal run `graphify vscode install`.
2. Review any new instructions or hook files before using them.

**🚀 How to use it in your project**

1. Open your project in Copilot Chat → Agent and ask: “Use Graphify to map this repository. Show how the API calls the database; do not edit code.”
2. Check for a generated `graphify-out/GRAPH_REPORT.md` or the report path printed by Graphify.

**Check:** Check Copilot Chat’s agent/tool activity, not just the wording of the answer.

**Be careful:** Graph generation adds up-front time and needs refreshing as the code changes.

---

<a id="language-server-plugins"></a>
## 09. Language Server Plugins

**Type:** Language-aware diagnostics  
**In simple words:** Like giving Claude a language-aware dictionary for your code. Higher precision for typed languages.

**Publisher instructions:** [https://github.com/anthropics/claude-plugins-official/tree/main/plugins/typescript-lsp](https://github.com/anthropics/claude-plugins-official/tree/main/plugins/typescript-lsp)

### Claude Code CLI

**📦 How to install**

1. Open your project and identify its language (for example Python or TypeScript).
2. Start `claude`, open `/plugin` → **Discover**, and select only the matching language server plugin (for example `pyright-lsp` or `typescript-lsp`) if available.

**⚙️ How to configure**

1. Install any additional language-server dependency the selected plugin specifically requests; do not assume one server supports all languages.
2. Open the plugin details in `/plugin`, then restart Claude.

**🚀 How to use it in your project**

1. Open a file with a known type error, and ask Claude to use LSP diagnostics to locate it. Do not edit code.
2. Look for an actual file position and language-server diagnostic, not a generic model guess.

### Codex CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### GitHub Copilot CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### Visual Studio Code (Copilot Chat)

**Terminal only, not a Copilot Chat add-on.** In VS Code open **Terminal → New Terminal**, then use the Claude/Codex/Copilot CLI instructions above.

---

<a id="context-engineering"></a>
## 10. Context Engineering

**Type:** Planning skill  
**In simple words:** Like handing Copilot only the pages it actually needs. Keeps AI focused on the right files.

**Publisher instructions:** [https://github.com/github/awesome-copilot/tree/main/plugins/context-engineering](https://github.com/github/awesome-copilot/tree/main/plugins/context-engineering)

### Claude Code CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### Codex CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### GitHub Copilot CLI

**📦 How to install**

1. In normal Terminal run `copilot plugin marketplace browse awesome-copilot` and check the plugin name is listed.
2. If `context-engineering` appears, run `copilot plugin install context-engineering@awesome-copilot`. If not listed, stop; the plugin may have been renamed or removed.

**⚙️ How to configure**

1. Run `copilot plugin list` and check `context-engineering` appears, then start a new Copilot session.

**🚀 How to use it in your project**

1. In `copilot` chat inside your project, ask: “List only the files needed to update the user profile endpoint and why.”
2. **Expected:** A short file shortlist with reasons.

### Visual Studio Code (Copilot Chat)

**📦 How to install**

1. Open **VS Code → Extensions**. Search `@agentPlugins context-engineering`.
2. Open the matching publisher entry. Choose **Install** if available; if not shown, do not assume the CLI plugin is identical.

**⚙️ How to configure**

1. Check the installed **Agent Plugins** list, then open the project in **Copilot Chat → Agent**.

**🚀 How to use it in your project**

1. In **VS Code → Copilot Chat → Agent** with your project open, ask: “List only the files needed to update the user profile endpoint and why.”
2. **Expected:** A short file shortlist with reasons.

---

<a id="superpowers"></a>
## 11. Superpowers

**Type:** Testing and planning workflow  
**In simple words:** Like a careful coding coach: plan first, test, then build. Helps prevent rushed implementations and untested assumptions.

**Publisher instructions:** [https://github.com/obra/superpowers](https://github.com/obra/superpowers)

### Claude Code CLI

**📦 How to install**

1. Start `claude` inside your project and run `/plugin install superpowers@claude-plugins-official` in Claude chat.

**⚙️ How to configure**

1. Restart Claude. Open `/plugin` and confirm Superpowers is installed.

**🚀 How to use it in your project**

1. Ask: “Use Superpowers to plan a safe fix for this failing test. First show the plan; do not edit files yet.”
2. Expect questions and a short plan before code changes.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### Codex CLI

**📦 How to install**

1. Start `codex`. Type `/plugins` in Codex chat.
2. Search **Superpowers** in the official plugin browser and select **Install Plugin**.

**⚙️ How to configure**

1. Restart Codex; confirm Superpowers appears in `/plugins`.

**🚀 How to use it in your project**

1. Ask: “Use the Superpowers planning workflow for this bug; make no changes until the plan is reviewed.”
2. Check that the assistant proposes a plan and tests.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### GitHub Copilot CLI

**📦 How to install**

1. In normal Terminal run `copilot plugin marketplace add obra/superpowers-marketplace`.
2. Run `copilot plugin install superpowers@superpowers-marketplace`.

**⚙️ How to configure**

1. Run `copilot plugin list` and look for Superpowers. Restart Copilot CLI.

**🚀 How to use it in your project**

1. In your project start `copilot`. Ask: “Use the Superpowers brainstorming workflow to plan a small bug fix. Stop before changing files.”
2. Expect a planning discussion and an agreed scope before implementation.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### Visual Studio Code (Copilot Chat)

**📦 How to install**

1. Open **Extensions** in VS Code and search `@agentPlugins superpowers`.
2. Install only if a compatible trusted **Superpowers** entry is offered by a configured marketplace. If none exists, do not paste Claude-specific installation commands into Copilot Chat.

**⚙️ How to configure**

1. Confirm the entry under Agent Plugins, then start a fresh Copilot Chat session.

**🚀 How to use it in your project**

1. Ask for a test-first implementation plan; check that the installed Superpowers skill is selected in the agent activity.

**Check:** Check Copilot Chat’s agent/tool activity, not just the wording of the answer.

**Be careful:** Extra planning, agents and review can **increase** token cost.

---

<a id="ponytail"></a>
## 12. Ponytail

**Type:** Simpler code workflow  
**In simple words:** Like a coach that asks: “Can we solve this with less code?” Encourages less duplication, fewer dependencies and smaller, maintainable changes.

**Publisher instructions:** [https://github.com/DietrichGebert/ponytail](https://github.com/DietrichGebert/ponytail)

### Claude Code CLI

**📦 How to install**

1. In Claude chat run `/plugin marketplace add DietrichGebert/ponytail`.

**⚙️ How to configure**

1. Then run `/plugin install ponytail@ponytail`. Restart Claude.

**🚀 How to use it in your project**

1. In `claude` chat with your project open, ask: “Suggest the smallest safe fix for one test failure; do not omit validation.”
2. **Expected:** A focused proposed patch and explanation of unchanged behavior.

### Codex CLI

**📦 How to install**

1. In normal Terminal run `codex plugin marketplace add DietrichGebert/ponytail`.

**⚙️ How to configure**

1. Run `codex plugin add ponytail@ponytail`. Inspect changes and restart Codex.

**🚀 How to use it in your project**

1. In `codex` chat with your project open, ask: “Suggest the smallest safe fix for one test failure; do not omit validation.”
2. **Expected:** A focused proposed patch and explanation of unchanged behavior.

### GitHub Copilot CLI

**📦 How to install**

1. In normal Terminal run `copilot plugin marketplace add DietrichGebert/ponytail`.

**⚙️ How to configure**

1. Run `copilot plugin install ponytail@ponytail`, then `copilot plugin list`.

**🚀 How to use it in your project**

1. In `copilot` chat with your project open, ask: “Suggest the smallest safe fix for one test failure; do not omit validation.”
2. **Expected:** A focused proposed patch and explanation of unchanged behavior.

### Visual Studio Code (Copilot Chat)

**📦 How to install**

1. In Extensions search `@agentPlugins ponytail` and install if available.

**⚙️ How to configure**

1. If unavailable, use the maintainer-provided project instructions in `.github/copilot-instructions.md` only after reviewing them.

**🚀 How to use it in your project**

1. In **VS Code → Copilot Chat → Agent** with your project open, ask: “Suggest the smallest safe fix for one test failure; do not omit validation.”
2. **Expected:** A focused proposed patch and explanation of unchanged behavior.

**Be careful:** Less code” must never mean omitting validation, security or error handling.

---

<a id="agent-skills-addy-osmani"></a>
## 13. Agent Skills (Addy Osmani)

**Type:** Reusable coding skills  
**In simple words:** Like a toolbox full of small, reusable engineering checklists. Makes your quality process consistent across assistants.

**Publisher instructions:** [https://github.com/addyosmani/agent-skills](https://github.com/addyosmani/agent-skills)

### Claude Code CLI

**📦 How to install**

1. Inside Claude chat run `/plugin marketplace add addyosmani/agent-skills`.

**⚙️ How to configure**

1. Run `/plugin install agent-skills@addy-agent-skills` if shown.

**🚀 How to use it in your project**

1. In `claude` chat with your project open, ask: “Use the test-driven-development skill for this small defect.”
2. **Expected:** A failing test, then minimal fix, then passing test—if edits are approved.

### Codex CLI

**📦 How to install**

1. In normal Terminal run `codex plugin marketplace add addyosmani/agent-skills`.

**⚙️ How to configure**

1. Run `codex plugin add agent-skills@agent-skills`, then open a new session.

**🚀 How to use it in your project**

1. In `codex` chat with your project open, ask: “Use the test-driven-development skill for this small defect.”
2. **Expected:** A failing test, then minimal fix, then passing test—if edits are approved.

### GitHub Copilot CLI

**📦 How to install**

1. In normal Terminal run `copilot plugin install addyosmani/agent-skills` if supported by your release.

**⚙️ How to configure**

1. Run `copilot plugin list` and restart Copilot.

**🚀 How to use it in your project**

1. In `copilot` chat with your project open, ask: “Use the test-driven-development skill for this small defect.”
2. **Expected:** A failing test, then minimal fix, then passing test—if edits are approved.

### Visual Studio Code (Copilot Chat)

**📦 How to install**

1. In the project Terminal run `npx skills add addyosmani/agent-skills`; choose VS Code/Copilot when prompted.

**⚙️ How to configure**

1. Reopen Copilot Chat → Agent and check that the skill is available.

**🚀 How to use it in your project**

1. In **VS Code → Copilot Chat → Agent** with your project open, ask: “Use the test-driven-development skill for this small defect.”
2. **Expected:** A failing test, then minimal fix, then passing test—if edits are approved.

**Be careful:** The short `/spec` or `/review` aliases are Claude-specific; not automatically present in VS Code or Copilot.

---

<a id="claude-code-setup"></a>
## 14. Claude Code Setup

**Type:** Claude helper plugin  
**In simple words:** Like a setup wizard that suggests tools for your project. Personalized Claude setup, less guesswork.

**Publisher instructions:** [https://github.com/anthropics/claude-plugins-official/tree/main/plugins/claude-code-setup](https://github.com/anthropics/claude-plugins-official/tree/main/plugins/claude-code-setup)

### Claude Code CLI

**📦 How to install**

1. In your project folder start `claude`.
2. Inside Claude, open `/plugin` and look for `claude-code-setup`. If listed, run `/plugin install claude-code-setup@claude-plugins-official`.

**⚙️ How to configure**

1. Restart Claude Code (or reload plugins if offered). Open `/plugin` to confirm the item is installed.

**🚀 How to use it in your project**

1. In `claude` chat with your project open, ask: “Inspect this project and suggest only two useful Claude Code settings.”
2. **Expected:** Two project-specific settings and why they matter.

### Codex CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### GitHub Copilot CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### Visual Studio Code (Copilot Chat)

**Terminal only, not a Copilot Chat add-on.** In VS Code open **Terminal → New Terminal**, then use the Claude/Codex/Copilot CLI instructions above.

---

<a id="code-simplifier"></a>
## 15. Code Simplifier

**Type:** Code cleanup plugin  
**In simple words:** Like a tidy-up pass that makes changed code easier to read. Readable, maintainable patches.

**Publisher instructions:** [https://github.com/anthropics/claude-plugins-official/tree/main/plugins/code-simplifier](https://github.com/anthropics/claude-plugins-official/tree/main/plugins/code-simplifier)

### Claude Code CLI

**📦 How to install**

1. In your project folder start `claude`.
2. Inside Claude, open `/plugin` and look for `code-simplifier`. If listed, run `/plugin install code-simplifier@claude-plugins-official`.

**⚙️ How to configure**

1. Restart Claude Code (or reload plugins if offered). Open `/plugin` to confirm the item is installed.

**🚀 How to use it in your project**

1. In `claude` chat with your project open, ask: “Simplify the functions changed in my branch without changing their output.”
2. **Expected:** Small diff with unchanged test results.

### Codex CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### GitHub Copilot CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### Visual Studio Code (Copilot Chat)

**Terminal only, not a Copilot Chat add-on.** In VS Code open **Terminal → New Terminal**, then use the Claude/Codex/Copilot CLI instructions above.

---

<a id="feature-dev"></a>
## 16. Feature Dev

**Type:** Feature-building workflow  
**In simple words:** Like a step-by-step recipe for building a complete feature. Better planning for nontrivial features.

**Publisher instructions:** [https://github.com/anthropics/claude-plugins-official/tree/main/plugins/feature-dev](https://github.com/anthropics/claude-plugins-official/tree/main/plugins/feature-dev)

### Claude Code CLI

**📦 How to install**

1. In your project folder start `claude`.
2. Inside Claude, open `/plugin` and look for `feature-dev`. If listed, run `/plugin install feature-dev@claude-plugins-official`.

**⚙️ How to configure**

1. Restart Claude Code (or reload plugins if offered). Open `/plugin` to confirm the item is installed.

**🚀 How to use it in your project**

1. In `claude` chat with your project open, ask: “Plan a tiny settings-page change, list affected files, and stop before editing.”
2. **Expected:** An ordered task list grounded in this repository.

### Codex CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### GitHub Copilot CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### Visual Studio Code (Copilot Chat)

**Terminal only, not a Copilot Chat add-on.** In VS Code open **Terminal → New Terminal**, then use the Claude/Codex/Copilot CLI instructions above.

---

<a id="claudemd-management"></a>
## 17. CLAUDE.md Management

**Type:** Project instructions  
**In simple words:** Like a cleaner for the notes that tell Claude how your project works. Cleaner, reusable repo guidance.

**Publisher instructions:** [https://github.com/anthropics/claude-plugins-official/tree/main/plugins/claude-md-management](https://github.com/anthropics/claude-plugins-official/tree/main/plugins/claude-md-management)

### Claude Code CLI

**📦 How to install**

1. In your project folder start `claude`.
2. Inside Claude, open `/plugin` and look for `claude-md-management`. If listed, run `/plugin install claude-md-management@claude-plugins-official`.

**⚙️ How to configure**

1. Restart Claude Code (or reload plugins if offered). Open `/plugin` to confirm the item is installed.

**🚀 How to use it in your project**

1. In `claude` chat with your project open, ask: “Review CLAUDE.md in this project. Identify outdated instructions without changing them.”
2. **Expected:** Specific lines and suggested fixes.

### Codex CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### GitHub Copilot CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### Visual Studio Code (Copilot Chat)

**Terminal only, not a Copilot Chat add-on.** In VS Code open **Terminal → New Terminal**, then use the Claude/Codex/Copilot CLI instructions above.

---

<a id="project-planning"></a>
## 18. Project Planning

**Type:** Planning plugin  
**In simple words:** Like turning a huge feature into small, manageable tasks. Clearer scope before implementation.

**Publisher instructions:** [https://github.com/github/awesome-copilot/tree/main/plugins/project-planning](https://github.com/github/awesome-copilot/tree/main/plugins/project-planning)

### Claude Code CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### Codex CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### GitHub Copilot CLI

**📦 How to install**

1. In normal Terminal run `copilot plugin marketplace browse awesome-copilot` and check the plugin name is listed.
2. If `project-planning` appears, run `copilot plugin install project-planning@awesome-copilot`. If not listed, stop; the plugin may have been renamed or removed.

**⚙️ How to configure**

1. Run `copilot plugin list` and check `project-planning` appears, then start a new Copilot session.

**🚀 How to use it in your project**

1. In `copilot` chat inside your project, ask: “Plan this minor feature in three steps with a test for each step.”
2. **Expected:** A brief ordered plan with test cases.

### Visual Studio Code (Copilot Chat)

**📦 How to install**

1. Open **VS Code → Extensions**. Search `@agentPlugins project-planning`.
2. Open the matching publisher entry. Choose **Install** if available; if not shown, do not assume the CLI plugin is identical.

**⚙️ How to configure**

1. Check the installed **Agent Plugins** list, then open the project in **Copilot Chat → Agent**.

**🚀 How to use it in your project**

1. In **VS Code → Copilot Chat → Agent** with your project open, ask: “Plan this minor feature in three steps with a test for each step.”
2. **Expected:** A brief ordered plan with test cases.

---

<a id="java-development"></a>
## 19. Java Development

**Type:** Java workflow plugin  
**In simple words:** Like an experienced Java teammate’s coding checklist. Strong defaults for Java projects.

**Publisher instructions:** [https://github.com/github/awesome-copilot/tree/main/plugins/java-development](https://github.com/github/awesome-copilot/tree/main/plugins/java-development)

### Claude Code CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### Codex CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### GitHub Copilot CLI

**📦 How to install**

1. In normal Terminal run `copilot plugin marketplace browse awesome-copilot` and check the plugin name is listed.
2. If `java-development` appears, run `copilot plugin install java-development@awesome-copilot`. If not listed, stop; the plugin may have been renamed or removed.

**⚙️ How to configure**

1. Run `copilot plugin list` and check `java-development` appears, then start a new Copilot session.

**🚀 How to use it in your project**

1. In `copilot` chat inside your project, ask: “Create a JUnit regression-test plan for this Java service using existing conventions.”
2. **Expected:** Relevant Java/JUnit test location and methods.

### Visual Studio Code (Copilot Chat)

**📦 How to install**

1. Open **VS Code → Extensions**. Search `@agentPlugins java-development`.
2. Open the matching publisher entry. Choose **Install** if available; if not shown, do not assume the CLI plugin is identical.

**⚙️ How to configure**

1. Check the installed **Agent Plugins** list, then open the project in **Copilot Chat → Agent**.

**🚀 How to use it in your project**

1. In **VS Code → Copilot Chat → Agent** with your project open, ask: “Create a JUnit regression-test plan for this Java service using existing conventions.”
2. **Expected:** Relevant Java/JUnit test location and methods.

---

<a id="c-net-development"></a>
## 20. C# / .NET Development

**Type:** .NET workflow plugin  
**In simple words:** Like a C#/.NET teammate’s checklist for code and tests. Helps .NET teams stay consistent.

**Publisher instructions:** [https://github.com/github/awesome-copilot/tree/main/plugins/csharp-dotnet-development](https://github.com/github/awesome-copilot/tree/main/plugins/csharp-dotnet-development)

### Claude Code CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### Codex CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### GitHub Copilot CLI

**📦 How to install**

1. In normal Terminal run `copilot plugin marketplace browse awesome-copilot` and check the plugin name is listed.
2. If `csharp-dotnet-development` appears, run `copilot plugin install csharp-dotnet-development@awesome-copilot`. If not listed, stop; the plugin may have been renamed or removed.

**⚙️ How to configure**

1. Run `copilot plugin list` and check `csharp-dotnet-development` appears, then start a new Copilot session.

**🚀 How to use it in your project**

1. In `copilot` chat inside your project, ask: “Show which .NET test project should cover this service bug and propose a test.”
2. **Expected:** A suitable existing .NET test project and test method.

### Visual Studio Code (Copilot Chat)

**📦 How to install**

1. Open **VS Code → Extensions**. Search `@agentPlugins csharp-dotnet-development`.
2. Open the matching publisher entry. Choose **Install** if available; if not shown, do not assume the CLI plugin is identical.

**⚙️ How to configure**

1. Check the installed **Agent Plugins** list, then open the project in **Copilot Chat → Agent**.

**🚀 How to use it in your project**

1. In **VS Code → Copilot Chat → Agent** with your project open, ask: “Show which .NET test project should cover this service bug and propose a test.”
2. **Expected:** A suitable existing .NET test project and test method.

---

<a id="frontend-web-dev"></a>
## 21. Frontend Web Dev

**Type:** Frontend workflow plugin  
**In simple words:** Like a helpful guide to polished, accessible web interfaces. Better frontend conventions and accessibility checks.

**Publisher instructions:** [https://github.com/github/awesome-copilot/tree/main/plugins/frontend-web-dev](https://github.com/github/awesome-copilot/tree/main/plugins/frontend-web-dev)

### Claude Code CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### Codex CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### GitHub Copilot CLI

**📦 How to install**

1. In normal Terminal run `copilot plugin marketplace browse awesome-copilot` and check the plugin name is listed.
2. If `frontend-web-dev` appears, run `copilot plugin install frontend-web-dev@awesome-copilot`. If not listed, stop; the plugin may have been renamed or removed.

**⚙️ How to configure**

1. Run `copilot plugin list` and check `frontend-web-dev` appears, then start a new Copilot session.

**🚀 How to use it in your project**

1. In `copilot` chat inside your project, ask: “Check this page for keyboard accessibility and responsive layout problems.”
2. **Expected:** Concrete elements and suggested corrections.

### Visual Studio Code (Copilot Chat)

**📦 How to install**

1. Open **VS Code → Extensions**. Search `@agentPlugins frontend-web-dev`.
2. Open the matching publisher entry. Choose **Install** if available; if not shown, do not assume the CLI plugin is identical.

**⚙️ How to configure**

1. Check the installed **Agent Plugins** list, then open the project in **Copilot Chat → Agent**.

**🚀 How to use it in your project**

1. In **VS Code → Copilot Chat → Agent** with your project open, ask: “Check this page for keyboard accessibility and responsive layout problems.”
2. **Expected:** Concrete elements and suggested corrections.

---

<a id="where-was-i"></a>
## 22. Where Was I

**Type:** Resume-work plugin  
**In simple words:** Like a bookmark that reminds you what you were doing yesterday. Easy resumption after interruptions.

**Publisher instructions:** [https://github.com/github/awesome-copilot/tree/main/plugins/where-was-i](https://github.com/github/awesome-copilot/tree/main/plugins/where-was-i)

### Claude Code CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### Codex CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### GitHub Copilot CLI

**📦 How to install**

1. In normal Terminal run `copilot plugin marketplace browse awesome-copilot` and check the plugin name is listed.
2. If `where-was-i` appears, run `copilot plugin install where-was-i@awesome-copilot`. If not listed, stop; the plugin may have been renamed or removed.

**⚙️ How to configure**

1. Run `copilot plugin list` and check `where-was-i` appears, then start a new Copilot session.

**🚀 How to use it in your project**

1. In `copilot` chat inside your project, ask: “Tell me where I stopped in the current Git branch based on commits and unfinished changes.”
2. **Expected:** Actual current branch, changes and evidence; not imaginary previous chats.

### Visual Studio Code (Copilot Chat)

**📦 How to install**

1. Open **VS Code → Extensions**. Search `@agentPlugins where-was-i`.
2. Open the matching publisher entry. Choose **Install** if available; if not shown, do not assume the CLI plugin is identical.

**⚙️ How to configure**

1. Check the installed **Agent Plugins** list, then open the project in **Copilot Chat → Agent**.

**🚀 How to use it in your project**

1. In **VS Code → Copilot Chat → Agent** with your project open, ask: “Tell me where I stopped in the current Git branch based on commits and unfinished changes.”
2. **Expected:** Actual current branch, changes and evidence; not imaginary previous chats.

---

<a id="task-observer"></a>
## 23. Task Observer

**Type:** Skills observer  
**In simple words:** Like a notebook of repeated mistakes you can convert into better skills. Gradually improves a growing collection of personal skills.

**Publisher instructions:** [https://github.com/rebelytics/one-skill-to-rule-them-all](https://github.com/rebelytics/one-skill-to-rule-them-all)

### 📦 Install on your computer (once)

1. In normal Terminal check `npx --version` (Node.js is required).
2. Use only an approved source: `npx skills add rebelytics/one-skill-to-rule-them-all --skill task-observer`; select the intended agent if prompted.

### Claude Code CLI

**📦 How to install**

Follow the one-time installation above. No second copy of Task Observer is needed for this computer.

**⚙️ How to configure**

1. Review the installed skill files in your project/user profile, then restart the chosen agent.

**🚀 How to use it in your project**

1. In `claude` chat with your project open, ask: “After this small practice task, summarize which steps improved the workflow.”
2. **Expected:** A skill note or created observer output at the displayed location.

### Codex CLI

**📦 How to install**

Follow the one-time installation above. No second copy of Task Observer is needed for this computer.

**⚙️ How to configure**

1. Review the installed skill files in your project/user profile, then restart the chosen agent.

**🚀 How to use it in your project**

1. In `codex` chat with your project open, ask: “After this small practice task, summarize which steps improved the workflow.”
2. **Expected:** A skill note or created observer output at the displayed location.

### GitHub Copilot CLI

**📦 How to install**

Follow the one-time installation above. No second copy of Task Observer is needed for this computer.

**⚙️ How to configure**

1. Review the installed skill files in your project/user profile, then restart the chosen agent.

**🚀 How to use it in your project**

1. In `copilot` chat with your project open, ask: “After this small practice task, summarize which steps improved the workflow.”
2. **Expected:** A skill note or created observer output at the displayed location.

### Visual Studio Code (Copilot Chat)

**📦 How to install**

Follow the one-time installation above. No second copy of Task Observer is needed for this computer.

**⚙️ How to configure**

1. Review the installed skill files in your project/user profile, then restart the chosen agent.

**🚀 How to use it in your project**

1. In **VS Code → Copilot Chat → Agent** with your project open, ask: “After this small practice task, summarize which steps improved the workflow.”
2. **Expected:** A skill note or created observer output at the displayed location.

**Be careful:** This is not automatic self-editing; review proposed skill changes. Logs may contain sensitive context.

---

<a id="playwright-mcp"></a>
## 24. Playwright MCP

**Type:** Browser test server  
**In simple words:** Like letting your agent click through your website like a tester. Reproduces UI bugs and checks real browser behavior.

**Publisher instructions:** [https://github.com/microsoft/playwright-mcp](https://github.com/microsoft/playwright-mcp)

### 📦 Install on your computer (once)

1. Install Node.js from [nodejs.org](https://nodejs.org/en/download) if `node --version` and `npx --version` do not work.
2. Before testing **your** site, start your web application using its existing project README. Open its local URL in a browser to confirm it runs. Do not guess `localhost:3000`; use the address printed by the app.

### Claude Code CLI

**📦 How to install**

Follow the one-time installation above. No second copy of Playwright MCP is needed for this computer.

**⚙️ How to configure**

1. In normal Terminal run `claude mcp add playwright npx @playwright/mcp@latest`.
2. Start `claude` and use `/mcp` to check `playwright` is connected.

**🚀 How to use it in your project**

1. Ask the agent to inspect **the exact local URL printed by your running app**; do not provide passwords.
2. Expect the tool to navigate the page and report visible elements, console errors, or performance details.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### Codex CLI

**📦 How to install**

Follow the one-time installation above. No second copy of Playwright MCP is needed for this computer.

**⚙️ How to configure**

1. In normal Terminal run `codex mcp add playwright npx "@playwright/mcp@latest"`.
2. Start `codex`, type `/mcp`, and check `playwright` is available.

**🚀 How to use it in your project**

1. Ask Codex to navigate to your running app’s printed URL and inspect the page.
2. Check for browser-tool activity and findings relevant to the page.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### GitHub Copilot CLI

**📦 How to install**

Follow the one-time installation above. No second copy of Playwright MCP is needed for this computer.

**⚙️ How to configure**

1. Start `copilot` then enter `/mcp add` in Copilot chat.
2. Choose a **Local** server; enter name `playwright`, command `npx`, arguments `-y @playwright/mcp@latest`. Save and confirm it is connected.

**🚀 How to use it in your project**

1. Ask Copilot to visit your running web app URL and report what it sees or what the console shows.
2. Look for the browser-tool action in the transcript.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### Visual Studio Code (Copilot Chat)

**📦 How to install**

Follow the one-time installation above. No second copy of Playwright MCP is needed for this computer.

**⚙️ How to configure**

1. Open VS Code Command Palette and choose **MCP: Add Server** → **Command (stdio)**.
2. Enter command `npx` and arguments `-y @playwright/mcp@latest`; give it the name `playwright`. Confirm via **MCP: List Servers**.

**🚀 How to use it in your project**

1. Open **Copilot Chat → Agent**. Ask it to inspect the local URL printed by your running app.
2. Look for a real browser-tool run, not just a guess based on code.

**Check:** Check Copilot Chat’s agent/tool activity, not just the wording of the answer.

**Be careful:** Browser tools can expose cookies/pages. Use test accounts, not personal sessions.

---

<a id="chrome-devtools-mcp"></a>
## 25. Chrome DevTools MCP

**Type:** Chrome debugging server  
**In simple words:** Like giving your agent the browser’s error console and network tab. Excellent for frontend performance issues and JavaScript errors.

**Publisher instructions:** [https://github.com/ChromeDevTools/chrome-devtools-mcp](https://github.com/ChromeDevTools/chrome-devtools-mcp)

### 📦 Install on your computer (once)

1. Install Node.js from [nodejs.org](https://nodejs.org/en/download) if `node --version` and `npx --version` do not work.
2. Before testing **your** site, start your web application using its existing project README. Open its local URL in a browser to confirm it runs. Do not guess `localhost:3000`; use the address printed by the app.

### Claude Code CLI

**📦 How to install**

Follow the one-time installation above. No second copy of Chrome DevTools MCP is needed for this computer.

**⚙️ How to configure**

1. In normal Terminal run `claude mcp add chrome-devtools --scope user npx chrome-devtools-mcp@latest`.
2. Start `claude` and use `/mcp` to check `chrome-devtools` is connected.

**🚀 How to use it in your project**

1. Ask the agent to inspect **the exact local URL printed by your running app**; do not provide passwords.
2. Expect the tool to navigate the page and report visible elements, console errors, or performance details.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### Codex CLI

**📦 How to install**

Follow the one-time installation above. No second copy of Chrome DevTools MCP is needed for this computer.

**⚙️ How to configure**

1. In normal Terminal run `codex mcp add chrome-devtools -- npx chrome-devtools-mcp@latest`.
2. Start `codex`, type `/mcp`, and check `chrome-devtools` is available.

**🚀 How to use it in your project**

1. Ask Codex to navigate to your running app’s printed URL and inspect the page.
2. Check for browser-tool activity and findings relevant to the page.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### GitHub Copilot CLI

**📦 How to install**

Follow the one-time installation above. No second copy of Chrome DevTools MCP is needed for this computer.

**⚙️ How to configure**

1. Start `copilot` then enter `/mcp add` in Copilot chat.
2. Choose a **Local** server; enter name `chrome-devtools`, command `npx`, arguments `-y chrome-devtools-mcp@latest`. Save and confirm it is connected.

**🚀 How to use it in your project**

1. Ask Copilot to visit your running web app URL and report what it sees or what the console shows.
2. Look for the browser-tool action in the transcript.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### Visual Studio Code (Copilot Chat)

**📦 How to install**

Follow the one-time installation above. No second copy of Chrome DevTools MCP is needed for this computer.

**⚙️ How to configure**

1. Open VS Code Command Palette and choose **MCP: Add Server** → **Command (stdio)**.
2. Enter command `npx` and arguments `-y chrome-devtools-mcp@latest`; give it the name `chrome-devtools`. Confirm via **MCP: List Servers**.

**🚀 How to use it in your project**

1. Open **Copilot Chat → Agent**. Ask it to inspect the local URL printed by your running app.
2. Look for a real browser-tool run, not just a guess based on code.

**Check:** Check Copilot Chat’s agent/tool activity, not just the wording of the answer.

**Be careful:** A live debugging port can grant broad browser control. Avoid it on sensitive sessions.

---

<a id="testing-automation"></a>
## 26. Testing Automation

**Type:** Testing plugin  
**In simple words:** Like a recipe book for writing and running better tests. More reliable unit, integration and E2E tests.

**Publisher instructions:** [https://github.com/github/awesome-copilot/tree/main/plugins/testing-automation](https://github.com/github/awesome-copilot/tree/main/plugins/testing-automation)

### Claude Code CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### Codex CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### GitHub Copilot CLI

**📦 How to install**

1. In normal Terminal run `copilot plugin marketplace browse awesome-copilot` and check the plugin name is listed.
2. If `testing-automation` appears, run `copilot plugin install testing-automation@awesome-copilot`. If not listed, stop; the plugin may have been renamed or removed.

**⚙️ How to configure**

1. Run `copilot plugin list` and check `testing-automation` appears, then start a new Copilot session.

**🚀 How to use it in your project**

1. In `copilot` chat inside your project, ask: “Propose one regression test for this bug and explain where it belongs.”
2. **Expected:** A test file path and a reproducible failing case.

### Visual Studio Code (Copilot Chat)

**📦 How to install**

1. Open **VS Code → Extensions**. Search `@agentPlugins testing-automation`.
2. Open the matching publisher entry. Choose **Install** if available; if not shown, do not assume the CLI plugin is identical.

**⚙️ How to configure**

1. Check the installed **Agent Plugins** list, then open the project in **Copilot Chat → Agent**.

**🚀 How to use it in your project**

1. In **VS Code → Copilot Chat → Agent** with your project open, ask: “Propose one regression test for this bug and explain where it belongs.”
2. **Expected:** A test file path and a reproducible failing case.

---

<a id="pr-review-toolkit"></a>
## 27. PR Review Toolkit

**Type:** Code review plugin  
**In simple words:** Like a team of reviewers checking different mistakes in a PR. Thorough review of important PRs.

**Publisher instructions:** [https://github.com/anthropics/claude-plugins-official/tree/main/plugins/pr-review-toolkit](https://github.com/anthropics/claude-plugins-official/tree/main/plugins/pr-review-toolkit)

### Claude Code CLI

**📦 How to install**

1. In your project folder start `claude`.
2. Inside Claude, open `/plugin` and look for `pr-review-toolkit`. If listed, run `/plugin install pr-review-toolkit@claude-plugins-official`.

**⚙️ How to configure**

1. Restart Claude Code (or reload plugins if offered). Open `/plugin` to confirm the item is installed.

**🚀 How to use it in your project**

1. In `claude` chat with your project open, ask: “Review my uncommitted diff; list correctness risks and supporting line numbers.”
2. **Expected:** Findings tied to changed files or explicit no-findings.

### Codex CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### GitHub Copilot CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### Visual Studio Code (Copilot Chat)

**Terminal only, not a Copilot Chat add-on.** In VS Code open **Terminal → New Terminal**, then use the Claude/Codex/Copilot CLI instructions above.

---

<a id="pr-review"></a>
## 28. PR Review

**Type:** PR review plugin  
**In simple words:** Like an easier, grouped view of a GitHub pull request. Makes complex PRs easier to inspect.

**Publisher instructions:** [https://github.com/github/awesome-copilot/tree/main/plugins/pr-review](https://github.com/github/awesome-copilot/tree/main/plugins/pr-review)

### Claude Code CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### Codex CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### GitHub Copilot CLI

**📦 How to install**

1. In normal Terminal run `copilot plugin marketplace browse awesome-copilot` and check the plugin name is listed.
2. If `pr-review` appears, run `copilot plugin install pr-review@awesome-copilot`. If not listed, stop; the plugin may have been renamed or removed.

**⚙️ How to configure**

1. Run `copilot plugin list` and check `pr-review` appears, then start a new Copilot session.

**🚀 How to use it in your project**

1. In `copilot` chat inside your project, ask: “Review pull request number 123 in the approved repository (replace 123).”
2. **Expected:** Specific PR files and grounded review comments.

### Visual Studio Code (Copilot Chat)

**📦 How to install**

1. Open **VS Code → Extensions**. Search `@agentPlugins pr-review`.
2. Open the matching publisher entry. Choose **Install** if available; if not shown, do not assume the CLI plugin is identical.

**⚙️ How to configure**

1. Check the installed **Agent Plugins** list, then open the project in **Copilot Chat → Agent**.

**🚀 How to use it in your project**

1. In **VS Code → Copilot Chat → Agent** with your project open, ask: “Review pull request number 123 in the approved repository (replace 123).”
2. **Expected:** Specific PR files and grounded review comments.

**Be careful:** The My AI Usage and PR Review experiences may require a Copilot app canvas and are not plain VS Code slash commands.

---

<a id="coderabbit"></a>
## 29. CodeRabbit

**Type:** Code review service  
**In simple words:** Like a second reviewer that checks your changes before you share them. Extra feedback on risks, complexity and review issues before a PR.

**Publisher instructions:** [https://github.com/openai/plugins/blob/main/plugins/coderabbit/skills/coderabbit-review/SKILL.md](https://github.com/openai/plugins/blob/main/plugins/coderabbit/skills/coderabbit-review/SKILL.md)

### Claude Code CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### Codex CLI

**📦 How to install**

1. Start `codex` and open `/plugins`.
2. Find **CodeRabbit** and install it if your marketplace offers it.

**⚙️ How to configure**

1. Restart Codex; connect your authorized CodeRabbit/GitHub account if requested.

**🚀 How to use it in your project**

1. In `codex` chat with your project open, ask: “Review my current branch for risks before I open a pull request.”
2. **Expected:** Visible CodeRabbit review findings or the service-specific result.

### GitHub Copilot CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### Visual Studio Code (Copilot Chat)

**Terminal only, not a Copilot Chat add-on.** In VS Code open **Terminal → New Terminal**, then use the Claude/Codex/Copilot CLI instructions above.

**Be careful:** Code review may be processed by an external vendor.

---

<a id="sonarqube-mcp-server"></a>
## 30. SonarQube MCP Server

**Type:** SonarQube connection  
**In simple words:** Like bringing a real code-quality report into the AI conversation. Grounds the agent in actual static-analysis results instead of guesses.

**Publisher instructions:** [https://github.com/SonarSource/sonarqube-mcp-server](https://github.com/SonarSource/sonarqube-mcp-server)

### 📦 Install on your computer (once)

1. **Needs an organization SonarQube account.** Ask for its **Cloud organization key** or **Server URL**, plus permission to read a test project. This cannot be set up correctly without those values.
2. Install and start Docker Desktop (or your organization’s approved Docker alternative) from [Docker’s official site](https://docs.docker.com/get-docker/). Run `docker --version` and confirm Docker actually runs.
3. Obtain a **SonarQube user token** through the approved secure method. Never paste it into AI chat, an example command, or a tracked project file. [Official setup](https://github.com/SonarSource/sonarqube-mcp-server).

### Claude Code CLI

**📦 How to install**

Follow the one-time installation above. No second copy of SonarQube MCP Server is needed for this computer.

**⚙️ How to configure**

1. Supply `SONARQUBE_TOKEN` through approved environment/secret storage and set `SONARQUBE_ORG` (Cloud) or `SONARQUBE_URL` (Server).
2. Run `claude mcp list` and confirm the connection before using AI chat.

**🚀 How to use it in your project**

1. Ask for a read-only list of SonarQube issues from the permitted test project.
2. Expect real rule/issue identifiers. If authentication fails, ask an administrator—not the AI—to check access.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### Codex CLI

**📦 How to install**

Follow the one-time installation above. No second copy of SonarQube MCP Server is needed for this computer.

**⚙️ How to configure**

1. Supply `SONARQUBE_TOKEN` through approved environment/secret storage and set `SONARQUBE_ORG` (Cloud) or `SONARQUBE_URL` (Server).
2. Run `codex mcp list` and confirm the connection before using AI chat.

**🚀 How to use it in your project**

1. Ask for a read-only list of SonarQube issues from the permitted test project.
2. Expect real rule/issue identifiers. If authentication fails, ask an administrator—not the AI—to check access.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### GitHub Copilot CLI

**📦 How to install**

Follow the one-time installation above. No second copy of SonarQube MCP Server is needed for this computer.

**⚙️ How to configure**

1. In the MCP form, supply `SONARQUBE_TOKEN` securely and either `SONARQUBE_ORG` (Cloud) or `SONARQUBE_URL` (Server).
2. Save the server and confirm `sonarqube` appears connected in `/mcp`.

**🚀 How to use it in your project**

1. Ask: “List three code-quality issues in our approved SonarQube test project. Do not change code.”
2. Look for SonarQube issue identifiers and file locations.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### Visual Studio Code (Copilot Chat)

**📦 How to install**

Follow the one-time installation above. No second copy of SonarQube MCP Server is needed for this computer.

**⚙️ How to configure**

1. Configure token and Cloud organization key or Server URL in **secret-safe settings**, not committed files.
2. Open **MCP: List Servers**, check it can connect, and restrict permissions to a test project.

**🚀 How to use it in your project**

1. In **Copilot Chat → Agent** ask for issues in the authorized project.
2. Expect grounded SonarQube issues and their locations.

**Check:** Check Copilot Chat’s agent/tool activity, not just the wording of the answer.

**Be careful:** Requires an existing SonarQube deployment; may not support older self-hosted server versions.

---

<a id="codex-security"></a>
## 31. Codex Security

**Type:** Codex security plugin  
**In simple words:** Like a security inspector that investigates suspicious changes. Structured security review and targeted remediation.

**Publisher instructions:** [https://github.com/openai/plugins/blob/main/plugins/codex-security/.codex-plugin/plugin.json](https://github.com/openai/plugins/blob/main/plugins/codex-security/.codex-plugin/plugin.json)

### Claude Code CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### Codex CLI

**📦 How to install**

1. Start `codex` and open `/plugins`.
2. Find **Codex Security** and install it only if the official marketplace offers it.

**⚙️ How to configure**

1. Open a new Codex session; use the plugin on a non-confidential test branch first.

**🚀 How to use it in your project**

1. In `codex` chat with your project open, ask: “Do a read-only security review of this test branch and list likely issues.”
2. **Expected:** Location-specific findings or a clear no-findings result.

### GitHub Copilot CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### Visual Studio Code (Copilot Chat)

**Terminal only, not a Copilot Chat add-on.** In VS Code open **Terminal → New Terminal**, then use the Claude/Codex/Copilot CLI instructions above.

**Be careful:** Availability and backend access can depend on your account/organization.

---

<a id="security-guidance"></a>
## 32. Security Guidance

**Type:** Security guidance plugin  
**In simple words:** Like guardrails that warn when new code looks risky. Catches risky patterns early.

**Publisher instructions:** [https://github.com/anthropics/claude-plugins-official/tree/main/plugins/security-guidance](https://github.com/anthropics/claude-plugins-official/tree/main/plugins/security-guidance)

### Claude Code CLI

**📦 How to install**

1. In your project folder start `claude`.
2. Inside Claude, open `/plugin` and look for `security-guidance`. If listed, run `/plugin install security-guidance@claude-plugins-official`.

**⚙️ How to configure**

1. Restart Claude Code (or reload plugins if offered). Open `/plugin` to confirm the item is installed.

**🚀 How to use it in your project**

1. In `claude` chat with your project open, ask: “Check the changed authentication code for common risky patterns without editing.”
2. **Expected:** Named risky patterns and exact affected lines.

### Codex CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### GitHub Copilot CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### Visual Studio Code (Copilot Chat)

**Terminal only, not a Copilot Chat add-on.** In VS Code open **Terminal → New Terminal**, then use the Claude/Codex/Copilot CLI instructions above.

**Be careful:** Availability and command names can vary across marketplace revisions; check `/plugin` before trying a suggested command.

---

<a id="claude-security"></a>
## 33. Claude Security

**Type:** Security review plugin  
**In simple words:** Like a deeper security investigation team for authorized repositories. Useful for targeted AppSec reviews.

**Publisher instructions:** [https://github.com/anthropics/claude-plugins-official/tree/main/plugins/claude-security](https://github.com/anthropics/claude-plugins-official/tree/main/plugins/claude-security)

### Claude Code CLI

**📦 How to install**

1. In your project folder start `claude`.
2. Inside Claude, open `/plugin` and look for `claude-security`. If listed, run `/plugin install claude-security@claude-plugins-official`.

**⚙️ How to configure**

1. Restart Claude Code (or reload plugins if offered). Open `/plugin` to confirm the item is installed.

**🚀 How to use it in your project**

1. In `claude` chat with your project open, ask: “Review access-control code for security mistakes without editing.”
2. **Expected:** Specific evidence and severity caveats.

### Codex CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### GitHub Copilot CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### Visual Studio Code (Copilot Chat)

**Terminal only, not a Copilot Chat add-on.** In VS Code open **Terminal → New Terminal**, then use the Claude/Codex/Copilot CLI instructions above.

**Be careful:** Availability and command names can vary across marketplace revisions; check `/plugin` before trying a suggested command.

---

<a id="semgrep"></a>
## 34. Semgrep

**Type:** Code security scanner  
**In simple words:** Like a security scanner that follows explicit matching rules. Deterministic findings that complement AI judgement.

**Publisher instructions:** [https://claude.com/marketplace/plugins/semgrep](https://claude.com/marketplace/plugins/semgrep)

### Claude Code CLI

**📦 How to install**

1. Start `claude`, then open `/plugin` → **Discover**.
2. Search **Semgrep** and install only if a trusted supported plugin is available.

**⚙️ How to configure**

1. Provide only authorized project scan access and verify the plugin is enabled.

**🚀 How to use it in your project**

1. In `claude` chat with your project open, ask: “Run the configured Semgrep scan on this practice project; summarize findings.”
2. **Expected:** Rule IDs/locations or a clean scan, plus command output.

### Codex CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### GitHub Copilot CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### Visual Studio Code (Copilot Chat)

**Terminal only, not a Copilot Chat add-on.** In VS Code open **Terminal → New Terminal**, then use the Claude/Codex/Copilot CLI instructions above.

**Be careful:** Availability and command names can vary across marketplace revisions; check `/plugin` before trying a suggested command.

---

<a id="security-best-practices"></a>
## 35. Security Best Practices

**Type:** Security checklist plugin  
**In simple words:** Like a checklist for avoiding common coding security mistakes. Adds structured review criteria.

**Publisher instructions:** [https://github.com/github/awesome-copilot/tree/main/plugins/security-best-practices](https://github.com/github/awesome-copilot/tree/main/plugins/security-best-practices)

### Claude Code CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### Codex CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### GitHub Copilot CLI

**📦 How to install**

1. In normal Terminal run `copilot plugin marketplace browse awesome-copilot` and check the plugin name is listed.
2. If `security-best-practices` appears, run `copilot plugin install security-best-practices@awesome-copilot`. If not listed, stop; the plugin may have been renamed or removed.

**⚙️ How to configure**

1. Run `copilot plugin list` and check `security-best-practices` appears, then start a new Copilot session.

**🚀 How to use it in your project**

1. In `copilot` chat inside your project, ask: “Give a security checklist for this API endpoint based on code you can see.”
2. **Expected:** A checklist linked to real code evidence.

### Visual Studio Code (Copilot Chat)

**📦 How to install**

1. Open **VS Code → Extensions**. Search `@agentPlugins security-best-practices`.
2. Open the matching publisher entry. Choose **Install** if available; if not shown, do not assume the CLI plugin is identical.

**⚙️ How to configure**

1. Check the installed **Agent Plugins** list, then open the project in **Copilot Chat → Agent**.

**🚀 How to use it in your project**

1. In **VS Code → Copilot Chat → Agent** with your project open, ask: “Give a security checklist for this API endpoint based on code you can see.”
2. **Expected:** A checklist linked to real code evidence.

---

<a id="github-mcp-server"></a>
## 36. GitHub MCP Server

**Type:** GitHub connection  
**In simple words:** Like a bridge from your coding assistant to GitHub issues and PRs. Cuts tab switching; enables repo-aware reviews and issue-to-PR workflows.

**Publisher instructions:** [https://github.com/github/github-mcp-server](https://github.com/github/github-mcp-server)

### Claude Code CLI

**📦 How to install**

1. Install and start Docker Desktop if allowed; open Terminal and check that `docker --version` works.
2. In normal Terminal run `claude mcp add github -e GITHUB_OAUTH_CALLBACK_PORT=8085 -- docker run -i --rm -p 127.0.0.1:8085:8085 -e GITHUB_OAUTH_CALLBACK_PORT ghcr.io/github/github-mcp-server`.

**⚙️ How to configure**

1. Start `claude`; follow the **GitHub browser sign-in** if the server requests it. Review repository permissions before authorizing.
2. Run `claude mcp list` to confirm `github` exists; check `/mcp` inside Claude Code.

**🚀 How to use it in your project**

1. Ask Claude: “List five open issues in our permitted GitHub repository. Do not modify them.”
2. Check issue IDs on GitHub.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### Codex CLI

**📦 How to install**

1. Ask the GitHub administrator for a **read-only personal-access token** and have it securely provided to your Terminal as environment variable `GITHUB_PAT_TOKEN` (never type it into AI chat or source files).
2. In normal Terminal run `codex mcp add github --url https://api.githubcopilot.com/mcp/ --bearer-token-env-var GITHUB_PAT_TOKEN`.

**⚙️ How to configure**

1. Run `codex mcp list`. Start `codex`, type `/mcp` and confirm `github` tools appear. If access is denied, ask your administrator to check token permissions.

**🚀 How to use it in your project**

1. In Codex chat ask: “List five open issues in our approved GitHub repository. Do not modify them.”
2. Confirm issue IDs on GitHub.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### GitHub Copilot CLI

**📦 How to install**

1. Start `copilot` and inspect `/mcp` and available GitHub tools first; they may already be built in.
2. Only if missing, use `/mcp add` with the [official GitHub Copilot CLI MCP instructions](https://github.com/github/github-mcp-server/blob/main/docs/installation-guides/README.md).

**⚙️ How to configure**

1. Complete the supported GitHub authorization method and restrict token scopes to what you need.
2. Confirm GitHub tools appear connected before querying a repo.

**🚀 How to use it in your project**

1. Ask: “List open issues in the current authorized repository; do not edit anything.”
2. Look for matching GitHub issue numbers.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### Visual Studio Code (Copilot Chat)

**📦 How to install**

1. In **Copilot Chat → Agent**, check whether **GitHub tools** are already available. Avoid duplicate setup if they already work.
2. If missing, open **Command Palette → MCP: Add Server → HTTP** and enter `https://api.githubcopilot.com/mcp/`, naming it `github`. This is the official remote service.

**⚙️ How to configure**

1. When VS Code prompts you to connect to GitHub, choose **Allow** and sign in through the browser using the permitted GitHub account.
2. Confirm GitHub tools are listed in the agent tool chooser.

**🚀 How to use it in your project**

1. Ask: “List the open issues in the GitHub repository I have open. Do not post comments.”
2. Check real issue numbers and titles.

**Check:** Check Copilot Chat’s agent/tool activity, not just the wording of the answer.

**Be careful:** Approval is needed before merge/write operations. Never put a PAT inside a tracked configuration file.

---

<a id="openai-developers"></a>
## 37. OpenAI Developers

**Type:** OpenAI documentation plugin  
**In simple words:** Like a guide for building and debugging apps using OpenAI APIs. Safer development with current API behavior and code examples.

**Publisher instructions:** [https://developers.openai.com/learn/developers-codex-plugin](https://developers.openai.com/learn/developers-codex-plugin)

### Claude Code CLI

**📦 How to install**

1. Open a normal Terminal inside your project, start `claude`.
2. Inside **Claude Code chat**, type `/plugin marketplace add openai/openai-developers-for-claude`.
3. Then in Claude chat type `/plugin install openai-developers@openai-developers`.

**⚙️ How to configure**

1. Restart Claude Code. In `/plugin`, confirm OpenAI Developers is installed; the Claude variant uses public OpenAI Docs tools and skills, **not** the Codex-only Platform connection.

**🚀 How to use it in your project**

1. Ask: “Use official OpenAI documentation to explain the current Agents SDK tool definition. Do not edit files.”
2. Check for OpenAI documentation references.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### Codex CLI

**📦 How to install**

1. Start `codex` in your project. In Codex chat type `/plugins`.
2. Search for **OpenAI Developers**, select it and choose **Install plugin**.

**⚙️ How to configure**

1. Follow any optional OpenAI Platform account-connection prompts only if your work requires that integration.
2. Open a new Codex chat.

**🚀 How to use it in your project**

1. Ask: “Using the official OpenAI docs, check if the SDK call in this file is current. Do not change it.”
2. Look for docs-linked feedback, not a made-up API call.

**Check:** Read the terminal or agent activity to confirm the add-on was actually used.

### GitHub Copilot CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### Visual Studio Code (Copilot Chat)

**Terminal only, not a Copilot Chat add-on.** In VS Code open **Terminal → New Terminal**, then use the Claude/Codex/Copilot CLI instructions above.

**Be careful:** API-related examples should be checked against current model and project settings.

---

<a id="figma-codex-plugin"></a>
## 38. Figma (Codex plugin)

**Type:** Design connection  
**In simple words:** Like letting the coding assistant read your actual design reference. Less guesswork about visual details and reusable component conventions.

**Publisher instructions:** [https://github.com/openai/plugins/tree/main/plugins/figma](https://github.com/openai/plugins/tree/main/plugins/figma)

### Claude Code CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### Codex CLI

**📦 How to install**

1. In your project folder start `codex`, then open `/plugins`.
2. Find **Figma** and install only if the official marketplace lists it.

**⚙️ How to configure**

1. Restart Codex. If the plugin needs an account, connect only your authorized workspace.

**🚀 How to use it in your project**

1. In `codex` chat with your project open, ask: “Compare this permitted Figma frame with the existing button component.”
2. **Expected:** Design details from the connected authorized Figma file.

### GitHub Copilot CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### Visual Studio Code (Copilot Chat)

**Terminal only, not a Copilot Chat add-on.** In VS Code open **Terminal → New Terminal**, then use the Claude/Codex/Copilot CLI instructions above.

**Be careful:** Generated UI still needs responsive and accessibility verification.

---

<a id="build-web-apps-codex"></a>
## 39. Build Web Apps (Codex)

**Type:** Web application workflow  
**In simple words:** Like a starter toolkit for building and testing web applications. Convenient scaffold/workflow for web app development.

**Publisher instructions:** [https://github.com/openai/plugins/tree/main/plugins/build-web-apps](https://github.com/openai/plugins/tree/main/plugins/build-web-apps)

### Claude Code CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### Codex CLI

**📦 How to install**

1. In your project folder start `codex`, then open `/plugins`.
2. Find **Build Web Apps** and install only if the official marketplace lists it.

**⚙️ How to configure**

1. Restart Codex. If the plugin needs an account, connect only your authorized workspace.

**🚀 How to use it in your project**

1. In `codex` chat with your project open, ask: “Plan a small web page from this repository, then show how to run it locally.”
2. **Expected:** A runnable local build/run path and expected URL; no deployment without approval.

### GitHub Copilot CLI

**No verified installation path for this particular add-on here.** It might have a different, equivalent tool. Do not use another client’s installation instructions.

### Visual Studio Code (Copilot Chat)

**Terminal only, not a Copilot Chat add-on.** In VS Code open **Terminal → New Terminal**, then use the Claude/Codex/Copilot CLI instructions above.

**Be careful:** Treat service deployment/payment actions as separate approvals.

---

## If a step does not work

1. **Check where you typed it.** Setup commands belong in Terminal; normal-English project tasks belong in assistant chat.
2. **Read the whole error.** Common causes are missing Node.js/uv/Docker, no company permission, a wrong operating system, or an add-on that was renamed.
3. **Check the version.** Run the tool’s `--version` or `--help` command when available and compare with its linked publisher instructions.
4. **Confirm the connection.** An MCP server should appear as connected, a plugin should appear as installed, or the tool should show a real activity report.
5. **Do not try random fixes on a work machine.** Stop and ask your local IT/security team if something requests extra credentials or bypasses a protection.

## Documentation and verification notes

This guide was rebuilt from the original 39-add-on list and its beginner-readiness audit. Current publisher and official platform instructions were checked for major integration paths, including RTK, Serena, Context7, Graphify, Claude-Mem, Superpowers, Playwright, Chrome DevTools, GitHub Copilot, SonarQube, VS Code, and OpenAI Developers. Other community add-ons are version-dependent; where a universal install could not be confirmed, the guide tells you to check an installed marketplace item instead of inventing a command.

**RTK Windows note:** The publisher’s Windows/hook guidance has varied between documentation pages and releases. On native Windows, check whether your exact RTK version actually registers a working hook; some paths require WSL or provide only instruction-based fallback. Do not infer hook support from `rtk --version` alone. See [RTK supported agents](https://www.rtk-ai.app/docs/getting-started/supported-agents/).

**Testing limit:** The instructions were reviewed against publisher documentation, but they have **not** been executed on your computer, against company policy or across every OS/release.

**Key platform references:** [Claude plugins](https://code.claude.com/docs/en/plugins) · [Codex plugins](https://developers.openai.com/plugins/) · [GitHub Copilot CLI plugins](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/plugins-finding-installing) · [VS Code agent plugins](https://code.visualstudio.com/docs/agent-customization/agent-plugins) · [OpenAI Developers](https://developers.openai.com/learn/developers-codex-plugin).

---

## Documentation links

[Read all Gehan's Project Lab guides online](https://gcfernando.github.io/other_codes/documentation/) · [Project overview](https://gcfernando.github.io/other_codes/) · [All developer projects](https://gcfernando.github.io/gcfernando/projects/)
