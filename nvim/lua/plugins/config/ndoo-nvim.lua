local get_dir_path_if_exists = require("helper").get_dir_path_if_exists

return {
  "mistweaverco/ndoo.nvim",
  dependencies = {
    "ibhagwan/fzf-lua",
  },
  dir = get_dir_path_if_exists("/home/marco/projects/personal/ndoo.nvim"),
}
