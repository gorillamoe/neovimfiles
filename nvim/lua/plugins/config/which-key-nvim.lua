return {
  "folke/which-key.nvim",
  config = function()
    local wk = require("which-key")

    wk.add({
      mode = { "n" },
      { "<leader>k", group = "Kulala.nvim 🐼" },
      {
        "<leader>kr",
        function()
          require("kulala").replay()
        end,
        desc = "Replay 🔁",
      },
    })

    wk.add({
      mode = { "n" },
      {
        "<leader>t",
        function()
          require("floaterm").toggle()
        end,
        desc = "Toggle Floaterm 🪁",
      },
    })

    wk.add({
      mode = { "n" },
      "<leader>f",
      function()
        require("flash").jump()
      end,
      desc = "Flash Jump ⚡",
    })

    wk.add({
      {
        mode = { "n" },
        {
          "<leader>u",
          function()
            -- since undotree only supports .open(),
            -- we iterate over the windows to check if undotree is already open, and close it if it is
            local undotree_win = nil
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              local buf = vim.api.nvim_win_get_buf(win)
              local buf_name = vim.api.nvim_buf_get_name(buf)
              if buf_name:match("undotree") then
                undotree_win = win
                break
              end
            end
            if undotree_win then
              vim.api.nvim_win_close(undotree_win, true)
            else
              require("undotree").open()
            end
          end,
          desc = "Toggle UndoTree 🕰️🌳",
        },
      },
    })

    wk.add({
      mode = { "n" },
      { "<leader>w", group = "Window navigation" },
      { "<leader>ww", "<cmd>lua require('nvim-window').pick()<cr>", desc = "Jump to window" },
    })

    local is_diffview_open = false

    wk.add({
      mode = { "n" },
      { "<leader>a", group = "VCS" },
      {
        "<leader>aa",
        function()
          require("jujutsu").open()
        end,
        desc = "Jujutsu 🥋"
      },
      {
        "<leader>ab",
        "<cmd>:BlameToggle<cr>",
        desc = "Blame 🫵",
      },
      {
        "<leader>ad",
        function()
          if is_diffview_open then
            require("diffview").close()
            is_diffview_open = false
          else
            require("diffview").open()
            is_diffview_open = true
          end
        end,
        desc = "Diff View 📝",
      },
    })

    wk.add({
      mode = { "n" },
      {
        "<leader>j",
        "<cmd>Tabby jump_to_tab<cr>",
        silent = true,
        desc = "Jump to tab",
      },
    })

    wk.add({
      mode = { "n" },
      { "<leader>g", group = "Goto" },
      {
        "<leader>gD",
        function()
          return vim.lsp.buf.declaration()
        end,
        desc = "Declaration",
      },
      {
        "<leader>gd",
        function()
          return require("fzf-lua").lsp_definitions()
        end,
        desc = "Definitions",
      },
      {
        "<leader>gg",
        function()
          return require("fzf-lua").live_grep({ resume = true })
        end,
        desc = "Live Grep",
      },
      {
        "<leader>gi",
        function()
          return require("fzf-lua").lsp_implementations()
        end,
        desc = "Implementations",
      },
      {
        "<leader>gk",
        function()
          return vim.lsp.buf.hover()
        end,
        desc = "Show Function Docs",
      },
      {
        "<leader>gr",
        function()
          return require("fzf-lua").lsp_references()
        end,
        desc = "References",
      },
      {
        "<leader>gR",
        function()
          return vim.lsp.buf.rename()
        end,
        desc = "Rename",
      },
      { "<leader>gs", group = "Symbols" },
      {
        "<leader>gsw",
        function()
          return require("fzf-lua").lsp_workspace_symbols()
        end,
        desc = "Workspace Symbols",
      },
      {
        "<leader>gsd",
        function()
          return require("fzf-lua").lsp_document_symbols()
        end,
        desc = "Document Symbols",
      },
      {
        "<leader>gt",
        function()
          return require("fzf-lua").lsp_typedefs()
        end,
        desc = "Type Definitions",
      },
    })

    wk.add({
      mode = { "n" },
      { "<leader>d", group = "Debug" },
      {
        "<leader>dt",
        function()
          return require("trouble").toggle({ mode = "todo" })
        end,
        desc = "ToDo",
        icon = "",
      },
      { "<leader>d", group = "Debug" },
      {
        "<leader>dd",
        function()
          require("trouble").toggle({ mode = "diagnostics", filter = { buf = 0 } })
        end,
        desc = "Document Diagnostics",
      },
      {
        "<leader>de",
        function()
          vim.diagnostic.open_float(0, { scope = "line" })
        end,
        desc = "Show error in float",
      },
      {
        "<leader>dw",
        function()
          require("trouble").toggle({ mode = "diagnostics" })
        end,
        desc = "Workspace Diagnostics 🔍",
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
      {
        "<leader>c",
        function()
          return require("tiny-code-action").code_action()
        end,
        desc = "Code Action 💡",
      },
    })

    wk.add({
      mode = { "n" },
      {
        "<leader>z",
        function()
          return require("zen-mode").toggle()
        end,
        desc = "ZenMode 🧘",
      },
    })
  end,
}
