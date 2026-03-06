# PATH
export PATH="$HOME/bin:$PATH"

# History
export SAVEHIST=100000
export HISTSIZE=100000

# ZSH
export ZLE_RPROMPT_INDENT=0

# Editor
export EDITOR=nvim
export VISUAL=$EDITOR

# Pager
export MANPAGER='nvim +Man!'
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
