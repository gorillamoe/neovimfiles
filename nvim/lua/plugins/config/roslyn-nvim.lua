--- Install roslyn-language-server for C# development in Neovim.
--- `dotnet tool install -g roslyn-language-server --prerelease --source https://pkgs.dev.azure.com/azure-public/vside/_packaging/vs-impl/nuget/v3/index.json`
return {
  "seblyng/roslyn.nvim",
  ---@module 'roslyn.config'
  ---@type RoslynNvimConfig
  opts = {},
  ft = { "cs" },
}
