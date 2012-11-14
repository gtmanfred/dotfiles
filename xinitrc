if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/* ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

[[ $1 == "xterm" ]] && caseTest=$2 || caseTest=$1
(sleep 300s && dropboxd) &
xbindkeys
wmname LG3D
conky&
xcompmgr&
#dunst&
feh --bg-scale /home/daniel/.bg/zerg.jpg
/home/daniel/.scripts/screenb
xmodmap -e "keycode 108 = Super_L"  # reassign Alt_R to Super_L
xmodmap -e "remove mod1 = Super_L"  # make sure X keeps it out of the mod1 group
setxkbmap -option caps:escape
xrdb -load ~/.Xresources
while true; do
	${caseTest:-xmonad} 2> ~/.dwm.log
done
;;
