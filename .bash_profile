#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# XDG
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

# File
export PATH="${PATH}:${HOME}/.local/bin"
export GTK2_RC_FILES="${HOME}/.config/gtk-2.0/gtkrc-2.0"

# Default Programs
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="st"
export BROWSER="chromium"
export READER="zathura"
export COLORTERM="truecolor"
export VIDEO="mpv"
export IMAGE="sxiv"

# Other
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_PLUGIN_PATH="/usr/lib/qt/plugins"
export GTK_IM_MODULE="fcitx"
export QT_IM_MODULE="fcitx"
export XMODIFIERS=@im="fcitx"

# Color
export LESS='-R --use-color -Dd+r$Du+b'
export MANPAGER="less -R --use-color -Dd+r -Du+b"

# Disable files
export LESSHISTFILE=-

# Autostart
if [[ "$(tty)" = "/dev/tty1" ]]; then
	exec startx
fi
