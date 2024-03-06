pcall(require, "luarocks.loader")
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")

-- Error handling on startup
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Startup Errors",
                     text = awesome.startup_errors })
end


awful.spawn.with_shell("xrandr --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --mode 1920x1080 --pos 1920x0 --rotate normal")
awful.spawn.with_shell("feh --bg-fill /home/joebiden/Pictures/WALLPAPERS/current/1.png --bg-fill /home/joebiden/Pictures/WALLPAPERS/current/2.png")
awful.spawn.with_shell("redshift -P -O 5200")
awful.spawn.with_shell("~/.config/polybar/launch.sh")
awful.spawn.with_shell("picom -b")
awful.spawn.with_shell("copyq")
awful.spawn.raise_or_spawn("firefox")
awful.spawn.raise_or_spawn("discord")   
awful.spawn.raise_or_spawn("spotify")
-- awful.spawn.raise_or_spawn("obsidian")

do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        if in_error then return end
        in_error = true
        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Runtime Error",
                         text = tostring(err) })
        in_error = false
    end)
end

beautiful.init("~/.config/awesome/theme.lua")
beautiful.font = "JetBrains Mono 8"
local terminal = "alacritty"
local editor = "code"
local editor_cmd = terminal .. " -e " .. editor
local modkey = "Mod4"

-- Layouts and tags
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
}
awful.screen.connect_for_each_screen(function(s)
    awful.tag({ "1", "2", "3", "4", "5" }, s, awful.layout.layouts[1])
end)

globalkeys = gears.table.join(
    awful.key({ modkey,           }, "Right",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "Left",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),

    -- Layout manipulation
    awful.key({ modkey,           }, "m", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey }, "e", function () awful.spawn("alacritty -e ranger") end,
              { description = "Opens ranger", group = "launcher" }),
    awful.key({ modkey }, "a", function () awful.spawn("alacritty -e pulsemixer") end,
              { description = "Opens mixer", group = "launcher" }),
    awful.key({ modkey, "Control" }, "e", function () awful.spawn("thunar") end,
              { description = "Opens thunar", group = "launcher" }),
    awful.key({}, "Print", function () awful.util.spawn("flameshot gui") end,
              {description = "Flameshot: take a screenshot", group = "launcher"}),
    awful.key({ modkey,           }, "v", function () awful.spawn("copyq show") end,
              {description = "Opens the clipboard", group = "launcher"}),
    awful.key({ modkey,           }, ".", function () awful.spawn("rofimoji") end,
              {description = "opens emoji wheel", group = "launcher"}),          
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Control" }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),
    awful.key({ modkey            }, "space", function () awful.spawn("rofi -show drun") end,
              {description = "launch rofi in run mode", group = "launcher"}),
    awful.key({ modkey }, "r", function () awful.spawn("alacritty -e btop") end,
              {description = "launch btop in alacritty", group = "launcher"}),
    awful.key({ modkey }, "l", function () awful.spawn("i3lock --clock --indicator --screen=1 --radius=100 --color=00000000 --inside-color=98C37950 --ring-color=98C37950 --insidever-color=61AFEF50 --ringver-color=61AFEF50 --insidewrong-color=E06C7550 --ringwrong-color=E06C7550 --line-color=202020 --keyhl-color=c7c7c775 --bshl-color=c7c7c775") end,
              {description = "lock screen with i3lock", group = "launcher"}),
    awful.key({ modkey            }, "Up",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "Down",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Control" }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
  
-- Media keybindings
    awful.key({ "Mod4" }, "F6", function () awful.spawn("playerctl play-pause") end,
            {description = "Play/Pause media", group = "media"}),
    awful.key({ "Mod4" }, "F5", function () awful.spawn("playerctl previous") end,
            {description = "Previous media track", group = "media"}),
    awful.key({ "Mod4" }, "F7", function () awful.spawn("playerctl next") end,
            {description = "Next media track", group = "media"}),
    awful.key({ "Mod4" }, "F1", function () awful.spawn("pamixer --toggle-mute") end,
            {description = "Mute volume", group = "media"}),
    awful.key({ "Mod4" }, "F2", function () awful.spawn("pamixer --decrease 5") end,
            {description = "Decrease volume", group = "media"}),
    awful.key({ "Mod4" }, "F3", function () awful.spawn("pamixer --increase 5") end,
            {description = "Increase volume", group = "media"}),
    awful.key({ modkey }, "F9", function() awful.spawn("playerctl position -5") end, 
            {description = "skip backward by 5 seconds", group = "media"}),
    awful.key({ modkey }, "F10", function() awful.spawn("playerctl position +5") end,
            {description = "skip forward by 5 seconds", group = "media"})
)

clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey,           }, "c",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey, "Control" }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),
    awful.key({ modkey, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"})
)

for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end
clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)
root.keys(globalkeys)
awful.rules.rules = {
    { rule = { },
      properties = { border_width = 2,
                     border_normal = "#00ff00",
                     border_focus = "#00ff00",

                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },
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
        },       -- e.g. Google Chrome's (detached) Developer Tools.
      }, properties = { floating = true }},
    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = false }
    },

}
client.connect_signal("manage", function (c)
    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        awful.placement.no_offscreen(c)
    end
end)

beautiful.useless_gap = 4
