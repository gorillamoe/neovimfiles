-- disable default virtual text diagnostics and
-- use tiny-inline-diagnostic.nvim instead
vim.diagnostic.config({ virtual_text = false })
return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      show_source = {
        enabled = true,
      },
      multilines = {
        enabled = true,
      },
      add_messages = false,
    },
  },
}
