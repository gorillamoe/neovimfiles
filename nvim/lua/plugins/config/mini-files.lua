--- INFO:
--- This setup (the complete file)
--- makes `mini.files` almost behave like `oil.nvim` 🥥.

vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesBufferCreate",
  callback = function(args)
    vim.api.nvim_create_autocmd("BufWriteCmd", {
      buffer = args.data.buf_id,
      callback = function()
        require("mini.files").synchronize()
      end,
    })
    vim.api.nvim_buf_set_keymap(
      args.data.buf_id,
      "n",
      "<Esc>",
      ":lua require('mini.files').close()<CR>",
      { noremap = true, silent = true }
    )
  end,
})

return {
  "nvim-mini/mini.files",
  opts = {
    mappings = {
      close = "q",
      go_in = "L",
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
      width_focus = 30,
      width_nofocus = 15,
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
