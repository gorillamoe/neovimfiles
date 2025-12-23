local get_dir_path_if_exists = require("helper").get_dir_path_if_exists

return {
  "mistweaverco/snap.nvim",
  version = "v1.0.0",
  dir = get_dir_path_if_exists("/home/marco/projects/personal/snap.nvim"),
  ---@type SnapUserConfig
  opts = {
    template = "linux",
    debug = {
      backend = "bun",
      log_level = "debug",
    },
    filename_pattern = "snap",
    font_settings = {
      size = 14,
      line_height = 1.0,
      fonts = {
        default = {
          name = "FiraCode Nerd Font",
          file = nil,
        },
        bold = {
          name = "VictorMono Nerd Font",
          file = nil,
        },
        italic = {
          name = "VictorMono Nerd Font",
          file = nil,
        },
        bold_italic = {
          name = "VictorMono Nerd Font",
          file = nil,
        },
      },
    },
  },
}
