local get_dir = require("helper").get_project_dir_path_if_exists

return {
  "mistweaverco/diffconflicts.nvim",
  dir = get_dir("diffconflicts.nvim"),
  opts = {
    keymaps = {
      next_diff = "<leader>dn",
      prev_diff = "<leader>dp",
      accept = "<leader>da",
    },
  },
}
