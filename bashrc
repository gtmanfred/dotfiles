# aqiicHeck for an interactive session
# Check for an interactive session
[ -z "$PS1" ] && return
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
# PS1 COLOURS
BLACK='\[\033[0;30m\]'
RED='\[\033[0;31m\]'
GREEN='\[\033[0;32m\]'
YELLOW='\[\033[1;33m\]'
BLUE='\[\033[0;34m\]'
MAGENTA='\[\033[0;35m\]'
CYAN='\[\033[0;36m\]'
WHITE='\[\033[1;37m\]'
NC='\[\033[0m\]'
 
# PROMPT
PS1="${debian_chroot:+($debian_chroot)}>$GREEN\u$NC@$GREEN\h$NC╺─╸$WHITE[$NC\W$WHITE]$NC; "

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting


RS="\[\033[0m\]"        # reset
HC="\[\033[1m\]"        # hicolor
UL="\[\033[4m\]"        # underline
INV="\[\033[7m\]"       # inverse background and foregroud
FBLK="\[\033[30m\]"     # foreground black
FRED="\[\033[31m\]"     # foreground red
FGRN="\[\033[32m\]"     # foreground green
FYEL="\[\033[33m\]"     # foreground yellow
FBLE="\[\033[34m\]"     # foreground blue
FMAG="\[\033[35m\]"     # foreground magenta
FCYN="\[\033[36m\]"     # foreground cyan
FWHT="\[\033[37m\]"     # foreground white
BBLK="\[\033[40m\]"     # background black
BRED="\[\033[41m\]"     # background red
BGRN="\[\033[42m\]"     # background green
BYEL="\[\033[43m\]"     # background yellow
BBLE="\[\033[44m\]"     # background blue
BMAG="\[\033[45m\]"     # background magenta
BCYN="\[\033[46m\]"     # background cyan
BWHT="\[\033[47m\]"     # background white
    if (( ! UID )); then
        PS1="[$HC$FRED\u$RS@$HC$FRED\h $FWHT\W$RS]# "
    else
        PS1="[$HC$FBLE\u$RS@$HC$FBLE\h $FWHT\W$RS]\$ "
    fi
