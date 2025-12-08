return {
  "mfussenegger/nvim-dap",
  dependencies = {
    { "theHamsta/nvim-dap-virtual-text" },
    {
      "microsoft/vscode-js-debug",
      version = "v1.105.0",
      -- We reset any local changes to ensure a clean state before building.
      pre_update = "git reset --hard HEAD",
      -- Because vscode-js-debug comes with a postinstall script that
      -- automatically downloads pre-built binaries, which may not be
      -- compatible with the user's system, we remove it before building.
      build = "jq 'del(.scripts.postinstall)' package.json > package.json.patch && mv package.json.patch package.json && npm install && gulp dapDebugServer",
    },
    {
      "igorlfs/nvim-dap-view",
      ---@module 'dap-view'
      ---@type dapview.Config
      opts = {},
    },
  },
  config = function()
    local debugger_location = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"
    local dap, dapview, vt = require("dap"), require("dap-view"), require("nvim-dap-virtual-text")
    vt.setup()
    dap.listeners.before.attach.dapview_config = function()
      dapview.open()
    end
    dap.listeners.before.launch.dapview_config = function()
      dapview.open()
    end

    if not dap.adapters["pwa-node"] then
      require("dap").adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          args = { debugger_location .. "/dist/src/dapDebugServer.js", "${port}" },
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
          runtimeExecutable = "deno",
          runtimeArgs = {
            "run",
            "--inspect-wait",
            "--allow-all",
            "--unstable-sloppy-imports",
          },
          attachSimplePort = 9229,
          cwd = "${workspaceFolder}",
          console = "integratedTerminal",
          internalConsoleOptions = "neverOpen",
          skipFiles = { "<node_internals>/**", "${workspaceFolder}/node_modules/**" },
        },
        {
          type = "pwa-node",
          -- attach to an already running node process with --inspect flag
          -- default port: 9222
          request = "attach",
          -- allows us to pick the process using a picker
          processId = require("dap.utils").pick_process,
          -- name of the debug action
          name = "Attach debugger to existing `node --inspect` process",
          -- for compiled languages like TypeScript or Svelte.js
          sourceMaps = true,
          -- resolve source maps in nested locations while ignoring node_modules
          resolveSourceMapLocations = { "${workspaceFolder}/**", "!**/node_modules/**" },
          -- path to src in vite based projects (and most other projects as well)
          cwd = "${workspaceFolder}/src",
          -- we don't want to debug code inside node_modules, so skip it!
          skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
        },
      }
    end
  end,
}
