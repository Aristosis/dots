export VISUAL=nvim
export EDITOR=nvim
eval "$(zoxide init zsh --cmd cd)"

source <(fzf --zsh)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias quick-dlp='yt-dlp -x --audio-format opus --embed-thumbnail --embed-metadata --output "%(artist)s - %(title)s.%(ext)s"'

path+=('/home/ari/.rokit/bin/')
