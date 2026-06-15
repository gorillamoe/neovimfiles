vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "<C-l>",
  "<cmd>lua require('kulala').run()<cr>",
  { noremap = true, silent = true, desc = "Send the request" }
)

vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "[",
  "<cmd>lua require('kulala').jump_prev()<cr>",
  { noremap = true, silent = true, desc = "Jump to the previous request" }
)

vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "]",
  "<cmd>lua require('kulala').jump_next()<cr>",
  { noremap = true, silent = true, desc = "Jump to the next request" }
)

vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "<leader>i",
  "<cmd>lua require('kulala').inspect()<cr>",
  { noremap = true, silent = true, desc = "Inspect the current request" }
)

vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "<leader>co",
  "<cmd>lua require('kulala').copy()<cr>",
  { noremap = true, silent = true, desc = "Copy the current request as curl" }
)

vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "<leader>ci",
  "<cmd>lua require('kulala').from_curl()<cr>",
  { noremap = true, silent = true, desc = "Pastes curl from clipboard as http request" }
)

vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "<leader>se",
  "<cmd>lua require('kulala').set_selected_env()<cr>",
  { noremap = true, silent = true, desc = "Select environment" }
)
