# source functions
fpath=( ~/.zsh_funcs "${fpath[@]}" )

# source aliases and prompt
source $HOME/.zsh_aliases
source $HOME/.zsh_prompt

# autoload functions
autoload -Uz dotfiles md ip killport pushup extract backup

# enable zsh colors
autoload -U colors && colors

# case-insensitive globbing
setopt NO_CASE_GLOB

# automatic cd
setopt AUTO_CD

## alias completeion
setopt COMPLETE_ALIASES

# autocompletion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
## partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix
## case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# This loads nvm
export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# plugins
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
