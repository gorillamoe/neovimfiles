return {
  "nvim-mini/mini.files",
  opts = {
    mappings = {
      synchronize = "<CR>",
    },
  },
  keys = {
    {
      "-",
      function()
        local buf_dir = vim.fn.expand("%:p:h")
        require("mini.files").open(buf_dir)
      end,
      desc = "Bafa",
    },
  },
}
