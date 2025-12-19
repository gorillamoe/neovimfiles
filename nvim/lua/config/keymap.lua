local map = require("helper").mapKey

-- Move up/down by visual (wrapped) lines
map("", "j", "gj")
map("", "k", "gk")

-- Save
map("n", "<leader>w", ":w<CR>")

-- Save and quit Neovim
map("n", "<leader>x", ":wqall!<CR>")

-- Replacement for ctrlp
vim.keymap.set("n", "<C-p>", function()
  require("fzf-lua").files()
end)

-- Quit kill all all floating windows first, even if not focused,
-- if no floating windows exist, just delete the buffer
vim.keymap.set("n", "<leader>q", function()
  local float_exists = false
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_config(win).relative ~= "" then
      float_exists = true
      break
    end
  end
  if float_exists then
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_config(win).relative ~= "" then
        vim.api.nvim_win_close(win, true)
      end
    end
  else
    vim.cmd("bd!")
  end
end)

map("n", "<leader>be", ':lua require("bafa.ui").toggle()<CR>', { desc = "Toggle bafa", noremap = true, silent = true })

map(
  "n",
  "<leader><leader>",
  ':lua require("bafa.ui").toggle()<CR>',
  { desc = "Toggle bafa", noremap = true, silent = true }
)

-- Quickly swap between two files
map("n", "<space>", ":b#<CR>")

-- File Explorer
map("n", "<leader>e", ":NvimTreeFindFileToggle<CR>")
map("n", "<leader>E", ":NvimTreeToggle<CR>")

-- Emoji and Gitmoji via fzf-lua
--https://github.com/mistweaverco/fzf-symbols.nvim
vim.keymap.set("i", "<C-e>", function()
  require("fzf-symbols").open()
end)

-- LSP document symbols
vim.keymap.set("n", "<leader>t", function()
  require("fzf-lua").lsp_document_symbols()
end)

vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
