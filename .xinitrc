#!/bin/sh

# dbus
if which dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
       eval `dbus-launch --sh-syntax --exit-with-session`
fi

setbg &
dwmblocks &
picom &
xrandr --dpi 117
xbacklight -set 30
xrdb $HOME/.Xresources & xrdbpid=$!
pipewire &
play-with-mpv &
xmousepasteblock &
fcitx &
unclutter -idle 3 &
dunst &

# Ensure that xrdb has finished running before start
[ -n "$xrdbpid" ] && wait "$xrdbpid"

exec dwm > /dev/null 2>&1
