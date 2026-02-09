next=$(ls ~/.config/hypr/wallpapers/ | shuf -n 1)

hyprctl hyprpaper preload ~/.config/hypr/wallpapers/$next
hyprctl hyprpaper wallpaper  DP-2,~/.config/hypr/wallpapers/$next
hyprctl hyprpaper wallpaper  DP-3,~/.config/hypr/wallpapers/$next
hyprctl hyprpaper unload all
