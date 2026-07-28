return {
  "MeanderingProgrammer/render-markdown.nvim",
  lazy = true,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  ft = { "markdown", "kulala_ui" },
  opts = {
    heading = {
      width = "block",
      left_pad = 2,
      right_pad = 2,
    },
    code = {
      width = "block",
      left_pad = 2,
      right_pad = 2,
    },
  },
}
