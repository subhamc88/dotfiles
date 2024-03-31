[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/supercharge"
plug "zap-zsh/exa"
plug "zap-zsh/completions"
plug "zap-zsh/fzf"
plug "wintermi/zsh-starship"
autoload -Uz compinit
compinit
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
alias gn="cd /mnt/work/self/notes/ && nvim ."
alias gnc="cd /mnt/work/self/notes/college/ && nvim ."

alias gt="cd /mnt/work/self/todo_list"
