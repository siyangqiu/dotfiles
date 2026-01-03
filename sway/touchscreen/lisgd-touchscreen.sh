#!/bin/bash
set -e

ORIENTATION="${1:-normal}"

USER_UID=1000
export XDG_RUNTIME_DIR="/run/user/$USER_UID"
export WAYLAND_DISPLAY="wayland-1"


# Find IPTSD Virtual Touchscreen event node
TOUCH_EVENT=$(
  libinput list-devices |
    awk '
      /IPTSD Virtual Touchscreen/ { found=1 }
      found && /Kernel:/ {
        print $2
        exit
      }
    '
)

if [ -z "$TOUCH_EVENT" ]; then
  echo "Could not find IPTS touchscreen" >&2
  exit 1
fi

case "$ORIENTATION" in
  normal)
    UP=DU; DOWN=UD; LEFT=RL; RIGHT=LR; B_EDGE=B; R_EDGE=R
    ;;
  90)
    UP=RL; DOWN=LR; LEFT=DU; RIGHT=UD; B_EDGE=R; R_EDGE=T
    ;;
  180)
    UP=UD; DOWN=DU; LEFT=LR; RIGHT=RL; B_EDGE=T; R_EDGE=L
    ;;
  270)
    UP=LR; DOWN=RL; LEFT=UD; RIGHT=DU; B_EDGE=L; R_EDGE=B
    ;;
  *)
    echo "Usage: $0 {normal|90|180|270}" >&2
    exit 1
    ;;
esac

exec /usr/bin/lisgd -v \
  -d "$TOUCH_EVENT" \
  -r 20 \
  -t 200 \
  -m 400 \
  -g "3,$UP,*,*,sh -lc 'rofi -show drun'" \
  -g "3,$DOWN,*,*,sh -lc 'pkill -USR1 squeekboard'" \
  -g "4,$DOWN,*,*,sh -lc 'swaymsg kill'" \
  -g "3,$LEFT,*,*,sh -lc 'swaymsg workspace next'" \
  -g "3,$RIGHT,*,*,sh -lc 'swaymsg workspace prev'" \
  -g "1,$UP,$B_EDGE,*,sh -lc 'squeekboard &'" \
  -g "1,$LEFT,$R_EDGE,*,sh -lc 'u=\$(swaymsg -t get_workspaces | jq -r \".[].name\" | grep -E \"^[0-9]+$\" | sort -n); n=1; while echo \"\$u\" | grep -qx \"\$n\"; do n=\$((n+1)); done; swaymsg workspace \"\$n\"'" 
