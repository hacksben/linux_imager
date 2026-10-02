#!/usr/bin/env bash
set -euo pipefail

APPDIR="${1:-MyProject.AppDir}"
APPIMAGE_TOOL="${APPIMAGE_TOOL:-./appimagetool-x86_64.AppImage}"

if [ ! -f "$APPIMAGE_TOOL" ]; then
  echo "[ERROR] AppImage tool not found: $APPIMAGE_TOOL"
  exit 1
fi

if [ ! -d "$APPDIR" ]; then
  echo "[ERROR] AppDir not found: $APPDIR"
  exit 1
fi

chmod +x "$APPDIR/AppRun"
chmod +x "$APPDIR/main.sh"

"$APPIMAGE_TOOL" "$APPDIR"
