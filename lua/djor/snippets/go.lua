local M = {}

M.err_not_nil = function()
  return {
    'if err != nil {',
    '  return $1',
    '}',
  }
end

return M


