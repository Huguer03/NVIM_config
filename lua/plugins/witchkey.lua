return{
    {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    win = {
    border = "rounded", -- Bordes redondeados para que se vea moderno
    padding = { 1, 2 }, -- Espaciado interno
  },
  layout = {
    align = "center", -- Centra los comandos en el panel
  },
  }
}
}
