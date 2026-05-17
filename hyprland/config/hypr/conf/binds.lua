-- SUPER key
local mainMod = "SUPER"

-- Actions
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("kitty")) -- Open terminal
hl.bind(mainMod .. " + Q", hl.dsp.window.close()) -- Close current window
hl.bind(
  mainMod .. " + M",
  hl.dsp.exec_cmd("loginctl terminate-session $XDG_SESSION_ID")
) -- Exit Hyprland
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" })) -- Toggle floating
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen()) -- Fullscreen
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("wofi --show drun"))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo()) -- dwindle
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))

hl.bind(
  mainMod .. " + SHIFT + B",
  hl.dsp.exec_cmd("~/.config/scripts/reload-waybar.sh")
) -- Reload Waybar

hl.bind(
  mainMod .. " + SHIFT + W",
  hl.dsp.exec_cmd("~/.config/scripts/reload-hyprpaper.sh")
) -- Reload hyprpaper after changing wallpaper

-- hl.bindn("Escape", hl.dsp.closewindow("floating"))
-- hl.bindn("Escape", hl.dsp.exec_cmd("pkill wofi"))

hl.bind(
  "XF86AudioRaiseVolume",
  hl.dsp.exec_cmd("wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+")
)
hl.bind(
  "XF86AudioLowerVolume",
  hl.dsp.exec_cmd("wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-")
)
hl.bind(
  "XF86MonBrightnessUp",
  hl.dsp.exec_cmd("brightnessctl set 10%+")
)
hl.bind(
  "XF86MonBrightnessDown",
  hl.dsp.exec_cmd("brightnessctl set 10%-")
)
hl.bind(
  "XF86AudioMute",
  hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")
)
hl.bind(
  "XF86AudioMicMute",
  hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle")
)
hl.bind("XF86WLAN", hl.dsp.exec_cmd("nmcli radio wifi toggle"))
hl.bind("XF86Refresh", hl.dsp.exec_cmd("xdotool key F5"))

hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind(mainMod .. " + SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m region"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
for i = 1, 7 do
    local key = i
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + 8",         hl.dsp.workspace.toggle_special("terminal"))
hl.bind(mainMod .. " + 9",         hl.dsp.workspace.toggle_special("code"))
hl.bind(mainMod .. " + 0",         hl.dsp.workspace.toggle_special("browser"))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })