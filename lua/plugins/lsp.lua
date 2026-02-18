return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp", -- Necesario para el autocompletado
    },
    config = function()
      -- 1. Iniciar Mason para gestionar los binarios
      require("mason").setup({PATH = "prepend"})

      -- 2. Asegurar la instalación de los servidores (incluyendo Texlab para LaTeX)
      require("mason-lspconfig").setup({
        ensure_installed = { 
          "lua_ls", 
          "pyright", 
          "texlab",        -- Soporte para LaTeX
          "rust_analyzer",  -- Soporte para Rust
	  "marksman"
        },
      })

      -- 3. Configuración de capacidades para nvim-cmp
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- 4. Lista de servidores a habilitar
      local servers = { 
        "lua_ls", "pyright", "texlab", "fortls", "rust_analyzer", "marksman" 
      }

      -- 5. Configuración moderna (Nvim 0.11+) siguiendo tu documentación
      for _, server in ipairs(servers) do
        -- Usamos vim.lsp.config en lugar del antiguo framework lspconfig
        vim.lsp.config(server, {
          capabilities = capabilities,
        })
        
        -- Habilitar el servidor de forma nativa
        vim.lsp.enable(server)
      end

      -- 6. Configuraciones específicas adicionales
      
      -- LaTeX (Texlab)
      vim.lsp.config("texlab", {
        settings = {
          texlab = {
            build = {
              onSave = true,
              executable = "latexmk",
              args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
            },
            forwardSearch = {
              executable = "zathura", -- O el visor que uses (okular, etc)
            },
          },
        },
      })

      -- Lua (para evitar el aviso de global 'vim')
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } }
          }
        }
      })
    end,
  },
}
