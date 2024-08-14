#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PS1="\[$(tput setaf 7)\]\[$(tput setab 0)\] \u \[$(tput setaf 4)\]\[$(tput setab 4)\]\[$(tput setaf 0)\] \h \[$(tput sgr0)\]\[$(tput setaf 4)\]\[$(tput setab 0)\] \W \[$(tput sgr0)\]\[$(tput setaf 0)\]\[$(tput sgr0)\] "
shopt -s autocd

source $HOME/.config/shell/aliasrc
