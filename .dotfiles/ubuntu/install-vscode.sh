# vscode install script for ubuntu

# install deps
sudo apt install software-properties-common apt-transport-https -y

# add key for apt repo
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

# add the repo to apt sources
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" -y

# install vscode package
sudo apt install code -y