#!/bin/sh
printf "
 +-------------------------------------------------+
 |                                                 |
 |         Quick and dirty Vim Setup Tool          |
 |                                                 |
 |=================================================|
 |                                                 |
 |          Copyright (c) 2012, 2013, 2014         |
 |                                                 |
 |                Twitter                          |
 |              +-------------+                    |
 |              |             |                    |
 |          M E @ W A L I A L U . C O M            |
 |                |                   |            |
 |                +-------------------+            |
 |                   Web                           |
 |                                                 |
 +-------------------------------------------------+

"
cd ~
git clone https://github.com/walialu/walialu-vimfiles
ln -s walialu-vimfiles/.vim
ln -s walialu-vimfiles/.vimrc
mkdir .vim/bundle
cd .vim/bundle
git clone https://github.com/gmarik/Vundle.vim
vim "+PluginInstall" "+qall"
