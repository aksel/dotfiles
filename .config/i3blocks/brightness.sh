#!/bin/sh
max=$(cat /sys/class/backlight/intel_backlight/max_brightness)
current=$(cat /sys/class/backlight/intel_backlight/brightness)

brightness=$((100 * $current / $max))

echo "<span font_desc='FontAwesome'></span> $brightness"