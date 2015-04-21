#!/bin/sh
cd ~
mkdir -p devel/walialu
git clone https://github.com/babbafresh/vimfiles devel/babbafresh/vimfiles
ln -s devel/babbafresh/vimfiles/.vim
ln -s devel/babbafresh/vimfiles/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim "+PlugInstall" "+qall"
# Hopefully this will fix the weird broken terminal
printf "\ec" #\e is ESC in bash
echo -en "\ec" #thanks @Jonathon Reinhart.
