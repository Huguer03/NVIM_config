return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*", -- Recomendado seguir la versión mayor actual
    build = "make install_jsregexp", -- Opcional: para soporte de Regex avanzado
    dependencies = { "rafamadriz/friendly-snippets" }, -- Opcional: añade miles de snippets listos para usar
    config = function()
      local ls = require("luasnip")
      
      -- Configuración básica
      ls.config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
      })

      -- Cargar snippets personalizados que crearemos a continuación
      require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/snippets/" })
    end,
  },
}
