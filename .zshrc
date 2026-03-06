# Source config files
source "$HOME/.config/zsh/options.zsh"
source "$HOME/.config/zsh/plugins.zsh"
source "$HOME/.config/zsh/aliases.zsh"
source "$HOME/.config/zsh/prompt.zsh"

# Load functions directory
fpath=("$HOME/.config/zsh/functions" $fpath)
autoload -Uz $HOME/.config/zsh/functions/*(N.:t)

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
