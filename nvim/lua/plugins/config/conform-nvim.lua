return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters = {
        kulala = {
          command = "kulala-fmt",
          args = { "format", "$FILENAME" },
          stdin = false,
        },
      },
      formatters_by_ft = {
        http = { "kulala" },
        go = { "goimports", "gofmt" },
        javascript = { "deno_fmt", "eslint", "prettier" },
        lua = { "stylua" },
        python = { "autoflake", "black", "isort" },
        terraform = { "terraform_fmt" },
        typescript = { "deno_fmt", "eslint", "prettier" },
        typescriptreact = { "eslint", "prettier" },
      },
      format_on_save = function()
        if conform.is_disabled then
          return false
        end
        return { all = true }
      end,
    })
    conform.is_disabled = false
    conform.toggle = function()
      conform.is_disabled = not conform.is_disabled
      if conform.is_disabled then
        vim.notify("conform.nvim disabled")
      else
        vim.notify("conform.nvim enabled")
      end
    end
    vim.api.nvim_create_user_command("ConformToggle", function()
      conform.toggle()
    end, {})
  end,
}
