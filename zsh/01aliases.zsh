#!/bin/zsh
alias -s png=feh
alias -s jpg=feh
alias -s gif=feh
alias -s GIF=feh
alias -s JPG=feh
alias -s PNG=feh
alias -s gz='tar -xzvf'
alias -s bz2='tar -xjvf'
alias -s java=$EDITOR
alias -s txt=$EDITOR
alias -s PKGBUILD=$EDITOR


# Normal aliases
#alias ls='ls --color=auto -F'
alias lsd='ls -ld *(-/DN)'
alias lsa='ls -ld .*'
alias f='find |grep'
alias dir='ls -1'
alias ..='cd ..'
alias firestarter='sudo su -c firestarter'
hist () { grep "$1" ~/.zsh_history ; }
alias mem="free -m"

# command L equivalent to command |less
alias -g L='|less' 

# command S equivalent to command &> /dev/null &
alias -g S='&> /dev/null &'




#alias alsa='alsamixer'
#alias ls='ls --color=auto'
alias vga='xrandr --output LVDS1 --off --output VGA1 --mode 1920x1080 --output LVDS1 --primary'
alias eee='xrandr --output LVDS1 --auto --output VGA1 --off'
alias dual='xrandr --output HDMI-1 --left-of DVI-I-1; xrandr --output HDMI-1 --primary'
alias webcam='mplayer -tv driver=v4l2:fps=15:height=288:width=352 tv://'
alias la='ls -a'
alias rmpkgs='pacman -Qqdt|sudo pacman -Rns -'
alias hip='export homeip="$(curl ifconfig.me)"'
alias vp='vim -u ~/.vimrc-p'
alias snapshot='mplayer tv:// -tv driver=v4l2:width=640:height=480:device=/dev/video0 -fps 15 -vf screenshot'
alias vncserv='x11vnc -display :0 -geometry 1024x600'
alias sss='scrot -ucd4 && eog $(ls -tr | tail -n1)'
alias ompscreen="import png:- | curl -s#F file1=@- http://ompldr.org/upload |sed -n '/url/s/.*url=\([^]]*\)\].*/\1/p'"


alias maxbright='sudo setpci -s 00:02.0 f4.b=ff'
#alias pianobar='pianobar | tee /tmp/pianobar.out'
alias alert="(beep && notify-send compiled)|| (beep && notify-send error)"
alias progress='pv -ptera'
alias alarm="tty=$(tty) at -f $HOME/.scripts/alarm.sh"
alias beep="beep -f 1000 -n -f 2000 -n -f150"
alias checkupdate='$HOME/github/dotfiles/checkupdates'
alias -g pager='vim -R - "+noremap q <esc>:q!<cr>"'
alias -g reflect="reflector --threads 2 -p http -c 'United States' --sort rate --save /etc/pacman.d/mirrorlist -f5 -a"
#alias -g ompload="|curl -sF file1=@- http://ompldr.org/upload|sed -n '/url/s/.*url=\([^]]*\)\].*/\1/p'"
alias sudo="sudo "
alias screens='nvidia-settings --assign CurrentMetaMode="DFP-1: nvidia-auto-select +1080+0, DFP-0: nvidia-auto-select +0+0 {Rotation=right}"'

networktest && alias ssh='ssh -F ~/.ssh/rackspaceconf'
function rdp () { 
    rdesktop -d intensive -u dani6186 -p - -g 1152x864 -a 16 -k en-gb -x 1 $1.vts.rackspace.com
}

alias rhub='GITHUB_HOST=github.rackspace.com hub'
