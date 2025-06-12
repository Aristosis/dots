# aliases
alias v="nvim"
alias dlp='yt-dlp --extract-audio --audio-format best --embed-metadata --embed-thumbnail --audio-quality 0 -o "%(artist)s - %(track)s.%(ext)s"'


# default programs
export EDITOR="nvim"
export VISUAL="nvim"
export TERM="kitty"
export TERMINAL="kitty"
export BROWSER="librewolf"

# follow XDG base dir specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export LESSHISTFILE="$XDG_CACHE_HOME/less_history"

export PATH="$HOME/.pesde/bin:$PATH"
. "$HOME/.rokit/env"
