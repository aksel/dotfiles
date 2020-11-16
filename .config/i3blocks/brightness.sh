#!/bin/sh
max=$(cat /sys/class/backlight/amdgpu_bl0/max_brightness)
current=$(cat /sys/class/backlight/amdgpu_bl0/brightness)

brightness=$((100 * $current / $max))

echo "<span font_desc='FontAwesome'></span> $brightness"
