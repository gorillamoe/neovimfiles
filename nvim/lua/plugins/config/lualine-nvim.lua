return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "kyazdani42/nvim-web-devicons",
    "mistweaverco/jujutsu.nvim",
    "mistweaverco/floaterm.nvim",
    "mistweaverco/vhs-era-theme.nvim",
  },
  opts = {
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
      lualine_c = {
        "floaterm",
        "filename",
        {
          "diagnostics",
          sources = { "nvim_diagnostic" },
          sections = { "error", "warn", "info", "hint" },
          colored = true,
          update_in_insert = false,
          always_visible = false,
        },
      },
      lualine_x = {
        "jujutsu",
        "kulala",
        "encoding",
        "fileformat",
        { "filetype", icon_only = true },
      },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  },
}
