#!/usr/bin/env bash
# Symlink dotfiles into $HOME. Backs up existing real files first.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
DRY_RUN=0
BACKUP_DIR=""

usage() {
  cat <<'EOF'
Usage: ./install.sh [OPTIONS]

Symlink dotfiles from this repo into your home directory.

Options:
  --dry-run    Print actions without changing anything
  --help       Show this message

Existing regular files (not symlinks) are moved to ~/.dotfiles-backup-<timestamp>/
before being replaced. Your git identity belongs in ~/.gitconfig.local — see
git/gitconfig.local.example.
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run) DRY_RUN=1; shift ;;
    --help|-h) usage; exit 0 ;;
    *) echo "unknown option: $1" >&2; usage; exit 1 ;;
  esac
done

backup_if_needed() {
  local dest="$1"
  if [[ -e "$dest" && ! -L "$dest" ]]; then
    if [[ -z "$BACKUP_DIR" ]]; then
      BACKUP_DIR="${HOME}/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"
      if [[ $DRY_RUN -eq 1 ]]; then
        echo "mkdir -p $BACKUP_DIR"
      else
        mkdir -p "$BACKUP_DIR"
        echo "backing up replaced files to $BACKUP_DIR"
      fi
    fi
    if [[ $DRY_RUN -eq 1 ]]; then
      echo "mv $dest $BACKUP_DIR/"
    else
      mv "$dest" "$BACKUP_DIR/"
    fi
  fi
}

link() {
  local src="$1" dest="$2"
  backup_if_needed "$dest"
  if [[ $DRY_RUN -eq 1 ]]; then
    echo "ln -sf $src $dest"
  else
    ln -sf "$src" "$dest"
    echo "linked $dest"
  fi
}

seed_gitconfig_local() {
  local dest="${HOME}/.gitconfig.local"
  local example="${ROOT}/git/gitconfig.local.example"
  if [[ ! -f "$dest" ]]; then
    if [[ $DRY_RUN -eq 1 ]]; then
      echo "cp $example $dest"
    else
      cp "$example" "$dest"
      echo "created $dest — edit your name and email"
    fi
  fi
}

if [[ $DRY_RUN -eq 1 ]]; then
  echo "dry-run: no changes will be made"
  echo
fi

link "$ROOT/zsh/.zshrc"              "$HOME/.zshrc"
link "$ROOT/zsh/aliases.zsh"         "$HOME/.aliases.zsh"
link "$ROOT/zsh/functions.zsh"       "$HOME/.functions.zsh"
link "$ROOT/git/.gitconfig"          "$HOME/.gitconfig"
link "$ROOT/git/.gitignore_global"   "$HOME/.gitignore_global"
link "$ROOT/vim/.vimrc"              "$HOME/.vimrc"
link "$ROOT/tmux/.tmux.conf"         "$HOME/.tmux.conf"

seed_gitconfig_local

echo
echo "done."
if [[ $DRY_RUN -eq 0 ]]; then
  echo "next: edit ~/.gitconfig.local, then run: exec zsh"
fi
