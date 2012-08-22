ABSROOT="$HOME/github/abs"
eval $(keychain start)

setopt completealiases
setopt printeightbit
setopt braceexpand
setopt braceccl
DISABLE_AUTO_TITLE=true
export EDITOR=vim
export GIT_EDITOR=$EDITOR
export SUDO_EDITOR=$EDITOR
GPG_TTY=$(tty)
export BROWSER=firefox
MPD_HOST=${${"$(ip -4 addr show eth0)"#*inet }%%/24*}
[[ -z $SSH_CONNECTION ]] && DISPLAY=:0
export EDITOR=vim
export VISUAL=vim
export PAGER=less
