# ~/.zshrc — portable baseline (see ~/dotfiles for source)

export EDITOR=vim
export VISUAL=vim

# Homebrew: Apple Silicon first, then Intel
if [[ -d /opt/homebrew/bin ]]; then
  export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
elif [[ -d /usr/local/bin ]]; then
  export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
fi

# History — shared across terminals, deduplicated
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_VERIFY
setopt HIST_REDUCE_BLANKS

# Small quality-of-life options
setopt AUTO_CD
setopt CORRECT

# Completion
autoload -Uz compinit
compinit

# fzf — optional; skipped if not installed
if command -v fzf >/dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
  export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
  if command -v rg >/dev/null 2>&1; then
    # Ctrl-R with fzf when key-bindings are available
    [[ -f "$(brew --prefix 2>/dev/null)/opt/fzf/shell/key-bindings.zsh" ]] && \
      source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"
  fi
fi

[[ -f ~/.aliases.zsh ]] && source ~/.aliases.zsh
[[ -f ~/.functions.zsh ]] && source ~/.functions.zsh
# tweak alias
# cleanup whitespace
# minor shell cleanup
# minor shell cleanup
# cleanup whitespace
# small git alias tweak
