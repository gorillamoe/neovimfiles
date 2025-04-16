return {
  "neovim/nvim-lspconfig",
  config = function()
    local nvim_lsp = require("lspconfig")

    local capabilities = vim.lsp.protocol.make_client_capabilities()

    -- List of LSP servers to configure
    local servers = {
      "bashls",
      "cssls",
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

    -- Configure each LSP server
    for _, lsp in ipairs(servers) do
      if nvim_lsp[lsp] ~= nil then
        if nvim_lsp[lsp].setup ~= nil then
          nvim_lsp[lsp].setup({
            capabilities = capabilities,
          })
        else
          vim.notify("LSP server " .. lsp .. " does not have a setup function", vim.log.levels.ERROR)
        end
      end
    end

    -- Custom linter configuration
    local eslint_linter = require("config.linters.eslint")
    local shellcheck_linter = require("config.linters.shellcheck")

    -- Set up diagnosticls for custom linters
    nvim_lsp.diagnosticls.setup({
      filetypes = {
        "javascript",
        "javascript.jsx",
        "sh",
        "typescript",
      },
      init_options = {
        filetypes = {
          ["javascript.jsx"] = "eslint",
          javascript = "eslint",
          javascriptreact = "eslint",
          sh = "shellcheck",
          typescript = "eslint",
          typescriptreact = "eslint",
        },
        linters = {
          eslint = eslint_linter,
          shellcheck = shellcheck_linter,
        },
      },
    })
  end,
}
