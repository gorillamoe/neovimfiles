return not vim.env.NVIM_AS_SCROLLBACK_PAGER
    and {
      "MagicDuck/grug-far.nvim",
      config = function()
        require("grug-far").setup()
      end,
    }
  or {}
