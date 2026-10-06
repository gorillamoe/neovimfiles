return not vim.env.NVIM_AS_SCROLLBACK_PAGER
    and {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      opts = {},
    }
  or {}
