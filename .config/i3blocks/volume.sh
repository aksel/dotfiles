#!/bin/bash

read -r -a status <<< "$(pulseaudio-ctl full-status)"
volume=${status[0]}
mute=${status[1]}
symbol=""

# FontAwesome volume icon seems to be broken at the moment.
# Replace with VOL for now.
symbol="VOL"
# if [[ $volume = "0" || $mute = "yes" ]]; then
#    symbol=""
# elif [[ $volume -lt 60 ]]; then
#    symbol=""
# else
#    symbol=""
# fi

echo "<span>$symbol</span> $volume"
