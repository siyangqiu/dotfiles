# Completion system
autoload -U compinit
if [[ ! -f "$ZDOTDIR/.zcompdump" || \
      "$ZDOTDIR/.zcompdump" -ot "$ZDOTDIR/.zshrc" ]]; then
  compinit
else
  compinit -C
fi

# History configuration
HISTFILE="$ZDOTDIR/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
HISTIGNORE="ls:cd:pwd:exit:clear"

setopt HIST_IGNORE_DUPS       # ignore consecutive duplicates
setopt HIST_IGNORE_ALL_DUPS   # remove older duplicates
setopt HIST_REDUCE_BLANKS     # remove superfluous blanks
setopt HIST_VERIFY            # edit before executing history expansion
setopt INC_APPEND_HISTORY     # write to history immediately
setopt SHARE_HISTORY          # share history between sessions
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_SPACE

# Functions
function smart-tab() {
  if [[ $LBUFFER != *' '* ]]; then
    zle expand-or-complete
    return
  fi
  if [[ $LBUFFER == *' ' ]]; then
    LBUFFER+='**'
  fi
}

function cd() {
  builtin cd "$@"

  if [[ -z "$VIRTUAL_ENV" ]] ; then
      if [[ -d ./env ]] ; then
        source ./env/bin/activate
      fi
  else
      parentdir="$(dirname "$VIRTUAL_ENV")"
      if [[ "$PWD"/ != "$parentdir"/* ]] ; then
        deactivate
      fi
  fi
}

# Environmental Variables
export FZF_DEFAULT_OPTS='
  --preview '"'"'
    if [[ -d {} ]]; then
      eza --tree --level=2 --color=always {}
    elif [[ -f {} ]]; then
      bat --style=numbers --color=always --line-range :500 {}
    fi
  '"'"'
  --preview-window=right:50%:wrap
  --bind ctrl-/:toggle-preview
'
export FZF_CTRL_R_OPTS='--no-preview'

# Aliases
alias sudo="sudo "
alias vim="nvim"
alias pr="poetry run "
alias pa='eval "$(poetry env activate)"'
alias j="z"

# Keybindings
bindkey '^H' backward-delete-word
bindkey '^@' autosuggest-accept
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[H"   beginning-of-line
bindkey "^[[F"   end-of-line
bindkey "^[[3~"  delete-char
bindkey "^[[3;5~" kill-word
#bindkey '^I' smart-tab

# ZLE Plugins
zle -N smart-tab
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Tools
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# fzf shell integration
source <(fzf --zsh)
