#!/bin/sh

if which dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
       eval `dbus-launch --sh-syntax --exit-with-session`
fi

# Ensure that xrdb has finished running before moving on to start the WM/DE.
[ -n "$xrdbpid" ] && wait "$xrdbpid"

xrdb ~/.Xresources & xrdbpid=$!
xrandr --dpi 117
xbacklight -set 30
remaps &
setbg &
play-with-mpv &
#pipewire-start &

autostart="slstatus dunst unclutter xmousepasteblock fcitx pipewire"

for program in $autostart; do
	pidof -s "$program" || setsid -f "$program"
done >/dev/null 2>&1

# Launch
exec dwm
