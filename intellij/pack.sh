#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"
rm -f settings.zip
zip -qr settings.zip . -x '*.DS_Store' 'settings.zip' 'pack.sh'
echo "Created $PWD/settings.zip"
