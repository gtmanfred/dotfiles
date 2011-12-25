#!/bin/bash

# Sets up the appropriate symlinks for the config files located here

#ln -s source_file link_name

files=('bashrc' 'bash_profile' 'vimrc'  'Xdefaults' 'xinitrc' 'conkyrc' 'bash_alias' 'tmux.conf' 'dwm' 'xbindkeysrc' 'zshrc' 'zprompt' 'zprofile' 'mutt' 'zlogin' 'zlogout' 'vim' 'zalias')
forced=true

# itarate over all arguments
#for i in "$@"
#do
#	if [ $i = "f" ]; then
#		forced=true
#	fi
#done
#
#for i in "${files[@]}"
#do
#	#if  $forced ; then
#	#	rm ~/.$i
#	#fi
#	cp -r ~/.$i ~/.dotfiles/$i
#done
for i in "${files[@]}"
do
	rm -r ~/.$i
	ln -s ~/.dotfiles/$i ~/.$i
done
