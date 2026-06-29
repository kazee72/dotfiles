#!/bin/bash

APP=$(aerospace list-windows --focused 2>/dev/null \
  | awk -F'|' '{gsub(/^ +| +$/, "", $2); print $2}' \
  | head -1)

if [ -z "$APP" ]; then
  APP=$(osascript -e 'tell application "System Events" to get name of first process whose frontmost is true' 2>/dev/null)
fi

sketchybar --set "$NAME" label="${APP:-—}"