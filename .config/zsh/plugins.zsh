#!/bin/zsh

# Determine plugin directory based on OS
case $(uname) in
	Darwin)
		ZSH_PLUGINS_DIR="$(brew --prefix)/share"
		;;
	Linux)
		ZSH_PLUGINS_DIR="/usr/share"
		;;
	*)
		ZSH_PLUGINS_DIR="$HOME/.local/share"
		;;
esac

# Define plugins to load
ZSH_PLUGINS=(
	"$ZSH_PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
)

# Load plugins
for plugin in "${ZSH_PLUGINS[@]}"; do
	[[ -f "$plugin" ]] && source "$plugin"
done

# Configure syntax highlighting if loaded
if [[ -v ZSH_HIGHLIGHT_STYLES ]]; then
	ZSH_HIGHLIGHT_STYLES[path]=fg=white,none
	ZSH_HIGHLIGHT_STYLES[path_prefix]=fg=white,none
	ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,none
fi
