#export SUDO_PROMPT="$(print -P '%F{red}[sudo]%f ponyword for %F{green}%n%f@%F{yellow}%m%f: ')"
#[[ -z $SSH_AUTH_SOCK ]] && source <(keychain start loadkeys)
#[[ -z $SSH_AUTH_SOCK ]] && source <(envoy -p -t gpg-agent)
export VIMINIT='let $MYVIMRC="$HOME/.config/vim/vimrc"| source $MYVIMRC'
export SUDO_PROMPT="${(%):-"%F{red}[sudo]%f %F{green}%%p%f@%F{yellow}%%h%f: "}"
export ABSROOT=$HOME/github/abs
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export HOMEBREW_GITHUB_API_TOKEN="e0d22b21f2124c692c6b0e6dcf057c876222774b"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

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
