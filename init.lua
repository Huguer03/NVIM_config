require("config.lazy")

vim.opt.wrap = true            -- Activa el ajuste de línea (wrapping)
vim.opt.linebreak = true       -- Rompe la línea por palabras, no a mitad de una letra
vim.opt.breakindent = true     -- Mantiene la indentación en la línea envuelta

-- Configuración de indentación a 4 espacios
vim.opt.tabstop = 4      -- Ancho visual de un carácter de tabulación
vim.opt.softtabstop = 4  -- Número de espacios que se insertan al pulsar Tab
vim.opt.shiftwidth = 4   -- Espacios usados al indentar (con >>, << o autoindent)
vim.opt.expandtab = true -- Convierte los tabs en espacios automáticamente

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

-- Remapear j y k para que se muevan por líneas visuales
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Opciones de interfaz
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus" -- Lo que configuramos antes para copiar/pegar
vim.opt.termguicolors = true      -- Para que Treesitter y los temas se vean bien

-- Atajos de teclado (Keymaps)
vim.keymap.set("i", "jk", "<Esc>", { desc = "Salir del modo insertar con jk" })

local ls = require("luasnip")

-- Saltar al siguiente hueco del snippet (hacia adelante)
vim.keymap.set({"i", "s"}, "<C-j>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, {silent = true})

-- Saltar al hueco anterior (hacia atrás)
vim.keymap.set({"i", "s"}, "<C-k>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, {silent = true})

-- Activar corrección ortográfica
vim.opt.spell = true

-- Configurar idiomas: 
-- en: inglés, es: castellano, eu: euskera
vim.opt.spelllang = { "en", "es", "eu" }

-- Opcional: No marcar como error palabras que empiezan con mayúscula a mitad de frase
vim.opt.spellcapcheck = ""
