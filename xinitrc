#!/bin/bash
#
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
case $1 in
	gdm)
		exec ck-launch-session gnome-session;;
	i3)
		(sleep 300s && dropboxd) &
		xbindkeys
		sleep 1 && conky -c ~/.conky/config.txt&
		sleep 10 && ~/.scripts/chapod &
		if [[ $? -ne '0' ]]; then
			feh --bg-scale /home/daniel/.bg/zerg.jpg
		fi
		xset s off;xset s noblank;xset -dpms
		xrdb -merge ~/.Xresources
		xcompmgr &
		urxvtd -q -f -o
		exec i3 --enable-32bit-visual > ~/.i3.log 2>&1;;
	chrome)  
     	#xrandr --output LVDS1 --primary
     	#xrandr --output LVDS1 --auto
     	chromium;;
	steam)
		#wine .wine-steam/drive_c/Program\ Files/Steam/Steam.exe -opengl;;
		WINEDEBUG=-all wine ~/.wine/drive_c/Program\ Files/Steam/Steam.exe >~/winelog 2>&1;;
	starcraft)
		WINEDEBUG=-all wine .wine/drive_c/Program\ Files/StarCraft\ II/StarCraft\ II.exe;;
 	*)        
		(sleep 300s && dropboxd) &
		xbindkeys
		conky -c .conky_tmux | while read -r; do xsetroot -name "$REPLY"; done &
		#conky -c .conkyrc&
		sleep 1 && conky -c ~/.conky/config.txt&
		#xset +fp /usr/share/fonts/TTF
		#xset fp rehash
		#conky -q -c /home/daniel/.conkyrc_music& 
		#feh --bg-scale /home/daniel/.bg/zerg.jpg
		sleep 10 && ~/.scripts/chapod &
		if [[ $? -ne '0' ]]; then
			feh --bg-scale /home/daniel/.bg/zerg.jpg
		fi
		xset s off;xset s noblank;xset -dpms
		xrdb -merge ~/.Xresources
		xcompmgr -n&
		urxvtd -q -f -o
		wmname LG3D
		dunst &
		#/home/daniel/.scripts/screenb
		#xmodmap -e "keycode 108 = Super_L"  # reassign Alt_R to Super_L
		#xmodmap -e "remove mod1 = Super_L"  # make sure X keeps it out of the mod1 group
		while true; do
			# Log stderror to a file 
			#exec dbus-launch dwm-start 2>~/.dwm.log
			dwm 2> ~/.dwm.log
			# No error logging
			#dwm >/dev/null 2>&1
		done;;
esac
