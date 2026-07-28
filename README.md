<div align="center">

![logo][logo]

# Gorilla Moe's Neovim Configuration Files

[![Made with love][badge-made-with-love]][contributors]

[List of Terms](#terms-used-in-this-readme) •
[Install](#install) •
[Features](#features) •
[Language servers and Tree-sitter](#language-servers-and-treesitter)

<p></p>

You probably guessed it already,
but these are my personal Neovim configuration files.

<p></p>

</div>

## Install

There are some **prerequisites** you need to have installed.

- Neovim 0.12.4+ (tested, might work on older versions, but not guaranteed)

### Clone This Repository

Clone this repository to your local machine:

```sh
mkdir -p ~/projects/personal
git clone https://github.com/gorillamoe/neovimfiles ~/Projects/personal/neovimfiles
```

### Symlink the Configuration

I use [dotfiles.app] to [symlink all my dotfiles][my-dotfiles-app],
but you can just run this command manually:

```sh
ln -s ~/Projects/personal/neovimfiles ~/.config/nvim
```

### Install External Dependencies

[nvpm.nvim] + [nvpm.dev] to manage my plugins, linters, formatters, LSPs and Tree-sitter parsers (and queries).

You should use whatever floats your boat.
nvpm works great for me, but your mileage may vary.

### Plugins

See my [nvpm-lock.json] for a complete list of plugins I use.

[my-dotfiles-app]: https://github.com/gorillamoe/dotfiles/blob/main/shazam.yml?plain=1#L1
[dotfiles.app]: https://github.com/mistweaverco/dotfiles.app
[contributors]: https://github.com/gorillamoe/neovimfiles/graphs/contributors
[logo]: assets/logo.svg
[badge-made-with-love]: assets/badge-made-with-love.svg
[nvpm.nvim]: https://github.com/mistweaverco/nvpm.nvim
[nvpm.dev]: https://github.com/mistweaverco/nvpm-client
[nvpm-lock.json]: https://github.com/gorillamoe/dotfiles/blob/main/configurations/nvpm/nvpm/nvpm-lock.json
