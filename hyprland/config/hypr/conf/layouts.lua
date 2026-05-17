-- dwindle {
--     # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
--     # pseudotile = true # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
--     preserve_split = true # you probably want this
-- }

-- master {
--     # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
--     # new_status = master
-- }

hl.config({
  dwindle = {
    --   force_split                  = 0,
      preserve_split               = true,
    --   smart_split                  = false,
    --   smart_resizing               = true,
    --   permanent_direction_override = false,
    --   special_scale_factor         = 1,
    --   split_width_multiplier       = 1.0,
    --   use_active_for_splits        = true,
    --   default_split_ratio          = 1.0,
    --   split_bias                   = 0,
    --   precise_mouse_move           = false,
  },
})
