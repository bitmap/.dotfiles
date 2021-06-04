#!/bin/zsh

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until bootstrap has finished
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

print -P "%F{3}\nInstalling Xcode command line tools...%f"
xcode-select --install

print -P "%F{3}\nInstalling Homebrew...%f"
echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

print -P "%F{3}\nInstalling Apps and dev tools via Homebrew...%f"
brew bundle --file $HOME/.dotfiles/macos/Brewfile

print -P "%F{3}\nInstalling asdf...%f"
git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf

echo "%F{3}\nInstalling asdf plugins...%f"
source $HOME/.asdf/asdf.sh
asdf plugin add deno
asdf plugin add golang
asdf plugin add nodejs
asdf plugin add python
asdf plugin add rust

echo "%F{3}\nInstalling dev tools...%f"
asdf install

print -P "%F{3}\nSetting macOS Preferences...%f"
source $HOME/.dotfiles/macos/defaults.sh

print -P "%F{2}\nFinished macOS bootstrap. Please restart.%f"
