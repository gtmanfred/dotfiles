[[ $- != *i* ]] && return
#if [[ $TERM != "screen-256color" && $TTY != /dev/tty* ]];then tmux a || tmux -2 -l -q && exit; fi

fpath=($HOME/.zsh/completion $HOME/.zsh/themes $HOME/.zsh/functions $fpath)
PATH="$HOME/.cabal/bin:$PATH:$HOME/.scripts"

autoload -U promptinit && promptinit
prompt gtmanfred
for f in $HOME/.zsh/*.zsh(on); do
    . $f
done

zstyle ':completion:*:*:*:*:*' menu select  
export EDITOR=vim
export VISUAL=vim
#export PAGER=/usr/bin/vimpager
#export PAGER="/usr/bin/vim \"+noremap q <esc>:q!<cr>\" -"
alias less=$PAGER
alias zless=$PAGER 
export PAGER=less
autoload zmv

autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
eval "$(sed -n 's/^/bindkey /; s/: / /p' /etc/inputrc)"
hash -d github=$HOME/github
hash -d movies=$HOME/space/movies
hash -d gsl=$HOME/space/gsl
hash -d tvshows=$HOME/space/tvshows
hash -d csjava=$HOME/work/cs1331
hash -d archlog=$HOME/.weechat/logs/
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey "^X" edit-command-line
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
zstyle ':completion:*:*:vim:*:all-files' ignored-patterns '*.class'
zstyle ':completion:*:*:cat:*:all-files' ignored-patterns '*.class'
setopt completealiases
setopt printeightbit
setopt braceexpand
setopt braceccl
DISABLE_AUTO_TITLE=true
export EDITOR=vim
export GIT_EDITOR=$EDITOR
export SUDO_EDITOR=$EDITOR
#GPG_TTY=$(tty)
export BROWSER=firefox
# vi: ft=zsh sw=2 ts=2
_tmux_pane_complete() {
    [[ -z "$TMUX_PANE" ]] && return 1
    local -a -U words
    words=(${=$(tmux capture-pane -S -1853 \; show-buffer \; delete-buffer)})
    compadd -a words
}

compdef -k _tmux_pane_complete menu-select '^T'
export _humblebundleVkey=G7T74bUUZKSH   
_JAVA_AWT_WM_NONREPARENTING=1 
[[ -z $SSH_CONNECTION ]] && DISPLAY=:0
export HOSTNAME=MyPhonE

#export CC=clang

typeset -U fpath path
