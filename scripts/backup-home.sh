#!/usr/bin/env bash
# Tar selected config dirs. Edit DEST and paths for your machine.
set -euo pipefail

DEST="${HOME}/backups"
STAMP="$(date +%Y%m%d-%H%M%S)"
ARCHIVE="${DEST}/home-config-${STAMP}.tar.gz"

mkdir -p "$DEST"
tar -czf "$ARCHIVE" \
  -C "$HOME" \
  .zshrc .gitconfig .vimrc .tmux.conf \
  2>/dev/null || true

echo "wrote $ARCHIVE"
