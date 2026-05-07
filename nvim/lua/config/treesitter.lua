-- Read from site/parsers*.so to get the list of installed parsers,
-- and remove the path and extension to get the parser names
local installed_parsers = vim.fn.globpath(vim.fn.stdpath("data") .. "/site/parser", "*.so", true, true)
for i, parser in ipairs(installed_parsers) do
  installed_parsers[i] = vim.fn.fnamemodify(parser, ":t:r")
end

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    if not vim.list_contains(installed_parsers, args.match) then
      return
    end
    vim.treesitter.start(args.buf)
  end,
})
