autoload -U compinit && compinit

export FZF_DEFAULT_OPTS='
  --preview "bat --style=numbers --color=always --line-range :500 {}"
  --preview-window=right:50%:wrap
  --bind "ctrl-/:toggle-preview"
'

alias sudo="sudo "
alias vim="nvim"
alias pr="poetry run "
alias pa='eval "$(poetry env activate)"'
alias j="z"

bindkey '^H' backward-delete-word
bindkey '^@' autosuggest-accept
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[H"   beginning-of-line
bindkey "^[[F"   end-of-line
bindkey "^[[3~"  delete-char
bindkey "^[[3;5~" kill-word

source /usr/share/zsh-autosuggestions
# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

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

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
source <(fzf --zsh)