#!/bin/bash
#
## ~/.xinitrc
#
## Executed by startx (run your window manager from here)
#urxvtd &
(sleep 300s && dropboxd) &

#syndaemon -t -k -i 1 > /dev/null &
urxvtd -q -f -o
xbindkeys
mpd &
#if [[ $1 == "xterm" ]]
#then
#  conky | while read -r; do xsetroot -name "$REPLY"; done &
#  feh --bg-scale /home/daniel/.bg/zerg.jpg
#  /home/daniel/.screenb
#  xmodmap -e "keycode 108 = Super_L"  # reassign Alt_R to Super_L
#  xmodmap -e "remove mod1 = Super_L"  # make sure X keeps it out of the mod1 group
#fi
case $1 in
 	starcraft)  wine C:\\Program\ Files\\StarCraft\\StarCraft.exe;;
 	warcraft)  wine .wine/drive_c/Program\ Files/Warcraft\ III/war3.exe -opengl;;
 	minecraft)  minecraft;;
	 chrome)  
     	#xrandr --output LVDS1 --primary
     	#xrandr --output LVDS1 --auto
     	chromium;;
	ppub)
		conky &
		ppub books/Inheritance.epub;;

 	*)        
		#conky | while read -r; do xsetroot -name "$REPLY"; done &
		conky &
		#conky -q -c /home/daniel/work/fsk141/dotfiles/Hot/.conkyrc_music& 
		feh --bg-scale /home/daniel/.bg/zerg.jpg
		/home/daniel/.scripts/screenb
		xmodmap -e "keycode 108 = Super_L"  # reassign Alt_R to Super_L
		xmodmap -e "remove mod1 = Super_L"  # make sure X keeps it out of the mod1 group
		while true; do
			# Log stderror to a file 
			dwm 2> ~/.dwm.log
			# No error logging
			#dwm >/dev/null 2>&1
		done;;
esac
