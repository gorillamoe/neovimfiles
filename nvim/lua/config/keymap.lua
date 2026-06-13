local map = require("helper").mapKey

-- Fuzzy path completion in insert mode with @@
vim.keymap.set("i", "@@", function()
  require("fzf-lua").complete_path()
end, { silent = true })

-- Move up/down by visual (wrapped) lines
map("", "j", "gj")
map("", "k", "gk")

-- q for buffer delete, only if buffer is not modified
map("n", "<leader>q", function()
  if vim.bo.modified then
    vim.notify("Buffer is modified.\nPlease save or discard changes before closing.", vim.log.levels.WARN)
  else
    vim.cmd("bd")
  end
end, { desc = "Close buffer", silent = true, noremap = true })

-- Save
map("n", "<leader>w", function()
  vim.cmd("w")
end, { desc = "Save file", silent = true })

-- Save and quit Neovim
map("n", "<leader>x", function()
  vim.cmd("wqall!")
end, { desc = "Save and quit Neovim", silent = true })

-- Restart
map("n", "<leader>r", function()
  vim.cmd("restart")
end, { desc = "Restart Neovim", silent = true })

-- Save and restart Neovim
map("n", "<leader>R", function()
  vim.cmd("wall | restart")
end, { desc = "Save and restart Neovim", silent = true })

-- Replacement for ctrlp
vim.keymap.set("n", "<C-p>", function()
  require("fzf-lua").files()
end, { desc = "Fuzzy find files", silent = true })

-- Buffer management for the lazy 🦥
-- bafa.nvim.forthelazy.dev
map("n", "<leader><leader>", function()
  require("bafa").toggle()
end, { desc = "Toggle bafa", noremap = true, silent = true })
-- Quickly toggle between the last two recent files
map("n", "<space>", function()
  require("bafa.api").switch_to_buffer(2)
end, {
  desc = "Quickly toggle between the last two recent files",
  noremap = true,
  silent = true,
})

-- File Explorer
map("n", "<leader>e", function()
  require("nvim-tree.api").tree.toggle({ find_file = true })
end, {
  desc = "Toggle file explorer",
  silent = true,
})
map("n", "<leader>E", function()
  require("nvim-tree.api").tree.toggle({ find_file = true })
end, {
  desc = "Toggle file explorer",
  silent = true,
})

-- Emoji and Gitmoji via fzf-lua
--https://github.com/mistweaverco/fzf-symbols.nvim
vim.keymap.set("i", "<C-e>", function()
  require("fzf-symbols").open()
end, { desc = "Insert emoji or gitmoji", silent = true })

vim.keymap.set("n", "-", require("oil").open_float, { desc = "Open parent directory", silent = true })
