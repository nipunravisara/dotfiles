#!/bin/bash
# Volume percentage + speaker icon. Uses $INFO on volume_change, else queries the system.
if [ "$SENDER" = "volume_change" ] && [ -n "$INFO" ]; then
  VOLUME="$INFO"
else
  VOLUME=$(osascript -e 'output volume of (get volume settings)' 2>/dev/null)
fi
MUTED=$(osascript -e 'output muted of (get volume settings)' 2>/dev/null)

if [ "$MUTED" = "true" ] || [ "${VOLUME:-0}" -eq 0 ] 2>/dev/null; then
  ICON="󰖁"
else
  case "$VOLUME" in
    [6-9][0-9]|100) ICON="󰕾" ;;
    [3-5][0-9])     ICON="󰖀" ;;
    *)              ICON="󰕿" ;;
  esac
fi
sketchybar --set "$NAME" icon="$ICON" label="${VOLUME:-0}%"
