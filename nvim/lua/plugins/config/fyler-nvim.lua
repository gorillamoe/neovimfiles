return {
  "FylerOrg/fyler.nvim",
  lazy = true,
  keys = {
    {
      "-",
      function()
        require("fyler").open()
      end,
      mode = "n",
      desc = "Open parent directory",
    },
  },
  opts = {
    kind = "floating",
    integrations = {
      icon = "nvim_web_devicons",
    },
    ui = {
      hidden_items = {
        switches = {},
      },
    },
  },
  dependencies = {
    "kyazdani42/nvim-web-devicons",
  },
}
