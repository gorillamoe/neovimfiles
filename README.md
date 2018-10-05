Neovim Configuration Files
==========================

![](icon.png)

These are my Neovim configuration files.

## Install instructions

Make sure you have at least `wget`, `awk` and `git` installed, if you happen to be
bold and try the quick and dirty install.

## Generate helptags

```
:call plug#helptags()
```

and check via

```
:help Screenshot
```

## Prerequisites

- [Neovim][NeovimWebsite]
- [git][GitWebsite]
- [ruby][ruby]
- [nodejs][nodejs]
- [python2][python2]
- [python3][python3]

### Really quick and dirty install

I would recommend that you only do this on a freshly installed system,
or if you really know what you are doing; otherwise it could screw up all of
your vim configuration :)

```bash
wget --no-check-certificate -qO- https://git.superevilmegaco.com/marco/neovimfiles/raw/master/install.bash | bash
```

### Manual installation

Create directory structure

```bash
mkdir -p "$HOME/Code/$USER/neovimfiles" && cd "$_"
```

Clone this repository

```bash
git clone git@git.superevilmegaco.com:marco/neovimfiles.git .
```

Symlink `$HOME/.config/nvim` (or `~\\AppData\\Local\\nvim\\` for WindowsTM) to
where you cloned my `neomvimfiles` (`$HOME/Code/$USER/neovimfiles` ?).

```bash
ln -s $HOME/Code/$USER/neovimfiles/nvim $HOME/.config
```

Install all other (Neo)vim packages (plugins).

#### Neovim

```bash
nvim +PlugInstall
```

#### Vim

```bash
vim +PlugInstall
```

# License agreement #
Don't do any harm to animals!
Love your wife and your children!
Don't drink and drive!



[NeovimWebsite]: https://neovim.io/
[WgetWebsite]: https://www.gnu.org/software/wget/
[GitWebsite]: https://git-scm.com/
[ruby]: https://www.ruby-lang.org/
[python2]: https://www.python.org/
[python3]: https://www.python.org/
[nodejs]: https://nodejs.org/en/

