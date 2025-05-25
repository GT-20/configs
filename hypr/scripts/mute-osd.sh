#!/bin/bash

# Toggle mute
pactl set-sink-mute @DEFAULT_SINK@ toggle

# Wait a moment for the state to update
sleep 0.05

# Get mute state
IS_MUTED=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -q "yes" && echo "Muted" || echo "Unmuted")

# Send notification
swaync-client -rs
notify-send "$IS_MUTED" -h string:x-canonical-private-synchronous:volume
