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
alias r='sudo sudo pacman -Rns'
alias ls='ls --color=auto'
alias m='mplayer'
alias mb='mplayer -ao alsa:device=btheadset,surround51'
#alias i='sudo sudo pacman -S --noconfirm '
#alias u='sudo sudo pacman -Syu'
alias vga='xrandr --output LVDS1 --off --output VGA1 --mode 1920x1080 --output LVDS1 --primary'
alias eee='xrandr --output LVDS1 --auto --output VGA1 --off'
alias dual='xrandr --output HDMI-1 --left-of DVI-I-1; xrandr --output HDMI-1 --primary'
alias u='sudo pacman -Syu --noconfirm;rm /home/daniel/.private/updates.txt;touch /home/daniel/.private/updates.txt'
alias ureg='sudo pacman -Syu ;rm /home/daniel/.private/updates.txt;touch /home/daniel/.private/updates.txt'
alias i='sudo pacman -Syu && sudo pacman -S --noconfirm '
alias ireg='sudo pacman -Syu && sudo pacman -S '
alias webcam='mplayer -tv driver=v4l2:fps=15:height=288:width=352 tv://'
alias star='xinit starcraft -- :1'
alias war='xinit warcraft -- :1'
alias mine='xinit minecraft -- :1'
alias chrome='xinit chrome -- :2'
alias matlab='matlab -nosplash -nodesktop'
alias halt='sudo halt'
alias la='ls -a'
alias rmpkgs='pacman -Qqdt|sudo pacman -Rns -'
#alias hip='export homeip=`curl -s http://checkip.dyndns.org | sed 's/[^0-9.]//g'`'
alias hip='export homeip="$(curl ifconfig.me)"'
#alias urxvt='`urxvt -e screen &`'
alias vp='vim -u ~/.vimrc-p'
alias snapshot='mplayer tv:// -tv driver=v4l2:width=640:height=480:device=/dev/video0 -fps 15 -vf screenshot'
alias vncserv='x11vnc -display :0 -geometry 1024x600'
alias sss='scrot -ucd4 && eog $(ls -tr | tail -n1)'
alias ompscreen="import png:- | curl -s#F 'file1=<-' http://ompldr.org/upload |sed -n '/url/s/.*url=\([^]]*\)\].*/\1/p'"

pacs() {
	local CL='\\e['
	local RS='\\e[0;0m'

	echo -e "$(sudo pacman -Ss "$@" | sed "
		/^core/		s,.*,${CL}1;31m&${RS},
		/^extra/	s,.*,${CL}0;32m&${RS},
		/^community/	s,.*,${CL}1;35m&${RS},
		/^[^[:space:]]/	s,.*,${CL}0;36m&${RS},
	")"
}


alias maxbright='sudo setpci -s 00:02.0 f4.b=ff'
alias ssh='ssh -C'
alias steam='WINEDEBUG=-all wine ~/.wine-steam/drive_c/Program\ Files/Steam/Steam.exe >/dev/null 2>&1 &'
alias steam2='WINEDEBUG=-all wine ~/cdrive/Program\ Files\ \(x86\)/Steam/Steam.exe >/dev/null 2>&1 &'
alias pianobar='pianobar | tee /tmp/pianobar.out'
alias gtdav='cadaver -t https://tsquare.gatech.edu/dav/\~66909db1\-217e\-416a\-803d-580608304c20'
alias gtjava='cadaver https://t-square.gatech.edu/dav/XLS0109182343201202.201202'
alias gtdis='cadaver -t https://t-square.gatech.edu/dav/XLS0109183757201202.201202'
alias mplayer2='mplayer -speed 1.21'
alias alert="(beep && notify-send compiled)|| (beep && notify-send error)"
alias progress='pv -ptera'
alias alarm="tty=$(tty) at -f $HOME/.scripts/alarm.sh"
alias gvoice="gvoice -e $(grep 'Gmail' ~/.private/passwords.txt |awk '{print $2}') -p $(grep 'Gmail' ~/.private/passwords.txt |awk '{print $3}')"

function alarmoff (){
	echo $1 >> ~/alarm.fifo;
}
alias beep="beep -f 1000 -n -f 2000 -n -f150"
alias checkupdate='$HOME/github/dotfiles/checkupdates'
alias flashfirefox='LD_PRELOAD=$HOME/backup/stuff/flashunlink.so firefox &> /dev/null&disown'
alias surf='surfraw'
alias aurupdate='cower -u --ignore supermeatboy > $HOME/.private/aur.txt'
amazoncloud(){
	user="$(awk '/amazon/ {print $2}' ~/.private/passwords.txt)"
	pass="$(awk '/amazon/ {print $3}' ~/.private/passwords.txt)"
	amazon $1 -o email="$user" -o password="$pass"
}
alias tar='bsdtar'
wikisearch() {
	grep "$1" /usr/share/doc/arch-wiki/html/*
}
alias nyan='telnet miku.acm.uiuc.edu'
wtf(){ for f in $*; nosr -sg \*$f.pc\*|cut -d'/' -f2|sudo pacman -Syu --asdeps --noconfirm - }
playlist() {
	getFileType(){
		file $1|cut -d' ' -f2
	}
	[[ -e testfiles ]] && rm testfiles
	find -type f > filelist
	while read line;do 
		if [[ "$(file $line|cut -d' ' -f2)" == "ASCII" ]];then 
			echo "$line">>testfiles
		fi
	done < filelist
	[[ -e filelist ]] && rm filelist
}
alias dvorak='setxkbmap dvorak'
alias us='setxkbmap us'
alias -g pager='vim -R - "+noremap q <esc>:q!<cr>"'
alias -g reflect="reflector --threads 2 -p http -c 'United States' --sort rate --save /etc/pacman.d/mirrorlist -f5 -a"
alias -g ompload="|curl -sF file1=@- http://ompldr.org/upload|sed -n '/url/s/.*url=\([^]]*\)\].*/\1/p'"
alias sudo="sudo "
alias screens='nvidia-settings --assign CurrentMetaMode="DFP-1: nvidia-auto-select +1080+0, DFP-0: nvidia-auto-select +0+0 {Rotation=right}"'
