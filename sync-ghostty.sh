#!/usr/bin/env bash
set -euo pipefail

SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${1:-$HOME/.config/ghostty}"

mkdir -p "$TARGET_DIR"

copy_item() {
  local src="$1"
  local name
  name="$(basename "$src")"
  local dst="$TARGET_DIR/$name"

  if [ -L "$dst" ] || [ -f "$dst" ]; then
    rm -f "$dst"
  elif [ -d "$dst" ]; then
    rm -rf "$dst"
  fi

  cp -R "$src" "$dst"
}

shopt -s dotglob nullglob
for item in "$SOURCE_DIR"/*; do
  [ "$(basename "$item")" = "$(basename "${BASH_SOURCE[0]}")" ] && continue
  copy_item "$item"
done

echo "Synced from $SOURCE_DIR to $TARGET_DIR"
