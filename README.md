# Neovim Configuration Files #
These are my Neovim configuration files.

They consist of my *nvim* directory and a *sophisticated* *wink*
[update script][update.bash].

## Install instructions ##
Make sure you have at least `wget`, `awk` and `git` installed, if you happen to be
bold and try the quick and dirty install.

## Prerequisites

- [Neovim][NeovimWebsite]
- [wget][WgetWebsite]
- [git][GitWebsite]
- [awk][AwkWebsite]

### Really quick and dirty install

I would recommend that you only do this on a freshly installed system,
or if you really know what you are doing; otherwise it could screw up all of
your vim configuration :)

```bash
wget --no-check-certificate -qO- https://raw.github.com/walialu/neovimfiles/master/update.bash | bash
```

### Manual installation

Create directory structure

```bash
mkdir -p "$HOME/Code/$USER/neovimfiles" && cd "$_"
```

Clone this repository

```bash
git clone https://github.com/walialu/neovimfiles .
```

Symlink `$HOME/.config/nvim` (or `~\AppData\Local\nvim\` for WindowsTM) to
where you cloned my `neomvimfiles` (`$HOME/Code/$USER/neovimfiles` ?).

```bash
ln -s $HOME/Code/$USER/neovimfiles/nvim $HOME/.config
```

Install all other (Neo)vim packages (plugins).

```bash
./update.bash
```

## Update Script (`update.bash`)

There is a update script included, which can be used as follows:

```bash
# install and/or update all plugins
./update.bash

# add package https://github.com/tpope/vim-rails to opt plugins
./update.bash add "tpope/vim-rails" "opt"

# add package https://github.com/tpope/vim-sensible to start plugins
./update.bash add "tpope/vim-sensible" "start"

# remove package https://github.com/tpope/vim-rails from opt plugins
./update.bash rm "tpope/vim-rails" "opt"

# list initialized packages (vim plugins)
./update.bash ls
# or
./update.bash list

# list all packages (vim plugins)
./update.bash lsa
# or
./update.bash listall
```

# License agreement #
Don't do any harm to animals!
Love your wife and your children!
Don't drink and drive!

[NeovimWebsite]: https://neovim.io/
[AwkWebsite]: https://www.gnu.org/software/gawk/manual/gawk.html
[WgetWebsite]: https://www.gnu.org/software/wget/
[GitWebsite]: https://git-scm.com/
[update.bash]: #update-script-updatebash
