#!/bin/bash
if [ $(ps -aux | grep conky | wc -l) -lt 4 ]; then
	conky -q -c $HOME/.config/conky/spotify.lua &	conky -q -c $HOME/.config/conky/monitor_left.lua & conky -q -c $HOME/.config/conky/monitor_right.lua
else
	pkill conky
fi
