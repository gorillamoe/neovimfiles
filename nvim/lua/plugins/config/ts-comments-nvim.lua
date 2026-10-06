return not vim.env.NVIM_AS_SCROLLBACK_PAGER and {
  "folke/ts-comments.nvim",
  event = "VeryLazy",
  opts = {},
} or {}
