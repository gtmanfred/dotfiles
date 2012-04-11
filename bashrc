# aqiicHeck for an interactive session
# Check for an interactive session
#[ -z "$PS1" ] #&& return
#if [[ $(tty) = /dev/pts/* ]]; then
#    #if [[ `tmux list-session` ]]; then
#    if [[ `tmux ls` ]]; then
#        #session=`tmux list-session`
#        [[ $TERM != "screen" ]] && tmux attach && exit
#        #[[ $TERM != "screen" ]] && tmux attach-session -t ${session:0:1} -2 -l -q && exit
#    else
#        [[ $TERM != "screen" ]] && tmux -2 -l -q && exit
#    fi
#fi
if [ -f ~/.bash_alias ]; then
    source ~/.bash_alias
fi
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'
        ;;
*)
        ;;
esac
#PS1='\[\033[1;32m\]\W>\[\033[0m\]'
PS1='\[\e[0;32m\]\h\[\e[m\] \[\e[1;34m\]\W\[\e[m\] \[\e[1;32m\]>\[\e[m\]'  #\[\e[m\]\[\e[1;37m\]
export BROWSER='chromium'
export PATH=/usr/local/MATLAB/R2011a/bin/:$PATH
export AWT_TOOLKIT="MToolkit"
export MATLAB_JAVA=/usr/lib/jvm/java-6-openjdk/jre
export EDITOR="vim"
#alias mb='mplayer -ao alsa:device=btheadset'
HOSTFILE=~/.hosts
