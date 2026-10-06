if vim.env.NVIM_AS_SCROLLBACK_PAGER then
  return {}
end
vim.cmd("packadd nvim.undotree")
