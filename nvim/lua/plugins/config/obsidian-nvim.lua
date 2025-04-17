return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    completion = {
      nvim_cmp = false,
      blink = true,
    },
    ui = {
      enable = false,
    },
    workspaces = {
      {
        name = "personal",
        path = "~/projects/personal/vault",
      },
      {
        name = "work",
        path = "~/projects/work/vault",
      },
      {
        name = "no-vault",
        path = function()
          return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
        end,
        overrides = {
          notes_subdir = vim.NIL,
          new_notes_location = "current_dir",
          templates = {
            folder = vim.NIL,
          },
          disable_frontmatter = true,
        },
      },
    },
  },
}
