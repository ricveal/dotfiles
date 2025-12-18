#!/usr/bin/env bash
# Imports text from shared file into the clipboard

set -euo pipefail

SHARED_DIR="${1:-$HOME/shared-clipboard}"
IN_FILE="$SHARED_DIR/clipboard.txt"

# If file exists and is non-empty, import into VM clipboard
if [[ -s "$IN_FILE" ]]; then
  # Load into clipboard
  pbcopy <"$IN_FILE"

  # Clear the file after import
  : >"$IN_FILE"
fi
