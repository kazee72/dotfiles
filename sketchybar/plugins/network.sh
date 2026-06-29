#!/bin/bash

if route -n get default >/dev/null 2>&1; then
  # online
  sketchybar --set "$NAME" icon="󰖩" icon.color=0xffcdd6f4 \
    label.drawing=off icon.padding_left=8 icon.padding_right=8
else
  # offline
  sketchybar --set "$NAME" icon="󰖪" icon.color=0xfff38ba8 \
    label.drawing=off icon.padding_left=8 icon.padding_right=8
fi