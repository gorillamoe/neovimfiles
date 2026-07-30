local get_dir = require("helper").get_project_dir_path_if_exists

return {
  "mistweaverco/bafa.nvim",
  dir = get_dir("bafa.nvim"),
  keys = {
    {
      "<leader>,,",
      function()
        require("bafa.ui").toggle()
      end,
      desc = "Bafa",
    },
  },
}
