set -x MANPAGER "sh -c 'sed -u -e \"s/\\x1B\\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_CACHE_HOME "$HOME/.cache"
set -x LESSHISTFILE "$XDG_CACHE_HOME/less_history"

set -x LS_COLORS (cat ~/.ls_colors)

# Editor
set -x EDITOR nvim
set -x VISUAL nvim
set -x SUDO_EDITOR nvim

# BAT Theme
set -x BAT_THEME "Catppuccin Mocha"

# FZF Defaults
set -x FZF_DEFAULT_COMMAND 'fd --hidden --exclude .git'
set -x FZF_DEFAULT_OPTS "--color=bg+:#313244,spinner:#F5E0DC,hl:#F38BA8 --color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC --color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 --color=selected-bg:#45475A --color=border:#313244,label:#CDD6F4 --preview-border=sharp"

# Qt themes
set -x QT_QPA_PLATFORMTHEME qt5ct
set -x QT_STYLE_OVERRIDE Adwaita-Dark

# PATH extensions
fish_add_path "$HOME/.cache/.bun/bin"
fish_add_path "$HOME/.cargo/bin"

sh "$HOME/.rokit/env"

# Aliases
alias cat='bat -pp'
alias dlp='yt-dlp --extract-audio --audio-format best --embed-metadata --embed-thumbnail --audio-quality 0 -o "%(artist)s - %(track)s.%(ext)s"'
alias find='fd'
alias grep='rg'
alias ls='eza --icons --group-directories-first'
alias v='nvim'

fzf_key_bindings
zoxide init fish --cmd=cd | source
