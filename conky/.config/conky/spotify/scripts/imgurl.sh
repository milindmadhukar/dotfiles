#!/bin/bash
imgUrl=`dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' | grep -E -A 1 "artUrl" | grep -E "^\s*variant" | cut -b 44- | sed 's/"$//'`

echo $imgUrl
