--[[
██╗    ██╗██╗██████╗  █████╗ ██████╗ 
██║    ██║██║██╔══██╗██╔══██╗██╔══██╗
██║ █╗ ██║██║██████╔╝███████║██████╔╝
██║███╗██║██║██╔══██╗██╔══██║██╔══██╗
╚███╔███╔╝██║██████╔╝██║  ██║██║  ██║
 ╚══╝╚══╝ ╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝                                     
]]

--[[
######################
    # Load libraries     #
    ######################
]]

local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
-------------------------------------------------------
--[[
    ######################
    # Set wallpaper      #
    ######################
]]

local function set_wallpaper(s)
    if beautiful.wallpaper then
        local wallpaper = type(beautiful.wallpaper) == "function" and beautiful.wallpaper(s) or beautiful.wallpaper
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

screen.connect_signal("property::geometry", set_wallpaper)

-------------------------------------------------------

--[[
    ######################
    # widgets            #
    ######################
]]

-- Clock widget
local mytextclock = wibox.widget.textclock()

-- Menu
local mylauncher = require("configuration.widgets.myawesomemenu")
-------------------------------------------------------


--[[
    ######################
    # Setup the wibar    #
    ######################
]]

mywibar = awful.screen.connect_for_each_screen(function(s)
    set_wallpaper(s)

    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

    -- Create widgets for each screen
    s.mypromptbox = awful.widget.prompt()
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
        layout  = wibox.layout.fixed.vertical,
        widget_template = {
            {
                {
                    id = 'text_role',
                    widget = wibox.widget.textbox,
                },
                margins = 5,
                widget = wibox.container.margin,
            },
            id = 'background_role',
            widget = wibox.container.background,
        },
    }

    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
        layout  = {
            layout = wibox.layout.flex.vertical,  -- Vertical
        },
    }

    s.mywibox = awful.wibar({ 
        position = "left", 
        screen = s, 
        width = 33,
    })

    -- Arrange widgets in the wibar
    s.mywibox:setup {
        layout = wibox.layout.align.vertical,
        { -- Left widgets
            layout = wibox.layout.fixed.vertical,
            mylauncher,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.vertical,
            wibox.widget.systray(),
            mytextclock,
            s.mylayoutbox, -- Make sure layoutbox is included
        },
    }

    -- Connect layoutbox clicks to change layouts
    s.mylayoutbox:buttons(gears.table.join(
        awful.button({}, 1, function() -- Left click
            awful.layout.inc(1) -- Change to next layout
        end),
        awful.button({}, 3, function() -- Right click
            awful.layout.inc(-1) -- Change to previous layout
        end)
    ))
end)

return mywibar
