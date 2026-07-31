local get_dir = require("helper").get_project_dir_path_if_exists

return {
  "mistweaverco/jujutsu.nvim",
  dir = get_dir("jujutsu.nvim"),
  opts = {},
  keys = {
    {
      "<leader>aa",
      function()
        require("jujutsu").open()
      end,
      desc = "Jujutsu",
    },
    {
      "<leader>ab",
      function()
        require("jujutsu").annotate()
      end,
      desc = "Blame 🫵",
    },
  },
}
