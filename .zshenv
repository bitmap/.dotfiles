#!/bin/zsh

# XDG directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# PATH
export PATH="$HOME/bin:$PATH"

# History
export HISTFILE="$XDG_CACHE_HOME/zsh_history"
export HISTFILESIZE=1000000
export HISTSIZE=1000000

# ZSH
export ZLE_RPROMPT_INDENT=0

# Editor
if hash nvim 2>/dev/null; then
	export EDITOR="nvim"
	export MANPAGER='nvim +Man!'
elif hash vim 2>/dev/null; then
	export EDITOR="vim"
else
	export EDITOR="vi"
fi

export VISUAL=$EDITOR

# Pager
export PAGER="less"
export LESS='-RFXn'
export LESS_TERMCAP_mb=$'\E[1;31m'
export LESS_TERMCAP_md=$'\E[1;36m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_us=$'\E[1;32m'
export LESS_TERMCAP_ue=$'\E[0m'

# Homebrew
export HOMEBREW_CLEANUP_MAX_AGE_DAYS=60
export HOMEBREW_NO_EMOJI=1
export HOMEBREW_NO_GITHUB_API=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
