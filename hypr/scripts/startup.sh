#!/bin/bash

scripts_dir="$HOME/.config/hypr/scripts"
wallpaper="$HOME/.config/hypr/.cache/current_wallpaper.png"
monitor_config="$HOME/.config/hypr/configs/monitor.conf"

nightlight_value=$(cat "$HOME/.config/hypr/.cache/.nightlight")

# Transition config
FPS=60
TYPE="any"
DURATION=2
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

if [[ -f "$wallpaper" ]]; then
    start_awww && awww img "$wallpaper" $AWWW_PARAMS
else
    "$scripts_dir/Wallpaper.sh"
fi

# if openbangla keyboard is installed, the
if [[ -d "/usr/share/openbangla-keyboard" ]]; then
    fcitx5 &> /dev/null
fi


"$scripts_dir/notification.sh" sys
"$scripts_dir/wallcache.sh"
# Theme colors are static and generated from theme/palette.toml; wallpaper changes do not recolor apps.
"$scripts_dir/system.sh" run &


#_____ setup monitor ( updated teh monitor.conf for the high resolution and higher refresh rate )

# monitor_setting=$(cat $monitor_config | grep "monitor")
# monitor_icon="$HOME/.config/hypr/icons/monitor.png"
# if [[ "$monitor_setting" == "monitor=,preferred,auto,auto" ]]; then
#     notify-send -i "$monitor_icon" "Monitor Setup" "A popup for your monitor configuration will appear within 5 seconds." && sleep 5
#     kitty --title monitor sh -c "$scripts_dir/monitor.sh"
# fi
#
# sleep 3

"$scripts_dir/default_browser.sh"
