# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git

# Load completions
autoload -U compinit && compinit

zinit cdreplay -q

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
	eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/my_catppuccin.toml)"
fi

# Keybindings
bindkey -e
bindkey '^y' autosuggest-accept # or do I just want ^f?
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# OS specific
if [[ "$OSTYPE" == "darwin"* ]]; then
	# brew and brew tools
	eval "$(/opt/homebrew/bin/brew shellenv)"
	export PATH="$(brew --prefix)/opt/python@3.11/libexec/bin:$PATH"
	export PATH="$(brew --prefix)/opt/llvm/bin:$PATH"

	# miniconda
	eval "$(conda "shell.$(basename "${SHELL}")" hook)"

	# modular
	export MODULAR_HOME="/Users/dlond/.modular"

	# clipboard
	alias clip="pbcopy"

elif [[ "$OSTYPE" == "linux-gnu"* ]] then
	# my tools
	export PATH="$HOME/bin:$PATH"

	# miniconda
	__conda_setup="$('/local1/dlond/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
	if [ $? -eq 0 ]; then
		eval "$__conda_setup"
	else
		if [ -f "/local1/dlond/miniforge3/etc/profile.d/conda.sh" ]; then
			. "/local1/dlond/miniforge3/etc/profile.d/conda.sh"
		else
			export PATH="/local1/dlond/miniforge3/bin:$PATH"
		fi
	fi
	unset __conda_setup

	if [ -f "/local1/dlond/miniforge3/etc/profile.d/mamba.sh" ]; then
		. "/local1/dlond/miniforge3/etc/profile.d/mamba.sh"
	fi

	# clipboard
	alias clip="xclip -selection clipboard"
fi

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Aliases
alias ls='ls -G'
alias ll='ls -lah'
alias vim='nvim'
alias sf='fzf -m --preview="bat --color=always {}" --bind "ctrl-w:become(nvim {+}),ctrl-y:execute-silent(echo {} | clip)+abort"'

