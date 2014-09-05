Vimfiles
=========

These are my vimfiles.

They consist of my *.vimrc* and my *.vim* directory.

Install instructions
----------------------
Make sure you have at least *wget* and *git* installed, if you happen to be
bold and try the quick and dirty install.

### Really quick and dirty install

I would recommend that you only do this on a freshly installed system,
or if you really know what you are doing; otherwise it could screw up all of
your vim configuration :)

    wget --no-check-certificate -qO- https://raw.github.com/walialu/vimfiles/master/dirtyinstall.sh | sh

### Manual installation

Make sure you are in your home (~) directory.

    cd

Clone this repository

    git clone https://github.com/walialu/vimfiles

Symlink `.vim` directory and `.vimrc` file.

    ln -s vimfiles/.vim && ln -s vimfiles/.vimrc

Create a directory for all Vim plugins

    mkdir .vim/bundle

Clone **Vundle.vim**, which is my plugin manager of choice

    git clone https://github.com/gmarik/Vundle.vim .vim/bundle/Vundle.vim

Install all other plugins

    vim "+PluginInstall" "+qall"

License agreement:
------------------
Don't do any harm to animals!
Love your wife and your children!
Don't drink and drive!
