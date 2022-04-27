#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt
if [ "$EUID" -ne 0 ]
	then export PS1=" \[$(tput bold)\]\[$(tput setaf 4)\]\w\[$(tput sgr0)\] $ "
    else export PS1=" \[$(tput bold)\]\[\e[31m\]\w\[$(tput sgr0)\] # "    # root
fi

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion
complete -cf doas

# Input
set -o vi
shopt -s autocd
shopt -s cdspell
shopt -s histappend
bind "set completion-ignore-case on"
stty -ixon

# No need to type sudo or loginctl for certain command
#for command in mount umount sv pacman ; do
#	alias $command="sudo $command"
#done; unset command

for command in shutdown poweroff reboot ; do
    alias $command="loginctl $command"
done; unset command

# Colors
alias rm="printf '\033[1;31m' && rm -rIv"
alias cp="printf '\033[1;32m' && cp -riv"
alias mv="printf '\033[1;34m' && mv -iv"
alias mkdir="printf '\033[1;33m' && mkdir -pv"
alias rmdir="printf '\033[1;35m' && rmdir -v"
alias diff="diff --color=auto"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias ip="ip -color=auto"
alias ls="ls -hN --color=auto --group-directories-first"
LS_COLORS="di=1;34:fi=0:ln=31:pi=4:so=4:bd=4:cd=4:or=31:mi=0:ex=34:*.rpm=90:*.png=34:*.gif=36:*.jpg=34:*.c=92:*.jar=33:*.py=93:*.h=90:*.txt=95:*.doc=105:*.docx=105:*.odt=105:*.csv=102:*.xlsx=102:*.xlsm=102:*.rb=31:*.cpp=92:*.sh=92:*.html=96:*.zip=4;33:*.tar.gz=4;33:*.mp4=105:*.mp3=106"
export LS_COLORS

# Git
alias g="git"
alias ga="git add"
alias gd="git diff"
alias gs="git status"
alias gc="git clone"
alias gcm="git commit -m"
alias gp="git push"
alias gpl="git pull"

# Shortcut
alias ka="killall"
alias man="man --locale=id"
alias s="$IMAGE"
alias m="$VIDEO"
alias v="$EDITOR"
alias z="$READER"
