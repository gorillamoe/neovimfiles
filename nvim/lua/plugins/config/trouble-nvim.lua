return not vim.env.NVIM_AS_SCROLLBACK_PAGER
    and {
      "folke/trouble.nvim",
      opts = {},
      cmd = "Trouble",
      dependencies = {
        "kyazdani42/nvim-web-devicons",
      },
    }
  or {}
