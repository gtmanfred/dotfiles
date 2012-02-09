. $HOME/.zshrc
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
	xinit dwm -- :0
	logout
fi
