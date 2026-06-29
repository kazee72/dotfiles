#!/bin/bash

# Use the event's value when available, else query the system
if [ "$SENDER" = "volume_change" ]; then
  VOLUME="$INFO"
else
  VOLUME=$(osascript -e 'output volume of (get volume settings)')
fi
VOLUME=${VOLUME:-0}

MUTED=$(osascript -e 'output muted of (get volume settings)' 2>/dev/null)

if [ "$MUTED" = "true" ] || [ "$VOLUME" -eq 0 ]; then
  ICON="󰖁"        # muted
elif [ "$VOLUME" -lt 34 ]; then
  ICON="󰕿"        # low
elif [ "$VOLUME" -lt 67 ]; then
  ICON="󰖀"        # medium
else
  ICON="󰕾"        # high
fi

sketchybar --set "$NAME" icon="$ICON" label="${VOLUME}%"