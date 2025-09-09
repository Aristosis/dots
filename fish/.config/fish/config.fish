# PATH extensions
fish_add_path "$HOME/.cache/.bun/bin"
fish_add_path "$HOME/.cargo/bin"
sh "$HOME/.rokit/env"

set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_CACHE_HOME "$HOME/.cache"
set -x LESSHISTFILE "$XDG_CACHE_HOME/less_history"

set -x LS_COLORS (cat ~/.ls_colors)

# Editor
set -x EDITOR nvim
set -x VISUAL nvim
set -x SUDO_EDITOR nvim

# BAT
set -x BAT_THEME "Catppuccin Mocha"
set -x LESSOPEN "|/usr/sbin/batpipe %s";
set -x LESS "$LESS -R";
set -x BATPIPE "color";
batman --export-env | source

# FZF
set -x FZF_DEFAULT_COMMAND 'fd --hidden --exclude .git'
set -x FZF_DEFAULT_OPTS "--color=bg+:#313244,spinner:#F5E0DC,hl:#F38BA8 --color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC --color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 --color=selected-bg:#45475A --color=border:#313244,label:#CDD6F4 --preview-border=sharp --preview='cat --color=always {}'"
set -x FZF_DEFAULT_OPTS "\
--color=bg+:#313244,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#313244,label:#CDD6F4 \
--preview-border=sharp \
--preview='cat --color=always {}'"

# Aliases
alias cat='bat -pp'
alias dlp='yt-dlp --extract-audio --audio-format best --embed-metadata --embed-thumbnail --audio-quality 0 -o "%(artist)s - %(track)s.%(ext)s"'
alias find='fd'
alias grep='rg'
alias ls='eza --icons --group-directories-first'
alias v='nvim'
abbr --add "!!" --position anywhere --function get_last_cmd

fzf_key_bindings
zoxide init fish --cmd=cd | source
