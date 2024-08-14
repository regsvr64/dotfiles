#!/usr/bin/env zsh
#            _
#    _______| |__  _ __ ___
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__
# (_)___|___/_| |_|_|  \___|
#

##
## FUNCTIONS
##

setup_zsh() {
	[ ! -d "$HOME/.config/zsh" ] && mkdir -p $HOME/.config/zsh

	[ ! -d "$HOME/.config/zsh/zsh-syntax-highlighting" ] && \
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
		$HOME/.config/zsh/zsh-syntax-highlighting

	[ ! -d "$HOME/.config/zsh/zsh-completions" ] && \
		git clone https://github.com/zsh-users/zsh-completions.git \
		$HOME/.config/zsh/zsh-completions

	[ ! -d "$HOME/.config/zsh/zsh-autosuggestions" ] && \
		git clone https://github.com/zsh-users/zsh-autosuggestions \
		$HOME/.config/zsh/zsh-autosuggestions
}

setup_zsh

# =============================================================== #
autoload -U colors && colors
setopt autocd
stty stop undef
setopt interactive_comments
export PS1="%{$fg[white]%}%{$bg[black]%} %n %{$fg[blue]%}%{$bg[blue]%}%{$fg[black]%} %M %{$fg[blue]%}%{$bg[black]%}%{$fg[blue]%} %~ %{$reset_color%}%{$fg[black]%}%{$reset_color%} "

# = Completions ================================================= #
fpath=($HOME/.config/zsh/zsh-completions/src $fpath)
autoload -U compinit

zstyle ':completion:*' menu select
zstyle ':completion:*:*:cp:*' file-sort size
zstyle ':completion:*' file-sort modification
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:*' group-order alias builtins functions commands
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

setopt ALWAYS_TO_END
setopt LIST_PACKED
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# = Vi Keymap =================================================== #
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;
        viins|main) echo -ne '\e[5 q';;
    esac
}

zle -N zle-keymap-select

zle-line-init() {
    zle -K viins
    echo -ne "\e[5 q"
}

zle -N zle-line-init
echo -ne '\e[5 q'

preexec() { echo -ne '\e[5 q' ;}

autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd '^[[P' vi-delete-char
bindkey -M vicmd '^e' edit-command-line
bindkey -M visual '^[[P' vi-delete

############## 
HISTSIZE=10000000
SAVEHIST=10000000
export HISTFILE="$HOME/.config/zsh/history"
source $HOME/.config/shell/aliasrc 
source $HOME/.config/shell/envrc

## Source Plugins ##
source $HOME/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

neofetch
