#!/usr/bin/env bash
# Check that expected and optional tools are available.
set -euo pipefail

ok()   { printf '  \033[32mok\033[0m   %s\n' "$1"; }
warn() { printf '  \033[33mwarn\033[0m %s\n' "$1"; }
fail() { printf '  \033[31mmiss\033[0m %s\n' "$1"; }

check() {
  local label="$1" cmd="$2" required="${3:-0}"
  if command -v "$cmd" >/dev/null 2>&1; then
    ok "$label"
  elif [[ "$required" -eq 1 ]]; then
    fail "$label (required)"
    return 1
  else
    warn "$label (optional)"
  fi
}

echo "dotfiles doctor"
echo

missing=0
check "zsh"  zsh  1 || missing=1
check "git"  git  1 || missing=1
check "vim"  vim  1 || missing=1
check "tmux" tmux 0
check "rg"   rg   0
check "fzf"  fzf  0

echo
if [[ -f "$HOME/.gitconfig.local" ]]; then
  ok "~/.gitconfig.local"
else
  warn "~/.gitconfig.local — copy from git/gitconfig.local.example"
fi

if [[ -L "$HOME/.zshrc" ]]; then
  ok "~/.zshrc is symlinked"
else
  warn "~/.zshrc not symlinked — run ./install.sh"
fi

echo
if [[ $missing -eq 0 ]]; then
  echo "required tools present."
else
  echo "install missing required tools and re-run."
  exit 1
fi
