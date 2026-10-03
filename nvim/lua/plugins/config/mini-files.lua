--- INFO:
--- This setup (the complete file)
--- makes `mini.files` almost behave like `oil.nvim` 🥥.

vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesWindowUpdate",
  callback = function(args)
    local config = vim.api.nvim_win_get_config(args.data.win_id)
    local width = math.min(vim.o.columns - 4, 120)
    config.width = width
    config.col = math.floor((vim.o.columns - width) / 2)
    vim.api.nvim_win_set_config(args.data.win_id, config)
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesBufferCreate",
  callback = function(args)
    local buf = args.data.buf_id
    vim.api.nvim_buf_set_keymap(
      buf,
      "n",
      "<Esc>",
      ":lua require('mini.files').close()<CR>",
      { noremap = true, silent = true }
    )
    --- INFO:
    --- Allow `:w` to reach `BufWriteCmd`
    vim.bo[buf].buftype = "acwrite"
    vim.api.nvim_create_autocmd("BufWriteCmd", {
      buffer = buf,
      callback = function()
        require("mini.files").synchronize()
      end,
    })
  end,
})

return {
  "nvim-mini/mini.files",
  opts = {
    mappings = {
      close = "q",
      go_in = "<S-CR>",
      go_in_plus = "<CR>",
      go_out = "-",
      go_out_plus = "H",
      reset = "<BS>",
      reveal_cwd = "@",
      show_help = "g?",
      synchronize = "<leader>w",
      trim_left = "<",
      trim_right = ">",
    },
    options = {
      permanent_delete = false,
      use_as_default_explorer = true,
    },
    windows = {
      preview = false,
      max_number = 1,
    },
  },
  keys = {
    {
      "-",
      function()
        local path = vim.api.nvim_buf_get_name(0)
        local MiniFiles = require("mini.files")
        if path ~= "" and vim.uv.fs_stat(path) then
          MiniFiles.open(path)
        else
          MiniFiles.open(vim.fn.getcwd())
        end
      end,
      desc = "File-Navigation",
    },
  },
}
