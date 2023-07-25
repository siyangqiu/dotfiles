if [ -z "$(pidof hyprpaper)" ]; then
    exec hyprpaper
else
    killall hyprpaper
fi
