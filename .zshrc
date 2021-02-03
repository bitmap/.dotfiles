# configure path
typeset -gU path fpath
path=( "/usr/local/opt/coreutils/libexec/gnubin" $path)
fpath=( "$HOME/.config/zsh/funcs" "${fpath[@]}" )

# autoload custom functions
autoload -Uz dotfiles md ip killport pushup extract backup

# options
setopt prompt_subst     # allow prompt expansion
setopt completealiases  # alias completion
setopt extendedglob     # allow regex globbing
setopt nocaseglob       # case-insensitive globbing
setopt autocd           # better cd
setopt autopushd        # auto add to dir stack
setopt nobeep           # shut up
setopt numericglobsort  # sort numerically

# autocomplete
autoload -Uz compinit && compinit
zstyle ':completion:*' menu yes select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# source prompt, aliases, and plugins
. $HOME/.config/zsh/prompt
. $HOME/.config/zsh/aliases
. $HOME/.config/zsh/plugins

# source asdf
. $HOME/.asdf/asdf.sh
