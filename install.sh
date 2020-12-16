#!/usr/bin/env bash

if [ -d $HOME/.dotfiles ]; then
  echo "$HOME/.dotfiles directory already exists" && exit 1
fi

dotfiles() {
  /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

touch $HOME/.hushlogin

git clone --separate-git-dir=$HOME/.dotfiles https://github.com/bitmap/dotfiles.git .tmpdotfiles
rsync --recursive --verbose --exclude={'.git','README','install.sh'} .tmpdotfiles/ $HOME/
rm -r .tmpdotfiles

dotfiles update-index --assume-unchanged README
dotfiles update-index --assume-unchanged install.sh
