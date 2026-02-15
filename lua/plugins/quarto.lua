return {
  {
    'quarto-dev/quarto-nvim',
    dependencies = {
      'jmbuhr/otter.nvim', -- Permite LSP "dentro" de los bloques de código
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('quarto').setup({
        lspFeatures = {
          languages = { 'r', 'python', 'julia', 'bash', 'lua' },
          chunks = 'all',
          diagnostics = { enabled = true },
          completion = { enabled = true },
        },
      })
    end
  }
}
