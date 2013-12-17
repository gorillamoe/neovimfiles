#!/bin/sh

echo "Walialus ViM-files EaZymode Install Script."
echo "==========================================="
echo ""
echo ""
echo ""
echo ""
echo "Terminology"
echo "-------------------------------------------"
echo "CWD: Change Working Directory to"
echo ""
echo ""

echo ""
echo "CWD to ~/"
cd
echo ""

echo ""
echo "Creating directory git-repos"
mkdir git-repos
echo ""

echo ""
echo "CWD to git-repos"
cd git-repos
echo ""

echo ""
echo "Cloning my vimfiles to walialu-vimfiles"
git clone https://github.com/walialu/vimfiles.git walialu-vimfiles
echo ""

echo ""
echo "CWD to walialu-vimfiles"
cd walialu-vimfiles
echo ""

echo ""
echo "Clonde Vundle"
git clone https://github.com/gmarik/vundle.git _vim/bundle/vundle
echo ""

echo ""
echo "Create symlink for ~/.vim"
ln -s ~/git-repos/walialu-vimfiles/_vim ~/.vim
echo ""

echo ""
echo "Create symlink for ~/.vimrc"
ln -s ~/git-repos/walialu-vimfiles/_vimrc ~/.vimrc
echo ""

echo ""
echo "Installing Bundles"
vim +BundleInstall +qall
echo ""
echo ""
echo "==========================================="
echo "You are now set. Good job, bro!"
echo "==========================================="
