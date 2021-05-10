# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ll='ls -lah'
alias la='ls -A'

# Git — complements gitconfig aliases
alias gs='git status -sb'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git log --oneline -15'

# Prefer ripgrep when available (falls back to system grep otherwise)
if command -v rg >/dev/null 2>&1; then
  alias grep='rg'
fi

# macOS Finder
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
