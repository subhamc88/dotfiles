# Evironment Variables
export ZSH="$HOME/.config/zsh"
export EDITOR="/usr/bin/nvim"
export PLUG="$ZSH/subhamc88/plugins"
export CORE="$ZSH/subhamc88/core"
export PYENV_ROOT="$HOME/.pyenv"

# History
source $ZSH/.zsh_history

# Autostart CLI Apps
fastfetch

# Theme
eval "$(starship init zsh)"
eval "$(fzf --zsh)"

# Plugins
source $PLUG/init.zsh

# PyENV
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Go
export PATH=$PATH:$(go env GOPATH)/bin

# pnpm
export PNPM_HOME="/home/subhamc88/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Alias
alias ls="exa -alh --group-directories-first --color=always"
