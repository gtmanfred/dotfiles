. $HOME/.zshrc
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
	xinit i3 -- :0
	logout
fi
