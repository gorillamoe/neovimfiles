#!/bin/sh
echo "Quick and dirty setup tool :) I love to be dirty :D"
cd ~
git clone https://github.com/walialu/walialu-vimfiles
ln -s walialu-vimfiles/.vim
ln -s walialu-vimfiles/.vimrc
mkdir .vim/bundle
cd .vim/bundle
git clone https://github.com/gmarik/Vundle.vim
vim "+PluginInstall" "+qall"
