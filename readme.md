VIMfiles
=========

This are my vimfiles.

They consist of my *.vimrc* and my *.vim* directory.

Install instructions
----------------------
Make sure you have git installed.

    cd && mkdir git-repos && cd git-repos && git clone https://github.com/walialu/vimfiles.git walialu-vimfiles && cd vimfiles && chmod +x firstrun.sh && sh firstrun.sh

The above script will change the current working directory to your home folder
and create a folder *git-repos* then change to that directory and clone my
vimfiles. Then it changes the working directory again to the previously cloned
vimfiles and executes the firstrun.sh shell script.

The firstrun.sh script clones Vundle as my prefered ViM package management tool
and creates the following symlinks:

- ~/.vim -> ~/git-repos/\_vim
- ~/.vimrc -> ~/git-repos/\_vimrc

All said and done.
