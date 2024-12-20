--[[
████████╗██╗████████╗██╗     ███████╗██████╗  █████╗ ██████╗ 
╚══██╔══╝██║╚══██╔══╝██║     ██╔════╝██╔══██╗██╔══██╗██╔══██╗
   ██║   ██║   ██║   ██║     █████╗  ██████╔╝███████║██████╔╝
   ██║   ██║   ██║   ██║     ██╔══╝  ██╔══██╗██╔══██║██╔══██╗
   ██║   ██║   ██║   ███████╗███████╗██████╔╝██║  ██║██║  ██║
   ╚═╝   ╚═╝   ╚═╝   ╚══════╝╚══════╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝
]]

--[[
    This files controls the buttons and bar above of the windows
]]

--[[
    ###############################
    # Load necessary libraries    #
    ###############################
]]

local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
-------------------------------------------------------
--[[
    ###############################
    # Titlebar Configuration      #
    ###############################
]]

mytitlebar = client.connect_signal("request::titlebars", function(c)
    local buttons = gears.table.join(
        awful.button({}, 1, function() -- Move titlebar with right click 
            c:emit_signal("request::activate", "titlebar", { raise = true }) 
            awful.mouse.client.move(c)
        end),
        awful.button({}, 3, function() -- Resize titlebar with left click
            c:emit_signal("request::activate", "titlebar", { raise = true }) 
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c):setup {
        layout = wibox.layout.align.horizontal,
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout = wibox.layout.fixed.horizontal,
        },
        { -- Center
            {
                align = "center",
                widget = awful.titlebar.widget.titlewidget(c),
            },
            buttons = buttons,
            layout = wibox.layout.flex.horizontal,
        },
        { -- Right
            --awful.titlebar.widget.floatingbutton(c),
            awful.titlebar.widget.maximizedbutton(c),
            --awful.titlebar.widget.stickybutton(c),
            --awful.titlebar.widget.ontopbutton(c),
            awful.titlebar.widget.closebutton(c),
            layout = wibox.layout.fixed.horizontal(),
        },
    }
end)

return mytitlebar
