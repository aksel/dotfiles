#!/bin/bash

name=$(iwgetid -r)
str=$(cat /proc/net/wireless | tail -n 1 | awk '{print $3}' | rev | cut -c 2- | rev)

echo "<span font_desc='FontAwesome'></span> $name $str%"

