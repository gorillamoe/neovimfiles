VIMfiles
=========

This are my vimfiles.

They consist of my *.vimrc* and my *.vim* directory.

Install instructions
----------------------
Make sure you have at least *wget* installed. You are better be off with *wget*
and *git*.


The default behaviour (quick install):

- Creates a dir `~/git-repos` (if not already there)
- Fetches my vimfiles and puts it in `~/git-repos/walialu-vimfiles`
- Removes existing `~/.vimrc` and `~/.vim`
- Symlinks ~/.vim and ~/.vimrc to my vimfiles

### Really quick and dirty install

I would recommend that you only do this on a freshly installed system,
or if you really know what you are doing; otherwise it could screw up all of
your vim configuration :)

    wget --no-check-certificate -qO- https://raw.github.com/walialu/walialu-vimfiles/master/install-dirty.sh | sh


### Quick install:

    wget --no-check-certificate -qO- https://raw.github.com/walialu/walialu-vimfiles/master/install.sh | sh

### No hero mode:

    wget --no-check-certificate -O /tmp/walialu-vimfiles-installer.sh https://raw.github.com/walialu/walialu-vimfiles/master/install.sh && sh /tmp/walialu-vimfiles-installer.sh --no-hero


The difference is that the latter one will ask you about conflicting stuff and
let you decide what to do. It is pretty fail-safe and does stuff like this:

- If the default install dir exists
    - Asks if you want to delete, rename or cancel
- if a `.vimrc` file exists, creates a backup (with timestamp appendix)
- If a `.vim` dir exists, creates a backup (with timestamp appendix)


License agreement:
------------------
Don't do any harm to animals!
Love your wife and your children!
Don't drink and drive!
