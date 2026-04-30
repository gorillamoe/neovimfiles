return {
  "folke/flash.nvim",
  config = function()
    require("flash").setup({
      modes = {
        char = { enabled = false },
      },
    })
  end,
}
