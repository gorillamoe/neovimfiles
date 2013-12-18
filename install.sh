#!/bin/sh

FALLBACK_MODE=0
FALLBACK_MODE_TAR_ARCHIVE_URL="http://vimlove.com/user/marco/vimfiles.tar.gz"

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
echo "Checking if git is installed..."
git --version 2>&1 >/dev/null
GIT_IS_AVAILABLE=$?
if [ $GIT_IS_AVAILABLE -ne 0 ]; then # Git is not available
    echo " >>> Git is not installed!"
    echo ""
    echo "Enabling fallback-mode with wget and a lot of magic..."
    FALLBACK_MODE=1
fi



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
echo "Creating directory walialu-vimfiles"
mkdir walialu-vimfiles
echo ""

echo ""
echo "CWD to walialu-vimfiles"
cd walialu-vimfiles
echo ""



if [ $FALLBACK_MODE -eq 1 ]; then # Git is not available
    echo ""
    echo "Downloading and extracting unversioned, non-rolling-release archive version as fallback..."
    wget $FALLBACK_MODE_TAR_ARCHIVE_URL
    tar xvf vimfiles.tar.gz
    rm vimfiles.tar.gz
    echo ""
else # Git is available
    echo ""
    echo "Cloning my vimfiles to walialu-vimfiles"
    git clone https://github.com/walialu/vimfiles.git .
    echo ""

    echo ""
    echo "Clonde Vundle"
    git clone https://github.com/gmarik/vundle.git _vim/bundle/vundle
    echo ""
fi



echo ""
echo "Create symlink for ~/.vim"
ln -s ~/git-repos/walialu-vimfiles/_vim ~/.vim
echo ""

echo ""
echo "Create symlink for ~/.vimrc"
ln -s ~/git-repos/walialu-vimfiles/_vimrc ~/.vimrc
echo ""

echo ""
echo "==========================================="
echo "You are now set. Good job, bro!"

if [ $FALLBACK_MODE -eq 1 ]; then # Git is not available
    echo "==========================================="
else # Git is available
    echo "There is just one last thing for us to do..."
    echo "We need to let Vundle take of our bundles now..."
    echo "... just sit back and relax ..."
    echo "==========================================="
    echo ""
    echo ""
    echo "Installing Bundles"
    vim +BundleInstall +qall
fi
