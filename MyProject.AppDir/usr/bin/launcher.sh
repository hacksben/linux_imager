#!/usr/bin/env bash
set -euo pipefail

echo "[INFO] Linux Imager launcher"
exec "$(dirname "$0")/../main.sh" "$@"
