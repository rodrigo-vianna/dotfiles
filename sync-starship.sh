#!/usr/bin/env bash
set -euo pipefail

SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_FILE="$SOURCE_DIR/starship.toml"
TARGET_DIR="${1:-$HOME/.config}"
TARGET_FILE="$TARGET_DIR/starship.toml"

mkdir -p "$TARGET_DIR"

if [ -L "$TARGET_FILE" ] || [ -f "$TARGET_FILE" ]; then
  rm -f "$TARGET_FILE"
fi

ln -s "$SOURCE_FILE" "$TARGET_FILE"

echo "Linked $SOURCE_FILE -> $TARGET_FILE"
