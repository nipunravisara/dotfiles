#!/bin/bash
# Used percentage of the root volume.
PCT=$(df -H / | awk 'NR==2 {gsub("%","",$5); print $5}')
sketchybar --set "$NAME" label="$(printf '%02d' "${PCT:-0}")%"
