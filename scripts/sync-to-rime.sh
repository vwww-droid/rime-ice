#!/usr/bin/env bash
set -euo pipefail

SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
RIME_DIR="${RIME_DIR:-$HOME/Library/Rime}"
SQUIRREL_BIN="/Library/Input Methods/Squirrel.app/Contents/MacOS/Squirrel"
DEPLOYER_BIN="/Library/Input Methods/Squirrel.app/Contents/MacOS/rime_deployer"

if [[ ! -d "$RIME_DIR" ]]; then
  echo "Rime directory not found: $RIME_DIR" >&2
  exit 1
fi

rsync -a \
  --delete \
  --exclude '.git/' \
  --exclude '.github/' \
  --exclude 'build/' \
  --exclude 'sync/' \
  --exclude '*.userdb/' \
  --exclude 'installation.yaml' \
  --exclude 'user.yaml' \
  "$SRC_DIR"/ "$RIME_DIR"/

"$DEPLOYER_BIN" --build "$RIME_DIR"
"$SQUIRREL_BIN" --reload

echo "Synced repo to $RIME_DIR and reloaded Squirrel."
