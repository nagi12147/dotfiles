#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# bash
ln -sv ${BASEDIR}/.bashrc ~/.bashrc
ln -sv ${BASEDIR}/.bash_profile ~/.bash_profile
ln -sv ${BASEDIR}/.inputrc ~/.inputrc

# x11
ln -sv ${BASEDIR}/.xinitrc ~/.xinitrc
ln -sv ${BASEDIR}/.Xresources ~/.Xresources

# config mkdir ~/.config/{dunst,flameshot,fontconfig,gtk-2.0,gtk-3.0,lf,mpv,nvim,pipewire,zathura}
mkdir ~/.config/fontconfig/conf.d
mkdir ~/.config/mpv/{script-opts,scripts}
mkdir ~/.config/pipewire/media-session.d
ln -sv ${BASEDIR}/.config/dunst/dunstrc ~/.config/dunst/dunstrc
ln -sv ${BASEDIR}/.config/flameshot/flameshot.ini ~/.config/flameshot/flameshot.ini
ln -sv ${BASEDIR}/.config/fontconfig/fonts.conf ~/.config/fontconfig/fonts.conf
ln -sv /usr/share/fontconfig/conf.avail/10-hinting-slight.conf ~/.config/fontconfig/conf.d/10-hinting-slight.conf
ln -sv /usr/share/fontconfig/conf.avail/10-sub-pixel-rgb.conf ~/.config/fontconfig/conf.d/10-sub-pixel-rgb.conf
ln -sv /usr/share/fontconfig/conf.avail/11-lcdfilter-default.conf ~/.config/fontconfig/conf.d/11-lcdfilter-default.conf
ln -sv /usr/share/fontconfig/conf.avail/70-noto-cjk.conf ~/.config/fontconfig/conf.d/70-noto-cjk.conf
ln -sv ${BASEDIR}/.config/fontconfig/conf.d/20-symbols.conf ~/.config/fontconfig/conf.d/20-symbols.conf
ln -sv ${BASEDIR}/.config/gtk-2.0/gtkrc-2.0 ~/.config/gtk-2.0/gtkrc-2.0
ln -sv ${BASEDIR}/.config/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini
ln -sv ${BASEDIR}/.config/lf/lfrc ~/.config/lf/lfrc
ln -sv ${BASEDIR}/.config/mpv/mpv.conf ~/.config/mpv/mpv.conf
ln -sv ${BASEDIR}/.config/mpv/script-opts/youtube-quality.conf ~/.config/mpv/script-opts/youtube-quality.conf
ln -sv ${BASEDIR}/.config/mpv/scripts/youtube-quality-osc.lua ~/.config/mpv/scripts/youtube-quality-osc.lua
ln -sv ${BASEDIR}/.config/mpv/scripts/youtube-quality.lua ~/.config/mpv/scripts/youtube-quality.lua
ln -sv ${BASEDIR}/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -sv ${BASEDIR}/.config/pipewire/pipewire.conf ~/.config/pipewire/pipewire.conf
ln -sv ${BASEDIR}/.config/zathura/zathurarc ~/.config/zathura/zathurarc
ln -sv ${BASEDIR}/.config/mimeapps.list ~/.config/mimeapps.list

# local
ln -sv ${BASEDIR}/.local/bin/maimocr ~/.local/bin/maimocr
ln -sv ${BASEDIR}/.local/bin/pipewire-start ~/.local/bin/pipewire-start
ln -sv ${BASEDIR}/.local/bin/setbg ~/.local/bin/setbg
ln -sv ${BASEDIR}/.local/share/applications/anki.desktop ~/.local/share/applications/anki.desktop
ln -sv ${BASEDIR}/.local/share/applications/file.desktop ~/.local/share/applications/file.desktop
ln -sv ${BASEDIR}/.local/share/applications/img.desktop ~/.local/share/applications/img.desktop
ln -sv ${BASEDIR}/.local/share/applications/pdf.desktop ~/.local/share/applications/pdf.desktop
ln -sv ${BASEDIR}/.local/share/applications/text.desktop ~/.local/share/applications/text.desktop
ln -sv ${BASEDIR}/.local/share/applications/video.desktop ~/.local/share/applications/video.desktop
