local root_files = {
  "tsconfig.base.json",
  "tsconfig.json",
  "jsconfig.json",
  "package.json",
  ".git",
}

-- Find the root directory by searching for root files,
-- stopping at the user's home directory
local paths = vim.fs.find(root_files, { stop = vim.env.HOME })
local root_dir = vim.fs.dirname(paths[1])

---@type vim.lsp.Config
local M = {}

-- Command to start the tsgo language server
M.cmd = {
  tsgo_bin,
  "lsp",
  "--stdio",
}

-- Specify the filetypes that tsgo will attach to
M.filetypes = {
  "javascript",
  "javascriptreact",
  "typescript",
  "typescriptreact",
}

-- Set the root directory for the tsgo language server
M.root_dir = root_dir

return M
