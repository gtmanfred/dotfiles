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
alias ls='ls --color=auto -F'
alias lsd='ls -ld *(-/DN)'
alias lsa='ls -ld .*'
alias f='find |grep'
alias c="clear"
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
alias lyrics='~/.scripts/01-from-harddisk.pl'
alias untar='tar xzvf'
alias r='sudo pacman -Rns'
alias ls='ls --color=auto'
alias m='mplayer'
alias mb='mplayer -ao alsa:device=btheadset,surround51'
#alias i='sudo pacman -S --noconfirm '
#alias u='sudo pacman -Syu'
alias vga='xrandr --output LVDS1 --off --output VGA1 --mode 1920x1080 --output LVDS1 --primary'
alias eee='xrandr --output LVDS1 --auto --output VGA1 --off'
alias dual='xrandr --output LVDS1 --auto --output VGA1 --mode 1920x1080; xrandr --output VGA1 --right-of LVDS1; xrandr --output LVDS1 --primary'
alias gh='/home/daniel/.scripts/github'
alias u='packer -Syu --noconfirm;rm /home/daniel/.private/updates.txt;touch /home/daniel/.private/updates.txt'
alias ureg='packer -Syu ;rm /home/daniel/.private/updates.txt;touch /home/daniel/.private/updates.txt'
alias i='packer -Syu && packer -S --noconfirm '
alias ireg='packer -Syu && packer -S '
alias webcam='mplayer -tv driver=v4l2:fps=15:height=288:width=352 tv://'
alias adb='sudo /opt/android-sdk/platform-tools/adb'
alias star='xinit starcraft -- :1'
alias war='xinit warcraft -- :1'
alias mine='xinit minecraft -- :1'
alias chrome='xinit chrome -- :2'
alias cpuset='/home/daniel/.scripts/cpufreq'
alias matlab='matlab -nosplash -nodesktop'
alias halt='sudo halt'
alias timer='/home/daniel/.scripts/timer.py'
alias la='ls -a'
alias rmpkgs='sudo pacman -Rns $(pacman -Qqdt)'
#alias hip='export homeip=`curl -s http://checkip.dyndns.org | sed 's/[^0-9.]//g'`'
alias hip='export homeip=`curl -s http://automation.whatismyip.com/n09230945.asp`'
#alias urxvt='`urxvt -e screen &`'
alias vp='vim -u ~/.vimrc-p'
alias jtv='~/.scripts/jtv'
alias snapshot='mplayer tv:// -tv driver=v4l2:width=640:height=480:device=/dev/video0 -fps 15 -vf screenshot'
alias snapvid='/home/daniel/.scripts/snapvideo'
alias vncserv='x11vnc -display :0 -geometry 1024x600'
alias fa='/home/daniel/.scripts/makeplaylist'
alias sss='scrot -ucd4 && eog $(ls -tr | tail -n1)'
alias youtube='~/.scripts/youtube'


# Useful functions
extract () {
    if [ -f $1 ] ; then
	case $1 in
            *.tar.bz2)   tar xvjf $1    ;;
            *.tar.gz)    tar xvzf $1    ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
           	*.gz)        gunzip $1      ;;
            *.tar)       tar xvf $1     ;;
            *.tbz2)      tar xvjf $1    ;;
            *.tgz)       tar xvzf $1    ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
	echo "'$1' is not a valid file!"
   fi
 }

 convert_video() {
     # convert_video xxx.mts xxx.avi
     ffmpeg -i $1 -copyts -sameq -target ntsc-dvd $2
 }
 
calc(){ 
	echo "$*" | bc;
}


pacs() {
	local CL='\\e['
	local RS='\\e[0;0m'

	echo -e "$(pacman -Ss "$@" | sed "
		/^core/		s,.*,${CL}1;31m&${RS},
		/^extra/	s,.*,${CL}0;32m&${RS},
		/^community/	s,.*,${CL}1;35m&${RS},
		/^[^[:space:]]/	s,.*,${CL}0;36m&${RS},
	")"
}


alias maxbright='sudo setpci -s 00:02.0 f4.b=ff'
alias backuppacman='comm -23 <(pacman -Qeq|sort) <(pacman -Qgq base base-devel|sort) > ~/backups/pacmanbackup.txt'
alias ssh='ssh -C'
alias acd='/home/daniel/.scripts/acd_fuse/acd'
alias lyrics='~/.scripts/01-from-harddisk.pl'
alias steam='WINEDEBUG=-all wine ~/.wine-steam/drive_c/Program\ Files/Steam/Steam.exe >/dev/null 2>&1 &'
alias steam2='WINEDEBUG=-all wine ~/cdrive/Program\ Files\ \(x86\)/Steam/Steam.exe >/dev/null 2>&1 &'
alias pianobar='pianobar | tee /tmp/pianobar.out'
alias gtdav='cadaver -t https://t-square.gatech.edu/dav/\~66909db1\-217e\-416a\-803d-580608304c20'
alias gtjava='cadaver https://t-square.gatech.edu/dav/XLS0109182343201202.201202'
alias gtdis='cadaver -t https://t-square.gatech.edu/dav/XLS0109183757201202.201202'
alias mplayer2='mplayer -speed 1.21'
alias mplayer='mplayer -softvol -cache 8192 -af scaletempo'

#multirar(){
#	if [[ -f ./new.txt ]] && rm $(pwd)/new.txt
#	touch $(pwd)/new.txt
#	for f in $(find ./ -name '*.rar'); do  
#		if [[ -z $(egrep -i $f exclude.txt) ]] ;then
#			unrar -o- x $f $(dirname $f)
#			if [[ -z $(egrep -i $(dirname $f) exclude.txt) ]] ;then
#				echo $(dirname $f)/$(ls $(dirname $f)|egrep -i "avi|mkv|mp4")>>new.txt
#			fi
#			echo $f >> $(pwd)/exclude.txt
#		fi
#	done
#}
alias multirar="~/github/dotfiles/multirar.sh"
alias alert="notify-send compiled || notify-send error"

alias progress='pv -ptera'
alias alarm="tty=$(tty) at -f $HOME/.scripts/alarm.sh"
alias gvoice="gvoice -e $(grep 'Gmail' ~/.private/passwords.txt |awk '{print $2}') -p $(grep 'Gmail' ~/.private/passwords.txt |awk '{print $3}')"

function alarmoff (){
	echo $1 >> ~/alarm.fifo;
}