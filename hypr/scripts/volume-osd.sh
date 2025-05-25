#!/bin/bash

# Change volume
pactl set-sink-volume @DEFAULT_SINK@ "$1"

# Small delay to ensure volume is applied before reading it
sleep 0.05

# Get the updated volume (as int)
VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1 | tr -d '%')

# Reset previous OSD (prevents stacking)
swaync-client -rs

# Send notification
notify-send "Volume" "${VOLUME}%" -h int:value:"$VOLUME" -h string:x-canonical-private-synchronous:volume
