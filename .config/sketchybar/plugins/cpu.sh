#!/bin/bash
# CPU load percentage (user + sys) from top.
CORE=$(top -l 2 -n 0 -s 1 | grep -E "^CPU usage" | tail -1)
USER=$(echo "$CORE" | awk '{print $3}' | tr -d '%')
SYS=$(echo "$CORE" | awk '{print $5}' | tr -d '%')
TOTAL=$(printf "%.0f" "$(echo "${USER:-0} + ${SYS:-0}" | bc 2>/dev/null || echo 0)")
sketchybar --set "$NAME" label="$(printf '%02d' "${TOTAL:-0}")%"
