# vm-portable-settings

Repo for declarative working system setup.

## Common:

- IntelliJ settings

## Linux:
- NixOS `configuration.nix` for quick machine setup

## macOS:
- Karabiner keymap

### Pack IntelliJ settings

Settings live unpacked in `intellij/`. Pack them into `intellij/settings.zip` from the repo root:

```sh
rm -f intellij/settings.zip && (cd intellij && zip -r settings.zip . -x '*.DS_Store' 'settings.zip')
```

Import in any IntelliJ: **File → Manage IDE Settings → Import Settings…** and pick `intellij/settings.zip`.

## macOS

- Karabiner keymap

### Karabiner keymap

Goal: make macOS + IntelliJ feel as close to Windows as possible, keymap-wise. Same muscle memory for IntelliJ shortcuts, copy/paste, window and input switching.

Config lives in `karabiner/` (`karabiner.json` + `assets/`). Snapshot of `~/.config/karabiner/`; re-copy after changing settings in the Karabiner GUI:

```sh
cp ~/.config/karabiner/karabiner.json karabiner/ && cp -R ~/.config/karabiner/assets karabiner/
```

Restore on a new Mac: copy `karabiner/` to `~/.config/karabiner/`.