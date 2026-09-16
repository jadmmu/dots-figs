#!/usr/bin/env bash

CACHE="$HOME/.config/hypr/.cache/.nightlight"

# Ensure cache exists
mkdir -p "$(dirname "$CACHE")"

# Initialize state if missing or empty
if [ ! -s "$CACHE" ]; then
    echo "off" > "$CACHE"
fi

STATE=$(cat "$CACHE")

if [ "$STATE" = "on" ]; then
    # TURN NIGHTLIGHT OFF
    pkill -f gammastep 2>/dev/null
    pkill -f wlsunset 2>/dev/null
    echo "off" > "$CACHE"
else
    # TURN NIGHTLIGHT ON
    pkill -f gammastep 2>/dev/null
    pkill -f wlsunset 2>/dev/null

    # Use ONE method (wlsunset is safest)
    wlsunset -t 3500 -g 1.0 &>/dev/null &

    echo "on" > "$CACHE"
fi

