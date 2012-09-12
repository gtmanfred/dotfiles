# aqiicHeck for an interactive session
# Check for an interactive session
[[ "$-" == *i* ]] && [[ "$PWD" == "/" ]] && cd $HOME
[ -z "$PS1" ] && return
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
