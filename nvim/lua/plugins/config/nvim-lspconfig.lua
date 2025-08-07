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

    -- Configure each LSP server
    for _, lsp in ipairs(servers) do
      if lsp == "ts_ls" and vim.fn.filereadable(deno_json_path) == 0 then
        -- TODO: custom configuration for ts_ls
      end
      vim.lsp.enable(lsp)
    end

    -- Custom linter configuration
    -- local eslint_linter = require("config.linters.eslint")
    -- local shellcheck_linter = require("config.linters.shellcheck")

    -- Set up diagnosticls for custom linters
    -- vim.lsp.config("diagnosticls", {
    --   settings = {
    --     filetypes = {
    --       "javascript",
    --       "javascript.jsx",
    --       "sh",
    --       "typescript",
    --     },
    --     init_options = {
    --       filetypes = {
    --         ["javascript.jsx"] = "eslint",
    --         javascript = "eslint",
    --         javascriptreact = "eslint",
    --         sh = "shellcheck",
    --         typescript = function()
    --           if vim.fn.executable("deno") == 1 then
    --             return "deno"
    --           else
    --             return "eslint"
    --           end
    --         end,
    --         typescriptreact = "eslint",
    --       },
    --       linters = {
    --         eslint = eslint_linter,
    --         shellcheck = shellcheck_linter,
    --       },
    --     },
    --   },
    -- })
  end,
}
