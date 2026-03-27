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

--- A function to check for available formatters
--- @param formatters table A list of formatter definitions
--- @return string[] available_formatters list of available formatter names or an empty list if none are available
--- @usage
--- local available = return_formatters_if_available({ "prettier", "oxlint", "eslint" })
local return_formatters_if_available = function(formatters)
  local available_formatters = {}
  for _, formatter in pairs(formatters) do
    if type(formatter) == "string" then
      if vim.fn.executable(formatter) == 1 then
        table.insert(available_formatters, formatter)
      end
    elseif type(formatter) == "table" and formatter.cmd and vim.fn.executable(formatter.cmd) == 1 then
      table.insert(available_formatters, formatter.name)
      print("Formatter " .. formatter.name .. " is available")
    end
  end
  if #available_formatters == 0 then
    return {}
  end
  return available_formatters
end

return {
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require("lint")

    if vim.fn.executable("oxlint") == 1 and vim.fn.executable("vp") == 1 then
      lint.linters.oxlint.cmd = "vp"
      lint.linters.oxlint.args = vim.list_extend({ "lint" }, lint.linters.oxlint.args)
    end

    -- patch shellcheck to also follow sourced files
    lint.linters.shellcheck.args = {
      "-x",
      "--format",
      "json1",
      filename_or_stdin,
    }

    lint.linters_by_ft = {
      javascript = return_formatters_if_available({
        "oxlint",
        "eslint",
      }),
      lua = return_formatters_if_available({
        "luacheck",
      }),
      markdown = return_formatters_if_available({
        "vale",
      }),
      php = return_formatters_if_available({
        "phpcs",
      }),
      python = return_formatters_if_available({
        "pylint",
      }),
      sh = return_formatters_if_available({
        "shellcheck",
      }),
      typescript = return_formatters_if_available({
        "oxlint",
        "eslint",
      }),
      typescriptreact = return_formatters_if_available({
        "oxlint",
        "eslint",
      }),
      yaml = return_formatters_if_available({
        "yamllint",
      }),
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
