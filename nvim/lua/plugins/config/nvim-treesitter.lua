return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({
      "bash",
      "c_sharp",
      "caddy",
      "css",
      "csv",
      "diff",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "go",
      "graphql",
      "hcl",
      "html",
      "http",
      "javascript",
      "jsdoc",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "mermaid",
      "nginx",
      "php",
      "prisma",
      "python",
      "rust",
      "scss",
      "sql",
      "svelte",
      "terraform",
      "toml",
      "tsx",
      "typescript",
      "vhs",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
      "zig",
    }, {
      sync_install = false,
      auto_install = true,
      max_jobs = 4,
    })
    -- treesitter doesn't start automatically anymore,
    -- so we need to start it manually on filetype detection
    vim.api.nvim_create_autocmd("Filetype", {
      callback = function(args)
        local ok, treesitter = pcall(require, "nvim-treesitter")
        if not ok or not treesitter then
          return
        end
        if not vim.list_contains(treesitter.get_installed(), vim.treesitter.language.get_lang(args.match)) then
          return
        end
        vim.treesitter.start(args.buf)
      end,
    })
  end,
}
