<div align="center">

![logo][logo]

# Gorilla Moe's Neovim configuration files

[![Made with love][badge-made-with-love]][contributors]

[List of Terms](#terms-used-in-this-readme) •
[Install](#install) •
[Features](#features) •
[Language servers and treesitter](#language-servers-and-treesitter)

<p></p>

You probably guessed it already,
but these are my personal Neovim configuration files.

<p></p>

</div>

## Terms used in this README

- Version Control System (VCS)
  A system that tracks changes to files over time.
  Examples include Git, Jujutsu, Mercurial, and Subversion.
- Representational State Transfer (REST)
- Language Server Protocol (LSP)
- Treesitter: A syntax parser and highlighter
- Greatest Of All Time (GOAT)
- In My Opinion (IMO)
- In My Humble Opinion (IMHO)
- Video Home System (VHS)
  Pretty much obsolete technology for storing and playing video cassettes.
  Mainly used in the 80s and 90s.


## Install

There are some **prerequisites** you need to have installed.

- Neovim 0.11.5+ (tested, might work on older versions, but not guaranteed)
- Node.js 22+ (for most LSP servers)

```sh
mkdir -p ~/projects/personal
git clone https://github.com/gorillamoe/neovimfiles ~/projects/personal/neovimfiles
ln -s ~/projects/personal/neovimfiles ~/.config/nvim
```

I use [zana] to [manage most of my LSP servers][my-zana].

You should use whatever floats your boat.
Zana works great for me, but your mileage may vary.

2. Open Neovim.

You should see a _"Installing lazy.nvim.."_ and
popup installing the plugins on the first run


## Features

This isn't an exhaustive list of all the plugins I use,
but these are some of the main ones:

- [lazy.nvim] to manage my plugins.
  Until someone invents a better plugin manager (I doubt it),
  this is what I'll use.
- [which-key.nvim] - Available keybindings in a beautiful popup.
  Just blissful.
- [trouble.nvim] - A pretty diagnostics list.
- [time-machine.nvim] - View local history for a file.
  Inspired by GitHub's file history view.
  Lets you easily browse and restore previous versions of a file.
- [kulala.nvim] as a REST/GraphQL/Websocket/gRPC API client inside Neovim.
  It's a great way to test APIs without leaving Neovim.
  It even comes with a built-in LSP server and
  supports most of the features from JetBrains' HTTP Client.
- [snap.nvim] - Beautiful screenshots, that use your theme's colors.
  Take screenshots of code snippets directly from Neovim,
  with syntax highlighting and your color scheme.
  It also supports html output which works in most email clients.
  I was using [codesnap.nvim] before, but since v2 broke
  compatibility with my setup, I built snap.nvim as a replacement.
- [kikao.nvim] - Session persistence that gets out of your way.
  This mimics the way most IDEs handle project sessions.
  When you open Neovim in a project folder (if it detects a VCS folder),
  it'll automatically restore your last session for that project.
  Also makes it easy for other plugins to persist data per *project*.
- [vhs-era] as color scheme.
  VHS Era is a dark, vibrant, and retro-futuristic color scheme
  inspired by the aesthetics of the 1980s and early 1990s.
- **LSP and Syntax**:
  - [nvim-lspconfig] to configure LSP servers.
    It's comes with sensible defaults and is easy to use.
  - [nvim-treesitter] for syntax parsing and highlighting.
    Can't live without it.
- [fzf-lua] as fuzzy finder.
  The best fuzzy finder out there, IMO.
- [lualine.nvim] as status line.
  I love myself a good status line.
- [nvim-cmp] as completion plugin.
  Simply the GOAT of completion plugins for Neovim.
- **File and buffer management**:
  - [bafa.nvim] - Buffer management, easy 🦥 and uncomplicated.
    List buffers, close buffers, switch buffers, reorder buffers.
    Supports auto-sorting buffers by most recently used.
  - [oil.nvim] as file manager.
    Lightweight and minimal.
    Use it mostly for quick file operations (moving, renaming, deleting).
  - [nvim-tree.lua] as file explorer (barely used).
    (nice to have, if you're new to a project and want to quickly browse files)
- **Git integration**:
  - [gitsigns.nvim] for git signs in gutter.
  - [blame.nvim] to know who to blame 😏
  - [neogit] as git client.
  - [diffview.nvim] to view git diffs.
  - [diffconflicts.nvim] to resolve merge conflicts.
  - [ndoo.nvim] to interact with GitHub, GitLab, and Bitbucket.
    Fetches issues and pull/merge requests.
    Also supports opening files at a given line, hash or branch
    (opens in your default browser).
- **Comments**:
  - [todo-comments.nvim] as todo comments highlighter.
  - [ts-comments.nvim] to enhance native comments.

## Language servers and treesitter

I have [some][supported-treesitter-languages] languages configured
for treesitter that I use regularly.

I [also use][supported-lsp-servers] some LSP servers for
languages I use regularly.

I also have the TypeScript preview LSP server configured,
which works great for JavaScript and TypeScript projects, IMHO.



[diffview.nvim]: https://github.com/sindrets/diffview.nvim
[diffconflicts.nvim]: https://github.com/mistweaverco/diffconflicts.nvim
[which-key.nvim]: https://github.com/folke/which-key.nvim
[trouble.nvim]: https://github.com/folke/trouble.nvim
[time-machine.nvim]: https://github.com/y3owk1n/time-machine.nvim
[codesnap.nvim]: https://github.com/mistricky/codesnap.nvim
[kulala.nvim]: https://github.com/mistweaverco/kulala.nvim
[snap.nvim]: https://github.com/mistweaverco/snap.nvim
[kikao.nvim]: https://github.com/mistweaverco/kikao.nvim
[bafa.nvim]: https://github.com/mistweaverco/bafa.nvim
[my-zana]: https://github.com/gorillamoe/dotfiles/blob/6e481d42d86237870c9ce9ce35ed0ec7a4f393c4/configurations/zana/zana/zana-lock.json
[zana]: https://getzana.net
[contributors]: https://github.com/gorillamoe/neovimfiles/graphs/contributors
[logo]: assets/logo.svg
[badge-made-with-love]: assets/badge-made-with-love.svg
[lazy.nvim]: https://github.com/folke/lazy.nvim
[nvim-lspconfig]: https://github.com/neovim/nvim-lspconfig
[nvim-treesitter]: https://github.com/nvim-treesitter/nvim-treesitter
[fzf-lua]: https://github.com/ibhagwan/fzf-lua
[lualine.nvim]: https://github.com/nvim-lualine/lualine.nvim
[vhs-era]: https://github.com/mistweaverco/vhs-era-theme.nvim
[nvim-cmp]: https://github.com/hrsh7th/nvim-cmp
[nvim-tree.lua]: https://github.com/nvim-tree/nvim-tree.lua
[oil.nvim]: https://github.com/stevearc/oil.nvim
[gitsigns.nvim]: https://github.com/lewis6991/gitsigns.nvim
[neogit]: https://github.com/NeogitOrg/neogit
[ndoo.nvim]: https://github.com/mistweaverco/ndoo.nvim
[todo-comments.nvim]: https://github.com/folke/todo-comments.nvim
[ts-comments.nvim]: https://github.com/folke/ts-comments.nvim
[supported-treesitter-languages]: https://github.com/gorillamoe/neovimfiles/blob/0abf5be81a3f20cfe6461a0a684a98ce41cefb75/nvim/lua/plugins/config/nvim-treesitter.lua?plain=1#L9
[supported-lsp-servers]: https://github.com/gorillamoe/neovimfiles/blob/0abf5be81a3f20cfe6461a0a684a98ce41cefb75/nvim/lua/plugins/config/nvim-lspconfig.lua?plain=1#L6
[typescript-preview-lsp]: https://github.com/gorillamoe/neovimfiles/blob/0abf5be81a3f20cfe6461a0a684a98ce41cefb75/nvim/lsp/tsgo.lua?plain=1#L10
