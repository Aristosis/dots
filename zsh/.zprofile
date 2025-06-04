#!/bin/sh

# aliases
alias v='nvim'
alias dlp='yt-dlp -f bestaudio --extract-audio --audio-quality 0 --audio-format mp3 --embed-metadata --embed-thumbnail --output "%(title)s.%(ext)s"'

# default programs
export EDITOR="nvim"
export VISUAL="nvim"
export TERM="kitty"
export TERMINAL="kitty"
export BROWSER="librewolf"
# export DISPLAY=:0

# follow XDG base dir specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export LESSHISTFILE="$XDG_CACHE_HOME/less_history"

# colored man pages
export MANPAGER="less -R --use-color -Dd+r -Du+b"

# colored less + termcap vars
export LESS="R --use-color -Dd+r -Du+b"
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
