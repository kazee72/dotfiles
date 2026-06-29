#!/bin/bash
source "$HOME/.config/sketchybar/plugins/icon_map.sh"

sid=$1
FOCUSED=$(aerospace list-workspaces --focused 2>/dev/null)

# First app in this workspace (column 2 of list-windows)
APP=$(aerospace list-windows --workspace "$sid" 2>/dev/null \
  | awk -F'|' '{gsub(/^ +| +$/,"",$2); print $2}' | head -1)

if [ -n "$APP" ]; then
  __icon_map "$APP"
  GLYPH="$icon_result"
fi

if [ "$sid" = "$FOCUSED" ]; then
  # focused — highlighted pill
  if [ -n "$APP" ]; then
    sketchybar --set "$NAME" background.drawing=on background.color=0xff89b4fa \
      icon="$GLYPH" icon.drawing=on icon.color=0xff1e1e2e icon.padding_left=8 icon.padding_right=2 \
      label.color=0xff1e1e2e label.padding_left=2 label.padding_right=8
  else
    sketchybar --set "$NAME" background.drawing=on background.color=0xff89b4fa \
      icon.drawing=off \
      label.color=0xff1e1e2e label.padding_left=8 label.padding_right=8
  fi
elif [ -n "$APP" ]; then
  # has windows, not focused
  sketchybar --set "$NAME" background.drawing=on background.color=0xff313244 \
    icon="$GLYPH" icon.drawing=on icon.color=0xffcdd6f4 icon.padding_left=8 icon.padding_right=2 \
    label.color=0xffcdd6f4 label.padding_left=2 label.padding_right=8
else
  # empty
  sketchybar --set "$NAME" background.drawing=off \
    icon.drawing=off \
    label.color=0xff6c7086 label.padding_left=8 label.padding_right=8
fi