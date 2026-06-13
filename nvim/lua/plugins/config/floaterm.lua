return {
  "nvzone/floaterm",
  dependencies = "nvzone/volt",
  opts = {
    mappings = {
      term = function(buf)
        vim.keymap.set({ "n", "t" }, "<leader>t", function()
          require("floaterm").toggle()
        end, { buffer = buf })
      end,
    },
  },
  cmd = "FloatermToggle",
}
