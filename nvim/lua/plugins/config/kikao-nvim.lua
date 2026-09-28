local get_dir = require("helper").get_project_dir_path_if_exists

return {
  "dont-be-evil-company/kikao.nvim",
  lazy = false,
  opts = {},
  dir = get_dir("kikao.nvim"),
}
