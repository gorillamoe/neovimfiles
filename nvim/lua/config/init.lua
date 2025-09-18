local cmd = vim.cmd
local opt = vim.opt
local g = vim.g

-- Neovim Options
opt.background = "dark"
opt.completeopt = { "menuone", "noinsert", "noselect" } -- Completion options (for deoplete)
opt.expandtab = true -- Use spaces instead of tabs
opt.hidden = true -- Enable background buffers
opt.ignorecase = true -- Ignore case
opt.joinspaces = false -- No double spaces with join
opt.list = true -- Show some invisible characters
opt.number = true -- Show line numbers
opt.relativenumber = false -- Relative line numbers off by default
opt.scrolloff = 4 -- Lines of context
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.sidescrolloff = 8 -- Columns of context
opt.smartcase = true -- Do not ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.wildmode = { "list", "longest" } -- Command-line completion mode
opt.wrap = false -- This option changes how text is displayed
opt.undofile = true -- Save undo history
opt.timeoutlen = 500 -- Time in milliseconds to wait for a mapped sequence to complete.
opt.clipboard = "unnamedplus"
g.vim_markdown_folding_disabled = 1 -- Disable markdown folding

-- Colorscheme
cmd("colorscheme retro-theme")

-- Remap leader key
g.mapleader = ","
-- Remap local leader key
g.maplocalleader = ","
