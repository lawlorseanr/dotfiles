#!/usr/bin/env bash
DEST="${HOME}/backups"
mkdir -p "$DEST"
tar -czf "$DEST/home-$(date +%Y%m%d).tar.gz" -C "$HOME" .bashrc .vimrc .gitconfig
