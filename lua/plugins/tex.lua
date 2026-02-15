return {
  {
    "lervag/vimtex",
    lazy = false, -- Muy importante: Vimtex debe cargarse al inicio para detectar archivos .tex
    init = function()
      -- 1. Elegir el visor de PDF
      -- En Linux se recomienda "zathura", en macOS "skim", en Windows "general"
      vim.g.vimtex_view_method = "zathura"

      -- 2. Configurar el motor de compilación
      vim.g.vimtex_compiler_method = "latexmk"

      -- 3. Ocultar carácteres (Conceal)
      -- Esto hace que los símbolos como \alpha se vean como α en el editor
      vim.g.vimtex_syntax_conceal = {
        additions = 1,
        sections = 1,
        styles = 1,
      }
    end
  }
}
