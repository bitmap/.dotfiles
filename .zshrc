# Source config files
source "$XDG_CONFIG_HOME/zsh/options.zsh"
source "$XDG_CONFIG_HOME/zsh/plugins.zsh"
source "$XDG_CONFIG_HOME/zsh/aliases.zsh"
source "$XDG_CONFIG_HOME/zsh/prompt.zsh"

# Load functions directory
fpath=("$XDG_CONFIG_HOME/zsh/functions" $fpath)
autoload -Uz $XDG_CONFIG_HOME/zsh/functions/*(N.:t)

# Activate mise
if test -f "$HOME/.local/bin/mise"; then
	eval "$($HOME/.local/bin/mise activate zsh)"
fi

# Setup fzf keybindings and completion
if hash fzf 2>/dev/null; then
	source <(fzf --zsh)
fi

# Load local zshrc file
if [[ -e "$HOME/.zshrc_local" ]]; then
	source "$HOME/.zshrc_local"
fi
