local helper = {}

--- Function to map keys in nvim with lua
--- @param mode 'n, i, t, v'
--- @param lhs  'Keybinding it should be'
--- @param rhs  'Command or keycombination it should execute'
--- @param opts 'Options'
function helper.mapKey(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
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
