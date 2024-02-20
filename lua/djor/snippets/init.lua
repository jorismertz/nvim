local M = {}

local function get_current_block_indent()
  local curr_line_index = vim.api.nvim_win_get_cursor(0)[1]
  local next_line = vim.api.nvim_buf_get_lines(0, curr_line_index, curr_line_index + 1, false)[1]
  local indent = string.match(next_line, "^%s*")

  return indent
end

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

-- Clean cursor placeholder and prepend the correct indentation
local clean_snippet_lines = function(lines, indent)
  local cleaned_lines = {}
  for _, line in ipairs(lines) do
    local cleaned_line = indent..string.gsub(line, "%$%d", "")
    table.insert(cleaned_lines, cleaned_line)
  end
  return cleaned_lines
end

M.insert = function(lines)
  local pos = vim.api.nvim_win_get_cursor(0)
  local offsets = get_cursor_pos_from_snippet(lines)
  local indent = get_current_block_indent()
  local clean = clean_snippet_lines(lines, indent)

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
