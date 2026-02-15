# 🚀 Configuración de Neovim (0.11+ Nightly)

Este archivo resume los atajos de teclado y la lógica de funcionamiento de tu entorno personalizado para **Quarto**, **LaTeX** y programación general.

---

## 1. ⌨️ Navegación y Edición Básica
* **`jk`**: Salir del modo insertar (equivale a `<Esc>`).
* **`j` / `k`**: Movimiento inteligente por líneas visuales (perfecto para párrafos largos con *wrap*).
* **`y` (yank)**: Copia directamente al portapapeles del sistema.
* **`p` (put)**: Pega desde el portapapeles del sistema.
* **Tabulación**: Configurada a **4 espacios** reales.

---

## 2. 🔍 Búsqueda y Archivos (Telescope)
* **`<leader>ff`**: Buscar archivos por nombre.
* **`<leader>fg`**: Buscar texto dentro de archivos (*Live Grep*).
* **`<leader>fb`**: Listar y cambiar entre buffers abiertos.
* **`<leader>fh`**: Buscar en las etiquetas de ayuda.

---

## 3. ⚓ Gestión de Flujo (Harpoon)
* **`<leader>a`**: Añadir el archivo actual a la lista de Harpoon.
* **`<C-e>`**: Abrir el menú rápido de Harpoon.
* **`<C-h>` / `<C-t>` / `<C-n>` / `<C-s>`**: Saltos rápidos a los archivos 1, 2, 3 y 4 de tu lista.
* **`<C-S-P>` / `<C-S-N>`**: Ir al archivo anterior o siguiente de la lista.

---

## 4. 📝 Snippets y Celdas de Código (LuaSnip + Quarto)
* **`<C-j>`**: Saltar al siguiente hueco del snippet.
* **`<C-k>`**: Saltar al hueco anterior del snippet.

### En archivos `.qmd` (Quarto):
* **`py` + `<Tab>`**: Inserta automáticamente un bloque de Python: ` ```{python} `
* **`rr` + `<Tab>`**: Inserta automáticamente un bloque de R: ` ```{r} `

---

## 5. 🔤 Corrección Ortográfica (Spell Check)
* **Idiomas**: Inglés (`en`), Castellano (`es`) y Euskera (`eu`).
* **`]s` / `[s`**: Saltar a la siguiente o anterior falta de ortografía.
* **`z=`**: Abrir sugerencias de corrección (integrado con Telescope).
* **`zg`**: Añadir palabra al diccionario personal.

---

## 6. 🧪 Soporte Científico (LaTeX / Vimtex)
* **`\ll`**: Iniciar/Detener la compilación automática.
* **`\lv`**: Abrir el visor de PDF (Zathura).
* **`\le`**: Mostrar errores de compilación.

---

## 🎨 Interfaz y Estética
* **Números Híbridos**: Línea actual absoluta y el resto relativas.
* **Wrap**: Ajuste de línea activo con sangría de ruptura inteligente.
* **Status Bar**: Lualine configurada para mostrar modo, rama de git y diagnóstico LSP.
* **Autopairs**: Cierre automático de paréntesis, llaves y comillas.

---

## ⚠️ Notas de Mantenimiento
Si experimentas el error `"Parser could not be created"` en menús flotantes, asegúrate de que el archivo `lua/plugins/treesitter.lua` tenga el filtro para ignorar los tipos de archivo `cmp_menu`, `lazy` y `TelescopePrompt`.
