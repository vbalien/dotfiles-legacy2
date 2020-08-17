#!/bin/bash
function node_monitor {
  while read -r _ _ desktop _ node; do
    num=$(bspc query -N -d $desktop | grep -f <(bspc query -N -n .leaf) | wc -l)
    if [ $1 = "add" ]; then
      if [ $num = "1" ];then
        xprop -id "$node" -f _PICOM_ROUNDED 32c -set _PICOM_ROUNDED 0
      else
        bspc query -N -d | while read -r node; do
        xprop -id "$node" -remove _PICOM_ROUNDED
      done
      fi
    elif [ $1 = "remove" ];then
      if [ $num = "1" ];then
        bspc query -N -d | while read -r node; do
        xprop -id "$node" -f _PICOM_ROUNDED 32c -set _PICOM_ROUNDED 0
      done
      fi
    fi
  done
}

bspc subscribe node_add | node_monitor add &
bspc subscribe node_remove | node_monitor remove &
