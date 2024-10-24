--[[
███████╗██╗  ██╗ ██████╗ ██████╗ ████████╗ ██████╗██╗   ██╗████████╗███████╗
██╔════╝██║  ██║██╔═══██╗██╔══██╗╚══██╔══╝██╔════╝██║   ██║╚══██╔══╝██╔════╝
███████╗███████║██║   ██║██████╔╝   ██║   ██║     ██║   ██║   ██║   ███████╗
╚════██║██╔══██║██║   ██║██╔══██╗   ██║   ██║     ██║   ██║   ██║   ╚════██║
███████║██║  ██║╚██████╔╝██║  ██║   ██║   ╚██████╗╚██████╔╝   ██║   ███████║
╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═════╝    ╚═╝   ╚══════╝
]]


--[[
    ################################
    # Load the essential libraries #
    ################################
]]

local menubar = require("menubar")
local gears = require("gears")
local awful = require("awful")
-------------------------------------------------------
--[[
    #################
    # Set variables #
    #################
]]

modkey = "Mod4"
terminal = "kitty"
editor = "nvim"
editor_cmd = terminal .. " -e " .. editor
-------------------------------------------------------
--[[
    ######################################
    # Keyboard keybindings and shortcuts #
    ######################################
]]

globalkeys = gears.table.join(
  -- Shortcuts to open things (group = 'launcher')
  awful.key(  
    { modkey }, 'Return',
    function ()
      awesome.spawn(terminal)
    end,
    { description = "Open the terminal", group = "launcher" }
  ),

  awful.key(  
    { modkey }, 'p',
    function ()
      menubar.show()
    end,
    { description = "Open the menubar", group = "launcher" }
  ),

  -- Application keybindings (group = 'client')
  awful.key({ modkey }, "j",
    function ()
      awful.client.focus.byidx( 1)
    end,
    { description = "focus next by index", group = "client" }
  ),

  awful.key({ modkey }, "k",
    function ()
      awful.client.focus.byidx(-1)
    end,
    { description = "focus previous by index", group = "client" }
  ),

  awful.key(
    { modkey }, 'l',
    function ()
      awful.tag.incmwfact( 0.05)
    end,
    { description = "increase master width factor", group = "client" }
  ), 

  awful.key(
    { modkey }, 'h',
    function ()
      awful.tag.incmwfact(-0.05)
    end,
    { description = "decrease master width factor", group = "client" }
  ), 

  awful.key(
    { modkey, 'Control' }, 'q',
    function ()
      local c = client.focus
      if c then
        c:kill()
      end
    end,
    { description = "close", group = "client" }
  ),

  -- AwesomeWM keybindings (group = 'awesome')
  awful.key(
    { modkey }, 'Left',
    function()
      awful.tag.viewprev()
    end,
    { description = "Switch to left desktop", group = "awesome" }
  ),

  awful.key(
    { modkey }, 'Right',
    function()
      awful.tag.viewnext()
    end,
    { description = 'Switch to right desktop', group = 'awesome' }
  ),

  awful.key(  
    { modkey, 'Control' }, 'r',
    function ()
      awesome.restart()
    end,
    { description = "Restart the window manager", group = 'awesome' }
  ),
  
  awful.key(
    { modkey }, "l",
    function ()
        awful.layout.inc(1) -- Cambia al siguiente layout
    end,
    { description = "Change layout", group = "awesome" }
  )
)

return globalkeys
