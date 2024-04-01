export ZSH="$HOME/.config/zsh"

# HIstory
source $ZSH/.zsh_history

# plugins
export PLUG="$ZSH/plugins"
source $PLUG/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $PLUG/zsh-autosuggestions/zsh-autosuggestions.zsh
fpath=($PLUG/zsh-completions/zsh-completions.plugin.zsh)
# Alias
alias ls="exa -alh --group-directories-first --color=always"

alias gho="cd ~"
alias g.c="cd ~/.config"
alias g.l="cd ~/.local"
alias gd="cd ~/Downloads"
alias gD="cd ~/Documents"
alias gr="cd ~/repos"

alias ga="cd /mnt/work/academics/"
alias gaf="cd /mnt/work/academics/freshers/"
alias gA="cd /mnt/work/archive/"
alias gs="cd /mnt/work/self/"
alias gn="cd /mnt/work/self/notes/"
alias gnc="cd /mnt/work/self/notes/college/"

alias gt="cd /mnt/work/self/todo_list"

# Theme
eval "$(starship init zsh)"
