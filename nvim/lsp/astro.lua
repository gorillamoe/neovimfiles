---@brief
--- https://github.com/withastro/astro/tree/main/packages/language-tools/language-server

---@type vim.lsp.Config
return {
  cmd = function(dispatchers, config)
    local cmd = "astro-ls"
    if (config or {}).root_dir then
      local local_cmd = vim.fs.joinpath(config.root_dir, "node_modules/.bin", cmd)
      if vim.fn.executable(local_cmd) == 1 then
        cmd = local_cmd
      end
    end
    return vim.lsp.rpc.start({ cmd, "--stdio" }, dispatchers)
  end,
  filetypes = { "astro" },
  root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
  init_options = {
    typescript = {
      tsdk = vim.fs.joinpath(
        vim.fn.stdpath("data"),
        "..",
        "nvpm",
        "packages",
        "npm",
        "@astrojs",
        "language-server",
        "node_modules",
        "typescript",
        "lib"
      ),
    },
  },
}
