#!/usr/bin/env bash

OUTPUT="eDP-1"
DEVICE=$(
  for d in /sys/bus/iio/devices/iio:device*; do
    [ "$(cat "$d/name")" = "accel_3d" ] && echo "$d" && break
  done
)
SLEEP=1
SCRIPT="/home/siyangqiu/.local/bin/lisgd-touchscreen.sh"

LAST=""

while true; do
    X=$(cat "$DEVICE/in_accel_x_raw")

    if [ "$X" -gt 600 ] && [ "$LAST" != "270" ]; then
        swaymsg output "$OUTPUT" transform 270 scale 2
        pkill lisgd
        "$SCRIPT" 90
        LAST="270"

    elif [ "$X" -lt 200 ] && [ "$LAST" != "0" ]; then
        swaymsg output "$OUTPUT" transform 0 scale 2
        pkill lisgd
        "$SCRIPT"
        LAST="0"
    fi

    sleep "$SLEEP"
done
