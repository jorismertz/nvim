local M = {}

---@param str string current line
---@return integer|nil, integer|nil
M._find_checkbox = function(str)
  local start, finish = string.find(str, "%-%s*%[.-%]")
  if start == nil or finish == nil then
    return nil, nil
  end

  return start, finish
end

-- this really is just regex all over again D:
local patterns = {
  checked = "%[%s*x%s*%]",
  unchecked = "%[%s*%]",
}

---@param str string current line
M._toggle_in_string = function(str)
  local start, finish = M._find_checkbox(str)
  if start == nil or finish == nil then
    return str
  end

  local checkbox = string.sub(str, start, finish)

  if checkbox:match(patterns.checked) then
    checkbox = checkbox:gsub(patterns.checked, "[ ]")
  else
    checkbox = checkbox:gsub(patterns.unchecked, "[x]")
  end

  return string.sub(str, 1, start - 1) .. checkbox .. string.sub(str, finish + 1)
end

M.toggle_checkbox = function()
  local current_line = vim.api.nvim_get_current_line()
  vim.api.nvim_set_current_line(M._toggle_in_string(current_line))
end

vim.keymap.set('n', '<C-c>', function()
  M.toggle_checkbox()
end)

-- [ ] test
-- [ ] test1
-- [x] test3
