--- A cache to store available formatters
--- @type table<string> The formatter name
local cache_available_formatters = {}

--- A function to check for available formatters
--- @param formatters table A list of formatter definitions
--- @return table|nil A list of available formatter names or nil if none are available
--- @usage
--- local available = return_formatters_if_available({
---  { name = "prettier", cmd = "prettier" },
---  { name = "eslint", cmd = "eslint" },
---  { name = "nonexistent", cmd = "nonexistent-cmd" },
---  })
local return_formatters_if_available = function(formatters)
  local available_formatters = {}
  for _, formatter in pairs(formatters) do
    if cache_available_formatters[formatter.name] ~= nil then
      table.insert(available_formatters, formatter.name)
    else
      if vim.fn.executable(formatter.cmd) == 1 then
        table.insert(available_formatters, formatter.name)
        table.insert(cache_available_formatters, formatter.name)
      end
    end
  end
  if #available_formatters == 0 then
    return nil
  end
  return available_formatters
end
return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        http = return_formatters_if_available({
          { name = "kulala", cmd = "kulala-fmt" },
        }),
        go = return_formatters_if_available({
          { name = "goimports", cmd = "goimports" },
          { name = "gofmt", cmd = "gofmt" },
        }),
        javascript = return_formatters_if_available({
          { name = "deno_fmt", cmd = "deno" },
          { name = "eslint", cmd = "eslint" },
          { name = "prettier", cmd = "prettier" },
        }),
        lua = return_formatters_if_available({
          { name = "stylua", cmd = "stylua" },
        }),
        python = return_formatters_if_available({
          { name = "autoflake", cmd = "isort" },
          { name = "black", cmd = "black" },
          { name = "isort", cmd = "isort" },
        }),
        terraform = return_formatters_if_available({
          { name = "terraform_fmt", cmd = "terraform" },
        }),
        svelte = return_formatters_if_available({
          { name = "eslint", cmd = "eslint" },
          { name = "prettier", cmd = "prettier" },
        }),
        typescript = return_formatters_if_available({
          { name = "deno_fmt", cmd = "deno" },
          { name = "eslint", cmd = "eslint" },
          { name = "prettier", cmd = "prettier" },
        }),
        typescriptreact = return_formatters_if_available({
          { name = "deno_fmt", cmd = "deno" },
          { name = "eslint", cmd = "eslint" },
          { name = "prettier", cmd = "prettier" },
        }),
      },
      format_on_save = function()
        if conform.is_disabled then
          return false
        end
        return { all = true }
      end,
    })
    conform.is_disabled = false
    conform.toggle = function()
      conform.is_disabled = not conform.is_disabled
      if conform.is_disabled then
        vim.notify("conform.nvim disabled")
      else
        vim.notify("conform.nvim enabled")
      end
    end
    vim.api.nvim_create_user_command("ConformToggle", function()
      conform.toggle()
    end, {})
  end,
}
