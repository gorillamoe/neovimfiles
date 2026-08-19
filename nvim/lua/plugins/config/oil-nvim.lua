local function relative_to(path, root)
  path = vim.fs.normalize(path)
  root = vim.fs.normalize(root)

  if path == root then
    return ""
  end

  -- Only return a relative path if `path` is actually below `root`.
  -- Otherwise, we're "above" the root and want the absolute path.
  local prefix = root == "/" and "/" or root .. "/"

  if vim.startswith(path, prefix) then
    return path:sub(#prefix + 1)
  end

  return nil
end

local function oil_win_title(winid)
  local bufnr = vim.api.nvim_win_get_buf(winid)
  local dir = require("oil").get_current_dir(bufnr)

  if not dir then
    return ""
  end

  dir = vim.fs.normalize(dir)

  -- Prefer the Git root of the directory we're currently viewing.
  local git_root = vim.fs.root(dir, ".git")

  if git_root then
    local relative = relative_to(dir, git_root)

    if relative then
      return relative
    end
  end

  -- No Git root: make it relative to the current working directory,
  -- but only while we're inside/below it.
  local cwd = vim.fn.getcwd()
  local relative = relative_to(dir, cwd)

  if relative then
    return relative
  end

  -- We've navigated above the relevant root, so show the absolute path.
  return dir
end

return {
  "stevearc/oil.nvim",
  opts = {
    view_options = {
      show_hidden = true,
    },
    float = {
      padding = 2,
      max_width = 0.75,
      max_height = 0.75,
      border = "rounded",
      win_options = {
        winblend = 0,
      },
      get_win_title = oil_win_title,
      preview_split = "below",
    },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
}
