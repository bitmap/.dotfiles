#!/usr/bin/env zsh

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until bootstrap has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

print -P "%F{3}\nInstalling Xcode command line tools...%f"
xcode-select --install

print -P "%F{3}\nInstalling Homebrew...%f"
echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

print -P "%F{3}\nInstalling Apps and dev tools via Homebrew...%f"
brew bundle --file $HOME/.macos/Brewfile

print -P "%F{3}\nInstalling NVM...%f"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash

print -P "%F{3}\nInstalling Rust...%f"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

print -P "%F{3}\nSetting macOS Preferences...%f"
source $HOME/.macos/defaults.sh

print -P "%F{2}\nFinished macOS bootstrap. Please restart.%f"
