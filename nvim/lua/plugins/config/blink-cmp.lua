return {
  "saghen/blink.cmp",

  build = "cargo build --release",
  version = "*",

  dependencies = {
    {
      "Kaiser-Yang/blink-cmp-git",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
  },

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- See the full "keymap" documentation for information on defining your own keymap.
    --
    keymap = {
      preset = "default",
      ["<CR>"] = { "select_and_accept", "fallback" },
    },
    cmdline = {
      keymap = {
        preset = "default",
      },
    },
    completion = {
      menu = {
        border = "rounded",
        draw = { gap = 2 },
      },
      -- Show documentation when selecting a completion item
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 250,
      },
    },

    appearance = {
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = "mono",
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = {
        "lsp",
        "path",
        "buffer",
        "git",
      },
      providers = {
        git = {
          enabled = function()
            -- enable for gitcommit, gitrebase,
            return vim.tbl_contains({ "gitcommit" }, vim.bo.filetype)
          end,
          module = "blink-cmp-git",
          name = "Git",
          opts = {},
        },
      },
    },
  },
}
