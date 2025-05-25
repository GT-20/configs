#!/bin/bash

# Get the list of connected monitors
EXTERNAL_MONITOR=$(hyprctl monitors | grep 'Monitor' | grep -v eDP | awk '{print $2}')
LAPTOP_MONITOR=$(hyprctl monitors | grep 'Monitor' | grep eDP | awk '{print $2}')

# Check if an external monitor is connected
if [ -n "$EXTERNAL_MONITOR" ]; then
    # Disable the laptop screen and use the external monitor
    hyprctl keyword monitor "$LAPTOP_MONITOR, disable"
    hyprctl keyword monitor "$EXTERNAL_MONITOR, 1920x1080@60, 0x0, 1"
else
    # Use only the laptop screen
    hyprctl keyword monitor "$LAPTOP_MONITOR, 1920x1080@60, 0x0, 1"
fi
