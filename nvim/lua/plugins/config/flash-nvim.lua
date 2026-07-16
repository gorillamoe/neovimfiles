return {
  "folke/flash.nvim",
  keys = {
    {
      "r", -- The GOAT - remote ops
      mode = { "o" },
      function()
        require("flash").remote()
      end,
      desc = "Flash",
    },
  },
  config = function()
    require("flash").setup({
      modes = {
        char = { enabled = false },
      },
    })
  end,
}
