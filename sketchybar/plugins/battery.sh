#!/bin/bash

BATTERY=$(pmset -g batt)
PERCENT=$(echo "$BATTERY" | grep -o '[0-9]*%' | head -1 | tr -d '%')
CHARGING=$(echo "$BATTERY" | grep -c 'AC Power')

if [ "$CHARGING" -gt 0 ]; then
  ICON="󰂄"
  COLOR=0xffa6e3a1  # green
elif [ "$PERCENT" -ge 80 ]; then
  ICON="󰁹"; COLOR=0xffa6e3a1
elif [ "$PERCENT" -ge 60 ]; then
  ICON="󰂀"; COLOR=0xffa6e3a1
elif [ "$PERCENT" -ge 40 ]; then
  ICON="󰁾"; COLOR=0xfff9e2af
elif [ "$PERCENT" -ge 20 ]; then
  ICON="󰁼"; COLOR=0xfffab387
else
  ICON="󰁺"; COLOR=0xfff38ba8  # red
fi

sketchybar --set "$NAME" icon="$ICON" icon.color="$COLOR" label="${PERCENT}%"