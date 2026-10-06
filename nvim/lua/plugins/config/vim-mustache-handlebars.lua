return not vim.env.NVIM_AS_SCROLLBACK_PAGER
    and {
      "mustache/vim-mustache-handlebars",
      ft = { "mustache", "handlebars", "hbs" },
    }
  or {}
