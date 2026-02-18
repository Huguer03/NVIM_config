return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false, -- No soporta lazy-loading en la nueva versión
    build = ':TSUpdate',
    config = function()
      local ts = require('nvim-treesitter')

      ts.setup({
        install_dir = vim.fn.stdpath('data') .. '/site'
      })
    
      ts.setup({
          enable = true,
          -- Desactiva el resaltado antiguo de Vim para que no haya conflictos
          additional_vim_regex_highlighting = false,
      })

      -- Instalación de lenguajes (incluyendo Quarto)
      ts.install({ 
        "python", "vim", "lua", "rust", "fortran", "bash",
        "latex", "r", "yaml", "markdown", "markdown_inline", 
        "dot" 
      })

      -- Autocomando blindado para el resaltado
      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          local bufnr = args.buf
          local ft = vim.bo[bufnr].filetype
          
          -- Lista negra de tipos de archivo que NO deben usar Treesitter
          local ignore_ft = { 
            "cmp_menu", "cmp_docs", "lazy", "lazy_backdrop", 
            "TelescopePrompt", "notify", "lspinfo", "" 
          }
          
          for _, v in ipairs(ignore_ft) do
            if ft == v then return end
          end

          -- Solo intentar iniciar si el buffer es válido y tiene un lenguaje
          local ok, _ = pcall(vim.treesitter.start, bufnr)
          if not ok then
            -- Si falla silenciosamente, evitamos el mensaje rojo molesto
          end
        end,
      })
    end,
  }
}
