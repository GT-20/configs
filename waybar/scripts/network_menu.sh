#!/bin/bash

# Define the options with icons (Wofi might not display these directly)
options="WiFi
Bluetooth
Airplane Mode"

# Use Wofi to display the options
chosen=$(echo -e "$options" | wofi --show dmenu --prompt "Network" --width 100 --height 200)

case "$chosen" in
"WiFi")
    kitty -e nmtui # Change to your terminal emulator
    ;;
"Bluetooth")
    blueman-manager
    ;; # Open Bluetooth manager
"Airplane Mode")
    if rfkill list | grep -q "Soft blocked: yes"; then
        rfkill unblock all
    else
        rfkill block all
    fi
    ;;
esac
