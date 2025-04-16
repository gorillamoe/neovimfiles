return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/projects/personal/vault",
      },
      {
        name = "work",
        path = "~/projects/work/vault",
      },
    },
  },
}
