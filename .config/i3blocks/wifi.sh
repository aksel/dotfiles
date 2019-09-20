#!/bin/bash

# get active connection, along with its ssid and signal.
# remove trailing newline
# cut 'yes:'

str=$(nmcli -t -f active,ssid,signal device wifi | grep yes | tr '\n' '\0' | cut -d ':' -f 2,3)

if [ -n "$str" ]
then
    echo "<span font_desc='FontAwesome'></span> $str%"
fi