local get_dir = require("helper").get_project_dir_path_if_exists

return not vim.env.NVIM_AS_SCROLLBACK_PAGER
    and {
      "dont-be-evil-company/diffconflicts.nvim",
      dir = get_dir("diffconflicts.nvim"),
      opts = {
        keymaps = {
          next_diff = "<leader>dn",
          prev_diff = "<leader>dp",
          accept = "<leader>da",
        },
      },
    }
  or {}
