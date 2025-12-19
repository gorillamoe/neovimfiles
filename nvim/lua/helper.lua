local helper = {}

--- NeovimConfigHelperMapKeyModes
--- @enum { 'n', 'i', 't', 'v' }
helper.MapKeyModes = {
  NORMAL = "n",
  INSERT = "i",
  TERMINAL = "t",
  VISUAL = "v",
}

--- Function to map keys in nvim with lua
--- @param mode NeovimConfigHelperMapKeyModes The mode to map the key in
--- @param lhs string The key to map
--- @param rhs string|function What it should do
--- @param opts table|nil Additional options
function helper.mapKey(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  if type(rhs) == "function" then
    vim.keymap.set(mode, lhs, rhs, options)
  else
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
  end
end

--- Check if a file or directory exists
--- @param path string
--- @returns boolean
function helper.filepath_exists(path)
  local file = io.open(path, "r")
  if file ~= nil then
    io.close(file)
    return true
  end
  return false
end

--- Get directory path if it exists
--- @param path string
--- @returns string|nil
function helper.get_dir_path_if_exists(path)
  if helper.filepath_exists(path) then
    return path
  end
  return nil
end

return helper
