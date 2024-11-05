#!/usr/bin/env bash

# TODO: Build a keybinding parser to convert keybindings to zsh or bash format.
# TODO: Buld a shortcut for git.

# Git
# Tmux
tmux_attach_session() {
	local session_name
	session_name=$(tmux ls | grep "$1" | awk '{print $1}' | rev | cut -c 2- | rev | fzf)
	[[ -n $session_name ]] && tmux attach-session -t "$session_name"
}

tmux_rename_session() {
	local old_session_name
	old_session_name=$(tmux ls | grep "$1" | awk '{print $1}' | rev | cut -c 2- | rev | fzf)
	[[ -n $old_session_name ]] && {
		read -r "Enter new session name: " new_session_name
		[[ -n $new_session_name ]] && tmux rename-session -t"$old_session_name" "$new_session_name"
	}
}

# Function to handle tmux mode
my_tmux() {
	echo "Enter Tmux mode"
	echo "a : Tmux attach session"
	echo "r : Tmux rename session"
	read -rsn 1 key

	# Attach Session
	[[ $key = a ]] && {
		echo "Tmux attach"
		read -rsn 1 key
		case "$key" in
		d)
			tmux_attach_session "dev"
			;;
		c)
			tmux_attach_session "conf"
			;;
		*)
			tmux_attach_session ""
			;;
		esac
	}

	# Rename Session
	[[ $key = r ]] && {
		echo "Tmux rename"
		read -rsn 1 key
		case "$key" in
		d)
			tmux_rename_session "dev"
			;;
		c)
			tmux_rename_session "conf"
			;;
		*)
			tmux_rename_session ""
			;;
		esac
	}
}

# Define keybinding for Zsh or Bash
[[ -n "$ZSH_VERSION" ]] && {
	zle -N my_tmux
	bindkey "^T" my_tmux
} || {
	[[ -n "$BASH_VERSION" ]] && bind -x '"\C-t": my_tmux'
}
