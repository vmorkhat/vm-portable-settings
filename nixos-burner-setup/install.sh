#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"
target=/etc/nixos/configuration.nix

if [ -f "$target" ] && ! cmp -s configuration.nix "$target"; then
  sudo cp "$target" "$target.bak"
  echo "Existing configuration saved as $target.bak"
fi

sudo cp configuration.nix "$target"
sudo nixos-rebuild switch
