local awful = require("awful")
require("awful.autofocus")

-- Theme handling library
local beautiful = require("beautiful")

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    {
        rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            buttons = clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen
        }
    },

    -- Floating clients.
    {
        rule_any = {
            instance = {
                "DTA",   -- Firefox addon DownThemAll.
                "copyq", -- Includes session name in class.
                "pinentry",
            },
            class = {
                "1Password",
                "Arandr",
                "Blueman-manager",
                "gnome-calculator",
                "Gpick",
                "Kruler",
                "MessageWin", -- kalarm.
                "org.gnome.Software",
                "Sxiv",
                "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
                "Wpa_gui",
                "veromix",
                "xtightvncviewer",
                "zoom"
            },

            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name = {
                "Event Tester", -- xev.
                "RuneLite",
            },
            role = {
                "AlarmWindow",   -- Thunderbird's calendar.
                "ConfigManager", -- Thunderbird's about:config.
                "pop-up",        -- e.g. Google Chrome's (detached) Developer Tools.
            }
        },
        properties = { floating = true }
    },

    -- Add titlebars to normal clients and dialogs
    {
        rule_any = { type = { "normal", "dialog" }
        },
        properties = { titlebars_enabled = false }
    },

    -- Set mail to open in mail tag
    {
        rule = { class = "Geary" },
        properties = { screen = 2, tag = " mail " }
    },

    -- Set data apps to open in the data tag
    {
        rule = { class = "TablePlus" },
        properties = { screen = 1, tag = " data " }
    },

    -- Set messaging apps to open in comms tag
    {
        rule = { class = "Slack" },
        properties = { screen = 2, tag = " comms " }
    },

    {
        rule = { class = "discord" },
        properties = { screen = 2, tag = " media " }
    },

    {
        rule = { name = "Microsoft Teams" },
        properties = { screen = 2, tag = " comms ", floating = false }
    },

    {
        rule = { name = "Linear" },
        properties = { screen = 2, tag = " media ", floating = false }
    },

    -- Set media apps to open in media tag
    {
        rule = { class = "Cider" },
        properties = { screen = 2, tag = " media " }
    },

    {
        rule = { name = "YouTube Music" },
        properties = { screen = 2, tag = " media ", floating = false }
    },

    -- Set calendar apps to open in the cal tag
    {
        rule = { name = "Cron -.*" },
        properties = { screen = 2, tag = " cal ", floating = false }
    },

    -- Set Steam
    {
        rule_any = { class = { "Steam" } },
        properties = {
            screen = 1,
            tag = " misc ",
            titlebars_enabled = false,
            floating = true,
            border_width = 0,
            border_color = 0,
            size_hints_honor = false,
        },
    }, }
-- }}}
