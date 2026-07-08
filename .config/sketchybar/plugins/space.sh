#!/bin/bash
# Highlight the selected space: bright accent when focused, muted otherwise.
source "$CONFIG_DIR/colors.sh"

if [ "$SELECTED" = "true" ]; then
  sketchybar --set "$NAME" background.drawing=on \
                           background.color="$MAUVE" \
                           icon.color="$ON_ACCENT" \
                           label.color="$ON_ACCENT"
else
  sketchybar --set "$NAME" background.drawing=on \
                           background.color="$SURFACE2" \
                           icon.color="$SUBTEXT" \
                           label.color="$SUBTEXT"
fi
