[[ $- != *i* ]] && return
#if [[ $TERM != "screen-256color" && $TTY != /dev/tty* ]];then tmux a || tmux -2 -l -q && exit; fi

fpath=($HOME/.zsh/completion $HOME/.zsh/themes $HOME/.zsh/functions $fpath )
gemenvbin="${(f)"$(gem env path)"//://bin:}/bin"
PATH="$gemenvbin:$PATH"
path=( "$HOME/bin" $path )

autoload $HOME/.zsh/functions/[^_]*(.:t)
autoload -U promptinit && promptinit
prompt gtmanfred
for f in $HOME/.zsh/*.zsh(on); do
    . $f
done

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
hash -d eulerC=$HOME/work/cCode/projecteuler
hash -d completion=$HOME/.zsh/completion

#autoload complist
autoload -U compinit;
compinit

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
t(){
	tmux -L main "${@:-attach}";}
# vi: ft=zsh sw=2 ts=2
_tmux_pane_complete() {
    [[ -z "$TMUX_PANE" ]] && return 1
    local -a -U words
    words=(${=$(tmux capture-pane -S -1853 \; show-buffer \; delete-buffer)})
    compadd -a words
}

compdef -k _tmux_pane_complete menu-select '^T'

#export CC=clang
_force_rehash() {
  (( CURRENT == 1 )) && rehash
  return 1	# Because we didn't really complete anything
}
zstyle ':completion:::::' completer _force_rehash _complete _approximate
export MPD_HOST=24.98.68.157
export MPD_PORT=6600
typeset -U fpath path
