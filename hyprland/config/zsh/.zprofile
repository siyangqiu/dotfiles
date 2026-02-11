if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec 2>/dev/null 1>/dev/null Hyprland
fi