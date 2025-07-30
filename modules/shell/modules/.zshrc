
export PATH="$HOME/.scripts/:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

PS1='[\u@\h \W]\$ '
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias la='ls -la'
alias ll='ls -ll'

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/s4malve/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

if [ -f /usr/bin/fastfetch ]; then
	echo ""
	fastfetch
fi

eval "$(zoxide init zsh --cmd cd)"
eval "$(starship init zsh)"

bindkey -s ^f "tmux-sessionizer\n"
