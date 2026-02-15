return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- Iconos bonitos
    config = function()
      require('lualine').setup({
        options = {
          -- Temas recomendados: 'tokyonight', 'catppuccin', 'auto'
          theme = 'auto', 
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
          globalstatus = true, -- Barra única al final aunque tengas splits
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
      })
    end
  }
}
