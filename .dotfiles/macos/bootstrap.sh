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
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

print -P "%F{3}\nInstalling Apps and dev tools via Homebrew...%f"
brew bundle --file $HOME/.dotfiles/macos/Brewfile

echo "%F{3}\nInstalling asdf plugins...%f"
. $(brew --prefix asdf)/libexec/asdf.sh
asdf plugin add deno
asdf plugin add golang
asdf plugin add nodejs
asdf plugin add python
asdf plugin add ruby
asdf plugin add solidity

echo "%F{3}\nInstalling dev tools via asdf...%f"
asdf install

echo "%F{3}\nInstalling rustc...%f"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

print -P "%F{3}\nSetting macOS Preferences...%f"
source $HOME/.dotfiles/macos/defaults.sh

print -P "%F{2}\nFinished macOS bootstrap. Please restart.%f"
