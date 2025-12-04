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
      "html",
      "intelephense",
      "jsonls",
      "kulala_ls",
      "lua_ls",
      "marksman",
      "pyright",
      "csharp_ls",
      "rust_analyzer",
      "sqlls",
      "svelte",
      "tailwindcss",
      "terraformls",
      -- "ts_ls", temporarily disabled, because of tsgo
      "tsgo",
      "vimls",
      "yamlls",
      "zls",
    }

    -- Avoid conflict with competing ts_ls and denols
    -- deno.json is not present, use ts_ls instead of denols
    vim.lsp.config("ts_ls", {
      single_file_support = false,
      workspace_required = true,
      root_markers = { "package.json" },
    })

    vim.lsp.config("denols", {
      workspace_required = true,
      root_markers = { "deno.json" },
    })

    -- Disable inlay hints for Lua LSP
    -- Because this is now the default behavior neovim/nvim-lspconfig
    -- See: https://github.com/neovim/nvim-lspconfig/blob/2be96a2d409f3d3e6f02e633627a56b620e7740d/lsp/lua_ls.lua
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          hint = { enable = false },
        },
      },
    })

    local root_patterns = { ".git", "deno.json", "tsconfig.json", "package.json", "jsconfig.json", "pyproject.toml" }
    local root_dir = vim.fs.dirname(vim.fs.find(root_patterns, { upward = true })[1] or vim.loop.cwd())

    -- Configure each LSP server
    for _, lsp in ipairs(servers) do
      -- Skip ts_ls if deno.json is present in the project root
      if not (lsp == "ts_ls" and vim.fn.filereadable(root_dir .. "/deno.json") == 1) then
        vim.lsp.enable(lsp)
      end
    end
  end,
}
