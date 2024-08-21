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

# Configure Aliases
alias ll='ls -lG'
alias lla='ls -laG'
alias cat='bat --paging=never'
alias dev='python3 -m http.server'
alias vim='nvim'
alias rbrew='/usr/local/bin/brew'
alias pipa='source .env/bin/activate'
alias gs='cat package.json | jq .scripts'

# Configure Rust
export RUSTFLAGS="-L/opt/homebrew/opt/libpq/lib"

# Configure ASDF
. /opt/homebrew/opt/asdf/libexec/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)

# Configure Autocomplete
autoload -Uz compinit; compinit
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'

# Default Editors
export EDITOR="vim"
export VISUAL="vim"

# Configure Prompt
precmd() { print "" }
preexec() { print "" }
NEWLINE=$'\n'
PROMPT="%F{yellow}%~%f${NEWLINE}→ "

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

export CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include"

# History
# the detailed meaning of the below three variable can be found in `man zshparam`.
export HISTFILE=~/.histfile
export HISTSIZE=1000000   # the number of items for the internal history list
export SAVEHIST=1000000   # maximum number of items for the history file

# The meaning of these options can be found in man page of `zshoptions`.
setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time

# FZF + RipGrep
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --full-path "$HOME/Development" --type d --strip-cwd-prefix'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

listDevelopment() {
  ll ~/Development
}
zle -N listDevelopment listDevelopment
bindkey '^O' listDevelopment

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="~/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# Launch Tmux Session
bindkey -s "^[\\" "~/.config/personal_scripts/tmux-session.sh\n"
