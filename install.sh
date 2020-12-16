#!/usr/bin/env bash

git clone --separate-git-dir=$HOME/.dotfiles https://github.com/bitmap/dotfiles.git .tmpdotfiles
rsync --recursive --verbose --exclude={'.git','README','install.sh'} .tmpdotfiles/ $HOME/
rm -r .tmpdotfiles
