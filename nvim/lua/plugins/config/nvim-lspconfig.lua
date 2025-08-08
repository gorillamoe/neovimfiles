return {
  "neovim/nvim-lspconfig",
  config = function()
    -- List of LSP servers to configure
    local servers = {
      "bashls",
      "cssls",
      "denols",
      "dockerls",
      "eslint",
      "gopls",
      "harper_ls",
      "html",
      "intelephense",
      "jsonls",
      "kulala_ls",
      "lua_ls",
      "pyright",
      "rust_analyzer",
      "sqlls",
      "svelte",
      "tailwindcss",
      "terraformls",
      "ts_ls",
      "vimls",
      "yamlls",
    }

    -- Avoid conflict with competing ts_ls and denols
    -- deno.json is not present, use ts_ls instead of denols
    vim.lsp.config("ts_ls", {
      single_file_support = false,
      workspace_required = true,
      root_markers = { "package.json" },
    })
    vim.lsp.config("denols", {
      workspace_required = true,
      root_markers = { "deno.json" },
    })

    -- Configure each LSP server
    for _, lsp in ipairs(servers) do
      vim.lsp.enable(lsp)
    end
  end,
}
