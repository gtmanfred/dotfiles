[[ $- != *i* ]] && return
#if [[ $TERM != "screen-256color" && $TTY != /dev/tty* ]];then tmux a || tmux -2 -l -q && exit; fi

fpath=($HOME/.zsh/completion $HOME/.zsh/themes $HOME/.zsh/functions $fpath )
path=($HOME/.cabal/bin "$HOME/bin" $path )

autoload $HOME/.zsh/functions/[^_]*(.:t)
autoload -U promptinit && promptinit
prompt gtmanfred
for f in $HOME/.zsh/*.zsh(on); do
    . $f
done
. ~/.private/zshkeys.zsh

alias less=$PAGER
alias zless=$PAGER 
autoload zmv

autoload -U edit-command-line
zle -N edit-command-line

eval "$(sed -n 's/^/bindkey /; s/: / /p' /etc/inputrc)"

hash -d github=$HOME/github
hash -d movies=/media/space/movies
hash -d gsl=/media/space/gsl
hash -d tvshows=/media/space/tvshows
hash -d csjava=$HOME/work/cs1331
hash -d archlog=$HOME/.weechat/logs/
hash -d units=/usr/lib/systemd/system/
hash -d userunits=$HOME/.config/systemd/user
hash -d eulerC=$HOME/work/cCode/projecteuler
hash -d space=/media/space
hash -d makepkgdir=/media/overflow/makepkg

#autoload complist
if (( UID )); then
    autoload -U compinit;
    compinit
fi

#[[ -n ${(f)$(alias run-help)} ]] && unalias run-help
autoload -U regex-replace

src()
{
        autoload -U zrecompile
        [ -f ~/.zshrc ] && zrecompile -p ~/.zshrc                    
        [ -f ~/.zcompdump ] && zrecompile -p ~/.zcompdump            
        [ -f ~/.zcompdump ] && zrecompile -p ~/.zcompdump            
        [ -f ~/.zshrc.zwc.old ] && rm -f ~/.zshrc.zwc.old            
        [ -f ~/.zcompdump.zwc.old ] && rm -f ~/.zcompdump.zwc.old    
        source ~/.zshrc
}

uploadImage (){
    imgurkey=`awk '/imgur/ {print $2}' /etc/imgurrc`
		curl -s -F "image=@$1" -F "key=$imgurkey" http://imgur.com/api/upload.xml | grep -E -o "<original_image>(.)*</original_image>" | grep -E -o "http://i.imgur.com/[^<]*"
  }

typeset -U fpath path

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
if [[ $TERM == xterm-termite ]]; then
  . /etc/profile.d/vte.sh

  __vte_ps1

  chpwd() {
    __vte_ps1
  }
fi
