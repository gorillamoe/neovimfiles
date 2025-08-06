return {
  "mfussenegger/nvim-dap",
  dependencies = {
    { "theHamsta/nvim-dap-virtual-text" },
    {
      "microsoft/vscode-js-debug",
      build = "npm install --legacy-peer-deps && npx gulp dapDebugServer && mv dist out",
    },
    { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
  },
  config = function()
    local debugger_location = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"
    local dap, dapui, vt = require("dap"), require("dapui"), require("nvim-dap-virtual-text")
    dapui.setup()
    vt.setup()
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end

    if not dap.adapters["pwa-node"] then
      require("dap").adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          args = { debugger_location .. "/out/src/dapDebugServer.js", "${port}" },
        },
      }
    end
    if not dap.adapters["node"] then
      dap.adapters["node"] = function(cb, config)
        if config.type == "node" then
          config.type = "pwa-node"
        end
        local nativeAdapter = dap.adapters["pwa-node"]
        if type(nativeAdapter) == "function" then
          nativeAdapter(cb, config)
        else
          cb(nativeAdapter)
        end
      end
    end

    local js_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }

    for _, language in ipairs(js_filetypes) do
      dap.configurations[language] = {
        {
          name = "Launch",
          type = "pwa-node",
          request = "launch",
          program = "${file}",
          runtimeExecutable = "tsx",
          cwd = "${workspaceFolder}",
          console = "integratedTerminal",
          internalConsoleOptions = "neverOpen",
          skipFiles = { "<node_internals>/**", "${workspaceFolder}/node_modules/**" },
        },
        {
          name = "Attach",
          type = "node",
          request = "attach",
          processId = require("dap.utils").pick_process,
          skipFiles = { "<node_internals>/**" },
          cwd = "${workspaceFolder}",
        },
      }
    end
  end,
}
