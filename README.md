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

Settings live unpacked in `intellij/`. Pack the settings into `intellij/settings.zip` (not tracked by git) with:

```sh
./intellij/pack.sh
```

Import in any IntelliJ: **File → Manage IDE Settings → Import Settings…** and pick `intellij/settings.zip`.

Content:
- **Font:** Fira Code in the editor, the terminal (size 15) and the console (size 16, line spacing 1.2). Fira Code must be installed on the system.
- **Look:** IntelliJ Light theme, compact UI density, main menu merged into the toolbar. Tool window stripes, status bar and navigation bar are hidden.
- **Startup and exit:** doesn't reopen the last project, no exit confirmation, running processes are terminated on close.
- **Spell and grammar:** Grazie with English (US), German and Russian. The dictionaries are included in `intellij/grazie/`.
- **Plugins:** listed in `intellij/installed.txt`, e.g. GitHub Copilot, Claude Code, Key Promoter X, Python, Terraform (HCL), Prisma, .env, .ignore, Makefile, MCP Server.
- **GitHub Copilot:** inline completions off, next edit suggestions on.

### Shell commands

Custom mnemonic command helpers in `bashrc/custom.sh`. Work in both bash and zsh.

| Command | What it does |
| --- | --- |
| `gitclean` | Discard all changes and untracked files (`git reset --hard HEAD && git clean -fd`) |
| `nb <words>` | New branch named `<date>-<words>`, e.g. `nb fix login` → `2026-11-19-fix-login` |
| `chmp` | Checkout `main` and pull |
| `dnuke` | Kill all running Docker containers (`docker kill`) |

### Claude Code

Snapshot of `~/.claude` config for software engineering:

- `claude/CLAUDE.md`: global instructions
- `claude/plugins.md`: installed plugins and how to install them
- `claude/skills/`: all skills used for engineering-related tasks.

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

Apply on the target machine:

```sh
sudo cp nixos-burner-setup/configuration.nix /etc/nixos/configuration.nix
sudo nixos-rebuild switch
```

## macOS

### Homebrew

`homebrew/Brewfile` lists everything needed for an engineering Mac setup: formulae, casks and global npm packages.

Install all of it on a new Mac first:

```sh
./homebrew/install.sh
```

Save: re-dump after installing or removing programs:

```sh
brew bundle dump --file=homebrew/Brewfile --force
```

### Karabiner keymap

Goal: make macOS + IntelliJ feel as close to Windows as possible, keymap-wise. Same muscle memory for IntelliJ shortcuts, copy/paste, window and input switching.

Config lives in `karabiner/` (`karabiner.json` + `assets/`). It is a snapshot of `~/.config/karabiner/`.
