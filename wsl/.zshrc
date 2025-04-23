export FLYCTL_INSTALL="/home/siyangqiu/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

alias sudo="sudo "
alias vim="nvim"
alias pr="poetry run "

bindkey '^H' backward-delete-word
bindkey '^@' autosuggest-accept
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
bindkey "^[[3;5~" kill-word

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

function cd() {
  builtin cd "$@"

  if [[ -z "$VIRTUAL_ENV" ]] ; then
    ## If env folder is found then activate the vitualenv
      if [[ -d ./env ]] ; then
        source ./env/bin/activate
      fi
  else
    ## check the current folder belong to earlier VIRTUAL_ENV folder
    # if yes then do nothing
    # else deactivate
      parentdir="$(dirname "$VIRTUAL_ENV")"
      if [[ "$PWD"/ != "$parentdir"/* ]] ; then
        deactivate
      fi
  fi
}

eval "$(starship init zsh)"
# Start Docker daemon automatically when logging in if not running.
RUNNING=`ps aux | grep dockerd | grep -v grep`
if [ -z "$RUNNING" ]; then
    sudo dockerd > /dev/null 2>&1 &
    disown
fi
