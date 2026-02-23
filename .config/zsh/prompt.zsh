#!/bin/zsh

precmd() {
	# print a newline before the prompt unless it's the first prompt in the process.
	if [[ -z $newline_before_prompt ]]; then
		newline_before_prompt=1
	elif [[ $newline_before_prompt -eq 1 ]]; then
		echo ''
	fi

	# set tab title to current dir
	print -Pn "\e]0;%1~\a"

	# lazy load git_status function only when in a git repo
	if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
		# load the function on first git repo encounter
		if ! typeset -f git_status >/dev/null; then
			source "${ZDOTDIR:-$HOME}/.config/zsh/git-status.zsh"
		fi
		git_status
	else
		export GIT_STATUSLINE=""
	fi
}

preexec() {
	# set tab title to current dir and process
	print -Pn "\e]0;%1~ ($1)\a"
}

# prompt
PROMPT=$'%F{4}%~%1(j. (%j).)%f${GIT_STATUSLINE}%f\n%0(?..%F{1})> %f'
