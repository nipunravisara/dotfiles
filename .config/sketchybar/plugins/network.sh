#!/bin/bash
# Network throughput computed from interface byte deltas between runs.
# One driver item runs this and updates BOTH the download and upload labels.

IFACE=$(route get default 2>/dev/null | awk '/interface:/{print $2}')
IFACE=${IFACE:-en0}
STATE="/tmp/sketchybar_net_${IFACE}"

read -r RX_NOW TX_NOW <<<"$(netstat -ibn | awk -v i="$IFACE" '$1==i && $7 ~ /^[0-9]+$/ {print $7, $10; exit}')"
RX_NOW=${RX_NOW:-0}; TX_NOW=${TX_NOW:-0}
NOW=$(date +%s)

if [ -f "$STATE" ]; then
  read -r T_PREV RX_PREV TX_PREV < "$STATE"
else
  T_PREV=$NOW; RX_PREV=$RX_NOW; TX_PREV=$TX_NOW
fi
echo "$NOW $RX_NOW $TX_NOW" > "$STATE"

DT=$(( NOW - T_PREV )); [ "$DT" -le 0 ] && DT=1
DOWN=$(( (RX_NOW - RX_PREV) / DT ))
UP=$(( (TX_NOW - TX_PREV) / DT ))
[ "$DOWN" -lt 0 ] && DOWN=0
[ "$UP" -lt 0 ] && UP=0

human() {
  b=$1
  if   [ "$b" -ge 1048576 ]; then printf "%d MB/s" $(( b / 1048576 ))
  elif [ "$b" -ge 1024 ];    then printf "%d KB/s" $(( b / 1024 ))
  else printf "%d B/s" "$b"; fi
}

sketchybar --set network.download label="$(human "$DOWN")" \
           --set network.upload   label="$(human "$UP")"
