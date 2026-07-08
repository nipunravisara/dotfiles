#!/bin/bash
# Human date + 12-hour time, e.g. "6th July 7:35 AM"
DAY=$(date +%-d)
case "$DAY" in
  1|21|31) SUF="st" ;;
  2|22)    SUF="nd" ;;
  3|23)    SUF="rd" ;;
  *)       SUF="th" ;;
esac
sketchybar --set "$NAME" label="${DAY}${SUF} $(date '+%B %-I:%M %p')"
