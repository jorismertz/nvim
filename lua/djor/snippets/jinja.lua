local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local s = ls.snippet

-- All snippets assume you're using autopairs.
return {
  expression = s({
      trig = "{%",
      snippetType = "autosnippet"
    },
    fmt("{{% {} %", { i(1) })
  ),
  bracket_spacing = s({
      trig = "{{",
      snippetType = "autosnippet"
    },
    fmt("{{{{ {} ", { i(1) })
  ),

  for_loop = s({ trig = "{% for", },
    fmt([[
      {{% for {} in {} %}}
        {}
      {{% endfor
    ]], { i(1), i(2), i(3) })
  ),
  include = s({
      trig = "{% include",
      snippetType = "autosnippet"
    },
    fmt('{{% include "{}"', { i(1) })
  ),
  block = s({ trig = "{% block", },
    fmt([[
      {{% block {} %}}
        {}
      {{% endblock
    ]], { i(1), i(2) })
  ),
  match = s({ trig = "{% match", },
    fmt([[
      {{% match {} %}}
        {{% when Some with ({}) %}}
      {{% endmatch
    ]], { i(1), i(2) })
  ),
  macro = s({ trig = "{% macro", },
    fmt([[
      {{% macro {}({}) %}}
        {}
      {{% endmacro
    ]], { i(1), i(2), i(3) })
  ),
  if_statement = s({ trig = "{% if", },
    fmt([[
      {{% if {} %}}
        {}
      {{% endif
    ]], { i(1), i(2) })
  ),
  if_let = s({ trig = "{% if let", },
    fmt([[
      {{% if let Some({}) = {} %}}
        {}
      {{% else %}}
        {}
      {{% endif
    ]], { i(1), i(2), i(3), i(4) })
  ),
}
