export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

source "$HOME/.cargo/env"

typeset -U PATH path

path=(
  "$HOME/go/bin"
  "$path[@]"
)

export PATH
