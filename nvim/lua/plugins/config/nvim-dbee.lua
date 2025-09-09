return {
  "kndndrj/nvim-dbee",
  build = function()
    require("dbee").install()
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
}
