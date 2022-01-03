# set config paths
zconfig=$HOME/.config/zsh

# source config files
. $zconfig/aliases
. $zconfig/plugins
. $zconfig/prompt

# options
setopt prompt_subst    # allow prompt expansion
setopt glob            # expand stuff to generate filenames
setopt extendedglob    # allow regex globbing
setopt nocaseglob      # case-insensitive globbing
setopt autocd          # better cd
setopt autopushd       # auto add to dir stack
setopt nobeep          # shut up
setopt numericglobsort # sort numerically

# autocomplete
autoload -Uz compinit && compinit -i
zstyle ':completion:*' menu yes select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# configure zsh function path
zfunc=$zconfig/zfunc
fpath=($zfunc $fpath)

# autoload custom functions
for func in $^zfunc/*(N-.:t); autoload -Uz $func

# source asdf
[ -f $HOME/.asdf/asdf.sh ] && . $HOME/.asdf/asdf.sh
