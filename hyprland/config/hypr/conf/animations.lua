-- animations {
--     enabled = false
--     # Animation curves
    
--     bezier = linear, 0, 0, 1, 1
--     bezier = md3_standard, 0.2, 0, 0, 1
--     bezier = md3_decel, 0.05, 0.7, 0.1, 1
--     bezier = md3_accel, 0.3, 0, 0.8, 0.15
--     bezier = overshot, 0.05, 0.9, 0.1, 1.1
--     bezier = crazyshot, 0.1, 1.5, 0.76, 0.92 
--     bezier = hyprnostretch, 0.05, 0.9, 0.1, 1.0
--     bezier = menu_decel, 0.1, 1, 0, 1
--     bezier = menu_accel, 0.38, 0.04, 1, 0.07
--     bezier = easeInOutCirc, 0.85, 0, 0.15, 1
--     bezier = easeOutCirc, 0, 0.55, 0.45, 1
--     bezier = easeOutExpo, 0.16, 1, 0.3, 1
--     bezier = softAcDecel, 0.26, 0.26, 0.15, 1
--     bezier = md2, 0.4, 0, 0.2, 1 # use with .2s duration
--     # Animation configs
--     animation = windows, 1, 3, md3_decel, popin 60%
--     animation = windowsIn, 1, 3, md3_decel, popin 60%
--     animation = windowsOut, 1, 3, md3_accel, popin 60%
--     animation = border, 1, 10, default
--     animation = fade, 1, 3, md3_decel
--     # animation = layers, 1, 2, md3_decel, slide
--     animation = layersIn, 1, 3, menu_decel, slide
--     animation = layersOut, 1, 1.6, menu_accel
--     animation = fadeLayersIn, 1, 2, menu_decel
--     animation = fadeLayersOut, 1, 3, menu_accel
--     animation = workspaces, 1, 3, menu_decel, slide
--     # animation = workspaces, 1, 2.5, softAcDecel, slide
--     # animation = workspaces, 1, 7, menu_decel, slidefade 15%
--     # animation = specialWorkspace, 1, 3, md3_decel, slidefadevert 15%
--     animation = specialWorkspace, 1, 1.5, md3_decel, slidevert
-- }

hl.config({
    animations = {
        enabled = true,
    },
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "slide" })
hl.animation({ leaf = "specialWorkspace",    enabled = false,  speed = 0.5, bezier = "almostLinear", style = "slidevert" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

