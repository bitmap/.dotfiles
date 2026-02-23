#!/bin/zsh

# zsh options
setopt prompt_subst # allow prompt expansion
setopt extendedglob # allow regex globbing
setopt nocaseglob # case-insensitive globbing
setopt autocd # cd to directory by typing its name
setopt autopushd # auto add to dir stack
setopt nobeep # shut up
setopt numericglobsort # sort numerically
setopt inc_append_history # appends every command to history immediately
setopt share_history # share history between all sessions

# ls colors - remove bold from directories
# GNU ls (gls)
export LS_COLORS="di=34:ln=36:so=35:pi=33:ex=32:bd=34:cd=34:su=31:sg=31:tw=34:ow=34"
# BSD ls (macOS default)
export LSCOLORS="exfxcxdxbxegedabagacad"

# autocomplete
autoload -Uz compinit && compinit -i
zstyle ':completion:*' menu yes select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
