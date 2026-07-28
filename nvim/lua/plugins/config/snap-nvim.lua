local get_dir = require("helper").get_project_dir_path_if_exists

return {
  "mistweaverco/snap.nvim",
  dir = get_dir("snap.nvim"),
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
