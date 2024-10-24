-- ~/.config/awesome/themes/tokyo-night/theme.lua
local theme = {}

-- Fuente
theme.font          = "CaskaydiaCove Nerd Font"

-- Paleta de colores "Tokyo Night"
theme.bg_normal     = "#1a1b26" -- Fondo general (negro azulado)
theme.bg_focus      = "#414868" -- Fondo cuando está enfocado (azul grisáceo)
theme.bg_urgent     = "#f7768e" -- Fondo urgente (rosa)
theme.bg_minimize   = "#1e2030" -- Fondo para minimizar
theme.bg_systray    = theme.bg_normal -- Fondo del systray

theme.fg_normal     = "#c0caf5" -- Texto normal (blanco suave)
theme.fg_focus      = "#7aa2f7" -- Texto enfocado (azul claro)
theme.fg_urgent     = "#ffffff" -- Texto urgente (blanco)
theme.fg_minimize   = "#565f89" -- Texto minimizado (gris oscuro)

-- Bordes de ventana
theme.border_width  = 2
theme.border_normal = "#1e2030" -- Borde de ventana inactiva (gris oscuro)
theme.border_focus  = "#7aa2f7" -- Borde de ventana activa (azul)
theme.border_marked = "#f7768e" -- Borde de ventana marcada (rosa)

-- Gaps (espaciado entre ventanas)
theme.useless_gap   = 10

-- Iconos para el taglist (barra de escritorios)
theme.taglist_squares_sel   = "~/.config/awesome/themes/tokyo-night/taglist/square_sel.png"
theme.taglist_squares_unsel = "~/.config/awesome/themes/tokyo-night/taglist/square_unsel.png"

-- Fondo para la barra de tareas
theme.tasklist_bg_focus = "#292e42" -- Fondo de ventana enfocada en la barra de tareas

-- Iconos para los layouts (disposiciones de ventana)
theme.layout_tile       = "~/.config/awesome/themes/tokyo-night/layouts/tile.png"
theme.layout_floating   = "~/.config/awesome/themes/tokyo-night/layouts/floating.png"

-- Título y botones de la ventana
theme.titlebar_close_button_normal = "~/.config/awesome/themes/tokyo-night/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = "~/.config/awesome/themes/tokyo-night/titlebar/close_focus.png"

-- Fondo del escritorio (wallpaper)
theme.wallpaper = "~/.config/awesome/themes/tokyo-night/Pine_Forest_inanimated.png"

-- Configuración del systray
theme.systray_icon_spacing = 5

-- Retorna la tabla del tema para que Awesome la use
return theme

