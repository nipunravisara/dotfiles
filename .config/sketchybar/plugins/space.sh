#!/bin/bash
# Highlight the selected space: bright accent when focused, muted otherwise.
source "$CONFIG_DIR/colors.sh"

if [ "$SELECTED" = "true" ]; then
  sketchybar --set "$NAME" background.drawing=off \
                           icon.color="$MAUVE" \
                           label.color="$MAUVE"
else
  sketchybar --set "$NAME" background.drawing=off \
                           icon.color="$SUBTEXT" \
                           label.color="$SUBTEXT"
fi
