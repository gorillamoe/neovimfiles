local function nvpm_bootstrapper()
  local data = vim.env.NVPM_HOME
  if not data or data == "" then
    data = vim.fs.joinpath(vim.env.HOME, ".local", "share", "nvpm")
  end
  local roots = {
    vim.fs.joinpath(data, "plugins", "github", "mistweaverco_nvpm.nvim"),
    vim.fs.joinpath(data, "packages", "github", "mistweaverco_nvpm.nvim"),
  }
  local bootstrap
  for _, root in ipairs(roots) do
    local path = vim.fs.joinpath(root, "lua", "nvpm", "bootstrap.lua")
    bootstrap = loadfile(path)
    if bootstrap then
      break
    end
  end
  if not bootstrap then
    error("nvpm.nvim is not installed; run: nvpm add --plugin neovim github:mistweaverco/nvpm.nvim", 0)
  end
  return bootstrap()
end

-- Configure plugins
nvpm_bootstrapper().setup({
  -- Tabby
  -- A highly configurable tab-line plugin.
  require("plugins.config.tabby-nvim"),
  -- `floaterm.nvim` A minimal Neovim plugin that provides a single floating terminal.
  require("plugins.config.floaterm-nvim"),
  -- Zen mode
  -- A distraction-free coding mode for Neovim
  require("plugins.config.zen-mode-nvim"),
  -- A tiny Neovim plugin that adds subtle animations to
  -- various operations.
  require("plugins.config.tiny-glimmer-nvim"),
  -- `Juu.nvim` 🦄 - beautiful UI inputs and notifications
  require("plugins.config.juu-nvim"),
  -- Visualize and work with indent scope
  require("plugins.config.mini-indentscope"),
  -- Mustache and Handlebars support
  require("plugins.config.vim-mustache-handlebars"),
  -- Autocompletion
  require("plugins.config.blink-cmp"),
  -- Code Analysis
  -- Supercharge my Rust 🦀 experience
  require("plugins.config.rustaceanvim"),
  -- Code Actions (based on LSP)
  require("plugins.config.tiny-code-action-nvim"),
  -- Show inline diagnostics
  require("plugins.config.tiny-inline-diagnostic-nvim"),
  -- Show LSP diagnostics
  require("plugins.config.trouble-nvim"),
  -- Navigate code on steroids with `flash.nvim` ⚡
  require("plugins.config.flash-nvim"),
  -- Navigate windows on steroids
  require("plugins.config.nvim-window"),
  -- This is 🔥 GitHub copilot
  require("plugins.config.copilot-vim"),
  -- Simple HTTP Client 🐼
  require("plugins.config.kulala-nvim"),
  -- Minimal session management
  require("plugins.config.kikao-nvim"),
  -- Key-bindings
  require("plugins.config.which-key-nvim"),
  -- Formatters 💄 and Linters 🧹
  require("plugins.config.conform-nvim"),
  require("plugins.config.nvim-lint"),
  -- `Jujutsu` - a fast, featureful VCS for the command line
  require("plugins.config.jujutsu-nvim"),
  -- Git Integration
  require("plugins.config.diffconflicts-nvim"),
  -- `bafa.nvim`, Buffer management on steroids 💊
  require("plugins.config.bafa-nvim"),
  -- Trailing whitespace highlighting & automatic fixing
  require("plugins.config.vim-better-whitespace"),
  -- `FZF`
  require("plugins.config.fzf-lua"),
  --Emoji via `fzf-lua`
  require("plugins.config.fzf-symbols"),
  -- Terraform 🌍
  require("plugins.config.vim-terraform"),
  -- Flex on Discord
  require("plugins.config.discord-nvim"),
  -- Color-scheme
  require("plugins.config.vhs-era-theme-nvim"),
  -- Color highlighting
  require("plugins.config.nvim-highlight-colors"),
  -- Comments
  require("plugins.config.todo-comments-nvim"),
  require("plugins.config.ts-comments-nvim"),
  -- File explorer
  require("plugins.config.nvim-tree"),
  -- Coconut oil 🥥 for Neovim
  require("plugins.config.oil-nvim"),
  -- Fancy Markdown rendering
  require("plugins.config.render-markdown-nvim"),
  -- Customized 🌈 vim status line
  require("plugins.config.lualine-nvim"),
  -- Repeat
  require("plugins.config.vim-repeat"),
  -- Easily surround stuff
  require("plugins.config.vim-surround"),
  -- Add Golang support
  require("plugins.config.vim-go"),
  -- Search on steroids with `ripgrep` and `fzf`
  require("plugins.config.grug-far-nvim"),
  -- Neovim `DAP` (Debug Adapter Protocol)
  require("plugins.config.nvim-dap"),
  -- Minimal screenshot 📸 plugin for Neovim
  require("plugins.config.snap-nvim"),
})
