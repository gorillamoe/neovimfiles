if vim.env.NVIM_AS_SCROLLBACK_PAGER then
  return {}
end

local get_dir = require("helper").get_project_dir_path_if_exists

-- Required for the command line to work
require("vim._core.ui2").enable({})

return {
  "dont-be-evil-company/juu.nvim",
  dir = get_dir("juu.nvim"),
  opts = {},
}
