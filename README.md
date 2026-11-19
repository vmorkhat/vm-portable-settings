# vm-portable-settings

Repo for declarative working system setup.

- [Common](#common)
  - [IntelliJ settings](#intellij-settings)
  - [Shell commands](#shell-commands)
- [Linux](#linux)
  - [NixOS](#nixos)
- [macOS](#macos)
  - [Karabiner keymap](#karabiner-keymap)

## Common

### IntelliJ settings

Settings live unpacked in `intellij/`. Pack them into `intellij/settings.zip` from the repo root:

```sh
rm -f intellij/settings.zip && (cd intellij && zip -r settings.zip . -x '*.DS_Store' 'settings.zip')
```

Import in any IntelliJ: **File → Manage IDE Settings → Import Settings…** and pick `intellij/settings.zip`.

### Shell commands

Custom command helpers in `bashrc/custom.sh`. Work in both bash and zsh.

| Command | What it does |
| --- | --- |
| `gitclean` | Discard all changes and untracked files (`git reset --hard HEAD && git clean -fd`) |
| `nb <words>` | New branch named `<date>-<words>`, e.g. `nb fix login` → `2026-11-19-fix-login` |
| `chmp` | Checkout `main` and pull |
| `dnuke` | Kill all running Docker containers (`docker kill`) |

## Linux

### NixOS

`configuration.nix` for quick machine setup, in `nixos-burner-setup/`.

Apply on the target machine:

```sh
sudo cp nixos-burner-setup/configuration.nix /etc/nixos/configuration.nix
sudo nixos-rebuild switch
```

## macOS

### Karabiner keymap

Goal: make macOS + IntelliJ feel as close to Windows as possible, keymap-wise. Same muscle memory for IntelliJ shortcuts, copy/paste, window and input switching.

Config lives in `karabiner/` (`karabiner.json` + `assets/`). It is a snapshot of `~/.config/karabiner/`.

Save: re-copy after changing settings in the Karabiner GUI:

```sh
cp ~/.config/karabiner/karabiner.json karabiner/ && cp -R ~/.config/karabiner/assets karabiner/
```

Restore on a new Mac:

```sh
mkdir -p ~/.config/karabiner && cp -R karabiner/. ~/.config/karabiner/
```
