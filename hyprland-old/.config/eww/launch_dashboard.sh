#!/bin/bash

## Files and cmd
FILE="$HOME/.cache/eww_launch.dashboard"
CFG="$HOME/.config/eww/"
EWW=`which eww`

## Run eww daemon if not running already
if [[ ! `pidof eww` ]]; then
	${EWW} daemon
	sleep 1
fi

## Open widgets 
run_eww() {
	${EWW} open-many \
		reboot poweroff 
		#    logout sleep 
		
}

## Launch or close widgets accordingly
if [[ ! -f "$FILE" ]]; then
	touch "$FILE"
	run_eww
else
	${EWW} close \
		reboot poweroff 
			# logout sleep 
	rm "$FILE"
fi
