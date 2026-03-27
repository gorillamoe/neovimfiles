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
    local name = formatter.name
    if cache_available_formatters[name] ~= nil then
      table.insert(available_formatters, cache_available_formatters[name])
    else
      if vim.fn.executable(formatter.cmd) == 1 then
        if name == "oxfmt" and vim.fn.executable("vp") == 1 then
          table.insert(available_formatters, "vp")
          cache_available_formatters[name] = "vp"
        else
          table.insert(available_formatters, name)
          cache_available_formatters[name] = name
        end
      end
    end
  end
  return #available_formatters > 0 and available_formatters or nil
end
return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters = {
        vp = {
          command = "vp",
          args = { "fmt", "--stdin-filepath", "$FILENAME" },
          stdin = true,
        },
      },
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
          { name = "oxfmt", cmd = "oxfmt" },
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
          { name = "oxfmt", cmd = "oxfmt" },
          { name = "prettier", cmd = "prettier" },
        }),
        typescriptreact = return_formatters_if_available({
          { name = "deno_fmt", cmd = "deno" },
          { name = "eslint", cmd = "eslint" },
          { name = "oxfmt", cmd = "oxfmt" },
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
