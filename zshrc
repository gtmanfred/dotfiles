# Copyright 2012 ArcheyDevil. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without modification, are
# permitted provided that the following conditions are met:
#
#    1. Redistributions of source code must retain the above copyright notice, this list of
#       conditions and the following disclaimer.
#    2. Redistributions in binary form must reproduce the above copyright notice, this list
#	      of conditions and the following disclaimer in the documentation and/or other materials
#        provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY ARCHEYDEVIL ''AS IS'' AND ANY EXPRESS OR IMPLIED
#	WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
# FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL ARCHEYDEVIL OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
# ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# The views and conclusions contained in the software and documentation are those of the
# authors and should not be interpreted as representing official policies, either expressed
# or implied, of ArcheyDevil.

autoload omz

plugins=(archlinux git sprunge vim archlinux) #tmux

zstyle :omz:style theme mine
zstyle ':omz:plugins:*' autostart on

#[[ -n $SSH_CONNECTION ]] && plugins+=(keychain)
plugins+=()

omz init
[[ $- != *i* ]] && return
#if [[ $TERM != "screen-256color" && $TTY != /dev/tty* ]];then tmux a || tmux -2 -l -q && exit; fi
zstyle ':completion:*:*:*:*:*' menu select  
export EDITOR=vim
export VISUAL=vim
export PAGER=less
if [[ "${(M)PATH:#*scripts*}" == "" ]];then
	export PATH="$PATH:$HOME/.scripts"
fi
autoload zmv

eval "$(sed -n 's/^/bindkey /; s/: / /p' /etc/inputrc)"
hash -d github=$HOME/github
hash -d archlinux=$HOME/irc/irc.freenode.net/\#archlinux/
hash -d movies=$HOME/space/movies
hash -d gsl=$HOME/space/gsl
hash -d tvshows=$HOME/space/tvshows
hash -d csjava=$HOME/work/cs1331
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# vi: ft=zsh sw=2 ts=2
function src()
{
        autoload -U zrecompile
                [ -f ~/.zshrc ] && zrecompile -p ~/.zshrc
                [ -f ~/.zcompdump ] && zrecompile -p ~/.zcompdump
                [ -f ~/.zcompdump ] && zrecompile -p ~/.zcompdump
                [ -f ~/.zshrc.zwc.old ] && rm -f ~/.zshrc.zwc.old
                [ -f ~/.zcompdump.zwc.old ] && rm -f ~/.zcompdump.zwc.old
                source ~/.zshrc
}

function uploadImage {
		curl -s -F "image=@$1" -F "key=486690f872c678126a2c09a9e196ce1b" http://imgur.com/api/upload.xml | grep -E -o "<original_image>(.)*</original_image>" | grep -E -o "http://i.imgur.com/[^<]*"
  }
function t(){
	tmux -L main "${@:-attach}";}
zstyle ':completion:*:*:vim:*:all-files' ignored-patterns '*.class'
zstyle ':completion:*:*:cat:*:all-files' ignored-patterns '*.class'
setopt completealiases
setopt printeightbit
DISABLE_AUTO_TITLE=true
export BROWSER=luakit
