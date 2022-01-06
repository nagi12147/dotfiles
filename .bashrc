
# ~/.bashrc
#

[[ $- != *i* ]] && return

#PS1=' \033[1;31m\w\033[0;0m # '    # root prompt
PS1=' \033[1;35m\w\033[0;0m $ '
set -o vi

stty -ixon          # disable ctrl-s and ctrl-q.
shopt -s autocd     # allows you to cd into directory merely by typing the directory name.
shopt -s cdspell    # autocorrects cd misspellings

command -v nvim >/dev/null && alias vimdiff="nvim -d"   # Use neovim for vimdiff if present.
bind "set completion-ignore-case on"

# sudo not required for some system commands
for command in mount umount sv pacman shutdown ; do
	alias $command="sudo $command"
done; unset command

# automatically use loginctl to reboot and shutdown
for command in poweroff reboot ; do
    alias $command="loginctl $command"
done; unset command

# infinite history.
HISTSIZE=
HISTFILESIZE=

# alias
alias bc="bc -ql"
alias rm='printf "\033[1;31m" && rm -rIv'
alias cp='printf "\033[1;32m" && cp -riv'
alias mv='printf "\033[1;34m" && mv -iv'
alias mkdir='printf "\033[1;33m" && mkdir -v'
alias rmdir='printf "\033[1;35m" && rmdir -v'
alias merge="xrdb ~/.Xresources"
alias v="$EDITOR"
alias g="git"
alias k="killall"
alias z="$READER"
alias mc='tmux split -h lf; lf'

# color
alias diff="diff --color=auto"
alias grep="grep --color=auto"
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ip="ip -color=auto"
alias ls="ls -hN --color=auto --group-directories-first"
LS_COLORS="di=1;35:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90:*.png=35:*.gif=36:*.jpg=35:*.c=92:*.jar=33:*.py=93:*.h=90:*.txt=94:*.doc=104:*.docx=104:*.odt=104:*.csv=102:*.xlsx=102:*.xlsm=102:*.rb=31:*.cpp=92:*.sh=92:*.html=96:*.zip=4;33:*.tar.gz=4;33:*.mp4=105:*.mp3=106"
export LS_COLORS
