--- @brief
--- https://github.com/oxc-project/oxc
--- https://oxc.rs/docs/guide/usage/linter.html

-- luacheck: ignore 631

local util = require("lspconfig.util")

local function oxlint_conf_mentions_typescript(root_dir)
  local fn = vim.fs.joinpath(root_dir, ".oxlintrc.json")
  for line in io.lines(fn) do
    if line:find("typescript") then
      return true
    end
  end
  return false
end

---@type vim.lsp.Config
return {
  cmd = function(dispatchers, config)
    local cmd = "oxlint"
    if (config or {}).root_dir then
      local local_cmd = vim.fs.joinpath(config.root_dir, "node_modules/.bin", cmd)
      if vim.fn.executable(local_cmd) == 1 then
        cmd = local_cmd
      end
    end
    return vim.lsp.rpc.start({ cmd, "--lsp" }, dispatchers)
  end,
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
    "svelte",
    "astro",
  },
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)

    local root_markers = util.insert_package_json(
      { ".oxlintrc.json", ".oxlintrc.jsonc", "oxlint.config.ts" },
      { "oxlint", "vite%-plus" },
      fname
    )
    -- Find `vite` plus configuration with lint field
    root_markers = util.root_markers_with_field(
      root_markers,
      { "vite.config.ts" },
      { "vite%-plus", "lint:" },
      fname,
      "all"
    )
    on_dir(vim.fs.dirname(vim.fs.find(root_markers, { path = fname, upward = true })[1]))
  end,
  workspace_required = true,
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_create_user_command(bufnr, "LspOxlintFixAll", function()
      client:exec_cmd({
        title = "Apply Oxlint automatic fixes",
        command = "oxc.fixAll",
        arguments = { { uri = vim.uri_from_bufnr(bufnr) } },
      })
    end, {
      desc = "Apply Oxlint automatic fixes",
    })
  end,

  ---@class lspconfig.oxlint.settings
  ---@field run string|nil When to run the linter. Can be one of:
  ---@field configPath string|nil Path to the configuration file. If not specified, the linter will look for a configuration file in the project root.
  ---@field tsConfigPath string|nil Path to the TypeScript configuration file. If not specified, the linter will look for a TypeScript configuration file in the project root.
  ---@field unusedDisableDirectives string|nil How to handle unused disable directives. Can
  ---@field typeAware boolean|nil Whether to enable type-aware linting. If not specified, the linter will determine whether to enable type-aware linting based on the presence of a TypeScript configuration file.
  ---@field disableNestedConfig boolean|nil Whether to disable nested configuration files. If not
  ---@field fixKind string|nil The kind of fixes to apply. Can be one of: "safe_fix", "all_fix", "fixable_fix". If not specified, the linter will apply all fixes.
  settings = {},
  before_init = function(init_params, config)
    local settings = config.settings or {}
    local has_tsgolint = vim.fn.executable("tsgolint") == 1
    if not has_tsgolint and (config or {}).root_dir then
      local local_cmd = vim.fs.joinpath(config.root_dir, "node_modules/.bin", "tsgolint")
      has_tsgolint = vim.fn.executable(local_cmd) == 1
    end
    if settings.typeAware == nil and has_tsgolint then
      local ok, res = pcall(oxlint_conf_mentions_typescript, config.root_dir)
      if ok and res then
        settings = vim.tbl_extend("force", settings, { typeAware = true })
      end
    end
    local init_options = config.init_options or {}
    init_options.settings = vim.tbl_extend("force", init_options.settings or {} --[[@as table]], settings)

    init_params.initializationOptions = init_options
  end,
}
