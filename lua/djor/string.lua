local M = {}

M.trim = function(s)
  return (s:gsub("^%s*(.-)%s*$", "%1"))
end

M.start_with = function(s, start)
  return s:sub(1, #start) == start
end

M.end_with = function(s, ending)
  return ending == "" or s:sub(- #ending) == ending
end

return M
