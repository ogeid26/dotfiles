#~/usr/bin/env bash

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload altbar &
    # sleep 2
    # MONITOR=$m polybar --reload altbar2 &
  done
else
  polybar --reload main &
  fi
