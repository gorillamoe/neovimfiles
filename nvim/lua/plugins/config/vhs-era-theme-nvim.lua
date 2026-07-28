local get_dir = require("helper").get_project_dir_path_if_exists

return {
  "mistweaverco/vhs-era-theme.nvim",
  event = "VeryLazy",
  priority = 1000,
  dir = get_dir("vhs-era-theme.nvim"),
  opts = {
    hot_reload = false,
    cache = true,
  },
}
