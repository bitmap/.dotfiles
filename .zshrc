# configure path
typeset -gU path fpath
path=("/usr/local/opt/coreutils/libexec/gnubin" $path)
fpath=("$HOME/.config/zsh" "${fpath[@]}")

# autoload custom functions
autoload -Uz dotfiles aliases prompt plugins md ip killport pushup extract backup

# set config and remove func definition
prompt  && unset -f prompt
aliases && unset -f aliases
plugins && unset -f plugins

# options
setopt prompt_subst    # allow prompt expansion
setopt completealiases # alias completion
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

# variables
export EDITOR=$(which vim)
export PAGER=$(which less)

# colored man
export LESS='-RFXn'
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
