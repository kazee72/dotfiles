#!/bin/bash

if [ "$1" = "date" ]; then
  sketchybar --set "$NAME" label="$(date '+%a %d %b')"
else
  sketchybar --set "$NAME" label="$(date '+%H:%M')"
fi