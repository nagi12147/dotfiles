#!/bin/sh

if which dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
       eval `dbus-launch --sh-syntax --exit-with-session`
fi

# Autolaunch
setbg &
sh ~/.local/bin/pipewire-start
xrdb ~/.Xresources &
slstatus &
xrandr --dpi 98 &
xsettingsd &
fcitx &
dunst &
unclutter -idle 3 &
play-with-mpv &
xmousepasteblock &      #disable middle mouse paste

# Launch
exec dwm
