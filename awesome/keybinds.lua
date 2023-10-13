local gears = require("gears")
local awful = require("awful")
local naughty = require("naughty")
local wibox = require("wibox")

require("awful.autofocus")

-- Notification library
local menubar       = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
local volume_widget = require("awesome-wm-widgets.pactl-widget.volume")

-- {{{ Mouse bindings
root.buttons(gears.table.join(
    awful.button({}, 3, function() mymainmenu:toggle() end)
))
-- }}}

-- Help Groups
local groups = {
    applications = "applications",
    awesome = "awesome",
    client = "client",
    launcher = "launcher",
    layout = "layout",
    notifications = "notifications",
    screen = "screen",
    resolution = "resolution",
    tag = "tag",
    window = "window",
}

-- Applications
local browser = "brave-browser"
local terminal = "kitty"
local calendar = "~/.local/share/applications/Cron.desktop"
local notes = "md.obsidian.Obsidian"

-- {{{ Key bindings
local globalkeys = gears.table.join(
    awful.key({ modkey, }, "s", hotkeys_popup.show_help,
        { description = "show help", group = groups.awesome }),
    awful.key({ modkey, }, "Left", awful.tag.viewprev,
        { description = "view previous", group = groups.tag }),
    awful.key({ modkey, }, "Right", awful.tag.viewnext,
        { description = "view next", group = groups.tag }),
    awful.key({ modkey, }, "Escape", awful.tag.history.restore,
        { description = "go back", group = groups.tag }),

    awful.key({ modkey }, "j",
        function()
            awful.client.focus.bydirection("down")
            if client.focus then client.focus:raise() end
        end,
        { description = "focus down", group = groups.window }),
    awful.key({ modkey }, "k",
        function()
            awful.client.focus.bydirection("up")
            if client.focus then client.focus:raise() end
        end,
        { description = "focus up", group = groups.window }),
    awful.key({ modkey }, "h",
        function()
            awful.client.focus.bydirection("left")
            if client.focus then client.focus:raise() end
        end,
        { description = "focus left", group = groups.window }),
    awful.key({ modkey }, "l",
        function()
            awful.client.focus.bydirection("right")
            if client.focus then client.focus:raise() end
        end,
        { description = "focus right", group = groups.window }),
    awful.key({ modkey, }, "w", function() mymainmenu:show() end,
        { description = "show main menu", group = groups.awesome }),

    -- Layout manipulation
    awful.key({ modkey, "Shift" }, "j", function() awful.client.swap.byidx(1) end,
        { description = "swap with next client by index", group = groups.client }),
    awful.key({ modkey, "Shift" }, "k", function() awful.client.swap.byidx(-1) end,
        { description = "swap with previous client by index", group = groups.client }),
    awful.key({ modkey, "Control" }, "j", function() awful.screen.focus_relative(1) end,
        { description = "focus the next screen", group = groups.screen }),
    awful.key({ modkey, "Control" }, "k", function() awful.screen.focus_relative(-1) end,
        { description = "focus the previous screen", group = groups.screen }),
    awful.key({ modkey, }, "u", awful.client.urgent.jumpto,
        { description = "jump to urgent client", group = groups.client }),
    awful.key({ modkey, }, "Tab",
        function()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        { description = "go back", group = groups.client }),

    -- Resolution changes
    awful.key({ modkey, "Control", "Shift" }, "s", function()
            awful.spawn("xrandr --output DisplayPort-0 --mode 2560x1440")
            awesome.restart()
        end,
        { description = "set streaming resolution", group = groups.resolution }),
    awful.key({ modkey, "Control", "Shift" }, "n", function()
            awful.spawn("xrandr --output DisplayPort-0 --mode 3840x2160")
            awesome.restart()
        end,
        { description = "set normal resolution", group = groups.resolution }),

    -- Standard program
    awful.key({ modkey, "Control" }, "r", awesome.restart,
        { description = "reload awesome", group = groups.awesome }),
    awful.key({ modkey, "Shift" }, "q", awesome.quit,
        { description = "quit awesome", group = groups.awesome }),
    awful.key({ modkey, "Control" }, "l", function() awful.tag.incmwfact(0.05) end,
        { description = "increase master width factor", group = groups.layout }),
    awful.key({ modkey, "Control" }, "h", function() awful.tag.incmwfact(-0.05) end,
        { description = "decrease master width factor", group = groups.layout }),
    awful.key({ modkey, "Shift" }, "h", function() awful.tag.incnmaster(1, nil, true) end,
        { description = "increase the number of master clients", group = groups.layout }),
    awful.key({ modkey, "Shift" }, "l", function() awful.tag.incnmaster(-1, nil, true) end,
        { description = "decrease the number of master clients", group = groups.layout }),
    awful.key({ modkey, "Shift", "Control" }, "h", function() awful.tag.incncol(1, nil, true) end,
        { description = "increase the number of columns", group = groups.layout }),
    awful.key({ modkey, "Shift", "Control" }, "l", function() awful.tag.incncol(-1, nil, true) end,
        { description = "decrease the number of columns", group = groups.layout }),
    awful.key({ modkey, "Shift" }, "space", function() awful.layout.inc(awful.layout.layouts, 1) end,
        { description = "decrease the number of columns", group = groups.layout }),
    awful.key({ modkey, "Control" }, "d", function()
            naughty.toggle()
        end,
        { description = "toggle do not disturb", group = groups.notifications }),

    awful.key({ modkey, "Control" }, "n",
        function()
            local c = awful.client.restore()
            -- Focus restored client
            if c then
                c:emit_signal(
                    "request::activate", "key.unminimize", { raise = true }
                )
            end
        end,
        { description = "restore minimized", group = groups.client }),

    -- Prompt
    awful.key({ modkey }, "r", function() awful.screen.focused().mypromptbox:run() end,
        { description = "run prompt", group = groups.launcher }),
    awful.key({ modkey }, "space", function() awful.spawn('rofi -show drun') end,
        { description = "rofi menu", group = groups.launcher }),

    awful.key({ modkey }, "x",
        function()
            awful.prompt.run {
                prompt       = "Run Lua code: ",
                textbox      = awful.screen.focused().mypromptbox.widget,
                exe_callback = awful.util.eval,
                history_path = awful.util.get_cache_dir() .. "/history_eval"
            }
        end,
        { description = "lua execute prompt", group = groups.awesome }),
    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end,
        { description = "show the menubar", group = groups.launcher }),

    -- Audio
    awful.key({}, "XF86AudioRaiseVolume", function() volume_widget:inc(5) end),
    awful.key({}, "XF86AudioLowerVolume", function() volume_widget:dec(5) end),
    awful.key({}, "XF86AudioMute", function() volume_widget:toggle() end),

    -- Application Shortcuts
    awful.key({ modkey }, "Return", function() awful.spawn(terminal) end,
        { description = "open a terminal", group = groups.applications }
    ),
    awful.key({ modkey }, "b", function() awful.spawn(browser) end,
        { description = "open browser", group = groups.applications }
    ),
    awful.key({ modkey, "Control" }, "c", function() awful.spawn.with_shell("gio launch " .. calendar) end,
        { description = "open calendar", group = groups.applications }
    ),
    awful.key({ modkey, "Shift" }, "n", function() awful.spawn("flatpak run " .. notes) end,
        { description = "open notes", group = groups.applications }
    )
)

clientkeys = gears.table.join(
    awful.key({ modkey, }, "f",
        function(c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        { description = "toggle fullscreen", group = groups.client }),
    awful.key({ modkey, "Shift" }, "c", function(c) c:kill() end,
        { description = "close", group = groups.client }),
    awful.key({ modkey }, "q", function(c) c:kill() end,
        { description = "close", group = groups.client }),
    awful.key({ modkey, "Control" }, "space", awful.client.floating.toggle,
        { description = "toggle floating", group = groups.client }),
    awful.key({ modkey, "Control" }, "Return", function(c) c:swap(awful.client.getmaster()) end,
        { description = "move to master", group = groups.client }),
    awful.key({ modkey, }, "o", function(c) c:move_to_screen() end,
        { description = "move to screen", group = groups.client }),
    awful.key({ modkey, }, "t", function(c) c.ontop = not c.ontop end,
        { description = "toggle keep on top", group = groups.client }),
    awful.key({ modkey, }, "n",
        function(c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end,
        { description = "minimize", group = groups.client }),
    awful.key({ modkey, }, "m",
        function(c)
            c.maximized = not c.maximized
            c:raise()
        end,
        { description = "(un)maximize", group = groups.client }),
    awful.key({ modkey, "Control" }, "m",
        function(c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end,
        { description = "(un)maximize vertically", group = groups.client }),
    awful.key({ modkey, "Shift" }, "m",
        function(c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end,
        { description = "(un)maximize horizontally", group = groups.client })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    tag:view_only()
                end
            end,
            { description = "view tag #" .. i, group = groups.tag }),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    awful.tag.viewtoggle(tag)
                end
            end,
            { description = "toggle tag #" .. i, group = groups.tag }),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end,
            { description = "move focused client to tag #" .. i, group = groups.tag }),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:toggle_tag(tag)
                    end
                end
            end,
            { description = "toggle focused client on tag #" .. i, group = groups.tag })
    )
end

clientbuttons = gears.table.join(
    awful.button({}, 1, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
    end),
    awful.button({ modkey }, 1, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}
