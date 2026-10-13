if vim.env.NVIM_AS_SCROLLBACK_PAGER then return {} end

local get_dir = require("helper").get_project_dir_path_if_exists

return {
  "dont-be-evil-company/ducktools.nvim",
  dir = get_dir("ducktools.nvim"),
}
