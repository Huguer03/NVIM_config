return {
  {
    "tanvirtin/monokai.nvim",
    lazy = false, -- Queremos que el tema se cargue al iniciar
    priority = 1000, -- Asegura que se cargue antes que otros plugins
    config = function()
      -- Cargar el esquema de colores
      require('monokai').setup({
          palette = require('monokai').bright
      })
    end,
  },
}
