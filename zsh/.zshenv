HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$XDG_CACHE_HOME/zsh_history"
HISTCONTROL=ignoreboth

export EDITOR="nvim"
export VISUAL="nvim"

# Configure commands
export BAT_THEME="Catppuccin Mocha"
export FZF_DEFAULT_COMMAND='fd --hidden --exclude .git'
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#313244,label:#CDD6F4 \
--preview-border=sharp"

# follow XDG base dir specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export LESSHISTFILE="$XDG_CACHE_HOME/less_history"

export QT_QPA_PLATFORMTHEME=qt5ct
export QT_STYLE_OVERRIDE=Adwaita-Dark

export PATH="/home/ari/.cache/.bun/bin:$PATH"
. "$HOME/.rokit/env"
