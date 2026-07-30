local get_dir = require("helper").get_project_dir_path_if_exists

return {
  "mistweaverco/floaterm.nvim",
  dir = get_dir("floaterm.nvim"),
  opts = {},
  keys = {
    {
      "<leader>t",
      function()
        require("floatterm").toggle()
      end,
      desc = "floaterm",
    },
  },
}
