return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter", -- Se carga solo cuando empiezas a escribir
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true, -- Usa Treesitter para ser más inteligente
        ts_config = {
          lua = { "string" }, -- No añadir pares en strings de Lua
          javascript = { "template_string" },
        },
      })

      -- Si usas nvim-cmp, esto hace que al aceptar un autocompletado de función,
      -- se añadan los paréntesis automáticamente.
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
}
