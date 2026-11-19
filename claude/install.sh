#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"
target="$HOME/.claude"

mkdir -p "$target/skills"

if [ -f "$target/CLAUDE.md" ] && ! cmp -s CLAUDE.md "$target/CLAUDE.md"; then
  cp "$target/CLAUDE.md" "$target/CLAUDE.md.bak"
  echo "Existing CLAUDE.md saved as $target/CLAUDE.md.bak"
fi

cp CLAUDE.md "$target/CLAUDE.md"
cp -R skills/. "$target/skills/"

echo "Installed CLAUDE.md and skills into $target"
echo "Plugins are installed by hand, see $(pwd)/plugins.md"
