return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "kyazdani42/nvim-web-devicons",
  },
  config = function()
    local icon = require("vhs-era-theme.icons")

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
        lualine_c = require("jujutsu.lualine").append({ "floaterm", "filename", diagnostics }),
        lualine_x = {
          "kulala",
          "encoding",
          "fileformat",
          filetype,
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}
