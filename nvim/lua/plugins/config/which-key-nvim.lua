return {
  "folke/which-key.nvim",
  config = function()
    local wk = require("which-key")
    wk.add({
      mode = { "n" },
      { "<leader>f", group = "Flash.nvim ⚡" },
      { "<leader>ff", "<Cmd>lua require('flash').jump()<CR>", desc = "Jump ⚡" },
    })
    wk.add({
      {
        mode = { "v" },
        { "<leader>a", group = "Git 🐙" },
        { "<leader>as", group = "ndoo 🥷" },
        { "<leader>asO", "<Cmd>lua require('ndoo').open({ v = true, commit = true })<CR>", desc = "Open commit" },
        { "<leader>aso", "<Cmd>lua require('ndoo').open({ v = true })<CR>", desc = "Open" },
      },
    })

    wk.add({
      {
        mode = { "n" },
        { "<leader>u", group = "Time Machine" },
        { "<leader>uu", "<cmd>TimeMachineToggle<CR>", desc = "[Time Machine] Toggle Tree" },
        { "<leader>ux", "<cmd>TimeMachinePurgeCurrent<CR>", desc = "[Time Machine] Purge Current" },
        { "<leader>uX", "<cmd>TimeMachinePurgeAll<CR>", desc = "[Time Machine] Purge All" },
        { "<leader>ul", "<cmd>TimeMachineLogShow<CR>", desc = "[Time Machine] Show Log" },
      },
    })

    wk.add({
      mode = { "n" },
      { "<leader>w", group = "Window navigation" },
      { "<leader>ww", "<cmd>lua require('nvim-window').pick()<cr>", desc = "Jump to window" },
    })

    wk.add({
      mode = { "n" },
      { "<leader>a", group = "Git 🐙" },
      { "<leader>ab", "<Cmd>BlameToggle window<CR>", desc = "Blame 😠" },
      { "<leader>aa", "<Cmd>Neogit<CR>", desc = "Neogit 🥷" },
      { "<leader>as", group = "ndoo 🥷" },
      { "<leader>asO", "<Cmd>lua require('ndoo').open({ commit = true })<CR>", desc = "Open commit" },
      { "<leader>asa", "<Cmd>lua require('ndoo').pipelines()<CR>", desc = "Pipelines" },
      { "<leader>asc", "<Cmd>lua require('ndoo').commit()<CR>", desc = "Commit" },
      { "<leader>asi", "<Cmd>lua require('ndoo').issues()<CR>", desc = "Issues" },
      { "<leader>asl", "<Cmd>lua require('ndoo').labels()<CR>", desc = "Labels" },
      { "<leader>aso", "<Cmd>lua require('ndoo').open()<CR>", desc = "Open" },
      { "<leader>asp", "<Cmd>lua require('ndoo').pulls()<CR>", desc = "Pulls" },
      { "<leader>asr", "<Cmd>lua require('ndoo').repo()<CR>", desc = "Repo" },
    })

    wk.add({
      mode = { "n" },
      { "<leader>g", group = "Goto" },
      { "<leader>gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Declaration" },
      { "<leader>gd", "<Cmd>lua require('fzf-lua').lsp_definitions()<CR>", desc = "Definitions" },
      { "<leader>gg", "<Cmd>lua require('fzf-lua').live_grep({ resume = true })<CR>", desc = "Live Grep" },
      { "<leader>gi", "<Cmd>lua require('fzf-lua').lsp_implementations()<CR>", desc = "Implementations" },
      { "<leader>gk", "<Cmd>lua vim.lsp.buf.hover()<CR>", desc = "Show Function Docs" },
      { "<leader>gr", "<Cmd>lua require('fzf-lua').lsp_references()<CR>", desc = "References" },
      { "<leader>gR", "<Cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
      { "<leader>gs", group = "Symbols" },
      {
        "<leader>gsw",
        "<Cmd>lua require('fzf-lua').lsp_workspace_symbols()<CR>",
        desc = "Workspace Symbols",
      },
      { "<leader>gt", "<Cmd>lua require('fzf-lua').lsp_typedefs()<CR>", desc = "Type Definitions" },
    })

    wk.add({
      mode = { "n" },
      { "<leader>d", group = "Debug" },
      {
        "<leader>dt",
        "<cmd>TodoTrouble<cr>",
        desc = "ToDo",
        icon = "",
      },
      { "<leader>d", group = "Debug" },
      {
        "<leader>dd",
        "<cmd>lua require('trouble').toggle({ mode = 'diagnostics', filter = { buf = 0 } })<cr>",
        desc = "Document Diagnostics",
      },
      { "<leader>de", "<cmd>lua vim.diagnostic.open_float(0, {scope='line'})<CR>", desc = "Show error in float" },
      {
        "<leader>dw",
        "<cmd>lua require('trouble').toggle({ mode = 'diagnostics' })<cr>",
        desc = "Workspace Diagnostics",
      },
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
        icon = "🔴",
      },
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Continue",
        icon = "▶️",
      },
      {
        "<leader>dC",
        function()
          require("dap").run_to_cursor()
        end,
        desc = "Run to Cursor",
        icon = "🖱️",
      },
      {
        "<leader>dT",
        function()
          require("dap").terminate()
        end,
        desc = "Terminate",
        icon = "💀",
      },
    })

    wk.add({
      mode = { "n" },
      { "<leader>c", group = "Code" },
      { "<leader>ca", "<cmd>lua require('tiny-code-action').code_action()<CR>", desc = "Actions" },
    })

    wk.add({
      mode = { "n" },
      { "<leader>z", group = "Zen" },
      { "<leader>zz", "<cmd>:ZenMode<CR>", desc = "ZenMode" },
    })

    wk.add({
      mode = { "n" },
      { "<leader>y", group = "Yank buffer as..." },
      {
        "<leader>yh",
        "<CMD>w !pandoc --standalone | xclip -target text/html -selection clip<CR>",
        desc = "Yank as rich text",
      },
    })
  end,
}
