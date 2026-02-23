#!/bin/zsh

# ls - platform-specific handling below
alias lsa="ls -a"
alias ll="ls -lh"
alias lla="ls -lha"
alias l=ll

# file operations
alias rimraf="rm -rf"

# editor
alias v="$EDITOR"
alias vi="$EDITOR"
alias vim="$EDITOR"
alias nvim="$EDITOR"

# tmux
alias tmux="tmux -2 -f '$XDG_CONFIG_HOME/tmux/tmux.conf'"
alias tmuxa='tmux attach || tmux new-session'

# vim-style quit
alias :q="exit"

# fzf with preview
alias ff="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"

# dotfiles
alias dots="dotfiles"

# git aliases
alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gco="git checkout"
alias gcp="git cherry-pick"
alias gd="git diff"
alias gds="git diff --staged"
alias gg="git push"
alias ggf="git push --force-with-lease"
alias gl="git lg"
alias gn="git checkout -b"
alias gp="git pull"
alias gr="git reset HEAD --"
alias grb="git rebase -i"
alias grbc="git rebase --continue"
alias grbs="git rebase --skip"
alias gs="git status"

# npm aliases
alias ni="npm install"
alias nid="npm install --save-dev"
alias nu="npm uninstall"
alias ns="npm start"
alias nt="npm test"
alias nr="npm run"
alias nb="npm run build"
alias nd="npm run dev"
alias nx="npx nx"

# k8s aliases
alias kgp="kubectl get pod"
alias kdp="kubectl delete pod"
alias k8logs="kubectl logs -f"

# python aliases
alias p="python3"
alias python="python3"
alias pip="pip3"

# history
alias hist="history 1"

# refresh zsh
alias zrc="exec zsh"

# macOS-specific aliases
if [[ $(uname) == "Darwin" ]]; then
	# Use GNU coreutils ls if available, otherwise BSD ls
	if gls -d . &>/dev/null 2>&1; then
		alias ls="gls -F --color"
	else
		alias ls="ls -FG"
	fi

	# Flush DNS cache
	alias flushdns="dscacheutil -flushcache"

	# Get local IP address
	alias ip="ipconfig getifaddr en0"

	# Remove quarantine attribute
	alias allow-run="xattr -d com.apple.quarantine"
else
	# Linux and others - use GNU ls
	alias ls="ls -F --color"
fi
