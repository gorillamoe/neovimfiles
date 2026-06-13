return {
  "nvzone/floaterm",
  dependencies = "nvzone/volt",
  opts = {
    mappings = {
      term = function(buf)
        vim.keymap.set({ "n", "t" }, "<Esc>", function()
          -- if in insert mode, exit to normal mode first, then toggle the terminal
          if vim.api.nvim_get_mode().mode == "t" then
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", true)
          else
            require("floaterm").toggle()
          end
        end, { buffer = buf })
      end,
    },
  },
  cmd = "FloatermToggle",
}
