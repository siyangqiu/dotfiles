-- # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more

-- # windowrule = workspace 1, onworkspace:s[1], class:negative:(xdg-desktop-portal-gtk|nm-connection-editor|org.pulseaudio.pavucontrol)

-- windowrule = match:class negative:(xdg-desktop-portal-gtk|nm-connection-editor|org.pulseaudio.pavucontrol), match:workspace browser, workspace 1
-- windowrule = match:class app.zen_browser.zen, workspace special:browser silent
-- windowrule = match:class code, workspace special:code silent
-- windowrule = match:class Alacritty, workspace special:terminal silent
-- windowrule = match:class ^(xdg-desktop-portal.*)$, float true
-- windowrule = match:class org.pulseaudio.pavucontrol, float true
-- windowrule = match:class nm-connection-editor, float true


hl.window_rule({
    name = "Move from Special",
    match = {
        class = "negative:(xdg-desktop-portal-gtk|nm-connection-editor|org.pulseaudio.pavucontrol)",
        workspace = "s[true]",
    },
    workspace = "1",
    border_size = 0,
    rounding    = 0, 
})

hl.window_rule({
    name = "Zen Browser",
    match = {
        class = "app.zen_browser.zen"
    },
    workspace = "special:browser silent",
    border_size = 0,
    rounding    = 0, 
})

hl.window_rule({
    name = "Code",
    match = {
        class = "code"
    },
    workspace = "special:code silent",
    border_size = 0,
    rounding    = 0, 
})

hl.window_rule({
    name = "Alacritty",
    match = {
        class = "Alacritty"
    },
    workspace = "special:terminal silent",
    border_size = 0,
    rounding    = 0, 
})

hl.window_rule({
    name = "Float Portal",
    match = {
        class = "^(xdg-desktop-portal.*)$"
    },
    float = true,
})

hl.window_rule({
    name = "Float Audio",
    match = {
        class = "org.pulseaudio.pavucontrol"
    },
    float = true,
})

hl.window_rule({
    name = "Float Network",
    match = {
        class = "nm-connection-editor"
    },
    float = true,
})