#!/bin/bash
# Wi-Fi icon + SSID. macOS 14+ gates the SSID behind Location Services:
# without that permission the system returns the literal string "<redacted>".

IFACE=$(networksetup -listallhardwareports 2>/dev/null \
  | awk '/Wi-Fi|AirPort/{getline; print $2; exit}')
IFACE=${IFACE:-en0}

SSID=$(ipconfig getsummary "$IFACE" 2>/dev/null \
  | awk -F' SSID : ' '/ SSID : /{print $2; exit}')

if [ -n "$SSID" ] && [ "$SSID" != "<redacted>" ]; then
  # Real network name available.
  sketchybar --set "$NAME" icon="󰖩" label="$SSID"
elif [ "$SSID" = "<redacted>" ] || ipconfig getsummary "$IFACE" 2>/dev/null | grep -q "SSID"; then
  # Connected to Wi-Fi, but the name is hidden (no Location Services permission).
  sketchybar --set "$NAME" icon="󰖩" label="Wi-Fi"
elif ifconfig "$IFACE" 2>/dev/null | grep -q "status: active"; then
  sketchybar --set "$NAME" icon="󰈀" label="Ethernet"
else
  sketchybar --set "$NAME" icon="󰖪" label="Offline"
fi
