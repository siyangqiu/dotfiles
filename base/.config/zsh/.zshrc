# Completion system
autoload -U compinit
if [[ ! -f "$ZDOTDIR/.zcompdump" || \
      "$ZDOTDIR/.zcompdump" -ot "$ZDOTDIR/.zshrc" ]]; then
  compinit
else
  compinit -C
fi

# Environmental Variables
export FZF_DEFAULT_OPTS='
  --preview "bat --style=numbers --color=always --line-range :500 {}"
  --preview-window=right:50%:wrap
  --bind "ctrl-/:toggle-preview"
'

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

# Plugins
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Functions
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

# Tools
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# fzf shell integration
source <(fzf --zsh)