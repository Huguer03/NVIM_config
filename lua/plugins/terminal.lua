return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 15, -- Altura de la terminal
      open_mapping = [[<leader>c]], -- Tu atajo solicitado
      hide_numbers = true, 
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = false, -- Permite usar el atajo incluso en modo inserción
      persist_size = true,
      direction = 'horizontal', -- Se queda abajo
      close_on_exit = true,
      shell = vim.o.shell,
    })
  end
}

