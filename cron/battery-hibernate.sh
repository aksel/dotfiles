#!/bin/sh

capacity=$(cat /sys/class/power_supply/BAT0/capacity)
status=$(cat /sys/class/power_supply/BAT0/status)

if [ "$status" = Discharging -a "$capacity" -lt 5 ]; then
    logger "Critical battery threshold"
    #i3lock -c 000000
    sudo systemctl hibernate
fi