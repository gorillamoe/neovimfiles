return not vim.env.NVIM_AS_SCROLLBACK_PAGER and {
  "nanozuki/tabby.nvim",
  ---@type TabbyConfig
  opts = {},
} or {}
