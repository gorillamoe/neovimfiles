#!/bin/sh
cd ~
mkdir -p Code/walialu
git clone https://github.com/walialu/vimfiles Code/walialu/vimfiles
ln -s Code/walialu/vimfiles/.vim
ln -s Code/walialu/vimfiles/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim "+PlugInstall" "+qall"
# Hopefully this will fix the weird broken terminal
printf "\ec" #\e is ESC in bash
echo -en "\ec" #thanks @Jonathon Reinhart.
