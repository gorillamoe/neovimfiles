return {
  "folke/zen-mode.nvim",
  opts = {
    backdrop = 1,
  },
  keys = {
    {
      "<leader>z",
      function()
        require("zen-mode").toggle()
      end,
      desc = "Bafa",
    },
  },
}
