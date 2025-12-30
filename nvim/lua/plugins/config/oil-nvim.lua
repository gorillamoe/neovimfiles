return {
  "stevearc/oil.nvim",
  opts = {},
  dependencies = {
    "kyazdani42/nvim-web-devicons",
  },
  config = function()
    require("oil").setup({
      view_options = {
        show_hidden = true,
      },
      float = {
        max_width = 0.5,
        max_height = 0.5,
        border = "rounded",
        win_options = {
          winblend = 50,
        },
      },
    })
  end,
}
