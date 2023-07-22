# The Sway configuration file in ~/.config/sway/config calls this script.
# You should see changes to the status bar after saving this script.
# If not, do "killall swaybar" and $mod+Shift+c to reload the configuration.

# The abbreviated weekday (e.g., "Sat"), followed by the ISO-formatted date
# like 2018-10-06 and the time (e.g., 14:01)
# date_formatted=$(date "+%a %F %H:%M")
date_formatted=$(date +"%A, %b %d %I:%M%p")

# Returns the battery status: "Full", "Discharging", or "Charging".
battery_level=$(cat /sys/class/power_supply/BAT1/capacity)
# Emojis and characters for the status bar
# 💎 💻 💡 🔌 ⚡📁 \|

battery_status=$(cat /sys/class/power_supply/BAT1/status)
if [ $battery_status = "Full" ]
then
	indicator=⚡
fi
if [ $battery_status = "Charging" ]
then 
	indicator=⚡
fi

volume=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))

echo $date_formatted 🔊$volume 🔋$battery_level%$indicator

