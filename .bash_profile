#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
source $HOME/.config/shell/envrc

[ "$(tty)" = "/dev/tty1" ] && startx > /dev/null 2>&1
