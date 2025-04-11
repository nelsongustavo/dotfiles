
# Path to your oh-my-zsh installation.
export ZSH="/Users/gustavop/.oh-my-zsh"

ZSH_THEME=""

# Add wisely, as too many plugins slow down shell startup.
plugins=(git gustavop docker docker-compose asdf)

source $ZSH/oh-my-zsh.sh

source <(kubectl completion zsh)

# You may need to manually set your language environment
export LANG=en_US.UTF-8

export EDITOR="nvim"
export VISUAL="$EDITOR"
# JAVA_HOME
# export JAVA_HOME=$(/usr/libexec/java_home -v "1.8.0_431")
# export JAVA_HOME=$(/usr/libexec/java_home -v "11")
export JAVA_HOME=$(/usr/libexec/java_home -v "21.0.6")

alias lc='colorls -lA --sd'
alias inv='nvim $(fzf --preview "bat --color=always --style=numbers --line-range=:500 {}")'

#Blade
export PATH="$PATH:$HOME/Library/PackageManager/bin"

autoload -U add-zsh-hook

export DOCKER_HOST=unix://"$HOME/.docker/run/docker.sock"

IJ_CLONE_PATH="$HOME/code/liferay-intellij"

ij() {
        ${IJ_CLONE_PATH}/intellij "$@"
}

export PATH="$HOME/.tmuxifier/bin:$PATH"

eval "$(starship init zsh)"
eval "$(tmuxifier init -)"
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
alias lzd='lazydocker'

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
export PATH="/usr/local/opt/libpq/bin:$PATH"
