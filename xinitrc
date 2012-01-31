#!/bin/bash
#
## ~/.xinitrc
#
## Executed by startx (run your window manager from here)
#urxvtd &
#(sleep 300s && dropboxd) &

urxvtd -q -f -o
xbindkeys
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
		sleep 1 && conky -c ~/.conky/config.txt&
	 	exec ck-launch-session gnome-session;;
	chrome)  
     	#xrandr --output LVDS1 --primary
     	#xrandr --output LVDS1 --auto
     	chromium;;
	
 	*)        
		conky -c .conky_tmux | while read -r; do xsetroot -name "$REPLY"; done &
		#conky -c .conkyrc&
		sleep 1 && conky -c ~/.conky/config.txt&
		#xset +fp /usr/share/fonts/TTF
		#xset fp rehash
		#conky -q -c /home/daniel/.conkyrc_music& 
		#feh --bg-scale /home/daniel/.bg/zerg.jpg
		sleep 10 && chapod &
		if [[ $? -ne '0' ]]; then
			feh --bg-scale /home/daniel/.bg/zerg.jpg
		fi
		xset s off;xset s noblank;xset -dpms
		xrdb -merge ~/.Xresources
		xcompmgr&
		wmname LG3D
		#/home/daniel/.scripts/screenb
		#xmodmap -e "keycode 108 = Super_L"  # reassign Alt_R to Super_L
		#xmodmap -e "remove mod1 = Super_L"  # make sure X keeps it out of the mod1 group
		while true; do
			# Log stderror to a file 
			dwm 2> ~/.dwm.log
			# No error logging
			#dwm >/dev/null 2>&1
		done;;
esac
