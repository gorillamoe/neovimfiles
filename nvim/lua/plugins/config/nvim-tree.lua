return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "kyazdani42/nvim-web-devicons",
  },
  keys = { { "<leader>e", ":NvimTreeToggle<CR>", desc = "File tree" } },
  opts = {
    sort_by = "case_sensitive",
    view = {
      width = {},
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
    },
  },
}
