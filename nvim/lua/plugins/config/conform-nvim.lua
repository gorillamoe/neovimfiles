---@class FormatterDefinition
---@field name string The name of the formatter
---@field cmd string The command to check for the formatter's availability
---@field excluded_if? string[] A list of formatter names that, if available, should exclude this formatter from being used

--- A cache to store available formatters
--- @type table<string, string>
local cache_available_formatters = {}

---A function to check if a formatter needs to be excluded based on the presence of other formatters
---@param formatter FormatterDefinition The formatter definition to check for exclusion
local needs_exclusion = function(formatter)
  for _, excluded_name in pairs(formatter.excluded_if or {}) do
    if vim.fn.executable(excluded_name) == 1 or cache_available_formatters[excluded_name] ~= nil then
      return true
    end
  end
  return false
end

--- A function to check for available formatters
--- @param formatters FormatterDefinition[] formatters A list of formatter definitions to check for availability
--- @return table|nil available_formatters A list of available formatter names or nil if none are available
--- @usage
--- local available = return_formatters_if_available({
---  { name = "prettier", cmd = "prettier", excluded_if = { "oxfmt" } },
---  { name = "eslint", cmd = "eslint", excluded_if = { "oxfmt" } },
---  { name = "nonexistent", cmd = "nonexistent-cmd" },
---  })
local return_formatters_if_available = function(formatters)
  local available_formatters = {}
  for _, formatter in pairs(formatters) do
    local name = formatter.name
    if cache_available_formatters[name] ~= nil then
      if not needs_exclusion(formatter) then
        table.insert(available_formatters, cache_available_formatters[name])
      end
    else
      if not needs_exclusion(formatter) then
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
          { name = "kulala-fmt", cmd = "kulala-fmt" },
        }),
        go = return_formatters_if_available({
          { name = "goimports", cmd = "goimports" },
          { name = "gofmt", cmd = "gofmt" },
        }),
        javascript = return_formatters_if_available({
          { name = "deno_fmt", cmd = "deno", excluded_if = { "oxfmt", "vp" } },
          { name = "eslint", cmd = "eslint", excluded_if = { "oxfmt", "vp" } },
          { name = "oxfmt", cmd = "oxfmt" },
          { name = "prettier", cmd = "prettier", excluded_if = { "oxfmt", "vp" } },
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
          { name = "oxfmt", cmd = "oxfmt" },
          { name = "eslint", cmd = "eslint", excluded_if = { "oxfmt", "vp" } },
          { name = "prettier", cmd = "prettier", excluded_if = { "oxfmt", "vp" } },
        }),
        typescript = return_formatters_if_available({
          { name = "deno_fmt", cmd = "deno", excluded_if = { "oxfmt", "vp" } },
          { name = "eslint", cmd = "eslint", excluded_if = { "oxfmt", "vp" } },
          { name = "oxfmt", cmd = "oxfmt" },
          { name = "prettier", cmd = "prettier", excluded_if = { "oxfmt", "vp" } },
        }),
        typescriptreact = return_formatters_if_available({
          { name = "deno_fmt", cmd = "deno", excluded_if = { "oxfmt", "vp" } },
          { name = "eslint", cmd = "eslint", excluded_if = { "oxfmt", "vp" } },
          { name = "oxfmt", cmd = "oxfmt" },
          { name = "prettier", cmd = "prettier", excluded_if = { "oxfmt", "vp" } },
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
