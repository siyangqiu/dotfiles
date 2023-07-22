#!/usr/bin/env zsh

export XDG_CURRENT_DESKTOP='sway'
export MOZ_ENABLE_WAYLAND=1
export GTK_THEME=Adwaita:dark
export FLYCTL_INSTALL="/home/siyangqiu/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"


path=(
	"$HOME/.local/bin" "$path[@]")
export PATH
