return not vim.env.NVIM_AS_SCROLLBACK_PAGER
    and {
      "ibhagwan/fzf-lua",
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
      opts = function()
        return {
          keymap = {
            fzf = {
              ["ctrl-q"] = "select-all+accept",
            },
          },
        }
      end,
    }
  or {}
