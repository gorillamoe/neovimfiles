return not vim.env.NVIM_AS_SCROLLBACK_PAGER
    and {
      "brenoprata10/nvim-highlight-colors",
      config = function()
        require("nvim-highlight-colors").setup({
          ---Render style
          ---@usage 'background'|'foreground'|'virtual'
          render = "virtual",
          ---Highlight named colors, e.g. 'green'
          enable_named_colors = false,
          ---Highlight tailwind colors, e.g. 'bg-blue-500'
          enable_tailwind = false,
        })
      end,
    }
  or {}
