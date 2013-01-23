[[ $- != *i* ]] && return
[[ "$PWD" == "/" ]] && cd $HOME
umask 007


fpath=($HOME/.zsh/completion $HOME/.zsh/themes $HOME/.zsh/functions $fpath)
path=($HOME/bin $path /home/sysadm/bin /usr/sbin /sbin $HOME/bin/androidsdk $HOME/bin/androidsdk/tools $HOME/bin/androidsdk/platform-tools)

[[ ${(M)$(uname -r)%el5} == el5 ]] && exec bash
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


hash -d github=$HOME/github
hash -d scratch=/scratch/tmp
hash -d mock=/var/lib/mock

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

typeset -U fpath path
