return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "kyazdani42/nvim-web-devicons",
  },
  config = function()
    local icon = require("retro-theme.icons")

    local filetype = { "filetype", icon_only = true }

    local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn", "info", "hint" },
      symbols = {
        error = icon.diagnostics.BoldError .. " ",
        hint = icon.diagnostics.BoldHint .. " ",
        info = icon.diagnostics.BoldInformation .. " ",
        warn = icon.diagnostics.BoldWarning .. " ",
      },
      colored = true,
      update_in_insert = false,
      always_visible = false,
    }

    local diff = {
      "diff",
      source = function()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
          return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
          }
        end
      end,
      symbols = {
        added = icon.git.LineAdded .. " ",
        modified = icon.git.LineModified .. " ",
        removed = icon.git.LineRemoved .. " ",
      },
      colored = true,
      always_visible = false,
    }

    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "auto",
        globalstatus = true,
        component_separators = {
          left = "",
          right = "",
        },
        section_separators = {
          left = "",
          right = "",
        },
        disabled_filetypes = { statusline = { "lazy" } },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {},
        lualine_c = { "filename", diff, diagnostics, "kulala" },
        lualine_x = { "branch", "encoding", "fileformat", filetype },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}
