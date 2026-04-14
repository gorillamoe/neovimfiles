local get_dir_path_if_exists = require("helper").get_dir_path_if_exists

-- Required for the command line to work
require("vim._core.ui2").enable({})

return {
  "mistweaverco/juu.nvim",
  dir = get_dir_path_if_exists("/home/marco/projects/personal/juu.nvim"),
  ---@type JuuUserConfig
  opts = {},
}
