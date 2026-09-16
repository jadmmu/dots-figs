#!/bin/bash

scripts_dir="$HOME/.config/hypr/scripts"
themes_dir="$HOME/.config/hypr/.cache/colors"
cache_dir="$HOME/.config/hypr/.cache"
wallCache="$cache_dir/.wallpaper"
wallpaper_dir="$HOME/.config/hypr/Wallpaper"

[[ ! -f "$wallCache" ]] && touch "$wallCache"

PICS=($(find ${wallpaper_dir} -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.gif" \)))
wallpaper=${PICS[ $RANDOM % ${#PICS[@]} ]}

# Transition config
FPS=60
TYPE="random"
DURATION=1
BEZIER=".43,1.19,1,.4"
AWWW_PARAMS="--transition-fps $FPS --transition-type $TYPE --transition-duration $DURATION --transition-bezier $BEZIER"

start_awww() {
    if ! awww query >/dev/null 2>&1; then
        awww-daemon &
        for _ in {1..20}; do
            awww query >/dev/null 2>&1 && return 0
            sleep 0.05
        done
        return 1
    fi
}

start_awww && awww img "$wallpaper" $AWWW_PARAMS

ln -sf "$wallpaper" "$cache_dir/current_wallpaper.png"

baseName="$(basename $wallpaper)"
wallName=${baseName%.*}
echo "$wallName" > "$wallCache"

sleep 0.5
"$scripts_dir/wallcache.sh"
"$scripts_dir/pywal.sh"
