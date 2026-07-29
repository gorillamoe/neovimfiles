local utils = require("lspconfig.util")
local lsp_config_names = utils.get_lsp_config_names()

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    for _, lsp_config_name in ipairs(lsp_config_names) do
      vim.lsp.enable(lsp_config_name)
    end
    vim.lsp.inlay_hint.enable(false)
  end,
})
