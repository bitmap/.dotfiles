# source config files
source "$XDG_CONFIG_HOME/zsh/env"
source "$XDG_CONFIG_HOME/zsh/options"
source "$XDG_CONFIG_HOME/zsh/plugins"
source "$XDG_CONFIG_HOME/zsh/aliases"
source "$XDG_CONFIG_HOME/zsh/prompt"

# activate mise
if test -f "$HOME/.local/bin/mise"; then
	eval "$($HOME/.local/bin/mise activate zsh)"
fi

# setup fzf keybindings and completion
if hash fzf 2>/dev/null; then
	source <(fzf --zsh)
fi

# load local zshrc file
if [[ -e "$HOME/.zshrc_local" ]]; then
	source "$HOME/.zshrc_local"
fi
