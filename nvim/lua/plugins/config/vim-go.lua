return not vim.env.NVIM_AS_SCROLLBACK_PAGER
    and {
      "fatih/vim-go",
      ft = { "go", "gomod" },
      build = ":GoUpdateBinaries",
    }
  or {}
