local M = {}

M._get_number = function()
  local word = vim.fn.expand("<cword>")
  local parsed_number = word:match("%d+")

  if parsed_number == nil then
    return nil
  end

  return tonumber(parsed_number)
end

-- @param value: number
M._replace_in_word = function(value)
  vim.cmd("normal ciw" .. value)
end

M._quick_maths = function(callback)
  local number = M._get_number()

  if number == nil then
    return
  end

  local result = callback(number)
  M._replace_in_word(result)
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

-- vim.keymap.set('n', '<leader><leader>x', function()
--   -- M.get_number()
--   -- M._replace_number()
--   M.increment()
-- end)
