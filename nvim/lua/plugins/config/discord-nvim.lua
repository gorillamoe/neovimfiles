local get_dir = require("helper").get_project_dir_path_if_exists

return {
  "mistweaverco/discord.nvim",
  dir = get_dir("discord.nvim"),
  opts = {
    silence_discord_socket_errors = true,
  },
}
