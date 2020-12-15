(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

source $HOME/.zsh_aliases
source $HOME/.zsh_prompt

# case-insensitive globbing
setopt NO_CASE_GLOB

# automatic cd
setopt AUTO_CD

# autocorrect
setopt CORRECT
setopt CORRECT_ALL

# enable zsh colors
autoload -U colors && colors

# autocompletion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
## partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix
## case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
## alias completeion
setopt COMPLETE_ALIASES

# This loads nvm
export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# plugins
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# path
export PATH=$HOME/bin:$HOME/go/bin:$HOME/.cargo/bin:$PATH
