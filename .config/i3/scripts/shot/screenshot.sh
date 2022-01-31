#!/usr/bin/env bash

rofi_command="rofi -theme ~/.config/i3/rofi/shot.rasi"

# Options
screen=""
area=""
timer=""

# Variable passed to rofi
options="$screen\n$area\n$timer"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 1)"
case $chosen in
    $screen)
        ~/.config/i3/scripts/shot/shot-now delay
        ;;
    $area)
        ~/.config/i3/scripts/shot/shot-seldraw
        ;;
    $timer)
        ~/.config/i3/scripts/shot/shot-timer
        ;;
esac
