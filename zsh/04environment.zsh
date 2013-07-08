#export SUDO_PROMPT="$(print -P '%F{red}[sudo]%f ponyword for %F{green}%n%f@%F{yellow}%m%f: ')"
#[[ -z $SSH_AUTH_SOCK ]] && source <(keychain start loadkeys)
export VIMINIT='let $MYVIMRC="/home/daniel/.config/vim/vimrc"| source $MYVIMRC'
export SUDO_PROMPT="${(%):-"%F{red}[sudo]%f %F{green}%%p%f@%F{yellow}%%h%f: "}"
export ABSROOT=$HOME/github/abs


setopt completealiases
setopt printeightbit
setopt braceexpand
setopt braceccl
DISABLE_AUTO_TITLE=true
export EDITOR=vim
export GIT_EDITOR=$EDITOR
export SUDO_EDITOR=$EDITOR
export GPG_TTY=$(tty)
export BROWSER=firefox
export EDITOR=vim
export VISUAL=vim
export PAGER=less
