autoload -Uz compinit && compinit

HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTFILE="$XDG_CACHE_HOME/zsh_history"

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_save_no_dups
setopt auto_param_slash

bindkey -e

source ~/.ls_colors

# aliases
alias v="nvim"
alias dlp='yt-dlp --extract-audio --audio-format best --embed-metadata --embed-thumbnail --audio-quality 0 -o "%(artist)s - %(track)s.%(ext)s"'
alias ls='eza --group-directories-first'

zstyle ':completion:*' menu no
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=1\;38
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color=always -1 $realpath'


# Plugins
source <(fzf --zsh)
source <(zoxide init zsh --cmd cd)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.zsh


setopt prompt_subst

# Git info format
git_prompt() {
	local branch
	branch=$(git symbolic-ref --short HEAD 2>/dev/null)
	[[ -n $branch ]] && echo  "  $branch "
}

NEWLINE=$'\n'
# precmd() {
# 	PROMPT="${NEWLINE}%F{#cdd6f4}%K{#313244} %n %(?..%F{#f38ba8}[%?]%f)%K{#1e1e2e}$(git_prompt)%K{#11111b}  %~ %f%k${NEWLINE} "
# }
precmd() {
	PROMPT="${NEWLINE}%F{#cdd6f4}%K{#313244} %n %(?..%F{#f38ba8}[%?]%f)%K{#1e1e2e}$(git_prompt)%K{#11111b} %~ %f%k${NEWLINE} "
}
