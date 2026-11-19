# vm-portable-settings

Repo for declarative working system setup.

- [Common](#common)
  - [IntelliJ settings](#intellij-settings)
  - [Shell commands](#shell-commands)
  - [Claude Code](#claude-code)
  - [Firefox](#firefox)
- [Linux](#linux)
  - [NixOS](#nixos)
- [macOS](#macos)
  - [Homebrew](#homebrew)
  - [Karabiner keymap](#karabiner-keymap)

## Common

### IntelliJ settings

Settings live unpacked in `intellij/`. There is no ready zip in the repo.

Content:
- **Font:** Fira Code in the editor, the terminal (size 15) and the console (size 16, line spacing 1.2). Fira Code must be installed on the system.
- **Look:** IntelliJ Light theme, compact UI density, main menu merged into the toolbar. Tool window stripes, status bar and navigation bar are hidden.
- **Startup and exit:** doesn't reopen the last project, no exit confirmation, running processes are terminated on close.
- **Spell and grammar:** Grazie with English (US), German and Russian enabled (`options/grazie_global.xml`). The language packs and dictionaries are not in the repo. IntelliJ downloads them itself after the import.
- **Plugins:** listed in `intellij/installed.txt`, e.g. GitHub Copilot, Claude Code, Key Promoter X, Python, Terraform (HCL), Prisma, .env, .ignore, Makefile, MCP Server.
- **GitHub Copilot:** inline completions off, next edit suggestions on.

#### Install

Pack the settings into `intellij/settings.zip` (not tracked by git) with [`intellij/pack.sh`](intellij/pack.sh):

```sh
./intellij/pack.sh
```

Then in IntelliJ: **File → Manage IDE Settings → Import Settings…** and pick `intellij/settings.zip`.

### Shell commands

Custom mnemonic command helpers in `bashrc/custom.sh`. Work in both bash and zsh.

| Command | What it does |
| --- | --- |
| `gitclean` | Discard all changes and untracked files (`git reset --hard HEAD && git clean -fd`) |
| `nb <words>` | New branch named `<date>-<words>`, e.g. `nb fix login` → `2026-11-19-fix-login` |
| `chmp` | Checkout `main` and pull |
| `dnuke` | Kill all running Docker containers (`docker kill`) |

#### Install

Copy the content of `bashrc/custom.sh` into your shell's rc file, once: `~/.bashrc` (Linux, Git Bash on Windows) or `~/.zshrc` (macOS).

```sh
cat bashrc/custom.sh >> ~/.bashrc   # or ~/.zshrc
```

Open a new terminal afterwards.

### Claude Code

Snapshot of `~/.claude` config for software engineering:

- `claude/CLAUDE.md`: global instructions
- `claude/plugins.md`: installed plugins and how to install them
- `claude/skills/`: all skills used for engineering-related tasks.

#### Install

Copies `CLAUDE.md` and the skills into `~/.claude` with [`claude/install.sh`](claude/install.sh). An existing, different `~/.claude/CLAUDE.md` is saved as `CLAUDE.md.bak` first.

```sh
./claude/install.sh
```

Plugins are installed by hand as listed in `claude/plugins.md`.

**General AI usage strategy**:

- Understand AI's reasoning before approving any step. Don't understand ⇒ clarify first, analyze and only then approve/edit strategy. Keep your own engineering & critical thinking skills sharp.
- Keep the AI intervention in the codebase to a minimum. Adhere to safety rules to prevent any unwanted writes. Keep the code quality, readability and maintainability high.
- Always keep AI easily stoppable. Prevent spawning subajents and subshells to keep attention focus on one context window unless explicitly asked.
- Keep AI's communication style optimal and concise. Avoid producing unreadable slop texts. 

### Firefox

`firefox/user.js` turns off Firefox's built-in AI and machine-learning features:

- **AI controls** (`browser.ai.control.*`): AI chatbot sidebar, link preview key points, smart tab groups, translations, PDF alt text. All set to `blocked`.
- **ML engine and chat** (`browser.ml.*`, `extensions.ml.enabled`): local ML models, chatbot sidebar, menu, shortcuts and badges, link preview, page assist.
- **Smart tab groups** (`browser.tabs.groups.smart.*`).
- **Smart search and history** (`browser.search.visualSearch.featureGate`, `places.semanticHistory.featureGate`).
- **PDF alt text** (`pdfjs.*AltText*`), including the model download.
- **Translations** (`browser.translations.*`): the feature and its automatic popup.

Install: copy `user.js` into the Firefox profile folder, then restart Firefox.

1. Find the profile folder: open `about:support` in Firefox, then **Profile Folder → Open Folder** (macOS: **Show in Finder**).
2. Close Firefox.
3. Copy the file in:

Firefox applies `user.js` on every start and overwrites the same prefs in `prefs.js`. To undo: delete `user.js`, then reset the prefs in `about:config` (removing the file alone doesn't revert them).

## Linux

### NixOS

`configuration.nix` for quick machine setup, in `nixos-burner-setup/`.

#### Install

Run on the NixOS machine with [`nixos-burner-setup/install.sh`](nixos-burner-setup/install.sh). It copies `configuration.nix` to `/etc/nixos/` (an existing, different one is saved as `configuration.nix.bak`) and runs `nixos-rebuild switch`. It asks for `sudo`.

```sh
./nixos-burner-setup/install.sh
```

## macOS

### Homebrew

`homebrew/Brewfile` lists everything needed for an engineering Mac setup: formulae, casks and global npm packages.

#### Install

Needs Homebrew first. Then install everything with [`homebrew/install.sh`](homebrew/install.sh):

```sh
./homebrew/install.sh
```

### Karabiner keymap

Goal: make macOS + IntelliJ feel as close to Windows as possible, keymap-wise. Same muscle memory for IntelliJ shortcuts, copy/paste, window and input switching.

Config lives in `karabiner/` (`karabiner.json` + `assets/`). It is a snapshot of `~/.config/karabiner/`.

#### Install

Copies the config into `~/.config/karabiner/` with [`karabiner/install.sh`](karabiner/install.sh). An existing, different `karabiner.json` is saved as `karabiner.json.bak` first.

```sh
./karabiner/install.sh
```
