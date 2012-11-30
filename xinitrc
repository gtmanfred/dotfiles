
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/* ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi
(sleep 300s && dropboxd) &
export PATH="$HOME/.cabal/bin:$PATH:$HOME/bin"
xbindkeys
xcompmgr &
sleep 1 && conky -c ~/.conky/config.txt&
sleep 10 && ~/.scripts/chapod &
#xset +fp /usr/share/fonts/TTF
#xset fp rehash
#xset s off;xset s noblank;xset -dpms
#xrdb ~/.Xresources
udiskie &> /dev/null &
parcellite -d&
numlockx on&

exec xmonad
