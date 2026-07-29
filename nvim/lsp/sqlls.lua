---@brief
--- https://github.com/joe-re/sql-language-server

---@type vim.lsp.Config
return {
  cmd = { "sql-language-server", "up", "--method", "stdio" },
  filetypes = { "sql", "mysql" },
  root_markers = { ".sqllsrc.json" },
  settings = {},
}
