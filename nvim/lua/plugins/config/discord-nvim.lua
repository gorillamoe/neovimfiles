local get_dir = require("helper").get_project_dir_path_if_exists

return not vim.env.NVIM_AS_SCROLLBACK_PAGER
    and {
      "dont-be-evil-company/discord.nvim",
      dir = get_dir("discord.nvim"),
      opts = {
        silence_discord_socket_errors = true,
      },
    }
  or {}
