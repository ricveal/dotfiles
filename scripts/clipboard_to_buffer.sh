#!/usr/bin/env bash
# Copies clipboard into a shared file so other system can import it
# Usage: clipboard_to_buffer.sh [shared-folder-path]
# If not provided, defaults to ~/shared-clipboard

set -euo pipefail

SHARED_DIR="${1:-$HOME/shared-clipboard}"
OUT_FILE="$SHARED_DIR/clipboard.txt"
TMP_FILE="$OUT_FILE.tmp"

mkdir -p "$SHARED_DIR"

# Read clipboard (supports text; RTF/HTML will be flattened to plain text)
pbpaste >"$TMP_FILE"

# Atomically move into place
mv "$TMP_FILE" "$OUT_FILE"
