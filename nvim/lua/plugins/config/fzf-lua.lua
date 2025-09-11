return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    keymap = {
      fzf = {
        ["ctrl-q"] = "select-all+accept",
      },
    },
  },
}
