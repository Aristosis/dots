# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export VISUAL=nvim
export EDITOR=nvim
export DINGUS_TOKEN="MTM1ODA2MzIzMjM5NjMwMDQ0OQ.GXcGr8.12_Hx-AQ7iWET8x2d7fSMbNLVuYG65Ot_6o1v0"
eval "$(zoxide init zsh --cmd cd)"

source <(fzf --zsh)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias quick-dlp='yt-dlp -x --audio-format opus --embed-thumbnail --embed-metadata --output "%(artist)s - %(title)s.%(ext)s"'
alias v='nvim'
path+=('/home/ari/.rokit/bin/')
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
