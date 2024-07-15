export ZSH="$HOME/.config/zsh"

# HIstory
source $ZSH/.zsh_history

# Autostart CLI Apps
fastfetch
# Alias
alias ls="exa -alh --group-directories-first --color=always"

# Theme
eval "$(starship init zsh)"
eval "$(fzf --zsh)"

# Plugins
export PLUG="$ZSH/plugins"

source $PLUG/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $PLUG/zsh-autosuggestions.zsh
source $PLUG/command-not-found.plugin.zsh
source $PLUG/sudo.plugin.zsh
source $PLUG/vi-mode.plugin.zsh
source $PLUG/zsh-you-should-use.plugin.zsh
source $PLUG/zsh-history-substring-search.plugin.zsh
fpath=($PLUG/zsh-completions.plugin.zsh)
[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh
