local M = {}

M._get_number = function()
  local word = vim.fn.expand("<cword>")
  local parsed_number = word:match("%-?%d+")

  if parsed_number == nil then
    return nil
  end

  return tonumber(parsed_number)
end

-- There is a bug where it doesn't work when the cursor is on the first char of the number
M._find_number_under_cursor = function()
  local current_line = vim.api.nvim_get_current_line()
  local cursor_position = vim.api.nvim_win_get_cursor(0)
  local cursor_column = cursor_position[2]
  -- local cursor_row = cursor_position[1]
  local start_position = cursor_column
  local end_position = cursor_column

  -- Walk backwards until we find the start of the number
  for i = cursor_column, 1, -1 do
    local char = current_line:sub(i, i)
    if char:match("%d") or char == "-" then
      start_position = i
    else
      break
    end
  end

  -- Walk forwards until we find the end of the number
  for i = cursor_column, #current_line, 1 do
    local char = current_line:sub(i, i)
    vim.notify(char)
    if char:match("%d") then
      end_position = i
    else
      break
    end
  end

  return { start_position, end_position }
end

-- @param value: number
M._replace_in_word = function(value)
  -- This doesn't work for negative numbers,
  -- i need to find make a function that finds the word and gives me it's start and end position
  vim.cmd("normal ciw" .. value)
  -- local current_line = vim.api.nvim_get_current_line()
  -- local word = vim.fn.expand("<cword>")
  -- local new_line = current_line:gsub(word, value)
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
    return number + 4
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

vim.keymap.set('n', '<leader><leader>x', function()
  local start = M._find_number_under_cursor()
  vim.notify(vim.inspect(start))
end)
