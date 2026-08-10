return {
  "stevearc/oil.nvim",
  opts = {
    view_options = {
      show_hidden = true,
    },
    float = {
      padding = 2,
      max_width = 0.75,
      max_height = 0.75,
      border = "rounded",
      win_options = {
        winblend = 0,
      },
      preview_split = "below",
    },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
}
