#!/bin/sh

FALLBACK_MODE=0
FALLBACK_MODE_TAR_ARCHIVE_URL="http://vimlove.com/user/marco/vimfiles.tar.gz"
GITREPOS_DIR=~/git-repos
VIMFILES_DIR=walialu-vimfiles
FULL_PATH=$GITREPOS_DIR/$VIMFILES_DIR

echo "Walialus ViM-files EaZymode Install Script."
echo "==========================================="



echo "Checking if git is installed..."
git --version 2>&1 >/dev/null
GIT_IS_AVAILABLE=$?
if [ $GIT_IS_AVAILABLE -ne 0 ]; then # Git is not available
    echo " >>> Git is not installed!"
    echo " >>> >>> Enabling fallback-mode with wget and a lot of magic..."
    FALLBACK_MODE=1
fi



cd


# Check if Git repo dir already exists
if [ -d $GITREPOS_DIR ]; then
    if [ -d $FULL_PATH ]; then
        echo "$FULL_PATH already exists..."
        echo "Do you want to:"
        echo "(c)hange the directory"
        echo "(r)emove it, or"
        echo "(a)bort the proccess of getting the best vimfiles on earth?"
        read -n1 $USER_INPUT

        if [ $USER_INPUT = a ]; then
            exit
        fi

        if [ $USER_INPUT = r ]; then
            rm -rf $FULL_PATH
        fi

        if [ $USER_INPUT = c ]; then
            echo "Enter a fully qualified path (w/o trailing slash) and press enter"
            read -n $FULL_PATH
        fi
    fi
else
    mkdir $GITREPOS_DIR
fi



cd $GITREPOS_DIR



mkdir $FULL_PATH



cd $FULL_PATH



if [ $FALLBACK_MODE -eq 1 ]; then # Git is not available
    echo "Downloading and extracting unversioned, non-rolling-release archive version as fallback..."
    wget $FALLBACK_MODE_TAR_ARCHIVE_URL
    tar xvf vimfiles.tar.gz
    rm vimfiles.tar.gz
else # Git is available
    echo "Cloning my vimfiles to walialu-vimfiles"
    git clone https://github.com/walialu/vimfiles.git .

    echo "Clonde Vundle"
    git clone https://github.com/gmarik/vundle.git _vim/bundle/vundle
fi



if [ -f ~/.vim ] || [ -d ~/.vim ]; then
    cp ~/.vim ~/_vim-backup-$(date +"%Y-%m-%d--%H-%M-%S")
fi

if [ -f ~/.vimrc ]; then
    cp ~/.vimrc ~/_vimrc-backup-$(date +"%Y-%m-%d--%H-%M-%S")
fi



ln -s $FULL_PATH/_vim ~/.vim
ln -s $FULL_PATH/_vimrc ~/.vimrc



echo "==========================================="
echo "You are now set. Good job, bro!"

if [ $FALLBACK_MODE -eq 1 ]; then # Git is not available
    echo "==========================================="
else # Git is available
    echo "There is just one last thing for us to do..."
    echo "We need to let Vundle take of our bundles now..."
    echo "... just sit back and relax ..."
    echo "==========================================="
    echo "Installing Bundles"
    vim +BundleInstall +qall
fi
