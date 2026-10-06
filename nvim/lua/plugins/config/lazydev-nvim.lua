return not vim.env.NVIM_AS_SCROLLBACK_PAGER
    and {
      "folke/lazydev.nvim",
      opts = function(_, opts)
        opts.library = opts.library or {}
        vim.list_extend(opts.library, {
          { path = "luassert-types/library", words = { "assert" } },
          { path = "busted-types/library", words = { "describe" } },
        })
      end,
      dependencies = {
        { "LuaCATS/luassert", name = "luassert-types", lazy = true },
        { "LuaCATS/busted", name = "busted-types", lazy = true },
      },
    }
  or {}
