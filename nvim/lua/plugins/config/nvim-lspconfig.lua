return {
  "neovim/nvim-lspconfig",
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    capabilities.textDocument = capabilities.textDocument or {}
    capabilities.textDocument.completion = capabilities.textDocument.completion or {}
    capabilities.textDocument.completion.completionItem = capabilities.textDocument.completion.completionItem or {}
    capabilities.textDocument.completion.completionItem.resolveSupport = {
      properties = { "documentation", "detail", "additionalTextEdits" },
    }

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
      "lua_ls",
      "marksman",
      "oxlint",
      "prismals",
      "pyright",
      "roslyn_ls", -- dotnet tool install -g roslyn-language-server --prerelease
      "sqlls",
      "svelte",
      "tailwindcss",
      "terraformls",
      "tsgo",
      "vimls",
      "yamlls",
      "zls",
    }

    vim.lsp.config("jsonls", {
      capabilities = capabilities,
      settings = {
        json = {
          validate = { enable = true },
        },
      },
    })

    vim.lsp.config("tsgo", {
      capabilities = capabilities,
      single_file_support = false,
      workspace_required = true,
      root_markers = { "package.json" },
    })

    vim.lsp.config("denols", {
      capabilities = capabilities,
      workspace_required = true,
      root_markers = { "deno.json" },
    })

    -- Disable inlay hints for Lua LSP
    -- Because this is now the default behavior neovim/nvim-lspconfig
    -- See: https://github.com/neovim/nvim-lspconfig/blob/2be96a2d409f3d3e6f02e633627a56b620e7740d/lsp/lua_ls.lua
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          hint = { enable = false },
        },
      },
    })

    vim.lsp.config("roslyn_ls", {
      capabilities = capabilities,
      cmd = { "roslyn-language-server", "--stdio" },
      filetypes = { "cs" },
      root_dir = vim.fs.dirname(vim.fs.find({ "*.sln", "*.csproj", ".git" }, { upward = true })[1] or vim.uv.cwd()),
    })

    -- HACK:
    -- Only start when a real Tailwind/PostCSS marker or a package.json that
    -- mentions tailwindcss is found upward.
    -- Keep in sync with nvim-lspconfig `lsp/tailwindcss.lua` root_files (minus `.git`).
    do
      local util = require("lspconfig.util")
      local tw_caps = vim.tbl_deep_extend("force", capabilities, {
        workspace = {
          didChangeWatchedFiles = {
            dynamicRegistration = true,
          },
        },
      })
      vim.lsp.config("tailwindcss", {
        capabilities = tw_caps,
        root_dir = function(bufnr, on_dir)
          local fname = vim.api.nvim_buf_get_name(bufnr)
          local root_files = {
            "tailwind.config.js",
            "tailwind.config.cjs",
            "tailwind.config.mjs",
            "tailwind.config.ts",
            "postcss.config.js",
            "postcss.config.cjs",
            "postcss.config.mjs",
            "postcss.config.ts",
            "theme/static_src/tailwind.config.js",
            "theme/static_src/tailwind.config.cjs",
            "theme/static_src/tailwind.config.mjs",
            "theme/static_src/tailwind.config.ts",
            "theme/static_src/postcss.config.js",
          }
          root_files = util.insert_package_json(root_files, "tailwindcss", fname)
          root_files = util.root_markers_with_field(root_files, { "mix.lock", "Gemfile.lock" }, "tailwind", fname)
          local found = vim.fs.find(root_files, { path = fname, upward = true })[1]
          if not found then
            on_dir(nil)
            return
          end
          on_dir(vim.fs.dirname(found))
        end,
      })
    end

    local root_patterns = { ".git", "deno.json", "tsconfig.json", "package.json", "jsconfig.json", "pyproject.toml" }
    local root_dir = vim.fs.dirname(vim.fs.find(root_patterns, { upward = true })[1] or vim.uv.cwd())

    -- Configure each LSP server
    for _, lsp in ipairs(servers) do
      -- Skip tsgo if deno.json is present in the project root
      if
        -- Skip tsgo if deno.json is present in the project root
        not (lsp == "tsgo" and vim.fn.filereadable(root_dir .. "/deno.json") == 1)
        -- Skip eslint if .oxlintrc.json is present in the project root
        and not (lsp == "eslint" and vim.fn.filereadable(root_dir .. "/.oxlintrc.json") == 1)
      then
        vim.lsp.enable(lsp)
      end
    end
  end,
}
