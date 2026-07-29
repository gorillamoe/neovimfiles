---@brief
--- https://github.com/sveltejs/language-tools/tree/master/packages/language-server

---@type vim.lsp.Config
return {
  cmd = function(dispatchers, config)
    local cmd = "svelteserver"
    if (config or {}).root_dir then
      local local_cmd = vim.fs.joinpath(config.root_dir, "node_modules/.bin", cmd)
      if vim.fn.executable(local_cmd) == 1 then
        cmd = local_cmd
      end
    end
    return vim.lsp.rpc.start({ cmd, "--stdio" }, dispatchers)
  end,
  filetypes = { "svelte" },
  settings = {
    typescript = {
      inlayHints = {
        parameterNames = {
          enabled = "literals",
          suppressWhenArgumentMatchesName = true,
        },
        parameterTypes = { enabled = true },
        variableTypes = { enabled = true },
        propertyDeclarationTypes = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        enumMemberValues = { enabled = true },
      },
    },
  },
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    -- Svelte LSP only supports file:// schema. https://github.com/sveltejs/language-tools/issues/2777
    if vim.uv.fs_stat(fname) ~= nil then
      local root_markers =
        { "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb", "bun.lock", "deno.lock", { ".git" } }
      -- We fallback to the current working directory if no project root is found
      local project_root = vim.fs.root(bufnr, root_markers) or vim.fn.getcwd()
      on_dir(project_root)
    end
  end,
  on_attach = function(client, bufnr)
    -- Workaround to trigger reloading JS/TS files
    -- See https://github.com/sveltejs/language-tools/issues/2008
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = { "*.js", "*.ts" },
      group = vim.api.nvim_create_augroup("lspconfig.svelte", {}),
      callback = function(ctx)
        -- Internal API to sync changes that have not yet been saved to the filesystem
        ---@diagnostic disable-next-line: param-type-mismatch
        client:notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
      end,
    })
    vim.api.nvim_buf_create_user_command(bufnr, "LspMigrateToSvelte5", function()
      client:exec_cmd({
        title = "Migrate Component to Svelte 5 Syntax",
        command = "migrate_to_svelte_5",
        arguments = { vim.uri_from_bufnr(bufnr) },
      })
    end, { desc = "Migrate Component to Svelte 5 Syntax" })
  end,
}
