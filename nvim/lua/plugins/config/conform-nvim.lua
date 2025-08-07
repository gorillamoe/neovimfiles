return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
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
      format_on_save = {
        all = true,
      },
    })
  end,
}
