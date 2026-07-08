#!/bin/bash
# Display brightness percentage via the `brightness` CLI (brew install brightness).
if command -v brightness >/dev/null 2>&1; then
  VAL=$(brightness -l 2>/dev/null | awk '/display 0: brightness/{printf "%d", $4*100; exit}')
fi
if [ -n "$VAL" ]; then
  case "$VAL" in
    100|9[0-9]|8[0-9]|7[0-9]) ICON="󰃠" ;;
    [4-6][0-9]) ICON="󰃟" ;;
    *)          ICON="󰃞" ;;
  esac
  sketchybar --set "$NAME" icon="$ICON" label="${VAL}%"
else
  sketchybar --set "$NAME" icon="󰃠" label="--"
fi
