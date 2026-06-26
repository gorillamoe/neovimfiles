local get_dir = require("helper").get_project_dir_path_if_exists

local kulala_core_dir = get_dir("kulala-core")
local kulala_core_path
if kulala_core_dir then
  kulala_core_path = kulala_core_dir .. "/packages/core/dist/kulala-core"
else
  kulala_core_path = nil
end

return {
  "mistweaverco/kulala.nvim",
  dir = get_dir("kulala.nvim"),
  ft = {
    "http",
    "javascript",
    "lua",
    "rest",
    "typescript",
  },
  opts = {
    kulala_core = {
      path = kulala_core_path,
    },
    response_format = {
      indent = 2,
      expand_tabs = true,
      sort_keys = true,
    },
    global_keymaps = {
      ["Search requests"] = {
        "<leader>S",
        function()
          require("kulala").search()
        end,
        ft = { "http", "rest" },
      },
      ["Toggle split/float"] = {
        "<leader>T",
        function()
          require("kulala.ui").toggle_display_mode()
        end,
        prefix = false,
        ft = { "http", "rest" },
      },
    },
    kulala_keymaps = {
      ["Toggle headers/body"] = {
        "<leader>T",
        function()
          require("kulala").toggle_view()
        end,
        ft = { "http", "rest" },
      },
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
      ["Send WS message"] = {
        "<C-j>",
        function()
          require("kulala.ui.ws_input").on_send_keymap()
        end,
        mode = { "n", "v", "i" },
        desc = "Open WS message input (body view) / send from input overlay",
        prefix = false,
      },
      ["Jump to response"] = {
        "<C-b>",
        function()
          require("kulala.ui").jump_to_response()
        end,
        desc = "also: show responses list",
      },
      ["Clear responses history"] = {
        "<leader>X",
        function()
          require("kulala.ui").clear_responses_history()
        end,
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
      display_mode = "split",
      win_opts = {
        wo = { foldmethod = "manual" },
      },
    },
  },
}
