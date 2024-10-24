--[[
███╗   ███╗ █████╗ ██╗███╗   ██╗███████╗██╗██╗     ███████╗
████╗ ████║██╔══██╗██║████╗  ██║██╔════╝██║██║     ██╔════╝
██╔████╔██║███████║██║██╔██╗ ██║█████╗  ██║██║     █████╗  
██║╚██╔╝██║██╔══██║██║██║╚██╗██║██╔══╝  ██║██║     ██╔══╝  
██║ ╚═╝ ██║██║  ██║██║██║ ╚████║██║     ██║███████╗███████╗
╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝╚═╝     ╚═╝╚══════╝╚══════╝                                                           
]]

--[[
    ###############################
    # Load necessary libraries    #
    ###############################
]]

local awful = require("awful")
require("awful.autofocus") -- I don't know what do this but its so important
local beautiful = require("beautiful")
local menubar = require("menubar")
-------------------------------------------------------
--[[
    ###############################
    # Load Configuration Files    #
    ###############################
]]

local config = { 
    keys = require("configuration.keybindings"),
    mouse = require("configuration.mousebindings"),
    rules = require("configuration.rules"),
    layouts = require("configuration.layouts"),
}

-- Initialize theme
beautiful.init("~/.config/awesome/themes/default/theme.lua")

-- Load rules and layouts
awful.rules.rules = config.rules
awful.layout.layouts = config.layouts
-- Set terminal for applications
menubar.utils.terminal = "kitty"

-- Load signal handlers
require("configuration.signals")
-- Load the wibar
require("configuration.wibar")
-- Load the titlebar
require("configuration.titlebar")
-------------------------------------------------------
--[[
    ###############################
    # Load kybindings and Mouse   #
    ###############################
]]

-- Set mouse and keyboard bindings
root.buttons(config.mouse)
root.keys(config.keys)
