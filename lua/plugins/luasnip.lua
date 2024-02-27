function init_lua_snip()
  local ls = require("luasnip")
  local s = ls.snippet
  local sn = ls.snippet_node
  local t = ls.text_node
  local i = ls.insert_node
  local f = ls.function_node
  local c = ls.choice_node
  local d = ls.dynamic_node
  local r = ls.restore_node
  local fmt = require("luasnip.extras.fmt").fmt

  ls.add_snippets("lua", {
    s({ trig = "req" }, {
      t("local "),
      i(1, "name"),
      t(" = require('"),
      i(2, "module"),
      t("')"),
    }),
    s({ trig = "func" }, {
      t("function("),
      i(1, "args"),
      t(")"),
      i(0),
      t("end"),
    }),
  })

  ls.add_snippets("go", {
    -- s({ trig = "if err" }, {
    --   t("if err != nil {"),
    --   i(0, "return"),
    --   t("}"),
    -- }),
    s({ "if err", fmt([[
  if err != nil {
    return {}
  }]], { i(1) })
    })
  })

  vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
  vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
  vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

  vim.keymap.set({ "i", "s" }, "<C-E>", function()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end, { silent = true })
end

init_lua_snip()

return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",
  config = function()
    init_lua_snip()
  end,
}
