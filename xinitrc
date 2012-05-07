#!/bin/bash
## ~/.xinitrc
#
## Executed by startx (run your window manager from here)
#urxvtd &
#mpd &
#if [[ $1 == "xterm" ]]
#then
#  conky | while read -r; do xsetroot -name "$REPLY"; done &
#  feh --bg-scale /home/daniel/.bg/zerg.jpg
#  /home/daniel/.screenb
#  xmodmap -e "keycode 108 = Super_L"  # reassign Alt_R to Super_L
#  xmodmap -e "remove mod1 = Super_L"  # make sure X keeps it out of the mod1 group
#fi

nvidia-settings --assign CurrentMetaMode="HDMI-0: 1920x1080 +0+0 , DVI-I-1: 1920x1200 { Rotation=left}"
xrandr --output DVI-I-1 --auto --rotate left --right-of HDMI-0
case $1 in
    gnome)
         exec ck-launch-session gnome-session;;
	i3)
		(sleep 300s && dropboxd) &
		xbindkeys
        xset +fp /usr/share/fonts/TTF
        xset fp rehash
		sleep 1 && conky -c ~/.conky/config.txt&
		sleep 10 && ~/.scripts/chapod &
		if [[ $? -ne '0' ]]; then
			feh --bg-scale /home/daniel/.bg/zerg.jpg
		fi
		xset s off;xset s noblank;xset -dpms
		xrdb -merge ~/.Xresources
		dunst -fn -misc-fixed-medium-r-normal--13-120-75-75-C-70-iso10646- &
		unclutter -idle 1 -jitter 2 -root &
		numlockx on&
		setxkbmap -option caps:escape
		#xcompmgr &
		urxvtd -q -f -o
		exec i3 --enable-32bit-visual > ~/.i3.log 2>&1;;
	xmonad)
		(sleep 300s && dropboxd) &
		xbindkeys
		sleep 1 && conky -c ~/.conky/config.txt&
		sleep 10 && ~/.scripts/chapod &
		if [[ $? -ne '0' ]]; then
			feh --bg-scale /home/daniel/.bg/zerg.jpg
		fi
		xset s off;xset s noblank;xset -dpms
		urxvtd -q -f -o
		exec ck-launch-session xmonad;;
    minecraft)
        java -jar ~/Downloads/MagicLauncher_0.9.7.jar
        ;;
	chrome)  
     	#xrandr --output LVDS1 --primary
     	#xrandr --output LVDS1 --auto
     	chromium;;
	steam)
		#wine .wine-steam/drive_c/Program\ Files/Steam/Steam.exe -opengl;;
		WINEDEBUG=-all wine ~/.winesteam/drive_c/Program\ Files/Steam/Steam.exe >~/winelog 2>&1;;
	starcraft)
		WINEDEBUG=-all wine ~/.wine/drive_c/Program\ Files/StarCraft\ II/StarCraft\ II.exe;;
	hlwm)
		ck='ck-launch-session dbus-launch --sh-syntax --exit-with-session'
		exec $ck herbstluftwm;;
	vtwm)
		exec vtwm;;
	jwm)
		exec ck-launch-session /usr/bin/jwm;;
	wmfs)
		exec wmfs;;
    dwm)
        dwm;;
 	*)        
			xrdb -merge ~/.Xresources
			(sleep 300s && dropboxd) &
			xbindkeys
			numlockx on&
			conky -c .conky_tmux | while read -r; do xsetroot -name "$REPLY"; done &
#			#conky -c .conkyrc&
#			sleep 1 && conky -c ~/.conky/config.txt&
#			xset +fp /usr/share/fonts/TTF
#			xset fp rehash
#			#conky -q -c /home/daniel/.conkyrc_music& 
#			#feh --bg-scale /home/daniel/.bg/zerg.jpg
#			sleep 10 && ~/.scripts/chapod &
#			if [[ $? -ne '0' ]]; then
#				feh --bg-scale /home/daniel/.bg/zerg.jpg
#			fi
#			xset s off;xset s noblank;xset -dpms
#			#xcompmgr -n&
#			urxvtd -q -f -o
#			wmname LG3D
#			dunst &
#			setxkbmap -option caps:escape
#			#/home/daniel/.scripts/screenb
#			#xmodmap -e "keycode 108 = Super_L"  # reassign Alt_R to Super_L
#			#xmodmap -e "remove mod1 = Super_L"  # make sure X keeps it out of the mod1 group
			while true; do
				# Log stderror to a file 
				#exec dbus-launch dwm-start 2>~/.dwm.log
				dwm 2> ~/.dwm.log&
				# No error logging
				#dwm >/dev/null 2>&1
			done;;
esac
