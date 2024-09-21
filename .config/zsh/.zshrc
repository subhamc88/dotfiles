# Evironment Variables
export ZSH="$HOME/.config/zsh"
export EDITOR="/usr/bin/nvim"

# History
source $ZSH/.zsh_history

# Autostart CLI Apps
fastfetch

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

# PyENV
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Alias
alias ls="exa -alh --group-directories-first --color=always"
