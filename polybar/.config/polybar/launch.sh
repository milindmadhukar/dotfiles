#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
bar_type=$1

if [ -z "$bar_type" ]; then
  bar_type="compact"
fi

echo "---" | tee -a /tmp/polybar.log
polybar --config=$HOME/.config/polybar/config.ini $bar_type 2>&1 | tee -a /tmp/polybar.log & disown

echo "Bars launched..."

