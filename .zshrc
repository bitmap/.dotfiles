# options
setopt prompt_subst # allow prompt expansion
setopt glob # expand stuff to generate filenames
setopt extendedglob # allow regex globbing
setopt nocaseglob # case-insensitive globbing
setopt autocd # better cd
setopt autopushd # auto add to dir stack
setopt nobeep # shut up
setopt numericglobsort # sort numerically

# history
export HISTFILE="$HOME/.zsh_history"
export HISTFILESIZE=1000000
export HISTSIZE=1000000
setopt inc_append_history # appends every command to history immediately
setopt share_history # share history between all sessions

# autocomplete
autoload -Uz compinit && compinit -i
zstyle ':completion:*' menu yes select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# set zsh config paths
zconfig=$HOME/.config/zsh

# configure zsh function path
zfunc=$zconfig/zfunc
fpath=($zfunc $fpath)

# autoload custom functions
for func in $^zfunc/*(N-.:t); autoload -Uz $func

# source prompt & plugins
. $zconfig/prompt
. $zconfig/plugins

# source aliases
. $HOME/.aliases

# activate mise
if test -f "$HOME/.local/bin/mise"; then
	eval "$($HOME/.local/bin/mise activate zsh)"
fi

# setup fzf keybindings and completion
source <(fzf --zsh)

