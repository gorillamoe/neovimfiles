return {
  "folke/flash.nvim",
  keys = {
    {
      "s",
      mode = { "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
    {
      "r",
      mode = "o",
      function()
        require("flash").remote()
      end,
      desc = "Remote Flash",
    },
  },
  opts = {
    modes = {
      char = { enabled = false },
    },
  },
}
