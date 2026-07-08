#!/bin/bash
# Used RAM percentage derived from vm_stat page counts.
PAGE=$(sysctl -n hw.pagesize)
TOTAL=$(sysctl -n hw.memsize)
STATS=$(vm_stat)
FREE=$(echo "$STATS"     | awk '/Pages free/                {gsub("[^0-9]","",$3); print $3}')
SPEC=$(echo "$STATS"     | awk '/Pages speculative/         {gsub("[^0-9]","",$3); print $3}')
USED_PAGES=$(( (TOTAL / PAGE) - FREE - SPEC ))
PCT=$(( USED_PAGES * 100 * PAGE / TOTAL ))
sketchybar --set "$NAME" label="$(printf '%02d' "$PCT")%"
