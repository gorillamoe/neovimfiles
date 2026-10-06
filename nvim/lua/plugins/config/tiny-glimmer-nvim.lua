return not vim.env.NVIM_AS_SCROLLBACK_PAGER and {
  "rachartier/tiny-glimmer.nvim",
  event = "VeryLazy",
  opts = {},
} or {}
