local get_dir = require("helper").get_project_dir_path_if_exists

return not vim.env.NVIM_AS_SCROLLBACK_PAGER
    and {
      "dont-be-evil-company/kikao.nvim",
      lazy = false,
      opts = {},
      dir = get_dir("kikao.nvim"),
    }
  or {}
