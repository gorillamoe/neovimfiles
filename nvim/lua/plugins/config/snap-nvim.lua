local get_dir_path_if_exists = require("helper").get_dir_path_if_exists

return {
  "mistweaverco/snap.nvim",
  version = "v1.5.0",
  dir = get_dir_path_if_exists("/home/marco/projects/personal/snap.nvim"),
  cmd = "Snap",
  event = "VeryLazy",
  ---@type SnapUserConfig
  opts = {
    template = "linux",
    development_mode = {
      backend = "bun",
    },
    log_level = "debug",
    filename_pattern = "snap",
    save_to_disk = {
      image = false,
    },
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
