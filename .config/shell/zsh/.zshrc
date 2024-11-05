# Environment Variables
export ZSH=$HOME/.config/shell/zsh
export EDITOR="/usr/bin/nvim"
export PYENV_ROOT="$HOME/.pyenv"
export SDL_GAMECONTROLLERCONFIG="06000000596f6b650000000000000000,xbox-controller,platform:Linux,a:b0,b:b1,x:b3,y:b2,back:b8,guide:b10,start:b9,leftshoulder:b4,rightshoulder:b5,leftx:a0,lefty:a1,rightx:a2,righty:a3,lefttrigger:b6,righttrigger:b7,"

# History
# Commented out the line that was causing issues
source $ZSH/.zsh_history

# Plugins
source $ZSH/plugins/init.zsh
source $HOME/.config/shell/core/init.sh

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

# Theme
eval "$(starship init zsh)"
eval "$(fzf --zsh)"
