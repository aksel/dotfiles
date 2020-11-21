#!/bin/sh
dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)

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

xrandr --dpi 96
# Start i3
exec i3 --shmlog-size=26214400
