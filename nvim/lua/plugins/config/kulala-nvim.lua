local get_dir_path_if_exists = require("helper").get_dir_path_if_exists

return {
  "mistweaverco/kulala.nvim",
  dir = get_dir_path_if_exists("/home/marco/projects/personal/kulala.nvim"),
  opts = {
    kulala_keymaps = {
      ["Show headers"] = {
        "<leader>h",
        function()
          require("kulala.ui").show_headers()
        end,
      },
      ["Show body"] = {
        "<leader>b",
        function()
          require("kulala.ui").show_body()
        end,
      },
      ["Show headers and body"] = {
        "<leader>a",
        function()
          require("kulala.ui").show_headers_body()
        end,
      },
      ["Show verbose"] = {
        "<leader>v",
        function()
          require("kulala.ui").show_verbose()
        end,
      },

      ["Show script output"] = {
        "<leader>o",
        function()
          require("kulala.ui").show_script_output()
        end,
      },
      ["Show stats"] = {
        "<leader>s",
        function()
          require("kulala.ui").show_stats()
        end,
      },
      ["Show report"] = {
        "<leader>r",
        function()
          require("kulala.ui").show_report()
        end,
      },
      ["Show filter"] = {
        "<leader>f",
        function()
          require("kulala.ui").toggle_filter()
        end,
      },
      ["Send WS message"] = {
        "<C-l>",
        function()
          require("kulala.cmd.websocket").send()
        end,
        mode = { "n", "v" },
      },
      ["Interrupt requests"] = {
        "<C-c>",
        function()
          require("kulala.cmd.websocket").close()
        end,
        desc = "also: CLose WS connection",
      },
      ["Next response"] = {
        "<C-n>",
        function()
          require("kulala.ui").show_next()
        end,
      },
      ["Previous response"] = {
        "<C-p>",
        function()
          require("kulala.ui").show_previous()
        end,
      },
      ["Jump to response"] = {
        "<C-j>",
        function()
          require("kulala.ui").jump_to_response()
        end,
        desc = "also: Send WS message for WS connections",
      },
      ["Clear responses history"] = {
        "<leader>X",
        function()
          require("kulala.ui").clear_responses_history()
        end,
      },
      ["Toggle split/float"] = {
        "<leader>t",
        function()
          require("kulala.ui").toggle_display_mode()
        end,
        prefix = false,
      },
      ["Close"] = {
        "q",
        function()
          require("kulala.ui").close_kulala_buffer()
        end,
      },
    },
    request_timeout = nil,
    ui = {
      display_mode = "float",
      win_opts = {
        wo = { foldmethod = "manual" },
      },
    },
  },
}
