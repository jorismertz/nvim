local M = {}

local function get_cursor_pos_from_snippet(lines)
  local cursor_pos = { 0, 0 } 
  for i, line in ipairs(lines) do
    if string.find(line, "$1") then
      cursor_pos[1] = i
      cursor_pos[2] = string.find(line, "$1")
      break
    end
  end
  return cursor_pos
end

local clean_snippet_lines = function(lines)
  local cleaned_lines = {}
  for _, line in ipairs(lines) do
    local cleaned_line = string.gsub(line, "%$%d", "")
    table.insert(cleaned_lines, cleaned_line)
  end
  return cleaned_lines
end

M.insert = function(lines)
  local pos = vim.api.nvim_win_get_cursor(0)
  local offsets = get_cursor_pos_from_snippet(lines)
  local clean = clean_snippet_lines(lines)

  vim.api.nvim_put(clean, "l", true, true)

  if offsets[1] ~= 0 and offsets[2] ~= 0 then
    vim.api.nvim_win_set_cursor(0, {
      pos[1] + offsets[1], -- Row
      pos[2] + offsets[2] - 1 -- Column
    })
  end

  vim.cmd("startinsert")
end

return M
