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
--- @param path string|table A string path or a table of paths to check
--- @returns string|nil
function helper.get_dir_path_if_exists(path)
  if type(path) == "table" then
    for _, p in ipairs(path) do
      if helper.filepath_exists(p) then
        return p
      end
    end
    return nil
  end
  if helper.filepath_exists(path) then
    return path
  end
  return nil
end

--- Get project directory path if it exists in the default projects directory
--- @param path string project name to check in the default projects directory
--- @returns string|nil
function helper.get_project_dir_path_if_exists(path)
  local base = vim.fs.joinpath(os.getenv("HOME"), "%s", "%s")
  return helper.get_dir_path_if_exists({
    string.format(base, vim.fs.joinpath("projects", "personal"), path),
    string.format(base, vim.fs.joinpath("Projects", "personal"), path),
  })
end

return helper
