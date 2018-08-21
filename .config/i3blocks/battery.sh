#!/bin/bash

level=$(cat /sys/class/power_supply/BAT0/capacity)
charging=$(cat /sys/class/power_supply/BAT0/status)
symbol=""

case $level in
[0-9])
    symbol=""
    ;;
1[0-9])
    symbol=""
    ;;
[2-3][0-9])
    symbol=""
    ;;
[4-5][0-9])
    symbol=""
    ;;
[6-7][0-9])
    symbol=""
    ;;
[8-9][0-9])
    symbol=""
    ;;
100)
    symbol=""
    ;;
*)
    symbol=""
    ;;
esac

if [[ "$charging" = "Charging" ]]; then
    symbol="$symbol "
fi

echo "<span font_desc='FontAwesome'>$symbol</span> $level%"
