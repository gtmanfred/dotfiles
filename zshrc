# Path to your oh-my-zsh configuration.
setopt autocd
#ZSH=$HOME/.oh-my-zsh
fpath=($HOME/.zsh/completion $fpath)


#if [[ $(tty) == /dev/pts/* ]]; then
#	a=$(tmux ls)
#	if [[ -z $a ]]; then
#		unset a
#        [[ $TERM != "screen-256color" ]] && tmux -2 -l -q && exit
#    else
#		unset a
#        [[ $TERM != "screen-256color" ]] && tmux attach && exit
#    fi
#fi


typeset -g -A key
#bindkey -v
# bind special keys according to readline configuration
eval "$(sed -n 's/^/bindkey /; s/: / /p' /etc/inputrc)"
#bindkey "\e[1~" beginning-of-line # Home
#bindkey "\e[4~" end-of-line # End
#bindkey "\e[5~" beginning-of-history # PageUp
#bindkey "\e[6~" end-of-history # PageDown
#bindkey "\e[2~" quoted-insert # Ins
#bindkey "\e[3~" delete-char # Del
#bindkey "\e[5C" forward-word
#bindkey "\eOc" emacs-forward-word
#bindkey "\e[5D" backward-word
#bindkey "\eOd" emacs-backward-word
#bindkey "\e\e[C" forward-word
#bindkey "\e\e[D" backward-word
#bindkey "\e[Z" reverse-menu-complete # Shift+Tab
## for rxvt
#bindkey '^[[7~' beginning-of-line # Home
#bindkey '^[[8~' end-of-line # End
#
#zstyle ':completion:*' completer _complete 
#zstyle ':completion:*' prompt '%e'
#zstyle ':completion:*' use-compctl true
#zstyle :compinstall filename '/home/daniel/.zshrc'

autoload -Uz compinit
compinit
if [ -f ~/.zalias ]; then
    source ~/.zalias
fi
#source $HOME/.zsh/syntax/zsh-syntax-highlighting.zsh
# [ -f ~/.zshkeys ] && . ~/.zshkeys


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="gallifrey"


# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git)
setopt nocorrectall
#source $ZSH/oh-my-zsh.sh 
source ~/.zprompt
#source ~/.zsh/command-not-found.zsh
#source ~/.zsh/keybindings.zsh
#source ~/.zsh/history.zsh
for f in $HOME/.zsh/*.zsh; do
	source $f
done
export EDITOR=vim
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey "^X" edit-command-line
export _humblebundleVkey=G7T74bUUZKSH   
# Customize to your needs...

HOSTFILE=~/.hosts
## aqiicHeck for an interactive session
## Check for an interactive session
#[ -z "$PS1" ] && return
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
#if [ -f ~/.bash_alias ]; then
#    source ~/.bash_alias
#fi
#case "$TERM" in
#xterm*|rxvt*)
#    PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'
#        ;;
#*)
#        ;;
#esac
##PS1='\[\033[1;32m\]\W>\[\033[0m\]'
#PS1='\[\e[0;32m\]\h\[\e[m\] \[\e[1;34m\]\W\[\e[m\] \[\e[1;32m\]>\[\e[m\]'  #\[\e[m\]\[\e[1;37m\]
#export BROWSER='chromium'
#export PATH=/usr/local/MATLAB/R2011a/bin/:$PATH
#export AWT_TOOLKIT="MToolkit"
#export MATLAB_JAVA=/usr/lib/jvm/java-6-openjdk/jre
# reload zshrc
export BROWSER=dwb
function src()
{
        autoload -U zrecompile
                [ -f ~/.zshrc ] && zrecompile -p ~/.zshrc
                [ -f ~/.zcompdump ] && zrecompile -p ~/.zcompdump
                #[ -f ~/.zcompdump ] && zrecompile -p ~/.zcompdump
                [ -f ~/.zshrc.zwc.old ] && rm -f ~/.zshrc.zwc.old
                [ -f ~/.zcompdump.zwc.old ] && rm -f ~/.zcompdump.zwc.old
                source ~/.zshrc
}


function uploadImage {
	apikey=$(awk '/imgur/ {print $2}' /etc/imgurrc)
  curl -s -F "image=@$1" -F "key=$apikey" http://imgur.com/api/upload.xml | grep -E -o "<original_image>(.)*</original_image>" | grep -E -o "http://i.imgur.com/[^<]*"
  }
zstyle ':completion:*:*:vim:*:all-files' ignored-patterns '*.class|*.jpeg'
setopt completealiases
export PATH=/home/daniel/.cabal/bin:$PATH:$HOME/.scripts
export export CLASSPATH=$CLASSPATH:/usr/share/java/bsh.jar

export MPD_HOST=24.98.68.157
export MPD_PORT=6600
