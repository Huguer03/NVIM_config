local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- Snippet para celda de Python
  s("py", {
    t("```{python}"),
    t({"", " "}), i(1), -- El cursor saltará aquí primero
    t({"", "```"}),
  }),

  -- Snippet para celda de R
  s("rr", {
    t("```{r}"),
    t({"", " "}), i(1),
    t({"", "```"}),
  }),
}
