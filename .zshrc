# set config paths
zconfig=$HOME/.config/zsh
zfunc=$zconfig/zfunc

# configure fpath
fpath=($zfunc $fpath)

# autoload custom functions
for func in $^zfunc/*(N-.:t); autoload -Uz $func

# source config files
. $zconfig/aliases
. $zconfig/prompt
. $zconfig/plugins

# options
setopt prompt_subst    # allow prompt expansion
setopt completealiases # alias completion
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

# source asdf
[ -f $HOME/.asdf/asdf.sh ] && . $HOME/.asdf/asdf.sh
