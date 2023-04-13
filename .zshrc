alias ll='ls -lG'
alias lla='ls -laG'
alias cat='bat --paging=never'
alias dev='python3 -m http.server'
alias vim='nvim'

export RUSTFLAGS="-L/opt/homebrew/opt/libpq/lib"

. /opt/homebrew/opt/asdf/libexec/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)

autoload -Uz compinit; compinit
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'

# Always have starship last.
eval "$(starship init zsh)"


export WASMTIME_HOME="$HOME/.wasmtime"

export PATH="$WASMTIME_HOME/bin:$PATH"