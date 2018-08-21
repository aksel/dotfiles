#!/bin/sh
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap # for disabling weird space, e.g. alt-gr+space no-break shit

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

source $HOME/.profile

# Enable natural scrolling and tapping
xinput set-prop 13 "libinput Natural Scrolling Enabled" 1
xinput set-prop 13 "libinput Tapping Enabled" 1

xrandr --output eDP1 --auto --output DP1 --auto --right-of eDP1

# Start i3
exec i3 --shmlog-size=26214400
