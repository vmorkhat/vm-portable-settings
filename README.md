# vm-portable-settings

Repo for declarative system setup.

## Linux laptop

- NixOS `configuration.nix`
- IntelliJ settings
- Bashrc custom commands

### Pack IntelliJ settings

Settings live unpacked in `intellij/`. Pack them into `intellij/settings.zip` from the repo root:

```sh
rm -f intellij/settings.zip && (cd intellij && zip -r settings.zip . -x '*.DS_Store' 'settings.zip')
```

Import in any IntelliJ: **File → Manage IDE Settings → Import Settings…** and pick `intellij/settings.zip`.

## macOS

- Karabiner keymap
