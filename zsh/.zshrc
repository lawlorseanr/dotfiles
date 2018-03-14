export EDITOR=vim
if [[ -d /opt/homebrew/bin ]]; then
  export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
fi
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
[[ -f ~/.aliases.zsh ]] && source ~/.aliases.zsh
[[ -f ~/.functions.zsh ]] && source ~/.functions.zsh
# small git alias tweak
# readme wording
# minor shell cleanup
# minor shell cleanup
# readme wording
# fix typo in comment
# tweak alias
# minor shell cleanup
