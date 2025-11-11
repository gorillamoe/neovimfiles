local get_dir_path_if_exists = require("helper").get_dir_path_if_exists

return {
  "mistweaverco/kulala.nvim",
  dir = get_dir_path_if_exists("/home/marco/projects/personal/kulala.nvim"),
  opts = {
    request_timeout = nil,
    ui = {
      win_opts = {
        wo = { foldmethod = "manual" },
      },
    },
  },
}
