Neovim Configuration Files
==========================

![](icon.png)

These are my Neovim configuration files.

## Install instructions

Make sure you have at least `wget`, `awk` and `git` installed, if you happen to be
bold and try the quick and dirty install.

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
mkdir -p ~/Code/$(whoami)/neovimfiles && cd "$_"
```

Clone this repository

```bash
git clone https://git.superevilmegaco.com/marco/neovimfiles .
```

Symlink `~/.config/nvim` (or `~\\AppData\\Local\\nvim\\` for WindowsTM) to
where you cloned my `neomvimfiles` (`~/Code/$(whoami)/neovimfiles` ?).

```bash
ln -s ~/Code/$(whoami)/neovimfiles/nvim ~/.config
```

Install all other (Neo)vim packages (plugins).

#### Neovim

```bash
nvim +PlugInstall +UpdateRemotePlugins
```

## Generate helptags

```
:call plug#helptags()
```

and check via

```
:help Screenshot
```



[NeovimWebsite]: https://neovim.io/
[WgetWebsite]: https://www.gnu.org/software/wget/
[GitWebsite]: https://git-scm.com/
[ruby]: https://www.ruby-lang.org/
[python2]: https://www.python.org/
[python3]: https://www.python.org/
[nodejs]: https://nodejs.org/en/

