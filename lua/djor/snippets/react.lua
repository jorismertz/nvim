local snippets = require('djor.snippets')
local M = {}

M.use_effect = function()
  return {
    "useEffect(() => {",
    "   $1",
    "}, [])"
  }
end

M.use_state = function()
  local name = vim.fn.input("Variable name: ")
  local line = string.format(
  "const [%s, set%s] = useState($1)",
  name,
  name:sub(1, 1):upper()..name:sub(2)
  )

  return {line}
end

M.use_ref = function()
  local name = vim.fn.input("Variable name: ")
  local line = string.format(
  "const %s = useRef<HTMLElement>($1)",
  name
  )

  return {line}
end

M.set_keymaps = function(opts)
  vim.keymap.set('n', '<leader>ue', function()
    snippets.insert(M.use_effect())
  end, opts)

  vim.keymap.set('n', '<leader>us', function()
    snippets.insert(M.use_state())
  end, opts)
end

return M


