---@brief
--- https://github.com/hashicorp/terraform-ls

---@type vim.lsp.Config
return {
  cmd = { "terraform-ls", "serve" },
  filetypes = { "terraform", "terraform-vars" },
  root_markers = { ".terraform", ".git" },
  capabilities = {
    experimental = {
      showReferencesCommandId = "client.showReferences",
    },
  },
  on_attach = function(_, bufnr)
    vim.lsp.codelens.enable(false, { bufnr = bufnr })
  end,
}
