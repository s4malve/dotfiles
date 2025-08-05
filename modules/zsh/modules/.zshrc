# zinit install
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

source "${ZINIT_HOME}/zinit.zsh"

export PATH="$PATH:$HOME/.scripts/:/USR/local/go/bin:$HOME/.cargo/bin"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

PS1='[\u@\h \W]\$ '
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias la='ls -la'
alias ll='ls -ll'

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
HISTDUP=erase

setopt appendhistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_save_no_dups
setopt sharehistory

# Plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# The following lines were added by compinstall
zstyle :compinstall filename '/home/s4malve/.zshrc'
autoload -Uz compinit
compinit
zinit cdreplay -q
# End of lines added by compinstall


# Keybindings
bindkey -v
bindkey ^p history-search-backward
bindkey ^n history-search-forward
bindkey -s ^f "tmux-sessionizer\n"


if [ -f /usr/bin/fastfetch ]; then
	echo ""
	fastfetch
fi

# WARNING: Keep these lines at the very bottom of your file
eval "$(fzf --zsh)"
eval "$(zoxide init zsh --cmd cd)"
eval "$(starship init zsh)"
