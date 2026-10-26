stds.nvim = {
  read_globals = { "jit" },
}

std = "lua51+nvim"

max_line_length = false

read_globals = {
  "describe",
  "it",
  "before_each",
  "after_each",
  "assert",
}

globals = {
  "_G",
  "stds",
  "std",
  "globals",
  "read_globals",
  "vim",
}
