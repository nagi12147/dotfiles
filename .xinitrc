#!/bin/sh

#brightnessctl set 20%
#xbacklight -set 20
xrandr --dpi 120
hsetroot -solid "#282828"
xrdb $HOME/.Xresources & xrdbpid=$!
#setbg &

dunst &
dwmblocks &
pipewire &
xmousepasteblock &
unclutter -idle 3 &
fcitx &
xcompmgr &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# dbus
if which dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
       eval `dbus-launch --sh-syntax --exit-with-session`
fi

# Ensure that xrdb has finished running before start
[ -n "$xrdbpid" ] && wait "$xrdbpid"

exec dwm > /dev/null 2>&1
