--[[
██████╗ ██╗   ██╗██╗     ███████╗███████╗
██╔══██╗██║   ██║██║     ██╔════╝██╔════╝
██████╔╝██║   ██║██║     █████╗  ███████╗
██╔══██╗██║   ██║██║     ██╔══╝  ╚════██║
██║  ██║╚██████╔╝███████╗███████╗███████║
╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝╚══════╝
]]


--[[
    ################################
    # Load the essential libraries #
    ################################
]]

local awful = require("awful")
local beautiful = require("beautiful")
-------------------------------------------------------
--[[
    ###################################
    # Difine the window manager rules #
    ###################################
]]

awful.rules.rules = {
    -- General rules for all clients
    {
        rule = {},
        properties = {
            border_width = beautiful.border_width,    -- Set the border width
            border_color = beautiful.border_normal,   -- Set the normal border color
            focus = awful.client.focus.filter,        -- Focus filter for clients
            raise = true,                             -- Raise the client when it gains focus
            keys = clientkeys,                        -- Bind key actions to the client
            buttons = clientbuttons,                  -- Bind mouse actions to the client
            screen = awful.screen.preferred,          -- Use the preferred screen
            placement = awful.placement.no_overlap + awful.placement.no_offscreen  -- Prevent overlap and offscreen placement
        }
    },

    -- Rules for floating clients
    {
        rule_any = {
            instance = {
                "DTA",             -- Firefox addon DownThemAll
                "copyq",           -- CopyQ clipboard manager
                "pinentry",        -- Password entry dialog
            },
            class = {
                "Arandr",          -- Screen layout manager
                "Blueman-manager", -- Bluetooth manager
                "Tor Browser",     -- Browser requiring fixed size to avoid fingerprinting
                "Wpa_gui",         -- WPA GUI for network management
            },
            name = {
                "Event Tester",    -- Window used for xev testing
            },
            role = {
            }
        },
        properties = { floating = true }  -- Set these clients to float
    },

    -- Enable titlebars for normal clients and dialogs
    {
        rule_any = { type = { "normal", "dialog" } },
        properties = { titlebars_enabled = true }  -- Show titlebars
    },
}

return awful.rules.rules
