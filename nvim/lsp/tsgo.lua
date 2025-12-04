local root_files = {
  "tsconfig.base.json",
  "tsconfig.json",
  "jsconfig.json",
  "package.json",
  ".git",
}

-- Find the tsgo binary
local tsgo_bin = vim.fn.exepath("tsgo")

-- tsgo binary was not found, exit early
if tsgo_bin == "" then
  return
end

-- Find the root directory by searching for root files,
-- stopping at the user's home directory
local paths = vim.fs.find(root_files, { stop = vim.env.HOME })
local root_dir = vim.fs.dirname(paths[1])

-- root directory was not found
if root_dir == nil then
  return
end

if not (vim.fn.filereadable(root_dir .. "/deno.json") == 1) then
  -- If deno.json is not present, we don't want to use tsgo
  return
end

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
