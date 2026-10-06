return not vim.env.NVIM_AS_SCROLLBACK_PAGER
    and {
      "rachartier/tiny-code-action.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "ibhagwan/fzf-lua",
      },
      event = "LspAttach",
      opts = {
        picker = "select",
        backend = "vim",
      },
    }
  or {}
