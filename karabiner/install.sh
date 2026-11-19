#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"
target="$HOME/.config/karabiner"

mkdir -p "$target/assets"

if [ -f "$target/karabiner.json" ] && ! cmp -s karabiner.json "$target/karabiner.json"; then
  cp "$target/karabiner.json" "$target/karabiner.json.bak"
  echo "Existing karabiner.json saved as $target/karabiner.json.bak"
fi

cp karabiner.json "$target/karabiner.json"
cp -R assets/. "$target/assets/"

echo "Installed Karabiner config into $target"
