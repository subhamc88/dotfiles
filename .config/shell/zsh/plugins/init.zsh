export ZSHPLUG=$ZSH/plugins

source $ZSHPLUG/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSHPLUG/zsh-autosuggestions.zsh
source $ZSHPLUG/command-not-found.plugin.zsh
source $ZSHPLUG/sudo.plugin.zsh
source $ZSHPLUG/vi-mode.plugin.zsh
source $ZSHPLUG/zsh-you-should-use.plugin.zsh
source $ZSHPLUG/zsh-history-substring-search.plugin.zsh

fpath=($ZSHPLUG/zsh-completions.plugin.zsh)
[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh
