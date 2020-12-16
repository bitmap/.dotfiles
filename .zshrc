# source functions
fpath=( "$HOME/.config/zsh/funcs" "${fpath[@]}" )

# autoload custom functions
autoload -Uz dotfiles md ip killport pushup extract backup

# allow prompt expansion
autoload -Uz promptinit && promptinit
setopt prompt_subst

# enable zsh colors
autoload -U colors && colors

# autocompletion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

# alias completeion
setopt COMPLETE_ALIASES

# case-insensitive globbing
setopt NO_CASE_GLOB

# better cd
setopt AUTO_CD
setopt AUTO_PUSHD

# This loads nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# source prompt, aliases, and plugins
source $HOME/.config/zsh/prompt
source $HOME/.config/zsh/aliases
source $HOME/.config/zsh/plugins
