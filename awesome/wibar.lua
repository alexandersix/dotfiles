local gears = require("gears")
local awful = require("awful")
local naughty = require("naughty")
require("awful.autofocus")

-- Widget and layout library
local wibox      = require("wibox")

-- Theme handling library
local beautiful  = require("beautiful")

local bling      = require("bling")
local lain       = require("lain")
local colors     = require("colors")

local xresources = require("beautiful.xresources")
local dpi        = xresources.apply_dpi


-- {{{ Wibar
-- Create a textclock widget
local mytextclock      = wibox.widget.textclock()

-- Create a wibox for each screen and add it
local taglist_buttons  = gears.table.join(
    awful.button({}, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),
    awful.button({}, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
    end),
    awful.button({}, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({}, 5, function(t) awful.tag.viewprev(t.screen) end)
)

local tasklist_buttons = gears.table.join(
    awful.button({}, 1, function(c)
        if c == client.focus then
            c.minimized = true
        else
            c:emit_signal(
                "request::activate",
                "tasklist",
                { raise = true }
            )
        end
    end),
    awful.button({}, 3, function()
        awful.menu.client_list({ theme = { width = 250 } })
    end),
    awful.button({}, 4, function()
        awful.client.focus.byidx(1)
    end),
    awful.button({}, 5, function()
        awful.client.focus.byidx(-1)
    end))

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

local my_tags = {
    tags = {
        {
            names = { " www ", " dev ", " data ", " design ", " misc " },
        },
        {
            names = { " comms ", " mail ", " media ", " cal " },
        }
    }
}

-- Add spacing between tags in wibar
beautiful.taglist_spacing = 2
beautiful.taglist_shape = gears.shape.rounded_rect

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    local screen_index = s.index

    if screen_index == 1 then
        awful.tag(my_tags.tags[screen_index].names, s, awful.layout.layouts[1])
    elseif screen_index == 2 then
        awful.tag(my_tags.tags[screen_index].names, s, bling.layout.horizontal)
    end

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
        awful.button({}, 1, function() awful.layout.inc(1) end),
        awful.button({}, 3, function() awful.layout.inc(-1) end),
        awful.button({}, 4, function() awful.layout.inc(1) end),
        awful.button({}, 5, function() awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen = s,
        -- Removed these to get rid of tabs in the wibar
        -- filter  = awful.widget.tasklist.filter.currenttags,
        -- buttons = tasklist_buttons
    }

    -- Create the wibox
    s.mywibox = awful.wibar({
        position = "top",
        screen = s,
        shape = function(cr, width, height)
            gears.shape.rounded_rect(cr, width, height, 25)
        end,
        stretch = false,
        width = s.workarea.width - dpi(48),
        border_width = dpi(10),
        bg = "#00000044"
    })

    -- Volume widget import
    local volume_widget = require("awesome-wm-widgets.pactl-widget.volume")

    local dnd = function()
        if naughty.is_suspended() then
            return "On"
        else
            return "Off"
        end
    end

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        expand = "none",
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            spacing = dpi(20),
            mylauncher,
            s.mytaglist,
            s.mypromptbox,
            bg = colors.palette.bg0.hex
        },
        {
            layout = wibox.layout.fixed.horizontal,
            mytextclock,
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            -- Do not Disturb
            awful.widget.watch("bash -c 'echo DnD '", 1, function(widget)
                widget:set_text(string.format("DnD: %s", dnd()))
            end),
            -- volume_widget,
            lain.widget.cpu({
                settings = function()
                    widget:set_markup("CPU: " .. cpu_now.usage .. "%")
                end
            }),
            lain.widget.mem({
                settings = function()
                    widget:set_markup("MEM: " .. mem_now.used / 1000 .. "GB")
                end
            }),
            lain.widget.sysload({
                settings = function()
                    widget:set_markup("LOAD: " .. load_1)
                end
            }),
            lain.widget.alsa({
                settings = function()
                    if volume_now.status == "off" then
                        volume_now.level = volume_now.level .. "M"
                    end

                    widget:set_markup("VOL: " .. volume_now.level .. "%")
                end
            }),
            volume_widget({
                widget_type = "arc",
                main_color = require("colors").palette.green.hex,
                mute_color = require("colors").palette.red.hex,
                thickness = 3,
                size = 24,
            }),
            wibox.widget.systray(),
            spacing = dpi(20),
            s.mylayoutbox,
        },
    }
end)
-- }}}
