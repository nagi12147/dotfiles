#!/bin/sh

# dbus
if which dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
       eval `dbus-launch --sh-syntax --exit-with-session`
fi

xrandr --dpi 120
hsetroot -solid "#222222"
xrdb $HOME/.Xresources & xrdbpid=$!
#brightnessctl set 20%
#xbacklight -set 20
setbg &

pipewire &
xcompmgr &
unclutter -idle 3 &
xmousepasteblock &
fcitx &
dunst &
dwmblocks &
play-with-mpv &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# Ensure that xrdb has finished running before start
[ -n "$xrdbpid" ] && wait "$xrdbpid"

exec dwm > /dev/null 2>&1
