return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    pcall(require("nvim-treesitter.install").update({ with_sync = true }))
  end,
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "bash",
        "css",
        "gitcommit",
        "go",
        "graphql",
        "hcl",
        "http",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "prisma",
        "python",
        "rust",
        "scss",
        "sql",
        "svelte",
        "terraform",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
      },

      highlight = { enable = true },
      indent = { enable = true, disable = { "python" } },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<c-space>",
          node_incremental = "<c-space>",
          scope_incremental = "<c-s>",
          node_decremental = "<c-backspace>",
        },
      },
    })
  end,
}
