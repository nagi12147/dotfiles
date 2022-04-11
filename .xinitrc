#!/bin/sh

# dbus
if which dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
       eval `dbus-launch --sh-syntax --exit-with-session`
fi

xrandr --dpi 115
xrdb $HOME/.Xresources & xrdbpid=$!
#brightnessctl set 20%
#xbacklight -set 20
#xsetroot -solid "#ffffff"
hsetroot -solid "#222222"

#dwmbar &
pipewire &
#pipewire-pulse &
#wireplumber &
mpd &
xcompmgr &
unclutter -idle 3 &
xmousepasteblock &
fcitx &
dunst &
play-with-mpv &
/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
dwmblocks &

# Ensure that xrdb has finished running before start
[ -n "$xrdbpid" ] && wait "$xrdbpid"

exec dwm > /dev/null 2>&1
