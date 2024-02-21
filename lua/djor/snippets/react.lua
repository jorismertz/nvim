local utils = require('djor.snippets')
local M = {}

local function get_root(bufnr)
  local parser = vim.treesitter.get_parser(bufnr, "typescript")
  local tree = parser:parse()[1]
  return tree:root()
end
--
-- local thingy = [[
-- [(import_statement source: (_) @source (#eq? @source "\"react\""))
-- (import_statement
--   (import_clause
--     (named_imports
--       (import_specifier
--         name: (identifier) @name (#eq? @name "useEffect")
--         )
--       )
--     ))
-- ] @react-import 
-- ]]
--
-- local react_import_query = vim.treesitter.query.parse(
--   "typescript",
--   '(import_statement source: (_) @import (#eq? @import "\"react\""))'
-- )

local function find_import(bufnr, name)
  local root = get_root(bufnr)
  local found = false

  local import_statement_query = vim.treesitter.query.parse("typescript",
  string.format([[(import_statement
  (import_clause
  (named_imports
  (import_specifier
  name: (identifier) @name (#eq? @name "%s")
  )
  )
  ))]], name))

  for _ in import_statement_query:iter_captures(root, 0, 0, -1) do
    found = true
  end

  return found
end

M.resolve_import = function(bufnr, name)
  local exists = find_import(bufnr, name)

  if not exists then
    utils.prepend_lines(0, {
      string.format("import { %s } from \"react\"", name)
    })
    return true
  end
  return false
end

M.use_effect = function(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  M.resolve_import(bufnr, "useEffect")

  utils.insert({
    "useEffect(() => {",
    "   $1",
    "}, [])"
  }, true, -3)

  vim.cmd("startinsert")
end

M.use_state = function(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  local name = vim.fn.input("Variable name: ")
  if name == "" then
    return
  end

  local upper_name = name:sub(1, 1):upper()..name:sub(2)
  local line = string.format(
    "const [%s, set%s] = useState($1)", name, upper_name
  )

  M.resolve_import(bufnr, "useState")
  utils.insert({line}, true, -1)
  vim.cmd("startinsert")
end

M.use_ref = function()
  local name = vim.fn.input("Variable name: ")
  if name == "" then
    return
  end

  local line = string.format(
    "const %s = useRef<HTML$1Element>(null)",
    name
  )

  utils.insert({line}, true, -1)
  vim.cmd("startinsert")
end

return M
