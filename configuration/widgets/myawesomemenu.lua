--[[
    This widget is the top part of the wibar
]]

--[[
    ######################
    # Load libraries     #
    ######################
]]

local awful = require("awful")
local beautiful = require("beautiful")
-------------------------------------------------------
--[[
    ######################
    # Main menu          #
    ######################
]]

local myawesomemenu = {
    { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { "manual", terminal .. " -e man awesome" },
    { "edit config", editor_cmd .. " " .. awesome.conffile },
    { "restart", awesome.restart },
    { "quit", function() awesome.quit() end },
}

local mymainmenu = awful.menu({
    items = {
        { "awesome", myawesomemenu, beautiful.awesome_icon },
        { "open terminal", terminal }
    }
})

local mylauncher = awful.widget.launcher({ 
    image = beautiful.awesome_icon,
    menu = mymainmenu 
})

return mylauncher
