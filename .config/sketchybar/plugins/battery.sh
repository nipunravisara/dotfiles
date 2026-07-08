#!/bin/bash
# Battery percentage + icon (nerd-font glyphs), charging aware.
PERCENTAGE="$(pmset -g batt | grep -Eo '\d+%' | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"
[ -z "$PERCENTAGE" ] && exit 0

if [ -n "$CHARGING" ]; then
  ICON="󰂄"
else
  case "$PERCENTAGE" in
    100|9[0-9]) ICON="󰁹" ;;
    [7-8][0-9]) ICON="󰂁" ;;
    [5-6][0-9]) ICON="󰁿" ;;
    [3-4][0-9]) ICON="󰁽" ;;
    [1-2][0-9]) ICON="󰁻" ;;
    *)          ICON="󰂎" ;;
  esac
fi
sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}%"
