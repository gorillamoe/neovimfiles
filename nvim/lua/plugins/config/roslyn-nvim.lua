--- Install roslyn-language-server for C# development in Neovim.
--- `dotnet tool install -g roslyn-language-server --prerelease --source https://pkgs.dev.azure.com/azure-public/vside/_packaging/vs-impl/nuget/v3/index.json`
return not vim.env.NVIM_AS_SCROLLBACK_PAGER
    and {
      "seblyng/roslyn.nvim",
      ---@module 'roslyn.config'
      ---@type RoslynNvimConfig
      opts = {},
      ft = { "cs" },
    }
  or {}
