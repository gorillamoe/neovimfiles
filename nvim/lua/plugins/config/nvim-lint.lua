-- In order to resolve the special path `SCRIPTDIR` in shellcheck's
-- `source-path` directive it is necessary to pass the source as a filename
-- rather than to stdin. To still be able to lint unnamed buffers we specify
-- `stdin = true` and `-` as the filename as fallback. This works because
-- shellcheck ignores stdin input when there are filenames in the argument
-- list. This workaround could be removed when/if shellcheck implements
-- --stdin-filename, see https://github.com/koalaman/shellcheck/issues/2735.
local function filename_or_stdin()
  local bufname = vim.api.nvim_buf_get_name(0)
  local file = vim.fn.fnameescape(vim.fn.fnamemodify(bufname, ":p"))
  if vim.bo.buftype == "" and vim.fn.filereadable(file) == 1 then
    return file
  end
  return "-"
end

return {
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require("lint")

    -- patch shellcheck to also follow sourced files
    lint.linters.shellcheck.args = {
      "-x",
      "--format",
      "json1",
      filename_or_stdin,
    }

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
