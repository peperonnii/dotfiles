-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
require("awful.autofocus")
local hotkeys_popup = require("awful.hotkeys_popup") -- Make sure this line is included
require("awful.hotkeys_popup.keys")

-- Themes define colors, icons, font, and wallpapers.
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
beautiful.font = "JetBrains Mono 8"

-- Autostart applications
awful.spawn.with_shell("xrandr --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --mode 1920x1080 --pos 1920x0 --rotate normal")
awful.spawn.with_shell("feh --bg-fill ~/Pictures/WALLPAPERS/forest1.png --bg-fill ~/Pictures/WALLPAPERS/forest2.jpeg")
awful.spawn.with_shell("redshift -P -O 5200")
awful.spawn.with_shell("picom -b")
awful.spawn.with_shell("copyq")
awful.spawn.with_shell("/home/joebiden/.config/polybar/launch.sh")
awful.spawn.raise_or_spawn("firefox")
awful.spawn.raise_or_spawn("discord")
awful.spawn.raise_or_spawn("spotify")

-- Variable definitions
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
}

-- Key bindings
globalkeys = gears.table.join(
    awful.key({ modkey }, "s", hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ modkey }, "Left", awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey }, "Right", awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    awful.key({ modkey }, "j",
        function ()
            awful.client.focus.byidx(1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),

    -- Standard program
    awful.key({ modkey }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey }, "e", function () awful.spawn("alacritty -e ranger") end,
              { description = "Opens ranger", group = "launcher" }),
    awful.key({}, "Print", function () awful.util.spawn("flameshot gui") end,
              {description = "Flameshot: take a screenshot", group = "launcher"}),
    awful.key({ modkey }, "v", function () awful.spawn("copyq show") end,
              {description = "Opens the clipboard", group = "launcher"}),
    awful.key({ modkey }, ".", function () awful.spawn("rofimoji") end,
              {description = "opens emoji wheel", group = "launcher"}),

    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift" }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),

    awful.key({ modkey }, "l", function () awful.tag.incmwfact(0.05) end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey }, "h", function () awful.tag.incmwfact(-0.05) end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift" }, "h", function () awful.tag.incnmaster(1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift" }, "l", function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h", function () awful.tag.incncol(1, nil, true) end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l", function () awful.tag.incncol(-1, nil, true) end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey }, "space", function () awful.layout.inc(1) end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift" }, "space", function () awful.layout.inc(-1) end,
              {description = "select previous", group = "layout"}),

    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  if c then
                      c:emit_signal("request::activate", "key.unminimize", {raise = true})
                  end
              end,
              {description = "restore minimized", group = "client"}),

    -- Prompt
    awful.key({ modkey }, "r", function () awful.screen.focused().mypromptbox:run() end,
              {description = "run prompt", group = "launcher"}),

    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "launcher"})
)

-- Set keys
root.keys(globalkeys)

-- Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
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
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
          "pinentry",
        },
        class = {
          "Arandr",
          "Blueman-manager",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
          "Wpa_gui",
          "veromix",
          "xtightvncviewer"},
        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "ConfigManager",  -- Thunderbird's about:config.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true }},
}

-- Signals
client.connect_signal("manage", function (c)
    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        awful.placement.no_offscreen(c)
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
