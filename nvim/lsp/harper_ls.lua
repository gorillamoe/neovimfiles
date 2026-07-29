---@brief
--- https://github.com/automattic/harper

---@type vim.lsp.Config
return {
  cmd = { "harper-ls", "--stdio" },
  filetypes = {
    "asciidoc",
    "c",
    "cpp",
    "cs",
    "gitcommit",
    "go",
    "html",
    "java",
    "javascript",
    "lua",
    "markdown",
    "nix",
    "python",
    "ruby",
    "rust",
    "swift",
    "tex",
    "toml",
    "typescript",
    "typescriptreact",
    "haskell",
    "cmake",
    "typst",
    "php",
    "dart",
    "clojure",
    "sh",
  },
  settings = {
    ["harper-ls"] = {
      telemetry = {
        enabled = false,
      },
    },
  },
  root_markers = { ".harper-dictionary.txt", ".git" },
}
