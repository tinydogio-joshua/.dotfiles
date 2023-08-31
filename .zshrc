# ============================================================================================
# Found: https://unix.stackexchange.com/a/614203
# vi mode
bindkey -v
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
# ============================================================================================

alias ll='ls -lG'
alias lla='ls -laG'
alias cat='bat --paging=never'
alias dev='python3 -m http.server'
alias vim='nvim'
alias rbrew='/usr/local/bin/brew'
alias pipa='source .env/bin/activate'

export RUSTFLAGS="-L/opt/homebrew/opt/libpq/lib"

. /opt/homebrew/opt/asdf/libexec/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)

# autoload -Uz compinit; compinit
# zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'

export WASMTIME_HOME="$HOME/.wasmtime"
export PATH="$WASMTIME_HOME/bin:$PATH"

# fzf
export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--ansi"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Always have starship last.
eval "$(starship init zsh)"
