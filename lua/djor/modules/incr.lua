local utils = require("djor.utils")
local M = {}

--            start   end       value
-- @return {{ number, number }, number }
M._get_num_pos = function()
  local cursor_pos = vim.api.nvim_win_get_cursor(0)[2] + 1
  local line = vim.api.nvim_get_current_line()

  local start = cursor_pos;
  local finish = 0;

  for i = start, 1, -1 do
    local char = line:sub(i, i)
    if char == "-" and i == 1 then
      start = i
      break
    end

    local found_dash = false

    if char:match("%d") or char == '.' then
      start = i
    elseif char == '-' then
      start = i
      if found_dash then
        break
      end
      found_dash = true
    else
      break
    end
  end

  for i = cursor_pos, utils.len(line), 1 do
    local char = line:sub(i, i)

    if char:match("%d") or char == '.' then
      finish = i
    else
      break
    end
  end

  return { { start, finish }, line:sub(start, finish) }
end

---@param cols { integer, integer }
---@param value integer
M.replace_num_at = function(cols, value)
  local current_line = vim.api.nvim_get_current_line()

  local start = cols[1]
  local finish = cols[2]

  local new_line = current_line:sub(1, start - 1) .. value .. current_line:sub(finish + 1, -1)
  vim.api.nvim_set_current_line(new_line)
end

M._quick_maths = function(callback)
  local num_info = M._get_num_pos()
  local pos = num_info[1]
  local number = num_info[2]

  if number == nil then
    return
  end

  local result = callback(number)
  M.replace_num_at(pos, result)
end

M.increment = function()
  M._quick_maths(function(number)
    return number + 1
  end)
end

M.decrement = function()
  M._quick_maths(function(number)
    return number - 1
  end)
end

vim.keymap.set('n', '<C-s>', function()
  M.increment()
end)

vim.keymap.set('n', '<C-x>', function()
  M.decrement()
end)
