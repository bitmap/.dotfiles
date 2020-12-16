source "$HOME/.cargo/env"

typeset -U PATH path

path=(
  "$HOME/go/bin"
  "$path[@]"
)

export PATH
