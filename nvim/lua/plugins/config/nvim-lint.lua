return {
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      javascript = {
        "eslint",
      },
      lua = {
        "luacheck",
      },
      markdown = {
        "vale",
      },
      php = {
        "phpcs",
      },
      python = {
        "pylint",
      },
      sh = {
        "shellcheck",
      },
      typescript = {
        "eslint",
      },
      typescriptreact = {
        "eslint",
      },
      yaml = {
        "yamllint",
      },
    }
    local js_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function(args)
        local filetype = vim.api.nvim_get_option_value("filetype", { buf = args.buf })
        local names_override = nil
        if vim.tbl_contains(js_filetypes, filetype) then
          if require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")(args.buf) then
            names_override = { "deno" }
          end
        end
        lint.try_lint(names_override)
        -- diagnostics are handled by tiny-inline-diagnostics
        vim.diagnostic.config({ virtual_text = false })
      end,
    })
  end,
}
