local DEBOUNCER = vim.uv.new_timer()
local DEBOUNCE_MS = 30000 -- 30 seconds

--- Function to check for mixed indentation in a buffer
--- @param bufnr number Buffer number (0 for current buffer)
--- @return boolean True if mixed indentation is found, false otherwise
--- @return number|nil Line number of the first occurrence of mixed indentation
local function has_mixed_indentation(bufnr)
  bufnr = bufnr or 0
  local has_tab_indent = false
  local has_space_indent = false
  for idx, line in ipairs(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)) do
    local indent = line:match("^(%s+)")
    if indent then
      if indent:find("\t") then
        has_tab_indent = true
      end
      if indent:find(" ") then
        has_space_indent = true
      end
    end

    if has_tab_indent and has_space_indent then
      return true, idx
    end
  end
  return false, nil
end

vim.api.nvim_create_autocmd({ "BufEnter", "TextChanged", "TextChangedI" }, {
  callback = function(args)
    DEBOUNCER:stop()

    DEBOUNCER:start(
      DEBOUNCE_MS,
      0,
      vim.schedule_wrap(function()
        if not vim.api.nvim_buf_is_valid(args.buf) then
          return
        end

        if has_mixed_indentation(args.buf) then
          vim.opt_local.list = true
          vim.opt_local.listchars:append({
            tab = "»·",
            lead = " ",
          })
          vim.notify("Mixed indentation detected", vim.log.levels.WARN)
        else
          vim.opt_local.list = false
        end
      end)
    )
  end,
})
