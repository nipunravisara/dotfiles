#!/bin/bash
# Shows the focused app with its sketchybar-app-font glyph as the icon.
# icon_map.sh (v2.x) returns a ligature token (e.g. ":brave:") in $icon_result,
# which the sketchybar-app-font renders as the app glyph.
source "$CONFIG_DIR/plugins/icon_map.sh"

if [ "$SENDER" = "front_app_switched" ] || [ -n "$INFO" ]; then
  APP="$INFO"
  [ -z "$APP" ] && APP="$(yabai -m query --windows --window 2>/dev/null | jq -r '.app // empty')"
  [ -z "$APP" ] && exit 0
  __icon_map "$APP"
  sketchybar --set "$NAME" icon="$icon_result" label="$APP"
fi
