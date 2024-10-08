source $PLUG/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $PLUG/zsh-autosuggestions.zsh
source $PLUG/command-not-found.plugin.zsh
source $PLUG/sudo.plugin.zsh
source $PLUG/vi-mode.plugin.zsh
source $PLUG/zsh-you-should-use.plugin.zsh
source $PLUG/zsh-history-substring-search.plugin.zsh

fpath=($PLUG/zsh-completions.plugin.zsh)
[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh
