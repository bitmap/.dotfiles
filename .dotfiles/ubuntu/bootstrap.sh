# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until bootstrap has finished
while true; do
	sudo -n true
	sleep 60
	kill -0 "$$" || exit
done 2>/dev/null &

# install dev tools
echo "\e[1;36m\nInstalling dev tools...\e[0m"
echo "\e[1;35m\nUpdateing packages...\e[0m"
sudo apt update
echo "\e[1;35m\nInstalling from pkglist...\e[0m"
< "$HOME/.dotfiles/ubuntu/pkglist" xargs sudo apt-get install -y
echo "\e[1;32mDone\e[0m"

# change shell to zsh
echo "\e[1;36m\nSwitching default shell to zsh...\e[0m"
sudo chsh -s $(which zsh)
echo "\e[1;32mDone\e[0m"

# install mise
echo "\e[1;36m\nInstalling mise...\e[0m"
curl https://mise.run | sh
echo "\e[1;35m\nInstalling runtimes...\e[0m"
eval "$(~/.local/bin/mise install)"
echo "\e[1;32mDone\e[0m"

# install rust
echo "\e[1;36m\nInstalling rust...\e[0m"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
echo "\e[1;32mDone\e[0m"
