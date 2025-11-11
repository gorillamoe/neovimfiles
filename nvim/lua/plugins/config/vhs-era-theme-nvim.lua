local get_dir_path_if_exists = require("helper").get_dir_path_if_exists

return {
  "mistweaverco/vhs-era-theme.nvim",
  lazy = false,
  priority = 1000,
  dir = get_dir_path_if_exists("/home/marco/projects/personal/vhs-era-theme.nvim"),
  opts = {
    hot_reload = false,
    cache = true,
  },
}
